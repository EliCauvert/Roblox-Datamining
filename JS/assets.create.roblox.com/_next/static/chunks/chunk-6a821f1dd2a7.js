;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "28ab4fd3-df49-a734-b88c-8097353e9a67")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 656350, t => {
    "use strict";
    let n, r, a;
    var i, o, s, u, l, c, d, f, p, h, v, m = t.i(92794),
        y = t.i(221628);
    let g = "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : window;

    function b(t) {
        return Number(t)
    }
    let w = t => () => {
        throw Error("BigInt.".concat(t, " is not supported by the BigInt polyfill"))
    };
    b.asIntN = w("asIntN"), b.asUintN = w("asUintN"), g && void 0 === g.BigInt && Object.defineProperty(g, "BigInt", {
        value: b,
        writable: !0,
        configurable: !0
    });
    let x = "change",
        P = ["capture", "once", "signal"],
        T = new WeakMap,
        R = t => {
            if ("function" == typeof t) return t;
            let n = T.get(t);
            if (n) return n;
            let r = n => t.handleEvent(n);
            return T.set(t, r), r
        },
        S = (t, n, r) => {
            n !== x && console.warn("MediaQueryList polyfill: ".concat(t, " ignored '").concat(n, "' event type."));
            let a = "boolean" == typeof r ? r ? ["capture"] : [] : r ? P.filter(t => !!r[t]) : [];
            a.length > 0 && console.warn("MediaQueryList polyfill: ".concat(t, " ignored unsupported option(s) ").concat(a.join(", "), "."))
        };
    (r = (() => {
        if ("function" != typeof window.matchMedia) return;
        let t = window.matchMedia("all"),
            n = "function" == typeof t.addListener;
        if ("function" == typeof t.addEventListener || !n) return;
        let r = Object.getPrototypeOf(t);
        return "object" == typeof r && null !== r && r !== Object.prototype ? r : void 0
    })()) && (Object.defineProperty(r, "addEventListener", {
        value: function(t, n, r) {
            S("addEventListener", t, r), t === x && null != n && this.addListener(R(n))
        },
        writable: !0,
        configurable: !0
    }), Object.defineProperty(r, "removeEventListener", {
        value: function(t, n, r) {
            S("removeEventListener", t, r), t === x && null != n && this.removeListener(R(n))
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
    var E, q, k, A, C, I, j, L, N, O, D, M, _, B, V, U, F, G, K, W, z, H, J, Q, X, $, Z, Y, ee, et, en, er, ea, ei, eo, es, eu, el, ec, ed, ef, ep, eh, ev, em, ey, eg, eb, ew, ex, eP, eT, eR, eS, eE, eq, ek, eA, eC, eI, ej, eL, eN, eO, eD, eM, e_, eB, eV, eU, eF, eG, eK, eW, ez, eH, eJ, eQ, eX, e$, eZ, eY, e0, e1, e2, e4, e3, e6, e8, e5, e9, e7, te, tt, tn, tr, ta, ti, to, ts, tu, tl, tc, td, tf, tp, th, tv, tm, ty, tg, tb, tw, tx, tP, tT, tR, tS, tE, tq, tk, tA, tC, tI, tj, tL, tN, tO, tD, tM, t_, tB, tV, tU, tF, tG, tK, tW, tz, tH, tJ, tQ, tX, t$, tZ, tY, t0, t1, t2, t4, t3, t6, t8, t5, t9, t7, ne, nt, nn, nr, na, ni, no, ns, nu, nl, nc, nd, nf, np, nh, nv, nm, ny, ng, nb, nw, nx, nP, nT, nR, nS, nE, nq, nk, nA, nC, nI, nj, nL, nN, nO, nD, nM, n_, nB, nV, nU, nF, nG, nK, nW, nz, nH, nJ, nQ, nX, n$, nZ, nY, n0, n1, n2, n4, n3, n6, n8, n5, n9, n7, re, rt, rn, rr, ra, ri, ro, rs, ru, rl, rc, rd, rf, rp, rh, rv, rm, ry, rg, rb, rw, rx, rP, rT, rR, rS, rE, rq, rk, rA, rC, rI, rj, rL, rN, rO, rD, rM, r_, rB, rV, rU, rF, rG, rK, rW, rz, rH, rJ, rQ, rX, r$, rZ, rY, r0, r1, r2, r4, r3, r6, r8, r5, r9, r7, ae, at, an, ar, aa, ai, ao, as, au, al, ac, ad, af, ap, ah, av, am = t.i(929036),
        ay = {};

    function ag() {
        if (q) return E;
        q = 1;
        var t = function(t) {
            return t && t.Math === Math && t
        };
        return E = t("object" == typeof globalThis && globalThis) || t(window) || t("object" == typeof self && self) || t("object" == typeof am.c && am.c) || t("object" == typeof E && E) || function() {
            return this
        }() || Function("return this")()
    }
    var ab = {};

    function aw() {
        return A ? k : (A = 1, k = function(t) {
            try {
                return !!t()
            } catch (t) {
                return !0
            }
        })
    }

    function ax() {
        return I ? C : (I = 1, C = !aw()(function() {
            return 7 !== Object.defineProperty({}, 1, {
                get: function() {
                    return 7
                }
            })[1]
        }))
    }

    function aP() {
        return L ? j : (L = 1, j = !aw()(function() {
            var t = (function() {}).bind();
            return "function" != typeof t || t.hasOwnProperty("prototype")
        }))
    }

    function aT() {
        if (O) return N;
        O = 1;
        var t = aP(),
            n = Function.prototype.call;
        return N = t ? n.bind(n) : function() {
            return n.apply(n, arguments)
        }
    }
    var aR = {};

    function aS() {
        return _ ? M : (_ = 1, M = function(t, n) {
            return {
                enumerable: !(1 & t),
                configurable: !(2 & t),
                writable: !(4 & t),
                value: n
            }
        })
    }

    function aE() {
        if (V) return B;
        V = 1;
        var t = aP(),
            n = Function.prototype,
            r = n.call,
            a = t && n.bind.bind(r, r);
        return B = t ? a : function(t) {
            return function() {
                return r.apply(t, arguments)
            }
        }
    }

    function aq() {
        if (F) return U;
        F = 1;
        var t = aE(),
            n = t({}.toString),
            r = t("".slice);
        return U = function(t) {
            return r(n(t), 8, -1)
        }
    }

    function ak() {
        if (K) return G;
        K = 1;
        var t = aE(),
            n = aw(),
            r = aq(),
            a = Object,
            i = t("".split);
        return G = n(function() {
            return !a("z").propertyIsEnumerable(0)
        }) ? function(t) {
            return "String" === r(t) ? i(t, "") : a(t)
        } : a
    }

    function aA() {
        return z ? W : (z = 1, W = function(t) {
            return null == t
        })
    }

    function aC() {
        if (J) return H;
        J = 1;
        var t = aA(),
            n = TypeError;
        return H = function(r) {
            if (t(r)) throw new n("Can't call method on " + r);
            return r
        }
    }

    function aI() {
        if (X) return Q;
        X = 1;
        var t = ak(),
            n = aC();
        return Q = function(r) {
            return t(n(r))
        }
    }

    function aj() {
        if (Z) return $;
        Z = 1;
        var t = "object" == typeof document && document.all;
        return $ = void 0 === t && void 0 !== t ? function(n) {
            return "function" == typeof n || n === t
        } : function(t) {
            return "function" == typeof t
        }
    }

    function aL() {
        if (ee) return Y;
        ee = 1;
        var t = aj();
        return Y = function(n) {
            return "object" == typeof n ? null !== n : t(n)
        }
    }

    function aN() {
        if (en) return et;
        en = 1;
        var t = ag(),
            n = aj();
        return et = function(r, a) {
            var i;
            return arguments.length < 2 ? n(i = t[r]) ? i : void 0 : t[r] && t[r][a]
        }
    }

    function aO() {
        return ea ? er : (ea = 1, er = aE()({}.isPrototypeOf))
    }

    function aD() {
        if (eo) return ei;
        eo = 1;
        var t = ag().navigator,
            n = t && t.userAgent;
        return ei = n ? String(n) : ""
    }

    function aM() {
        if (eu) return es;
        eu = 1;
        var t, n, r = ag(),
            a = aD(),
            i = r.process,
            o = r.Deno,
            s = i && i.versions || o && o.version,
            u = s && s.v8;
        return u && (n = (t = u.split("."))[0] > 0 && t[0] < 4 ? 1 : +(t[0] + t[1])), !n && a && (!(t = a.match(/Edge\/(\d+)/)) || t[1] >= 74) && (t = a.match(/Chrome\/(\d+)/)) && (n = +t[1]), es = n
    }

    function a_() {
        if (ec) return el;
        ec = 1;
        var t = aM(),
            n = aw(),
            r = ag().String;
        return el = !!Object.getOwnPropertySymbols && !n(function() {
            var n = Symbol("symbol detection");
            return !r(n) || !(Object(n) instanceof Symbol) || !Symbol.sham && t && t < 41
        })
    }

    function aB() {
        return ef ? ed : (ef = 1, ed = a_() && !Symbol.sham && "symbol" == typeof Symbol.iterator)
    }

    function aV() {
        if (eh) return ep;
        eh = 1;
        var t = aN(),
            n = aj(),
            r = aO(),
            a = aB(),
            i = Object;
        return ep = a ? function(t) {
            return "symbol" == typeof t
        } : function(a) {
            var o = t("Symbol");
            return n(o) && r(o.prototype, i(a))
        }
    }

    function aU() {
        if (em) return ev;
        em = 1;
        var t = String;
        return ev = function(n) {
            try {
                return t(n)
            } catch (t) {
                return "Object"
            }
        }
    }

    function aF() {
        if (eg) return ey;
        eg = 1;
        var t = aj(),
            n = aU(),
            r = TypeError;
        return ey = function(a) {
            if (t(a)) return a;
            throw new r(n(a) + " is not a function")
        }
    }

    function aG() {
        if (ew) return eb;
        ew = 1;
        var t = aF(),
            n = aA();
        return eb = function(r, a) {
            var i = r[a];
            return n(i) ? void 0 : t(i)
        }
    }
    var aK = {
        exports: {}
    };

    function aW() {
        return eR ? eT : (eR = 1, eT = !1)
    }

    function az() {
        if (eE) return eS;
        eE = 1;
        var t = ag(),
            n = Object.defineProperty;
        return eS = function(r, a) {
            try {
                n(t, r, {
                    value: a,
                    configurable: !0,
                    writable: !0
                })
            } catch (n) {
                t[r] = a
            }
            return a
        }
    }

    function aH() {
        if (eq) return aK.exports;
        eq = 1;
        var t = aW(),
            n = ag(),
            r = az(),
            a = "__core-js_shared__",
            i = aK.exports = n[a] || r(a, {});
        return (i.versions || (i.versions = [])).push({
            version: "3.49.0",
            mode: t ? "pure" : "global",
            copyright: "© 2013–2025 Denis Pushkarev (zloirock.ru), 2025–2026 CoreJS Company (core-js.io). All rights reserved.",
            license: "https://github.com/zloirock/core-js/blob/v3.49.0/LICENSE",
            source: "https://github.com/zloirock/core-js"
        }), aK.exports
    }

    function aJ() {
        if (eA) return ek;
        eA = 1;
        var t = aH();
        return ek = function(n, r) {
            return t[n] || (t[n] = r || {})
        }
    }

    function aQ() {
        if (eI) return eC;
        eI = 1;
        var t = aC(),
            n = Object;
        return eC = function(r) {
            return n(t(r))
        }
    }

    function aX() {
        if (eL) return ej;
        eL = 1;
        var t = aE(),
            n = aQ(),
            r = t({}.hasOwnProperty);
        return ej = Object.hasOwn || function(t, a) {
            return r(n(t), a)
        }
    }

    function a$() {
        if (eO) return eN;
        eO = 1;
        var t = aE(),
            n = 0,
            r = Math.random(),
            a = t(1.1.toString);
        return eN = function(t) {
            return "Symbol(" + (void 0 === t ? "" : t) + ")_" + a(++n + r, 36)
        }
    }

    function aZ() {
        if (eM) return eD;
        eM = 1;
        var t = ag(),
            n = aJ(),
            r = aX(),
            a = a$(),
            i = a_(),
            o = aB(),
            s = t.Symbol,
            u = n("wks"),
            l = o ? s.for || s : s && s.withoutSetter || a;
        return eD = function(t) {
            return r(u, t) || (u[t] = i && r(s, t) ? s[t] : l("Symbol." + t)), u[t]
        }
    }

    function aY() {
        if (eU) return eV;
        eU = 1;
        var t = function() {
                if (eB) return e_;
                eB = 1;
                var t = aT(),
                    n = aL(),
                    r = aV(),
                    a = aG(),
                    i = function() {
                        if (eP) return ex;
                        eP = 1;
                        var t = aT(),
                            n = aj(),
                            r = aL(),
                            a = TypeError;
                        return ex = function(i, o) {
                            var s, u;
                            if ("string" === o && n(s = i.toString) && !r(u = t(s, i)) || n(s = i.valueOf) && !r(u = t(s, i)) || "string" !== o && n(s = i.toString) && !r(u = t(s, i))) return u;
                            throw new a("Can't convert object to primitive value")
                        }
                    }(),
                    o = aZ(),
                    s = TypeError,
                    u = o("toPrimitive");
                return e_ = function(o, l) {
                    if (!n(o) || r(o)) return o;
                    var c, d = a(o, u);
                    if (d) {
                        if (void 0 === l && (l = "default"), !n(c = t(d, o, l)) || r(c)) return c;
                        throw new s("Can't convert object to primitive value")
                    }
                    return void 0 === l && (l = "number"), i(o, l)
                }
            }(),
            n = aV();
        return eV = function(r) {
            var a = t(r, "string");
            return n(a) ? a : a + ""
        }
    }

    function a0() {
        if (eG) return eF;
        eG = 1;
        var t = ag(),
            n = aL(),
            r = t.document,
            a = n(r) && n(r.createElement);
        return eF = function(t) {
            return a ? r.createElement(t) : {}
        }
    }

    function a1() {
        if (eW) return eK;
        eW = 1;
        var t = ax(),
            n = aw(),
            r = a0();
        return eK = !t && !n(function() {
            return 7 !== Object.defineProperty(r("div"), "a", {
                get: function() {
                    return 7
                }
            }).a
        })
    }

    function a2() {
        if (ez) return ab;
        ez = 1;
        var t = ax(),
            n = aT(),
            r = function() {
                if (D) return aR;
                D = 1;
                var t = {}.propertyIsEnumerable,
                    n = Object.getOwnPropertyDescriptor;
                return aR.f = n && !t.call({
                    1: 2
                }, 1) ? function(t) {
                    var r = n(this, t);
                    return !!r && r.enumerable
                } : t, aR
            }(),
            a = aS(),
            i = aI(),
            o = aY(),
            s = aX(),
            u = a1(),
            l = Object.getOwnPropertyDescriptor;
        return ab.f = t ? l : function(t, c) {
            if (t = i(t), c = o(c), u) try {
                return l(t, c)
            } catch (t) {}
            if (s(t, c)) return a(!n(r.f, t, c), t[c])
        }, ab
    }
    var a4 = {};

    function a3() {
        if (eJ) return eH;
        eJ = 1;
        var t = ax(),
            n = aw();
        return eH = t && n(function() {
            return 42 !== Object.defineProperty(function() {}, "prototype", {
                value: 42,
                writable: !1
            }).prototype
        })
    }

    function a6() {
        if (eX) return eQ;
        eX = 1;
        var t = aL(),
            n = String,
            r = TypeError;
        return eQ = function(a) {
            if (t(a)) return a;
            throw new r(n(a) + " is not an object")
        }
    }

    function a8() {
        if (e$) return a4;
        e$ = 1;
        var t = ax(),
            n = a1(),
            r = a3(),
            a = a6(),
            i = aY(),
            o = TypeError,
            s = Object.defineProperty,
            u = Object.getOwnPropertyDescriptor,
            l = "enumerable",
            c = "configurable",
            d = "writable";
        return a4.f = t ? r ? function(t, n, r) {
            if (a(t), n = i(n), a(r), "function" == typeof t && "prototype" === n && "value" in r && d in r && !r[d]) {
                var o = u(t, n);
                o && o[d] && (t[n] = r.value, r = {
                    configurable: c in r ? r[c] : o[c],
                    enumerable: l in r ? r[l] : o[l],
                    writable: !1
                })
            }
            return s(t, n, r)
        } : s : function(t, r, u) {
            if (a(t), r = i(r), a(u), n) try {
                return s(t, r, u)
            } catch (t) {}
            if ("get" in u || "set" in u) throw new o("Accessors not supported");
            return "value" in u && (t[r] = u.value), t
        }, a4
    }

    function a5() {
        if (eY) return eZ;
        eY = 1;
        var t = ax(),
            n = a8(),
            r = aS();
        return eZ = t ? function(t, a, i) {
            return n.f(t, a, r(1, i))
        } : function(t, n, r) {
            return t[n] = r, t
        }
    }
    var a9 = {
        exports: {}
    };

    function a7() {
        if (e1) return e0;
        e1 = 1;
        var t = ax(),
            n = aX(),
            r = Function.prototype,
            a = t && Object.getOwnPropertyDescriptor,
            i = n(r, "name"),
            o = i && (!t || t && a(r, "name").configurable);
        return e0 = {
            EXISTS: i,
            PROPER: i && "something" === (function() {}).name,
            CONFIGURABLE: o
        }
    }

    function ie() {
        if (e4) return e2;
        e4 = 1;
        var t = aE(),
            n = aj(),
            r = aH(),
            a = t(Function.toString);
        return n(r.inspectSource) || (r.inspectSource = function(t) {
            return a(t)
        }), e2 = r.inspectSource
    }

    function it() {
        if (e5) return e8;
        e5 = 1;
        var t = aJ(),
            n = a$(),
            r = t("keys");
        return e8 = function(t) {
            return r[t] || (r[t] = n(t))
        }
    }

    function ir() {
        return e7 ? e9 : (e7 = 1, e9 = {})
    }

    function ia() {
        if (tt) return te;
        tt = 1;
        var t, n, r, a = function() {
                if (e6) return e3;
                e6 = 1;
                var t = ag(),
                    n = aj(),
                    r = t.WeakMap;
                return e3 = n(r) && /native code/.test(String(r))
            }(),
            i = ag(),
            o = aL(),
            s = a5(),
            u = aX(),
            l = aH(),
            c = it(),
            d = ir(),
            f = "Object already initialized",
            p = i.TypeError,
            h = i.WeakMap;
        if (a || l.state) {
            var v = l.state || (l.state = new h);
            v.get = v.get, v.has = v.has, v.set = v.set, t = function(t, n) {
                if (v.has(t)) throw new p(f);
                return n.facade = t, v.set(t, n), n
            }, n = function(t) {
                return v.get(t) || {}
            }, r = function(t) {
                return v.has(t)
            }
        } else {
            var m = c("state");
            d[m] = !0, t = function(t, n) {
                if (u(t, m)) throw new p(f);
                return n.facade = t, s(t, m, n), n
            }, n = function(t) {
                return u(t, m) ? t[m] : {}
            }, r = function(t) {
                return u(t, m)
            }
        }
        return te = {
            set: t,
            get: n,
            has: r,
            enforce: function(a) {
                return r(a) ? n(a) : t(a, {})
            },
            getterFor: function(t) {
                return function(r) {
                    var a;
                    if (!o(r) || (a = n(r)).type !== t) throw new p("Incompatible receiver, " + t + " required");
                    return a
                }
            }
        }
    }

    function ii() {
        if (tn) return a9.exports;
        tn = 1;
        var t = aE(),
            n = aw(),
            r = aj(),
            a = aX(),
            i = ax(),
            o = a7().CONFIGURABLE,
            s = ie(),
            u = ia(),
            l = u.enforce,
            c = u.get,
            d = String,
            f = Object.defineProperty,
            p = t("".slice),
            h = t("".replace),
            v = t([].join),
            m = i && !n(function() {
                return 8 !== f(function() {}, "length", {
                    value: 8
                }).length
            }),
            y = String(String).split("String"),
            g = a9.exports = function(t, n, r) {
                "Symbol(" === p(d(n), 0, 7) && (n = "[" + h(d(n), /^Symbol\(([^)]*)\).*$/, "$1") + "]"), r && r.getter && (n = "get " + n), r && r.setter && (n = "set " + n), (!a(t, "name") || o && t.name !== n) && (i ? f(t, "name", {
                    value: n,
                    configurable: !0
                }) : t.name = n), m && r && a(r, "arity") && t.length !== r.arity && f(t, "length", {
                    value: r.arity
                });
                try {
                    r && a(r, "constructor") && r.constructor ? i && f(t, "prototype", {
                        writable: !1
                    }) : t.prototype && (t.prototype = void 0)
                } catch (t) {}
                var s = l(t);
                return a(s, "source") || (s.source = v(y, "string" == typeof n ? n : "")), t
            };
        return Function.prototype.toString = g(function() {
            return r(this) && c(this).source || s(this)
        }, "toString"), a9.exports
    }

    function io() {
        if (ta) return tr;
        ta = 1;
        var t = aj(),
            n = a8(),
            r = ii(),
            a = az();
        return tr = function(i, o, s, u) {
            u || (u = {});
            var l = u.enumerable,
                c = void 0 !== u.name ? u.name : o;
            if (t(s) && r(s, c, u), u.global) l ? i[o] = s : a(o, s);
            else {
                try {
                    u.unsafe ? i[o] && (l = !0) : delete i[o]
                } catch (t) {}
                l ? i[o] = s : n.f(i, o, {
                    value: s,
                    enumerable: !1,
                    configurable: !u.nonConfigurable,
                    writable: !u.nonWritable
                })
            }
            return i
        }
    }
    var is = {};

    function iu() {
        if (tu) return ts;
        tu = 1;
        var t = function() {
            if (to) return ti;
            to = 1;
            var t = Math.ceil,
                n = Math.floor;
            return ti = Math.trunc || function(r) {
                var a = +r;
                return (a > 0 ? n : t)(a)
            }
        }();
        return ts = function(n) {
            var r = +n;
            return r != r || 0 === r ? 0 : t(r)
        }
    }

    function il() {
        if (tf) return td;
        tf = 1;
        var t = iu(),
            n = Math.min;
        return td = function(r) {
            var a = t(r);
            return a > 0 ? n(a, 0x1fffffffffffff) : 0
        }
    }

    function ic() {
        if (th) return tp;
        th = 1;
        var t = il();
        return tp = function(n) {
            return t(n.length)
        }
    }

    function id() {
        if (tg) return ty;
        tg = 1;
        var t = aE(),
            n = aX(),
            r = aI(),
            a = function() {
                if (tm) return tv;
                tm = 1;
                var t = aI(),
                    n = function() {
                        if (tc) return tl;
                        tc = 1;
                        var t = iu(),
                            n = Math.max,
                            r = Math.min;
                        return tl = function(a, i) {
                            var o = t(a);
                            return o < 0 ? n(o + i, 0) : r(o, i)
                        }
                    }(),
                    r = ic(),
                    a = function(a) {
                        return function(i, o, s) {
                            var u, l = t(i),
                                c = r(l);
                            if (0 === c) return !a && -1;
                            var d = n(s, c);
                            if (a && o != o) {
                                for (; c > d;)
                                    if ((u = l[d++]) != u) return !0
                            } else
                                for (; c > d; d++)
                                    if ((a || d in l) && l[d] === o) return a || d || 0;
                            return !a && -1
                        }
                    };
                return tv = {
                    includes: a(!0),
                    indexOf: a(!1)
                }
            }().indexOf,
            i = ir(),
            o = t([].push);
        return ty = function(t, s) {
            var u, l = r(t),
                c = 0,
                d = [];
            for (u in l) !n(i, u) && n(l, u) && o(d, u);
            for (; s.length > c;) n(l, u = s[c++]) && (~a(d, u) || o(d, u));
            return d
        }
    }

    function ip() {
        return tw ? tb : (tw = 1, tb = ["constructor", "hasOwnProperty", "isPrototypeOf", "propertyIsEnumerable", "toLocaleString", "toString", "valueOf"])
    }

    function ih() {
        if (tx) return is;
        tx = 1;
        var t = id(),
            n = ip().concat("length", "prototype");
        return is.f = Object.getOwnPropertyNames || function(r) {
            return t(r, n)
        }, is
    }
    var iv = {};

    function im() {
        if (tk) return tq;
        tk = 1;
        var t = aw(),
            n = aj(),
            r = /#|\.prototype\./,
            a = function(r, a) {
                var l = o[i(r)];
                return l === u || l !== s && (n(a) ? t(a) : !!a)
            },
            i = a.normalize = function(t) {
                return String(t).replace(r, ".").toLowerCase()
            },
            o = a.data = {},
            s = a.NATIVE = "N",
            u = a.POLYFILL = "P";
        return tq = a
    }

    function iy() {
        if (tC) return tA;
        tC = 1;
        var t = ag(),
            n = a2().f,
            r = a5(),
            a = io(),
            i = az(),
            o = function() {
                if (tE) return tS;
                tE = 1;
                var t = aX(),
                    n = function() {
                        if (tR) return tT;
                        tR = 1;
                        var t = aN(),
                            n = aE(),
                            r = ih(),
                            a = (tP || (tP = 1, iv.f = Object.getOwnPropertySymbols), iv),
                            i = a6(),
                            o = n([].concat);
                        return tT = t("Reflect", "ownKeys") || function(t) {
                            var n = r.f(i(t)),
                                s = a.f;
                            return s ? o(n, s(t)) : n
                        }
                    }(),
                    r = a2(),
                    a = a8();
                return tS = function(i, o, s) {
                    for (var u = n(o), l = a.f, c = r.f, d = 0; d < u.length; d++) {
                        var f = u[d];
                        t(i, f) || s && t(s, f) || l(i, f, c(o, f))
                    }
                }
            }(),
            s = im();
        return tA = function(u, l) {
            var c, d, f, p, h, v = u.target,
                m = u.global,
                y = u.stat;
            if (c = m ? t : y ? t[v] || i(v, {}) : t[v] && t[v].prototype)
                for (d in l) {
                    if (p = l[d], f = u.dontCallGetSet ? (h = n(c, d)) && h.value : c[d], !s(m ? d : v + (y ? "." : "#") + d, u.forced) && void 0 !== f) {
                        if (typeof p == typeof f) continue;
                        o(p, f)
                    }(u.sham || f && f.sham) && r(p, "sham", !0), a(c, d, p, u)
                }
        }
    }

    function ig() {
        if (tj) return tI;
        tj = 1;
        var t = aZ()("toStringTag"),
            n = {};
        return n[t] = "z", tI = "[object z]" === String(n)
    }

    function ib() {
        if (tN) return tL;
        tN = 1;
        var t = ig(),
            n = aj(),
            r = aq(),
            a = aZ()("toStringTag"),
            i = Object,
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
            return void 0 === t ? "Undefined" : null === t ? "Null" : "string" == typeof(l = s(u = i(t), a)) ? l : o ? r(u) : "Object" === (c = r(u)) && n(u.callee) ? "Arguments" : c
        }
    }

    function iw() {
        if (tD) return tO;
        tD = 1;
        var t = ib(),
            n = String;
        return tO = function(r) {
            if ("Symbol" === t(r)) throw TypeError("Cannot convert a Symbol value to a string");
            return n(r)
        }
    }

    function ix() {
        if (t_) return tM;
        t_ = 1;
        var t = a6();
        return tM = function() {
            var n = t(this),
                r = "";
            return n.hasIndices && (r += "d"), n.global && (r += "g"), n.ignoreCase && (r += "i"), n.multiline && (r += "m"), n.dotAll && (r += "s"), n.unicode && (r += "u"), n.unicodeSets && (r += "v"), n.sticky && (r += "y"), r
        }
    }
    var iP = {};

    function iT() {
        if (tF) return tU;
        tF = 1;
        var t = id(),
            n = ip();
        return tU = Object.keys || function(r) {
            return t(r, n)
        }
    }

    function iR() {
        if (tH) return tz;
        tH = 1;
        var t, n = a6(),
            r = function() {
                if (tG) return iP;
                tG = 1;
                var t = ax(),
                    n = a3(),
                    r = a8(),
                    a = a6(),
                    i = aI(),
                    o = iT();
                return iP.f = t && !n ? Object.defineProperties : function(t, n) {
                    a(t);
                    for (var s, u = i(n), l = o(n), c = l.length, d = 0; c > d;) r.f(t, s = l[d++], u[s]);
                    return t
                }, iP
            }(),
            a = ip(),
            i = ir(),
            o = tW ? tK : (tW = 1, tK = aN()("document", "documentElement")),
            s = a0(),
            u = it(),
            l = "prototype",
            c = "script",
            d = u("IE_PROTO"),
            f = function() {},
            p = function(t) {
                return "<" + c + ">" + t + "</" + c + ">"
            },
            h = function(t) {
                t.write(p("")), t.close();
                var n = t.parentWindow.Object;
                return t = null, n
            },
            v = function() {
                var t, n = s("iframe");
                return n.style.display = "none", o.appendChild(n), n.src = String("java" + c + ":"), (t = n.contentWindow.document).open(), t.write(p("document.F=Object")), t.close(), t.F
            },
            m = function() {
                try {
                    t = new ActiveXObject("htmlfile")
                } catch (t) {}
                m = "u" > typeof document ? document.domain && t ? h(t) : v() : h(t);
                for (var n = a.length; n--;) delete m[l][a[n]];
                return m()
            };
        return i[d] = !0, tz = Object.create || function(t, a) {
            var i;
            return null !== t ? (f[l] = n(t), i = new f, f[l] = null, i[d] = t) : i = m(), void 0 === a ? i : r.f(i, a)
        }
    }

    function iS() {
        if (tY) return tZ;
        tY = 1;
        var t, n, r = aT(),
            a = aE(),
            i = iw(),
            o = ix(),
            s = function() {
                if (tV) return tB;
                tV = 1;
                var t = aw(),
                    n = ag().RegExp,
                    r = t(function() {
                        var t = n("a", "y");
                        return t.lastIndex = 2, null !== t.exec("abcd")
                    }),
                    a = r || t(function() {
                        return !n("a", "y").sticky
                    });
                return tB = {
                    BROKEN_CARET: r || t(function() {
                        var t = n("^r", "gy");
                        return t.lastIndex = 2, null !== t.exec("str")
                    }),
                    MISSED_STICKY: a,
                    UNSUPPORTED_Y: r
                }
            }(),
            u = aJ(),
            l = iR(),
            c = ia().get,
            d = function() {
                if (tQ) return tJ;
                tQ = 1;
                var t = aw(),
                    n = ag().RegExp;
                return tJ = t(function() {
                    var t = n(".", "s");
                    return !(t.dotAll && t.test("\n") && "s" === t.flags)
                })
            }(),
            f = function() {
                if (t$) return tX;
                t$ = 1;
                var t = aw(),
                    n = ag().RegExp;
                return tX = t(function() {
                    var t = n("(?<a>b)", "g");
                    return "b" !== t.exec("b").groups.a || "bc" !== "b".replace(t, "$<a>c")
                })
            }(),
            p = u("native-string-replace", String.prototype.replace),
            h = RegExp.prototype.exec,
            v = h,
            m = a("".charAt),
            y = a("".indexOf),
            g = a("".replace),
            b = a("".slice),
            w = (n = /b*/g, r(h, t = /a/, "a"), r(h, n, "a"), 0 !== t.lastIndex || 0 !== n.lastIndex),
            x = s.BROKEN_CARET,
            P = void 0 !== /()??/.exec("")[1],
            T = function(t, n) {
                for (var r = t.groups = l(null), a = 0; a < n.length; a++) {
                    var i = n[a];
                    r[i[0]] = t[i[1]]
                }
            };
        return (w || P || x || d || f) && (v = function(t) {
            var n, a, s, u = c(this),
                l = i(t),
                d = u.raw;
            if (d) return d.lastIndex = this.lastIndex, n = r(v, d, l), this.lastIndex = d.lastIndex, n && u.groups && T(n, u.groups), n;
            var f = u.groups,
                R = x && this.sticky,
                S = r(o, this),
                E = this.source,
                q = 0,
                k = l;
            if (R) {
                -1 === y(S = g(S, "y", ""), "g") && (S += "g"), k = b(l, this.lastIndex);
                var A = this.lastIndex > 0 && m(l, this.lastIndex - 1);
                this.lastIndex > 0 && (!this.multiline || this.multiline && "\n" !== A && "\r" !== A && "\u2028" !== A && "\u2029" !== A) && (E = "(?: (?:" + E + "))", k = " " + k, q++), a = RegExp("^(?:" + E + ")", S)
            }
            P && (a = RegExp("^" + E + "$(?!\\s)", S)), w && (s = this.lastIndex);
            var C = r(h, R ? a : this, k);
            return R ? C ? (C.input = l, C[0] = b(C[0], q), C.index = this.lastIndex, this.lastIndex += C[0].length) : this.lastIndex = 0 : w && C && (this.lastIndex = this.global ? C.index + C[0].length : s), P && C && C.length > 1 && r(p, C[0], a, function() {
                for (var t = 1; t < arguments.length - 2; t++) void 0 === arguments[t] && (C[t] = void 0)
            }), C && f && T(C, f), C
        }), tZ = v
    }

    function iE() {
        if (t0) return ay;
        t0 = 1;
        var t = iy(),
            n = iS();
        return t({
            target: "RegExp",
            proto: !0,
            forced: /./.exec !== n
        }, {
            exec: n
        }), ay
    }

    function iq() {
        if (ne) return t7;
        ne = 1;
        var t = aE(),
            n = aQ(),
            r = Math.floor,
            a = t("".charAt),
            i = t("".replace),
            o = t("".slice),
            s = /\$([$&'`]|\d{1,2}|<[^>]*>)/g,
            u = /\$([$&'`]|\d{1,2})/g;
        return t7 = function(t, l, c, d, f, p) {
            var h = c + t.length,
                v = d.length,
                m = u;
            return void 0 !== f && (f = n(f), m = s), i(p, m, function(n, i) {
                var s;
                switch (a(i, 0)) {
                    case "$":
                        return "$";
                    case "&":
                        return t;
                    case "`":
                        return o(l, 0, c);
                    case "'":
                        return o(l, h);
                    case "<":
                        s = f[o(i, 1, -1)];
                        break;
                    default:
                        var u = +i;
                        if (0 === u) return n;
                        if (u > v) {
                            var p = r(u / 10);
                            if (0 === p) return n;
                            if (p <= v) return void 0 === d[p - 1] ? a(i, 1) : d[p - 1] + a(i, 1);
                            return n
                        }
                        s = d[u - 1]
                }
                return void 0 === s ? "" : s
            })
        }
    }

    function ik() {
        if (na) return nr;
        na = 1;
        var t = aT(),
            n = aX(),
            r = aO(),
            a = function() {
                if (nn) return nt;
                nn = 1;
                var t = ag(),
                    n = aw(),
                    r = t.RegExp;
                return nt = {
                    correct: !n(function() {
                        var t = !0;
                        try {
                            r(".", "d")
                        } catch (n) {
                            t = !1
                        }
                        var n = {},
                            a = "",
                            i = t ? "dgimsy" : "gimsy",
                            o = function(t, r) {
                                Object.defineProperty(n, t, {
                                    get: function() {
                                        return a += r, !0
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
                        return Object.getOwnPropertyDescriptor(r.prototype, "flags").get.call(n) !== i || a !== i
                    })
                }
            }(),
            i = ix(),
            o = RegExp.prototype;
        return nr = a.correct ? function(t) {
            return t.flags
        } : function(s) {
            return !a.correct && r(o, s) && !n(s, "flags") ? t(i, s) : s.flags
        }
    }

    function iA() {
        if (nf) return nd;
        nf = 1;
        var t = ag(),
            n = aE();
        return nd = function(r, a) {
            return n(t[r].prototype[a])
        }
    }

    function iC() {
        if (nv) return nh;
        nv = 1;
        var t = aZ(),
            n = iR(),
            r = a8().f,
            a = t("unscopables"),
            i = Array.prototype;
        return void 0 === i[a] && r(i, a, {
            configurable: !0,
            value: n(null)
        }), nh = function(t) {
            i[a][t] = !0
        }
    }

    function iI() {
        if (nT) return nP;
        nT = 1;
        var t = function() {
                if (nx) return nw;
                nx = 1;
                var t = aq(),
                    n = aE();
                return nw = function(r) {
                    if ("Function" === t(r)) return n(r)
                }
            }(),
            n = aF(),
            r = aP(),
            a = t(t.bind);
        return nP = function(t, i) {
            return n(t), void 0 === i ? t : r ? a(t, i) : function() {
                return t.apply(i, arguments)
            }
        }
    }

    function ij() {
        if (nS) return nR;
        nS = 1;
        var t = iI(),
            n = ak(),
            r = aQ(),
            a = ic(),
            i = function(i) {
                var o = 1 === i;
                return function(s, u, l) {
                    for (var c, d = r(s), f = n(d), p = a(f), h = t(u, l); p-- > 0;)
                        if (h(c = f[p], p, d)) switch (i) {
                            case 0:
                                return c;
                            case 1:
                                return p
                        }
                    return o ? -1 : void 0
                }
            };
        return nR = {
            findLast: i(0),
            findLastIndex: i(1)
        }
    }

    function iL() {
        if (nj) return nI;
        nj = 1;
        var t = ax(),
            n = a8(),
            r = aS();
        return nI = function(a, i, o) {
            t ? n.f(a, i, r(0, o)) : a[i] = o
        }
    }

    function iN() {
        return nN ? nL : (nN = 1, nL = {})
    }

    function iO() {
        if (n_) return nM;
        n_ = 1;
        var t = ib(),
            n = aG(),
            r = aA(),
            a = iN(),
            i = aZ()("iterator");
        return nM = function(o) {
            if (!r(o)) return n(o, i) || n(o, "@@iterator") || a[t(o)]
        }
    }

    function iD() {
        if (nK) return nG;
        nK = 1;
        var t = iI(),
            n = aT(),
            r = a6(),
            a = aU(),
            i = function() {
                if (nD) return nO;
                nD = 1;
                var t = aZ(),
                    n = iN(),
                    r = t("iterator"),
                    a = Array.prototype;
                return nO = function(t) {
                    return void 0 !== t && (n.Array === t || a[r] === t)
                }
            }(),
            o = ic(),
            s = aO(),
            u = function() {
                if (nV) return nB;
                nV = 1;
                var t = aT(),
                    n = aF(),
                    r = a6(),
                    a = aU(),
                    i = iO(),
                    o = TypeError;
                return nB = function(s, u) {
                    var l = arguments.length < 2 ? i(s) : u;
                    if (n(l)) return r(t(l, s));
                    throw new o(a(s) + " is not iterable")
                }
            }(),
            l = iO(),
            c = function() {
                if (nF) return nU;
                nF = 1;
                var t = aT(),
                    n = a6(),
                    r = aG();
                return nU = function(a, i, o) {
                    var s, u;
                    n(a);
                    try {
                        if (!(s = r(a, "return"))) {
                            if ("throw" === i) throw o;
                            return o
                        }
                        s = t(s, a)
                    } catch (t) {
                        u = !0, s = t
                    }
                    if ("throw" === i) throw o;
                    if (u) throw s;
                    return n(s), o
                }
            }(),
            d = TypeError,
            f = function(t, n) {
                this.stopped = t, this.result = n
            },
            p = f.prototype;
        return nG = function(h, v, m) {
            var y, g, b, w, x, P, T, R = m && m.that,
                S = !!(m && m.AS_ENTRIES),
                E = !!(m && m.IS_RECORD),
                q = !!(m && m.IS_ITERATOR),
                k = !!(m && m.INTERRUPTED),
                A = t(v, R),
                C = function(t) {
                    var n = y;
                    return y = void 0, n && c(n, "normal"), new f(!0, t)
                },
                I = function(t) {
                    return S ? (r(t), k ? A(t[0], t[1], C) : A(t[0], t[1])) : k ? A(t, C) : A(t)
                };
            if (E) y = h.iterator;
            else if (q) y = h;
            else {
                if (!(g = l(h))) throw new d(a(h) + " is not iterable");
                if (i(g)) {
                    for (b = 0, w = o(h); w > b; b++)
                        if ((x = I(h[b])) && s(p, x)) return x;
                    return new f(!1)
                }
                y = u(h, g)
            }
            for (P = E ? h.next : y.next; !(T = n(P, y)).done;) {
                var j = T.value;
                try {
                    x = I(j)
                } catch (t) {
                    if (y) c(y, "throw", t);
                    else throw t
                }
                if ("object" == typeof x && x && s(p, x)) return x
            }
            return new f(!1)
        }
    }

    function iM() {
        return nH ? nz : (nH = 1, nz = ag())
    }

    function i_() {
        if (nX) return nQ;
        nX = 1;
        var t = iw();
        return nQ = function(n, r) {
            return void 0 === n ? arguments.length < 2 ? "" : r : t(n)
        }
    }

    function iB() {
        if (nZ) return n$;
        nZ = 1;
        var t = ax(),
            n = aw(),
            r = a6(),
            a = i_(),
            i = Error.prototype.toString;
        return n$ = n(function() {
            if (t) {
                var n = Object.create(Object.defineProperty({}, "name", {
                    get: function() {
                        return this === n
                    }
                }));
                if ("true" !== i.call(n)) return !0
            }
            return "2: 1" !== i.call({
                message: 1,
                name: 2
            }) || "Error" !== i.call({})
        }) ? function() {
            var t = r(this),
                n = a(t.name, "Error"),
                i = a(t.message);
            return n ? i ? n + ": " + i : n : i
        } : i
    }

    function iV() {
        if (n4) return n2;
        n4 = 1;
        var t = aX(),
            n = aj(),
            r = aQ(),
            a = it(),
            i = n1 ? n0 : (n1 = 1, n0 = !aw()(function() {
                function t() {}
                return t.prototype.constructor = null, Object.getPrototypeOf(new t) !== t.prototype
            })),
            o = a("IE_PROTO"),
            s = Object,
            u = s.prototype;
        return n2 = i ? s.getPrototypeOf : function(a) {
            var i = r(a);
            if (t(i, o)) return i[o];
            var l = i.constructor;
            return n(l) && i instanceof l ? l.prototype : i instanceof s ? u : null
        }
    }

    function iU() {
        if (n6) return n3;
        n6 = 1;
        var t, n, r, a = aw(),
            i = aj(),
            o = aL(),
            s = iR(),
            u = iV(),
            l = io(),
            c = aZ(),
            d = aW(),
            f = c("iterator"),
            p = !1;
        return [].keys && ("next" in (r = [].keys()) ? (n = u(u(r))) !== Object.prototype && (t = n) : p = !0), !o(t) || a(function() {
            var n = {};
            return t[f].call(n) !== n
        }) ? t = {} : d && (t = s(t)), i(t[f]) || l(t, f, function() {
            return this
        }), n3 = {
            IteratorPrototype: t,
            BUGGY_SAFARI_ITERATORS: p
        }
    }

    function iF() {
        if (n5) return n8;
        n5 = 1;
        var t = a8().f,
            n = aX(),
            r = aZ()("toStringTag");
        return n8 = function(a, i, o) {
            a && !o && (a = a.prototype), a && !n(a, r) && t(a, r, {
                configurable: !0,
                value: i
            })
        }
    }

    function iG() {
        if (rs) return ro;
        rs = 1;
        var t = function() {
                if (rt) return re;
                rt = 1;
                var t = aE(),
                    n = aF();
                return re = function(r, a, i) {
                    try {
                        return t(n(Object.getOwnPropertyDescriptor(r, a)[i]))
                    } catch (t) {}
                }
            }(),
            n = aL(),
            r = aC(),
            a = function() {
                if (ri) return ra;
                ri = 1;
                var t = function() {
                        if (rr) return rn;
                        rr = 1;
                        var t = aL();
                        return rn = function(n) {
                            return t(n) || null === n
                        }
                    }(),
                    n = String,
                    r = TypeError;
                return ra = function(a) {
                    if (t(a)) return a;
                    throw new r("Can't set " + n(a) + " as a prototype")
                }
            }();
        return ro = Object.setPrototypeOf || ("__proto__" in {} ? function() {
            var i, o = !1,
                s = {};
            try {
                (i = t(Object.prototype, "__proto__", "set"))(s, []), o = s instanceof Array
            } catch (t) {}
            return function(t, s) {
                return r(t), a(s), n(t) && (o ? i(t, s) : t.__proto__ = s), t
            }
        }() : void 0)
    }

    function iK() {
        if (rl) return ru;
        rl = 1;
        var t = iy(),
            n = aT(),
            r = aW(),
            a = a7(),
            i = aj(),
            o = function() {
                if (n7) return n9;
                n7 = 1;
                var t = iU().IteratorPrototype,
                    n = iR(),
                    r = aS(),
                    a = iF(),
                    i = iN(),
                    o = function() {
                        return this
                    };
                return n9 = function(s, u, l, c) {
                    var d = u + " Iterator";
                    return s.prototype = n(t, {
                        next: r(+!c, l)
                    }), a(s, d, !1, !0), i[d] = o, s
                }
            }(),
            s = iV(),
            u = iG(),
            l = iF(),
            c = a5(),
            d = io(),
            f = aZ(),
            p = iN(),
            h = iU(),
            v = a.PROPER,
            m = a.CONFIGURABLE,
            y = h.IteratorPrototype,
            g = h.BUGGY_SAFARI_ITERATORS,
            b = f("iterator"),
            w = "keys",
            x = "values",
            P = "entries",
            T = function() {
                return this
            };
        return ru = function(a, f, h, R, S, E, q) {
            o(h, f, R);
            var k, A, C, I = function(t) {
                    if (t === S && D) return D;
                    if (!g && t && t in N) return N[t];
                    switch (t) {
                        case w:
                        case x:
                        case P:
                            return function() {
                                return new h(this, t)
                            }
                    }
                    return function() {
                        return new h(this)
                    }
                },
                j = f + " Iterator",
                L = !1,
                N = a.prototype,
                O = N[b] || N["@@iterator"] || S && N[S],
                D = !g && O || I(S),
                M = "Array" === f && N.entries || O;
            if (M && (k = s(M.call(new a))) !== Object.prototype && k.next && (!r && s(k) !== y && (u ? u(k, y) : i(k[b]) || d(k, b, T)), l(k, j, !0, !0), r && (p[j] = T)), v && S === x && O && O.name !== x && (!r && m ? c(N, "name", x) : (L = !0, D = function() {
                    return n(O, this)
                })), S)
                if (A = {
                        values: I(x),
                        keys: E ? D : I(w),
                        entries: I(P)
                    }, q)
                    for (C in A) !g && !L && C in N || d(N, C, A[C]);
                else t({
                    target: f,
                    proto: !0,
                    forced: g || L
                }, A);
            return (!r || q) && N[b] !== D && d(N, b, D, {
                name: S
            }), p[f] = D, A
        }
    }

    function iW() {
        return rd ? rc : (rd = 1, rc = function(t, n) {
            return {
                value: t,
                done: n
            }
        })
    }
    np || (np = 1, iE(), function() {
        if (!ns) {
            ns = 1;
            var t = function() {
                    if (t2) return t1;
                    t2 = 1;
                    var t = aP(),
                        n = Function.prototype,
                        r = n.apply,
                        a = n.call;
                    return t1 = "object" == typeof Reflect && Reflect.apply || (t ? a.bind(r) : function() {
                        return a.apply(r, arguments)
                    })
                }(),
                n = aT(),
                r = aE(),
                a = function() {
                    if (t3) return t4;
                    t3 = 1, iE();
                    var t = aT(),
                        n = io(),
                        r = iS(),
                        a = aw(),
                        i = aZ(),
                        o = a5(),
                        s = i("species"),
                        u = RegExp.prototype;
                    return t4 = function(l, c, d, f) {
                        var p = i(l),
                            h = !a(function() {
                                var t = {};
                                return t[p] = function() {
                                    return 7
                                }, 7 !== "" [l](t)
                            }),
                            v = h && !a(function() {
                                var t = !1,
                                    n = /a/;
                                if ("split" === l) {
                                    var r = {};
                                    r[s] = function() {
                                        return n
                                    }, (n = {
                                        constructor: r,
                                        flags: ""
                                    })[p] = /./ [p]
                                }
                                return n.exec = function() {
                                    return t = !0, null
                                }, n[p](""), !t
                            });
                        if (!h || !v || d) {
                            var m = /./ [p],
                                y = c(p, "" [l], function(n, a, i, o, s) {
                                    var l = a.exec;
                                    return l === r || l === u.exec ? h && !s ? {
                                        done: !0,
                                        value: t(m, a, i, o)
                                    } : {
                                        done: !0,
                                        value: t(n, i, a, o)
                                    } : {
                                        done: !1
                                    }
                                });
                            n(String.prototype, l, y[0]), n(u, p, y[1])
                        }
                        f && o(u[p], "sham", !0)
                    }
                }(),
                i = aw(),
                o = a6(),
                s = aj(),
                u = aL(),
                l = iu(),
                c = il(),
                d = iw(),
                f = aC(),
                p = function() {
                    if (t9) return t5;
                    t9 = 1;
                    var t = function() {
                        if (t8) return t6;
                        t8 = 1;
                        var t = aE(),
                            n = iu(),
                            r = iw(),
                            a = aC(),
                            i = t("".charAt),
                            o = t("".charCodeAt),
                            s = t("".slice),
                            u = function(t) {
                                return function(u, l) {
                                    var c, d, f = r(a(u)),
                                        p = n(l),
                                        h = f.length;
                                    return p < 0 || p >= h ? t ? "" : void 0 : (c = o(f, p)) < 55296 || c > 56319 || p + 1 === h || (d = o(f, p + 1)) < 56320 || d > 57343 ? t ? i(f, p) : c : t ? s(f, p, p + 2) : (c - 55296 << 10) + (d - 56320) + 65536
                                }
                            };
                        return t6 = {
                            codeAt: u(!1),
                            charAt: u(!0)
                        }
                    }().charAt;
                    return t5 = function(n, r, a) {
                        return r + (a && t(n, r).length || 1)
                    }
                }(),
                h = aG(),
                v = iq(),
                m = ik(),
                y = function() {
                    if (no) return ni;
                    no = 1;
                    var t = aT(),
                        n = a6(),
                        r = aj(),
                        a = aq(),
                        i = iS(),
                        o = TypeError;
                    return ni = function(s, u) {
                        var l = s.exec;
                        if (r(l)) {
                            var c = t(l, s, u);
                            return null !== c && n(c), c
                        }
                        if ("RegExp" === a(s)) return t(i, s, u);
                        throw new o("RegExp#exec called on incompatible receiver")
                    }
                }(),
                g = aZ()("replace"),
                b = Math.max,
                w = Math.min,
                x = r([].concat),
                P = r([].push),
                T = r("".indexOf),
                R = r("".slice),
                S = "$0" === "a".replace(/./, "$0"),
                E = !!/./ [g] && "" === /./ [g]("a", "$0");
            a("replace", function(r, a, i) {
                var S = E ? "$" : "$0";
                return [function(t, r) {
                    var i = f(this),
                        o = u(t) ? h(t, g) : void 0;
                    return o ? n(o, t, i, r) : n(a, d(i), t, r)
                }, function(n, r) {
                    var u = o(this),
                        f = d(n),
                        h = s(r);
                    h || (r = d(r));
                    var g = d(m(u));
                    if ("string" == typeof r && !~T(r, S) && !~T(r, "$<") && !~T(g, "y")) {
                        var E = i(a, u, f, r);
                        if (E.done) return E.value
                    }
                    var q = !!~T(g, "g");
                    q && (L = !!~T(g, "u") || !!~T(g, "v"), u.lastIndex = 0);
                    for (var k = []; null !== (O = y(u, f)) && (P(k, O), q);) "" === d(O[0]) && (u.lastIndex = p(f, c(u.lastIndex), L));
                    for (var A = "", C = 0, I = 0; I < k.length; I++) {
                        for (var j, L, N, O = k[I], D = d(O[0]), M = b(w(l(O.index), f.length), 0), _ = [], B = 1; B < O.length; B++) P(_, void 0 === (j = O[B]) ? j : String(j));
                        var V = O.groups;
                        if (h) {
                            var U = x([D], _, M, f);
                            void 0 !== V && P(U, V), N = d(t(r, void 0, U))
                        } else N = v(D, f, M, _, V, r);
                        M >= C && (A += R(f, C, M) + N, C = M + D.length)
                    }
                    return A + R(f, C)
                }]
            }, !!i(function() {
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
        if (!nc) {
            nc = 1;
            var t = iy(),
                n = aT(),
                r = aE(),
                a = aC(),
                i = aj(),
                o = aL(),
                s = function() {
                    if (nl) return nu;
                    nl = 1;
                    var t = aL(),
                        n = aq(),
                        r = aZ()("match");
                    return nu = function(a) {
                        var i;
                        return t(a) && (void 0 !== (i = a[r]) ? !!i : "RegExp" === n(a))
                    }
                }(),
                u = iw(),
                l = aG(),
                c = ik(),
                d = iq(),
                f = aZ(),
                p = aW(),
                h = f("replace"),
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
                    var f, w, x, P, T, R, S, E, q, k = a(this),
                        A = 0,
                        C = "";
                    if (o(t)) {
                        if ((f = s(t)) && !~m(u(a(c(t))), "g")) throw new v("`.replaceAll` does not allow non-global regexes");
                        if (w = l(t, h)) return n(w, t, k, r);
                        if (p && f) return y(u(k), t, r)
                    }
                    for (x = u(k), P = u(t), (T = i(r)) || (r = u(r)), S = b(1, R = P.length), E = m(x, P); - 1 !== E;) q = T ? u(r(P, E, x)) : d(P, x, E, [], void 0, r), C += g(x, A, E) + q, A = E + R, E = E + S > x.length ? -1 : m(x, P, E + S);
                    return A < x.length && (C += g(x, A)), C
                }
            })
        }
    }(), iA()("String", "replaceAll")), ny || (ny = 1, function() {
        if (!nm) {
            nm = 1;
            var t = iy(),
                n = aQ(),
                r = ic(),
                a = iu(),
                i = iC();
            t({
                target: "Array",
                proto: !0
            }, {
                at: function(t) {
                    var i = n(this),
                        o = r(i),
                        s = a(t),
                        u = s >= 0 ? s : o + s;
                    return u < 0 || u >= o ? void 0 : i[u]
                }
            }), i("at")
        }
    }(), iA()("Array", "at")), nb || (nb = 1, function() {
        if (!ng) {
            ng = 1;
            var t = iy(),
                n = aE(),
                r = aC(),
                a = iu(),
                i = iw(),
                o = aw(),
                s = n("".charAt);
            t({
                target: "String",
                proto: !0,
                forced: o(function() {
                    return "\uD842" !== "𠮷".at(-2)
                })
            }, {
                at: function(t) {
                    var n = i(r(this)),
                        o = n.length,
                        u = a(t),
                        l = u >= 0 ? u : o + u;
                    return l < 0 || l >= o ? void 0 : s(n, l)
                }
            })
        }
    }(), iA()("String", "at")), nq || (nq = 1, function() {
        if (!nE) {
            nE = 1;
            var t = iy(),
                n = ij().findLast,
                r = iC();
            t({
                target: "Array",
                proto: !0
            }, {
                findLast: function(t) {
                    return n(this, t, arguments.length > 1 ? arguments[1] : void 0)
                }
            }), r("findLast")
        }
    }(), iA()("Array", "findLast")), nA || (nA = 1, function() {
        if (!nk) {
            nk = 1;
            var t = iy(),
                n = ij().findLastIndex,
                r = iC();
            t({
                target: "Array",
                proto: !0
            }, {
                findLastIndex: function(t) {
                    return n(this, t, arguments.length > 1 ? arguments[1] : void 0)
                }
            }), r("findLastIndex")
        }
    }(), iA()("Array", "findLastIndex")), nJ || (nJ = 1, nC || (nC = 1, iy()({
        target: "Object",
        stat: !0,
        sham: !ax()
    }, {
        create: iR()
    })), function() {
        if (!nW) {
            nW = 1;
            var t = iy(),
                n = iL(),
                r = aN(),
                a = aE(),
                i = aF(),
                o = aC(),
                s = aY(),
                u = iD(),
                l = aw(),
                c = Object.groupBy,
                d = r("Object", "create"),
                f = a([].push);
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
                    o(t), i(r);
                    var a = d(null),
                        l = 0;
                    return u(t, function(t) {
                        var i = s(r(t, l++));
                        i in a ? f(a[i], t) : n(a, i, [t])
                    }), a
                }
            })
        }
    }(), iM().Object.groupBy);
    var iz = {
            exports: {}
        },
        iH = {};

    function iJ() {
        if (rE) return iz.exports;
        rE = 1;
        var t = iy(),
            n = aE(),
            r = ir(),
            a = aL(),
            i = aX(),
            o = a8().f,
            s = ih(),
            u = function() {
                if (rb) return iH;
                rb = 1;
                var t = aq(),
                    n = aI(),
                    r = ih().f,
                    a = rg ? ry : (rg = 1, ry = aE()([].slice)),
                    i = window && Object.getOwnPropertyNames ? Object.getOwnPropertyNames(window) : [],
                    o = function(t) {
                        try {
                            return r(t)
                        } catch (t) {
                            return a(i)
                        }
                    };
                return iH.f = function(a) {
                    return i && "Window" === t(a) ? o(a) : r(n(a))
                }, iH
            }(),
            l = function() {
                if (rT) return rP;
                rT = 1;
                var t = aw(),
                    n = aL(),
                    r = aq(),
                    a = rx ? rw : (rx = 1, rw = aw()(function() {
                        if ("function" == typeof ArrayBuffer) {
                            var t = new ArrayBuffer(8);
                            Object.isExtensible(t) && Object.defineProperty(t, "a", {
                                value: 8
                            })
                        }
                    })),
                    i = Object.isExtensible;
                return rP = t(function() {}) || a ? function(t) {
                    return !!n(t) && (!a || "ArrayBuffer" !== r(t)) && (!i || i(t))
                } : i
            }(),
            c = a$(),
            d = rS ? rR : (rS = 1, rR = !aw()(function() {
                return Object.isExtensible(Object.preventExtensions({}))
            })),
            f = !1,
            p = c("meta"),
            h = 0,
            v = function(t) {
                o(t, p, {
                    value: {
                        objectID: "O" + h++,
                        weakData: {}
                    }
                })
            },
            m = iz.exports = {
                enable: function() {
                    m.enable = function() {}, f = !0;
                    var r = s.f,
                        a = n([].splice),
                        i = {};
                    i[p] = 1, r(i).length && (s.f = function(t) {
                        for (var n = r(t), i = 0, o = n.length; i < o; i++)
                            if (n[i] === p) {
                                a(n, i, 1);
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
                    if (!a(t)) return "symbol" == typeof t ? t : ("string" == typeof t ? "S" : "P") + t;
                    if (!i(t, p)) {
                        if (!l(t)) return "F";
                        if (!n) return "E";
                        v(t)
                    }
                    return t[p].objectID
                },
                getWeakData: function(t, n) {
                    if (!i(t, p)) {
                        if (!l(t)) return !0;
                        if (!n) return !1;
                        v(t)
                    }
                    return t[p].weakData
                },
                onFreeze: function(t) {
                    return d && f && l(t) && !i(t, p) && v(t), t
                }
            };
        return r[p] = !0, iz.exports
    }

    function iQ() {
        if (rk) return rq;
        rk = 1;
        var t = aO(),
            n = TypeError;
        return rq = function(r, a) {
            if (t(a, r)) return r;
            throw new n("Incorrect invocation")
        }
    }

    function iX() {
        if (rj) return rI;
        rj = 1;
        var t = aj(),
            n = aL(),
            r = iG();
        return rI = function(a, i, o) {
            var s, u;
            return r && t(s = i.constructor) && s !== o && n(u = s.prototype) && u !== o.prototype && r(a, u), a
        }
    }

    function i$() {
        if (rN) return rL;
        rN = 1;
        var t = iy(),
            n = ag(),
            r = aE(),
            a = im(),
            i = io(),
            o = iJ(),
            s = iD(),
            u = iQ(),
            l = aj(),
            c = aA(),
            d = aL(),
            f = aw(),
            p = function() {
                if (rC) return rA;
                rC = 1;
                var t = aZ()("iterator"),
                    n = !1;
                try {
                    var r = 0,
                        a = {
                            next: function() {
                                return {
                                    done: !!r++
                                }
                            },
                            return: function() {
                                n = !0
                            }
                        };
                    a[t] = function() {
                        return this
                    }, Array.from(a, function() {
                        throw 2
                    })
                } catch (t) {}
                return rA = function(r, a) {
                    try {
                        if (!a && !n) return !1
                    } catch (t) {
                        return !1
                    }
                    var i = !1;
                    try {
                        var o = {};
                        o[t] = function() {
                            return {
                                next: function() {
                                    return {
                                        done: i = !0
                                    }
                                }
                            }
                        }, r(o)
                    } catch (t) {}
                    return i
                }
            }(),
            h = iF(),
            v = iX();
        return rL = function(m, y, g) {
            var b = -1 !== m.indexOf("Map"),
                w = -1 !== m.indexOf("Weak"),
                x = b ? "set" : "add",
                P = n[m],
                T = P && P.prototype,
                R = P,
                S = {},
                E = function(t) {
                    var n = r(T[t]);
                    i(T, t, "add" === t ? function(t) {
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
            if (a(m, !l(P) || !(w || T.forEach && !f(function() {
                    new P().entries().next()
                })))) R = g.getConstructor(y, m, b, x), o.enable();
            else if (a(m, !0)) {
                var q = new R,
                    k = q[x](w ? {} : -0, 1) !== q,
                    A = f(function() {
                        q.has(1)
                    }),
                    C = p(function(t) {
                        new P(t)
                    }),
                    I = !w && f(function() {
                        for (var t = new P, n = 5; n--;) t[x](n, n);
                        return !t.has(-0)
                    });
                C || ((R = y(function(t, n) {
                    u(t, T);
                    var r = v(new P, t, R);
                    return c(n) || s(n, r[x], {
                        that: r,
                        AS_ENTRIES: b
                    }), r
                })).prototype = T, T.constructor = R), (A || I) && (E("delete"), E("has"), b && E("get")), (I || k) && E(x), w && T.clear && delete T.clear
            }
            return S[m] = R, t({
                global: !0,
                constructor: !0,
                forced: R !== P
            }, S), h(R, m), w || g.setStrong(R, m, b), R
        }
    }

    function iZ() {
        if (rD) return rO;
        rD = 1;
        var t = ii(),
            n = a8();
        return rO = function(r, a, i) {
            return i.get && t(i.get, a, {
                getter: !0
            }), i.set && t(i.set, a, {
                setter: !0
            }), n.f(r, a, i)
        }
    }

    function iY() {
        if (rF) return rU;
        rF = 1;
        var t = iR(),
            n = iZ(),
            r = function() {
                if (r_) return rM;
                r_ = 1;
                var t = io();
                return rM = function(n, r, a) {
                    for (var i in r) t(n, i, r[i], a);
                    return n
                }
            }(),
            a = iI(),
            i = iQ(),
            o = aA(),
            s = iD(),
            u = iK(),
            l = iW(),
            c = function() {
                if (rV) return rB;
                rV = 1;
                var t = aN(),
                    n = iZ(),
                    r = aZ(),
                    a = ax(),
                    i = r("species");
                return rB = function(r) {
                    var o = t(r);
                    a && o && !o[i] && n(o, i, {
                        configurable: !0,
                        get: function() {
                            return this
                        }
                    })
                }
            }(),
            d = ax(),
            f = iJ().fastKey,
            p = ia(),
            h = p.set,
            v = p.getterFor;
        return rU = {
            getConstructor: function(u, l, c, p) {
                var m = u(function(n, r) {
                        i(n, y), h(n, {
                            type: l,
                            index: t(null),
                            first: null,
                            last: null,
                            size: 0
                        }), d || (n.size = 0), o(r) || s(r, n[p], {
                            that: n,
                            AS_ENTRIES: c
                        })
                    }),
                    y = m.prototype,
                    g = v(l),
                    b = function(t, n, r) {
                        var a, i, o = g(t),
                            s = w(t, n);
                        return s ? s.value = r : (o.last = s = {
                            index: i = f(n, !0),
                            key: n,
                            value: r,
                            previous: a = o.last,
                            next: null,
                            removed: !1
                        }, o.first || (o.first = s), a && (a.next = s), d ? o.size++ : t.size++, "F" !== i && (o.index[i] = s)), t
                    },
                    w = function(t, n) {
                        var r, a = g(t),
                            i = f(n);
                        if ("F" !== i) return a.index[i];
                        for (r = a.first; r; r = r.next)
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
                            var a = r.next,
                                i = r.previous;
                            delete n.index[r.index], r.removed = !0, i && (i.next = a), a && (a.previous = i), n.first === r && (n.first = a), n.last === r && (n.last = i), d ? n.size-- : this.size--
                        }
                        return !!r
                    },
                    forEach: function(t) {
                        for (var n, r = g(this), i = a(t, arguments.length > 1 ? arguments[1] : void 0); n = n ? n.next : r.first;)
                            for (i(n.value, n.key, this); n && n.removed;) n = n.previous
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
                var a = n + " Iterator",
                    i = v(n),
                    o = v(a);
                u(t, n, function(t, n) {
                    h(this, {
                        type: a,
                        target: t,
                        state: i(t),
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

    function i0() {
        if (rJ) return rH;
        rJ = 1;
        var t = ag(),
            n = aD(),
            r = aq(),
            a = function(t) {
                return n.slice(0, t.length) === t
            };
        return rH = a("Bun/") ? "BUN" : a("Cloudflare-Workers") ? "CLOUDFLARE" : a("Deno/") ? "DENO" : a("Node.js/") ? "NODE" : t.Bun && "string" == typeof Bun.version ? "BUN" : t.Deno && "object" == typeof Deno.version ? "DENO" : "process" === r(t.process) ? "NODE" : t.window && t.document ? "BROWSER" : "REST"
    }

    function i1() {
        if (rZ) return r$;
        rZ = 1;
        var t = ag(),
            n = rX ? rQ : (rX = 1, rQ = "NODE" === i0());
        return r$ = function(r) {
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

    function i2() {
        return r0 ? rY : (r0 = 1, rY = {
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

    function i4() {
        if (r2) return r1;
        r2 = 1;
        var t = aE(),
            n = Error,
            r = t("".replace),
            a = String(new n("zxcasd").stack),
            i = /\n\s*at [^:]*:[^\n]*/,
            o = i.test(a);
        return r1 = function(t, a) {
            if (o && "string" == typeof t && !n.prepareStackTrace)
                for (; a--;) t = r(t, i, "");
            return t
        }
    }

    function i3() {
        if (ar) return an;
        ar = 1;
        var t = aE(),
            n = Set.prototype;
        return an = {
            Set: Set,
            add: t(n.add),
            has: t(n.has),
            remove: t(n.delete),
            proto: n
        }
    }

    function i6() {
        if (al) return au;
        al = 1;
        var t = ag(),
            n = aw(),
            r = aM(),
            a = i0(),
            i = t.structuredClone;
        return au = !!i && !n(function() {
            if ("DENO" === a && r > 92 || "NODE" === a && r > 94 || "BROWSER" === a && r > 97) return !1;
            var t = new ArrayBuffer(8),
                n = i(t, {
                    transfer: [t]
                });
            return 0 !== t.byteLength || 8 !== n.byteLength
        })
    }

    function i8(t) {
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

    function i5(t) {
        return new this(function(n, r) {
            if (!(t && void 0 !== t.length)) return r(TypeError(typeof t + " " + t + " is not iterable(cannot read property Symbol(Symbol.iterator))"));
            var a = Array.prototype.slice.call(t);
            if (0 === a.length) return n([]);
            for (var i = a.length, o = 0; o < a.length; o++) ! function t(r, o) {
                if (o && ("object" == typeof o || "function" == typeof o)) {
                    var s = o.then;
                    if ("function" == typeof s) return void s.call(o, function(n) {
                        t(r, n)
                    }, function(t) {
                        a[r] = {
                            status: "rejected",
                            reason: t
                        }, 0 == --i && n(a)
                    })
                }
                a[r] = {
                    status: "fulfilled",
                    value: o
                }, 0 == --i && n(a)
            }(o, a[o])
        })
    }

    function i9(t, n) {
        this.name = "AggregateError", this.errors = t, this.message = n || ""
    }

    function i7(t) {
        var n = this;
        return new n(function(r, a) {
            if (!(t && void 0 !== t.length)) return a(TypeError("Promise.any accepts an array"));
            var i = Array.prototype.slice.call(t);
            if (0 === i.length) return a();
            for (var o = [], s = 0; s < i.length; s++) try {
                n.resolve(i[s]).then(r).catch(function(t) {
                    o.push(t), o.length === i.length && a(new i9(o, "All promises were rejected"))
                })
            } catch (t) {
                a(t)
            }
        })
    }
    av || (av = 1, function() {
        if (!nY) {
            nY = 1;
            var t = io(),
                n = iB(),
                r = Error.prototype;
            r.toString !== n && t(r, "toString", n)
        }
    }(), function() {
        if (!rf) {
            rf = 1;
            var t = aI(),
                n = iC(),
                r = iN(),
                a = ia(),
                i = a8().f,
                o = iK(),
                s = iW(),
                u = aW(),
                l = ax(),
                c = "Array Iterator",
                d = a.set,
                f = a.getterFor(c);
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
            var p = r.Arguments = r.Array;
            if (n("keys"), n("values"), n("entries"), !u && l && "values" !== p.name) try {
                i(p, "name", {
                    value: "values"
                })
            } catch (t) {}
        }
    }(), function() {
        if (!rp) {
            rp = 1;
            var t = iy(),
                n = aQ(),
                r = iT();
            t({
                target: "Object",
                stat: !0,
                forced: aw()(function() {
                    r(1)
                })
            }, {
                keys: function(t) {
                    return r(n(t))
                }
            })
        }
    }(), function() {
        if (!rm) {
            rm = 1;
            var t = ig(),
                n = io(),
                r = function() {
                    if (rv) return rh;
                    rv = 1;
                    var t = ig(),
                        n = ib();
                    return rh = t ? ({}).toString : function() {
                        return "[object " + n(this) + "]"
                    }
                }();
            t || n(Object.prototype, "toString", r, {
                unsafe: !0
            })
        }
    }(), rK || (rK = 1, rG || (rG = 1, i$()("Map", function(t) {
        return function() {
            return t(this, arguments.length ? arguments[0] : void 0)
        }
    }, iY()))), rz || (rz = 1, rW || (rW = 1, i$()("Set", function(t) {
        return function() {
            return t(this, arguments.length ? arguments[0] : void 0)
        }
    }, iY()))), function() {
        if (!r4) {
            r4 = 1;
            var t = iy(),
                n = aN(),
                r = i1(),
                a = aw(),
                i = iR(),
                o = aS(),
                s = a8().f,
                u = io(),
                l = iZ(),
                c = aX(),
                d = iQ(),
                f = a6(),
                p = iB(),
                h = i_(),
                v = i2(),
                m = i4(),
                y = ia(),
                g = ax(),
                b = aW(),
                w = "DOMException",
                x = "DATA_CLONE_ERR",
                P = n("Error"),
                T = n(w) || function() {
                    try {
                        new(n("MessageChannel") || r("worker_threads").MessageChannel)().port1.postMessage(new WeakMap)
                    } catch (t) {
                        if (t.name === x && 25 === t.code) return t.constructor
                    }
                }(),
                R = T && T.prototype,
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
                        n = h(t < 1 ? void 0 : arguments[0]),
                        r = h(t < 2 ? void 0 : arguments[1], "Error"),
                        a = A(r);
                    if (E(this, {
                            type: w,
                            name: r,
                            message: n,
                            code: a
                        }), g || (this.name = r, this.message = n, this.code = a), k) {
                        var i = new P(n);
                        i.name = w, s(this, "stack", o(1, m(i.stack, 1)))
                    }
                },
                I = C.prototype = i(S),
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
            g && (l(I, "code", L("code")), l(I, "message", L("message")), l(I, "name", L("name"))), s(I, "constructor", o(1, C));
            var N = a(function() {
                    return !(new T instanceof P)
                }),
                O = N || a(function() {
                    return S.toString !== p || "2: 1" !== String(new T(1, 2))
                }),
                D = N || a(function() {
                    return 25 !== new T(1, "DataCloneError").code
                }),
                M = N || 25 !== T[x] || 25 !== R[x],
                _ = b ? O || D || M : N;
            t({
                global: !0,
                constructor: !0,
                forced: _
            }, {
                DOMException: _ ? C : T
            });
            var B = n(w),
                V = B.prototype;
            for (var U in O && (b || T === B) && u(V, "toString", p), D && g && T === B && l(V, "code", j(function() {
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
        if (!r3) {
            r3 = 1;
            var t = iy(),
                n = ag(),
                r = aN(),
                a = aS(),
                i = a8().f,
                o = aX(),
                s = iQ(),
                u = iX(),
                l = i_(),
                c = i2(),
                d = i4(),
                f = ax(),
                p = aW(),
                h = "DOMException",
                v = r("Error"),
                m = r(h),
                y = function() {
                    s(this, g);
                    var t = arguments.length,
                        n = l(t < 1 ? void 0 : arguments[0]),
                        r = l(t < 2 ? void 0 : arguments[1], "Error"),
                        o = new m(n, r),
                        c = new v(n);
                    return c.name = h, i(o, "stack", a(1, d(c.stack, 1))), u(o, this, y), o
                },
                g = y.prototype = m.prototype,
                b = "stack" in new v(h),
                w = "stack" in new m(1, 2),
                x = m && f && Object.getOwnPropertyDescriptor(n, h),
                P = !!x && !(x.writable && x.configurable),
                T = b && !P && !w;
            t({
                global: !0,
                constructor: !0,
                forced: p || T
            }, {
                DOMException: T ? y : m
            });
            var R = r(h),
                S = R.prototype;
            if (S.constructor !== R) {
                for (var E in p || i(S, "constructor", a(1, R)), c)
                    if (o(c, E)) {
                        var q = c[E],
                            k = q.s;
                        o(R, k) || i(R, k, a(6, q.c))
                    }
            }
        }
    }(), function() {
        if (!r6) {
            r6 = 1;
            var t = aN(),
                n = iF(),
                r = "DOMException";
            n(t(r), r)
        }
    }(), function() {
        if (!ah) {
            ah = 1;
            var t = aW(),
                n = iy(),
                r = ag(),
                a = aN(),
                i = aE(),
                o = aw(),
                s = a$(),
                u = aj(),
                l = function() {
                    if (r5) return r8;
                    r5 = 1;
                    var t = aE(),
                        n = aw(),
                        r = aj(),
                        a = ib(),
                        i = aN(),
                        o = ie(),
                        s = function() {},
                        u = i("Reflect", "construct"),
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
                        p = function(t) {
                            if (!r(t)) return !1;
                            switch (a(t)) {
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
                    return p.sham = !0, r8 = !u || n(function() {
                        var t;
                        return f(f.call) || !f(Object) || !f(function() {
                            t = !0
                        }) || t
                    }) ? p : f
                }(),
                c = aA(),
                d = aL(),
                f = aV(),
                p = iD(),
                h = a6(),
                v = ib(),
                m = aX(),
                y = iL(),
                g = a5(),
                b = ic(),
                w = function() {
                    if (r7) return r9;
                    r7 = 1;
                    var t = TypeError;
                    return r9 = function(n, r) {
                        if (n < r) throw new t("Not enough arguments");
                        return n
                    }
                }(),
                x = ik(),
                P = function() {
                    if (at) return ae;
                    at = 1;
                    var t = aE(),
                        n = Map.prototype;
                    return ae = {
                        Map: Map,
                        set: t(n.set),
                        get: t(n.get),
                        has: t(n.has),
                        remove: t(n.delete),
                        proto: n
                    }
                }(),
                T = i3(),
                R = function() {
                    if (as) return ao;
                    as = 1;
                    var t = aE(),
                        n = function() {
                            if (ai) return aa;
                            ai = 1;
                            var t = aT();
                            return aa = function(n, r, a) {
                                for (var i, o, s = a ? n : n.iterator, u = n.next; !(i = t(u, s)).done;)
                                    if (void 0 !== (o = r(i.value))) return o
                            }
                        }(),
                        r = i3(),
                        a = r.Set,
                        i = r.proto,
                        o = t(i.forEach),
                        s = t(i.keys),
                        u = s(new a).next;
                    return ao = function(t, r, a) {
                        return a ? n({
                            iterator: s(t),
                            next: u
                        }, r) : o(t, r)
                    }
                }(),
                S = function() {
                    if (ad) return ac;
                    ad = 1;
                    var t, n, r, a, i = ag(),
                        o = i1(),
                        s = i6(),
                        u = i.structuredClone,
                        l = i.ArrayBuffer,
                        c = i.MessageChannel,
                        d = !1;
                    if (s) d = function(t) {
                        u(t, {
                            transfer: [t]
                        })
                    };
                    else if (l) try {
                        !c && (t = o("worker_threads")) && (c = t.MessageChannel), c && (n = new c, r = new l(2), a = function(t) {
                            n.port1.postMessage(null, [t])
                        }, 2 === r.byteLength && (a(r), 0 === r.byteLength && (d = a)))
                    } catch (t) {}
                    return ac = d
                }(),
                E = function() {
                    if (ap) return af;
                    ap = 1;
                    var t = aw(),
                        n = aS();
                    return af = !t(function() {
                        var t = Error("a");
                        return !("stack" in t) || (Object.defineProperty(t, "stack", n(1, 7)), 7 !== t.stack)
                    })
                }(),
                q = i6(),
                k = r.Object,
                A = r.Array,
                C = r.Date,
                I = r.Error,
                j = r.TypeError,
                L = r.PerformanceMark,
                N = a("DOMException"),
                O = P.Map,
                D = P.has,
                M = P.get,
                _ = P.set,
                B = T.Set,
                V = T.add,
                U = T.has,
                F = a("Object", "keys"),
                G = i([].push),
                K = i((!0).valueOf),
                W = i(1.1.valueOf),
                z = i("".valueOf),
                H = i(C.prototype.getTime),
                J = s("structuredClone"),
                Q = "DataCloneError",
                X = "Transferring",
                $ = function(t) {
                    return !o(function() {
                        var n = new r.Set([7]),
                            a = t(n),
                            i = t(k(7));
                        return a === n || !a.has(7) || !d(i) || 7 != +i
                    }) && t
                },
                Z = function(t, n) {
                    return !o(function() {
                        var r = new n,
                            a = t({
                                a: r,
                                b: r
                            });
                        return !(a && a.a === a.b && a.a instanceof n && a.a.stack === r.stack)
                    })
                },
                Y = r.structuredClone,
                ee = t || !Z(Y, I) || !Z(Y, N) || !!o(function() {
                    var t = Y(new r.AggregateError([1], J, {
                        cause: 3
                    }));
                    return "AggregateError" !== t.name || 1 !== t.errors[0] || t.message !== J || 3 !== t.cause
                }),
                et = !Y && $(function(t) {
                    return new L(J, {
                        detail: t
                    }).detail
                }),
                en = $(Y) || et,
                er = function(t) {
                    throw new N("Uncloneable type: " + t, Q)
                },
                ea = function(t, n) {
                    throw new N((n || "Cloning") + " of " + t + " cannot be properly polyfilled in this engine", Q)
                },
                ei = function(t, n) {
                    return en || ea(n), en(t)
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
                es = function(t, n, a) {
                    if (D(n, t)) return M(n, t);
                    if ("SharedArrayBuffer" === (a || v(t))) i = en ? en(t) : t;
                    else {
                        var i, o, s, l, c, d, f = r.DataView;
                        f || u(t.slice) || ea("ArrayBuffer");
                        try {
                            if (u(t.slice) && !t.resizable) i = t.slice(0);
                            else
                                for (o = t.byteLength, s = ("maxByteLength" in t) ? {
                                        maxByteLength: t.maxByteLength
                                    } : void 0, i = new ArrayBuffer(o, s), l = new f(t), c = new f(i), d = 0; d < o; d++) c.setUint8(d, l.getUint8(d))
                        } catch (t) {
                            throw new N("ArrayBuffer is detached", Q)
                        }
                    }
                    return _(n, t, i), i
                },
                eu = function(t, n, a, i, o) {
                    var s = r[n];
                    return d(s) || ea(n), new s(es(t.buffer, o), a, i)
                },
                el = function(t, n) {
                    if (f(t) && er("Symbol"), !d(t)) return t;
                    if (n) {
                        if (D(n, t)) return M(n, t)
                    } else n = new O;
                    var i, o, s, l, c, p, h, w, P = v(t);
                    switch (P) {
                        case "Array":
                            s = A(b(t));
                            break;
                        case "Object":
                            s = {};
                            break;
                        case "Map":
                            s = new O;
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
                                    s = new(a(o))([]);
                                    break;
                                case "EvalError":
                                case "RangeError":
                                case "ReferenceError":
                                case "SuppressedError":
                                case "SyntaxError":
                                case "TypeError":
                                case "URIError":
                                    s = new(a(o));
                                    break;
                                case "CompileError":
                                case "LinkError":
                                case "RuntimeError":
                                    s = new(a("WebAssembly", o));
                                    break;
                                default:
                                    s = new I
                            }
                            break;
                        case "DOMException":
                            s = new N(t.message, t.name);
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
                            p = "DataView" === P ? t.byteLength : t.length, s = eu(t, P, t.byteOffset, p, n);
                            break;
                        case "DOMQuad":
                            try {
                                s = new DOMQuad(el(t.p1, n), el(t.p2, n), el(t.p3, n), el(t.p4, n))
                            } catch (n) {
                                s = ei(t, P)
                            }
                            break;
                        case "File":
                            if (en) try {
                                s = en(t), v(s) !== P && (s = void 0)
                            } catch (t) {}
                            if (!s) try {
                                s = new File([t], t.name, t)
                            } catch (t) {}
                            s || ea(P);
                            break;
                        case "FileList":
                            if (l = eo()) {
                                for (c = 0, p = b(t); c < p; c++) l.items.add(el(t[c], n));
                                s = l.files
                            } else s = ei(t, P);
                            break;
                        case "ImageData":
                            try {
                                s = new ImageData(el(t.data, n), t.width, t.height, {
                                    colorSpace: t.colorSpace
                                })
                            } catch (n) {
                                s = ei(t, P)
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
                                    s = k(z(t));
                                    break;
                                case "Date":
                                    s = new C(H(t));
                                    break;
                                case "Blob":
                                    try {
                                        s = t.slice(0, t.size, t.type)
                                    } catch (t) {
                                        ea(P)
                                    }
                                    break;
                                case "DOMPoint":
                                case "DOMPointReadOnly":
                                    i = r[P];
                                    try {
                                        s = i.fromPoint ? i.fromPoint(t) : new i(t.x, t.y, t.z, t.w)
                                    } catch (t) {
                                        ea(P)
                                    }
                                    break;
                                case "DOMRect":
                                case "DOMRectReadOnly":
                                    i = r[P];
                                    try {
                                        s = i.fromRect ? i.fromRect(t) : new i(t.x, t.y, t.width, t.height)
                                    } catch (t) {
                                        ea(P)
                                    }
                                    break;
                                case "DOMMatrix":
                                case "DOMMatrixReadOnly":
                                    i = r[P];
                                    try {
                                        s = i.fromMatrix ? i.fromMatrix(t) : new i(t)
                                    } catch (t) {
                                        ea(P)
                                    }
                                    break;
                                case "AudioData":
                                case "VideoFrame":
                                    u(t.clone) || ea(P);
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
                                    ea(P);
                                default:
                                    er(P)
                            }
                    }
                    switch (_(n, t, s), P) {
                        case "Array":
                        case "Object":
                            for (c = 0, p = b(h = F(t)); c < p; c++) w = h[c], y(s, w, el(t[w], n));
                            break;
                        case "Map":
                            t.forEach(function(t, r) {
                                _(s, el(r, n), el(t, n))
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
                    if (!d(t)) throw new j("Transfer option cannot be converted to a sequence");
                    var a, i, o, s, c, f = [];
                    p(t, function(t) {
                        G(f, h(t))
                    });
                    for (var m = 0, y = b(f), g = new B; m < y;) {
                        if (i = v(a = f[m++]), s = void 0, "ArrayBuffer" === i ? U(g, a) : D(n, a)) throw new N("Duplicate transferable", Q);
                        if ("ArrayBuffer" === i) {
                            V(g, a);
                            continue
                        }
                        if (q) s = Y(a, {
                            transfer: [a]
                        });
                        else switch (i) {
                            case "ImageBitmap":
                                l(o = r.OffscreenCanvas) || ea(i, X);
                                try {
                                    (c = new o(a.width, a.height)).getContext("bitmaprenderer").transferFromImageBitmap(a), s = c.transferToImageBitmap()
                                } catch (t) {}
                                break;
                            case "AudioData":
                            case "VideoFrame":
                                u(a.clone) && u(a.close) || ea(i, X);
                                try {
                                    s = a.clone(), a.close()
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
                                ea(i, X)
                        }
                        if (void 0 === s) throw new N("This object cannot be transferred: " + i, Q);
                        _(n, a, s)
                    }
                    return g
                },
                ed = function(t) {
                    R(t, function(t) {
                        q ? Y(t, {
                            transfer: [t]
                        }) : u(t.transfer) ? t.transfer() : S ? S(t) : ea("ArrayBuffer", X)
                    })
                };
            n({
                global: !0,
                enumerable: !0,
                sham: !q,
                forced: ee
            }, {
                structuredClone: function(t) {
                    var n, r, a = w(arguments.length, 1) > 1 && !c(arguments[1]) ? h(arguments[1]) : void 0,
                        i = a ? a.transfer : void 0;
                    void 0 !== i && (r = ec(i, n = new O));
                    var o = el(t, n);
                    return r && ed(r), o
                }
            })
        }
    }(), iM().structuredClone), i9.prototype = Error.prototype;
    var oe = setTimeout;

    function ot(t) {
        return !!(t && void 0 !== t.length)
    }

    function on() {}

    function or(t) {
        if (!(this instanceof or)) throw TypeError("Promises must be constructed via new");
        if ("function" != typeof t) throw TypeError("not a function");
        this._state = 0, this._handled = !1, this._value = void 0, this._deferreds = [], ol(t, this)
    }

    function oa(t, n) {
        for (; 3 === t._state;) t = t._value;
        0 === t._state ? t._deferreds.push(n) : (t._handled = !0, or._immediateFn(function() {
            var r, a = 1 === t._state ? n.onFulfilled : n.onRejected;
            if (null === a) return void(1 === t._state ? oi : oo)(n.promise, t._value);
            try {
                r = a(t._value)
            } catch (t) {
                oo(n.promise, t);
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
                if (n instanceof or) {
                    t._state = 3, t._value = n, os(t);
                    return
                }
                if ("function" == typeof r) return void ol(function() {
                    r.apply(n, arguments)
                }, t)
            }
            t._state = 1, t._value = n, os(t)
        } catch (n) {
            oo(t, n)
        }
    }

    function oo(t, n) {
        t._state = 2, t._value = n, os(t)
    }

    function os(t) {
        2 === t._state && 0 === t._deferreds.length && or._immediateFn(function() {
            t._handled || or._unhandledRejectionFn(t._value)
        });
        for (var n = 0, r = t._deferreds.length; n < r; n++) oa(t, t._deferreds[n]);
        t._deferreds = null
    }

    function ou(t, n, r) {
        this.onFulfilled = "function" == typeof t ? t : null, this.onRejected = "function" == typeof n ? n : null, this.promise = r
    }

    function ol(t, n) {
        var r = !1;
        try {
            t(function(t) {
                r || (r = !0, oi(n, t))
            }, function(t) {
                r || (r = !0, oo(n, t))
            })
        } catch (t) {
            if (r) return;
            r = !0, oo(n, t)
        }
    }
    or.prototype.catch = function(t) {
        return this.then(null, t)
    }, or.prototype.then = function(t, n) {
        var r = new this.constructor(on);
        return oa(this, new ou(t, n, r)), r
    }, or.prototype.finally = i8, or.all = function(t) {
        return new or(function(n, r) {
            if (!ot(t)) return r(TypeError("Promise.all accepts an array"));
            var a = Array.prototype.slice.call(t);
            if (0 === a.length) return n([]);
            for (var i = a.length, o = 0; o < a.length; o++) ! function t(o, s) {
                try {
                    if (s && ("object" == typeof s || "function" == typeof s)) {
                        var u = s.then;
                        if ("function" == typeof u) return void u.call(s, function(n) {
                            t(o, n)
                        }, r)
                    }
                    a[o] = s, 0 == --i && n(a)
                } catch (t) {
                    r(t)
                }
            }(o, a[o])
        })
    }, or.any = i7, or.allSettled = i5, or.resolve = function(t) {
        return t && "object" == typeof t && t.constructor === or ? t : new or(function(n) {
            n(t)
        })
    }, or.reject = function(t) {
        return new or(function(n, r) {
            r(t)
        })
    }, or.race = function(t) {
        return new or(function(n, r) {
            if (!ot(t)) return r(TypeError("Promise.race accepts an array"));
            for (var a = 0, i = t.length; a < i; a++) or.resolve(t[a]).then(n, r)
        })
    }, or._immediateFn = "function" == typeof setImmediate && function(t) {
        setImmediate(t)
    } || function(t) {
        oe(t, 0)
    }, or._unhandledRejectionFn = function(t) {
        "u" > typeof console && console && console.warn("Possible Unhandled Promise Rejection:", t)
    };
    var oc = "u" > typeof self ? self : window;
    "function" != typeof oc.Promise ? oc.Promise = or : (oc.Promise.prototype.finally || (oc.Promise.prototype.finally = i8), oc.Promise.allSettled || (oc.Promise.allSettled = i5), oc.Promise.any || (oc.Promise.any = i7));
    var od = t.i(416340),
        of = t.i(589624),
        op = t.i(87758),
        oh = t.i(445465),
        ov = t.i(387125),
        om = t.i(795621),
        oy = t.i(458451),
        og = t.i(260241),
        ob = t.i(429884),
        ow = t.i(602635),
        ox = t.i(822092),
        ox = ox,
        oP = t.i(234255),
        oP = oP,
        oT = t.i(944672);
    t.i(725924);
    var oR = t.i(79187),
        oS = t.i(958885),
        oE = t.i(836047);
    t.i(30941);
    var oq = t.i(559546),
        ok = t.i(74927),
        oA = t.i(33106),
        oC = t.i(379666),
        oI = t.i(41758),
        oj = t.i(52301),
        oL = t.i(700594),
        oN = t.i(236603),
        oO = t.i(921910),
        oD = {},
        oM = ok.default;

    function o_(t, n, r) {
        t = t || function(t) {
            this.queue(t)
        }, n = n || function() {
            this.queue(null)
        };
        var a = !1,
            i = !1,
            o = [],
            s = !1,
            u = new oM;

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
            u.readable = !1, !u.writable && u.autoDestroy && m.default.nextTick(function() {
                u.destroy()
            })
        }), u.end = function(t) {
            if (!a) return a = !0, arguments.length && u.write(t), u.writable = !1, n.call(u), !u.readable && u.autoDestroy && u.destroy(), u
        }, u.destroy = function() {
            if (!i) return i = !0, a = !0, o.length = 0, u.writable = u.readable = !1, u.emit("close"), u
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
    var oB = Object.prototype.toString,
        oV = "function" == typeof oE.Buffer.alloc && "function" == typeof oE.Buffer.allocUnsafe && "function" == typeof oE.Buffer.from,
        oU = {},
        oF = Array.isArray || function(t) {
            return "[object Array]" == Object.prototype.toString.call(t)
        },
        oG = {};

    function oK(t) {
        return Object.prototype.toString.call(t)
    }
    oG.isArray = function(t) {
        return Array.isArray ? Array.isArray(t) : "[object Array]" === oK(t)
    }, oG.isBoolean = function(t) {
        return "boolean" == typeof t
    }, oG.isNull = function(t) {
        return null === t
    }, oG.isNullOrUndefined = function(t) {
        return null == t
    }, oG.isNumber = function(t) {
        return "number" == typeof t
    }, oG.isString = function(t) {
        return "string" == typeof t
    }, oG.isSymbol = function(t) {
        return "symbol" == typeof t
    }, oG.isUndefined = function(t) {
        return void 0 === t
    }, oG.isRegExp = function(t) {
        return "[object RegExp]" === oK(t)
    }, oG.isObject = function(t) {
        return "object" == typeof t && null !== t
    }, oG.isDate = function(t) {
        return "[object Date]" === oK(t)
    }, oG.isError = function(t) {
        return "[object Error]" === oK(t) || t instanceof Error
    }, oG.isFunction = function(t) {
        return "function" == typeof t
    }, oG.isPrimitive = function(t) {
        return null === t || "boolean" == typeof t || "number" == typeof t || "string" == typeof t || "symbol" == typeof t || void 0 === t
    }, oG.isBuffer = oA.default.Buffer.isBuffer;
    var oW, oz = {},
        oH = {},
        oJ = {
            get exports() {
                return oH
            },
            set exports(e) {
                oH = e
            }
        },
        oQ = {
            get exports() {
                return oz
            },
            set exports(e) {
                oz = e
            }
        };
    try {
        var oX = t.r(52301);
        if ("function" != typeof oX.inherits) throw "";
        oQ.exports = oX.inherits
    } catch (t) {
        oW || (oW = 1, "function" == typeof Object.create ? oJ.exports = function(t, n) {
            n && (t.super_ = n, t.prototype = Object.create(n.prototype, {
                constructor: {
                    value: t,
                    enumerable: !1,
                    writable: !0,
                    configurable: !0
                }
            }))
        } : oJ.exports = function(t, n) {
            if (n) {
                t.super_ = n;
                var r = function() {};
                r.prototype = n.prototype, t.prototype = new r, t.prototype.constructor = t
            }
        }), oQ.exports = oH
    }
    var o$, oZ = {};

    function oY() {
        if (o$) return oZ;
        o$ = 1;
        var t = oA.default.Buffer,
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
            r = oZ.StringDecoder = function(r) {
                switch (this.encoding = (r || "utf8").toLowerCase().replace(/[-_]/, ""), function(t) {
                        if (t && !n(t)) throw Error("Unknown encoding: " + t)
                    }(r), this.encoding) {
                    case "utf8":
                        this.surrogateSize = 3;
                        break;
                    case "ucs2":
                    case "utf16le":
                        this.surrogateSize = 2, this.detectIncompleteChar = i;
                        break;
                    case "base64":
                        this.surrogateSize = 3, this.detectIncompleteChar = o;
                        break;
                    default:
                        return void(this.write = a)
                }
                this.charBuffer = new t(6), this.charReceived = 0, this.charLength = 0
            };

        function a(t) {
            return t.toString(this.encoding)
        }

        function i(t) {
            this.charReceived = t.length % 2, this.charLength = 2 * !!this.charReceived
        }

        function o(t) {
            this.charReceived = t.length % 3, this.charLength = 3 * !!this.charReceived
        }
        return r.prototype.write = function(t) {
            for (var n, r = ""; this.charLength;) {
                var a = t.length >= this.charLength - this.charReceived ? this.charLength - this.charReceived : t.length;
                if (t.copy(this.charBuffer, this.charReceived, 0, a), this.charReceived += a, this.charReceived < this.charLength) return "";
                if (t = t.slice(a, t.length), !((n = (r = this.charBuffer.slice(0, this.charLength).toString(this.encoding)).charCodeAt(r.length - 1)) >= 55296 && n <= 56319)) {
                    if (this.charReceived = this.charLength = 0, 0 === t.length) return r;
                    break
                }
                this.charLength += this.surrogateSize, r = ""
            }
            this.detectIncompleteChar(t);
            var i = t.length;
            if (this.charLength && (t.copy(this.charBuffer, 0, t.length - this.charReceived, i), i -= this.charReceived), i = (r += t.toString(this.encoding, 0, i)).length - 1, (n = r.charCodeAt(i)) >= 55296 && n <= 56319) {
                var o = this.surrogateSize;
                return this.charLength += o, this.charReceived += o, this.charBuffer.copy(this.charBuffer, o, 0, o), t.copy(this.charBuffer, 0, 0, o), r.substring(0, i)
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
                    a = this.charBuffer,
                    i = this.encoding;
                n += a.slice(0, r).toString(i)
            }
            return n
        }, oZ
    }
    var o0 = oA.default.Buffer;
    o6.ReadableState = o3;
    var o1 = oC.default.EventEmitter;
    o1.listenerCount || (o1.listenerCount = function(t, n) {
        return t.listeners(n).length
    });
    var o2, o4 = ok.default;

    function o3(t, n) {
        var r = (t = t || {}).highWaterMark;
        this.highWaterMark = r || 0 === r ? r : 16384, this.highWaterMark = ~~this.highWaterMark, this.buffer = [], this.length = 0, this.pipes = null, this.pipesCount = 0, this.flowing = !1, this.ended = !1, this.endEmitted = !1, this.reading = !1, this.calledRead = !1, this.sync = !0, this.needReadable = !1, this.emittedReadable = !1, this.readableListening = !1, this.objectMode = !!t.objectMode, this.defaultEncoding = t.defaultEncoding || "utf8", this.ranOut = !1, this.awaitDrain = 0, this.readingMore = !1, this.decoder = null, this.encoding = null, t.encoding && (o2 || (o2 = oY().StringDecoder), this.decoder = new o2(t.encoding), this.encoding = t.encoding)
    }

    function o6(t) {
        if (!(this instanceof o6)) return new o6(t);
        this._readableState = new o3(t), this.readable = !0, o4.call(this)
    }

    function o8(t, n, r, a, i) {
        var o, s, u = (o = r, s = null, o0.isBuffer(o) || "string" == typeof o || null == o || n.objectMode || (s = TypeError("Invalid non-string/buffer chunk")), s);
        if (u) t.emit("error", u);
        else if (null == r) n.reading = !1, n.ended || function(t, n) {
            if (n.decoder && !n.ended) {
                var r = n.decoder.end();
                r && r.length && (n.buffer.push(r), n.length += n.objectMode ? 1 : r.length)
            }
            n.ended = !0, n.length > 0 ? o9(t) : sa(t)
        }(t, n);
        else if (n.objectMode || r && r.length > 0)
            if (n.ended && !i) {
                var l = Error("stream.push() after EOF");
                t.emit("error", l)
            } else n.endEmitted && i ? (l = Error("stream.unshift() after end event"), t.emit("error", l)) : (!n.decoder || i || a || (r = n.decoder.write(r)), n.length += n.objectMode ? 1 : r.length, i ? n.buffer.unshift(r) : (n.reading = !1, n.buffer.push(r)), n.needReadable && o9(t), n.readingMore || (n.readingMore = !0, m.default.nextTick(function() {
                for (var r = n.length; !n.reading && !n.flowing && !n.ended && n.length < n.highWaterMark && (t.read(0), r !== n.length);) r = n.length;
                n.readingMore = !1
            })));
        else i || (n.reading = !1);
        return !n.ended && (n.needReadable || n.length < n.highWaterMark || 0 === n.length)
    }

    function o5(t, n) {
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

    function o9(t) {
        var n = t._readableState;
        n.needReadable = !1, n.emittedReadable || (n.emittedReadable = !0, n.sync ? m.default.nextTick(function() {
            o7(t)
        }) : o7(t))
    }

    function o7(t) {
        t.emit("readable")
    }

    function se(t) {
        var n, r = t._readableState;

        function a(t, a, i) {
            !1 === t.write(n) && r.awaitDrain++
        }
        for (r.awaitDrain = 0; r.pipesCount && null !== (n = t.read());)
            if (1 === r.pipesCount ? a(r.pipes) : si(r.pipes, a), t.emit("data", n), r.awaitDrain > 0) return;
        0 === r.pipesCount ? (r.flowing = !1, o1.listenerCount(t, "data") > 0 && sn(t)) : r.ranOut = !0
    }

    function st() {
        this._readableState.ranOut && (this._readableState.ranOut = !1, se(this))
    }

    function sn(t, n) {
        if (t._readableState.flowing) throw Error("Cannot switch to old mode now.");
        var r = n || !1,
            a = !1;
        t.readable = !0, t.pipe = o4.prototype.pipe, t.on = t.addListener = o4.prototype.on, t.on("readable", function() {
            var n;
            for (a = !0; !r && null !== (n = t.read());) t.emit("data", n);
            null === n && (a = !1, t._readableState.needReadable = !0)
        }), t.pause = function() {
            r = !0, this.emit("pause")
        }, t.resume = function() {
            r = !1, a ? m.default.nextTick(function() {
                t.emit("readable")
            }) : this.read(0), this.emit("resume")
        }, t.emit("readable")
    }

    function sr(t, n) {
        var r, a = n.buffer,
            i = n.length,
            o = !!n.decoder,
            s = !!n.objectMode;
        if (0 === a.length) return null;
        if (0 === i) r = null;
        else if (s) r = a.shift();
        else if (!t || t >= i) r = o ? a.join("") : o0.concat(a, i), a.length = 0;
        else if (t < a[0].length) r = (d = a[0]).slice(0, t), a[0] = d.slice(t);
        else if (t === a[0].length) r = a.shift();
        else {
            r = o ? "" : new o0(t);
            for (var u = 0, l = 0, c = a.length; l < c && u < t; l++) {
                var d = a[0],
                    f = Math.min(t - u, d.length);
                o ? r += d.slice(0, f) : d.copy(r, u, 0, f), f < d.length ? a[0] = d.slice(f) : a.shift(), u += f
            }
        }
        return r
    }

    function sa(t) {
        var n = t._readableState;
        if (n.length > 0) throw Error("endReadable called on non-empty stream");
        !n.endEmitted && n.calledRead && (n.ended = !0, m.default.nextTick(function() {
            n.endEmitted || 0 !== n.length || (n.endEmitted = !0, t.readable = !1, t.emit("end"))
        }))
    }

    function si(t, n) {
        for (var r = 0, a = t.length; r < a; r++) n(t[r], r)
    }

    function so() {
        if (sx) return sw;
        sx = 1, sw = r;
        var t = Object.keys || function(t) {
            var n = [];
            for (var r in t) n.push(r);
            return n
        };
        oG.inherits = oz;
        var n = ss();

        function r(t) {
            if (!(this instanceof r)) return new r(t);
            o6.call(this, t), n.call(this, t), t && !1 === t.readable && (this.readable = !1), t && !1 === t.writable && (this.writable = !1), this.allowHalfOpen = !0, t && !1 === t.allowHalfOpen && (this.allowHalfOpen = !1), this.once("end", a)
        }

        function a() {
            this.allowHalfOpen || this._writableState.ended || m.default.nextTick(this.end.bind(this))
        }
        return oG.inherits(r, o6),
            function(t, n) {
                for (var r = 0, a = t.length; r < a; r++) n(t[r], r)
            }(t(n.prototype), function(t) {
                r.prototype[t] || (r.prototype[t] = n.prototype[t])
            }), sw
    }

    function ss() {
        if (sT) return sP;
        sT = 1, sP = i;
        var t = oA.default.Buffer;
        i.WritableState = a, oG.inherits = oz;
        var n = ok.default;

        function r(t, n, r) {
            this.chunk = t, this.encoding = n, this.callback = r
        }

        function a(t, n) {
            var r = (t = t || {}).highWaterMark;
            this.highWaterMark = r || 0 === r ? r : 16384, this.objectMode = !!t.objectMode, this.highWaterMark = ~~this.highWaterMark, this.needDrain = !1, this.ending = !1, this.ended = !1, this.finished = !1;
            var a = !1 === t.decodeStrings;
            this.decodeStrings = !a, this.defaultEncoding = t.defaultEncoding || "utf8", this.length = 0, this.writing = !1, this.sync = !0, this.bufferProcessing = !1, this.onwrite = function(t) {
                ! function(t, n) {
                    var r = t._writableState,
                        a = r.sync,
                        i = r.writecb;
                    if (r.writing = !1, r.writecb = null, r.length -= r.writelen, r.writelen = 0, n) a ? m.default.nextTick(function() {
                        i(n)
                    }) : i(n), t._writableState.errorEmitted = !0, t.emit("error", n);
                    else {
                        var l = u(t, r);
                        l || r.bufferProcessing || !r.buffer.length || function(t, n) {
                            n.bufferProcessing = !0;
                            for (var r = 0; r < n.buffer.length; r++) {
                                var a = n.buffer[r],
                                    i = a.chunk,
                                    s = a.encoding,
                                    u = a.callback;
                                if (o(t, n, n.objectMode ? 1 : i.length, i, s, u), n.writing) {
                                    r++;
                                    break
                                }
                            }
                            n.bufferProcessing = !1, r < n.buffer.length ? n.buffer = n.buffer.slice(r) : n.buffer.length = 0
                        }(t, r), a ? m.default.nextTick(function() {
                            s(t, r, l, i)
                        }) : s(t, r, l, i)
                    }
                }(n, t)
            }, this.writecb = null, this.writelen = 0, this.buffer = [], this.errorEmitted = !1
        }

        function i(t) {
            var r = so();
            if (!(this instanceof i || this instanceof r)) return new i(t);
            this._writableState = new a(t, this), this.writable = !0, n.call(this)
        }

        function o(t, n, r, a, i, o) {
            n.writelen = r, n.writecb = o, n.writing = !0, n.sync = !0, t._write(a, i, n.onwrite), n.sync = !1
        }

        function s(t, n, r, a) {
            r || 0 === n.length && n.needDrain && (n.needDrain = !1, t.emit("drain")), a(), r && l(t, n)
        }

        function u(t, n) {
            return n.ending && 0 === n.length && !n.finished && !n.writing
        }

        function l(t, n) {
            var r = u(0, n);
            return r && (n.finished = !0, t.emit("finish")), r
        }
        return oG.inherits(i, n), i.prototype.pipe = function() {
            this.emit("error", Error("Cannot pipe. Not readable."))
        }, i.prototype.write = function(n, a, i) {
            var s, u, l, c, d, f, p, h, v, y = this._writableState,
                g = !1;
            return "function" == typeof a && (i = a, a = null), t.isBuffer(n) ? a = "buffer" : a || (a = y.defaultEncoding), "function" != typeof i && (i = function() {}), y.ended ? (s = i, u = Error("write after end"), this.emit("error", u), m.default.nextTick(function() {
                s(u)
            })) : function(n, r, a, i) {
                var o = !0;
                if (!t.isBuffer(a) && "string" != typeof a && null != a && !r.objectMode) {
                    var s = TypeError("Invalid non-string/buffer chunk");
                    n.emit("error", s), m.default.nextTick(function() {
                        i(s)
                    }), o = !1
                }
                return o
            }(this, y, n, i) && (l = n, c = a, d = i, f = l, p = c, y.objectMode || !1 === y.decodeStrings || "string" != typeof f || (f = new t(f, p)), l = f, t.isBuffer(l) && (c = "buffer"), h = y.objectMode ? 1 : l.length, y.length += h, (v = y.length < y.highWaterMark) || (y.needDrain = !0), y.writing ? y.buffer.push(new r(l, c, d)) : o(this, y, h, l, c, d), g = v), g
        }, i.prototype._write = function(t, n, r) {
            r(Error("not implemented"))
        }, i.prototype.end = function(t, n, r) {
            var a, i = this._writableState;
            "function" == typeof t ? (r = t, t = null, n = null) : "function" == typeof n && (r = n, n = null), null != t && this.write(t, n), i.ending || i.finished || (a = r, i.ending = !0, l(this, i), a && (i.finished ? m.default.nextTick(a) : this.once("finish", a)), i.ended = !0)
        }, sP
    }
    oG.inherits = oz, oG.inherits(o6, o4), o6.prototype.push = function(t, n) {
        var r = this._readableState;
        return "string" != typeof t || r.objectMode || (n = n || r.defaultEncoding) !== r.encoding && (t = new o0(t, n), n = ""), o8(this, r, t, n, !1)
    }, o6.prototype.unshift = function(t) {
        return o8(this, this._readableState, t, "", !0)
    }, o6.prototype.setEncoding = function(t) {
        o2 || (o2 = oY().StringDecoder), this._readableState.decoder = new o2(t), this._readableState.encoding = t
    }, o6.prototype.read = function(t) {
        var n = this._readableState;
        n.calledRead = !0;
        var r, a = t;
        if (("number" != typeof t || t > 0) && (n.emittedReadable = !1), 0 === t && n.needReadable && (n.length >= n.highWaterMark || n.ended)) return o9(this), null;
        if (0 === (t = o5(t, n)) && n.ended) return r = null, n.length > 0 && n.decoder && (r = sr(t, n), n.length -= r.length), 0 === n.length && sa(this), r;
        var i = n.needReadable;
        return n.length - t <= n.highWaterMark && (i = !0), (n.ended || n.reading) && (i = !1), i && (n.reading = !0, n.sync = !0, 0 === n.length && (n.needReadable = !0), this._read(n.highWaterMark), n.sync = !1), i && !n.reading && (t = o5(a, n)), null === (r = t > 0 ? sr(t, n) : null) && (n.needReadable = !0, t = 0), n.length -= t, 0 !== n.length || n.ended || (n.needReadable = !0), n.ended && !n.endEmitted && 0 === n.length && sa(this), r
    }, o6.prototype._read = function(t) {
        this.emit("error", Error("not implemented"))
    }, o6.prototype.pipe = function(t, n) {
        var r = this,
            a = this._readableState;
        switch (a.pipesCount) {
            case 0:
                a.pipes = t;
                break;
            case 1:
                a.pipes = [a.pipes, t];
                break;
            default:
                a.pipes.push(t)
        }
        a.pipesCount += 1;
        var i = n && !1 === n.end || t === m.default.stdout || t === m.default.stderr ? l : s;

        function o(t) {
            t === r && l()
        }

        function s() {
            t.end()
        }
        a.endEmitted ? m.default.nextTick(i) : r.once("end", i), t.on("unpipe", o);
        var u = function() {
            var t = r._readableState;
            t.awaitDrain--, 0 === t.awaitDrain && se(r)
        };

        function l() {
            t.removeListener("close", d), t.removeListener("finish", f), t.removeListener("drain", u), t.removeListener("error", c), t.removeListener("unpipe", o), r.removeListener("end", s), r.removeListener("end", l), t._writableState && !t._writableState.needDrain || u()
        }

        function c(n) {
            p(), t.removeListener("error", c), 0 === o1.listenerCount(t, "error") && t.emit("error", n)
        }

        function d() {
            t.removeListener("finish", f), p()
        }

        function f() {
            t.removeListener("close", d), p()
        }

        function p() {
            r.unpipe(t)
        }
        return t.on("drain", u), t._events && t._events.error ? oF(t._events.error) ? t._events.error.unshift(c) : t._events.error = [c, t._events.error] : t.on("error", c), t.once("close", d), t.once("finish", f), t.emit("pipe", r), a.flowing || (this.on("readable", st), a.flowing = !0, m.default.nextTick(function() {
            se(r)
        })), t
    }, o6.prototype.unpipe = function(t) {
        var n = this._readableState;
        if (0 === n.pipesCount) return this;
        if (1 === n.pipesCount) return t && t !== n.pipes || (t || (t = n.pipes), n.pipes = null, n.pipesCount = 0, this.removeListener("readable", st), n.flowing = !1, t && t.emit("unpipe", this)), this;
        if (!t) {
            var r = n.pipes,
                a = n.pipesCount;
            n.pipes = null, n.pipesCount = 0, this.removeListener("readable", st), n.flowing = !1;
            for (var i = 0; i < a; i++) r[i].emit("unpipe", this);
            return this
        }
        return -1 === (i = function(t, n) {
            for (var r = 0, a = t.length; r < a; r++)
                if (t[r] === n) return r;
            return -1
        }(n.pipes, t)) || (n.pipes.splice(i, 1), n.pipesCount -= 1, 1 === n.pipesCount && (n.pipes = n.pipes[0]), t.emit("unpipe", this)), this
    }, o6.prototype.on = function(t, n) {
        var r = o4.prototype.on.call(this, t, n);
        if ("data" !== t || this._readableState.flowing || sn(this), "readable" === t && this.readable) {
            var a = this._readableState;
            a.readableListening || (a.readableListening = !0, a.emittedReadable = !1, a.needReadable = !0, a.reading ? a.length && o9(this) : this.read(0))
        }
        return r
    }, o6.prototype.addListener = o6.prototype.on, o6.prototype.resume = function() {
        sn(this), this.read(0), this.emit("resume")
    }, o6.prototype.pause = function() {
        sn(this, !0), this.emit("pause")
    }, o6.prototype.wrap = function(t) {
        var n = this._readableState,
            r = !1,
            a = this;
        for (var i in t.on("end", function() {
                if (n.decoder && !n.ended) {
                    var t = n.decoder.end();
                    t && t.length && a.push(t)
                }
                a.push(null)
            }), t.on("data", function(i) {
                n.decoder && (i = n.decoder.write(i)), n.objectMode && null == i || (n.objectMode || i && i.length) && (a.push(i) || (r = !0, t.pause()))
            }), t) "function" == typeof t[i] && void 0 === this[i] && (this[i] = function(n) {
            return function() {
                return t[n].apply(t, arguments)
            }
        }(i));
        return si(["error", "close", "destroy", "pause", "resume"], function(n) {
            t.on(n, a.emit.bind(a, n))
        }), a._read = function(n) {
            r && (r = !1, t.resume())
        }, a
    }, o6._fromList = sr;
    var su = so();

    function sl(t, n) {
        this.afterTransform = function(t, r) {
            var a = n._transformState;
            a.transforming = !1;
            var i = a.writecb;
            if (!i) return n.emit("error", Error("no writecb in Transform class"));
            a.writechunk = null, a.writecb = null, null != r && n.push(r), i && i(t);
            var o = n._readableState;
            o.reading = !1, (o.needReadable || o.length < o.highWaterMark) && n._read(o.highWaterMark)
        }, this.needTransform = !1, this.transforming = !1, this.writecb = null, this.writechunk = null
    }

    function sc(t) {
        if (!(this instanceof sc)) return new sc(t);
        su.call(this, t), this._transformState = new sl(t, this);
        var n = this;
        this._readableState.needReadable = !0, this._readableState.sync = !1, this.once("finish", function() {
            "function" == typeof this._flush ? this._flush(function(t) {
                sd(n, t)
            }) : sd(n)
        })
    }

    function sd(t, n) {
        if (n) return t.emit("error", n);
        var r = t._writableState;
        t._readableState;
        var a = t._transformState;
        if (r.length) throw Error("calling transform done when ws.length != 0");
        if (a.transforming) throw Error("calling transform done when still transforming");
        return t.push(null)
    }

    function sf(t) {
        if (!(this instanceof sf)) return new sf(t);
        sc.call(this, t)
    }
    oG.inherits = oz, oG.inherits(sc, su), sc.prototype.push = function(t, n) {
        return this._transformState.needTransform = !1, su.prototype.push.call(this, t, n)
    }, sc.prototype._transform = function(t, n, r) {
        throw Error("not implemented")
    }, sc.prototype._write = function(t, n, r) {
        var a = this._transformState;
        if (a.writecb = r, a.writechunk = t, a.writeencoding = n, !a.transforming) {
            var i = this._readableState;
            (a.needTransform || i.needReadable || i.length < i.highWaterMark) && this._read(i.highWaterMark)
        }
    }, sc.prototype._read = function(t) {
        var n = this._transformState;
        null !== n.writechunk && n.writecb && !n.transforming ? (n.transforming = !0, this._transform(n.writechunk, n.writeencoding, n.afterTransform)) : n.needTransform = !0
    }, oG.inherits = oz, oG.inherits(sf, sc), sf.prototype._transform = function(t, n, r) {
        r(null, t)
    }, sR = oU, sS = ok.default, (sR = ({
        get exports() {
            return oU
        },
        set exports(e) {
            oU = e
        }
    }).exports = o6).Stream = sS, sR.Readable = sR, sR.Writable = ss(), sR.Duplex = so(), sR.Transform = sc, sR.PassThrough = sf;
    var sp = function(t, n, r) {
            if ("number" == typeof t) throw TypeError('"value" argument must not be a number');
            return "ArrayBuffer" === oB.call(t).slice(8, -1) ? function(t, n, r) {
                n >>>= 0;
                var a = t.byteLength - n;
                if (a < 0) throw RangeError("'offset' is out of bounds");
                if (void 0 === r) r = a;
                else if ((r >>>= 0) > a) throw RangeError("'length' is out of bounds");
                return oV ? oE.Buffer.from(t.slice(n, n + r)) : new oE.Buffer(new Uint8Array(t.slice(n, n + r)))
            }(t, n, r) : "string" == typeof t ? function(t, n) {
                if ("string" == typeof n && "" !== n || (n = "utf8"), !oE.Buffer.isEncoding(n)) throw TypeError('"encoding" must be a valid string encoding');
                return oV ? oE.Buffer.from(t, n) : new oE.Buffer(t, n)
            }(t, n) : oV ? oE.Buffer.from(t) : new oE.Buffer(t)
        },
        sh = oU.Transform;
    oz(sm, sh);
    var sv = {
        endScript: sp("</script"),
        endStyle: sp("</style"),
        endTitle: sp("</title"),
        comment: sp("<!--"),
        endComment: sp("-->"),
        cdata: sp("<![CDATA["),
        endCdata: sp("]]>")
    };

    function sm() {
        if (!(this instanceof sm)) return new sm;
        sh.call(this), this._readableState.objectMode = !0, this.state = "text", this.tagState = null, this.quoteState = null, this.raw = null, this.buffers = [], this._last = []
    }

    function sy(t, n) {
        if (t.length < n.length) return !1;
        for (var r = t.length - 1, a = n.length - 1; r >= 0 && a >= 0; r--, a--)
            if (sg(t[r]) !== sg(n[a])) return !1;
        return !0
    }

    function sg(t) {
        return t >= 65 && t <= 90 ? t + 32 : t
    }

    function sb(t) {
        return 32 === t || 9 === t || 10 === t || 12 === t || 13 === t
    }
    sm.prototype._transform = function(t, n, r) {
        var a = 0,
            i = 0;
        for (this._prev && (t = oE.Buffer.concat([this._prev, t]), a = this._prev.length - 1, i = this._offset, this._prev = null, this._offset = 0); a < t.length; a++) {
            var o = t[a];
            if (this._last.push(o), this._last.length > 9 && this._last.shift(), this.raw) {
                var s = this._testRaw(t, i, a);
                s && (this.push(["text", s[0]]), this.raw === sv.endComment || this.raw === sv.endCdata ? (this.state = "text", this.buffers = [], this.push(["close", s[1]])) : (this.state = "open", this.buffers = [s[1]]), this.raw = null, i = a + 1)
            } else {
                if ("text" === this.state && 60 === o && a === t.length - 1) return this._prev = t, this._offset = i, r();
                if ("text" !== this.state || 60 !== o || sb(t[a + 1]))
                    if (1 === this.tagState && sb(o)) this.tagState = 2;
                    else if (2 === this.tagState && 61 === o) this.tagState = 3;
                else if (3 === this.tagState && sb(o));
                else if (3 === this.tagState && 62 !== o) this.tagState = 4, this.quoteState = 34 === o ? "double" : 39 === o ? "single" : null;
                else if (4 === this.tagState && !this.quoteState && sb(o)) this.tagState = 2;
                else if (4 === this.tagState && "double" === this.quoteState && 34 === o) this.quoteState = null, this.tagState = 2;
                else if (4 === this.tagState && "single" === this.quoteState && 39 === o) this.quoteState = null, this.tagState = 2;
                else if ("open" !== this.state || 62 !== o || this.quoteState) "open" === this.state && sy(this._last, sv.comment) ? (this.buffers.push(t.slice(i, a + 1)), i = a + 1, this.state = "text", this.raw = sv.endComment, this._pushState("open")) : "open" === this.state && sy(this._last, sv.cdata) && (this.buffers.push(t.slice(i, a + 1)), i = a + 1, this.state = "text", this.raw = sv.endCdata, this._pushState("open"));
                else if (this.buffers.push(t.slice(i, a + 1)), i = a + 1, this.state = "text", this.tagState = null, 47 === this._getChar(1)) this._pushState("close");
                else {
                    var u = this._getTag();
                    "script" === u && (this.raw = sv.endScript), "style" === u && (this.raw = sv.endStyle), "title" === u && (this.raw = sv.endTitle), this._pushState("open")
                } else a > 0 && a - i > 0 && this.buffers.push(t.slice(i, a)), i = a, this.state = "open", this.tagState = 1, this._pushState("text")
            }
        }
        i < t.length && this.buffers.push(t.slice(i)), r()
    }, sm.prototype._flush = function(t) {
        "text" === this.state && this._pushState("text"), this.push(null), t()
    }, sm.prototype._pushState = function(t) {
        if (0 !== this.buffers.length) {
            var n = oE.Buffer.concat(this.buffers);
            this.buffers = [], this.push([t, n])
        }
    }, sm.prototype._getChar = function(t) {
        for (var n = 0, r = 0; r < this.buffers.length; r++) {
            var a = this.buffers[r];
            if (n + a.length > t) return a[t - n];
            n += a
        }
    }, sm.prototype._getTag = function() {
        for (var t = 0, n = "", r = 0; r < this.buffers.length; r++) {
            for (var a = this.buffers[r], i = 0; i < a.length; i++)
                if (0 !== t || 0 !== i) {
                    var o = String.fromCharCode(a[i]);
                    if (/[^\w-!\[\]]/.test(o)) return n.toLowerCase();
                    n += o
                } t += a.length
        }
    }, sm.prototype._testRaw = function(t, n, r) {
        var a = this.raw;
        if (sy(this._last, a)) {
            this.buffers.push(t.slice(n, r + 1));
            var i = (t = oE.Buffer.concat(this.buffers)).length - a.length;
            return [t.slice(0, i), t.slice(i)]
        }
    };
    var sw, sx, sP, sT, sR, sS, sE, sq, sk, sA = {},
        sC = {},
        sI = {},
        sj = {
            get exports() {
                return sI
            },
            set exports(e) {
                sI = e
            }
        };

    function sL() {
        return sE || (sE = 1, void 0 !== m.default && m.default.version && 0 !== m.default.version.indexOf("v0.") && (0 !== m.default.version.indexOf("v1.") || 0 === m.default.version.indexOf("v1.8.")) ? sj.exports = m.default : sj.exports = {
            nextTick: function(t, n, r, a) {
                if ("function" != typeof t) throw TypeError('"callback" argument must be a function');
                var i, o, s = arguments.length;
                switch (s) {
                    case 0:
                    case 1:
                        return m.default.nextTick(t);
                    case 2:
                        return m.default.nextTick(function() {
                            t.call(null, n)
                        });
                    case 3:
                        return m.default.nextTick(function() {
                            t.call(null, n, r)
                        });
                    case 4:
                        return m.default.nextTick(function() {
                            t.call(null, n, r, a)
                        });
                    default:
                        for (i = Array(s - 1), o = 0; o < i.length;) i[o++] = arguments[o];
                        return m.default.nextTick(function() {
                            t.apply(null, i)
                        })
                }
            }
        }), sI
    }
    var sN, sO = {},
        sD = {
            get exports() {
                return sO
            },
            set exports(e) {
                sO = e
            }
        };

    function sM() {
        return sN || (sN = 1, sD.exports = ok.default), sO
    }
    var s_, sB = {},
        sV = {
            get exports() {
                return sB
            },
            set exports(e) {
                sB = e
            }
        };

    function sU() {
        return s_ || (s_ = 1, function(t, n) {
            var r = oA.default,
                a = r.Buffer;

            function i(t, n) {
                for (var r in t) n[r] = t[r]
            }

            function o(t, n, r) {
                return a(t, n, r)
            }
            a.from && a.alloc && a.allocUnsafe && a.allocUnsafeSlow ? t.exports = r : (i(r, n), n.Buffer = o), i(a, o), o.from = function(t, n, r) {
                if ("number" == typeof t) throw TypeError("Argument must not be a number");
                return a(t, n, r)
            }, o.alloc = function(t, n, r) {
                if ("number" != typeof t) throw TypeError("Argument must be a number");
                var i = a(t);
                return void 0 !== n ? "string" == typeof r ? i.fill(n, r) : i.fill(n) : i.fill(0), i
            }, o.allocUnsafe = function(t) {
                if ("number" != typeof t) throw TypeError("Argument must be a number");
                return a(t)
            }, o.allocUnsafeSlow = function(t) {
                if ("number" != typeof t) throw TypeError("Argument must be a number");
                return r.SlowBuffer(t)
            }
        }(sV, sB)), sB
    }
    var sF, sG, sK, sW, sz, sH, sJ, sQ, sX, s$ = {},
        sZ = {
            get exports() {
                return s$
            },
            set exports(e) {
                s$ = e
            }
        };

    function sY() {
        if (sK) return sG;
        sK = 1;
        var t = sL();

        function n(t, n) {
            t.emit("error", n)
        }
        return sG = {
            destroy: function(r, a) {
                var i = this,
                    o = this._readableState && this._readableState.destroyed,
                    s = this._writableState && this._writableState.destroyed;
                return o || s ? a ? a(r) : !r || this._writableState && this._writableState.errorEmitted || t.nextTick(n, this, r) : (this._readableState && (this._readableState.destroyed = !0), this._writableState && (this._writableState.destroyed = !0), this._destroy(r || null, function(r) {
                    !a && r ? (t.nextTick(n, i, r), i._writableState && (i._writableState.errorEmitted = !0)) : a && a(r)
                })), this
            },
            undestroy: function() {
                this._readableState && (this._readableState.destroyed = !1, this._readableState.reading = !1, this._readableState.ended = !1, this._readableState.endEmitted = !1), this._writableState && (this._writableState.destroyed = !1, this._writableState.ended = !1, this._writableState.ending = !1, this._writableState.finished = !1, this._writableState.errorEmitted = !1)
            }
        }
    }

    function s0() {
        if (sJ) return sH;
        sJ = 1;
        var t = sL();

        function n(t) {
            var n = this;
            this.next = null, this.entry = null, this.finish = function() {
                var r = n.entry;
                for (n.entry = null; r;) {
                    var a = r.callback;
                    t.pendingcb--, a(void 0), r = r.next
                }
                t.corkedRequestsFree ? t.corkedRequestsFree.next = n : t.corkedRequestsFree = n
            }
        }
        sH = h;
        var r, a = t.nextTick;
        h.WritableState = p;
        var i = Object.create(oG);
        i.inherits = oz;
        var o, s = {
                deprecate: sz ? sW : (sz = 1, sW = oj.default.deprecate)
            },
            u = sM(),
            l = sU().Buffer,
            c = oI.c.Uint8Array || function() {},
            d = sY();

        function f() {}

        function p(i, o) {
            r = r || s1(), i = i || {};
            var s = o instanceof r;
            this.objectMode = !!i.objectMode, s && (this.objectMode = this.objectMode || !!i.writableObjectMode);
            var u = i.highWaterMark,
                l = i.writableHighWaterMark,
                c = this.objectMode ? 16 : 16384;
            this.highWaterMark = u || 0 === u ? u : s && (l || 0 === l) ? l : c, this.highWaterMark = Math.floor(this.highWaterMark), this.finalCalled = !1, this.needDrain = !1, this.ending = !1, this.ended = !1, this.finished = !1, this.destroyed = !1;
            var d = !1 === i.decodeStrings;
            this.decodeStrings = !d, this.defaultEncoding = i.defaultEncoding || "utf8", this.length = 0, this.writing = !1, this.corked = 0, this.sync = !0, this.bufferProcessing = !1, this.onwrite = function(n) {
                ! function(n, r) {
                    var i = n._writableState,
                        o = i.sync,
                        s = i.writecb;
                    if (i.writing = !1, i.writecb = null, i.length -= i.writelen, i.writelen = 0, r) --i.pendingcb, o ? (t.nextTick(s, r), t.nextTick(w, n, i), n._writableState.errorEmitted = !0, n.emit("error", r)) : (s(r), n._writableState.errorEmitted = !0, n.emit("error", r), w(n, i));
                    else {
                        var u = g(i);
                        u || i.corked || i.bufferProcessing || !i.bufferedRequest || y(n, i), o ? a(m, n, i, u, s) : m(n, i, u, s)
                    }
                }(o, n)
            }, this.writecb = null, this.writelen = 0, this.bufferedRequest = null, this.lastBufferedRequest = null, this.pendingcb = 0, this.prefinished = !1, this.errorEmitted = !1, this.bufferedRequestCount = 0, this.corkedRequestsFree = new n(this)
        }

        function h(t) {
            if (r = r || s1(), !(o.call(h, this) || this instanceof r)) return new h(t);
            this._writableState = new p(t, this), this.writable = !0, t && ("function" == typeof t.write && (this._write = t.write), "function" == typeof t.writev && (this._writev = t.writev), "function" == typeof t.destroy && (this._destroy = t.destroy), "function" == typeof t.final && (this._final = t.final)), u.call(this)
        }

        function v(t, n, r, a, i, o, s) {
            n.writelen = a, n.writecb = s, n.writing = !0, n.sync = !0, r ? t._writev(i, n.onwrite) : t._write(i, o, n.onwrite), n.sync = !1
        }

        function m(t, n, r, a) {
            r || 0 === n.length && n.needDrain && (n.needDrain = !1, t.emit("drain")), n.pendingcb--, a(), w(t, n)
        }

        function y(t, r) {
            r.bufferProcessing = !0;
            var a = r.bufferedRequest;
            if (t._writev && a && a.next) {
                var i = Array(r.bufferedRequestCount),
                    o = r.corkedRequestsFree;
                o.entry = a;
                for (var s = 0, u = !0; a;) i[s] = a, a.isBuf || (u = !1), a = a.next, s += 1;
                i.allBuffers = u, v(t, r, !0, r.length, i, "", o.finish), r.pendingcb++, r.lastBufferedRequest = null, o.next ? (r.corkedRequestsFree = o.next, o.next = null) : r.corkedRequestsFree = new n(r), r.bufferedRequestCount = 0
            } else {
                for (; a;) {
                    var l = a.chunk,
                        c = a.encoding,
                        d = a.callback;
                    if (v(t, r, !1, r.objectMode ? 1 : l.length, l, c, d), a = a.next, r.bufferedRequestCount--, r.writing) break
                }
                null === a && (r.lastBufferedRequest = null)
            }
            r.bufferedRequest = a, r.bufferProcessing = !1
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
            var a = g(r);
            return a && (r.prefinished || r.finalCalled || ("function" == typeof n._final ? (r.pendingcb++, r.finalCalled = !0, t.nextTick(b, n, r)) : (r.prefinished = !0, n.emit("prefinish"))), 0 === r.pendingcb && (r.finished = !0, n.emit("finish"))), a
        }
        return i.inherits(h, u), p.prototype.getBuffer = function() {
                for (var t = this.bufferedRequest, n = []; t;) n.push(t), t = t.next;
                return n
            },
            function() {
                try {
                    Object.defineProperty(p.prototype, "buffer", {
                        get: s.deprecate(function() {
                            return this.getBuffer()
                        }, "_writableState.buffer is deprecated. Use _writableState.getBuffer instead.", "DEP0003")
                    })
                } catch (t) {}
            }(), "function" == typeof Symbol && Symbol.hasInstance && "function" == typeof Function.prototype[Symbol.hasInstance] ? (o = Function.prototype[Symbol.hasInstance], Object.defineProperty(h, Symbol.hasInstance, {
                value: function(t) {
                    return !!o.call(this, t) || this === h && t && t._writableState instanceof p
                }
            })) : o = function(t) {
                return t instanceof this
            }, h.prototype.pipe = function() {
                this.emit("error", Error("Cannot pipe, not readable"))
            }, h.prototype.write = function(n, r, a) {
                var i, o, s, u, d, p, h, m, y = this._writableState,
                    g = !1,
                    b = !y.objectMode && (m = n, l.isBuffer(m) || m instanceof c);
                return b && !l.isBuffer(n) && (i = n, n = l.from(i)), "function" == typeof r && (a = r, r = null), b ? r = "buffer" : r || (r = y.defaultEncoding), "function" != typeof a && (a = f), y.ended ? (o = a, s = Error("write after end"), this.emit("error", s), t.nextTick(o, s)) : (b || (u = n, d = a, p = !0, h = !1, null === u ? h = TypeError("May not write null values to stream") : "string" == typeof u || void 0 === u || y.objectMode || (h = TypeError("Invalid non-string/buffer chunk")), h && (this.emit("error", h), t.nextTick(d, h), p = !1), p)) && (y.pendingcb++, g = function(t, n, r, a, i, o) {
                    if (!r) {
                        var s, u, c = (s = a, u = i, n.objectMode || !1 === n.decodeStrings || "string" != typeof s || (s = l.from(s, u)), s);
                        a !== c && (r = !0, i = "buffer", a = c)
                    }
                    var d = n.objectMode ? 1 : a.length;
                    n.length += d;
                    var f = n.length < n.highWaterMark;
                    if (f || (n.needDrain = !0), n.writing || n.corked) {
                        var p = n.lastBufferedRequest;
                        n.lastBufferedRequest = {
                            chunk: a,
                            encoding: i,
                            isBuf: r,
                            callback: o,
                            next: null
                        }, p ? p.next = n.lastBufferedRequest : n.bufferedRequest = n.lastBufferedRequest, n.bufferedRequestCount += 1
                    } else v(t, n, !1, d, a, i, o);
                    return f
                }(this, y, b, n, r, a)), g
            }, h.prototype.cork = function() {
                this._writableState.corked++
            }, h.prototype.uncork = function() {
                var t = this._writableState;
                t.corked && (t.corked--, t.writing || t.corked || t.finished || t.bufferProcessing || !t.bufferedRequest || y(this, t))
            }, h.prototype.setDefaultEncoding = function(t) {
                if ("string" == typeof t && (t = t.toLowerCase()), !(["hex", "utf8", "utf-8", "ascii", "binary", "base64", "ucs2", "ucs-2", "utf16le", "utf-16le", "raw"].indexOf((t + "").toLowerCase()) > -1)) throw TypeError("Unknown encoding: " + t);
                return this._writableState.defaultEncoding = t, this
            }, Object.defineProperty(h.prototype, "writableHighWaterMark", {
                enumerable: !1,
                get: function() {
                    return this._writableState.highWaterMark
                }
            }), h.prototype._write = function(t, n, r) {
                r(Error("_write() is not implemented"))
            }, h.prototype._writev = null, h.prototype.end = function(n, r, a) {
                var i, o = this._writableState;
                "function" == typeof n ? (a = n, n = null, r = null) : "function" == typeof r && (a = r, r = null), null != n && this.write(n, r), o.corked && (o.corked = 1, this.uncork()), o.ending || o.finished || (i = a, o.ending = !0, w(this, o), i && (o.finished ? t.nextTick(i) : this.once("finish", i)), o.ended = !0, this.writable = !1)
            }, Object.defineProperty(h.prototype, "destroyed", {
                get: function() {
                    return void 0 !== this._writableState && this._writableState.destroyed
                },
                set: function(t) {
                    this._writableState && (this._writableState.destroyed = t)
                }
            }), h.prototype.destroy = d.destroy, h.prototype._undestroy = d.undestroy, h.prototype._destroy = function(t, n) {
                this.end(), n(t)
            }, sH
    }

    function s1() {
        if (sX) return sQ;
        sX = 1;
        var t = sL(),
            n = Object.keys || function(t) {
                var n = [];
                for (var r in t) n.push(r);
                return n
            };
        sQ = l;
        var r = Object.create(oG);
        r.inherits = oz;
        var a = ut(),
            i = s0();
        r.inherits(l, a);
        for (var o = n(i.prototype), s = 0; s < o.length; s++) {
            var u = o[s];
            l.prototype[u] || (l.prototype[u] = i.prototype[u])
        }

        function l(t) {
            if (!(this instanceof l)) return new l(t);
            a.call(this, t), i.call(this, t), t && !1 === t.readable && (this.readable = !1), t && !1 === t.writable && (this.writable = !1), this.allowHalfOpen = !0, t && !1 === t.allowHalfOpen && (this.allowHalfOpen = !1), this.once("end", c)
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
        }, sQ
    }
    var s2, s4, s3, s6, s8, s5, s9, s7 = {};

    function ue() {
        if (s2) return s7;
        s2 = 1;
        var t = sU().Buffer,
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
            var a;
            switch (this.encoding = function(r) {
                    var a = function(t) {
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
                    if ("string" != typeof a && (t.isEncoding === n || !n(r))) throw Error("Unknown encoding: " + r);
                    return a || r
                }(r), this.encoding) {
                case "utf16le":
                    this.text = o, this.end = s, a = 4;
                    break;
                case "utf8":
                    this.fillLast = i, a = 4;
                    break;
                case "base64":
                    this.text = u, this.end = l, a = 3;
                    break;
                default:
                    return this.write = c, void(this.end = d)
            }
            this.lastNeed = 0, this.lastTotal = 0, this.lastChar = t.allocUnsafe(a)
        }

        function a(t) {
            return t <= 127 ? 0 : t >> 5 == 6 ? 2 : t >> 4 == 14 ? 3 : t >> 3 == 30 ? 4 : t >> 6 == 2 ? -1 : -2
        }

        function i(t) {
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
                    var a = r.charCodeAt(r.length - 1);
                    if (a >= 55296 && a <= 56319) return this.lastNeed = 2, this.lastTotal = 4, this.lastChar[0] = t[t.length - 2], this.lastChar[1] = t[t.length - 1], r.slice(0, -1)
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
        return s7.StringDecoder = r, r.prototype.write = function(t) {
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
                var i = n.length - 1;
                if (i < r) return 0;
                var o = a(n[i]);
                return o >= 0 ? (o > 0 && (t.lastNeed = o - 1), o) : --i < r || -2 === o ? 0 : (o = a(n[i])) >= 0 ? (o > 0 && (t.lastNeed = o - 2), o) : --i < r || -2 === o ? 0 : (o = a(n[i])) >= 0 ? (o > 0 && (2 === o ? o = 0 : t.lastNeed = o - 3), o) : 0
            }(this, t, n);
            if (!this.lastNeed) return t.toString("utf8", n);
            this.lastTotal = r;
            var i = t.length - (r - this.lastNeed);
            return t.copy(this.lastChar, 0, i), t.toString("utf8", n, i)
        }, r.prototype.fillLast = function(t) {
            if (this.lastNeed <= t.length) return t.copy(this.lastChar, this.lastTotal - this.lastNeed, 0, this.lastNeed), this.lastChar.toString(this.encoding, 0, this.lastTotal);
            t.copy(this.lastChar, this.lastTotal - this.lastNeed, 0, t.length), this.lastNeed -= t.length
        }, s7
    }

    function ut() {
        if (s3) return s4;
        s3 = 1;
        var t = sL();
        s4 = b;
        var n, r = function() {
            if (sk) return sq;
            sk = 1;
            var t = {}.toString;
            return sq = Array.isArray || function(n) {
                return "[object Array]" == t.call(n)
            }
        }();
        b.ReadableState = g, oC.default.EventEmitter;
        var a = function(t, n) {
                return t.listeners(n).length
            },
            i = sM(),
            o = sU().Buffer,
            s = oI.c.Uint8Array || function() {},
            u = Object.create(oG);
        u.inherits = oz;
        var l = oj.default,
            c = void 0;
        c = l && l.debuglog ? l.debuglog("stream") : function() {};
        var d, f, p, h = (sF || (sF = 1, d = sU().Buffer, f = oj.default, sZ.exports = function() {
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
                    for (var n, r, a = d.allocUnsafe(t >>> 0), i = this.head, o = 0; i;) n = i.data, r = o, n.copy(a, r), o += i.data.length, i = i.next;
                    return a
                }, t
            }(), f && f.inspect && f.inspect.custom && (sZ.exports.prototype[f.inspect.custom] = function() {
                var t = f.inspect({
                    length: this.length
                });
                return this.constructor.name + " " + t
            })), s$),
            v = sY();
        u.inherits(b, i);
        var y = ["error", "close", "destroy", "pause", "resume"];

        function g(t, r) {
            t = t || {};
            var a = r instanceof(n = n || s1());
            this.objectMode = !!t.objectMode, a && (this.objectMode = this.objectMode || !!t.readableObjectMode);
            var i = t.highWaterMark,
                o = t.readableHighWaterMark,
                s = this.objectMode ? 16 : 16384;
            this.highWaterMark = i || 0 === i ? i : a && (o || 0 === o) ? o : s, this.highWaterMark = Math.floor(this.highWaterMark), this.buffer = new h, this.length = 0, this.pipes = null, this.pipesCount = 0, this.flowing = null, this.ended = !1, this.endEmitted = !1, this.reading = !1, this.sync = !0, this.needReadable = !1, this.emittedReadable = !1, this.readableListening = !1, this.resumeScheduled = !1, this.destroyed = !1, this.defaultEncoding = t.defaultEncoding || "utf8", this.awaitDrain = 0, this.readingMore = !1, this.decoder = null, this.encoding = null, t.encoding && (p || (p = ue().StringDecoder), this.decoder = new p(t.encoding), this.encoding = t.encoding)
        }

        function b(t) {
            if (n = n || s1(), !(this instanceof b)) return new b(t);
            this._readableState = new g(t, this), this.readable = !0, t && ("function" == typeof t.read && (this._read = t.read), "function" == typeof t.destroy && (this._destroy = t.destroy)), i.call(this)
        }

        function w(t, n, r, a, i) {
            var u, l, c, d, f, p = t._readableState;
            return null === n ? (p.reading = !1, function(t, n) {
                if (!n.ended) {
                    if (n.decoder) {
                        var r = n.decoder.end();
                        r && r.length && (n.buffer.push(r), n.length += n.objectMode ? 1 : r.length)
                    }
                    n.ended = !0, T(t)
                }
            }(t, p)) : (i || (u = p, l = n, o.isBuffer(l) || l instanceof s || "string" == typeof l || void 0 === l || u.objectMode || (c = TypeError("Invalid non-string/buffer chunk")), f = c), f ? t.emit("error", f) : p.objectMode || n && n.length > 0 ? ("string" == typeof n || p.objectMode || Object.getPrototypeOf(n) === o.prototype || (d = n, n = o.from(d)), a ? p.endEmitted ? t.emit("error", Error("stream.unshift() after end event")) : x(t, p, n, !0) : p.ended ? t.emit("error", Error("stream.push() after EOF")) : (p.reading = !1, p.decoder && !r ? (n = p.decoder.write(n), p.objectMode || 0 !== n.length ? x(t, p, n, !1) : S(t, p)) : x(t, p, n, !1))) : a || (p.reading = !1)), !p.ended && (p.needReadable || p.length < p.highWaterMark || 0 === p.length)
        }

        function x(t, n, r, a) {
            n.flowing && 0 === n.length && !n.sync ? (t.emit("data", r), t.read(0)) : (n.length += n.objectMode ? 1 : r.length, a ? n.buffer.unshift(r) : n.buffer.push(r), n.needReadable && T(t)), S(t, n)
        }

        function P(t, n) {
            var r;
            return t <= 0 || 0 === n.length && n.ended ? 0 : n.objectMode ? 1 : t != t ? n.flowing && n.length ? n.buffer.head.data.length : n.length : (t > n.highWaterMark && ((r = t) >= 8388608 ? r = 8388608 : (r--, r |= r >>> 1, r |= r >>> 2, r |= r >>> 4, r |= r >>> 8, r |= r >>> 16, r++), n.highWaterMark = r), t <= n.length ? t : n.ended ? n.length : (n.needReadable = !0, 0))
        }

        function T(n) {
            var r = n._readableState;
            r.needReadable = !1, r.emittedReadable || (c("emitReadable", r.flowing), r.emittedReadable = !0, r.sync ? t.nextTick(R, n) : R(n))
        }

        function R(t) {
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
            var r, a, i, s;
            return 0 === n.length ? null : (n.objectMode ? r = n.buffer.shift() : !t || t >= n.length ? (r = n.decoder ? n.buffer.join("") : 1 === n.buffer.length ? n.buffer.head.data : n.buffer.concat(n.length), n.buffer.clear()) : (a = n.buffer, i = n.decoder, t < a.head.data.length ? (s = a.head.data.slice(0, t), a.head.data = a.head.data.slice(t)) : s = t === a.head.data.length ? a.shift() : i ? function(t, n) {
                var r = n.head,
                    a = 1,
                    i = r.data;
                for (t -= i.length; r = r.next;) {
                    var o = r.data,
                        s = t > o.length ? o.length : t;
                    if (s === o.length ? i += o : i += o.slice(0, t), 0 == (t -= s)) {
                        s === o.length ? (++a, r.next ? n.head = r.next : n.head = n.tail = null) : (n.head = r, r.data = o.slice(s));
                        break
                    }++a
                }
                return n.length -= a, i
            }(t, a) : function(t, n) {
                var r = o.allocUnsafe(t),
                    a = n.head,
                    i = 1;
                for (a.data.copy(r), t -= a.data.length; a = a.next;) {
                    var s = a.data,
                        u = t > s.length ? s.length : t;
                    if (s.copy(r, r.length - t, 0, u), 0 == (t -= u)) {
                        u === s.length ? (++i, a.next ? n.head = a.next : n.head = n.tail = null) : (n.head = a, a.data = s.slice(u));
                        break
                    }++i
                }
                return n.length -= i, r
            }(t, a), r = s), r)
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
            for (var r = 0, a = t.length; r < a; r++)
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
        }), b.prototype.destroy = v.destroy, b.prototype._undestroy = v.undestroy, b.prototype._destroy = function(t, n) {
            this.push(null), n(t)
        }, b.prototype.push = function(t, n) {
            var r, a = this._readableState;
            return a.objectMode ? r = !0 : "string" == typeof t && ((n = n || a.defaultEncoding) !== a.encoding && (t = o.from(t, n), n = ""), r = !0), w(this, t, n, !1, r)
        }, b.prototype.unshift = function(t) {
            return w(this, t, null, !0, !1)
        }, b.prototype.isPaused = function() {
            return !1 === this._readableState.flowing
        }, b.prototype.setEncoding = function(t) {
            return p || (p = ue().StringDecoder), this._readableState.decoder = new p(t), this._readableState.encoding = t, this
        }, b.prototype.read = function(t) {
            c("read", t), t = parseInt(t, 10);
            var n = this._readableState,
                r = t;
            if (0 !== t && (n.emittedReadable = !1), 0 === t && n.needReadable && (n.length >= n.highWaterMark || n.ended)) return c("read: emitReadable", n.length, n.ended), 0 === n.length && n.ended ? I(this) : T(this), null;
            if (0 === (t = P(t, n)) && n.ended) return 0 === n.length && I(this), null;
            var a, i = n.needReadable;
            return c("need readable", i), (0 === n.length || n.length - t < n.highWaterMark) && c("length less than watermark", i = !0), n.ended || n.reading ? c("reading or ended", i = !1) : i && (c("do read"), n.reading = !0, n.sync = !0, 0 === n.length && (n.needReadable = !0), this._read(n.highWaterMark), n.sync = !1, n.reading || (t = P(r, n))), null === (a = t > 0 ? C(t, n) : null) ? (n.needReadable = !0, t = 0) : n.length -= t, 0 === n.length && (n.ended || (n.needReadable = !0), r !== t && n.ended && I(this)), null !== a && this.emit("data", a), a
        }, b.prototype._read = function(t) {
            this.emit("error", Error("_read() is not implemented"))
        }, b.prototype.pipe = function(n, i) {
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
            s.pipesCount += 1, c("pipe count=%d opts=%j", s.pipesCount, i);
            var u = i && !1 === i.end || n === m.default.stdout || n === m.default.stderr ? b : l;

            function l() {
                c("onend"), n.end()
            }
            s.endEmitted ? t.nextTick(u) : o.once("end", u), n.on("unpipe", function t(r, a) {
                c("onunpipe"), r === o && a && !1 === a.hasUnpiped && (a.hasUnpiped = !0, c("cleanup"), n.removeListener("close", y), n.removeListener("finish", g), n.removeListener("drain", d), n.removeListener("error", v), n.removeListener("unpipe", t), o.removeListener("end", l), o.removeListener("end", b), o.removeListener("data", h), f = !0, s.awaitDrain && (!n._writableState || n._writableState.needDrain) && d())
            });
            var d = function() {
                var t = o._readableState;
                c("pipeOnDrain", t.awaitDrain), t.awaitDrain && t.awaitDrain--, 0 === t.awaitDrain && a(o, "data") && (t.flowing = !0, A(o))
            };
            n.on("drain", d);
            var f = !1,
                p = !1;

            function h(t) {
                c("ondata"), p = !1, !1 !== n.write(t) || p || ((1 === s.pipesCount && s.pipes === n || s.pipesCount > 1 && -1 !== L(s.pipes, n)) && !f && (c("false write response, pause", o._readableState.awaitDrain), o._readableState.awaitDrain++, p = !0), o.pause())
            }

            function v(t) {
                c("onerror", t), b(), n.removeListener("error", v), 0 === a(n, "error") && n.emit("error", t)
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
            return o.on("data", h),
                function(t, n, a) {
                    if ("function" == typeof t.prependListener) return t.prependListener(n, a);
                    t._events && t._events[n] ? r(t._events[n]) ? t._events[n].unshift(a) : t._events[n] = [a, t._events[n]] : t.on(n, a)
                }(n, "error", v), n.once("close", y), n.once("finish", g), n.emit("pipe", o), s.flowing || (c("pipe resume"), o.resume()), n
        }, b.prototype.unpipe = function(t) {
            var n = this._readableState,
                r = {
                    hasUnpiped: !1
                };
            if (0 === n.pipesCount) return this;
            if (1 === n.pipesCount) return t && t !== n.pipes || (t || (t = n.pipes), n.pipes = null, n.pipesCount = 0, n.flowing = !1, t && t.emit("unpipe", this, r)), this;
            if (!t) {
                var a = n.pipes,
                    i = n.pipesCount;
                n.pipes = null, n.pipesCount = 0, n.flowing = !1;
                for (var o = 0; o < i; o++) a[o].emit("unpipe", this, r);
                return this
            }
            var s = L(n.pipes, t);
            return -1 === s || (n.pipes.splice(s, 1), n.pipesCount -= 1, 1 === n.pipesCount && (n.pipes = n.pipes[0]), t.emit("unpipe", this, r)), this
        }, b.prototype.on = function(n, r) {
            var a = i.prototype.on.call(this, n, r);
            if ("data" === n) !1 !== this._readableState.flowing && this.resume();
            else if ("readable" === n) {
                var o = this._readableState;
                o.endEmitted || o.readableListening || (o.readableListening = o.needReadable = !0, o.emittedReadable = !1, o.reading ? o.length && T(this) : t.nextTick(q, this))
            }
            return a
        }, b.prototype.addListener = b.prototype.on, b.prototype.resume = function() {
            var n = this._readableState;
            return n.flowing || (c("resume"), n.flowing = !0, n.resumeScheduled || (n.resumeScheduled = !0, t.nextTick(k, this, n))), this
        }, b.prototype.pause = function() {
            return c("call pause flowing=%j", this._readableState.flowing), !1 !== this._readableState.flowing && (c("pause"), this._readableState.flowing = !1, this.emit("pause")), this
        }, b.prototype.wrap = function(t) {
            var n = this,
                r = this._readableState,
                a = !1;
            for (var i in t.on("end", function() {
                    if (c("wrapped end"), r.decoder && !r.ended) {
                        var t = r.decoder.end();
                        t && t.length && n.push(t)
                    }
                    n.push(null)
                }), t.on("data", function(i) {
                    c("wrapped data"), r.decoder && (i = r.decoder.write(i)), r.objectMode && null == i || (r.objectMode || i && i.length) && (n.push(i) || (a = !0, t.pause()))
                }), t) void 0 === this[i] && "function" == typeof t[i] && (this[i] = function(n) {
                return function() {
                    return t[n].apply(t, arguments)
                }
            }(i));
            for (var o = 0; o < y.length; o++) t.on(y[o], this.emit.bind(this, y[o]));
            return this._read = function(n) {
                c("wrapped _read", n), a && (a = !1, t.resume())
            }, this
        }, Object.defineProperty(b.prototype, "readableHighWaterMark", {
            enumerable: !1,
            get: function() {
                return this._readableState.highWaterMark
            }
        }), b._fromList = C, s4
    }

    function un() {
        if (s8) return s6;
        s8 = 1, s6 = a;
        var t = s1(),
            n = Object.create(oG);

        function r(t, n) {
            var r = this._transformState;
            r.transforming = !1;
            var a = r.writecb;
            if (!a) return this.emit("error", Error("write callback called multiple times"));
            r.writechunk = null, r.writecb = null, null != n && this.push(n), a(t);
            var i = this._readableState;
            i.reading = !1, (i.needReadable || i.length < i.highWaterMark) && this._read(i.highWaterMark)
        }

        function a(n) {
            if (!(this instanceof a)) return new a(n);
            t.call(this, n), this._transformState = {
                afterTransform: r.bind(this),
                needTransform: !1,
                transforming: !1,
                writecb: null,
                writechunk: null,
                writeencoding: null
            }, this._readableState.needReadable = !0, this._readableState.sync = !1, n && ("function" == typeof n.transform && (this._transform = n.transform), "function" == typeof n.flush && (this._flush = n.flush)), this.on("prefinish", i)
        }

        function i() {
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
        return n.inherits = oz, n.inherits(a, t), a.prototype.push = function(n, r) {
            return this._transformState.needTransform = !1, t.prototype.push.call(this, n, r)
        }, a.prototype._transform = function(t, n, r) {
            throw Error("_transform() is not implemented")
        }, a.prototype._write = function(t, n, r) {
            var a = this._transformState;
            if (a.writecb = r, a.writechunk = t, a.writeencoding = n, !a.transforming) {
                var i = this._readableState;
                (a.needTransform || i.needReadable || i.length < i.highWaterMark) && this._read(i.highWaterMark)
            }
        }, a.prototype._read = function(t) {
            var n = this._transformState;
            null !== n.writechunk && n.writecb && !n.transforming ? (n.transforming = !0, this._transform(n.writechunk, n.writeencoding, n.afterTransform)) : n.needTransform = !0
        }, a.prototype._destroy = function(n, r) {
            var a = this;
            t.prototype._destroy.call(this, n, function(t) {
                r(t), a.emit("close")
            })
        }, s6
    }
    ui = {
        get exports() {
            return sC
        },
        set exports(e) {
            sC = e
        }
    }, uo = sC, us = ok.default, "disable" === m.default.env.READABLE_STREAM && us ? (ui.exports = us, (uo = ui.exports = us.Readable).Readable = us.Readable, uo.Writable = us.Writable, uo.Duplex = us.Duplex, uo.Transform = us.Transform, uo.PassThrough = us.PassThrough, uo.Stream = us) : ((uo = ui.exports = ut()).Stream = us || uo, uo.Readable = uo, uo.Writable = s0(), uo.Duplex = s1(), uo.Transform = un(), uo.PassThrough = function() {
        if (s9) return s5;
        s9 = 1, s5 = r;
        var t = un(),
            n = Object.create(oG);

        function r(n) {
            if (!(this instanceof r)) return new r(n);
            t.call(this, n)
        }
        return n.inherits = oz, n.inherits(r, t), r.prototype._transform = function(t, n, r) {
            r(null, t)
        }, s5
    }());
    var ur = sC;

    function ua(t, n, r) {
        void 0 === r && (r = n, n = t, t = null), ur.Duplex.call(this, t), "function" != typeof r.read && (r = new ur.Readable(t).wrap(r)), this._writable = n, this._readable = r, this._waiting = !1;
        var a = this;
        n.once("finish", function() {
            a.end()
        }), this.once("finish", function() {
            n.end()
        }), r.on("readable", function() {
            a._waiting && (a._waiting = !1, a._read())
        }), r.once("end", function() {
            a.push(null)
        }), t && void 0 !== t.bubbleErrors && !t.bubbleErrors || (n.on("error", function(t) {
            a.emit("error", t)
        }), r.on("error", function(t) {
            a.emit("error", t)
        }))
    }
    ua.prototype = Object.create(ur.Duplex.prototype, {
        constructor: {
            value: ua
        }
    }), ua.prototype._write = function(t, n, r) {
        this._writable.write(t, n, r)
    }, ua.prototype._read = function() {
        for (var t, n = 0; null !== (t = this._readable.read());) this.push(t), n++;
        0 === n && (this._waiting = !0)
    }, ({
        get exports() {
            return sA
        },
        set exports(e) {
            sA = e
        }
    }).exports = function(t, n, r) {
        return new ua(t, n, r)
    }, sA.DuplexWrapper = ua, ok.default.PassThrough, ok.default.PassThrough, oL.o, [].slice;
    var ui, uo, us, uu, ul, uc, ud, uf = "web-blox-css-mui",
        up = "web-blox-css-tss",
        uh = "u" > typeof window && void 0 !== window.document,
        uv = function() {
            var t = document.querySelector('meta[name="'.concat("emotion-insertion-point-ssr", '"]')),
                n = !1;
            document.head.childNodes.forEach(function(r) {
                var a, i;
                r === t ? n = !0 : n && r.nodeType === Node.ELEMENT_NODE && ((null == (a = r.getAttribute("data-emotion")) ? void 0 : a.includes("".concat(uf, "-global"))) || (null == (i = r.getAttribute("data-emotion")) ? void 0 : i.includes("".concat(up, "-global")))) && r.remove()
            })
        },
        um = function(t) {
            var n = t.cache,
                r = t.children,
                a = n.muiCache,
                i = n.tssCache;
            return od.default.createElement(oN.CacheProvider, {
                value: a
            }, od.default.createElement(oO.T, {
                value: i
            }, r))
        },
        uy = t.i(952661),
        ug = t.i(343601),
        ub = -1,
        uw = function(t) {
            "hidden" === document.visibilityState && ub > -1 && (ub = "visibilitychange" === t.type ? t.timeStamp : 0, ux())
        },
        ux = function() {
            removeEventListener("visibilitychange", uw, !0), removeEventListener("prerenderingchange", uw, !0)
        },
        uP = {
            passive: !0,
            capture: !0
        },
        uT = new Date,
        uR = function(t, n) {
            uu || (uu = n, ul = t, uc = new Date, uq(removeEventListener), uS())
        },
        uS = function() {
            if (ul >= 0 && ul < uc - uT) {
                var t = {
                    entryType: "first-input",
                    name: uu.type,
                    target: uu.target,
                    cancelable: uu.cancelable,
                    startTime: uu.timeStamp,
                    processingStart: uu.timeStamp + ul
                };
                ud.forEach(function(n) {
                    n(t)
                }), ud = []
            }
        },
        uE = function(t) {
            if (t.cancelable) {
                var n, r, a, i = (t.timeStamp > 1e12 ? new Date : performance.now()) - t.timeStamp;
                "pointerdown" == t.type ? (n = function() {
                    uR(i, t), a()
                }, r = function() {
                    a()
                }, a = function() {
                    removeEventListener("pointerup", n, uP), removeEventListener("pointercancel", r, uP)
                }, addEventListener("pointerup", n, uP), addEventListener("pointercancel", r, uP)) : uR(i, t)
            }
        },
        uq = function(t) {
            ["mousedown", "keydown", "touchstart", "pointerdown"].forEach(function(n) {
                return t(n, uE, uP)
            })
        };
    let uk = null;
    var uA = t.i(665869),
        uC = t.i(906791),
        uI = t.i(968439),
        uj = t.i(677753),
        uL = function(t, n) {
            return (uL = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(t, n) {
                t.__proto__ = n
            } || function(t, n) {
                for (var r in n) Object.prototype.hasOwnProperty.call(n, r) && (t[r] = n[r])
            })(t, n)
        };

    function uN(t, n) {
        if ("function" != typeof n && null !== n) throw TypeError("Class extends value " + String(n) + " is not a constructor or null");

        function r() {
            this.constructor = t
        }
        uL(t, n), t.prototype = null === n ? Object.create(n) : (r.prototype = n.prototype, new r)
    }

    function uO(t, n, r, a) {
        return new(r || (r = Promise))(function(i, o) {
            function s(t) {
                try {
                    l(a.next(t))
                } catch (t) {
                    o(t)
                }
            }

            function u(t) {
                try {
                    l(a.throw(t))
                } catch (t) {
                    o(t)
                }
            }

            function l(t) {
                var n;
                t.done ? i(t.value) : ((n = t.value) instanceof r ? n : new r(function(t) {
                    t(n)
                })).then(s, u)
            }
            l((a = a.apply(t, n || [])).next())
        })
    }

    function uD(t, n) {
        var r, a, i, o = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
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
                    if (r = 1, a && (i = 2 & c[0] ? a.return : c[0] ? a.throw || ((i = a.return) && i.call(a), 0) : a.next) && !(i = i.call(a, c[1])).done) return i;
                    switch (a = 0, i && (c = [2 & c[0], i.value]), c[0]) {
                        case 0:
                        case 1:
                            i = c;
                            break;
                        case 4:
                            return o.label++, {
                                value: c[1],
                                done: !1
                            };
                        case 5:
                            o.label++, a = c[1], c = [0];
                            continue;
                        case 7:
                            c = o.ops.pop(), o.trys.pop();
                            continue;
                        default:
                            if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                o = 0;
                                continue
                            }
                            if (3 === c[0] && (!i || c[1] > i[0] && c[1] < i[3])) {
                                o.label = c[1];
                                break
                            }
                            if (6 === c[0] && o.label < i[1]) {
                                o.label = i[1], i = c;
                                break
                            }
                            if (i && o.label < i[2]) {
                                o.label = i[2], o.ops.push(c);
                                break
                            }
                            i[2] && o.ops.pop(), o.trys.pop();
                            continue
                    }
                    c = n.call(t, o)
                } catch (t) {
                    c = [6, t], a = 0
                } finally {
                    r = i = 0
                }
                if (5 & c[0]) throw c[1];
                return {
                    value: c[0] ? c[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function uM(t) {
        if (void 0 !== t) return null === t ? null : {
            LinkingPlatform: t.linkingPlatform
        }
    }

    function u_(t) {
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
            code: (0, uj.exists)(n, "Code") ? n.Code : void 0,
            message: (0, uj.exists)(n, "Message") ? n.Message : void 0
        }
    }

    function uU(t) {
        var n;
        return null == (n = t) ? n : {
            errors: (0, uj.exists)(n, "errors") ? n.errors.map(uV) : void 0,
            usernamePrefix: (0, uj.exists)(n, "usernamePrefix") ? n.usernamePrefix : void 0,
            username: (0, uj.exists)(n, "username") ? n.username : void 0,
            userId: (0, uj.exists)(n, "userId") ? n.userId : void 0,
            password: (0, uj.exists)(n, "password") ? n.password : void 0
        }
    }

    function uF(t) {
        var n;
        return null == (n = t) ? n : {
            userId: (0, uj.exists)(n, "userId") ? n.userId : void 0,
            userKey: (0, uj.exists)(n, "userKey") ? n.userKey : void 0,
            name: (0, uj.exists)(n, "name") ? n.name : void 0,
            displayName: (0, uj.exists)(n, "displayName") ? n.displayName : void 0,
            createdTime: (0, uj.exists)(n, "createdTime") ? new Date(n.createdTime) : void 0,
            updatedTime: (0, uj.exists)(n, "updatedTime") ? new Date(n.updatedTime) : void 0,
            accountCountry: (0, uj.exists)(n, "accountCountry") ? n.accountCountry : void 0
        }
    }

    function uG(t) {
        var n;
        return null == (n = t) ? n : {
            method: (0, uj.exists)(n, "method") ? n.method : void 0,
            priority: (0, uj.exists)(n, "priority") ? n.priority : void 0
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
            accountLinkParameters: uM(t.accountLinkParameters),
            captchaId: t.captchaId,
            captchaToken: t.captchaToken,
            captchaProvider: t.captchaProvider,
            challengeId: t.challengeId
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function uz(t, n) {
        var r, a;
        return null == t ? t : {
            user: (0, uj.exists)(t, "user") ? null == (r = t.user) ? r : {
                id: (0, uj.exists)(r, "id") ? r.id : void 0,
                name: (0, uj.exists)(r, "name") ? r.name : void 0,
                displayName: (0, uj.exists)(r, "displayName") ? r.displayName : void 0
            } : void 0,
            twoStepVerificationData: (0, uj.exists)(t, "twoStepVerificationData") ? null == (a = t.twoStepVerificationData) ? a : {
                mediaType: (0, uj.exists)(a, "mediaType") ? a.mediaType : void 0,
                ticket: (0, uj.exists)(a, "ticket") ? a.ticket : void 0
            } : void 0,
            identityVerificationLoginTicket: (0, uj.exists)(t, "identityVerificationLoginTicket") ? t.identityVerificationLoginTicket : void 0,
            isBanned: (0, uj.exists)(t, "isBanned") ? t.isBanned : void 0,
            accountBlob: (0, uj.exists)(t, "accountBlob") ? t.accountBlob : void 0,
            shouldUpdateEmail: (0, uj.exists)(t, "shouldUpdateEmail") ? t.shouldUpdateEmail : void 0,
            recoveryEmail: (0, uj.exists)(t, "recoveryEmail") ? t.recoveryEmail : void 0,
            passkeyRegistrationSucceeded: (0, uj.exists)(t, "passkeyRegistrationSucceeded") ? t.passkeyRegistrationSucceeded : void 0,
            shouldAutoLoginFromRecovery: (0, uj.exists)(t, "shouldAutoLoginFromRecovery") ? t.shouldAutoLoginFromRecovery : void 0,
            shouldPrompt2svRemoval: (0, uj.exists)(t, "shouldPrompt2svRemoval") ? t.shouldPrompt2svRemoval : void 0,
            shouldPromptPasskeyAddition: (0, uj.exists)(t, "shouldPromptPasskeyAddition") ? t.shouldPromptPasskeyAddition : void 0
        }
    }

    function uH(t, n) {
        return null == t ? t : {
            code: (0, uj.exists)(t, "code") ? t.code : void 0,
            message: (0, uj.exists)(t, "message") ? t.message : void 0
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
            capturedAuditContent: void 0 === t.capturedAuditContent ? void 0 : (0, uj.mapValues)(t.capturedAuditContent, uJ),
            additionalAuditContent: t.additionalAuditContent
        }
    }

    function uX(t) {
        var n;
        return null == (n = t) ? n : {
            provider: (0, uj.exists)(n, "provider") ? n.provider : void 0,
            identifier: (0, uj.exists)(n, "identifier") ? n.identifier : void 0
        }
    }

    function u$(t, n) {
        return null == t ? t : {
            didGenerateNewUsername: (0, uj.exists)(t, "didGenerateNewUsername") ? t.didGenerateNewUsername : void 0,
            suggestedUsernames: (0, uj.exists)(t, "suggestedUsernames") ? t.suggestedUsernames : void 0
        }
    }

    function uZ(t) {
        var n;
        return null == (n = t) ? n : {
            nickname: (0, uj.exists)(n, "nickname") ? n.nickname : void 0
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
            accountLinkParameters: uM(t.accountLinkParameters),
            auditSystemContent: uQ(t.auditSystemContent),
            captchaId: t.captchaId,
            captchaToken: t.captchaToken,
            captchaProvider: t.captchaProvider,
            challengeId: t.challengeId
        }
    }

    function u0(t, n) {
        return null == t ? t : {
            userId: (0, uj.exists)(t, "userId") ? t.userId : void 0,
            starterPlaceId: (0, uj.exists)(t, "starterPlaceId") ? t.starterPlaceId : void 0,
            returnUrl: (0, uj.exists)(t, "returnUrl") ? t.returnUrl : void 0,
            accountBlob: (0, uj.exists)(t, "accountBlob") ? t.accountBlob : void 0
        }
    }

    function u1(t, n) {
        return null == t ? t : {
            voucher: (0, uj.exists)(t, "voucher") ? t.voucher : void 0,
            gender: (0, uj.exists)(t, "gender") ? t.gender : void 0,
            userId: (0, uj.exists)(t, "userId") ? t.userId : void 0,
            displayName: (0, uj.exists)(t, "displayName") ? t.displayName : void 0,
            openId: (0, uj.exists)(t, "openId") ? t.openId : void 0
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
            loginPage: (0, uj.exists)(t, "loginPage") ? t.loginPage : void 0,
            realNameVerificationUrl: (0, uj.exists)(t, "realNameVerificationUrl") ? t.realNameVerificationUrl : void 0,
            isLinkingEnabled: (0, uj.exists)(t, "isLinkingEnabled") ? t.isLinkingEnabled : void 0
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
            code: (0, uj.exists)(t, "code") ? t.code : void 0,
            message: (0, uj.exists)(t, "message") ? t.message : void 0
        }
    }

    function u9(t) {
        var n;
        return null == (n = t) ? n : {
            id: (0, uj.exists)(n, "Id") ? n.Id : void 0,
            userId: (0, uj.exists)(n, "UserId") ? n.UserId : void 0,
            username: (0, uj.exists)(n, "Username") ? n.Username : void 0
        }
    }

    function u7(t, n) {
        return null == t ? t : {
            success: (0, uj.exists)(t, "success") ? t.success : void 0
        }
    }(function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uN(n, t), n.prototype.v1AccountCreationMetadataGetRaw = function(t) {
            return uO(this, void 0, void 0, function() {
                var n, r, a;
                return uD(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/account-creation/metadata",
                                schemaPath: "/v1/account-creation/metadata",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return a = i.sent(), [2, new uj.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    isEligibleForALSignup: (0, uj.exists)(t, "isEligibleForALSignup") ? t.isEligibleForALSignup : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1AccountCreationMetadataGet = function(t) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(n) {
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
    })(uj.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uN(n, t), n.prototype.v1AccountPinDeleteRaw = function(t, n) {
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/account/pin",
                                schemaPath: "/v1/account/pin",
                                method: "DELETE",
                                headers: a,
                                query: r,
                                body: u_(t.requestBody)
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return u7(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1AccountPinDelete = function() {
            return uO(this, arguments, void 0, function(t, n) {
                return void 0 === t && (t = {}), uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var n, r, a;
                return uD(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/account/pin",
                                schemaPath: "/v1/account/pin",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return a = i.sent(), [2, new uj.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    isEnabled: (0, uj.exists)(t, "isEnabled") ? t.isEnabled : void 0,
                                    unlockedUntil: (0, uj.exists)(t, "unlockedUntil") ? t.unlockedUntil : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1AccountPinGet = function(t) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(n) {
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
            return uO(this, void 0, void 0, function() {
                var n, r, a;
                return uD(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/account/pin/lock",
                                schemaPath: "/v1/account/pin/lock",
                                method: "POST",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return a = i.sent(), [2, new uj.JSONApiResponse(a, function(t) {
                                return u7(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1AccountPinLockPost = function(t) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(n) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.requestBody || void 0 === t.requestBody) throw new uj.RequiredError("requestBody", "Required parameter requestParameters.requestBody was null or undefined when calling v1AccountPinPatch.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/account/pin",
                                schemaPath: "/v1/account/pin",
                                method: "PATCH",
                                headers: a,
                                query: r,
                                body: u_(t.requestBody)
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return u7(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1AccountPinPatch = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.requestBody || void 0 === t.requestBody) throw new uj.RequiredError("requestBody", "Required parameter requestParameters.requestBody was null or undefined when calling v1AccountPinPost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/account/pin",
                                schemaPath: "/v1/account/pin",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: u_(t.requestBody)
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return u7(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1AccountPinPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.requestBody || void 0 === t.requestBody) throw new uj.RequiredError("requestBody", "Required parameter requestParameters.requestBody was null or undefined when calling v1AccountPinUnlockPost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/account/pin/unlock",
                                schemaPath: "/v1/account/pin/unlock",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: u_(t.requestBody)
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    unlockedUntil: (0, uj.exists)(t, "unlockedUntil") ? t.unlockedUntil : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1AccountPinUnlockPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
    }(uj.BaseAPI);
    var le = function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        return uN(n, t), n.prototype.v1AuthMetadataGetRaw = function(t) {
            return uO(this, void 0, void 0, function() {
                var n, r, a;
                return uD(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/auth/metadata",
                                schemaPath: "/v1/auth/metadata",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return a = i.sent(), [2, new uj.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    cookieLawNoticeTimeout: (0, uj.exists)(t, "cookieLawNoticeTimeout") ? t.cookieLawNoticeTimeout : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1AuthMetadataGet = function(t) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(n) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1LoginLinkedPost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/login/linked",
                                schemaPath: "/v1/login/linked",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: uW(t.request)
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return uz(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1LoginLinkedPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1LoginPost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/login",
                                schemaPath: "/v1/login",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: uW(t.request)
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return uz(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1LoginPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var n, r, a;
                return uD(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/logout",
                                schemaPath: "/v1/logout",
                                method: "POST",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return a = i.sent(), [2, new uj.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1LogoutPost = function(t) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(n) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1LogoutfromallsessionsandreauthenticatePost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/logoutfromallsessionsandreauthenticate",
                                schemaPath: "/v1/logoutfromallsessionsandreauthenticate",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        SecureAuthenticationIntent: uK(t.secureAuthenticationIntent)
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1LogoutfromallsessionsandreauthenticatePost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var n, r, a;
                return uD(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/session/refresh",
                                schemaPath: "/v1/session/refresh",
                                method: "POST",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return a = i.sent(), [2, new uj.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1SessionRefreshPost = function(t) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(n) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.userId || void 0 === t.userId) throw new uj.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdImpersonatePost.");
                            return r = {}, a = {}, [4, this.request({
                                path: "/v1/users/{userId}/impersonate".replace("{".concat("userId", "}"), encodeURIComponent(String(t.userId))),
                                schemaPath: "/v1/users/{userId}/impersonate",
                                method: "POST",
                                headers: a,
                                query: r
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1UsersUserIdImpersonatePost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
    }(uj.BaseAPI);
    (function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uN(n, t), n.prototype.v1AuthenticationTicketPostRaw = function(t, n) {
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1AuthenticationTicketPost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/authentication-ticket",
                                schemaPath: "/v1/authentication-ticket",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        clientAssertion: t.clientAssertion
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1AuthenticationTicketPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.rBXAuthenticationNegotiation || void 0 === t.rBXAuthenticationNegotiation) throw new uj.RequiredError("rBXAuthenticationNegotiation", "Required parameter requestParameters.rBXAuthenticationNegotiation was null or undefined when calling v1AuthenticationTicketRedeemPost.");
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1AuthenticationTicketRedeemPost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", void 0 !== t.rBXAuthenticationNegotiation && null !== t.rBXAuthenticationNegotiation && (a.RBXAuthenticationNegotiation = String(t.rBXAuthenticationNegotiation)), [4, this.request({
                                path: "/v1/authentication-ticket/redeem",
                                schemaPath: "/v1/authentication-ticket/redeem",
                                method: "POST",
                                headers: a,
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
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    accountBlob: (0, uj.exists)(t, "accountBlob") ? t.accountBlob : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1AuthenticationTicketRedeemPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1AuthenticationTicketRetrieveUserPost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/authentication-ticket/retrieve-user",
                                schemaPath: "/v1/authentication-ticket/retrieve-user",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        authenticationTicket: t.authenticationTicket
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    userId: (0, uj.exists)(t, "UserId") ? t.UserId : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1AuthenticationTicketRetrieveUserPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var n, r, a;
                return uD(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/client-assertion",
                                schemaPath: "/v1/client-assertion",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return a = i.sent(), [2, new uj.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    clientAssertion: (0, uj.exists)(t, "clientAssertion") ? t.clientAssertion : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1ClientAssertionGet = function(t) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(n) {
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
    })(uj.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uN(n, t), n.prototype.v1ExternalAccessPostRaw = function(t, n) {
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1ExternalAccessPost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/external/access",
                                schemaPath: "/v1/external/access",
                                method: "POST",
                                headers: a,
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
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    placeId: (0, uj.exists)(t, "placeId") ? t.placeId : void 0,
                                    isolationContext: (0, uj.exists)(t, "isolationContext") ? t.isolationContext : void 0,
                                    launchData: (0, uj.exists)(t, "launchData") ? t.launchData : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1ExternalAccessPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.identityProviderId || void 0 === t.identityProviderId) throw new uj.RequiredError("identityProviderId", "Required parameter requestParameters.identityProviderId was null or undefined when calling v1ExternalIdentityProviderIdSsoOauthCallbackGet.");
                            if (null === t.code || void 0 === t.code) throw new uj.RequiredError("code", "Required parameter requestParameters.code was null or undefined when calling v1ExternalIdentityProviderIdSsoOauthCallbackGet.");
                            if (null === t.state || void 0 === t.state) throw new uj.RequiredError("state", "Required parameter requestParameters.state was null or undefined when calling v1ExternalIdentityProviderIdSsoOauthCallbackGet.");
                            return r = {}, void 0 !== t.code && (r.code = t.code), void 0 !== t.state && (r.state = t.state), a = {}, [4, this.request({
                                path: "/v1/external/{identityProviderId}/sso/oauth/callback".replace("{".concat("identityProviderId", "}"), encodeURIComponent(String(t.identityProviderId))),
                                schemaPath: "/v1/external/{identityProviderId}/sso/oauth/callback",
                                method: "GET",
                                headers: a,
                                query: r
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.VoidApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1ExternalIdentityProviderIdSsoOauthCallbackGet = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1ExternalIdentityProviderIdSsoOauthCallbackGetRaw(t, n)];
                        case 1:
                            return r.sent(), [2]
                    }
                })
            })
        }, n.prototype.v1ExternalIdentityProviderIdSsoOauthInitGetRaw = function(t, n) {
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.identityProviderId || void 0 === t.identityProviderId) throw new uj.RequiredError("identityProviderId", "Required parameter requestParameters.identityProviderId was null or undefined when calling v1ExternalIdentityProviderIdSsoOauthInitGet.");
                            return r = {}, a = {}, [4, this.request({
                                path: "/v1/external/{identityProviderId}/sso/oauth/init".replace("{".concat("identityProviderId", "}"), encodeURIComponent(String(t.identityProviderId))),
                                schemaPath: "/v1/external/{identityProviderId}/sso/oauth/init",
                                method: "GET",
                                headers: a,
                                query: r
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.VoidApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1ExternalIdentityProviderIdSsoOauthInitGet = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1ExternalIdentityProviderIdSsoOauthInitGetRaw(t, n)];
                        case 1:
                            return r.sent(), [2]
                    }
                })
            })
        }, n.prototype.v1ExternalIdentityProviderIdSsoSamlAssertionConsumerServicePostRaw = function(t, n) {
            return uO(this, void 0, void 0, function() {
                var r, a, i, o;
                return uD(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.identityProviderId || void 0 === t.identityProviderId) throw new uj.RequiredError("identityProviderId", "Required parameter requestParameters.identityProviderId was null or undefined when calling v1ExternalIdentityProviderIdSsoSamlAssertionConsumerServicePost.");
                            return r = {}, a = {}, (0, uj.canConsumeForm)([{
                                contentType: "multipart/form-data"
                            }]), i = new URLSearchParams, void 0 !== t.sAMLResponse && i.append("SAMLResponse", t.sAMLResponse), void 0 !== t.relayState && i.append("RelayState", t.relayState), [4, this.request({
                                path: "/v1/external/{identityProviderId}/sso/saml/assertion-consumer-service".replace("{".concat("identityProviderId", "}"), encodeURIComponent(String(t.identityProviderId))),
                                schemaPath: "/v1/external/{identityProviderId}/sso/saml/assertion-consumer-service",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: i
                            }, n)];
                        case 1:
                            return o = s.sent(), [2, new uj.VoidApiResponse(o)]
                    }
                })
            })
        }, n.prototype.v1ExternalIdentityProviderIdSsoSamlAssertionConsumerServicePost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1ExternalIdentityProviderIdSsoSamlAssertionConsumerServicePostRaw(t, n)];
                        case 1:
                            return r.sent(), [2]
                    }
                })
            })
        }, n.prototype.v1ExternalLoginAndLinkPostRaw = function(t, n) {
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1ExternalLoginAndLinkPost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/external/loginAndLink",
                                schemaPath: "/v1/external/loginAndLink",
                                method: "POST",
                                headers: a,
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
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return uz(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1ExternalLoginAndLinkPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1ExternalLoginPost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/external/login",
                                schemaPath: "/v1/external/login",
                                method: "POST",
                                headers: a,
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
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    success: (0, uj.exists)(t, "success") ? t.success : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1ExternalLoginPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1ExternalSignupPost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/external/signup",
                                schemaPath: "/v1/external/signup",
                                method: "POST",
                                headers: a,
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
                            return i = o.sent(), [2, new uj.VoidApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1ExternalSignupPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1ExternalSignupPostRaw(t, n)];
                        case 1:
                            return r.sent(), [2]
                    }
                })
            })
        }, n.prototype.v1ExternalUnlinkPostRaw = function(t, n) {
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1ExternalUnlinkPost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/external/unlink",
                                schemaPath: "/v1/external/unlink",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        IdentityProviderPlatformType: t.identityProviderPlatformType,
                                        additionalInfoPayload: t.additionalInfoPayload
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.VoidApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1ExternalUnlinkPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1ExternalUnlinkPostRaw(t, n)];
                        case 1:
                            return r.sent(), [2]
                    }
                })
            })
        }
    }(uj.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uN(n, t), n.prototype.v1IdentityInitializeLoginPostRaw = function(t, n) {
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.initializeLoginRequest || void 0 === t.initializeLoginRequest) throw new uj.RequiredError("initializeLoginRequest", "Required parameter requestParameters.initializeLoginRequest was null or undefined when calling v1IdentityInitializeLoginPost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/identity/initialize-login",
                                schemaPath: "/v1/identity/initialize-login",
                                method: "POST",
                                headers: a,
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
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    loginMethods: (0, uj.exists)(t, "loginMethods") ? t.loginMethods.map(uG) : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1IdentityInitializeLoginPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
    }(uj.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uN(n, t), n.prototype.v1IdentityVerificationLoginPostRaw = function(t, n) {
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1IdentityVerificationLoginPost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/identity-verification/login",
                                schemaPath: "/v1/identity-verification/login",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        loginTicket: t.loginTicket,
                                        resultToken: t.resultToken
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1IdentityVerificationLoginPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
    }(uj.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uN(n, t), n.prototype.v1MetadataGetRaw = function(t) {
            return uO(this, void 0, void 0, function() {
                var n, r, a;
                return uD(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/metadata",
                                schemaPath: "/v1/metadata",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return a = i.sent(), [2, new uj.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    isUpdateUsernameEnabled: (0, uj.exists)(t, "isUpdateUsernameEnabled") ? t.isUpdateUsernameEnabled : void 0,
                                    ftuxAvatarAssetMap: (0, uj.exists)(t, "ftuxAvatarAssetMap") ? t.ftuxAvatarAssetMap : void 0,
                                    isEmailUpsellAtLogoutEnabled: (0, uj.exists)(t, "IsEmailUpsellAtLogoutEnabled") ? t.IsEmailUpsellAtLogoutEnabled : void 0,
                                    shouldFetchEmailUpsellIXPValuesAtLogout: (0, uj.exists)(t, "ShouldFetchEmailUpsellIXPValuesAtLogout") ? t.ShouldFetchEmailUpsellIXPValuesAtLogout : void 0,
                                    isAccountRecoveryPromptEnabled: (0, uj.exists)(t, "IsAccountRecoveryPromptEnabled") ? t.IsAccountRecoveryPromptEnabled : void 0,
                                    isContactMethodRequiredAtSignup: (0, uj.exists)(t, "IsContactMethodRequiredAtSignup") ? t.IsContactMethodRequiredAtSignup : void 0,
                                    isUserAgreementsSignupIntegrationEnabled: (0, uj.exists)(t, "IsUserAgreementsSignupIntegrationEnabled") ? t.IsUserAgreementsSignupIntegrationEnabled : void 0,
                                    isPasswordRequiredForUsernameChange: (0, uj.exists)(t, "IsPasswordRequiredForUsernameChange") ? t.IsPasswordRequiredForUsernameChange : void 0,
                                    isPasskeyFeatureEnabled: (0, uj.exists)(t, "IsPasskeyFeatureEnabled") ? t.IsPasskeyFeatureEnabled : void 0,
                                    isAltBrowserTracker: (0, uj.exists)(t, "IsAltBrowserTracker") ? t.IsAltBrowserTracker : void 0,
                                    isLoginRedirectPageEnabled: (0, uj.exists)(t, "IsLoginRedirectPageEnabled") ? t.IsLoginRedirectPageEnabled : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1MetadataGet = function(t) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(n) {
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
    }(uj.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uN(n, t), n.prototype.v1PalisadesLiveConnectPostRaw = function(t, n) {
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PalisadesLiveConnectPost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/palisades-live/connect",
                                schemaPath: "/v1/palisades-live/connect",
                                method: "POST",
                                headers: a,
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
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return uz(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1PalisadesLiveConnectPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var n, r, a;
                return uD(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/palisades-live/disconnect",
                                schemaPath: "/v1/palisades-live/disconnect",
                                method: "POST",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return a = i.sent(), [2, new uj.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1PalisadesLiveDisconnectPost = function(t) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(n) {
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
            return uO(this, void 0, void 0, function() {
                var n, r, a;
                return uD(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/palisades-live/is-live",
                                schemaPath: "/v1/palisades-live/is-live",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return a = i.sent(), this.isJsonMime(a.headers.get("content-type")) ? [2, new uj.JSONApiResponse(a)] : [2, new uj.TextApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1PalisadesLiveIsLiveGet = function(t) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(n) {
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
            return uO(this, void 0, void 0, function() {
                var n, r, a;
                return uD(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/palisades-live/login",
                                schemaPath: "/v1/palisades-live/login",
                                method: "POST",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return a = i.sent(), this.isJsonMime(a.headers.get("content-type")) ? [2, new uj.JSONApiResponse(a)] : [2, new uj.TextApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1PalisadesLiveLoginPost = function(t) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(n) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PalisadesLiveSignupPost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/palisades-live/signup",
                                schemaPath: "/v1/palisades-live/signup",
                                method: "POST",
                                headers: a,
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
                            return i = o.sent(), this.isJsonMime(i.headers.get("content-type")) ? [2, new uj.JSONApiResponse(i)] : [2, new uj.TextApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1PalisadesLiveSignupPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
    }(uj.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uN(n, t), n.prototype.v1PasskeyDeleteCredentialBatchPostRaw = function(t, n) {
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PasskeyDeleteCredentialBatchPost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/passkey/DeleteCredentialBatch",
                                schemaPath: "/v1/passkey/DeleteCredentialBatch",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        credentialNicknames: t.credentialNicknames
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1PasskeyDeleteCredentialBatchPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PasskeyFinishArPreauthRegistrationPost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/passkey/finish-ar-preauth-registration",
                                schemaPath: "/v1/passkey/finish-ar-preauth-registration",
                                method: "POST",
                                headers: a,
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
                            return i = o.sent(), [2, new uj.JSONApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1PasskeyFinishArPreauthRegistrationPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PasskeyFinishPreauthRegistrationPost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/passkey/finish-preauth-registration",
                                schemaPath: "/v1/passkey/finish-preauth-registration",
                                method: "POST",
                                headers: a,
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
                            return i = o.sent(), [2, new uj.JSONApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1PasskeyFinishPreauthRegistrationPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PasskeyFinishRegistrationPost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/passkey/FinishRegistration",
                                schemaPath: "/v1/passkey/FinishRegistration",
                                method: "POST",
                                headers: a,
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
                            return i = o.sent(), [2, new uj.JSONApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1PasskeyFinishRegistrationPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PasskeyListCredentialsPost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/passkey/ListCredentials",
                                schemaPath: "/v1/passkey/ListCredentials",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        all: t.all
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    credentials: (0, uj.exists)(t, "credentials") ? t.credentials.map(uZ) : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1PasskeyListCredentialsPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PasskeyStartAuthenticationByUserPost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/passkey/start-authentication-by-user",
                                schemaPath: "/v1/passkey/start-authentication-by-user",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        ctype: t.ctype,
                                        cvalue: t.cvalue
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    authenticationOptions: (0, uj.exists)(t, "authenticationOptions") ? t.authenticationOptions : void 0,
                                    sessionId: (0, uj.exists)(t, "sessionId") ? t.sessionId : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1PasskeyStartAuthenticationByUserPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var n, r, a;
                return uD(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/passkey/StartAuthentication",
                                schemaPath: "/v1/passkey/StartAuthentication",
                                method: "POST",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return a = i.sent(), [2, new uj.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    authenticationOptions: (0, uj.exists)(t, "authenticationOptions") ? t.authenticationOptions : void 0,
                                    sessionId: (0, uj.exists)(t, "sessionId") ? t.sessionId : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1PasskeyStartAuthenticationPost = function(t) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(n) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PasskeyStartPreauthRegistrationPost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/passkey/start-preauth-registration",
                                schemaPath: "/v1/passkey/start-preauth-registration",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        username: t.username
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    creationOptions: (0, uj.exists)(t, "creationOptions") ? t.creationOptions : void 0,
                                    sessionId: (0, uj.exists)(t, "sessionId") ? t.sessionId : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1PasskeyStartPreauthRegistrationPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PasskeyStartRegistrationPost.");
                            return r = {}, void 0 !== t.flow && (r.flow = t.flow), (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/passkey/StartRegistration",
                                schemaPath: "/v1/passkey/StartRegistration",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        isSilentUpgrade: t.isSilentUpgrade
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    creationOptions: (0, uj.exists)(t, "creationOptions") ? t.creationOptions : void 0,
                                    sessionId: (0, uj.exists)(t, "sessionId") ? t.sessionId : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1PasskeyStartRegistrationPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var n, r, a;
                return uD(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/passkey/su-eligibility",
                                schemaPath: "/v1/passkey/su-eligibility",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return a = i.sent(), [2, new uj.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    suEligibility: (0, uj.exists)(t, "suEligibility") ? t.suEligibility : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1PasskeySuEligibilityGet = function(t) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(n) {
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
    }(uj.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uN(n, t), n.prototype.v1UserPasswordsChangePostRaw = function(t, n) {
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1UserPasswordsChangePost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/user/passwords/change",
                                schemaPath: "/v1/user/passwords/change",
                                method: "POST",
                                headers: a,
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
                            return i = o.sent(), [2, new uj.JSONApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1UserPasswordsChangePost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
    }(uj.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uN(n, t), n.prototype.v1PasswordsValidateGetRaw = function(t, n) {
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.username || void 0 === t.username) throw new uj.RequiredError("username", "Required parameter requestParameters.username was null or undefined when calling v1PasswordsValidateGet.");
                            if (null === t.password || void 0 === t.password) throw new uj.RequiredError("password", "Required parameter requestParameters.password was null or undefined when calling v1PasswordsValidateGet.");
                            return r = {}, void 0 !== t.username && (r.Username = t.username), void 0 !== t.password && (r.Password = t.password), a = {}, [4, this.request({
                                path: "/v1/passwords/validate",
                                schemaPath: "/v1/passwords/validate",
                                method: "GET",
                                headers: a,
                                query: r
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return uH(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1PasswordsValidateGet = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PasswordsValidatePost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/passwords/validate",
                                schemaPath: "/v1/passwords/validate",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        username: t.username,
                                        password: t.password
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return uH(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1PasswordsValidatePost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
    }(uj.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uN(n, t), n.prototype.v1QqCallbackPostRaw = function(t, n) {
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1QqCallbackPost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/qq/callback",
                                schemaPath: "/v1/qq/callback",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: u6(t.request)
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return u1(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1QqCallbackPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1QqConnectPost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/qq/connect",
                                schemaPath: "/v1/qq/connect",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: u2(t.request)
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return uz(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1QqConnectPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return r = {}, void 0 !== t.apiKey && (r.apiKey = t.apiKey), void 0 !== t.getIdentifier && (r.getIdentifier = t.getIdentifier), void 0 !== t.appType && (r.appType = t.appType), a = {}, [4, this.request({
                                path: "/v1/qq/metadata",
                                schemaPath: "/v1/qq/metadata",
                                method: "GET",
                                headers: a,
                                query: r
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return u4(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1QqMetadataGet = function() {
            return uO(this, arguments, void 0, function(t, n) {
                return void 0 === t && (t = {}), uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1QqSignupwithoutpasswordPost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/qq/signupwithoutpassword",
                                schemaPath: "/v1/qq/signupwithoutpassword",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: u3(t.request)
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return u0(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1QqSignupwithoutpasswordPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1QqTokenAuthenticationPost.");
                            return r = {}, void 0 !== t.apiKey && (r.apiKey = t.apiKey), (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/qq/token-authentication",
                                schemaPath: "/v1/qq/token-authentication",
                                method: "POST",
                                headers: a,
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
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return u1(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1QqTokenAuthenticationPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1QqVerifyConnectPost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/qq/verify-connect",
                                schemaPath: "/v1/qq/verify-connect",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: u8(t.request)
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1QqVerifyConnectPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
    }(uj.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uN(n, t), n.prototype.v1RecoveryMetadataGetRaw = function(t) {
            return uO(this, void 0, void 0, function() {
                var n, r, a;
                return uD(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/recovery/metadata",
                                schemaPath: "/v1/recovery/metadata",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return a = i.sent(), [2, new uj.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    isOnPhone: (0, uj.exists)(t, "isOnPhone") ? t.isOnPhone : void 0,
                                    codeLength: (0, uj.exists)(t, "codeLength") ? t.codeLength : void 0,
                                    isPhoneFeatureEnabledForUsername: (0, uj.exists)(t, "isPhoneFeatureEnabledForUsername") ? t.isPhoneFeatureEnabledForUsername : void 0,
                                    isPhoneFeatureEnabledForPassword: (0, uj.exists)(t, "isPhoneFeatureEnabledForPassword") ? t.isPhoneFeatureEnabledForPassword : void 0,
                                    isBedev2CaptchaEnabledForPasswordReset: (0, uj.exists)(t, "isBedev2CaptchaEnabledForPasswordReset") ? t.isBedev2CaptchaEnabledForPasswordReset : void 0,
                                    isUsernameRecoveryDeprecated: (0, uj.exists)(t, "isUsernameRecoveryDeprecated") ? t.isUsernameRecoveryDeprecated : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1RecoveryMetadataGet = function(t) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(n) {
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
    }(uj.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uN(n, t), n.prototype.v1RevertAccountGetRaw = function(t, n) {
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.ticket || void 0 === t.ticket) throw new uj.RequiredError("ticket", "Required parameter requestParameters.ticket was null or undefined when calling v1RevertAccountGet.");
                            return r = {}, void 0 !== t.ticket && (r.ticket = t.ticket), a = {}, [4, this.request({
                                path: "/v1/revert/account",
                                schemaPath: "/v1/revert/account",
                                method: "GET",
                                headers: a,
                                query: r
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    isTwoStepVerificationEnabled: (0, uj.exists)(t, "isTwoStepVerificationEnabled") ? t.isTwoStepVerificationEnabled : void 0,
                                    isEmailVerified: (0, uj.exists)(t, "isEmailVerified") ? t.isEmailVerified : void 0,
                                    isEmailChanged: (0, uj.exists)(t, "isEmailChanged") ? t.isEmailChanged : void 0,
                                    isPhoneVerified: (0, uj.exists)(t, "isPhoneVerified") ? t.isPhoneVerified : void 0,
                                    userId: (0, uj.exists)(t, "userId") ? t.userId : void 0,
                                    username: (0, uj.exists)(t, "username") ? t.username : void 0,
                                    ticket: (0, uj.exists)(t, "ticket") ? t.ticket : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1RevertAccountGet = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1RevertAccountPost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/revert/account",
                                schemaPath: "/v1/revert/account",
                                method: "POST",
                                headers: a,
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
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return uz(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1RevertAccountPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var n, r, a;
                return uD(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/revert/invalidate-tickets",
                                schemaPath: "/v1/revert/invalidate-tickets",
                                method: "POST",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return a = i.sent(), [2, new uj.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1RevertInvalidateTicketsPost = function(t) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(n) {
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
    }(uj.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uN(n, t), n.prototype.v1SignupLinkedPostRaw = function(t, n) {
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1SignupLinkedPost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/signup/linked",
                                schemaPath: "/v1/signup/linked",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: uY(t.request)
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return u0(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1SignupLinkedPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1SignupPost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/signup",
                                schemaPath: "/v1/signup",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: uY(t.request)
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return u0(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1SignupPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
    }(uj.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uN(n, t), n.prototype.v1SocialConnectedProvidersGetRaw = function(t) {
            return uO(this, void 0, void 0, function() {
                var n, r, a;
                return uD(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/social/connected-providers",
                                schemaPath: "/v1/social/connected-providers",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return a = i.sent(), [2, new uj.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    providers: (0, uj.exists)(t, "providers") ? t.providers.map(uX) : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1SocialConnectedProvidersGet = function(t) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(n) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.provider || void 0 === t.provider) throw new uj.RequiredError("provider", "Required parameter requestParameters.provider was null or undefined when calling v1SocialProviderDisconnectPost.");
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1SocialProviderDisconnectPost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/social/{provider}/disconnect".replace("{".concat("provider", "}"), encodeURIComponent(String(t.provider))),
                                schemaPath: "/v1/social/{provider}/disconnect",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        Password: t.password
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1SocialProviderDisconnectPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
    }(uj.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uN(n, t), n.prototype.v1TestUserAuthenticateApiKeyPostRaw = function(t, n) {
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1TestUserAuthenticateApiKeyPost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/test-user/authenticate/api-key",
                                schemaPath: "/v1/test-user/authenticate/api-key",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        userId: t.userId,
                                        redirect: t.redirect
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.VoidApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1TestUserAuthenticateApiKeyPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1TestUserAuthenticateApiKeyPostRaw(t, n)];
                        case 1:
                            return r.sent(), [2]
                    }
                })
            })
        }, n.prototype.v1TestUserCreateBatchPostRaw = function(t, n) {
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1TestUserCreateBatchPost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/test-user/create-batch",
                                schemaPath: "/v1/test-user/create-batch",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        createTestUserRequests: void 0 === t.createTestUserRequests ? void 0 : t.createTestUserRequests.map(uB)
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    createTestUserResponses: (0, uj.exists)(t, "createTestUserResponses") ? t.createTestUserResponses.map(uU) : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1TestUserCreateBatchPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1TestUserExemptionAddPost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/test-user/exemption/add",
                                schemaPath: "/v1/test-user/exemption/add",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        testUserId: t.testUserId,
                                        exemptionType: t.exemptionType
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1TestUserExemptionAddPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.testUserId || void 0 === t.testUserId) throw new uj.RequiredError("testUserId", "Required parameter requestParameters.testUserId was null or undefined when calling v1TestUserExemptionListGet.");
                            return r = {}, void 0 !== t.testUserId && (r.testUserId = t.testUserId), a = {}, [4, this.request({
                                path: "/v1/test-user/exemption/list",
                                schemaPath: "/v1/test-user/exemption/list",
                                method: "GET",
                                headers: a,
                                query: r
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    exemptions: (0, uj.exists)(t, "exemptions") ? t.exemptions : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1TestUserExemptionListGet = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1TestUserExemptionRemovePost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/test-user/exemption/remove",
                                schemaPath: "/v1/test-user/exemption/remove",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        testUserId: t.testUserId,
                                        exemptionType: t.exemptionType
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1TestUserExemptionRemovePost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var n, r, a;
                return uD(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/test-user/list",
                                schemaPath: "/v1/test-user/list",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return a = i.sent(), [2, new uj.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    testUsers: (0, uj.exists)(t, "testUsers") ? t.testUsers.map(uF) : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1TestUserListGet = function(t) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(n) {
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
            return uO(this, void 0, void 0, function() {
                var n, r, a;
                return uD(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/test-user/logout-manager",
                                schemaPath: "/v1/test-user/logout-manager",
                                method: "POST",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return a = i.sent(), [2, new uj.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1TestUserLogoutManagerPost = function(t) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(n) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1TestUserValidateManagerPost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/test-user/validate-manager",
                                schemaPath: "/v1/test-user/validate-manager",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        managerApiKey: t.managerApiKey
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    managerExternalIdentifier: (0, uj.exists)(t, "managerExternalIdentifier") ? t.managerExternalIdentifier : void 0,
                                    sessionExpirationDate: (0, uj.exists)(t, "sessionExpirationDate") ? new Date(t.sessionExpirationDate) : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1TestUserValidateManagerPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
    }(uj.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uN(n, t), n.prototype.v1UsernameChangePriceGetRaw = function(t) {
            return uO(this, void 0, void 0, function() {
                var n, r, a;
                return uD(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/username/change/price",
                                schemaPath: "/v1/username/change/price",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return a = i.sent(), [2, new uj.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    priceInRobux: (0, uj.exists)(t, "priceInRobux") ? t.priceInRobux : void 0,
                                    basePriceInRobux: (0, uj.exists)(t, "basePriceInRobux") ? t.basePriceInRobux : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1UsernameChangePriceGet = function(t) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(n) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1UsernamePost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/username",
                                schemaPath: "/v1/username",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        username: t.username,
                                        password: t.password
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1UsernamePost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
    }(uj.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uN(n, t), n.prototype.v1UsernamesGetRaw = function(t, n) {
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.username || void 0 === t.username) throw new uj.RequiredError("username", "Required parameter requestParameters.username was null or undefined when calling v1UsernamesGet.");
                            return r = {}, void 0 !== t.username && (r.username = t.username), a = {}, [4, this.request({
                                path: "/v1/usernames",
                                schemaPath: "/v1/usernames",
                                method: "GET",
                                headers: a,
                                query: r
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    usernames: (0, uj.exists)(t, "usernames") ? t.usernames : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1UsernamesGet = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1UsernamesRecoverPost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/usernames/recover",
                                schemaPath: "/v1/usernames/recover",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        targetType: t.targetType,
                                        target: t.target
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    transmissionType: (0, uj.exists)(t, "transmissionType") ? t.transmissionType : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1UsernamesRecoverPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.username || void 0 === t.username) throw new uj.RequiredError("username", "Required parameter requestParameters.username was null or undefined when calling v1UsernamesValidateGet.");
                            if (null === t.birthday || void 0 === t.birthday) throw new uj.RequiredError("birthday", "Required parameter requestParameters.birthday was null or undefined when calling v1UsernamesValidateGet.");
                            if (null === t.context || void 0 === t.context) throw new uj.RequiredError("context", "Required parameter requestParameters.context was null or undefined when calling v1UsernamesValidateGet.");
                            return r = {}, void 0 !== t.username && (r.Username = t.username), void 0 !== t.birthday && (r.Birthday = t.birthday.toISOString()), void 0 !== t.context && (r.Context = t.context), a = {}, [4, this.request({
                                path: "/v1/usernames/validate",
                                schemaPath: "/v1/usernames/validate",
                                method: "GET",
                                headers: a,
                                query: r
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return u5(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1UsernamesValidateGet = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1UsernamesValidatePost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/usernames/validate",
                                schemaPath: "/v1/usernames/validate",
                                method: "POST",
                                headers: a,
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
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return u5(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1UsernamesValidatePost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
    }(uj.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uN(n, t), n.prototype.v1ValidatorsEmailGetRaw = function(t, n) {
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.email || void 0 === t.email) throw new uj.RequiredError("email", "Required parameter requestParameters.email was null or undefined when calling v1ValidatorsEmailGet.");
                            return r = {}, void 0 !== t.email && (r.Email = t.email), a = {}, [4, this.request({
                                path: "/v1/validators/email",
                                schemaPath: "/v1/validators/email",
                                method: "GET",
                                headers: a,
                                query: r
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    isEmailValid: (0, uj.exists)(t, "isEmailValid") ? t.isEmailValid : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1ValidatorsEmailGet = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.displayName || void 0 === t.displayName) throw new uj.RequiredError("displayName", "Required parameter requestParameters.displayName was null or undefined when calling v1ValidatorsRecommendedUsernameFromDisplayNameGet.");
                            if (null === t.birthDay || void 0 === t.birthDay) throw new uj.RequiredError("birthDay", "Required parameter requestParameters.birthDay was null or undefined when calling v1ValidatorsRecommendedUsernameFromDisplayNameGet.");
                            return r = {}, void 0 !== t.displayName && (r.DisplayName = t.displayName), void 0 !== t.birthDay && (r.BirthDay = t.birthDay.toISOString()), a = {}, [4, this.request({
                                path: "/v1/validators/recommendedUsernameFromDisplayName",
                                schemaPath: "/v1/validators/recommendedUsernameFromDisplayName",
                                method: "GET",
                                headers: a,
                                query: r
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return u$(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1ValidatorsRecommendedUsernameFromDisplayNameGet = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.requestBody || void 0 === t.requestBody) throw new uj.RequiredError("requestBody", "Required parameter requestParameters.requestBody was null or undefined when calling v1ValidatorsRecommendedUsernameFromDisplayNamePost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/validators/recommendedUsernameFromDisplayName",
                                schemaPath: "/v1/validators/recommendedUsernameFromDisplayName",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        displayName: t.displayName,
                                        birthday: void 0 === t.birthday ? void 0 : t.birthday.toISOString()
                                    }
                                }(t.requestBody)
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return u$(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1ValidatorsRecommendedUsernameFromDisplayNamePost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.username || void 0 === t.username) throw new uj.RequiredError("username", "Required parameter requestParameters.username was null or undefined when calling v1ValidatorsUsernameGet.");
                            if (null === t.birthDay || void 0 === t.birthDay) throw new uj.RequiredError("birthDay", "Required parameter requestParameters.birthDay was null or undefined when calling v1ValidatorsUsernameGet.");
                            return r = {}, void 0 !== t.username && (r.Username = t.username), void 0 !== t.birthDay && (r.BirthDay = t.birthDay.toISOString()), a = {}, [4, this.request({
                                path: "/v1/validators/username",
                                schemaPath: "/v1/validators/username",
                                method: "GET",
                                headers: a,
                                query: r
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return u$(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1ValidatorsUsernameGet = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.requestBody || void 0 === t.requestBody) throw new uj.RequiredError("requestBody", "Required parameter requestParameters.requestBody was null or undefined when calling v1ValidatorsUsernamePost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/validators/username",
                                schemaPath: "/v1/validators/username",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        username: t.username,
                                        birthday: void 0 === t.birthday ? void 0 : t.birthday.toISOString()
                                    }
                                }(t.requestBody)
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return u$(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1ValidatorsUsernamePost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
    }(uj.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uN(n, t), n.prototype.v1WechatCallbackPostRaw = function(t, n) {
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1WechatCallbackPost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/wechat/callback",
                                schemaPath: "/v1/wechat/callback",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: u6(t.request)
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return u1(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1WechatCallbackPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1WechatConnectPost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/wechat/connect",
                                schemaPath: "/v1/wechat/connect",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: u2(t.request)
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return uz(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1WechatConnectPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return r = {}, void 0 !== t.apiKey && (r.apiKey = t.apiKey), void 0 !== t.getIdentifier && (r.getIdentifier = t.getIdentifier), void 0 !== t.appType && (r.appType = t.appType), a = {}, [4, this.request({
                                path: "/v1/wechat/metadata",
                                schemaPath: "/v1/wechat/metadata",
                                method: "GET",
                                headers: a,
                                query: r
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return u4(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1WechatMetadataGet = function() {
            return uO(this, arguments, void 0, function(t, n) {
                return void 0 === t && (t = {}), uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1WechatMigrateLuobuRnvMappingPost.");
                            return r = {}, void 0 !== t.apiKey && (r.apiKey = t.apiKey), (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/wechat/migrate-luobu-rnv-mapping",
                                schemaPath: "/v1/wechat/migrate-luobu-rnv-mapping",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        unionId: t.unionId,
                                        username: t.username
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    unionId: (0, uj.exists)(t, "unionId") ? t.unionId : void 0,
                                    username: (0, uj.exists)(t, "username") ? t.username : void 0,
                                    isSuccess: (0, uj.exists)(t, "isSuccess") ? t.isSuccess : void 0,
                                    reason: (0, uj.exists)(t, "reason") ? t.reason : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1WechatMigrateLuobuRnvMappingPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1WechatRobloxAccountCreatePost.");
                            return r = {}, void 0 !== t.apiKey && (r.apiKey = t.apiKey), (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/wechat/roblox-account-create",
                                schemaPath: "/v1/wechat/roblox-account-create",
                                method: "POST",
                                headers: a,
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
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    userId: (0, uj.exists)(t, "userId") ? t.userId : void 0,
                                    isSuccess: (0, uj.exists)(t, "isSuccess") ? t.isSuccess : void 0,
                                    reason: (0, uj.exists)(t, "reason") ? t.reason : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1WechatRobloxAccountCreatePost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1WechatSignupwithoutpasswordPost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/wechat/signupwithoutpassword",
                                schemaPath: "/v1/wechat/signupwithoutpassword",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: u3(t.request)
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return u0(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1WechatSignupwithoutpasswordPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var n, r, a;
                return uD(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/wechat/tencent-id",
                                schemaPath: "/v1/wechat/tencent-id",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return a = i.sent(), [2, new uj.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1WechatTencentIdGet = function(t) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(n) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1WechatTokenAuthenticationPost.");
                            return r = {}, void 0 !== t.apiKey && (r.apiKey = t.apiKey), (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/wechat/token-authentication",
                                schemaPath: "/v1/wechat/token-authentication",
                                method: "POST",
                                headers: a,
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
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return u1(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1WechatTokenAuthenticationPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1WechatVerifyConnectPost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/wechat/verify-connect",
                                schemaPath: "/v1/wechat/verify-connect",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: u8(t.request)
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1WechatVerifyConnectPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
    }(uj.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uN(n, t), n.prototype.v1XboxConnectionGetRaw = function(t) {
            return uO(this, void 0, void 0, function() {
                var n, r, a;
                return uD(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/xbox/connection",
                                schemaPath: "/v1/xbox/connection",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return a = i.sent(), [2, new uj.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    hasConnectedXboxAccount: (0, uj.exists)(t, "hasConnectedXboxAccount") ? t.hasConnectedXboxAccount : void 0,
                                    gamertag: (0, uj.exists)(t, "gamertag") ? t.gamertag : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1XboxConnectionGet = function(t) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(n) {
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
            return uO(this, void 0, void 0, function() {
                var n, r, a;
                return uD(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/xbox/disconnect",
                                schemaPath: "/v1/xbox/disconnect",
                                method: "POST",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return a = i.sent(), [2, new uj.JSONApiResponse(a, function(t) {
                                return u7(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1XboxDisconnectPost = function(t) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(n) {
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
            return uO(this, void 0, void 0, function() {
                var n, r, a;
                return uD(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/xbox/get-login-consecutive-days",
                                schemaPath: "/v1/xbox/get-login-consecutive-days",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return a = i.sent(), [2, new uj.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    count: (0, uj.exists)(t, "count") ? t.count : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1XboxGetLoginConsecutiveDaysGet = function(t) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(n) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.xboxTranslateRequest || void 0 === t.xboxTranslateRequest) throw new uj.RequiredError("xboxTranslateRequest", "Required parameter requestParameters.xboxTranslateRequest was null or undefined when calling v1XboxTranslatePost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/xbox/translate",
                                schemaPath: "/v1/xbox/translate",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        ids: t.ids
                                    }
                                }(t.xboxTranslateRequest)
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    users: (0, uj.exists)(t, "Users") ? t.Users.map(u9) : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1XboxTranslatePost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
    }(uj.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        uN(n, t), n.prototype.v1XboxLiveAccountGetRaw = function(t) {
            return uO(this, void 0, void 0, function() {
                var n, r, a;
                return uD(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/xbox-live/account",
                                schemaPath: "/v1/xbox-live/account",
                                method: "GET",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return a = i.sent(), [2, new uj.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    userId: (0, uj.exists)(t, "userId") ? t.userId : void 0,
                                    username: (0, uj.exists)(t, "username") ? t.username : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1XboxLiveAccountGet = function(t) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(n) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1XboxLiveConnectPost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/xbox-live/connect",
                                schemaPath: "/v1/xbox-live/connect",
                                method: "POST",
                                headers: a,
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
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return uz(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1XboxLiveConnectPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new uj.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1XboxLiveConnectVerifyPost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/xbox-live/connect/verify",
                                schemaPath: "/v1/xbox-live/connect/verify",
                                method: "POST",
                                headers: a,
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
                            return i = o.sent(), [2, new uj.JSONApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1XboxLiveConnectVerifyPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var n, r, a;
                return uD(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return n = {}, r = {}, [4, this.request({
                                path: "/v1/xbox-live/disconnect",
                                schemaPath: "/v1/xbox-live/disconnect",
                                method: "POST",
                                headers: r,
                                query: n
                            }, t)];
                        case 1:
                            return a = i.sent(), [2, new uj.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1XboxLiveDisconnectPost = function(t) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(n) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.xboxLoginRequest || void 0 === t.xboxLoginRequest) throw new uj.RequiredError("xboxLoginRequest", "Required parameter requestParameters.xboxLoginRequest was null or undefined when calling v1XboxLiveLoginPost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/xbox-live/login",
                                schemaPath: "/v1/xbox-live/login",
                                method: "POST",
                                headers: a,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        clientTimeStamp: void 0 === t.clientTimeStamp ? void 0 : t.clientTimeStamp.toISOString()
                                    }
                                }(t.xboxLoginRequest)
                            }, n)];
                        case 1:
                            return i = o.sent(), [2, new uj.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    newDailyLogin: (0, uj.exists)(t, "newDailyLogin") ? t.newDailyLogin : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1XboxLiveLoginPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
            return uO(this, void 0, void 0, function() {
                var r, a, i;
                return uD(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.signupRequest || void 0 === t.signupRequest) throw new uj.RequiredError("signupRequest", "Required parameter requestParameters.signupRequest was null or undefined when calling v1XboxLiveSignupPost.");
                            return r = {}, (a = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/xbox-live/signup",
                                schemaPath: "/v1/xbox-live/signup",
                                method: "POST",
                                headers: a,
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
                            return i = o.sent(), [2, new uj.JSONApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1XboxLiveSignupPost = function(t, n) {
            return uO(this, void 0, void 0, function() {
                return uD(this, function(r) {
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
    }(uj.BaseAPI);
    var lt = t.i(272593);
    let ln = new le((0, lt.createClientConfiguration)("auth", "bedev1"));
    var lr = t.i(66424),
        la = t.i(790806),
        li = t.i(650502),
        lo = t.i(220311);
    let ls = [lo.default.Home, lo.default.RoadMap, lo.default.AvatarAnalytics, lo.default.ShareLinkAnalytics, lo.default.StoreAnalytics, lo.default.Community, lo.default.Notifications, lo.default.Settings, lo.default.SendrNotificationPreferences, lo.default.Preferences, lo.default.Advanced, lo.default.DataCollectionSettings, lo.default.MarketplaceOnboarding, lo.default.FiatPaidAccess, lo.default.PublicPublish, lo.default.DevEx, lo.default.Wallet, lo.default.GameTranslation, lo.default.GameStringTranslation],
        lu = t => {
            let {
                provider: n
            } = t, {
                locale: r
            } = (0, oR.useLocalization)();
            return (0, od.useEffect)(() => {
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
        return (0, y.jsx)(ll.ThemeModeProvider, {
            bedev2BaseUrl: "https://apis.roblox.com",
            currentUser: r,
            children: n
        })
    };
    var lf = t.i(354088),
        lp = t.i(578717);
    let lh = t => {
        let {
            themeElement: n,
            children: r
        } = t, {
            themeMode: a
        } = (0, ll.useThemeMode)();
        return (0, od.useEffect)(() => {
            let t;
            if (null == n) return;
            switch (a) {
                case "light":
                    t = "color-mode-light";
                    break;
                case "dark":
                    t = "color-mode-dark";
                    break;
                default:
                    t = "color-mode-system"
            }
            let {
                classList: r
            } = n;
            return r.add(t), () => {
                r.remove(t)
            }
        }, [a, n]), (0, y.jsx)(lp.UIThemeProvider, {
            theme: a,
            children: r
        })
    };
    var lv = t.i(157310),
        lm = t.i(28850),
        ly = t.i(950492);
    let lg = ["creatorTransparency", "creatorAcknowledgments"];
    var lb = t.i(945451),
        lw = t.i(826246),
        lx = t.i(968892),
        lP = t.i(973047),
        lT = t.i(830655),
        lR = t.i(663624),
        lS = t.i(401263),
        lE = t.i(889311),
        lq = t.i(512229),
        lk = t.i(748411),
        lA = t.i(881670),
        lC = uj;
    class lI extends lC.BaseAPI {
        getViolation(t, n) {
            return this.request({
                path: "/v2/users/".concat(encodeURIComponent(t), "/violations/").concat(encodeURIComponent(n)),
                schemaPath: "/v2/users/{user}/violations/{violation}",
                method: "GET",
                headers: {}
            }).then(t => new lC.JSONApiResponse(t).value())
        }
        constructor() {
            super((0, lt.createClientConfiguration)("moderation-appeal-service", "bedev2"))
        }
    }
    let lj = new lI;
    var lL = t.i(330159),
        lN = t.i(641831),
        lO = t.i(438641),
        lD = t.i(960916);
    let lM = new Set(["VIOLATION_TYPE_NONE", "VIOLATION_TYPE_INVALID"]),
        l_ = lO.z.union([lO.z.object({
            type: lO.z.literal("text"),
            labelKey: lO.z.string(),
            text: lO.z.string().optional(),
            textKey: lO.z.string().optional(),
            textKeyParameters: lO.z.record(lO.z.string(), lO.z.string()).optional()
        }).refine(t => void 0 !== t.text || void 0 !== t.textKey), lO.z.object({
            type: lO.z.literal("image"),
            labelKey: lO.z.string(),
            url: lO.z.string(),
            altLabelKey: lO.z.string().optional()
        }), lO.z.object({
            type: lO.z.literal("timestamp"),
            labelKey: lO.z.string(),
            unix: lO.z.number()
        })]),
        lB = t => {
            let {
                label: n,
                value: r,
                preserveLineBreaks: a = !1
            } = t;
            return (0, y.jsxs)("div", {
                className: "flex flex-col",
                children: [(0, y.jsx)("span", {
                    className: "text-title-medium",
                    children: "".concat(n, ":")
                }), (0, y.jsx)("p", {
                    className: "text-body-medium margin-none [word-break:break-word] ".concat(a ? "[white-space:pre-line]" : ""),
                    children: r
                })]
            })
        },
        lV = t => {
            let {
                url: n,
                alt: r,
                loadingLabel: a
            } = t, [i, o] = (0, od.useState)(!0), s = () => o(!1);
            return (0, y.jsxs)("div", {
                className: "flex aspect-1-1 justify-center items-center bg-shift-200 radius-medium",
                children: [(0, y.jsx)("img", {
                    className: "size-full [object-fit:contain] ".concat(i ? "hidden" : ""),
                    src: n,
                    alt: r,
                    onLoad: s,
                    onError: s
                }), i && (0, y.jsx)(lT.ProgressCircle, {
                    ariaLabel: a,
                    size: "Medium",
                    variant: "Indeterminate"
                })]
            })
        },
        lU = (0, oR.withTranslation)(t => {
            var n, r;
            let {
                violation: a,
                decisionMethod: i
            } = t, {
                translateWithNamespace: o
            } = (0, oR.useTranslation)(), {
                locale: s
            } = (0, oR.useLocalization)(), u = (0, od.useMemo)(() => new Intl.DateTimeFormat(null != s ? s : oR.Locale.English, {
                dateStyle: "medium",
                timeStyle: "short"
            }).format, [s]), l = Object.entries(a.abuse_type_keys).filter(t => {
                let [n] = t;
                return !lM.has(n)
            }).map(t => {
                let [n, r] = t;
                return r ? o(lA.TranslationNamespace.NotApproved, r) : n
            }).sort((t, n) => t.localeCompare(n)), c = (null == (r = a.evidence) ? void 0 : r.type) !== "platform" ? [] : (null != (n = a.evidence.elements) ? n : []).flatMap(t => {
                let n = l_.safeParse(t);
                return n.success ? [n.data] : []
            }), d = c.find(t => "image" === t.type), f = o(lA.TranslationNamespace.DashboardModeration, "Label.ContentReviewed"), p = o(lA.TranslationNamespace.NotApproved, "Label.LoadingImage"), h = o(lA.TranslationNamespace.NotApproved, "Label.Reason"), v = o(lA.TranslationNamespace.NotApproved, "Label.AbuseType.Other"), m = o(lA.TranslationNamespace.NotApproved, "Label.ModeratorNote"), g = o(lA.TranslationNamespace.NotApproved, "Label.ReviewDate"), b = o(lA.TranslationNamespace.NotApproved, "Label.DecisionMethod");
            return (0, y.jsxs)("div", {
                className: "flex flex-col gap-medium",
                children: [(0, y.jsx)("span", {
                    className: "text-title-large",
                    children: f
                }), (0, y.jsxs)("div", {
                    className: "flex flex-col gap-small padding-large bg-shift-100 radius-medium",
                    children: [d && (0, y.jsxs)("div", {
                        className: "flex flex-col gap-medium",
                        children: [(0, y.jsx)("div", {
                            className: "width-[50%] self-center",
                            children: (0, y.jsx)(lV, {
                                url: d.url,
                                alt: d.altLabelKey && o(lA.TranslationNamespace.AppealsPortal, d.altLabelKey),
                                loadingLabel: p
                            })
                        }), (0, y.jsx)(lD.Divider, {
                            orientation: "horizontal",
                            variant: "Standard"
                        })]
                    }), (0, y.jsx)(lB, {
                        label: h,
                        value: l.join(", ") || v
                    }), a.user_note && (0, y.jsx)(lB, {
                        label: m,
                        value: a.user_note,
                        preserveLineBreaks: !0
                    }), c.map(t => {
                        if ("text" === t.type) {
                            var n, r;
                            return (0, y.jsx)(lB, {
                                label: o(lA.TranslationNamespace.AppealsPortal, t.labelKey),
                                value: null != (n = t.text) ? n : o(lA.TranslationNamespace.AppealsPortal, null != (r = t.textKey) ? r : "", t.textKeyParameters),
                                preserveLineBreaks: !0
                            }, t.labelKey)
                        }
                        return "timestamp" === t.type ? (0, y.jsx)(lB, {
                            label: o(lA.TranslationNamespace.NotApproved, t.labelKey),
                            value: u(1e3 * t.unix)
                        }, t.labelKey) : null
                    }), (0, y.jsx)(lB, {
                        label: g,
                        value: u(new Date(a.create_time))
                    }), i && (0, y.jsx)(lB, {
                        label: b,
                        value: i
                    })]
                })]
            })
        }, [lA.TranslationNamespace.DashboardModeration, lA.TranslationNamespace.AppealsPortal, lA.TranslationNamespace.NotApproved]),
        lF = (0, oR.withTranslation)(t => {
            let n, r, a, {
                    acknowledgment: i,
                    values: o,
                    onDismiss: s
                } = t,
                {
                    translateWithNamespace: u,
                    translateWithNamespaceHTML: l
                } = (0, lS.default)((0, oR.useTranslation)()),
                {
                    locale: c
                } = (0, oR.useLocalization)(),
                d = (0, od.useMemo)(() => new lR.UnifiedLogger({
                    product: "CreatorDashboard",
                    eventBaseUrl: lq.eventStreamBaseUrl
                }), []),
                {
                    user: f
                } = (0, lc.useAuthentication)(),
                {
                    data: p,
                    isLoading: h,
                    error: v
                } = (n = null == f ? void 0 : f.id, r = o.decisionEventId, (0, lv.useQuery)({
                    queryKey: ["moderationPortal", "violation", n, r],
                    queryFn: () => lj.getViolation(String(n), r),
                    enabled: void 0 !== n && "" !== r
                })),
                {
                    data: m
                } = (0, lk.useUniverseDetailsQuery)(i.universeId),
                g = u(lA.TranslationNamespace.DashboardModeration, "Heading.GameHasIssue"),
                b = u(lA.TranslationNamespace.Controls, "Action.OK"),
                w = u(lA.TranslationNamespace.Home, "Label.ViewDetails"),
                x = (0, lN.default)(o.decisionEventId),
                P = (0, od.useMemo)(() => (0, lL.default)(i, o), [i, o]),
                T = (0, od.useMemo)(() => i.expiresAt && new Intl.DateTimeFormat(null != c ? c : oR.Locale.English, {
                    dateStyle: "medium"
                }).format(i.expiresAt), [i.expiresAt, c]);
            (0, od.useEffect)(() => {
                d.logImpressionEvent({
                    eventName: lE.default.SelectEvictionAckOverlayImpression,
                    parameters: P
                })
            }, [d, P]);
            let R = (0, od.useCallback)(() => {
                    s(i)
                }, [i, s]),
                S = (0, od.useCallback)(() => {
                    d.logClickEvent({
                        eventName: lE.default.SelectEvictionAckOverlayDetailClick,
                        parameters: P
                    })
                }, [d, P]);
            return a = h ? (0, y.jsx)("div", {
                className: "flex justify-center padding-y-large",
                children: (0, y.jsx)(lT.ProgressCircle, {
                    ariaLabel: u(lA.TranslationNamespace.Creations, "Label.Loading"),
                    size: "Medium",
                    variant: "Indeterminate"
                })
            }) : v || !p ? (0, y.jsx)("p", {
                className: "text-body-medium margin-none",
                children: u(lA.TranslationNamespace.Error, "Response.UnknownError")
            }) : (0, y.jsx)(lU, {
                violation: p
            }), (0, y.jsx)(lP.Dialog, {
                open: !0,
                size: "Medium",
                isModal: !0,
                hasCloseAffordance: !1,
                children: (0, y.jsxs)(lP.DialogContent, {
                    children: [(0, y.jsxs)(lP.DialogBody, {
                        children: [(0, y.jsx)(lP.DialogTitle, {
                            className: "text-heading-small margin-none",
                            children: g
                        }), (null == m ? void 0 : m.name) && (0, y.jsx)("p", {
                            className: "content-default",
                            children: m.name
                        }), T && (0, y.jsx)("div", {
                            className: "margin-top-small",
                            children: (0, y.jsx)(lw.Alert, {
                                variant: "Feedback",
                                severity: "Warning",
                                hasCloseAffordance: !1,
                                children: (0, y.jsx)("span", {
                                    children: l(lA.TranslationNamespace.DashboardModeration, "Description.AvoidSelectRemoval", [{
                                        opening: "boldStart",
                                        closing: "boldEnd",
                                        content: t => (0, y.jsx)("strong", {
                                            children: t
                                        })
                                    }], {
                                        date: T
                                    })
                                })
                            })
                        }), (0, y.jsxs)("div", {
                            className: "flex flex-col gap-medium margin-top-medium",
                            children: [a, (0, y.jsx)(lx.Button, {
                                as: "a",
                                href: x,
                                target: "_blank",
                                variant: "Standard",
                                size: "Small",
                                className: "width-full",
                                onClick: S,
                                children: (0, y.jsx)("span", {
                                    className: "text-body-medium",
                                    children: w
                                })
                            })]
                        })]
                    }), (0, y.jsx)(lP.DialogFooter, {
                        children: (0, y.jsx)("div", {
                            className: "flex justify-end width-full",
                            children: (0, y.jsx)(lx.Button, {
                                variant: "Emphasis",
                                type: "button",
                                onClick: R,
                                className: "width-full",
                                children: b
                            })
                        })
                    })]
                })
            })
        }, [lA.TranslationNamespace.Home, lA.TranslationNamespace.DashboardModeration, lA.TranslationNamespace.Controls, lA.TranslationNamespace.Creations, lA.TranslationNamespace.Error]),
        lG = t => {
            let {
                isSuppressed: n = !1
            } = t, {
                themeMode: r
            } = (0, ll.useThemeMode)(), {
                status: a
            } = (0, lc.useAuthentication)(), i = "success" === a, {
                data: o,
                isLoading: s,
                error: u
            } = (0, lv.useQuery)({
                queryKey: lg,
                queryFn: async () => ({
                    items: await (0, ly.default)({
                        api: t => lm.default.listCreatorAcknowledgments(t),
                        getItems: t => {
                            var n;
                            return null != (n = t.items) ? n : []
                        },
                        getPageToken: t => t.nextCursor
                    })
                }),
                staleTime: 1 / 0,
                enabled: i
            }), {
                dismissAcks: l,
                filterAcks: c
            } = (0, lb.useOverlayAcknowledgmentsLocalStorage)(), d = (0, od.useMemo)(() => {
                var t;
                return c(null != (t = null == o ? void 0 : o.items) ? t : [])
            }, [null == o ? void 0 : o.items, c]), f = (0, od.useMemo)(() => d.find(t => {
                let n = t.values;
                return !!n && ("SelectGracePeriod" === n.type || (n.type, !1))
            }), [d]), p = (0, od.useCallback)(t => {
                l([t])
            }, [l]), h = null == f ? void 0 : f.values;
            return n || !i || s || u || !f || !h ? null : "SelectGracePeriod" === h.type ? (0, y.jsx)(lp.UIThemeProvider, {
                theme: r,
                children: (0, y.jsx)(lF, {
                    acknowledgment: f,
                    values: h,
                    onDismiss: p
                })
            }) : (h.type, null)
        };
    var lK = t.i(709337),
        lW = t.i(215955),
        lz = t.i(479236),
        lH = t.i(964956),
        lJ = t.i(507742),
        lQ = t.i(523426),
        lX = t.i(239328),
        l$ = t.i(245299),
        lZ = t.i(954119),
        lY = t.i(134731),
        l0 = t.i(165136),
        l1 = t.i(942100),
        l2 = t.i(779433),
        l4 = t.i(118413),
        l3 = t.i(428993),
        l6 = t.i(9436),
        l8 = t.i(846130),
        l5 = t.i(787617),
        l9 = t.i(360894),
        l7 = t.i(704211),
        ce = t.i(92174),
        ct = t.i(926415),
        cn = t.i(481186),
        cr = t.i(426173),
        ca = t.i(242002),
        ci = t.i(157700);
    let co = (0, ci.defineFlag)({
        namespace: "game-engine-geometry",
        name: "enableMeshTextureApiRemoveIdVerification",
        defaultValue: !1
    });
    var cs = t.i(886525),
        cu = t.i(967230),
        cl = t.i(82899),
        cc = t.i(199972),
        cd = t.i(477797);
    let cf = (0, ci.defineFlag)({
        namespace: "page-migrations",
        name: "preferencesPageMigrationEnabled",
        defaultValue: !1
    });
    var cp = t.i(100022),
        ch = t.i(494192),
        cv = t.i(378089);
    let cm = [{
        flag: lQ.enhancedAntiCheatAccess,
        metadata: {
            namespace: "anti-cheat",
            name: "enhancedAntiCheatAccess",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lX.enableTaxonomyBasedCreatorDashboard,
        metadata: {
            namespace: "avatar-marketplace",
            name: "enableTaxonomyBasedCreatorDashboard",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lX.enableCreatorShowcases,
        metadata: {
            namespace: "avatar-marketplace",
            name: "enableCreatorShowcases",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lX.enableAvatarCreationTokenCategories,
        metadata: {
            namespace: "avatar-marketplace",
            name: "enableAvatarCreationTokenCategories",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lX.enableBulkMakeupTokenCreation,
        metadata: {
            namespace: "avatar-marketplace",
            name: "enableBulkMakeupTokenCreation",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lX.isAutoPublishPreferencesEnabled,
        metadata: {
            namespace: "avatar-marketplace",
            name: "isAutoPublishPreferencesEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lX.showTaxonomyOnAvatarItemAnalyticsTab,
        metadata: {
            namespace: "avatar-marketplace",
            name: "showTaxonomyOnAvatarItemAnalyticsTab",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lX.enableCoreContentGatedBanner,
        metadata: {
            namespace: "avatar-marketplace",
            name: "enableCoreContentGatedBanner",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lX.enableTimedOptionsSunsetBanner,
        metadata: {
            namespace: "avatar-marketplace",
            name: "enableTimedOptionsSunsetBanner",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l$.enableEnvironments,
        metadata: {
            namespace: "collaborative-tools",
            name: "enableEnvironments",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lZ.creatorAnalytics,
        metadata: {
            namespace: "communities",
            name: "CreatorAnalytics",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "group"
        }
    }, {
        flag: lY.isAssetPrivacyOptOutSurveyEnabled,
        metadata: {
            namespace: "content-access-and-inventory",
            name: "isAssetPrivacyOptOutSurveyEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lY.isAssetAccessRequestsEnabled,
        metadata: {
            namespace: "content-access-and-inventory",
            name: "isAssetAccessRequestsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lY.isModelCustomThumbnailUploadEnabled,
        metadata: {
            namespace: "content-access-and-inventory",
            name: "isModelCustomThumbnailUploadEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lY.isAssetDependenciesViewerEnabled,
        metadata: {
            namespace: "content-access-and-inventory",
            name: "isAssetDependenciesViewerEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lY.isCreatorStoreVideoMultipartUploadEnabled,
        metadata: {
            namespace: "content-access-and-inventory",
            name: "isCreatorStoreVideoMultipartUploadEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lY.isPricingEligibilityV2Enabled,
        metadata: {
            namespace: "content-access-and-inventory",
            name: "isPricingEligibilityV2Enabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: lY.isPublishBeforeExposeEnabled,
        metadata: {
            namespace: "content-access-and-inventory",
            name: "isPublishBeforeExposeEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l0.isExperiencePreviewEnabled,
        metadata: {
            namespace: "content-licensing",
            name: "isExperiencePreviewEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: l0.enableIpPlatformLicenseRecommendations,
        metadata: {
            namespace: "content-licensing",
            name: "enableIpPlatformLicenseRecommendations",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l0.isImageAttachmentEnabledInLicenseApplication,
        metadata: {
            namespace: "content-licensing",
            name: "isImageAttachmentEnabledInLicenseApplication",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l0.isShowcaseExperiencesEnabled,
        metadata: {
            namespace: "content-licensing",
            name: "isShowcaseExperiencesEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l0.isIgnoreMatchEnabled,
        metadata: {
            namespace: "content-licensing",
            name: "isIgnoreMatchEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l0.isAvatarItemLicensingEnabled,
        metadata: {
            namespace: "content-licensing",
            name: "isAvatarItemLicensingEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l0.isInGameSalesLicensingEnabled,
        metadata: {
            namespace: "content-licensing",
            name: "isInGameSalesLicensingEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l0.maxCollectibleItemDetailsRequestCount,
        metadata: {
            namespace: "content-licensing",
            name: "maxCollectibleItemDetailsRequestCount",
            defaultValue: 30,
            valueType: "number",
            contextType: "static"
        }
    }, {
        flag: l0.isIphEarningsTotalAcrossLicenseTypesEnabled,
        metadata: {
            namespace: "content-licensing",
            name: "isIphEarningsTotalAcrossLicenseTypesEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l1.isPromotionalTextEnabled,
        metadata: {
            namespace: "content-publishing",
            name: "isPromotionalTextEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l1.isExperienceNameCharacterValidationEnabled,
        metadata: {
            namespace: "content-publishing",
            name: "isExperienceNameCharacterValidationEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l2.questionnaireV2Allowlist,
        metadata: {
            namespace: "content-suitability",
            name: "questionnaireV2Allowlist",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l2.questionnaireV2Q1Release,
        metadata: {
            namespace: "content-suitability",
            name: "questionnaireV2Q1Release",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l2.enableProposedIarcQuestionnaire,
        metadata: {
            namespace: "content-suitability",
            name: "enableProposedIarcQuestionnaire",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l4.analyticsChartLoadEventstreamEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "analyticsChartLoadEventstreamEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l4.isLimitedAnalyticsAdminMonitoringNavigationEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isLimitedAnalyticsAdminMonitoringNavigationEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l4.visibleAssetIdInPersonalizationEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "visibleAssetIdInPersonalizationEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l4.isExperimentationTemplatesEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isExperimentationTemplatesEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: l4.isCustomMetricsBackendEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isCustomMetricsBackendEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: l4.isCustomMetricMdeEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isCustomMetricMdeEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: l4.isExperimentTargetingEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isExperimentTargetingEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: l4.isTargetingConfigsEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isTargetingConfigsEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: l4.isExperimentNullControlValueEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isExperimentNullControlValueEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: l4.isExperimentRolloutEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isExperimentRolloutEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: l4.isGeneralBreakGlassBannerEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "IsGeneralBreakGlassBannerEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l4.isMonetizationBreakGlassBannerEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "IsMonetizationBreakGlassBannerEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l4.isPlayerFeedbackExampleCommentsEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isPlayerFeedbackExampleCommentsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l4.isAnalyticsAssistantChatHistoryEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isAnalyticsAssistantChatHistoryEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l4.isAnalyticsAssistantChatEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isAnalyticsAssistantChatEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l4.isAnalyticsAssistantStreamSilenceRecoveryEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isAnalyticsAssistantStreamSilenceRecoveryEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l4.isAnalyticsAssistantIssueBannerEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isAnalyticsAssistantIssueBannerEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l4.showCreatorRewardsReportingDisclaimer,
        metadata: {
            namespace: "creator-analytics",
            name: "showCreatorRewardsReportingDisclaimer",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l4.isRotraceMetricEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isRotraceMetricEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: l4.isTelemetryMigrationEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isTelemetryMigrationEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: l4.showVideoServiceDashboard,
        metadata: {
            namespace: "creator-analytics",
            name: "showVideoServiceDashboard",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l4.isTreemapColorBySiblingProportionEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isTreemapColorBySiblingProportionEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l4.isAssistantChartOverflowMenuEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isAssistantChartOverflowMenuEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l4.isAnalyticsMetricAwareYAxisFormatterEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isAnalyticsMetricAwareYAxisFormatterEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l4.isCustomDashboardsLocalStorageEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isCustomDashboardsLocalStorageEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l4.isJourneyEventsEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isJourneyEventsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: l4.isClientSessionsEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isClientSessionsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: l4.isEhdResultsEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isEhdResultsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l4.isEhdResultsAlwaysFetched,
        metadata: {
            namespace: "creator-analytics",
            name: "isEhdResultsAlwaysFetched",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l4.isMetricVariantChartStateEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isMetricVariantChartStateEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l4.isPeriodSummaryBridgeEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isPeriodSummaryBridgeEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: l4.isExperimentSegmentationEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isExperimentSegmentationEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l4.isExperimentMetricsV2Enabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isExperimentMetricsV2Enabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l4.isClientSessionDetailsV2Enabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isClientSessionDetailsV2Enabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: l4.isObservabilityDataCapturesEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isObservabilityDataCapturesEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: l4.isRaqiv2RequestQueryEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isRaqiv2RequestQueryEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l3.isRevenueShareAgreementsEnabled,
        metadata: {
            namespace: "creator-business",
            name: "isRevenueShareAgreementsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l3.enableVirtualTransactionsTab,
        metadata: {
            namespace: "creator-business",
            name: "enableVirtualTransactionsTab",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l3.newCreatorWallets,
        metadata: {
            namespace: "creator-business",
            name: "newCreatorWallets",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l3.newTransactionsFlag,
        metadata: {
            namespace: "creator-business",
            name: "newTransactionsFlag",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l6.isBadgeDefaultIconEnabled,
        metadata: {
            namespace: "creator-creations",
            name: "isBadgeDefaultIconEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l6.isMomentsUploadEnabled,
        metadata: {
            namespace: "creator-creations",
            name: "isMomentsUploadEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l6.isMomentsSitetestUrlParsingEnabled,
        metadata: {
            namespace: "creator-creations",
            name: "isMomentsSitetestUrlParsingEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l6.isTextDocumentEnabled,
        metadata: {
            namespace: "creator-creations",
            name: "isTextDocumentEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l6.isMomentsUploadLanguageSelectEnabled,
        metadata: {
            namespace: "creator-creations",
            name: "isMomentsUploadLanguageSelectEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l6.isMomentsFeedIdEnabled,
        metadata: {
            namespace: "creator-creations",
            name: "isMomentsFeedIdEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l6.isMomentsShareLinkEnabled,
        metadata: {
            namespace: "creator-creations",
            name: "isMomentsShareLinkEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l6.isMomentsPostCreationEnabled,
        metadata: {
            namespace: "creator-creations",
            name: "isMomentsPostCreationEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l6.isMomentsModeratedTabEnabled,
        metadata: {
            namespace: "creator-creations",
            name: "isMomentsModeratedTabEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l8.enablePlayerSupport,
        metadata: {
            namespace: "creator-gameops",
            name: "enablePlayerSupport",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: l8.enablePlayerSupportTicketTranslation,
        metadata: {
            namespace: "creator-gameops",
            name: "enablePlayerSupportTicketTranslation",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l8.enablePlayerHostedEvents,
        metadata: {
            namespace: "creator-gameops",
            name: "enablePlayerHostedEvents",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l8.enablePlayerSupportCreatorTicketReroute,
        metadata: {
            namespace: "creator-gameops",
            name: "enablePlayerSupportCreatorTicketReroute",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l8.enablePlayerSupportArchive,
        metadata: {
            namespace: "creator-gameops",
            name: "enablePlayerSupportArchive",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l8.enablePlayerSupportCategoryChange,
        metadata: {
            namespace: "creator-gameops",
            name: "enablePlayerSupportCategoryChange",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l8.enablePlayerSupportSpamManagement,
        metadata: {
            namespace: "creator-gameops",
            name: "enablePlayerSupportSpamManagement",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l8.enableEarlyTestersUserOwnedGame,
        metadata: {
            namespace: "creator-gameops",
            name: "enableEarlyTestersUserOwnedGame",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l5.tryOnWebButtonEnabled,
        metadata: {
            namespace: "creator-platform",
            name: "tryOnWebButtonEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l9.creatorRoadmapEnabled,
        metadata: {
            namespace: "creator-roadmap",
            name: "creatorRoadmapEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l7.isCsmExtendedMetricsEnabled,
        metadata: {
            namespace: "creator-services-insights",
            name: "isCsmExtendedMetricsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: l7.isServerLogStructuredStackTracesEnabled,
        metadata: {
            namespace: "creator-services-insights",
            name: "isServerLogStructuredStackTracesEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: ce.shouldUseWatermarkFiatCalculation,
        metadata: {
            namespace: "devex",
            name: "shouldUseWatermarkFiatCalculation",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: ce.isTaxDocumentationEnabled,
        metadata: {
            namespace: "devex",
            name: "isTaxDocumentationEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: ct.isBandwidthNetworkTabEnabled,
        metadata: {
            namespace: "engine-networking",
            name: "isBandwidthNetworkTabEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cn.isQueueServiceAnalyticsEnabled,
        metadata: {
            namespace: "extended-services",
            name: "isQueueServiceAnalyticsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cr.showDevExWithholdingAmount,
        metadata: {
            namespace: "financial-platform",
            name: "ShowDevExWithholdingAmount",
            defaultValue: 0,
            valueType: "number",
            contextType: "static"
        }
    }, {
        flag: cr.showOct20ShutoffBanner,
        metadata: {
            namespace: "financial-platform",
            name: "ShowOct20ShutoffBanner",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cr.isTaxDocumentationOpenToDevexEligible,
        metadata: {
            namespace: "financial-platform",
            name: "isTaxDocumentationOpenToDevexEligible",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cr.isTaxFormDeliveryConsentEnabled,
        metadata: {
            namespace: "financial-platform",
            name: "isTaxFormDeliveryConsentEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cr.taxFormDeliveryConsentRolloutPercentage,
        metadata: {
            namespace: "financial-platform",
            name: "taxFormDeliveryConsentRolloutPercentage",
            defaultValue: 100,
            valueType: "number",
            contextType: "static"
        }
    }, {
        flag: cr.devexFinancialPolicyRolloutPercentage,
        metadata: {
            namespace: "financial-platform",
            name: "devexFinancialPolicyRolloutPercentage",
            defaultValue: 0,
            valueType: "number",
            contextType: "static"
        }
    }, {
        flag: ca.isAcquisitionThumbnailUpsellEnabled,
        metadata: {
            namespace: "game-discovery-serving",
            name: "isAcquisitionThumbnailUpsellEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: ca.isHomeAcquisitionSignalsLayoutRefreshEnabled,
        metadata: {
            namespace: "game-discovery-serving",
            name: "isHomeAcquisitionSignalsLayoutRefreshEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: co,
        metadata: {
            namespace: "game-engine-geometry",
            name: "enableMeshTextureApiRemoveIdVerification",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cs.enableExperienceLaunchTimeChart,
        metadata: {
            namespace: "game-engine-streaming",
            name: "enableExperienceLaunchTimeChart",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: uA.enableGroupGameEarlyTesters,
        metadata: {
            namespace: "groups",
            name: "enableGroupGameEarlyTesters",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: uA.enableGroupModerationPage,
        metadata: {
            namespace: "groups",
            name: "enableGroupModerationPage",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: uA.enableGroupDeactivation,
        metadata: {
            namespace: "groups",
            name: "enableGroupDeactivation",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cu.isAdsPageRedesignEnabled,
        metadata: {
            namespace: "immersive-ads",
            name: "isAdsPageRedesignEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cu.isManagedRewardedTabEnabled,
        metadata: {
            namespace: "immersive-ads",
            name: "isManagedRewardedTabEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cu.isInGameTemplatePlacementEnabled,
        metadata: {
            namespace: "immersive-ads",
            name: "isInGameTemplatePlacementEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cu.managedRewardedCtrBenchmarkLow,
        metadata: {
            namespace: "immersive-ads",
            name: "managedRewardedCtrBenchmarkLow",
            defaultValue: .01,
            valueType: "number",
            contextType: "static"
        }
    }, {
        flag: cu.managedRewardedCtrBenchmarkHigh,
        metadata: {
            namespace: "immersive-ads",
            name: "managedRewardedCtrBenchmarkHigh",
            defaultValue: .05,
            valueType: "number",
            contextType: "static"
        }
    }, {
        flag: cu.isRewardItemAnalyticsEnabled,
        metadata: {
            namespace: "immersive-ads",
            name: "isRewardItemAnalyticsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cl.isLeaderboardConfigsEnabled,
        metadata: {
            namespace: "leaderboards",
            name: "isLeaderboardConfigsEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cc.imageLocalizationSettingsEnabled,
        metadata: {
            namespace: "localization",
            name: "imageLocalizationSettingsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cc.imageTranslationAllowlist,
        metadata: {
            namespace: "localization",
            name: "imageTranslationAllowlist",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cc.enableImageTranslationEnrollment,
        metadata: {
            namespace: "localization",
            name: "enableImageTranslationEnrollment",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cc.enableImageTranslationListingTab,
        metadata: {
            namespace: "localization",
            name: "enableImageTranslationListingTab",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cc.enableSharedTranslationListComponents,
        metadata: {
            namespace: "localization",
            name: "enableSharedTranslationListComponents",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cd.mockManagedPricingSummary,
        metadata: {
            namespace: "monetization",
            name: "mockManagedPricingSummary",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cd.mockManagedPricingEvents,
        metadata: {
            namespace: "monetization",
            name: "mockManagedPricingEvents",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cd.mockHardCodedPrices,
        metadata: {
            namespace: "monetization",
            name: "mockHardCodedPrices",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cd.isProductArchiveEnabled,
        metadata: {
            namespace: "monetization",
            name: "isProductArchiveEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cd.mockShopItemsExternalEligibility,
        metadata: {
            namespace: "monetization",
            name: "mockShopItemsExternalEligibility",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cf,
        metadata: {
            namespace: "page-migrations",
            name: "preferencesPageMigrationEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cp.enablePayoutWatermarkContributions,
        metadata: {
            namespace: "payouts",
            name: "enablePayoutWatermarkContributions",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "group"
        }
    }, {
        flag: ch.presetChatEnabled,
        metadata: {
            namespace: "preset-chat",
            name: "presetChatEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cv.enableTalentHubV2,
        metadata: {
            namespace: "talent-hub",
            name: "enableTalentHubV2",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: cv.enableTalentHubV2M2,
        metadata: {
            namespace: "talent-hub",
            name: "enableTalentHubV2M2",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }];
    var cy = t.i(230242);

    function cg(t) {
        var n;
        let {
            namespace: r,
            name: a,
            value: i
        } = t;
        if ("boolean" != typeof i) return;
        let o = null == (n = (0, cy.getClient)()) ? void 0 : n.getIntegrationByName("FeatureFlags");
        o && o.addFeatureFlag("".concat(r, ".").concat(a), i)
    }

    function cb() {
        return null != n || (n = (0, ci.initFlags)({
            applicationId: "creator-dashboard",
            baseUrl: "https://apis.roblox.com",
            onFlagEvaluated: cg
        })), n
    }
    var cw = t.i(745873);
    let cx = null,
        cP = (0, lJ.default)(() => t.A(73576).then(t => {
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
        cT = () => {
            let t = (0, of.useRouter)(),
                n = (0, cw.useCurrentGroup)(),
                [r, a] = (0, od.useState)(!1);
            (0, od.useEffect)(() => {
                let t = !0;
                return async function() {
                    try {
                        null != cx || (cx = cb().enableOverrides({
                            mode: "authorized-only",
                            useDefault: !0
                        }));
                        let n = await cx;
                        t && a(n)
                    } catch (n) {
                        t && a(!1)
                    }
                }(), () => {
                    t = !1
                }
            }, []);
            let i = (0, od.useMemo)(() => {
                let {
                    id: r
                } = t.query, a = "string" == typeof r ? parseInt(r, 10) : NaN;
                return {
                    ...Number.isNaN(a) ? {} : {
                        universeId: a
                    },
                    ...n ? {
                        groupId: n.id
                    } : {}
                }
            }, [n, t.query]);
            return r ? (0, y.jsx)(cP, {
                flags: cm,
                contexts: i
            }) : null
        };
    var cR = t.i(911502);
    let cS = t => {
        let {
            providers: n,
            children: r
        } = t, a = r;
        for (let t = n.length - 1; t >= 0; t -= 1) a = od.default.cloneElement(n[t], {}, a);
        return (0, y.jsx)(y.Fragment, {
            children: a
        })
    };
    var cE = t.i(893949),
        cq = t.i(413019),
        ck = t.i(758835),
        cA = t.i(823062);
    let cC = t => {
        let {
            children: n,
            unifiedLogger: r,
            pageLoggerConfig: a
        } = t, i = null != r ? r : lW.default, {
            pathname: o,
            asPath: s,
            basePath: u,
            isReady: l
        } = (0, of.useRouter)(), c = (0, od.useMemo)(() => {
            if (o) return "".concat(window.location.origin).concat(o)
        }, [o]);
        return (0, y.jsx)(cA.UnifiedLoggerProvider, {
            unifiedLogger: i,
            pageLoggerConfig: a,
            path: c,
            url: "".concat(u).concat(s),
            isReady: l,
            children: n
        })
    };
    var cI = t.i(681559),
        cj = t.i(272749),
        cL = t.i(252842);
    let cN = ["https://vitals.vercel-insights.com/v1/vitals"];
    var cO = t.i(120654);
    let cD = t => {
        let {
            children: n
        } = t, {
            user: r
        } = (0, lc.useAuthentication)(), a = (0, od.useRef)(window.aegis);
        (0, od.useEffect)(() => {
            a.current && a.current.setConfig({
                beforeReport: t => !(t.msg && cN.some(n => t.msg.includes(n))),
                api: {
                    retCodeHandler(t, n, r) {
                        let a = !(r.status === cL.StatusCodes.FORBIDDEN && r.headers.has("x-csrf-token") || r.status === cL.StatusCodes.OK || r.status === cL.StatusCodes.ACCEPTED),
                            i = "unknown";
                        try {
                            let n = JSON.parse(t);
                            n.errors && n.errors.length > 0 && (i = n.errors[0].code)
                        } catch (t) {
                            i = "unknown"
                        }
                        return {
                            isErr: a && 0 !== i,
                            retCode: i
                        }
                    }
                },
                uin: null == r ? void 0 : r.id
            })
        }, [r, a]);
        let i = (0, od.useMemo)(() => ({
            info: () => {},
            error: () => {},
            captureError: () => {},
            reportEvent: () => {}
        }), [a]);
        return (0, y.jsx)(cO.default.Provider, {
            value: i,
            children: n
        })
    };
    var cM = t.i(37819),
        c_ = t.i(892173);
    let cB = "".concat("".concat("https://assets.create.roblox.com/693c51491c6d9e57aaf41dc3340c19dd2f0c145a/assets", "/opengraph"), "/global_og_image.png"),
        cV = (0, oR.withTranslation)(t => {
            let {
                openGraphMetadata: {
                    title: n,
                    description: r,
                    defaultLocale: a
                }
            } = t, {
                translate: i
            } = (0, oR.useTranslation)(), o = new URL(cB, "https://create.roblox.com").href, s = (0, c_.useTheme)();
            return (0, y.jsxs)(cM.HubMeta, {
                seoTitle: i("Label.CreatorDashboard"),
                ogTitle: n,
                description: r,
                ogImage: o,
                children: [(0, y.jsx)("link", {
                    rel: "icon",
                    type: "image/svg+xml",
                    href: "https://cdn.foundation.".concat("roblox.com", "/current/roblox-tilt/favicon.svg")
                }), (0, y.jsx)("link", {
                    rel: "icon",
                    href: "https://cdn.foundation.".concat("roblox.com", "/current/roblox-tilt/favicon.ico"),
                    sizes: "48x48"
                }), (0, y.jsx)("link", {
                    rel: "apple-touch-icon",
                    sizes: "180x180",
                    href: "https://cdn.foundation.".concat("roblox.com", "/current/roblox-tilt/apple-touch-icon.png")
                }), (0, y.jsx)("meta", {
                    name: "theme-color",
                    content: s.palette.surface[0]
                }, "theme-color"), (0, y.jsx)("meta", {
                    name: "viewport",
                    content: "minimum-scale=1, initial-scale=1, width=device-width"
                }), (0, y.jsx)("meta", {
                    name: "zd-site-verification",
                    content: "8ou4bshfpgbc1pk5x0qqt"
                }), (0, y.jsx)("meta", {
                    property: "og:url",
                    content: "https://create.roblox.com"
                }, "og:url"), (0, y.jsx)("meta", {
                    property: "og:type",
                    content: "website"
                }, "og:type"), (0, y.jsx)("meta", {
                    property: "og:locale",
                    content: a
                }, "og:locale")]
            })
        }, [lA.TranslationNamespace.Features]);
    var cU = t.i(655831),
        cF = t.i(932471),
        cF = cF,
        cG = t.i(748089),
        cK = t.i(61856),
        cW = t.i(239523);
    t.i(490742), t.i(925633), t.i(402171);
    var cz = t.i(455162);
    let cH = cU.$constructor("ZodMiniType", (t, n) => {
            if (!t._zod) throw Error("Uninitialized schema in ZodMiniType.");
            cK.$ZodType.init(t, n), t.def = n, t.type = n.type
        }, {
            get with() {
                return this.check
            },
            set with(value) {
                cG.own(this, "with", value)
            },
            parse(t, n) {
                return cz.parse(this, t, n, {
                    callee: this.parse
                })
            },
            parseAsync(t, n) {
                return cz.parseAsync(this, t, n, {
                    callee: this.parseAsync
                })
            },
            safeParse(t, n) {
                return cz.safeParse(this, t, n)
            },
            safeParseAsync(t, n) {
                return cz.safeParseAsync(this, t, n)
            },
            check() {
                for (var t, n = arguments.length, r = Array(n), a = 0; a < n; a++) r[a] = arguments[a];
                let i = this.def;
                return this.clone({
                    ...i,
                    checks: [...null != (t = i.checks) ? t : [], ...r.map(t => "function" == typeof t ? {
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
                return cG.clone(this, t, n)
            },
            brand() {
                return this
            },
            register(t, n) {
                return t.add(this, n), this
            },
            apply(t) {
                for (var n = arguments.length, r = Array(n > 1 ? n - 1 : 0), a = 1; a < n; a++) r[a - 1] = arguments[a];
                return 0 === r.length ? t(this) : t(this, ...r)
            }
        }),
        cJ = cU.$constructor("ZodMiniString", (t, n) => {
            cK.$ZodString.init(t, n), cH.init(t, n)
        });

    function cQ(t) {
        return cW._string(cJ, t)
    }(t, n) => {
        cK.$ZodStringFormat.init(t, n), cJ.init(t, n)
    }, (t, n) => {
        cK.$ZodBigInt.init(t, n), cH.init(t, n)
    };
    let cX = cU.$constructor("ZodMiniUnknown", (t, n) => {
            cK.$ZodUnknown.init(t, n), cH.init(t, n)
        }),
        c$ = cU.$constructor("ZodMiniArray", (t, n) => {
            cK.$ZodArray.init(t, n), cH.init(t, n)
        });

    function cZ(t, n) {
        return new c$({
            type: "array",
            element: t,
            ...cG.normalizeParams(n)
        })
    }
    let cY = cU.$constructor("ZodMiniObject", (t, n) => {
        cK.$ZodObject.init(t, n), cH.init(t, n), cG.installLazyProp(t, "shape", t => t._zod.def.shape, !1)
    });

    function c0(t, n) {
        return new cY({
            type: "object",
            shape: null != t ? t : {},
            ...cG.normalizeParams(n)
        })
    }
    let c1 = cU.$constructor("ZodMiniUnion", (t, n) => {
            cK.$ZodUnion.init(t, n), cH.init(t, n)
        }),
        c2 = cU.$constructor("ZodMiniRecord", (t, n) => {
            cK.$ZodRecord.init(t, n), cH.init(t, n)
        }),
        c4 = cU.$constructor("ZodMiniLiteral", (t, n) => {
            cK.$ZodLiteral.init(t, n), cH.init(t, n)
        });

    function c3(t, n) {
        return new c4({
            type: "literal",
            values: Array.isArray(t) ? t : [t],
            ...cG.normalizeParams(n)
        })
    }
    let c6 = cU.$constructor("ZodMiniOptional", (t, n) => {
        cK.$ZodOptional.init(t, n), cH.init(t, n)
    });

    function c8(t) {
        return new c6({
            type: "optional",
            innerType: t
        })
    }(t, n) => {
        cK.$ZodPipe.init(t, n), cH.init(t, n)
    };
    let c5 = cU.$constructor("ZodMiniCustom", (t, n) => {
        cK.$ZodCustom.init(t, n), cH.init(t, n)
    });

    function c9(t) {
        let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
        return cW._refine(c5, t, n)
    }
    cW.describe, cW.meta;
    var c7 = t.i(566387),
        de = t.i(880343),
        dt = t.i(182012),
        dn = t.i(610932),
        dr = t.i(732749),
        da = t.i(494118),
        di = t.i(615051),
        ds = t.i(24286),
        du = t.i(202289),
        dl = (0, od.createContext)(void 0),
        dc = t => {
            let {
                config: n,
                children: r
            } = t;
            return (0, y.jsx)(dl.Provider, {
                value: n,
                children: r
            })
        },
        dd = () => {
            let t = (0, od.useContext)(dl);
            if (!t) throw Error("useNotApprovedUIConfig must be used within a NotApprovedUIProvider");
            return t
        },
        df = ((i = df || {}).Default = "default", i.Kids = "kids", i.Select = "select", i),
        dp = ((o = dp || {}).AccountReactivationPageRendered = "accountReactivationPageRendered", o.PageRendered = "pageRendered", o.UnmappedViolationKey = "unmappedViolationKey", o.CheckboxChecked = "checkboxChecked", o.LogoutClicked = "logoutClicked", o.ReactivateClicked = "reactivateClicked", o.ParentVerificationClicked = "parentVerificationClicked", o.EmailVerificationClicked = "emailVerificationClicked", o.TermsOfUseClicked = "termsOfUseClicked", o.AppealsProcessClicked = "appealsProcessClicked", o.CommunityGuidelineClicked = "communityGuidelineClicked", o.UGCGuidelinesClicked = "ugcGuidelinesClicked", o.AppealsPortalClicked = "appealsPortalClicked", o.ContinueClicked = "continueClicked", o.BackClicked = "backClicked", o.SecondChanceReactivateClicked = "secondChanceReactivateClicked", o.MissingTranslation = "missingTranslation", o.Error = "error", o.VerificationRedirectRendered = "verificationRedirectRendered", o.AccountReactivationRedirectRendered = "accountReactivationRedirectRendered", o),
        dh = ((s = dh || {}).NotApprovedPage = "NotApprovedPageV2", s);
    cU.config(cF.en());
    var dv = c0({
            type: c3("platform"),
            displayMeta: c8(c0({
                lowercaseKey: cQ().check(c7.minLength(1)),
                capitalizedKey: cQ().check(c7.minLength(1)),
                icon: cQ()
            })),
            elements: c8(cZ(cW._unknown(cX)))
        }),
        dm = new c1({
            type: "union",
            options: [c0({
                type: c3("text"),
                labelKey: cQ(),
                text: c8(cQ()),
                textKey: c8(cQ()),
                textKeyParameters: c8((u = cQ(), new c2((l = cQ()) && l._zod ? {
                    type: "record",
                    keyType: u,
                    valueType: l,
                    ...cG.normalizeParams(void 0)
                } : {
                    type: "record",
                    keyType: cQ(),
                    valueType: u,
                    ...cG.normalizeParams(l)
                })))
            }).check(c9(t => void 0 !== t.text || void 0 !== t.textKey, {
                message: "Either 'text' or 'textKey' must be provided"
            }), c9(t => !t.textKeyParameters || void 0 !== t.textKey, {
                message: "'textKeyParameters' requires 'textKey' to be provided"
            })), c0({
                type: c3("image"),
                labelKey: cQ(),
                url: cQ(),
                altLabelKey: c8(cQ())
            })],
            ...cG.normalizeParams(void 0)
        }),
        dy = t => {
            let n = dm.safeParse(t);
            return !!n.success || (console.warn("Failed to parse platform element: ", n.error), !1)
        },
        dg = c0({
            ...dv.shape,
            elements: c8(cZ(dm))
        }),
        db = t => {
            let n = t.violation;
            if (!n) return !1;
            let {
                evidence: r
            } = n;
            if (!r || !(t => {
                    if ("platform" !== t.type) return !1;
                    let n = dv.safeParse(t);
                    return !!n.success || (console.warn("Failed to parse platform evidence: ", n.error), !1)
                })(r)) return !1;
            let a = null == (i = r.elements) ? void 0 : i.filter(t => dy(t));
            if (!a || 0 === a.length) return !1;
            var i, o = {
                ...r,
                elements: a
            };
            if ("platform" !== o.type) return !1;
            let s = dg.safeParse(o);
            return !!s.success || (console.warn("Failed to parse platform evidence fully typed: ", s.error), !1)
        },
        dw = "UserSafety.NotApprovedPage.UserID",
        dx = {
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
        dP = {
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
            "Label.AbuseType.PrivacyAskingforPII": dx,
            "Label.AbuseType.PrivacyGivingPII": dx,
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
        dT = (0, od.createContext)(void 0),
        dR = t => {
            let {
                enableIxp: n = !1,
                children: r
            } = t, {
                translate: a,
                ageExperience: i = "default"
            } = dd(), {
                data: o,
                isLoading: s,
                error: u
            } = (() => {
                let {
                    httpGet: t,
                    userModerationApiUrl: n
                } = dd();
                return (0, lv.useQuery)({
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
                    ixp: a
                } = dd(), i = (0, lv.useQuery)({
                    queryKey: ["ixp/".concat(dw)],
                    queryFn: async () => {
                        if (!a) return {};
                        try {
                            return await a.fetchLayer(dw)
                        } catch (t) {
                            return {}
                        }
                    },
                    staleTime: 1 / 0,
                    enabled: n && !!a
                }), o = i.data && "FFlagKidsNotApprovedPageTreatment2" in i.data;
                return (0, od.useEffect)(() => {
                    "kids" === r && o && (null == a || a.logExposure(dw))
                }, [r, o, a]), i
            })({
                enabled: n
            }), {
                data: f,
                isLoading: p
            } = (() => {
                let {
                    httpGet: t,
                    apiGatewayUrl: n
                } = dd();
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
            })(), h = "kids" === i && n && (null == l ? void 0 : l.FFlagKidsNotApprovedPageTreatment2) === !0, v = (null == o ? void 0 : o.punishedUserId) ? o : void 0, m = (0, od.useMemo)(() => {
                var t;
                let n, r = new Set;
                (null == v ? void 0 : v.violation) && db(v) ? v.violation.abuseTypeTranslationKeys.forEach(t => {
                    r.add(t)
                }) : null == v || null == (t = v.badUtterances) || t.forEach(t => {
                    r.add(t.labelTranslationKey)
                });
                let i = [...r].filter(Boolean);
                return {
                    translatedReasons: h ? (n = new Set, i.forEach(t => {
                        var r, i;
                        let o = a(null != (r = null == (i = dP[t]) ? void 0 : i.displayLabel) ? r : t);
                        o && n.add(o)
                    }), [...n]) : i.map(t => a(t)).filter(Boolean),
                    untranslatedReasons: i
                }
            }, [h, v, a]), g = (0, od.useMemo)(() => {
                let t = (null == v ? void 0 : v.messageToUser) || a("Description.Violation", {
                    startLink: "",
                    endLink: ""
                });
                if (!h || !(null == v ? void 0 : v.labelTranslationKey)) return t;
                let n = dP[v.labelTranslationKey];
                return n && a(n.moderatorNote) || t
            }, [h, v, a]), b = s || n && c && d || p, w = (0, od.useMemo)(() => ({
                isLoading: b,
                error: u,
                punishmentData: v,
                violationReasons: m,
                ixpData: l,
                isKidsTreatment: h,
                moderatorNote: g,
                commutationEligibility: f
            }), [b, u, v, m, l, h, g, f]);
            return (0, y.jsx)(dT.Provider, {
                value: w,
                children: r
            })
        },
        dS = () => {
            let t = (0, od.useContext)(dT);
            if (!t) throw Error("useNotApprovedPagePunishment must be used within a NotApprovedPagePunishmentProvider");
            return t
        };

    function dE() {
        let {
            sendAnalyticsEvent: t,
            platform: n,
            readOnly: r
        } = dd(), {
            isKidsTreatment: a,
            ixpData: i
        } = dS(), o = (null == i ? void 0 : i.FFlagKidsNotApprovedPageTreatment2) === !0;
        return (0, od.useCallback)((i, s) => {
            var u, l;
            u = null != r && r, l = {
                ...s,
                ...o ? {
                    isKidsTreatment: a
                } : {}
            }, u || t({
                eventName: "NotApprovedPageEvent",
                context: "NotApprovedPageV2",
                properties: {
                    eventType: i,
                    timestamp: Date.now(),
                    platform: n,
                    ...l
                }
            })
        }, [t, n, r, a, o])
    }
    var dq = ((c = dq || {}).Warn = "Warn", c.Delete = "Delete", c.Hour1 = "Ban 1 Hour", c.Hour6 = "Ban 6 Hours", c.Day1 = "Ban 1 Day", c.Day3 = "Ban 3 Days", c.Day7 = "Ban 7 Days", c.Day14 = "Ban 14 Days", c.Day30 = "Ban 30 Days", c.Day60 = "Ban 60 Days", c.Month6 = "Ban 6 Months", c.Year1 = "Ban 1 Year", c),
        dk = {
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
        dA = {
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
        dC = "Email";

    function dI(t, n, r) {
        if (r === dC || "VPC" === r) return !0;
        let a = new Date(n) < new Date;
        return "Warn" === t || "Delete" !== t && a
    }
    var dj = (0, od.createContext)(void 0),
        dL = t => {
            var n, r;
            let {
                pages: a,
                unmappedViolationKeys: i,
                hasEducationalPages: o,
                commutationEligibility: s,
                children: u
            } = t, [l, c] = (0, od.useState)(0), [d, f] = (0, od.useState)(!1), p = null != (n = null == (r = a[l]) ? void 0 : r.pageName) ? n : "unknown", h = a.length, v = 0 === l, m = l === h - 1, g = (0, od.useMemo)(() => {
                var t;
                return null != (t = null == s ? void 0 : s.educational_pass_eligible) && t
            }, [s]), b = (0, od.useCallback)(() => {
                l < h - 1 && (f(!0), c(t => t + 1))
            }, [l, h]), w = (0, od.useCallback)(() => {
                l > 0 && c(t => t - 1)
            }, [l]), x = (0, od.useCallback)(() => {
                if (h <= 1 || "second-chance-intro" === p || "intro" === p) return 0;
                let t = h - 1,
                    n = l;
                return (t -= !!g, n -= !!g, t <= 0) ? 0 : Math.round(n / t * 100)
            }, [l, h, p, g]), P = (0, od.useMemo)(() => {
                var t, n, r;
                return {
                    currentPage: l,
                    currentPageName: p,
                    totalPages: h,
                    goToNextPage: b,
                    goToPreviousPage: w,
                    isFirstPage: v,
                    isLastPage: m,
                    getProgress: x,
                    hasEducationalPages: o,
                    currentPageConfigs: null != (t = null == (n = a[l]) ? void 0 : n.pageItems) ? t : [],
                    CurrentCtaComponent: null == (r = a[l]) ? void 0 : r.CtaComponent,
                    unmappedViolationKeys: i,
                    hasNavigatedForward: d
                }
            }, [l, p, h, b, w, v, m, x, a, o, i, d]);
            return (0, y.jsx)(dj.Provider, {
                value: P,
                children: u
            })
        },
        dN = () => {
            let t = (0, od.useContext)(dj);
            if (!t) throw Error("usePageNavigation must be used within PageNavigationProvider");
            return t
        },
        dO = t => {
            let {
                punishmentData: n,
                commutationEligibility: r
            } = t, {
                isFirstPage: a,
                currentPageConfigs: i,
                currentPageName: o
            } = dN(), s = i.map(t => {
                if (!t.getIsVisible(n, o, r)) return null;
                let a = t.renderComponent;
                return (0, y.jsx)("div", {
                    children: (0, y.jsx)(a, {
                        punishmentData: n
                    })
                }, t.configName)
            }).filter(Boolean);
            return (0, y.jsx)("div", {
                className: "flex flex-col ".concat(a ? "gap-xlarge" : "gap-[36px]"),
                children: s
            })
        },
        dD = () => {
            let t = dd().translate,
                {
                    onLogout: n
                } = dd(),
                r = dE(),
                [a, i] = (0, od.useState)(!1),
                o = (0, dt.useMutation)({
                    mutationFn: async () => {
                        await n()
                    },
                    onMutate: () => {
                        i(!0), r("logoutClicked")
                    },
                    onError: t => {
                        let n = t instanceof Error ? t.message : "Unknown error";
                        r("error", {
                            additionalInfo: "headerPopoverLogout: Error logging out - ".concat(n)
                        }), i(!1)
                    },
                    retry: 0
                });
            return (0, y.jsxs)(dn.Popover, {
                children: [(0, y.jsx)(dn.PopoverTrigger, {
                    asChild: !0,
                    children: (0, y.jsx)(da.IconButton, {
                        icon: "icon-filled-three-dots-vertical",
                        ariaLabel: t("Label.OpenMenu"),
                        variant: "Utility",
                        size: "Medium"
                    })
                }), (0, y.jsx)(dn.PopoverContent, {
                    side: "bottom",
                    align: "end",
                    ariaLabel: t("Label.MenuContent"),
                    children: (0, y.jsx)(dr.Menu, {
                        size: "Medium",
                        children: (0, y.jsx)(dr.MenuItem, {
                            value: "one",
                            title: t("Action.LogOut"),
                            onSelect: () => {
                                o.mutate()
                            },
                            disabled: a,
                            trailing: a ? (0, y.jsx)(lT.ProgressCircle, {
                                size: "Small",
                                ariaLabel: t("Label.LogoutProgress"),
                                variant: "Indeterminate"
                            }) : void 0
                        })
                    })
                })]
            })
        },
        dM = () => {
            let t = dd().translate,
                {
                    getProgress: n
                } = dN(),
                r = n();
            return (0, y.jsx)(di.ProgressBar, {
                value: r,
                ariaLabel: t("Label.PageProgress"),
                style: {
                    visibility: 0 === r ? "hidden" : "visible"
                }
            })
        },
        d_ = () => {
            let t = dd().translate,
                {
                    goToPreviousPage: n
                } = dN();
            return (0, y.jsx)(da.IconButton, {
                size: "Medium",
                variant: "Utility",
                icon: "icon-filled-chevron-large-left",
                onClick: n,
                "data-testid": "back-button",
                className: "margin-left-[-12px]",
                ariaLabel: t("Action.Back")
            })
        },
        dB = t => {
            var n;
            let {
                punishmentData: r
            } = t, {
                isFirstPage: a,
                totalPages: i
            } = dN(), {
                readOnly: o
            } = dd(), s = dd().translate, {
                punishmentTypeDescription: u,
                verificationCategory: l
            } = r, c = l ? s("Heading.Suspended") : s(null != (n = dk[u]) ? n : "") || s("Heading.Suspended");
            return a ? (0, y.jsx)("div", {
                "data-testid": "not-approved-dialog-header",
                children: (0, y.jsxs)("div", {
                    className: "flex justify-between items-center gap-medium",
                    children: [(0, y.jsxs)("div", {
                        className: "flex gap-small items-center padding-y-medium",
                        children: [(0, y.jsx)(de.Icon, {
                            name: "Delete" === u ? "icon-regular-circle-slash" : "icon-regular-triangle-exclamation",
                            size: "Large",
                            className: "Warn" !== u || l ? "content-system-alert" : "content-system-warning"
                        }), (0, y.jsx)("span", {
                            className: "text-heading-small",
                            children: c
                        })]
                    }), !o && (0, y.jsx)(dD, {})]
                })
            }) : (0, y.jsx)("div", {
                "data-testid": "not-approved-dialog-header",
                children: (0, y.jsxs)("div", {
                    className: "flex flex-col gap-large items-start",
                    children: [(0, y.jsx)(d_, {}), i > 2 && (0, y.jsx)(dM, {})]
                })
            })
        },
        dV = t => {
            let {
                punishmentData: n,
                setIsDialogOpen: r
            } = t, {
                CurrentCtaComponent: a,
                currentPageName: i
            } = dN();
            return a ? (0, y.jsx)("div", {
                className: "flex flex-col gap-large justify-between medium:items-end",
                children: (0, y.jsx)(a, {
                    punishmentData: n,
                    setIsDialogOpen: r
                }, i)
            }) : null
        },
        dU = t => {
            let {
                readOnly: n
            } = t;
            return (0, y.jsxs)("div", {
                className: "shrink-0 flex flex-row justify-between items-center gap-medium",
                children: [(0, y.jsx)("div", {
                    className: "bg-shift-100 height-[45px] width-[300px] max-width-[85%] radius-medium"
                }), !n && (0, y.jsx)("div", {
                    className: "bg-shift-100 height-[35px] width-[35px] radius-medium shrink-0"
                })]
            })
        },
        dF = () => (0, y.jsxs)("div", {
            className: "flex flex-col gap-large",
            "data-testid": "loading-skeleton-content",
            children: [(0, y.jsx)("div", {
                className: "bg-shift-100 height-[20px] width-full max-width-[450px] radius-medium"
            }), (0, y.jsxs)("div", {
                className: "flex flex-col gap-medium",
                children: [(0, y.jsx)("div", {
                    className: "bg-shift-100 height-[30px] width-[125px] radius-medium"
                }), (0, y.jsx)("div", {
                    className: "bg-shift-100 height-[120px] width-full radius-medium"
                })]
            }), (0, y.jsxs)("div", {
                className: "flex flex-col gap-medium",
                children: [(0, y.jsx)("div", {
                    className: "bg-shift-100 height-[30px] width-[200px] radius-medium"
                }), (0, y.jsx)("div", {
                    className: "bg-shift-100 height-[160px] width-full radius-medium"
                })]
            })]
        }),
        dG = () => (0, y.jsx)("div", {
            className: "shrink-0 flex width-full justify-end medium:flex-row",
            children: (0, y.jsx)("div", {
                className: "bg-shift-100 height-[40px] width-full medium:width-[90px] radius-medium"
            })
        }),
        dK = () => {
            let {
                readOnly: t
            } = dd();
            return t ? null : (0, y.jsx)("div", {
                className: "shrink-0 flex justify-end items-center",
                children: (0, y.jsx)(dD, {})
            })
        },
        dW = t => {
            let {
                error: n
            } = t, r = dd().translate;
            return n && console.error(n), (0, y.jsx)("div", {
                className: "flex flex-col height-full min-height-0",
                children: (0, y.jsxs)("div", {
                    className: "grow-1 flex flex-col items-center justify-center gap-medium padding-xxlarge radius-medium bg-surface-100 width-full min-height-[225px]",
                    children: [(0, y.jsx)(de.Icon, {
                        name: "icon-regular-triangle-exclamation",
                        size: "XLarge"
                    }), (0, y.jsx)("span", {
                        className: "text-body-large content-emphasis margin-none",
                        children: r("Heading.Error")
                    })]
                })
            })
        },
        dz = (0, od.createContext)(void 0),
        dH = t => {
            let {
                children: n
            } = t, {
                currentPage: r,
                currentPageName: a,
                unmappedViolationKeys: i
            } = dN(), o = dE(), s = (0, od.useRef)(Date.now()), u = (0, od.useRef)(r), l = (0, od.useRef)(a), c = (0, od.useRef)(!0), d = () => Date.now() - s.current;
            (0, od.useEffect)(() => {
                i.forEach(t => {
                    o("unmappedViolationKey", {
                        unmappedViolationKey: t
                    })
                })
            }, [i]), (0, od.useEffect)(() => {
                if (c.current) {
                    c.current = !1;
                    return
                }
                let t = d();
                o(r > u.current ? "continueClicked" : "backClicked", {
                    pageName: l.current,
                    timeOnPageMs: t
                }), s.current = Date.now(), u.current = r, l.current = a
            }, [r, a]);
            let f = (0, od.useCallback)((t, n) => {
                    let r = d();
                    o(t, {
                        ...n,
                        pageName: a,
                        timeOnPageMs: r
                    })
                }, [a, o]),
                p = (0, od.useMemo)(() => ({
                    sendPageEvent: f
                }), [f]);
            return (0, y.jsx)(dz.Provider, {
                value: p,
                children: n
            })
        },
        dJ = () => {
            let t = (0, od.useContext)(dz);
            if (!t) throw Error("usePageAnalytics must be used within PageAnalyticsProvider");
            return t
        },
        dQ = {
            ruleTitle: "Heading.RuleExplanation.Dating",
            ruleSubtitle: "SubHeading.RuleExplanation.Dating",
            ruleDescription: "Description.RuleExplanation.Dating",
            importanceTitle: "Heading.RuleImportance",
            importanceDescription: "Description.RuleImportance.Dating",
            policyKey: "dating"
        },
        dX = {
            ruleTitle: "Heading.RuleExplanation.BullyingHarassmentDiscrimination",
            ruleSubtitle: "SubHeading.RuleExplanation.BullyingHarassmentDiscrimination",
            ruleDescription: "Description.RuleExplanation.BullyingHarassmentDiscrimination",
            importanceTitle: "Heading.RuleImportance",
            importanceDescription: "Description.RuleImportance.BullyingHarassmentDiscrimination",
            policyKey: "bullying-harassment-discrimination"
        },
        d$ = {
            ruleTitle: "Heading.RuleExplanation.MisusingRobloxSystems",
            ruleSubtitle: "SubHeading.RuleExplanation.MisusingRobloxSystems",
            ruleDescription: "Description.RuleExplanation.MisusingRobloxSystems",
            ruleDescriptionBullets: "Description.RuleExplanation.Bullets.MisusingRobloxSystems",
            importanceTitle: "Heading.RuleImportance",
            importanceDescription: "Description.RuleImportance.MisusingRobloxSystems",
            policyKey: "misusing-roblox-systems"
        },
        dZ = {
            ruleTitle: "Heading.RuleExplanation.PII",
            ruleSubtitle: "SubHeading.RuleExplanation.PII",
            ruleDescription: "Description.RuleExplanation.PII",
            ruleDescriptionBullets: "Description.RuleExplanation.Bullets.PII",
            importanceTitle: "Heading.RuleImportance",
            importanceDescription: "Description.RuleImportance.PII",
            policyKey: "pii"
        },
        dY = {
            ruleTitle: "Heading.RuleExplanation.SSHAndIllegalRegulatedActivities",
            ruleSubtitle: "SubHeading.RuleExplanation.SSHAndIllegalRegulatedActivities",
            ruleDescription: "Description.RuleExplanation.SSHAndIllegalRegulatedActivities",
            ruleDescriptionBullets: "Description.RuleExplanation.Bullets.SSHAndIllegalRegAct",
            importanceTitle: "Heading.RuleImportance",
            importanceDescription: "Description.RuleImportance.SSHAndIllegalRegulatedActivities",
            policyKey: "ssh-and-illegal-regulated-activities"
        },
        d0 = {
            "Label.AbuseType.CheatandExploits": d$,
            "Label.AbuseType.ContestsandSweepstakes": dY,
            "Label.AbuseType.Dating": dQ,
            "Label.AbuseType.DirectingUsersOffPlatform": {
                ruleTitle: "Heading.RuleExplanation.DirectingUsersOffPlatform",
                ruleSubtitle: "SubHeading.RuleExplanation.DirectingUsersOffPlatform",
                ruleDescription: "Description.RuleExplanation.DirectingUsersOffPlatform",
                importanceTitle: "Heading.RuleImportance",
                importanceDescription: "Description.RuleImportance.DirectingUsersOffPlatform",
                policyKey: "directing-users-off-platform"
            },
            "Label.AbuseType.DiscriminatoryContent": dX,
            "Label.AbuseType.DisruptiveAudio": d$,
            "Label.AbuseType.EncouragingDangerousBehavior": dY,
            "Label.AbuseType.ExtortionandBlackmail": dX,
            "Label.AbuseType.Harassment": dX,
            "Label.AbuseType.IllegalandRegulatedContent": dY,
            "Label.AbuseType.Impersonation": dX,
            "Label.AbuseType.IrlDangerousActivities": dY,
            "Label.AbuseType.MisusingRobloxSystems": d$,
            "Label.AbuseType.OffPlatformSpeechandBehavior": dX,
            "Label.AbuseType.PrivacyAskingforPII": dZ,
            "Label.AbuseType.PrivacyGivingPII": dZ,
            "Label.AbuseType.RealLifeThreats": dX,
            "Label.AbuseType.Scamming": d$,
            "Label.AbuseType.SexualContent": dQ,
            "Label.AbuseType.Spam": {
                ruleTitle: "Heading.RuleExplanation.Spam",
                ruleSubtitle: "SubHeading.RuleExplanation.Spam",
                ruleDescription: "Description.RuleExplanation.Spam",
                importanceTitle: "Heading.RuleImportance",
                importanceDescription: "Description.RuleImportance.Spam",
                policyKey: "spam"
            },
            "Label.AbuseType.SuicideSelfHarm": dY,
            "Label.AbuseType.Swearing": {
                ruleTitle: "Heading.RuleExplanation.Swearing",
                ruleSubtitle: "SubHeading.RuleExplanation.Swearing",
                ruleDescription: "Description.RuleExplanation.Swearing",
                importanceTitle: "Heading.RuleImportance",
                importanceDescription: "Description.RuleImportance.Swearing",
                policyKey: "swearing"
            },
            "Label.AbuseType.ThreatsOrAbuseOfRobloxEmployeesOrAffiliates": dX,
            "Label.AbuseType.ViolentContentAndGore": {
                ruleTitle: "Heading.RuleExplanation.ViolentContentAndGore",
                ruleSubtitle: "SubHeading.RuleExplanation.ViolentContentAndGore",
                ruleDescription: "Description.RuleExplanation.ViolentContentAndGore",
                importanceTitle: "Heading.RuleImportance",
                importanceDescription: "Description.RuleImportance.ViolentContentAndGore",
                policyKey: "violent-content-and-gore"
            },
            "Label.AbuseType.VirtualCasino": dY,
            "Label.Sublabel.RealLifeEvents": {
                ruleTitle: "Heading.RuleExplanation.RealLifeEvents",
                ruleSubtitle: "SubHeading.RuleExplanation.RealLifeEvents",
                ruleDescription: "Description.RuleExplanation.RealLifeEvents",
                ruleDescriptionBullets: "Description.RuleExplanation.Bullets.RealLifeEvents",
                importanceTitle: "Heading.RuleImportance",
                importanceDescription: "Description.RuleImportance.RealLifeEvents",
                policyKey: "real-life-events"
            },
            "Label.Sublabel.RomanceOrSex": dQ
        },
        d1 = (t, n) => {
            if (n) {
                let n = dP[t];
                if (n) return n.education
            }
            return d0[t]
        },
        d2 = t => {
            let {
                size: n = "Medium"
            } = t, r = dd().translate, a = dE();
            return (0, y.jsx)("div", {
                "data-testid": "appeals-process",
                children: (0, y.jsx)("p", {
                    children: (0, y.jsx)(ds.Link, {
                        href: "https://en.help.roblox.com/hc/en-us/articles/360000245263-Appeal-Your-Content-Moderation",
                        target: "_blank",
                        rel: "noreferrer noopener",
                        size: n,
                        color: "Standard",
                        variant: "Inline",
                        underline: "always",
                        isExternal: !1,
                        onClick: () => {
                            a("appealsProcessClicked")
                        },
                        children: r("Action.ViewAppealGuidelines")
                    })
                })
            })
        },
        d4 = {
            getIsVisible: t => t.showAppealsProcessLink,
            renderComponent: d2,
            configName: "appeals-process"
        },
        d3 = "{startLink}",
        d6 = "{endLink}",
        d8 = (t, n) => (r, a, i, o) => {
            var s;
            let [u, l] = t(r, {
                startLink: d3,
                endLink: d6,
                ...i
            }).split(d3, 2), [c, d] = null != (s = null == l ? void 0 : l.split(d6, 2)) ? s : [];
            return (0, y.jsxs)("p", {
                className: "text-body-large",
                children: [u, (0, y.jsx)("a", {
                    href: a,
                    className: "content-link",
                    rel: "noreferrer",
                    onClick: () => {
                        null != o && n && n(o)
                    },
                    children: c
                }), d]
            })
        },
        d5 = {
            getIsVisible: t => [dC, "VPC"].includes(t.verificationCategory),
            renderComponent: t => {
                let {
                    punishmentData: n
                } = t, r = dd().translate, {
                    websiteUrl: a
                } = dd(), i = d8(r), {
                    verificationCategory: o
                } = n, s = "".concat(a, "/"), u = i("VPC" === o ? "Label.ParentReactivationNotice" : "Label.EmailReactivationNotice", s);
                return (0, y.jsxs)("div", {
                    className: "flex flex-col gap-medium",
                    children: [(0, y.jsx)("span", {
                        className: "text-heading-medium",
                        children: r("Label.ChargebackNextSteps")
                    }), u]
                })
            },
            configName: "chargeback-steps"
        },
        d9 = {
            getIsVisible: t => "Delete" !== t.punishmentTypeDescription,
            renderComponent: t => {
                let {
                    punishmentData: n
                } = t, r = dd().translate, {
                    hasEducationalPages: a
                } = dN(), {
                    isKidsTreatment: i
                } = dS(), o = dE(), {
                    showUGCAvatarGuidelinesLink: s,
                    context: u
                } = n, l = null == u ? void 0 : u.IS_ALT_INFORMED;
                return (0, y.jsxs)("div", {
                    className: "flex flex-col gap-medium",
                    children: [(0, y.jsx)("span", {
                        className: "text-heading-medium",
                        children: r(i ? "Heading.WhatNext" : "Label.RuleBreakingAddsUp")
                    }), (0, y.jsxs)("div", {
                        className: "flex flex-col gap-medium",
                        children: [(0, y.jsx)("p", {
                            className: "text-body-large",
                            children: r(i ? "Description.Foreshadow.Kids" : "Description.Foreshadow")
                        }), l && (0, y.jsx)("p", {
                            className: "text-body-large",
                            children: r("Description.LinkedAccounts")
                        }), (!!s || !a) && (0, y.jsx)(lx.Button, {
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
        d7 = function(t, n, r, a) {
            let i = arguments.length > 4 && void 0 !== arguments[4] && arguments[4],
                o = arguments.length > 5 ? arguments[5] : void 0;
            if (i) {
                if ("Warn" === r) return a("Description.WarningDescription.Kids");
                if ("Delete" === r) return a("Description.BannedDescription.Kids");
                if (o) {
                    let t = new Date(o);
                    if (!Number.isNaN(t.getTime())) return a("Description.SuspendedUntil", {
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
            if ("Delete" === r) return a("Description.BrokeRulesBanned");
            let s = dA[null != n ? n : ""],
                u = s ? a(s) : "";
            return t.length > 0 ? u ? a("Description.BrokeRulesTypePolicy.V2", {
                type: u,
                policy: t.join(", ").toLowerCase()
            }) : a("Description.BrokeRulesPolicy.V2", {
                policy: t.join(", ").toLowerCase()
            }) : u ? a("Description.BrokeRulesType", {
                type: u
            }) : a("Description.BrokeRulesGeneric")
        },
        fe = {
            getIsVisible: () => !0,
            renderComponent: t => {
                var n, r, a;
                let {
                    punishmentData: i
                } = t, o = dd().translate, {
                    violationReasons: s,
                    isKidsTreatment: u
                } = dS(), {
                    violation: l,
                    punishmentTypeDescription: c,
                    endDate: d
                } = i, f = null == l || null == (a = l.evidence) || null == (r = a.displayMeta) ? void 0 : r.capitalizedKey, p = d7(null != (n = null == s ? void 0 : s.translatedReasons) ? n : [], f, c, o, u, d);
                return (0, y.jsx)("span", {
                    className: "text-body-medium",
                    children: p
                })
            },
            configName: "punishment-description"
        },
        ft = "/safety-dashboard",
        fn = function() {
            var t;
            let {
                preferViolationDetail: n = !1
            } = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {}, {
                websiteUrl: r,
                platform: a,
                onAppealsRedirect: i
            } = dd(), {
                punishmentData: o
            } = dS(), s = dE(), u = n ? null == o || null == (t = o.violation) ? void 0 : t.uid : void 0;
            return {
                handleAppealsClick: (0, od.useCallback)(() => {
                    let t;
                    if (s("appealsPortalClicked"), i) return void i(u);
                    try {
                        t = new URL(ft, r)
                    } catch (n) {
                        t = new URL(ft, "https://www.roblox.com")
                    }
                    t.searchParams.set("t_source", a), u ? t.searchParams.set("vid", u) : t.hash = "/violations", window.open(t.toString(), "_blank", "noopener,noreferrer")
                }, [s, i, u, r, a])
            }
        },
        fr = {
            getIsVisible: (t, n, r) => {
                var a;
                return !(null != (a = null == r ? void 0 : r.educational_pass_eligible) && a) || "second-chance-intro" === n
            },
            renderComponent: t => {
                let {
                    punishmentData: n
                } = t, r = dd().translate, {
                    handleAppealsClick: a
                } = fn({
                    preferViolationDetail: !0
                }), {
                    isKidsTreatment: i
                } = dS();
                return (0, y.jsxs)("div", {
                    className: "flex flex-col gap-medium",
                    "data-testid": "report-mistake",
                    children: [(0, y.jsx)("p", {
                        className: "text-body-large",
                        children: r(i ? "Description.Mistake.Kids" : "Description.Mistake.V3")
                    }), (0, y.jsx)(lx.Button, {
                        variant: "Standard",
                        size: "Small",
                        onClick: a,
                        children: r("Action.SendAppeal")
                    }), n.showAppealsProcessLink && (0, y.jsx)(d2, {
                        punishmentData: n,
                        size: "Large"
                    })]
                })
            },
            configName: "report-mistake"
        },
        fa = t => {
            let {
                url: n,
                altLabelKey: r
            } = t, a = dd().translate, [i, o] = (0, od.useState)(!0);
            return (0, y.jsxs)("div", {
                className: "flex aspect-1-1 justify-center items-center bg-shift-200 radius-medium",
                children: [(0, y.jsx)("img", {
                    style: {
                        objectFit: "contain"
                    },
                    className: "size-full ".concat(i ? "hidden" : ""),
                    src: n,
                    alt: r && a(r),
                    onLoad: () => {
                        o(!1)
                    },
                    onError: () => {
                        o(!1)
                    }
                }), (0, y.jsx)("div", {
                    "data-testid": "spinner-container",
                    className: i ? void 0 : "hidden",
                    children: (0, y.jsx)(lT.ProgressCircle, {
                        ariaLabel: a("Label.LoadingImage"),
                        size: "Medium",
                        variant: "Indeterminate"
                    })
                })]
            })
        },
        fi = t => new Date(t).toLocaleString(void 0, {
            month: "long",
            day: "numeric",
            year: "numeric",
            hour: "numeric",
            minute: "numeric"
        });

    function fo() {
        let {
            formatFullDate: t
        } = dd();
        return null != t ? t : fi
    }
    var fs = t => {
            let {
                fieldLabel: n,
                fieldValue: r,
                preline: a = !1,
                showColon: i = !0
            } = t;
            return (0, y.jsxs)("div", {
                className: "flex flex-col",
                children: [(0, y.jsx)("span", {
                    className: "text-title-medium",
                    children: i ? "".concat(n, ":") : n
                }), (0, y.jsx)("p", {
                    className: "text-body-medium",
                    style: {
                        wordBreak: "break-word",
                        whiteSpace: a ? "pre-line" : "normal"
                    },
                    children: r
                })]
            })
        },
        fu = () => {
            let t = dd().translate,
                {
                    handleAppealsClick: n
                } = fn(),
                {
                    readOnly: r
                } = dd();
            return r ? null : (0, y.jsx)(lx.Button, {
                onClick: n,
                variant: "Standard",
                size: "Small",
                children: t("Action.ViewMore")
            })
        },
        fl = {
            getIsVisible: db,
            renderComponent: t => {
                var n, r;
                let {
                    punishmentData: a
                } = t, {
                    violation: i,
                    consequenceTransparencyMessage: o
                } = a, s = dd().translate, u = fo(), l = dE(), c = null == i || null == (r = i.evidence) ? void 0 : r.elements, d = null != (n = null == c ? void 0 : c.filter(t => dy(t))) ? n : [], f = [], p = [];
                d.forEach(t => {
                    var n;
                    "image" === t.type ? f.push((0, y.jsx)(fa, {
                        url: t.url,
                        altLabelKey: t.labelKey
                    }, t.url)) : p.push((0, y.jsx)(fs, {
                        fieldLabel: s(t.labelKey),
                        fieldValue: t.textKey ? ((t, n, r, a) => {
                            if (!r) return t(n);
                            try {
                                return t(n, r)
                            } catch (i) {
                                return null == a || a("missingTranslation", {
                                    additionalInfo: JSON.stringify({
                                        key: n,
                                        params: r
                                    })
                                }), t(n)
                            }
                        })(s, t.textKey, t.textKeyParameters, l) : null != (n = t.text) ? n : ""
                    }, t.labelKey))
                });
                let h = f.length > 0;
                return (0, y.jsxs)("div", {
                    "data-testid": "violation-grid",
                    className: "flex flex-col gap-medium medium:flex-row medium:gap-large",
                    children: [h && (0, y.jsx)("div", {
                        className: "shrink-0 width-[50%] medium:width-full medium:basis-[40%]",
                        children: f[0]
                    }), (0, y.jsxs)("div", {
                        className: "flex flex-col gap-small width-full",
                        children: [p, (0, y.jsx)(fs, {
                            fieldLabel: s("Label.ReviewDate"),
                            fieldValue: u(a.beginDate)
                        }), o && (0, y.jsx)(fs, {
                            fieldLabel: s("Label.DecisionMethod"),
                            fieldValue: o
                        }), (0, y.jsx)(fu, {})]
                    })]
                })
            },
            configName: "violation-evidence"
        },
        fc = t => {
            let {
                badUtterances: n
            } = t, [r, a] = (0, od.useState)(!1), i = dd().translate;
            return (0, y.jsxs)("div", {
                className: "flex flex-col gap-small",
                children: [(0, y.jsxs)("div", {
                    className: "flex flex-col",
                    children: [(0, y.jsxs)("span", {
                        className: "text-title-medium",
                        children: [i("Label.OffensiveItem.V2"), ":"]
                    }), (0, y.jsxs)("div", {
                        className: "flex flex-col items-start",
                        children: [n.slice(0, 4).map(t => (0, y.jsx)("p", {
                            className: "text-body-medium",
                            style: {
                                wordBreak: "break-word"
                            },
                            children: t.utteranceText
                        }, t.utteranceText)), n.slice(4).map(t => (0, y.jsx)("p", {
                            className: "text-body-medium ".concat(r ? "" : "hidden"),
                            style: {
                                wordBreak: "break-word"
                            },
                            children: t.utteranceText
                        }, t.utteranceText))]
                    })]
                }), n.length > 4 && (0, y.jsx)(lx.Button, {
                    className: "self-start margin-left-[-7px]",
                    variant: "Link",
                    size: "XSmall",
                    onClick: () => {
                        a(t => !t)
                    },
                    "data-testid": "view-toggle-button",
                    children: i(r ? "Action.ViewLess" : "Action.ViewMore")
                })]
            })
        },
        fd = {
            getIsVisible: t => {
                var n, r;
                return !db(t) && (null != (n = null == (r = t.badUtterances) ? void 0 : r.length) ? n : 0) > 0
            },
            renderComponent: t => {
                let {
                    punishmentData: n
                } = t, r = dd().translate, a = fo(), {
                    badUtterances: i,
                    consequenceTransparencyMessage: o
                } = n;
                return (0, y.jsxs)("div", {
                    className: "flex flex-col gap-small",
                    "data-testid": "bad-utterances",
                    children: [(0, y.jsx)(fc, {
                        badUtterances: null != i ? i : []
                    }), (0, y.jsx)(lD.Divider, {}), (0, y.jsx)(fs, {
                        fieldLabel: r("Label.ReviewDate"),
                        fieldValue: a(n.beginDate)
                    }), o && (0, y.jsx)(fs, {
                        fieldLabel: r("Label.DecisionMethod"),
                        fieldValue: o
                    }), (0, y.jsx)(fu, {})]
                })
            },
            configName: "bad-utterances"
        },
        ff = {
            getIsVisible: t => {
                var n, r;
                return !db(t) && (null != (n = null == (r = t.badUtterances) ? void 0 : r.length) ? n : 0) === 0
            },
            renderComponent: t => {
                let n = dd().translate,
                    r = fo(),
                    {
                        punishmentData: a
                    } = t,
                    {
                        beginDate: i,
                        consequenceTransparencyMessage: o
                    } = a;
                return (0, y.jsxs)("div", {
                    className: "flex flex-col gap-small",
                    "data-testid": "simple-evidence",
                    children: [(0, y.jsx)(fs, {
                        fieldLabel: n("Label.ReviewDate"),
                        fieldValue: r(i)
                    }), o && (0, y.jsx)(fs, {
                        fieldLabel: n("Label.DecisionMethod"),
                        fieldValue: o
                    }), (0, y.jsx)(fu, {})]
                })
            },
            configName: "simple-evidence"
        },
        fp = {
            getIsVisible: () => !0,
            renderComponent: t => {
                let {
                    punishmentData: n
                } = t, r = dd().translate, {
                    isKidsTreatment: a
                } = dS(), i = [fl, fd, ff].map(t => t.getIsVisible(n) ? (0, y.jsx)("div", {
                    children: t.renderComponent({
                        punishmentData: n
                    })
                }, t.configName) : null).filter(Boolean);
                return (0, y.jsxs)("div", {
                    className: "flex flex-col gap-medium",
                    "data-testid": "reviewed-evidence-container",
                    children: [(0, y.jsx)("span", {
                        className: "text-title-large",
                        children: r(a ? "Heading.RecentlyChecked" : "Label.LatestActivity")
                    }), (0, y.jsxs)("div", {
                        className: "flex flex-col gap-xsmall",
                        children: [(0, y.jsx)("div", {
                            className: "padding-large bg-shift-100 radius-medium",
                            children: i
                        }), (0, y.jsx)("span", {
                            className: "text-caption-medium content-muted",
                            children: n.interventionId
                        })]
                    })]
                })
            },
            configName: "rewiewed-evidence"
        },
        fh = {
            getIsVisible: () => !0,
            renderComponent: () => {
                let t = dd().translate;
                return (0, y.jsxs)("div", {
                    className: "flex flex-col gap-medium",
                    children: [(0, y.jsx)("span", {
                        className: "text-heading-medium",
                        children: t("Heading.SecondChance.Details")
                    }), (0, y.jsx)("p", {
                        className: "text-body-large",
                        children: t("Description.SecondChance.Details")
                    })]
                })
            },
            configName: "second-chance-conclusion"
        },
        fv = {
            getIsVisible: () => !0,
            renderComponent: () => {
                let t = dd().translate;
                return (0, y.jsxs)("div", {
                    className: "flex flex-col gap-large",
                    children: [(0, y.jsx)("span", {
                        className: "text-heading-medium",
                        children: t("Heading.SecondChance")
                    }), (0, y.jsx)("p", {
                        className: "text-body-large",
                        children: t("Description.SecondChance.Second")
                    })]
                })
            },
            configName: "second-chance-intro"
        },
        fm = {
            getIsVisible: () => !0,
            renderComponent: () => {
                var t;
                let n = dd().translate,
                    {
                        violationReasons: r,
                        isKidsTreatment: a,
                        moderatorNote: i
                    } = dS(),
                    o = (null != (t = null == r ? void 0 : r.translatedReasons) ? t : []).join(", ") || n("Label.AbuseType.Other");
                return (0, y.jsxs)("div", {
                    className: "flex flex-col gap-medium",
                    "data-testid": "what-happened",
                    children: [(0, y.jsx)("span", {
                        className: "text-title-large",
                        children: n(a ? "Heading.Why" : "Label.WhatHappened")
                    }), (0, y.jsx)("div", {
                        className: "padding-large bg-shift-100 radius-medium flex flex-col gap-small",
                        children: a ? (0, y.jsx)(fs, {
                            fieldLabel: o,
                            fieldValue: i,
                            showColon: !1,
                            preline: !0
                        }) : (0, y.jsxs)(od.Fragment, {
                            children: [(0, y.jsx)(fs, {
                                fieldLabel: n("Label.Reason"),
                                fieldValue: o
                            }), (0, y.jsx)(fs, {
                                fieldLabel: n("Label.ModeratorNote"),
                                fieldValue: i,
                                preline: !0
                            })]
                        })
                    })]
                })
            },
            configName: "what-happened"
        },
        fy = t => t.split("\n").map(t => t.trim()).filter(Boolean),
        fg = t => ({
            getIsVisible: () => !0,
            renderComponent: () => {
                let n = dd().translate,
                    r = t.description ? n(t.description) : void 0,
                    a = r ? fy(r) : [],
                    i = t.descriptionBullets ? n(t.descriptionBullets) : void 0,
                    o = i ? fy(i) : [];
                return (0, y.jsxs)("div", {
                    className: "flex flex-col gap-medium",
                    "data-testid": t.policyKey,
                    children: [(0, y.jsx)("span", {
                        className: "text-heading-medium",
                        children: n(t.title)
                    }), t.subtitle && (0, y.jsx)("span", {
                        className: "text-title-large",
                        children: n(t.subtitle)
                    }), (0, y.jsxs)("div", {
                        className: "flex flex-col gap-small",
                        children: [a.length > 0 && (0, y.jsx)("div", {
                            className: "flex flex-col gap-medium",
                            children: a.map(t => (0, y.jsx)("p", {
                                className: "text-body-large",
                                children: t
                            }, t))
                        }), o.length > 0 && (0, y.jsx)("div", {
                            className: "flex flex-col gap-xsmall padding-left-small",
                            children: o.map(t => (0, y.jsxs)("div", {
                                className: "flex flex-row gap-small",
                                children: [(0, y.jsx)("p", {
                                    className: "text-body-large",
                                    children: "•"
                                }), (0, y.jsx)("p", {
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
        fb = t => {
            let {
                isDisabled: n = !1
            } = t, r = dd().translate, {
                goToNextPage: a
            } = dN();
            return (0, y.jsx)(lx.Button, {
                variant: "Emphasis",
                size: "Medium",
                onClick: a,
                "data-testid": "continue-button",
                isDisabled: n,
                children: r("Action.Continue")
            })
        },
        fw = t => {
            let {
                setIsDialogOpen: n
            } = t, r = dd().translate;
            return (0, y.jsx)(lx.Button, {
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
        fx = ((d = fx || {})[d.Reactivate = 0] = "Reactivate", d[d.Paused = 1] = "Paused", d[d.VerifyEmail = 2] = "VerifyEmail", d[d.VerifyVPC = 3] = "VerifyVPC", d),
        fP = t => {
            let {
                onClose: n
            } = t, r = dd().translate;
            return (0, y.jsxs)("div", {
                className: "width-full flex gap-large items-center justify-between radius-medium padding-medium stroke-system-alert stroke-standard maf-error-alert",
                style: {
                    backgroundColor: "rgba(255, 0, 0, 0.1)"
                },
                "data-testid": "error-alert",
                children: [(0, y.jsxs)("div", {
                    className: "flex gap-small items-center",
                    children: [(0, y.jsx)(de.Icon, {
                        name: "icon-filled-circle-x",
                        className: "content-system-alert"
                    }), (0, y.jsx)("span", {
                        className: "text-body-medium",
                        children: r("Heading.Error")
                    })]
                }), (0, y.jsx)(da.IconButton, {
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
        fT = t => {
            let n, {
                    proceedAction: r,
                    setIsDialogOpen: a,
                    isAgreed: i,
                    isDisabled: o = !1
                } = t,
                s = dd().translate,
                {
                    sendPageEvent: u
                } = dJ(),
                {
                    userModerationApiUrl: l,
                    httpPost: c,
                    onVerifyEmail: d,
                    onVerifyParent: f,
                    onAccountReactivated: p
                } = dd(),
                [h, v] = (0, od.useState)(!1),
                m = (0, dt.useMutation)({
                    mutationFn: () => c("".concat(l, "/v1/not-approved/reactivate")),
                    onSuccess: async () => {
                        await new Promise(t => {
                            setTimeout(t, 2e3)
                        }), p()
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
                        return void m.mutate();
                    case 2:
                        a(!1), u("emailVerificationClicked"), await (null == d ? void 0 : d());
                        return;
                    case 3:
                        a(!1), u("parentVerificationClicked"), await (null == f ? void 0 : f({
                            featureName: "CanRequestPunishmentLifting",
                            namespace: "account_management/AccountManagement",
                            ampRecourseData: {
                                punishmentType: "Chargeback"
                            },
                            isAsyncCall: !0,
                            usePrologue: !1
                        })), a(!0);
                        return;
                    case 1:
                        return void console.warn("cannot reactivate suspended account yet");
                    case null:
                        console.warn("proceedAction has impossible value ".concat(r))
                }
            };
            return (0, y.jsxs)(od.Fragment, {
                children: [m.isError && (0, y.jsx)(fP, {
                    onClose: () => {
                        m.reset()
                    }
                }), (0, y.jsx)(lx.Button, {
                    onClick: () => {
                        g().catch(t => {
                            console.warn("NotApprovedProceedButton onClick error", t instanceof Error ? t.message : "unknown")
                        })
                    },
                    isDisabled: o || h || !i,
                    isLoading: h,
                    variant: "Emphasis",
                    size: "Medium",
                    "data-testid": "proceed-button",
                    children: n
                })]
            })
        },
        fR = function(t) {
            let {
                punishmentTypeDescription: n,
                endDate: r,
                verificationCategory: a
            } = t;
            switch (a) {
                case dC:
                    return 2;
                case "VPC":
                    return 3;
                default:
                    return +!dI(n, r, a)
            }
        },
        fS = t => {
            let {
                endDate: n
            } = t, r = dd().translate, a = ((t, n) => {
                let r = new Date(t),
                    a = Date.now();
                if (Number.isNaN(r.getTime())) return n("Label.Hours", {
                    hours: "00",
                    minutes: "00"
                });
                let i = r.getTime() - a;
                if (i < 0 && (i = 0), i > 864e5) return n("Label.Days", {
                    number: String(Math.ceil(i / 864e5))
                });
                let o = Math.floor(i / 36e5),
                    s = Math.floor(i % 36e5 / 6e4);
                return i > 0 && i < 6e4 && (s = 1), n("Label.Hours", {
                    hours: o.toString().padStart(2, "0"),
                    minutes: s.toString().padStart(2, "0")
                })
            })(n, r);
            return (0, y.jsxs)("div", {
                "data-testid": "suspension-duration-alert",
                className: "flex flex-wrap gap-small bg-shift-100 padding-x-medium padding-y-small stroke-standard stroke-default items-center radius-medium",
                children: [(0, y.jsx)(de.Icon, {
                    name: "icon-filled-triangle-exclamation",
                    className: "content-system-warning"
                }), (0, y.jsx)("span", {
                    className: "text-title-medium",
                    children: r("Label.Suspension")
                }), (0, y.jsx)("p", {
                    className: "text-body-medium",
                    children: a
                })]
            })
        },
        fE = t => {
            let {
                punishmentData: n,
                setIsDialogOpen: r
            } = t, a = dd().translate, i = dE(), {
                endDate: o,
                punishmentTypeDescription: s
            } = n, u = fR(n), [l, c] = (0, od.useState)(!1), [d, f] = (0, od.useState)(!1);
            return (0, od.useEffect)(() => {
                let t;
                return Object.values(dq).includes(s) && s.startsWith("Ban") && (t = setTimeout(() => {
                    f(t => !t)
                }, 6e4)), () => {
                    clearTimeout(t)
                }
            }, [d, s]), 1 === u ? (0, y.jsxs)("div", {
                className: "flex flex-col gap-large medium:flex-row",
                children: [(0, y.jsx)(fS, {
                    endDate: o
                }), (0, y.jsx)(fT, {
                    proceedAction: u,
                    setIsDialogOpen: r,
                    isAgreed: l,
                    isDisabled: !0
                })]
            }) : (0, y.jsxs)(od.Fragment, {
                children: [(0, y.jsx)(du.Checkbox, {
                    label: a("Label.RuleAcknowledgment"),
                    placement: "Start",
                    size: "Small",
                    isChecked: l,
                    onCheckedChange: t => {
                        c(!0 === t), i("checkboxChecked")
                    },
                    className: "self-start",
                    "data-testid": "rule-confirmation-checkbox"
                }), (0, y.jsx)(fT, {
                    proceedAction: u,
                    setIsDialogOpen: r,
                    isAgreed: l,
                    isDisabled: !l
                })]
            })
        },
        fq = () => {
            let t = dd().translate,
                {
                    handleAppealsClick: n
                } = fn({
                    preferViolationDetail: !0
                });
            return (0, y.jsx)(lx.Button, {
                variant: "SoftEmphasis",
                size: "Medium",
                onClick: n,
                "data-testid": "appeals-button",
                children: t("Action.ReportMistake")
            })
        },
        fk = async (t, n) => n("".concat(t, "/moderation-appeal-service/v2/consequence-commutation"), {
            type: "EDUCATIONAL_PASS"
        }), fA = () => {
            let t = dd().translate,
                {
                    sendPageEvent: n
                } = dJ(),
                {
                    httpPost: r,
                    apiGatewayUrl: a,
                    onAccountReactivated: i
                } = dd(),
                {
                    handleAppealsClick: o
                } = fn({
                    preferViolationDetail: !0
                }),
                [s, u] = (0, od.useState)(!1),
                l = (0, dt.useMutation)({
                    mutationFn: () => fk(a, r),
                    onMutate: () => {
                        u(!0), n("secondChanceReactivateClicked")
                    },
                    onSuccess: async () => {
                        await new Promise(t => {
                            setTimeout(t, 2e3)
                        }), i()
                    },
                    onError: t => {
                        console.error("reactivateMutation error", t instanceof Error ? t.message : "Unknown error"), u(!1)
                    },
                    retry: 0
                });
            return (0, y.jsxs)(od.Fragment, {
                children: [l.isError && (0, y.jsx)(fP, {
                    onClose: () => {
                        l.reset()
                    }
                }), (0, y.jsxs)("div", {
                    className: "flex flex-col gap-small medium:flex-row-reverse",
                    children: [(0, y.jsx)(lx.Button, {
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
                    }), (0, y.jsx)(lx.Button, {
                        onClick: o,
                        variant: "Standard",
                        size: "Medium",
                        "data-testid": "second-chance-send-appeal-button",
                        children: t("Action.SendAppeal")
                    })]
                })]
            })
        }, fC = () => {
            let t = dd().translate,
                [n, r] = (0, od.useState)(!1);
            return (0, y.jsxs)(od.Fragment, {
                children: [(0, y.jsx)(du.Checkbox, {
                    label: t("Label.RuleAcknowledgment"),
                    placement: "Start",
                    size: "Small",
                    isChecked: n,
                    onCheckedChange: t => {
                        r(!0 === t)
                    },
                    className: "self-start",
                    "data-testid": "understand-continue-checkbox"
                }), (0, y.jsx)(fb, {
                    isDisabled: !n
                })]
            })
        }, fI = function(t, n, r) {
            let a = arguments.length > 3 && void 0 !== arguments[3] && arguments[3],
                i = [],
                o = new Set,
                s = [],
                u = new Map;
            return t.forEach(t => {
                var n;
                let r = d1(t, a);
                if (!r) return void o.add(t);
                let i = null != (n = r.deduplicationKey) ? n : r.policyKey,
                    l = u.get(i);
                l ? r.deduplicationKey && !l.deduplicationKey && u.set(i, r) : (s.push(i), u.set(i, r))
            }), s.forEach(t => {
                let a = u.get(t);
                if (!a) return;
                let o = n && !r ? fC : fb;
                i.push({
                    pageName: "policy-rule-".concat(a.policyKey),
                    pageItems: [fg({
                        title: a.ruleTitle,
                        subtitle: a.ruleSubtitle,
                        description: a.ruleDescription,
                        descriptionBullets: a.ruleDescriptionBullets,
                        policyKey: a.policyKey
                    })],
                    CtaComponent: o
                }), i.push({
                    pageName: "policy-importance-".concat(a.policyKey),
                    pageItems: [fg({
                        title: a.importanceTitle,
                        description: a.importanceDescription,
                        descriptionBullets: a.importanceDescriptionBullets,
                        policyKey: a.policyKey
                    })],
                    CtaComponent: o
                })
            }), {
                educationalPages: i,
                unmappedViolationKeys: [...o]
            }
        }, fj = function(t, n, r, a) {
            var i;
            let o = arguments.length > 4 && void 0 !== arguments[4] && arguments[4],
                s = [],
                u = "Delete" === t.punishmentTypeDescription,
                l = null != (i = null == r ? void 0 : r.educational_pass_eligible) && i;
            if (s.push({
                    pageName: "intro",
                    pageItems: [fe, fm, fp, ...u ? [d4] : []],
                    CtaComponent: u ? fq : fb
                }), u) return {
                pages: s,
                unmappedViolationKeys: []
            };
            l && !a && s.push({
                pageName: "second-chance-intro",
                pageItems: [fv, fr],
                CtaComponent: fb
            });
            let {
                educationalPages: c,
                unmappedViolationKeys: d
            } = fI(n, l, a, o);
            s.push(...c);
            let f = a ? fw : l ? fC : fE;
            return s.push({
                pageName: "resolution",
                pageItems: [d9, d5, fr, ...a && l ? [d4] : []],
                CtaComponent: f
            }), l && !a && s.push({
                pageName: "second-chance-conclusion",
                pageItems: [fh],
                CtaComponent: fA
            }), {
                pages: s,
                unmappedViolationKeys: d
            }
        }, fL = t => {
            let {
                onOpenChange: n,
                children: r
            } = t, {
                readOnly: a
            } = dd(), {
                punishmentData: i,
                violationReasons: o,
                isLoading: s,
                error: u,
                commutationEligibility: l,
                isKidsTreatment: c
            } = dS(), d = null == o ? void 0 : o.untranslatedReasons, f = (0, od.useMemo)(() => (null != d ? d : []).some(t => d1(t, c)), [d, c]), {
                pages: p,
                unmappedViolationKeys: h
            } = (0, od.useMemo)(() => i ? fj(i, null != d ? d : [], l, a, c) : {
                pages: [],
                unmappedViolationKeys: []
            }, [i, d, l, a, c]);
            return s ? r({
                header: (0, y.jsx)(dU, {
                    readOnly: !!a
                }),
                body: (0, y.jsx)(dF, {}),
                ctas: (0, y.jsx)(dG, {})
            }) : u || !i ? r({
                header: (0, y.jsx)(dK, {}),
                body: (0, y.jsx)(dW, {
                    error: u
                })
            }) : (0, y.jsx)(dL, {
                pages: p,
                unmappedViolationKeys: h,
                hasEducationalPages: f,
                commutationEligibility: l,
                children: (0, y.jsx)(dH, {
                    children: r({
                        header: (0, y.jsx)(dB, {
                            punishmentData: i
                        }),
                        body: (0, y.jsx)(dO, {
                            punishmentData: i,
                            commutationEligibility: l
                        }),
                        ctas: (0, y.jsx)(dV, {
                            punishmentData: i,
                            setIsDialogOpen: n
                        })
                    })
                })
            })
        }, fN = t => {
            let {
                impressionEvent: n
            } = t, {
                translate: r,
                websiteUrl: a,
                onLogout: i
            } = dd(), o = dE(), s = d8(r, o), [u, l] = (0, od.useState)(!1);
            (0, od.useEffect)(() => {
                o(n)
            }, [o, n]);
            let c = (0, dt.useMutation)({
                mutationFn: async () => {
                    await i()
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
            return (0, y.jsx)(lP.Dialog, {
                open: !0,
                isModal: !0,
                size: "Medium",
                hasCloseAffordance: !1,
                children: (0, y.jsxs)(lP.DialogContent, {
                    className: "[&_p]:margin-none [&_h2]:margin-none",
                    children: [(0, y.jsxs)(lP.DialogBody, {
                        className: "gap-large flex flex-col",
                        children: [(0, y.jsx)(lP.DialogTitle, {
                            className: "text-heading-large margin-none",
                            children: r("Heading.AccountIssue")
                        }), s("Description.ResolveIssue", a)]
                    }), (0, y.jsxs)(lP.DialogFooter, {
                        className: "flex justify-end gap-small flex-col-reverse medium:flex-row",
                        children: [(0, y.jsx)(lx.Button, {
                            variant: "Standard",
                            size: "Medium",
                            isLoading: u,
                            isDisabled: u,
                            onClick: () => {
                                c.mutate()
                            },
                            children: r("Action.Logout")
                        }), (0, y.jsx)(lx.Button, {
                            variant: "Emphasis",
                            size: "Medium",
                            onClick: () => {
                                window.open(a, "_blank", "noopener,noreferrer")
                            },
                            children: r("Action.GoToRoblox")
                        })]
                    })]
                })
            })
        }, fO = t => {
            var n;
            let {
                open: r,
                onClose: a
            } = t, [i, o] = (0, od.useState)(!0), s = void 0 !== r, u = t => {
                s && !t ? null == a || a() : o(t)
            }, {
                translate: l,
                renderSelfServiceDeactivated: c,
                shouldShowGenericFallback: d,
                readOnly: f
            } = dd(), {
                punishmentData: p,
                isLoading: h,
                error: v
            } = dS(), m = dE(), g = !h && !v && void 0 !== p, b = !h && !v && !p;
            if ((0, od.useEffect)(() => {
                    if (g) {
                        var t;
                        m((null == (t = p.context) ? void 0 : t.SelfServiceDeactivated) ? "accountReactivationPageRendered" : "pageRendered", {
                            interventionId: p.interventionId,
                            punishedUserId: p.punishedUserId,
                            isReactivationEligible: dI(p.punishmentTypeDescription, p.endDate, p.verificationCategory),
                            verificationCategory: p.verificationCategory
                        })
                    }
                }, [g, p]), b && !f) return null;
            if (g && (null == (n = p.context) ? void 0 : n.SelfServiceDeactivated)) return c ? (0, y.jsx)(od.Fragment, {
                children: c()
            }) : (0, y.jsx)(fN, {
                impressionEvent: "accountReactivationRedirectRendered"
            });
            let w = g && (null == d ? void 0 : d(p));
            return w ? (0, y.jsx)(fN, {
                impressionEvent: w
            }) : (0, y.jsx)(lP.Dialog, {
                open: null != r ? r : i,
                size: "Large",
                hasCloseAffordance: !!f,
                closeLabel: l("Action.Close"),
                isModal: !0,
                onOpenChange: f ? t => {
                    t || u(!1)
                } : void 0,
                children: (0, y.jsx)(lP.DialogContent, {
                    className: "width-full [&_p]:margin-none [&_h2]:margin-none",
                    onOpenAutoFocus: t => {
                        t.preventDefault()
                    },
                    children: (0, y.jsx)(lP.DialogBody, {
                        className: "flex flex-col height-[85vh] max-height-[800px]",
                        children: (0, y.jsx)(fL, {
                            onOpenChange: u,
                            children: t => {
                                let {
                                    header: n,
                                    body: r,
                                    ctas: a
                                } = t;
                                return (0, y.jsxs)("div", {
                                    className: "flex flex-col gap-large height-full min-height-0",
                                    children: [(0, y.jsx)(lP.DialogTitle, {
                                        className: "padding-none",
                                        children: n
                                    }), (0, y.jsxs)("div", {
                                        className: "grow-1 scroll-y min-height-0",
                                        children: [r, (0, y.jsx)("div", {
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
                                    }), (0, y.jsx)("div", {
                                        className: "shrink-0",
                                        children: a
                                    })]
                                })
                            }
                        })
                    })
                })
            })
        }, fD = new ov.QueryClient({
            defaultOptions: {
                queries: {
                    refetchOnWindowFocus: !1,
                    retry: !1,
                    refetchOnMount: !1,
                    staleTime: 6e4
                }
            }
        }), fM = function(t) {
            let {
                open: n,
                onClose: r
            } = t;
            return (0, y.jsx)(om.QueryClientProvider, {
                client: fD,
                children: (0, y.jsx)(dR, {
                    enableIxp: !0,
                    children: (0, y.jsx)(fO, {
                        open: n,
                        onClose: r
                    })
                })
            })
        }, f_ = t.i(894244), fB = t.i(839165);
    let fV = function() {
            let {
                translate: t
            } = (0, oR.useTranslation)(), n = (0, lc.useAuthentication)(), r = (0, of.useRouter)(), a = "https://usermoderation.".concat("roblox.com"), i = "https://apis.roblox.com", o = "https://".concat("roblox.com"), s = "CreatorHub", u = (0, od.useCallback)(t => {
                lW.default.logHostRoutedEvent({
                    eventType: t.eventName,
                    context: t.context,
                    properties: t.properties
                })
            }, []), l = (0, od.useCallback)(t => !!t.verificationCategory && dp.VerificationRedirectRendered, []), c = (0, od.useCallback)(async () => {
                let t = await (0, f_.getAuthorizationEndpoint)({
                    redirectUri: "https://create.roblox.com"
                });
                await n.logout(), await r.push(t)
            }, [r, n]), d = (0, od.useCallback)(() => {
                r.reload()
            }, [r]);
            return (0, od.useMemo)(() => ({
                translate: t,
                httpGet: fB.authenticatedHttpGet,
                httpPost: fB.authenticatedHttpPost,
                userModerationApiUrl: a,
                apiGatewayUrl: i,
                websiteUrl: o,
                sendAnalyticsEvent: u,
                platform: s,
                shouldShowGenericFallback: l,
                onLogout: c,
                onAccountReactivated: d
            }), [t, a, i, o, u, s, l, c, d])
        },
        fU = () => {
            let t = fV();
            return (0, y.jsx)(dc, {
                config: t,
                children: (0, y.jsx)(fM, {})
            })
        },
        fF = (0, oR.withTranslation)(() => {
            let {
                themeMode: t
            } = (0, ll.useThemeMode)();
            return (0, y.jsx)(lp.UIThemeProvider, {
                theme: t,
                children: (0, y.jsx)(fU, {})
            })
        }, [lA.TranslationNamespace.NotApproved, lA.TranslationNamespace.Moderation, lA.TranslationNamespace.AppealsPortal, lA.TranslationNamespace.CommonUIControls, lA.TranslationNamespace.Error, lA.TranslationNamespace.DashboardModeration]),
        fG = () => {
            let {
                status: t
            } = (0, lc.useAuthentication)();
            return "moderated" === t ? (0, y.jsx)(fF, {}) : null
        };
    var fK = t.i(325240);
    let fW = (0, lJ.default)(() => t.A(14667), {
            loadableGenerated: {
                modules: [573249]
            },
            ssr: !1
        }),
        fz = t => {
            let {
                children: n
            } = t;
            return (0, y.jsx)(fK.UniversalFeatureRestrictionsProvider, {
                Surface: fW,
                children: n
            })
        };
    var fH = t.i(336964);

    function fJ(t) {
        return "object" == typeof t && null !== t && "Component" in t
    }

    function fQ(t) {
        var n;
        let {
            store: r
        } = t, a = null != r ? r : fH.dialogStore, {
            render: i,
            options: o,
            isOpen: s
        } = (0, od.useSyncExternalStore)(a.subscribe, a.getSnapshot, a.getSnapshot);
        if ((0, od.useEffect)(() => {
                if (s || null === o || !o.shouldUnmountOnClose) return;
                let t = setTimeout(() => a.clearContent(), 150);
                return () => clearTimeout(t)
            }, [s, o, a]), null === i) return null;
        if ((null == o ? void 0 : o.mode) === "standalone" && fJ(i)) return (0, od.createElement)(i.Component, {
            ...i.props,
            open: s,
            onOpenChange: t => {
                t || a.close()
            }
        });
        let u = null != o ? o : fH.DEFAULT_RESOLVED_CONTENT_OPTIONS,
            l = fJ(i) ? (0, od.createElement)(i.Component, i.props) : i;
        return (0, y.jsx)(lP.Dialog, {
            open: s,
            onOpenChange: t => {
                t || a.close()
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
    var fX = t.i(842697),
        f$ = t.i(209534);

    function fZ() {
        let {
            current: t
        } = (0, od.useSyncExternalStore)(f$.snackbarStore.subscribe, f$.snackbarStore.getSnapshot, f$.snackbarStore.getSnapshot);
        return null === t ? null : (0, y.jsx)(fX.Snackbar, {
            ...t.props,
            onClose: () => f$.snackbarStore.dismiss()
        }, t.id)
    }
    var fY = t.i(943758);
    let f0 = (0, od.createContext)({
        primarySidebarExpanded: !1,
        setPrimarySidebarExpanded: () => {
            throw Error("Function not implemented. You may be trying to use this context outside of a provider.")
        }
    });
    f0.displayName = "LeftNavigationStateContext";
    let f1 = t => {
        let {
            children: n
        } = t, [r, a] = (0, od.useState)(!0), i = (0, od.useMemo)(() => ({
            primarySidebarExpanded: r,
            setPrimarySidebarExpanded: a
        }), [r]);
        return (0, y.jsx)(f0.Provider, {
            value: i,
            children: n
        })
    };
    var f2 = t.i(729904),
        f4 = t.i(142330),
        f3 = t.i(611043),
        f6 = t.i(547710),
        f8 = t.i(613268),
        f5 = t.i(253738),
        f9 = t.i(196990),
        f7 = t.i(533968),
        pe = t.i(210205),
        pt = t.i(616931),
        pn = t.i(407881);
    let pr = (0, oR.withTranslation)(t => {
            var n, r;
            let {
                onDialogCompletion: a
            } = t, i = (0, of.useRouter)(), {
                translate: o
            } = (0, oR.useTranslation)(), {
                user: s,
                logout: u
            } = (0, lc.useAuthentication)(), l = (0, od.useRef)(!1), [c, d] = (0, od.useState)(!1), {
                completeCheck: f
            } = (0, pn.useUserAgreementCheck)(), {
                captureError: p,
                error: h,
                info: v
            } = (0, pe.useMetricsMonitoring)(), [m, g] = (0, od.useState)(!1), [b, w] = (0, od.useState)(!1), [x, P] = (0, od.useState)([]), T = (0, od.useCallback)(async t => {
                async function n(t, r) {
                    if (r <= 0) return void h("User Agreement accept failed after retried ".concat(pt.maxUpdateRetryCount, " times"));
                    try {
                        var a;
                        let i = null == (a = (await f9.userAgreementsClient.acceptUserAgreements(t)).results) ? void 0 : a.filter(t => 0 !== t.errorCode).map(t => t.agreementId);
                        i && i.length > 0 && await n(i, r - 1)
                    } catch (i) {
                        let a = (0, f7.getResponseFromError)(i);
                        (null == a ? void 0 : a.status) === cL.StatusCodes.UNAUTHORIZED ? (v("User Agreement accept failed with 401 from backend"), await of.default.push("/login")) : (h("User Agreement accept failed with status code ".concat(null == a ? void 0 : a.status)), await n(t, r - 1))
                    }
                }
                await n(t, pt.maxUpdateRetryCount)
            }, [h, v]), R = (0, od.useCallback)(async () => {
                try {
                    await u()
                } catch (t) {
                    t instanceof Error && p(t), h("Logout after user reject update agreements failed")
                } finally {
                    g(!1), null == a || a()
                }
            }, [p, h, u, a]), S = (0, od.useCallback)(async () => {
                let t = x.map(t => t.id);
                w(!0), await T(t), d(!0), w(!1), g(!1), null == a || a()
            }, [T, x, a]), E = (0, od.useCallback)(async () => {
                try {
                    let t = f9.userAgreementsClient.getUserAgreements({
                            clientType: f4.ClientType.Studio
                        }),
                        n = await t;
                    n.length > 0 ? (P([...n]), g(!0)) : (f(), null == a || a())
                } catch (t) {
                    null == a || a(), h("Fetch update user-agreements failed"), t instanceof Error && p(t), f()
                }
            }, [p, f, h, a]), q = (0, od.useMemo)(() => ({
                onExited: () => {
                    c && f()
                }
            }), [f, c]);
            return (0, od.useEffect)(() => {
                (null == s ? void 0 : s.id) === void 0 || l.current || !i.isReady || pt.dontShowAgreementPaths.some(t => i.pathname.startsWith(t)) || (E(), l.current = !0)
            }, [s, E, i.isReady, i.pathname]), (0, y.jsx)(f6.Dialog, {
                open: m,
                TransitionProps: q,
                children: (0, y.jsx)(f8.DialogTemplate, {
                    onConfirm: S,
                    onCancel: R,
                    title: o("Heading.AgreementsUpdate"),
                    content: (0, y.jsxs)(y.Fragment, {
                        children: [(0, y.jsx)(f3.Typography, {
                            component: "p",
                            variant: "body1",
                            children: null != (n = null == (r = x.find(t => null != t.agreementBodyText)) ? void 0 : r.agreementBodyText) ? n : o("Description.AgreementsUpdate")
                        }), (0, y.jsx)("ul", {
                            children: x.map(t => {
                                var n;
                                let r;
                                return (0, y.jsx)("li", {
                                    children: (0, y.jsx)(f5.Link, {
                                        href: t.displayUrl,
                                        target: "__blank",
                                        children: (n = t.agreementType, void 0 === (r = pt.agreementsTranslationMap[n]) ? o(r) : n)
                                    })
                                }, t.id)
                            })
                        })]
                    }),
                    confirmText: o("Button.Accept"),
                    cancelText: o("Button.Reject"),
                    loading: b
                })
            })
        }, [lA.TranslationNamespace.AgreementsUpdate]),
        {
            authenticationApi: pa
        } = {
            authenticationApi: ln
        },
        {
            discoveryApi: pi
        } = uI.ApplicationAuthorizationsClient,
        {
            usersApi: po
        } = la.UsersClient,
        ps = (a = lW.default, t => {
            var n, r, i, o, s, u, l, c, d;
            let f, p;
            return a.logWebVitalsEvent({
                eventName: "webVitals",
                parameters: {
                    metricName: t.name,
                    metricStartTime: String(t.startTime),
                    metricValue: String(t.value),
                    metricLabel: t.label,
                    ...uk || (uk = {
                        staticAsset: void 0 === (f = null == (s = performance) || null == (o = s.getEntriesByType) || null == (i = o.call(s, "resource")) || null == (r = i.find) || null == (n = r.call(i, t => {
                            let {
                                initiatorType: n,
                                name: r
                            } = t;
                            return "script" === n && r.includes("_next/static/chunks/")
                        })) ? void 0 : n.transferSize) ? "unknown" : 0 === f ? "cached" : "network",
                        serviceWorker: (null == (u = navigator) ? void 0 : u.serviceWorker) ? navigator.serviceWorker.controller ? "controlled" : "uncontrolled" : "unsupported",
                        pageLoad: void 0 === (p = null == (d = performance) || null == (c = d.getEntriesByType) || null == (l = c.call(d, "navigation")[0]) ? void 0 : l.transferSize) ? "unknown" : 0 === p ? "cached" : "network"
                    })
                }
            })
        });
    (0, ox.c)({
        unifiedLogger: lW.default
    }), cb();
    let pu = (uh && (h = null != (f = document.querySelector('meta[name="'.concat("emotion-insertion-point-mui", '"]'))) ? f : void 0, v = null != (p = document.querySelector('meta[name="'.concat("emotion-insertion-point-tss", '"]'))) ? p : void 0), {
        muiCache: (0, oq.c)({
            key: uf,
            prepend: !0,
            insertionPoint: h
        }),
        tssCache: (0, oq.c)({
            key: up,
            insertionPoint: v
        })
    });
    (0, oS.createThumbnailsClient)((0, li.getBEDEV1ServiceBasePath)("thumbnails"));
    let pl = {
            locale: cj.defaultLocale,
            nativeName: cj.defaultNativeName
        },
        pc = new cI.TranslationResourceProvider(pl, cj.fallbackLocale),
        pd = t => {
            let n, r, {
                children: a
            } = t;
            return n = (0, lz.useCustomDashboardService)(), r = (0, om.useQueryClient)(), (0, od.useEffect)(() => n.subscribe(t => {
                if ("external" === t.eventType) return void r.invalidateQueries({
                    queryKey: lH.customDashboardQueryKeys.universe(t.universeId)
                });
                if ("pin" === t.eventType || "unpin" === t.eventType) {
                    r.invalidateQueries({
                        queryKey: lH.customDashboardQueryKeys.list(t.universeId),
                        refetchType: "none"
                    }), r.invalidateQueries({
                        queryKey: lH.customDashboardQueryKeys.pinned(t.universeId)
                    }), r.invalidateQueries({
                        queryKey: lH.customDashboardQueryKeys.detail(t.universeId, t.dashboardId)
                    });
                    return
                }
                r.invalidateQueries({
                    queryKey: lH.customDashboardQueryKeys.list(t.universeId)
                }), r.invalidateQueries({
                    queryKey: lH.customDashboardQueryKeys.pinned(t.universeId)
                }), r.invalidateQueries({
                    queryKey: lH.customDashboardQueryKeys.suggestedName(t.universeId)
                }), r.invalidateQueries({
                    queryKey: lH.customDashboardQueryKeys.detail(t.universeId, t.dashboardId)
                })
            }), [n, r]), (0, y.jsx)(y.Fragment, {
                children: a
            })
        },
        pf = {
            defaultLocale: cj.defaultLocale,
            title: cj.defaultMetadataJson["OpenGraph.Title"],
            description: cj.defaultMetadataJson["OpenGraph.Description"]
        },
        pp = t => t,
        ph = () => ((() => {
            let {
                trackerClient: t
            } = (0, lK.useEventTrackerProvider)(), n = (0, od.useCallback)(() => {
                let n = (0, cq.loadPageEventModel)();
                t.sendEvent(n)
            }, [t]);
            (0, ck.default)(void 0, n), (0, od.useEffect)(() => n(), [n]), (0, od.useEffect)(() => {
                lW.default.trackPageLoad()
            }, []), (0, od.useEffect)(() => {
                let {
                    pageSettledTracker: t
                } = lW.default;
                return t.getSnapshot(), of.default.events.on("routeChangeStart", t.start), of.default.events.on("routeChangeComplete", t.complete), of.default.events.on("routeChangeError", t.cancel), () => {
                    of.default.events.off("routeChangeStart", t.start), of.default.events.off("routeChangeComplete", t.complete), of.default.events.off("routeChangeError", t.cancel)
                }
            }, [])
        })(), (0, op.useReportWebVitals)(ps), null),
        pv = {
            enabled: !0,
            isFetched: !0
        },
        pm = t => {
            let {
                children: n
            } = t, {
                value: r
            } = (0, oT.useFlag)(uA.enableGroupModerationPage), a = (() => {
                let {
                    ready: t,
                    value: n
                } = (0, oT.useFlag)(l3.newCreatorWallets);
                return (0, od.useMemo)(() => ({
                    visible: t && n
                }), [t, n])
            })();
            return (0, y.jsx)(ow.NavigationConfigsProvider, {
                currentProduct: "CreatorDashboard",
                environment: (0, f2.default)(),
                robloxEnvironment: "production",
                target: "global",
                drawerVariant: "belowAppBar",
                signalRCrossTab: pv,
                creatorWalletsNavigation: a,
                enableGroupModeration: null != r && r,
                children: n
            })
        },
        py = new ov.QueryClient({
            defaultOptions: {
                queries: {
                    refetchOnWindowFocus: !1,
                    retry: !1
                }
            }
        }),
        pg = (0, oy.initializeAuthStore)(),
        pb = t => {
            var n;
            let {
                Component: r,
                pageProps: a,
                cache: i
            } = t, {
                query: o
            } = (0, of.useRouter)(), s = null != (n = r.getPageLayout) ? n : pp, u = (0, od.useMemo)(() => ({
                ...pf,
                ...r.pageMetadata
            }), [r.pageMetadata]), [l, c] = (0, od.useState)(!1), d = (0, od.useCallback)(() => c(!0), []);
            return (0, ob.useMaintenanceObserver)("https://create.roblox.com"), (0, od.useEffect)(() => {
                uv()
            }, []), lq.default.setUnifiedLoggerClient(lW.default), (0, y.jsx)(oh.ErrorBoundary, {
                children: (0, y.jsx)(um, {
                    cache: null != i ? i : pu,
                    children: (0, y.jsxs)(cS, {
                        providers: [(0, y.jsx)(fY.BreadcrumbItemNameProvider, {}), (0, y.jsx)(om.QueryClientProvider, {
                            client: py
                        }), (0, y.jsx)(oP.C, {
                            client: lr.default
                        }), (0, y.jsx)(lz.CustomDashboardServiceProvider, {}), (0, y.jsx)(lz.UniverseFlaggedCustomDashboardProvider, {}), (0, y.jsx)(pd, {}), (0, y.jsx)(cC, {
                            pageLoggerConfig: r.loggerConfig
                        }), (0, y.jsx)(lK.EventTrackerProvider, {
                            trackerClient: lq.default
                        }), (0, y.jsx)(oy.RobloxAuthenticationProvider, {
                            clientId: "4273917941353191905",
                            authenticationClient: pa,
                            discoveryClient: pi,
                            usersClient: po,
                            store: pg
                        }), (0, y.jsx)(cw.GroupsProvider, {}), (0, y.jsx)(ld, {}), (0, y.jsx)(lh, {
                            themeElement: "u" > typeof document ? document.documentElement : void 0
                        }), (0, y.jsx)(oR.LocalizationProvider, {
                            provider: pc
                        }), (0, y.jsx)(uy.SnackbarProvider, {}), (0, y.jsx)(ug.DialogProvider, {}), (0, y.jsx)(lf.default, {}), (0, y.jsx)(oS.ThumbnailsProvider, {
                            baseUrl: lq.eventStreamBaseUrl
                        }), (0, y.jsx)(pm, {}), (0, y.jsx)(cE.ThemeAwareStudioResourcesProvider, {}), (0, y.jsx)(cD, {}), (0, y.jsx)(cR.default, {}), (0, y.jsx)(f1, {}), (0, y.jsx)(og.CookieConsentProvider, {
                            robloxSiteDomain: "roblox.com"
                        }), (0, y.jsx)(uC.AgeVerificationUpsellProvider, {}), (0, y.jsx)(fz, {}), (0, y.jsx)(pn.default, {})],
                        children: [(0, y.jsx)(ph, {}), (0, y.jsx)(lu, {
                            provider: pc
                        }), (0, y.jsx)(fZ, {}), (0, y.jsx)(fQ, {}), (0, y.jsx)(fG, {}), (0, y.jsx)(lG, {
                            isSuppressed: !l
                        }), (0, y.jsx)(pr, {
                            onDialogCompletion: d
                        }), (0, y.jsx)(cT, {}), (0, y.jsx)(cV, {
                            openGraphMetadata: u
                        }), s((0, y.jsx)(r, {
                            ...a
                        }), {
                            query: o
                        })]
                    })
                })
            })
        };
    t.s(["CustomApp", 0, pb, "default", 0, pb, "reportWebVitals", 0, ps], 656350)
}, 681109, (t, n, r) => {
    let a = "/_app";
    (window.__NEXT_P = window.__NEXT_P || []).push([a, () => t.r(656350)]), n.hot && n.hot.dispose(function() {
        window.__NEXT_P.push([a])
    })
}, 733583, (t, n, r) => {
    ! function() {
        "use strict";
        var t = {};
        t.d = function(n, r) {
            for (var a in r) t.o(r, a) && !t.o(n, a) && Object.defineProperty(n, a, {
                enumerable: !0,
                get: r[a]
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
                return z
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
        var a, i, o, s, u, l = -1,
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
            p = function(t, n) {
                var r = d(),
                    a = "navigate";
                return l >= 0 ? a = "back-forward-cache" : r && (document.prerendering || f() > 0 ? a = "prerender" : document.wasDiscarded ? a = "restore" : r.type && (a = r.type.replace(/_/g, "-"))), {
                    name: t,
                    value: void 0 === n ? -1 : n,
                    rating: "good",
                    delta: 0,
                    entries: [],
                    id: "v4-".concat(Date.now(), "-").concat(Math.floor(0x82f79cd8fff * Math.random()) + 1e12),
                    navigationType: a
                }
            },
            h = function(t, n, r) {
                try {
                    if (PerformanceObserver.supportedEntryTypes.includes(t)) {
                        var a = new PerformanceObserver(function(t) {
                            Promise.resolve().then(function() {
                                n(t.getEntries())
                            })
                        });
                        return a.observe(Object.assign({
                            type: t,
                            buffered: !0
                        }, r || {})), a
                    }
                } catch (t) {}
            },
            v = function(t, n, r, a) {
                var i, o;
                return function(s) {
                    var u;
                    n.value >= 0 && (s || a) && ((o = n.value - (i || 0)) || void 0 === i) && (i = n.value, n.delta = o, u = n.value, n.rating = u > r[1] ? "poor" : u > r[0] ? "needs-improvement" : "good", t(n))
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
                "hidden" === document.visibilityState && b > -1 && (b = "visibilitychange" === t.type ? t.timeStamp : 0, T())
            },
            P = function() {
                addEventListener("visibilitychange", x, !0), addEventListener("prerenderingchange", x, !0)
            },
            T = function() {
                removeEventListener("visibilitychange", x, !0), removeEventListener("prerenderingchange", x, !0)
            },
            R = function() {
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
                    var r, a = R(),
                        i = p("FCP"),
                        o = h("paint", function(t) {
                            t.forEach(function(t) {
                                "first-contentful-paint" === t.name && (o.disconnect(), t.startTime < a.firstHiddenTime && (i.value = Math.max(t.startTime - f(), 0), i.entries.push(t), r(!0)))
                            })
                        });
                    o && (r = v(t, i, E, n.reportAllChanges), c(function(a) {
                        r = v(t, i = p("FCP"), E, n.reportAllChanges), m(function() {
                            i.value = performance.now() - a.timeStamp, r(!0)
                        })
                    }))
                })
            },
            k = [.1, .25],
            A = function(t, n) {
                n = n || {}, q(g(function() {
                    var r, a = p("CLS", 0),
                        i = 0,
                        o = [],
                        s = function(t) {
                            t.forEach(function(t) {
                                if (!t.hadRecentInput) {
                                    var n = o[0],
                                        r = o[o.length - 1];
                                    i && t.startTime - r.startTime < 1e3 && t.startTime - n.startTime < 5e3 ? (i += t.value, o.push(t)) : (i = t.value, o = [t])
                                }
                            }), i > a.value && (a.value = i, a.entries = o, r())
                        },
                        u = h("layout-shift", s);
                    u && (r = v(t, a, k, n.reportAllChanges), y(function() {
                        s(u.takeRecords()), r(!0)
                    }), c(function() {
                        i = 0, r = v(t, a = p("CLS", 0), k, n.reportAllChanges), m(function() {
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
            N = function() {
                "interactionCount" in performance || a || (a = h("event", L, {
                    type: "event",
                    buffered: !0,
                    durationThreshold: 0
                }))
            },
            O = [],
            D = new Map,
            M = 0,
            _ = [],
            B = function(t) {
                if (_.forEach(function(n) {
                        return n(t)
                    }), t.interactionId || "first-input" === t.entryType) {
                    var n = O[O.length - 1],
                        r = D.get(t.interactionId);
                    if (r || O.length < 10 || t.duration > n.latency) {
                        if (r) t.duration > r.latency ? (r.entries = [t], r.latency = t.duration) : t.duration === r.latency && t.startTime === r.entries[0].startTime && r.entries.push(t);
                        else {
                            var a = {
                                id: t.interactionId,
                                latency: t.duration,
                                entries: [t]
                            };
                            D.set(a.id, a), O.push(a)
                        }
                        O.sort(function(t, n) {
                            return n.latency - t.latency
                        }), O.length > 10 && O.splice(10).forEach(function(t) {
                            return D.delete(t.id)
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
                    N();
                    var r, i, o = p("INP"),
                        s = function(t) {
                            V(function() {
                                t.forEach(B);
                                var n, r = (n = Math.min(O.length - 1, Math.floor(((a ? C : performance.interactionCount || 0) - M) / 50)), O[n]);
                                r && r.latency !== o.value && (o.value = r.latency, o.entries = r.entries, i())
                            })
                        },
                        u = h("event", s, {
                            durationThreshold: null != (r = n.durationThreshold) ? r : 40
                        });
                    i = v(t, o, U, n.reportAllChanges), u && (u.observe({
                        type: "first-input",
                        buffered: !0
                    }), y(function() {
                        s(u.takeRecords()), i(!0)
                    }), c(function() {
                        M = 0, O.length = 0, D.clear(), i = v(t, o = p("INP"), U, n.reportAllChanges)
                    }))
                }))
            },
            G = [2500, 4e3],
            K = {},
            W = function(t, n) {
                n = n || {}, S(function() {
                    var r, a = R(),
                        i = p("LCP"),
                        o = function(t) {
                            n.reportAllChanges || (t = t.slice(-1)), t.forEach(function(t) {
                                t.startTime < a.firstHiddenTime && (i.value = Math.max(t.startTime - f(), 0), i.entries = [t], r())
                            })
                        },
                        s = h("largest-contentful-paint", o);
                    if (s) {
                        r = v(t, i, G, n.reportAllChanges);
                        var u = g(function() {
                            K[i.id] || (o(s.takeRecords()), s.disconnect(), K[i.id] = !0, r(!0))
                        });
                        ["keydown", "click"].forEach(function(t) {
                            addEventListener(t, function() {
                                return V(u)
                            }, !0)
                        }), y(u), c(function(a) {
                            r = v(t, i = p("LCP"), G, n.reportAllChanges), m(function() {
                                i.value = performance.now() - a.timeStamp, K[i.id] = !0, r(!0)
                            })
                        })
                    }
                })
            },
            z = [800, 1800],
            H = function t(n) {
                document.prerendering ? S(function() {
                    return t(n)
                }) : "complete" !== document.readyState ? addEventListener("load", function() {
                    return t(n)
                }, !0) : setTimeout(n, 0)
            },
            J = function(t, n) {
                n = n || {};
                var r = p("TTFB"),
                    a = v(t, r, z, n.reportAllChanges);
                H(function() {
                    var i = d();
                    i && (r.value = Math.max(i.responseStart - f(), 0), r.entries = [i], a(!0), c(function() {
                        (a = v(t, r = p("TTFB", 0), z, n.reportAllChanges))(!0)
                    }))
                })
            },
            Q = {
                passive: !0,
                capture: !0
            },
            X = new Date,
            $ = function(t, n) {
                i || (i = n, o = t, s = new Date, ee(removeEventListener), Z())
            },
            Z = function() {
                if (o >= 0 && o < s - X) {
                    var t = {
                        entryType: "first-input",
                        name: i.type,
                        target: i.target,
                        cancelable: i.cancelable,
                        startTime: i.timeStamp,
                        processingStart: i.timeStamp + o
                    };
                    u.forEach(function(n) {
                        n(t)
                    }), u = []
                }
            },
            Y = function(t) {
                if (t.cancelable) {
                    var n, r, a, i = (t.timeStamp > 1e12 ? new Date : performance.now()) - t.timeStamp;
                    "pointerdown" == t.type ? (n = function() {
                        $(i, t), a()
                    }, r = function() {
                        a()
                    }, a = function() {
                        removeEventListener("pointerup", n, Q), removeEventListener("pointercancel", r, Q)
                    }, addEventListener("pointerup", n, Q), addEventListener("pointercancel", r, Q)) : $(i, t)
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
                    var r, a = R(),
                        s = p("FID"),
                        l = function(t) {
                            t.startTime < a.firstHiddenTime && (s.value = t.processingStart - t.startTime, s.entries.push(t), r(!0))
                        },
                        d = function(t) {
                            t.forEach(l)
                        },
                        f = h("first-input", d);
                    r = v(t, s, et, n.reportAllChanges), f && (y(g(function() {
                        d(f.takeRecords()), f.disconnect()
                    })), c(function() {
                        r = v(t, s = p("FID"), et, n.reportAllChanges), u = [], o = -1, i = null, ee(addEventListener), u.push(l), Z()
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
    let a = t.r(416340),
        i = t.r(733583);

    function o(t) {
        (0, a.useEffect)(() => {
            (0, i.onCLS)(t), (0, i.onFID)(t), (0, i.onLCP)(t), (0, i.onINP)(t), (0, i.onFCP)(t), (0, i.onTTFB)(t)
        }, [t])
    }("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), n.exports = r.default)
}, 87758, (t, n, r) => {
    n.exports = t.r(816657)
}]);

//# debugId=28ab4fd3-df49-a734-b88c-8097353e9a67
//# sourceMappingURL=2v1dxmr-rd4sg.js.map