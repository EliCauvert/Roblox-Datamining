;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "21aa2395-d811-1325-21aa-dec7a586ab68")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 318648, (e, t, n) => {
    "use strict";
    Object.defineProperty(n, "__esModule", {
        value: !0
    });
    let r = (0, e.r(330903).getDeploymentId)();
    globalThis.NEXT_DEPLOYMENT_ID = r, ("function" == typeof n.default || "object" == typeof n.default && null !== n.default) && void 0 === n.default.__esModule && (Object.defineProperty(n.default, "__esModule", {
        value: !0
    }), Object.assign(n.default, n), t.exports = n.default)
}, 558890, (e, t, n) => {
    "use strict";
    Object.defineProperty(n, "__esModule", {
        value: !0
    }), Object.defineProperty(n, "getAssetPrefix", {
        enumerable: !0,
        get: function() {
            return a
        }
    });
    let r = e.r(486401);

    function a() {
        let e = document.currentScript;
        if (!(e instanceof HTMLScriptElement)) throw Object.defineProperty(new r.InvariantError(`Expected document.currentScript to be a <script> element. Received ${e} instead.`), "__NEXT_ERROR_CODE", {
            value: "E783",
            enumerable: !1,
            configurable: !0
        });
        let {
            pathname: t
        } = new URL(e.src), n = t.indexOf("/_next/");
        if (-1 === n) throw Object.defineProperty(new r.InvariantError(`Expected document.currentScript src to contain '/_next/'. Received ${e.src} instead.`), "__NEXT_ERROR_CODE", {
            value: "E784",
            enumerable: !1,
            configurable: !0
        });
        return t.slice(0, n)
    }("function" == typeof n.default || "object" == typeof n.default && null !== n.default) && void 0 === n.default.__esModule && (Object.defineProperty(n.default, "__esModule", {
        value: !0
    }), Object.assign(n.default, n), t.exports = n.default)
}, 855458, (e, t, n) => {
    "use strict";
    Object.defineProperty(n, "__esModule", {
        value: !0
    }), Object.defineProperty(n, "appBootstrap", {
        enumerable: !0,
        get: function() {
            return i
        }
    });
    let r = e.r(558890),
        a = e.r(525282);

    function i(e) {
        var t, n;
        let i = (0, r.getAssetPrefix)();
        t = self.__next_s, n = () => {
            e(i)
        }, t && t.length ? t.reduce((e, t) => {
            let [n, r] = t;
            return e.then(() => new Promise((e, t) => {
                let i = document.createElement("script");
                r && (0, a.setAttributesFromProps)(i, r), n ? (i.src = n, i.onload = () => e(), i.onerror = t) : r && (i.innerHTML = r.children, setTimeout(e)), document.head.appendChild(i)
            }))
        }, Promise.resolve()).catch(e => {
            console.error(e)
        }).then(() => {
            n()
        }) : n()
    }
    window.next = {
        version: "16.2.6",
        appDir: !0
    }, ("function" == typeof n.default || "object" == typeof n.default && null !== n.default) && void 0 === n.default.__esModule && (Object.defineProperty(n.default, "__esModule", {
        value: !0
    }), Object.assign(n.default, n), t.exports = n.default)
}, 915121, (e, t, n) => {
    "use strict";
    Object.defineProperty(n, "__esModule", {
        value: !0
    }), Object.defineProperty(n, "reportGlobalError", {
        enumerable: !0,
        get: function() {
            return r
        }
    });
    let r = "function" == typeof reportError ? reportError : e => {
        globalThis.console.error(e)
    };
    ("function" == typeof n.default || "object" == typeof n.default && null !== n.default) && void 0 === n.default.__esModule && (Object.defineProperty(n.default, "__esModule", {
        value: !0
    }), Object.assign(n.default, n), t.exports = n.default)
}, 867054, (e, t, n) => {
    "use strict";
    Object.defineProperty(n, "__esModule", {
        value: !0
    });
    var r = {
        isRecoverableError: function() {
            return c
        },
        onRecoverableError: function() {
            return d
        }
    };
    for (var a in r) Object.defineProperty(n, a, {
        enumerable: !0,
        get: r[a]
    });
    let i = e.r(481258),
        o = e.r(397204),
        l = i._(e.r(918508)),
        s = e.r(915121),
        u = new WeakSet;

    function c(e) {
        return u.has(e)
    }
    let d = e => {
        let t = (0, l.default)(e) && "cause" in e ? e.cause : e;
        (0, o.isBailoutToCSRError)(t) || (0, s.reportGlobalError)(t)
    };
    ("function" == typeof n.default || "object" == typeof n.default && null !== n.default) && void 0 === n.default.__esModule && (Object.defineProperty(n.default, "__esModule", {
        value: !0
    }), Object.assign(n.default, n), t.exports = n.default)
}, 632853, (e, t, n) => {
    "use strict";
    var r = function(e) {
        return e && e.Math === Math && e
    };
    t.exports = r("object" == typeof globalThis && globalThis) || r("object" == typeof window && window) || r("object" == typeof self && self) || r(e.g) || r("object" == typeof e.e && e.e) || function() {
        return this
    }() || Function("return this")()
}, 981625, (e, t, n) => {
    "use strict";
    t.exports = function(e) {
        try {
            return !!e()
        } catch (e) {
            return !0
        }
    }
}, 734641, (e, t, n) => {
    "use strict";
    t.exports = !e.r(981625)(function() {
        return 7 !== Object.defineProperty({}, 1, {
            get: function() {
                return 7
            }
        })[1]
    })
}, 418967, (e, t, n) => {
    "use strict";
    t.exports = !e.r(981625)(function() {
        var e = (function() {}).bind();
        return "function" != typeof e || e.hasOwnProperty("prototype")
    })
}, 839016, (e, t, n) => {
    "use strict";
    var r = e.r(418967),
        a = Function.prototype.call;
    t.exports = r ? a.bind(a) : function() {
        return a.apply(a, arguments)
    }
}, 140390, (e, t, n) => {
    "use strict";
    var r = {}.propertyIsEnumerable,
        a = Object.getOwnPropertyDescriptor;
    n.f = a && !r.call({
        1: 2
    }, 1) ? function(e) {
        var t = a(this, e);
        return !!t && t.enumerable
    } : r
}, 524347, (e, t, n) => {
    "use strict";
    t.exports = function(e, t) {
        return {
            enumerable: !(1 & e),
            configurable: !(2 & e),
            writable: !(4 & e),
            value: t
        }
    }
}, 588441, (e, t, n) => {
    "use strict";
    var r = e.r(418967),
        a = Function.prototype,
        i = a.call,
        o = r && a.bind.bind(i, i);
    t.exports = r ? o : function(e) {
        return function() {
            return i.apply(e, arguments)
        }
    }
}, 679711, (e, t, n) => {
    "use strict";
    var r = e.r(588441),
        a = r({}.toString),
        i = r("".slice);
    t.exports = function(e) {
        return i(a(e), 8, -1)
    }
}, 298855, (e, t, n) => {
    "use strict";
    var r = e.r(588441),
        a = e.r(981625),
        i = e.r(679711),
        o = Object,
        l = r("".split);
    t.exports = a(function() {
        return !o("z").propertyIsEnumerable(0)
    }) ? function(e) {
        return "String" === i(e) ? l(e, "") : o(e)
    } : o
}, 48943, (e, t, n) => {
    "use strict";
    t.exports = function(e) {
        return null == e
    }
}, 622720, (e, t, n) => {
    "use strict";
    var r = e.r(48943),
        a = TypeError;
    t.exports = function(e) {
        if (r(e)) throw new a("Can't call method on " + e);
        return e
    }
}, 755466, (e, t, n) => {
    "use strict";
    var r = e.r(298855),
        a = e.r(622720);
    t.exports = function(e) {
        return r(a(e))
    }
}, 340151, (e, t, n) => {
    "use strict";
    var r = "object" == typeof document && document.all;
    t.exports = void 0 === r && void 0 !== r ? function(e) {
        return "function" == typeof e || e === r
    } : function(e) {
        return "function" == typeof e
    }
}, 458875, (e, t, n) => {
    "use strict";
    var r = e.r(340151);
    t.exports = function(e) {
        return "object" == typeof e ? null !== e : r(e)
    }
}, 915639, (e, t, n) => {
    "use strict";
    var r = e.r(632853),
        a = e.r(340151);
    t.exports = function(e, t) {
        var n;
        return arguments.length < 2 ? a(n = r[e]) ? n : void 0 : r[e] && r[e][t]
    }
}, 196403, (e, t, n) => {
    "use strict";
    t.exports = e.r(588441)({}.isPrototypeOf)
}, 192599, (e, t, n) => {
    "use strict";
    var r = e.r(632853).navigator,
        a = r && r.userAgent;
    t.exports = a ? String(a) : ""
}, 732985, (e, t, n) => {
    "use strict";
    var r, a, i = e.r(632853),
        o = e.r(192599),
        l = i.process,
        s = i.Deno,
        u = l && l.versions || s && s.version,
        c = u && u.v8;
    c && (a = (r = c.split("."))[0] > 0 && r[0] < 4 ? 1 : +(r[0] + r[1])), !a && o && (!(r = o.match(/Edge\/(\d+)/)) || r[1] >= 74) && (r = o.match(/Chrome\/(\d+)/)) && (a = +r[1]), t.exports = a
}, 813927, (e, t, n) => {
    "use strict";
    var r = e.r(732985),
        a = e.r(981625),
        i = e.r(632853).String;
    t.exports = !!Object.getOwnPropertySymbols && !a(function() {
        var e = Symbol("symbol detection");
        return !i(e) || !(Object(e) instanceof Symbol) || !Symbol.sham && r && r < 41
    })
}, 820414, (e, t, n) => {
    "use strict";
    t.exports = e.r(813927) && !Symbol.sham && "symbol" == typeof Symbol.iterator
}, 543794, (e, t, n) => {
    "use strict";
    var r = e.r(915639),
        a = e.r(340151),
        i = e.r(196403),
        o = e.r(820414),
        l = Object;
    t.exports = o ? function(e) {
        return "symbol" == typeof e
    } : function(e) {
        var t = r("Symbol");
        return a(t) && i(t.prototype, l(e))
    }
}, 829640, (e, t, n) => {
    "use strict";
    var r = String;
    t.exports = function(e) {
        try {
            return r(e)
        } catch (e) {
            return "Object"
        }
    }
}, 907081, (e, t, n) => {
    "use strict";
    var r = e.r(340151),
        a = e.r(829640),
        i = TypeError;
    t.exports = function(e) {
        if (r(e)) return e;
        throw new i(a(e) + " is not a function")
    }
}, 256382, (e, t, n) => {
    "use strict";
    var r = e.r(907081),
        a = e.r(48943);
    t.exports = function(e, t) {
        var n = e[t];
        return a(n) ? void 0 : r(n)
    }
}, 587476, (e, t, n) => {
    "use strict";
    var r = e.r(839016),
        a = e.r(340151),
        i = e.r(458875),
        o = TypeError;
    t.exports = function(e, t) {
        var n, l;
        if ("string" === t && a(n = e.toString) && !i(l = r(n, e)) || a(n = e.valueOf) && !i(l = r(n, e)) || "string" !== t && a(n = e.toString) && !i(l = r(n, e))) return l;
        throw new o("Can't convert object to primitive value")
    }
}, 425948, (e, t, n) => {
    "use strict";
    t.exports = !1
}, 279402, (e, t, n) => {
    "use strict";
    var r = e.r(632853),
        a = Object.defineProperty;
    t.exports = function(e, t) {
        try {
            a(r, e, {
                value: t,
                configurable: !0,
                writable: !0
            })
        } catch (n) {
            r[e] = t
        }
        return t
    }
}, 874242, (e, t, n) => {
    "use strict";
    var r = e.r(425948),
        a = e.r(632853),
        i = e.r(279402),
        o = "__core-js_shared__",
        l = t.exports = a[o] || i(o, {});
    (l.versions || (l.versions = [])).push({
        version: "3.39.0",
        mode: r ? "pure" : "global",
        copyright: "© 2014-2024 Denis Pushkarev (zloirock.ru)",
        license: "https://github.com/zloirock/core-js/blob/v3.39.0/LICENSE",
        source: "https://github.com/zloirock/core-js"
    })
}, 146844, (e, t, n) => {
    "use strict";
    var r = e.r(874242);
    t.exports = function(e, t) {
        return r[e] || (r[e] = t || {})
    }
}, 224490, (e, t, n) => {
    "use strict";
    var r = e.r(622720),
        a = Object;
    t.exports = function(e) {
        return a(r(e))
    }
}, 346035, (e, t, n) => {
    "use strict";
    var r = e.r(588441),
        a = e.r(224490),
        i = r({}.hasOwnProperty);
    t.exports = Object.hasOwn || function(e, t) {
        return i(a(e), t)
    }
}, 369824, (e, t, n) => {
    "use strict";
    var r = e.r(588441),
        a = 0,
        i = Math.random(),
        o = r(1..toString);
    t.exports = function(e) {
        return "Symbol(" + (void 0 === e ? "" : e) + ")_" + o(++a + i, 36)
    }
}, 409467, (e, t, n) => {
    "use strict";
    var r = e.r(632853),
        a = e.r(146844),
        i = e.r(346035),
        o = e.r(369824),
        l = e.r(813927),
        s = e.r(820414),
        u = r.Symbol,
        c = a("wks"),
        d = s ? u.for || u : u && u.withoutSetter || o;
    t.exports = function(e) {
        return i(c, e) || (c[e] = l && i(u, e) ? u[e] : d("Symbol." + e)), c[e]
    }
}, 444585, (e, t, n) => {
    "use strict";
    var r = e.r(839016),
        a = e.r(458875),
        i = e.r(543794),
        o = e.r(256382),
        l = e.r(587476),
        s = e.r(409467),
        u = TypeError,
        c = s("toPrimitive");
    t.exports = function(e, t) {
        if (!a(e) || i(e)) return e;
        var n, s = o(e, c);
        if (s) {
            if (void 0 === t && (t = "default"), !a(n = r(s, e, t)) || i(n)) return n;
            throw new u("Can't convert object to primitive value")
        }
        return void 0 === t && (t = "number"), l(e, t)
    }
}, 365293, (e, t, n) => {
    "use strict";
    var r = e.r(444585),
        a = e.r(543794);
    t.exports = function(e) {
        var t = r(e, "string");
        return a(t) ? t : t + ""
    }
}, 755636, (e, t, n) => {
    "use strict";
    var r = e.r(632853),
        a = e.r(458875),
        i = r.document,
        o = a(i) && a(i.createElement);
    t.exports = function(e) {
        return o ? i.createElement(e) : {}
    }
}, 266691, (e, t, n) => {
    "use strict";
    var r = e.r(734641),
        a = e.r(981625),
        i = e.r(755636);
    t.exports = !r && !a(function() {
        return 7 !== Object.defineProperty(i("div"), "a", {
            get: function() {
                return 7
            }
        }).a
    })
}, 459147, (e, t, n) => {
    "use strict";
    var r = e.r(734641),
        a = e.r(839016),
        i = e.r(140390),
        o = e.r(524347),
        l = e.r(755466),
        s = e.r(365293),
        u = e.r(346035),
        c = e.r(266691),
        d = Object.getOwnPropertyDescriptor;
    n.f = r ? d : function(e, t) {
        if (e = l(e), t = s(t), c) try {
            return d(e, t)
        } catch (e) {}
        if (u(e, t)) return o(!a(i.f, e, t), e[t])
    }
}, 896188, (e, t, n) => {
    "use strict";
    var r = e.r(734641),
        a = e.r(981625);
    t.exports = r && a(function() {
        return 42 !== Object.defineProperty(function() {}, "prototype", {
            value: 42,
            writable: !1
        }).prototype
    })
}, 911481, (e, t, n) => {
    "use strict";
    var r = e.r(458875),
        a = String,
        i = TypeError;
    t.exports = function(e) {
        if (r(e)) return e;
        throw new i(a(e) + " is not an object")
    }
}, 490611, (e, t, n) => {
    "use strict";
    var r = e.r(734641),
        a = e.r(266691),
        i = e.r(896188),
        o = e.r(911481),
        l = e.r(365293),
        s = TypeError,
        u = Object.defineProperty,
        c = Object.getOwnPropertyDescriptor,
        d = "enumerable",
        f = "configurable",
        p = "writable";
    n.f = r ? i ? function(e, t, n) {
        if (o(e), t = l(t), o(n), "function" == typeof e && "prototype" === t && "value" in n && p in n && !n[p]) {
            var r = c(e, t);
            r && r[p] && (e[t] = n.value, n = {
                configurable: f in n ? n[f] : r[f],
                enumerable: d in n ? n[d] : r[d],
                writable: !1
            })
        }
        return u(e, t, n)
    } : u : function(e, t, n) {
        if (o(e), t = l(t), o(n), a) try {
            return u(e, t, n)
        } catch (e) {}
        if ("get" in n || "set" in n) throw new s("Accessors not supported");
        return "value" in n && (e[t] = n.value), e
    }
}, 814374, (e, t, n) => {
    "use strict";
    var r = e.r(734641),
        a = e.r(490611),
        i = e.r(524347);
    t.exports = r ? function(e, t, n) {
        return a.f(e, t, i(1, n))
    } : function(e, t, n) {
        return e[t] = n, e
    }
}, 31705, (e, t, n) => {
    "use strict";
    var r = e.r(734641),
        a = e.r(346035),
        i = Function.prototype,
        o = r && Object.getOwnPropertyDescriptor,
        l = a(i, "name"),
        s = l && (!r || r && o(i, "name").configurable);
    t.exports = {
        EXISTS: l,
        PROPER: l && "something" === (function() {}).name,
        CONFIGURABLE: s
    }
}, 470288, (e, t, n) => {
    "use strict";
    var r = e.r(588441),
        a = e.r(340151),
        i = e.r(874242),
        o = r(Function.toString);
    a(i.inspectSource) || (i.inspectSource = function(e) {
        return o(e)
    }), t.exports = i.inspectSource
}, 438211, (e, t, n) => {
    "use strict";
    var r = e.r(632853),
        a = e.r(340151),
        i = r.WeakMap;
    t.exports = a(i) && /native code/.test(String(i))
}, 83555, (e, t, n) => {
    "use strict";
    var r = e.r(146844),
        a = e.r(369824),
        i = r("keys");
    t.exports = function(e) {
        return i[e] || (i[e] = a(e))
    }
}, 47201, (e, t, n) => {
    "use strict";
    t.exports = {}
}, 626070, (e, t, n) => {
    "use strict";
    var r, a, i, o = e.r(438211),
        l = e.r(632853),
        s = e.r(458875),
        u = e.r(814374),
        c = e.r(346035),
        d = e.r(874242),
        f = e.r(83555),
        p = e.r(47201),
        h = "Object already initialized",
        m = l.TypeError,
        g = l.WeakMap;
    if (o || d.state) {
        var v = d.state || (d.state = new g);
        v.get = v.get, v.has = v.has, v.set = v.set, r = function(e, t) {
            if (v.has(e)) throw new m(h);
            return t.facade = e, v.set(e, t), t
        }, a = function(e) {
            return v.get(e) || {}
        }, i = function(e) {
            return v.has(e)
        }
    } else {
        var y = f("state");
        p[y] = !0, r = function(e, t) {
            if (c(e, y)) throw new m(h);
            return t.facade = e, u(e, y, t), t
        }, a = function(e) {
            return c(e, y) ? e[y] : {}
        }, i = function(e) {
            return c(e, y)
        }
    }
    t.exports = {
        set: r,
        get: a,
        has: i,
        enforce: function(e) {
            return i(e) ? a(e) : r(e, {})
        },
        getterFor: function(e) {
            return function(t) {
                var n;
                if (!s(t) || (n = a(t)).type !== e) throw new m("Incompatible receiver, " + e + " required");
                return n
            }
        }
    }
}, 901830, (e, t, n) => {
    "use strict";
    var r = e.r(588441),
        a = e.r(981625),
        i = e.r(340151),
        o = e.r(346035),
        l = e.r(734641),
        s = e.r(31705).CONFIGURABLE,
        u = e.r(470288),
        c = e.r(626070),
        d = c.enforce,
        f = c.get,
        p = String,
        h = Object.defineProperty,
        m = r("".slice),
        g = r("".replace),
        v = r([].join),
        y = l && !a(function() {
            return 8 !== h(function() {}, "length", {
                value: 8
            }).length
        }),
        b = String(String).split("String"),
        w = t.exports = function(e, t, n) {
            "Symbol(" === m(p(t), 0, 7) && (t = "[" + g(p(t), /^Symbol\(([^)]*)\).*$/, "$1") + "]"), n && n.getter && (t = "get " + t), n && n.setter && (t = "set " + t), (!o(e, "name") || s && e.name !== t) && (l ? h(e, "name", {
                value: t,
                configurable: !0
            }) : e.name = t), y && n && o(n, "arity") && e.length !== n.arity && h(e, "length", {
                value: n.arity
            });
            try {
                n && o(n, "constructor") && n.constructor ? l && h(e, "prototype", {
                    writable: !1
                }) : e.prototype && (e.prototype = void 0)
            } catch (e) {}
            var r = d(e);
            return o(r, "source") || (r.source = v(b, "string" == typeof t ? t : "")), e
        };
    Function.prototype.toString = w(function() {
        return i(this) && f(this).source || u(this)
    }, "toString")
}, 922103, (e, t, n) => {
    "use strict";
    var r = e.r(340151),
        a = e.r(490611),
        i = e.r(901830),
        o = e.r(279402);
    t.exports = function(e, t, n, l) {
        l || (l = {});
        var s = l.enumerable,
            u = void 0 !== l.name ? l.name : t;
        if (r(n) && i(n, u, l), l.global) s ? e[t] = n : o(t, n);
        else {
            try {
                l.unsafe ? e[t] && (s = !0) : delete e[t]
            } catch (e) {}
            s ? e[t] = n : a.f(e, t, {
                value: n,
                enumerable: !1,
                configurable: !l.nonConfigurable,
                writable: !l.nonWritable
            })
        }
        return e
    }
}, 984992, (e, t, n) => {
    "use strict";
    var r = Math.ceil,
        a = Math.floor;
    t.exports = Math.trunc || function(e) {
        var t = +e;
        return (t > 0 ? a : r)(t)
    }
}, 180452, (e, t, n) => {
    "use strict";
    var r = e.r(984992);
    t.exports = function(e) {
        var t = +e;
        return t != t || 0 === t ? 0 : r(t)
    }
}, 454190, (e, t, n) => {
    "use strict";
    var r = e.r(180452),
        a = Math.max,
        i = Math.min;
    t.exports = function(e, t) {
        var n = r(e);
        return n < 0 ? a(n + t, 0) : i(n, t)
    }
}, 661894, (e, t, n) => {
    "use strict";
    var r = e.r(180452),
        a = Math.min;
    t.exports = function(e) {
        var t = r(e);
        return t > 0 ? a(t, 0x1fffffffffffff) : 0
    }
}, 802570, (e, t, n) => {
    "use strict";
    var r = e.r(661894);
    t.exports = function(e) {
        return r(e.length)
    }
}, 735479, (e, t, n) => {
    "use strict";
    var r = e.r(755466),
        a = e.r(454190),
        i = e.r(802570),
        o = function(e) {
            return function(t, n, o) {
                var l, s = r(t),
                    u = i(s);
                if (0 === u) return !e && -1;
                var c = a(o, u);
                if (e && n != n) {
                    for (; u > c;)
                        if ((l = s[c++]) != l) return !0
                } else
                    for (; u > c; c++)
                        if ((e || c in s) && s[c] === n) return e || c || 0;
                return !e && -1
            }
        };
    t.exports = {
        includes: o(!0),
        indexOf: o(!1)
    }
}, 138907, (e, t, n) => {
    "use strict";
    var r = e.r(588441),
        a = e.r(346035),
        i = e.r(755466),
        o = e.r(735479).indexOf,
        l = e.r(47201),
        s = r([].push);
    t.exports = function(e, t) {
        var n, r = i(e),
            u = 0,
            c = [];
        for (n in r) !a(l, n) && a(r, n) && s(c, n);
        for (; t.length > u;) a(r, n = t[u++]) && (~o(c, n) || s(c, n));
        return c
    }
}, 373302, (e, t, n) => {
    "use strict";
    t.exports = ["constructor", "hasOwnProperty", "isPrototypeOf", "propertyIsEnumerable", "toLocaleString", "toString", "valueOf"]
}, 133076, (e, t, n) => {
    "use strict";
    var r = e.r(138907),
        a = e.r(373302).concat("length", "prototype");
    n.f = Object.getOwnPropertyNames || function(e) {
        return r(e, a)
    }
}, 538957, (e, t, n) => {
    "use strict";
    n.f = Object.getOwnPropertySymbols
}, 501155, (e, t, n) => {
    "use strict";
    var r = e.r(915639),
        a = e.r(588441),
        i = e.r(133076),
        o = e.r(538957),
        l = e.r(911481),
        s = a([].concat);
    t.exports = r("Reflect", "ownKeys") || function(e) {
        var t = i.f(l(e)),
            n = o.f;
        return n ? s(t, n(e)) : t
    }
}, 694019, (e, t, n) => {
    "use strict";
    var r = e.r(346035),
        a = e.r(501155),
        i = e.r(459147),
        o = e.r(490611);
    t.exports = function(e, t, n) {
        for (var l = a(t), s = o.f, u = i.f, c = 0; c < l.length; c++) {
            var d = l[c];
            r(e, d) || n && r(n, d) || s(e, d, u(t, d))
        }
    }
}, 807706, (e, t, n) => {
    "use strict";
    var r = e.r(981625),
        a = e.r(340151),
        i = /#|\.prototype\./,
        o = function(e, t) {
            var n = s[l(e)];
            return n === c || n !== u && (a(t) ? r(t) : !!t)
        },
        l = o.normalize = function(e) {
            return String(e).replace(i, ".").toLowerCase()
        },
        s = o.data = {},
        u = o.NATIVE = "N",
        c = o.POLYFILL = "P";
    t.exports = o
}, 995822, (e, t, n) => {
    "use strict";
    var r = e.r(632853),
        a = e.r(459147).f,
        i = e.r(814374),
        o = e.r(922103),
        l = e.r(279402),
        s = e.r(694019),
        u = e.r(807706);
    t.exports = function(e, t) {
        var n, c, d, f, p, h = e.target,
            m = e.global,
            g = e.stat;
        if (n = m ? r : g ? r[h] || l(h, {}) : r[h] && r[h].prototype)
            for (c in t) {
                if (f = t[c], d = e.dontCallGetSet ? (p = a(n, c)) && p.value : n[c], !u(m ? c : h + (g ? "." : "#") + c, e.forced) && void 0 !== d) {
                    if (typeof f == typeof d) continue;
                    s(f, d)
                }(e.sham || d && d.sham) && i(f, "sham", !0), o(n, c, f, e)
            }
    }
}, 581356, (e, t, n) => {
    "use strict";
    var r = e.r(802570);
    t.exports = function(e, t) {
        for (var n = r(e), a = new t(n), i = 0; i < n; i++) a[i] = e[n - i - 1];
        return a
    }
}, 185918, (e, t, n) => {
    "use strict";
    var r = e.r(138907),
        a = e.r(373302);
    t.exports = Object.keys || function(e) {
        return r(e, a)
    }
}, 434031, (e, t, n) => {
    "use strict";
    var r = e.r(734641),
        a = e.r(896188),
        i = e.r(490611),
        o = e.r(911481),
        l = e.r(755466),
        s = e.r(185918);
    n.f = r && !a ? Object.defineProperties : function(e, t) {
        o(e);
        for (var n, r = l(t), a = s(t), u = a.length, c = 0; u > c;) i.f(e, n = a[c++], r[n]);
        return e
    }
}, 190808, (e, t, n) => {
    "use strict";
    t.exports = e.r(915639)("document", "documentElement")
}, 361413, (e, t, n) => {
    "use strict";
    var r, a = e.r(911481),
        i = e.r(434031),
        o = e.r(373302),
        l = e.r(47201),
        s = e.r(190808),
        u = e.r(755636),
        c = e.r(83555),
        d = "prototype",
        f = "script",
        p = c("IE_PROTO"),
        h = function() {},
        m = function(e) {
            return "<" + f + ">" + e + "</" + f + ">"
        },
        g = function(e) {
            e.write(m("")), e.close();
            var t = e.parentWindow.Object;
            return e = null, t
        },
        v = function() {
            var e, t = u("iframe");
            return t.style.display = "none", s.appendChild(t), t.src = String("java" + f + ":"), (e = t.contentWindow.document).open(), e.write(m("document.F=Object")), e.close(), e.F
        },
        y = function() {
            try {
                r = new ActiveXObject("htmlfile")
            } catch (e) {}
            y = "u" > typeof document ? document.domain && r ? g(r) : v() : g(r);
            for (var e = o.length; e--;) delete y[d][o[e]];
            return y()
        };
    l[p] = !0, t.exports = Object.create || function(e, t) {
        var n;
        return null !== e ? (h[d] = a(e), n = new h, h[d] = null, n[p] = e) : n = y(), void 0 === t ? n : i.f(n, t)
    }
}, 447336, (e, t, n) => {
    "use strict";
    var r = e.r(409467),
        a = e.r(361413),
        i = e.r(490611).f,
        o = r("unscopables"),
        l = Array.prototype;
    void 0 === l[o] && i(l, o, {
        configurable: !0,
        value: a(null)
    }), t.exports = function(e) {
        l[o][e] = !0
    }
}, 64579, (e, t, n) => {
    "use strict";
    var r = e.r(995822),
        a = e.r(581356),
        i = e.r(755466),
        o = e.r(447336),
        l = Array;
    r({
        target: "Array",
        proto: !0
    }, {
        toReversed: function() {
            return a(i(this), l)
        }
    }), o("toReversed")
}, 902205, (e, t, n) => {
    "use strict";
    var r = e.r(632853),
        a = e.r(588441);
    t.exports = function(e, t) {
        return a(r[e].prototype[t])
    }
}, 486437, (e, t, n) => {
    "use strict";
    e.r(64579), t.exports = e.r(902205)("Array", "toReversed")
}, 636603, (e, t, n) => {
    "use strict";
    t.exports = e.r(486437)
}, 551212, (e, t, n) => {
    "use strict";
    e.r(64579)
}, 769579, (e, t, n) => {
    "use strict";
    var r = e.r(636603);
    e.r(551212), t.exports = r
}, 282906, (e, t, n) => {
    "use strict";
    var r = e.r(829640),
        a = TypeError;
    t.exports = function(e, t) {
        if (!delete e[t]) throw new a("Cannot delete property " + r(t) + " of " + r(e))
    }
}, 937161, (e, t, n) => {
    "use strict";
    var r = e.r(409467)("toStringTag"),
        a = {};
    a[r] = "z", t.exports = "[object z]" === String(a)
}, 534051, (e, t, n) => {
    "use strict";
    var r = e.r(937161),
        a = e.r(340151),
        i = e.r(679711),
        o = e.r(409467)("toStringTag"),
        l = Object,
        s = "Arguments" === i(function() {
            return arguments
        }()),
        u = function(e, t) {
            try {
                return e[t]
            } catch (e) {}
        };
    t.exports = r ? i : function(e) {
        var t, n, r;
        return void 0 === e ? "Undefined" : null === e ? "Null" : "string" == typeof(n = u(t = l(e), o)) ? n : s ? i(t) : "Object" === (r = i(t)) && a(t.callee) ? "Arguments" : r
    }
}, 915055, (e, t, n) => {
    "use strict";
    var r = e.r(534051),
        a = String;
    t.exports = function(e) {
        if ("Symbol" === r(e)) throw TypeError("Cannot convert a Symbol value to a string");
        return a(e)
    }
}, 737846, (e, t, n) => {
    "use strict";
    t.exports = e.r(588441)([].slice)
}, 427544, (e, t, n) => {
    "use strict";
    var r = e.r(737846),
        a = Math.floor,
        i = function(e, t) {
            var n = e.length;
            if (n < 8)
                for (var o, l, s = 1; s < n;) {
                    for (l = s, o = e[s]; l && t(e[l - 1], o) > 0;) e[l] = e[--l];
                    l !== s++ && (e[l] = o)
                } else
                    for (var u = a(n / 2), c = i(r(e, 0, u), t), d = i(r(e, u), t), f = c.length, p = d.length, h = 0, m = 0; h < f || m < p;) e[h + m] = h < f && m < p ? 0 >= t(c[h], d[m]) ? c[h++] : d[m++] : h < f ? c[h++] : d[m++];
            return e
        };
    t.exports = i
}, 917100, (e, t, n) => {
    "use strict";
    var r = e.r(981625);
    t.exports = function(e, t) {
        var n = [][e];
        return !!n && r(function() {
            n.call(null, t || function() {
                return 1
            }, 1)
        })
    }
}, 206817, (e, t, n) => {
    "use strict";
    var r = e.r(192599).match(/firefox\/(\d+)/i);
    t.exports = !!r && +r[1]
}, 748005, (e, t, n) => {
    "use strict";
    var r = e.r(192599);
    t.exports = /MSIE|Trident/.test(r)
}, 842339, (e, t, n) => {
    "use strict";
    var r = e.r(192599).match(/AppleWebKit\/(\d+)\./);
    t.exports = !!r && +r[1]
}, 244992, (e, t, n) => {
    "use strict";
    var r = e.r(995822),
        a = e.r(588441),
        i = e.r(907081),
        o = e.r(224490),
        l = e.r(802570),
        s = e.r(282906),
        u = e.r(915055),
        c = e.r(981625),
        d = e.r(427544),
        f = e.r(917100),
        p = e.r(206817),
        h = e.r(748005),
        m = e.r(732985),
        g = e.r(842339),
        v = [],
        y = a(v.sort),
        b = a(v.push),
        w = c(function() {
            v.sort(void 0)
        }),
        _ = c(function() {
            v.sort(null)
        }),
        S = f("sort"),
        k = !c(function() {
            if (m) return m < 70;
            if (!p || !(p > 3)) {
                if (h) return !0;
                if (g) return g < 603;
                var e, t, n, r, a = "";
                for (e = 65; e < 76; e++) {
                    switch (t = String.fromCharCode(e), e) {
                        case 66:
                        case 69:
                        case 70:
                        case 72:
                            n = 3;
                            break;
                        case 68:
                        case 71:
                            n = 4;
                            break;
                        default:
                            n = 2
                    }
                    for (r = 0; r < 47; r++) v.push({
                        k: t + r,
                        v: n
                    })
                }
                for (v.sort(function(e, t) {
                        return t.v - e.v
                    }), r = 0; r < v.length; r++) t = v[r].k.charAt(0), a.charAt(a.length - 1) !== t && (a += t);
                return "DGBEFHACIJK" !== a
            }
        });
    r({
        target: "Array",
        proto: !0,
        forced: w || !_ || !S || !k
    }, {
        sort: function(e) {
            void 0 !== e && i(e);
            var t, n, r = o(this);
            if (k) return void 0 === e ? y(r) : y(r, e);
            var a = [],
                c = l(r);
            for (n = 0; n < c; n++) n in r && b(a, r[n]);
            for (d(a, function(t, n) {
                    return void 0 === n ? -1 : void 0 === t ? 1 : void 0 !== e ? +e(t, n) || 0 : u(t) > u(n) ? 1 : -1
                }), t = l(a), n = 0; n < t;) r[n] = a[n++];
            for (; n < c;) s(r, n++);
            return r
        }
    })
}, 190575, (e, t, n) => {
    "use strict";
    var r = e.r(802570);
    t.exports = function(e, t, n) {
        for (var a = 0, i = arguments.length > 2 ? n : r(t), o = new e(i); i > a;) o[a] = t[a++];
        return o
    }
}, 223231, (e, t, n) => {
    "use strict";
    var r = e.r(632853);
    t.exports = function(e, t) {
        var n = r[e],
            a = n && n.prototype;
        return a && a[t]
    }
}, 229213, (e, t, n) => {
    "use strict";
    var r = e.r(995822),
        a = e.r(588441),
        i = e.r(907081),
        o = e.r(755466),
        l = e.r(190575),
        s = e.r(223231),
        u = e.r(447336),
        c = Array,
        d = a(s("Array", "sort"));
    r({
        target: "Array",
        proto: !0
    }, {
        toSorted: function(e) {
            return void 0 !== e && i(e), d(l(c, o(this)), e)
        }
    }), u("toSorted")
}, 243533, (e, t, n) => {
    "use strict";
    e.r(244992), e.r(229213), t.exports = e.r(902205)("Array", "toSorted")
}, 449350, (e, t, n) => {
    "use strict";
    t.exports = e.r(243533)
}, 184543, (e, t, n) => {
    "use strict";
    e.r(229213)
}, 823130, (e, t, n) => {
    "use strict";
    var r = e.r(449350);
    e.r(184543), t.exports = r
}, 91041, (e, t, n) => {
    "use strict";
    var r = e.r(915055);
    t.exports = function(e, t) {
        return void 0 === e ? arguments.length < 2 ? "" : t : r(e)
    }
}, 961986, (e, t, n) => {
    "use strict";
    var r = e.r(734641),
        a = e.r(981625),
        i = e.r(911481),
        o = e.r(91041),
        l = Error.prototype.toString;
    t.exports = a(function() {
        if (r) {
            var e = Object.create(Object.defineProperty({}, "name", {
                get: function() {
                    return this === e
                }
            }));
            if ("true" !== l.call(e)) return !0
        }
        return "2: 1" !== l.call({
            message: 1,
            name: 2
        }) || "Error" !== l.call({})
    }) ? function() {
        var e = i(this),
            t = o(e.name, "Error"),
            n = o(e.message);
        return t ? n ? t + ": " + n : t : n
    } : l
}, 112730, (e, t, n) => {
    "use strict";
    var r = e.r(922103),
        a = e.r(961986),
        i = Error.prototype;
    i.toString !== a && r(i, "toString", a)
}, 247773, (e, t, n) => {
    "use strict";
    t.exports = {}
}, 890902, (e, t, n) => {
    "use strict";
    t.exports = !e.r(981625)(function() {
        function e() {}
        return e.prototype.constructor = null, Object.getPrototypeOf(new e) !== e.prototype
    })
}, 448458, (e, t, n) => {
    "use strict";
    var r = e.r(346035),
        a = e.r(340151),
        i = e.r(224490),
        o = e.r(83555),
        l = e.r(890902),
        s = o("IE_PROTO"),
        u = Object,
        c = u.prototype;
    t.exports = l ? u.getPrototypeOf : function(e) {
        var t = i(e);
        if (r(t, s)) return t[s];
        var n = t.constructor;
        return a(n) && t instanceof n ? n.prototype : t instanceof u ? c : null
    }
}, 234746, (e, t, n) => {
    "use strict";
    var r, a, i, o = e.r(981625),
        l = e.r(340151),
        s = e.r(458875),
        u = e.r(361413),
        c = e.r(448458),
        d = e.r(922103),
        f = e.r(409467),
        p = e.r(425948),
        h = f("iterator"),
        m = !1;
    [].keys && ("next" in (i = [].keys()) ? (a = c(c(i))) !== Object.prototype && (r = a) : m = !0), !s(r) || o(function() {
        var e = {};
        return r[h].call(e) !== e
    }) ? r = {} : p && (r = u(r)), l(r[h]) || d(r, h, function() {
        return this
    }), t.exports = {
        IteratorPrototype: r,
        BUGGY_SAFARI_ITERATORS: m
    }
}, 968731, (e, t, n) => {
    "use strict";
    var r = e.r(490611).f,
        a = e.r(346035),
        i = e.r(409467)("toStringTag");
    t.exports = function(e, t, n) {
        e && !n && (e = e.prototype), e && !a(e, i) && r(e, i, {
            configurable: !0,
            value: t
        })
    }
}, 549913, (e, t, n) => {
    "use strict";
    var r = e.r(234746).IteratorPrototype,
        a = e.r(361413),
        i = e.r(524347),
        o = e.r(968731),
        l = e.r(247773),
        s = function() {
            return this
        };
    t.exports = function(e, t, n, u) {
        var c = t + " Iterator";
        return e.prototype = a(r, {
            next: i(+!u, n)
        }), o(e, c, !1, !0), l[c] = s, e
    }
}, 847510, (e, t, n) => {
    "use strict";
    var r = e.r(588441),
        a = e.r(907081);
    t.exports = function(e, t, n) {
        try {
            return r(a(Object.getOwnPropertyDescriptor(e, t)[n]))
        } catch (e) {}
    }
}, 177982, (e, t, n) => {
    "use strict";
    var r = e.r(458875);
    t.exports = function(e) {
        return r(e) || null === e
    }
}, 802415, (e, t, n) => {
    "use strict";
    var r = e.r(177982),
        a = String,
        i = TypeError;
    t.exports = function(e) {
        if (r(e)) return e;
        throw new i("Can't set " + a(e) + " as a prototype")
    }
}, 575033, (e, t, n) => {
    "use strict";
    var r = e.r(847510),
        a = e.r(458875),
        i = e.r(622720),
        o = e.r(802415);
    t.exports = Object.setPrototypeOf || ("__proto__" in {} ? function() {
        var e, t = !1,
            n = {};
        try {
            (e = r(Object.prototype, "__proto__", "set"))(n, []), t = n instanceof Array
        } catch (e) {}
        return function(n, r) {
            return i(n), o(r), a(n) && (t ? e(n, r) : n.__proto__ = r), n
        }
    }() : void 0)
}, 360429, (e, t, n) => {
    "use strict";
    var r = e.r(995822),
        a = e.r(839016),
        i = e.r(425948),
        o = e.r(31705),
        l = e.r(340151),
        s = e.r(549913),
        u = e.r(448458),
        c = e.r(575033),
        d = e.r(968731),
        f = e.r(814374),
        p = e.r(922103),
        h = e.r(409467),
        m = e.r(247773),
        g = e.r(234746),
        v = o.PROPER,
        y = o.CONFIGURABLE,
        b = g.IteratorPrototype,
        w = g.BUGGY_SAFARI_ITERATORS,
        _ = h("iterator"),
        S = "keys",
        k = "values",
        x = "entries",
        E = function() {
            return this
        };
    t.exports = function(e, t, n, o, h, g, T) {
        s(n, t, o);
        var N, C, O, R = function(e) {
                if (e === h && D) return D;
                if (!w && e && e in A) return A[e];
                switch (e) {
                    case S:
                    case k:
                    case x:
                        return function() {
                            return new n(this, e)
                        }
                }
                return function() {
                    return new n(this)
                }
            },
            P = t + " Iterator",
            I = !1,
            A = e.prototype,
            L = A[_] || A["@@iterator"] || h && A[h],
            D = !w && L || R(h),
            M = "Array" === t && A.entries || L;
        if (M && (N = u(M.call(new e))) !== Object.prototype && N.next && (!i && u(N) !== b && (c ? c(N, b) : l(N[_]) || p(N, _, E)), d(N, P, !0, !0), i && (m[P] = E)), v && h === k && L && L.name !== k && (!i && y ? f(A, "name", k) : (I = !0, D = function() {
                return a(L, this)
            })), h)
            if (C = {
                    values: R(k),
                    keys: g ? D : R(S),
                    entries: R(x)
                }, T)
                for (O in C) !w && !I && O in A || p(A, O, C[O]);
            else r({
                target: t,
                proto: !0,
                forced: w || I
            }, C);
        return (!i || T) && A[_] !== D && p(A, _, D, {
            name: h
        }), m[t] = D, C
    }
}, 44142, (e, t, n) => {
    "use strict";
    t.exports = function(e, t) {
        return {
            value: e,
            done: t
        }
    }
}, 184237, (e, t, n) => {
    "use strict";
    var r = e.r(755466),
        a = e.r(447336),
        i = e.r(247773),
        o = e.r(626070),
        l = e.r(490611).f,
        s = e.r(360429),
        u = e.r(44142),
        c = e.r(425948),
        d = e.r(734641),
        f = "Array Iterator",
        p = o.set,
        h = o.getterFor(f);
    t.exports = s(Array, "Array", function(e, t) {
        p(this, {
            type: f,
            target: r(e),
            index: 0,
            kind: t
        })
    }, function() {
        var e = h(this),
            t = e.target,
            n = e.index++;
        if (!t || n >= t.length) return e.target = null, u(void 0, !0);
        switch (e.kind) {
            case "keys":
                return u(n, !1);
            case "values":
                return u(t[n], !1)
        }
        return u([n, t[n]], !1)
    }, "values");
    var m = i.Arguments = i.Array;
    if (a("keys"), a("values"), a("entries"), !c && d && "values" !== m.name) try {
        l(m, "name", {
            value: "values"
        })
    } catch (e) {}
}, 249229, (e, t, n) => {
    "use strict";
    var r = e.r(995822),
        a = e.r(224490),
        i = e.r(185918);
    r({
        target: "Object",
        stat: !0,
        forced: e.r(981625)(function() {
            i(1)
        })
    }, {
        keys: function(e) {
            return i(a(e))
        }
    })
}, 612551, (e, t, n) => {
    "use strict";
    var r = e.r(937161),
        a = e.r(534051);
    t.exports = r ? ({}).toString : function() {
        return "[object " + a(this) + "]"
    }
}, 882282, (e, t, n) => {
    "use strict";
    var r = e.r(937161),
        a = e.r(922103),
        i = e.r(612551);
    r || a(Object.prototype, "toString", i, {
        unsafe: !0
    })
}, 635881, (e, t, n) => {
    "use strict";
    var r = e.r(679711),
        a = e.r(755466),
        i = e.r(133076).f,
        o = e.r(737846),
        l = "object" == typeof window && window && Object.getOwnPropertyNames ? Object.getOwnPropertyNames(window) : [],
        s = function(e) {
            try {
                return i(e)
            } catch (e) {
                return o(l)
            }
        };
    t.exports.f = function(e) {
        return l && "Window" === r(e) ? s(e) : i(a(e))
    }
}, 137111, (e, t, n) => {
    "use strict";
    t.exports = e.r(981625)(function() {
        if ("function" == typeof ArrayBuffer) {
            var e = new ArrayBuffer(8);
            Object.isExtensible(e) && Object.defineProperty(e, "a", {
                value: 8
            })
        }
    })
}, 45515, (e, t, n) => {
    "use strict";
    var r = e.r(981625),
        a = e.r(458875),
        i = e.r(679711),
        o = e.r(137111),
        l = Object.isExtensible;
    t.exports = r(function() {
        l(1)
    }) || o ? function(e) {
        return !!a(e) && (!o || "ArrayBuffer" !== i(e)) && (!l || l(e))
    } : l
}, 759194, (e, t, n) => {
    "use strict";
    t.exports = !e.r(981625)(function() {
        return Object.isExtensible(Object.preventExtensions({}))
    })
}, 765203, (e, t, n) => {
    "use strict";
    var r = e.r(995822),
        a = e.r(588441),
        i = e.r(47201),
        o = e.r(458875),
        l = e.r(346035),
        s = e.r(490611).f,
        u = e.r(133076),
        c = e.r(635881),
        d = e.r(45515),
        f = e.r(369824),
        p = e.r(759194),
        h = !1,
        m = f("meta"),
        g = 0,
        v = function(e) {
            s(e, m, {
                value: {
                    objectID: "O" + g++,
                    weakData: {}
                }
            })
        },
        y = t.exports = {
            enable: function() {
                y.enable = function() {}, h = !0;
                var e = u.f,
                    t = a([].splice),
                    n = {};
                n[m] = 1, e(n).length && (u.f = function(n) {
                    for (var r = e(n), a = 0, i = r.length; a < i; a++)
                        if (r[a] === m) {
                            t(r, a, 1);
                            break
                        } return r
                }, r({
                    target: "Object",
                    stat: !0,
                    forced: !0
                }, {
                    getOwnPropertyNames: c.f
                }))
            },
            fastKey: function(e, t) {
                if (!o(e)) return "symbol" == typeof e ? e : ("string" == typeof e ? "S" : "P") + e;
                if (!l(e, m)) {
                    if (!d(e)) return "F";
                    if (!t) return "E";
                    v(e)
                }
                return e[m].objectID
            },
            getWeakData: function(e, t) {
                if (!l(e, m)) {
                    if (!d(e)) return !0;
                    if (!t) return !1;
                    v(e)
                }
                return e[m].weakData
            },
            onFreeze: function(e) {
                return p && h && d(e) && !l(e, m) && v(e), e
            }
        };
    i[m] = !0
}, 463868, (e, t, n) => {
    "use strict";
    var r = e.r(679711),
        a = e.r(588441);
    t.exports = function(e) {
        if ("Function" === r(e)) return a(e)
    }
}, 273167, (e, t, n) => {
    "use strict";
    var r = e.r(463868),
        a = e.r(907081),
        i = e.r(418967),
        o = r(r.bind);
    t.exports = function(e, t) {
        return a(e), void 0 === t ? e : i ? o(e, t) : function() {
            return e.apply(t, arguments)
        }
    }
}, 52123, (e, t, n) => {
    "use strict";
    var r = e.r(409467),
        a = e.r(247773),
        i = r("iterator"),
        o = Array.prototype;
    t.exports = function(e) {
        return void 0 !== e && (a.Array === e || o[i] === e)
    }
}, 479867, (e, t, n) => {
    "use strict";
    var r = e.r(534051),
        a = e.r(256382),
        i = e.r(48943),
        o = e.r(247773),
        l = e.r(409467)("iterator");
    t.exports = function(e) {
        if (!i(e)) return a(e, l) || a(e, "@@iterator") || o[r(e)]
    }
}, 727612, (e, t, n) => {
    "use strict";
    var r = e.r(839016),
        a = e.r(907081),
        i = e.r(911481),
        o = e.r(829640),
        l = e.r(479867),
        s = TypeError;
    t.exports = function(e, t) {
        var n = arguments.length < 2 ? l(e) : t;
        if (a(n)) return i(r(n, e));
        throw new s(o(e) + " is not iterable")
    }
}, 985744, (e, t, n) => {
    "use strict";
    var r = e.r(839016),
        a = e.r(911481),
        i = e.r(256382);
    t.exports = function(e, t, n) {
        var o, l;
        a(e);
        try {
            if (!(o = i(e, "return"))) {
                if ("throw" === t) throw n;
                return n
            }
            o = r(o, e)
        } catch (e) {
            l = !0, o = e
        }
        if ("throw" === t) throw n;
        if (l) throw o;
        return a(o), n
    }
}, 310173, (e, t, n) => {
    "use strict";
    var r = e.r(273167),
        a = e.r(839016),
        i = e.r(911481),
        o = e.r(829640),
        l = e.r(52123),
        s = e.r(802570),
        u = e.r(196403),
        c = e.r(727612),
        d = e.r(479867),
        f = e.r(985744),
        p = TypeError,
        h = function(e, t) {
            this.stopped = e, this.result = t
        },
        m = h.prototype;
    t.exports = function(e, t, n) {
        var g, v, y, b, w, _, S, k = n && n.that,
            x = !!(n && n.AS_ENTRIES),
            E = !!(n && n.IS_RECORD),
            T = !!(n && n.IS_ITERATOR),
            N = !!(n && n.INTERRUPTED),
            C = r(t, k),
            O = function(e) {
                return g && f(g, "normal", e), new h(!0, e)
            },
            R = function(e) {
                return x ? (i(e), N ? C(e[0], e[1], O) : C(e[0], e[1])) : N ? C(e, O) : C(e)
            };
        if (E) g = e.iterator;
        else if (T) g = e;
        else {
            if (!(v = d(e))) throw new p(o(e) + " is not iterable");
            if (l(v)) {
                for (y = 0, b = s(e); b > y; y++)
                    if ((w = R(e[y])) && u(m, w)) return w;
                return new h(!1)
            }
            g = c(e, v)
        }
        for (_ = E ? e.next : g.next; !(S = a(_, g)).done;) {
            try {
                w = R(S.value)
            } catch (e) {
                f(g, "throw", e)
            }
            if ("object" == typeof w && w && u(m, w)) return w
        }
        return new h(!1)
    }
}, 428111, (e, t, n) => {
    "use strict";
    var r = e.r(196403),
        a = TypeError;
    t.exports = function(e, t) {
        if (r(t, e)) return e;
        throw new a("Incorrect invocation")
    }
}, 450984, (e, t, n) => {
    "use strict";
    var r = e.r(409467)("iterator"),
        a = !1;
    try {
        var i = 0,
            o = {
                next: function() {
                    return {
                        done: !!i++
                    }
                },
                return: function() {
                    a = !0
                }
            };
        o[r] = function() {
            return this
        }, Array.from(o, function() {
            throw 2
        })
    } catch (e) {}
    t.exports = function(e, t) {
        try {
            if (!t && !a) return !1
        } catch (e) {
            return !1
        }
        var n = !1;
        try {
            var i = {};
            i[r] = function() {
                return {
                    next: function() {
                        return {
                            done: n = !0
                        }
                    }
                }
            }, e(i)
        } catch (e) {}
        return n
    }
}, 375612, (e, t, n) => {
    "use strict";
    var r = e.r(340151),
        a = e.r(458875),
        i = e.r(575033);
    t.exports = function(e, t, n) {
        var o, l;
        return i && r(o = t.constructor) && o !== n && a(l = o.prototype) && l !== n.prototype && i(e, l), e
    }
}, 651578, (e, t, n) => {
    "use strict";
    var r = e.r(995822),
        a = e.r(632853),
        i = e.r(588441),
        o = e.r(807706),
        l = e.r(922103),
        s = e.r(765203),
        u = e.r(310173),
        c = e.r(428111),
        d = e.r(340151),
        f = e.r(48943),
        p = e.r(458875),
        h = e.r(981625),
        m = e.r(450984),
        g = e.r(968731),
        v = e.r(375612);
    t.exports = function(e, t, n) {
        var y = -1 !== e.indexOf("Map"),
            b = -1 !== e.indexOf("Weak"),
            w = y ? "set" : "add",
            _ = a[e],
            S = _ && _.prototype,
            k = _,
            x = {},
            E = function(e) {
                var t = i(S[e]);
                l(S, e, "add" === e ? function(e) {
                    return t(this, 0 === e ? 0 : e), this
                } : "delete" === e ? function(e) {
                    return (!b || !!p(e)) && t(this, 0 === e ? 0 : e)
                } : "get" === e ? function(e) {
                    return b && !p(e) ? void 0 : t(this, 0 === e ? 0 : e)
                } : "has" === e ? function(e) {
                    return (!b || !!p(e)) && t(this, 0 === e ? 0 : e)
                } : function(e, n) {
                    return t(this, 0 === e ? 0 : e, n), this
                })
            };
        if (o(e, !d(_) || !(b || S.forEach && !h(function() {
                new _().entries().next()
            })))) k = n.getConstructor(t, e, y, w), s.enable();
        else if (o(e, !0)) {
            var T = new k,
                N = T[w](b ? {} : -0, 1) !== T,
                C = h(function() {
                    T.has(1)
                }),
                O = m(function(e) {
                    new _(e)
                }),
                R = !b && h(function() {
                    for (var e = new _, t = 5; t--;) e[w](t, t);
                    return !e.has(-0)
                });
            O || ((k = t(function(e, t) {
                c(e, S);
                var n = v(new _, e, k);
                return f(t) || u(t, n[w], {
                    that: n,
                    AS_ENTRIES: y
                }), n
            })).prototype = S, S.constructor = k), (C || R) && (E("delete"), E("has"), y && E("get")), (R || N) && E(w), b && S.clear && delete S.clear
        }
        return x[e] = k, r({
            global: !0,
            constructor: !0,
            forced: k !== _
        }, x), g(k, e), b || n.setStrong(k, e, y), k
    }
}, 939226, (e, t, n) => {
    "use strict";
    var r = e.r(901830),
        a = e.r(490611);
    t.exports = function(e, t, n) {
        return n.get && r(n.get, t, {
            getter: !0
        }), n.set && r(n.set, t, {
            setter: !0
        }), a.f(e, t, n)
    }
}, 565429, (e, t, n) => {
    "use strict";
    var r = e.r(922103);
    t.exports = function(e, t, n) {
        for (var a in t) r(e, a, t[a], n);
        return e
    }
}, 793687, (e, t, n) => {
    "use strict";
    var r = e.r(915639),
        a = e.r(939226),
        i = e.r(409467),
        o = e.r(734641),
        l = i("species");
    t.exports = function(e) {
        var t = r(e);
        o && t && !t[l] && a(t, l, {
            configurable: !0,
            get: function() {
                return this
            }
        })
    }
}, 105323, (e, t, n) => {
    "use strict";
    var r = e.r(361413),
        a = e.r(939226),
        i = e.r(565429),
        o = e.r(273167),
        l = e.r(428111),
        s = e.r(48943),
        u = e.r(310173),
        c = e.r(360429),
        d = e.r(44142),
        f = e.r(793687),
        p = e.r(734641),
        h = e.r(765203).fastKey,
        m = e.r(626070),
        g = m.set,
        v = m.getterFor;
    t.exports = {
        getConstructor: function(e, t, n, c) {
            var d = e(function(e, a) {
                    l(e, f), g(e, {
                        type: t,
                        index: r(null),
                        first: null,
                        last: null,
                        size: 0
                    }), p || (e.size = 0), s(a) || u(a, e[c], {
                        that: e,
                        AS_ENTRIES: n
                    })
                }),
                f = d.prototype,
                m = v(t),
                y = function(e, t, n) {
                    var r, a, i = m(e),
                        o = b(e, t);
                    return o ? o.value = n : (i.last = o = {
                        index: a = h(t, !0),
                        key: t,
                        value: n,
                        previous: r = i.last,
                        next: null,
                        removed: !1
                    }, i.first || (i.first = o), r && (r.next = o), p ? i.size++ : e.size++, "F" !== a && (i.index[a] = o)), e
                },
                b = function(e, t) {
                    var n, r = m(e),
                        a = h(t);
                    if ("F" !== a) return r.index[a];
                    for (n = r.first; n; n = n.next)
                        if (n.key === t) return n
                };
            return i(f, {
                clear: function() {
                    for (var e = m(this), t = e.first; t;) t.removed = !0, t.previous && (t.previous = t.previous.next = null), t = t.next;
                    e.first = e.last = null, e.index = r(null), p ? e.size = 0 : this.size = 0
                },
                delete: function(e) {
                    var t = m(this),
                        n = b(this, e);
                    if (n) {
                        var r = n.next,
                            a = n.previous;
                        delete t.index[n.index], n.removed = !0, a && (a.next = r), r && (r.previous = a), t.first === n && (t.first = r), t.last === n && (t.last = a), p ? t.size-- : this.size--
                    }
                    return !!n
                },
                forEach: function(e) {
                    for (var t, n = m(this), r = o(e, arguments.length > 1 ? arguments[1] : void 0); t = t ? t.next : n.first;)
                        for (r(t.value, t.key, this); t && t.removed;) t = t.previous
                },
                has: function(e) {
                    return !!b(this, e)
                }
            }), i(f, n ? {
                get: function(e) {
                    var t = b(this, e);
                    return t && t.value
                },
                set: function(e, t) {
                    return y(this, 0 === e ? 0 : e, t)
                }
            } : {
                add: function(e) {
                    return y(this, e = 0 === e ? 0 : e, e)
                }
            }), p && a(f, "size", {
                configurable: !0,
                get: function() {
                    return m(this).size
                }
            }), d
        },
        setStrong: function(e, t, n) {
            var r = t + " Iterator",
                a = v(t),
                i = v(r);
            c(e, t, function(e, t) {
                g(this, {
                    type: r,
                    target: e,
                    state: a(e),
                    kind: t,
                    last: null
                })
            }, function() {
                for (var e = i(this), t = e.kind, n = e.last; n && n.removed;) n = n.previous;
                return e.target && (e.last = n = n ? n.next : e.state.first) ? "keys" === t ? d(n.key, !1) : "values" === t ? d(n.value, !1) : d([n.key, n.value], !1) : (e.target = null, d(void 0, !0))
            }, n ? "entries" : "values", !n, !0), f(t)
        }
    }
}, 767783, (e, t, n) => {
    "use strict";
    e.r(651578)("Map", function(e) {
        return function() {
            return e(this, arguments.length ? arguments[0] : void 0)
        }
    }, e.r(105323))
}, 39806, (e, t, n) => {
    "use strict";
    e.r(767783)
}, 610025, (e, t, n) => {
    "use strict";
    e.r(651578)("Set", function(e) {
        return function() {
            return e(this, arguments.length ? arguments[0] : void 0)
        }
    }, e.r(105323))
}, 581369, (e, t, n) => {
    "use strict";
    e.r(610025)
}, 546939, (e, t, n) => {
    "use strict";
    var r = e.r(632853),
        a = e.r(192599),
        i = e.r(679711),
        o = function(e) {
            return a.slice(0, e.length) === e
        };
    t.exports = o("Bun/") ? "BUN" : o("Cloudflare-Workers") ? "CLOUDFLARE" : o("Deno/") ? "DENO" : o("Node.js/") ? "NODE" : r.Bun && "string" == typeof Bun.version ? "BUN" : r.Deno && "object" == typeof Deno.version ? "DENO" : "process" === i(r.process) ? "NODE" : r.window && r.document ? "BROWSER" : "REST"
}, 270233, (e, t, n) => {
    "use strict";
    t.exports = "NODE" === e.r(546939)
}, 197418, (e, t, n) => {
    "use strict";
    var r = e.r(632853),
        a = e.r(270233);
    t.exports = function(e) {
        if (a) {
            try {
                return r.process.getBuiltinModule(e)
            } catch (e) {}
            try {
                return Function('return require("' + e + '")')()
            } catch (e) {}
        }
    }
}, 592699, (e, t, n) => {
    "use strict";
    t.exports = {
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
    }
}, 587978, (e, t, n) => {
    "use strict";
    var r = e.r(588441),
        a = Error,
        i = r("".replace),
        o = String(new a("zxcasd").stack),
        l = /\n\s*at [^:]*:[^\n]*/,
        s = l.test(o);
    t.exports = function(e, t) {
        if (s && "string" == typeof e && !a.prepareStackTrace)
            for (; t--;) e = i(e, l, "");
        return e
    }
}, 297902, (e, t, n) => {
    "use strict";
    var r = e.r(995822),
        a = e.r(915639),
        i = e.r(197418),
        o = e.r(981625),
        l = e.r(361413),
        s = e.r(524347),
        u = e.r(490611).f,
        c = e.r(922103),
        d = e.r(939226),
        f = e.r(346035),
        p = e.r(428111),
        h = e.r(911481),
        m = e.r(961986),
        g = e.r(91041),
        v = e.r(592699),
        y = e.r(587978),
        b = e.r(626070),
        w = e.r(734641),
        _ = e.r(425948),
        S = "DOMException",
        k = "DATA_CLONE_ERR",
        x = a("Error"),
        E = a(S) || function() {
            try {
                new(a("MessageChannel") || i("worker_threads").MessageChannel)().port1.postMessage(new WeakMap)
            } catch (e) {
                if (e.name === k && 25 === e.code) return e.constructor
            }
        }(),
        T = E && E.prototype,
        N = x.prototype,
        C = b.set,
        O = b.getterFor(S),
        R = "stack" in new x(S),
        P = function(e) {
            return f(v, e) && v[e].m ? v[e].c : 0
        },
        I = function() {
            p(this, A);
            var e = arguments.length,
                t = g(e < 1 ? void 0 : arguments[0]),
                n = g(e < 2 ? void 0 : arguments[1], "Error"),
                r = P(n);
            if (C(this, {
                    type: S,
                    name: n,
                    message: t,
                    code: r
                }), w || (this.name = n, this.message = t, this.code = r), R) {
                var a = new x(t);
                a.name = S, u(this, "stack", s(1, y(a.stack, 1)))
            }
        },
        A = I.prototype = l(N),
        L = function(e) {
            return {
                enumerable: !0,
                configurable: !0,
                get: e
            }
        },
        D = function(e) {
            return L(function() {
                return O(this)[e]
            })
        };
    w && (d(A, "code", D("code")), d(A, "message", D("message")), d(A, "name", D("name"))), u(A, "constructor", s(1, I));
    var M = o(function() {
            return !(new E instanceof x)
        }),
        z = M || o(function() {
            return N.toString !== m || "2: 1" !== String(new E(1, 2))
        }),
        F = M || o(function() {
            return 25 !== new E(1, "DataCloneError").code
        }),
        j = M || 25 !== E[k] || 25 !== T[k],
        U = _ ? z || F || j : M;
    r({
        global: !0,
        constructor: !0,
        forced: U
    }, {
        DOMException: U ? I : E
    });
    var B = a(S),
        q = B.prototype;
    for (var $ in z && (_ || E === B) && c(q, "toString", m), F && w && E === B && d(q, "code", L(function() {
            return P(h(this).name)
        })), v)
        if (f(v, $)) {
            var V = v[$],
                W = V.s,
                K = s(6, V.c);
            f(B, W) || u(B, W, K), f(q, W) || u(q, W, K)
        }
}, 318313, (e, t, n) => {
    "use strict";
    var r = e.r(995822),
        a = e.r(632853),
        i = e.r(915639),
        o = e.r(524347),
        l = e.r(490611).f,
        s = e.r(346035),
        u = e.r(428111),
        c = e.r(375612),
        d = e.r(91041),
        f = e.r(592699),
        p = e.r(587978),
        h = e.r(734641),
        m = e.r(425948),
        g = "DOMException",
        v = i("Error"),
        y = i(g),
        b = function() {
            u(this, w);
            var e = arguments.length,
                t = d(e < 1 ? void 0 : arguments[0]),
                n = d(e < 2 ? void 0 : arguments[1], "Error"),
                r = new y(t, n),
                a = new v(t);
            return a.name = g, l(r, "stack", o(1, p(a.stack, 1))), c(r, this, b), r
        },
        w = b.prototype = y.prototype,
        _ = "stack" in new v(g),
        S = "stack" in new y(1, 2),
        k = y && h && Object.getOwnPropertyDescriptor(a, g),
        x = !!k && !(k.writable && k.configurable),
        E = _ && !x && !S;
    r({
        global: !0,
        constructor: !0,
        forced: m || E
    }, {
        DOMException: E ? b : y
    });
    var T = i(g),
        N = T.prototype;
    if (N.constructor !== T) {
        for (var C in m || l(N, "constructor", o(1, T)), f)
            if (s(f, C)) {
                var O = f[C],
                    R = O.s;
                s(T, R) || l(T, R, o(6, O.c))
            }
    }
}, 808053, (e, t, n) => {
    "use strict";
    var r = e.r(915639),
        a = e.r(968731),
        i = "DOMException";
    a(r(i), i)
}, 45612, (e, t, n) => {
    "use strict";
    var r = e.r(588441),
        a = e.r(981625),
        i = e.r(340151),
        o = e.r(534051),
        l = e.r(915639),
        s = e.r(470288),
        u = function() {},
        c = l("Reflect", "construct"),
        d = /^\s*(?:class|function)\b/,
        f = r(d.exec),
        p = !d.test(u),
        h = function(e) {
            if (!i(e)) return !1;
            try {
                return c(u, [], e), !0
            } catch (e) {
                return !1
            }
        },
        m = function(e) {
            if (!i(e)) return !1;
            switch (o(e)) {
                case "AsyncFunction":
                case "GeneratorFunction":
                case "AsyncGeneratorFunction":
                    return !1
            }
            try {
                return p || !!f(d, s(e))
            } catch (e) {
                return !0
            }
        };
    m.sham = !0, t.exports = !c || a(function() {
        var e;
        return h(h.call) || !h(Object) || !h(function() {
            e = !0
        }) || e
    }) ? m : h
}, 312948, (e, t, n) => {
    "use strict";
    var r = e.r(734641),
        a = e.r(490611),
        i = e.r(524347);
    t.exports = function(e, t, n) {
        r ? a.f(e, t, i(0, n)) : e[t] = n
    }
}, 623702, (e, t, n) => {
    "use strict";
    var r = TypeError;
    t.exports = function(e, t) {
        if (e < t) throw new r("Not enough arguments");
        return e
    }
}, 200026, (e, t, n) => {
    "use strict";
    var r = e.r(911481);
    t.exports = function() {
        var e = r(this),
            t = "";
        return e.hasIndices && (t += "d"), e.global && (t += "g"), e.ignoreCase && (t += "i"), e.multiline && (t += "m"), e.dotAll && (t += "s"), e.unicode && (t += "u"), e.unicodeSets && (t += "v"), e.sticky && (t += "y"), t
    }
}, 150583, (e, t, n) => {
    "use strict";
    var r = e.r(839016),
        a = e.r(346035),
        i = e.r(196403),
        o = e.r(200026),
        l = RegExp.prototype;
    t.exports = function(e) {
        var t = e.flags;
        return !(void 0 === t && !("flags" in l) && !a(e, "flags") && i(l, e)) ? t : r(o, e)
    }
}, 956583, (e, t, n) => {
    "use strict";
    var r = e.r(588441),
        a = Map.prototype;
    t.exports = {
        Map: Map,
        set: r(a.set),
        get: r(a.get),
        has: r(a.has),
        remove: r(a.delete),
        proto: a
    }
}, 199059, (e, t, n) => {
    "use strict";
    var r = e.r(588441),
        a = Set.prototype;
    t.exports = {
        Set: Set,
        add: r(a.add),
        has: r(a.has),
        remove: r(a.delete),
        proto: a
    }
}, 602767, (e, t, n) => {
    "use strict";
    var r = e.r(839016);
    t.exports = function(e, t, n) {
        for (var a, i, o = n ? e : e.iterator, l = e.next; !(a = r(l, o)).done;)
            if (void 0 !== (i = t(a.value))) return i
    }
}, 378208, (e, t, n) => {
    "use strict";
    var r = e.r(588441),
        a = e.r(602767),
        i = e.r(199059),
        o = i.Set,
        l = i.proto,
        s = r(l.forEach),
        u = r(l.keys),
        c = u(new o).next;
    t.exports = function(e, t, n) {
        return n ? a({
            iterator: u(e),
            next: c
        }, t) : s(e, t)
    }
}, 630321, (e, t, n) => {
    "use strict";
    var r = e.r(632853),
        a = e.r(981625),
        i = e.r(732985),
        o = e.r(546939),
        l = r.structuredClone;
    t.exports = !!l && !a(function() {
        if ("DENO" === o && i > 92 || "NODE" === o && i > 94 || "BROWSER" === o && i > 97) return !1;
        var e = new ArrayBuffer(8),
            t = l(e, {
                transfer: [e]
            });
        return 0 !== e.byteLength || 8 !== t.byteLength
    })
}, 464831, (e, t, n) => {
    "use strict";
    var r, a, i, o, l = e.r(632853),
        s = e.r(197418),
        u = e.r(630321),
        c = l.structuredClone,
        d = l.ArrayBuffer,
        f = l.MessageChannel,
        p = !1;
    if (u) p = function(e) {
        c(e, {
            transfer: [e]
        })
    };
    else if (d) try {
        !f && (r = s("worker_threads")) && (f = r.MessageChannel), f && (a = new f, i = new d(2), o = function(e) {
            a.port1.postMessage(null, [e])
        }, 2 === i.byteLength && (o(i), 0 === i.byteLength && (p = o)))
    } catch (e) {}
    t.exports = p
}, 326947, (e, t, n) => {
    "use strict";
    var r = e.r(981625),
        a = e.r(524347);
    t.exports = !r(function() {
        var e = Error("a");
        return !("stack" in e) || (Object.defineProperty(e, "stack", a(1, 7)), 7 !== e.stack)
    })
}, 452498, (e, t, n) => {
    "use strict";
    var r = e.r(425948),
        a = e.r(995822),
        i = e.r(632853),
        o = e.r(915639),
        l = e.r(588441),
        s = e.r(981625),
        u = e.r(369824),
        c = e.r(340151),
        d = e.r(45612),
        f = e.r(48943),
        p = e.r(458875),
        h = e.r(543794),
        m = e.r(310173),
        g = e.r(911481),
        v = e.r(534051),
        y = e.r(346035),
        b = e.r(312948),
        w = e.r(814374),
        _ = e.r(802570),
        S = e.r(623702),
        k = e.r(150583),
        x = e.r(956583),
        E = e.r(199059),
        T = e.r(378208),
        N = e.r(464831),
        C = e.r(326947),
        O = e.r(630321),
        R = i.Object,
        P = i.Array,
        I = i.Date,
        A = i.Error,
        L = i.TypeError,
        D = i.PerformanceMark,
        M = o("DOMException"),
        z = x.Map,
        F = x.has,
        j = x.get,
        U = x.set,
        B = E.Set,
        q = E.add,
        $ = E.has,
        V = o("Object", "keys"),
        W = l([].push),
        K = l((!0).valueOf),
        H = l(1..valueOf),
        Z = l("".valueOf),
        G = l(I.prototype.getTime),
        Q = u("structuredClone"),
        Y = "DataCloneError",
        X = "Transferring",
        J = function(e) {
            return !s(function() {
                var t = new i.Set([7]),
                    n = e(t),
                    r = e(R(7));
                return n === t || !n.has(7) || !p(r) || 7 != +r
            }) && e
        },
        ee = function(e, t) {
            return !s(function() {
                var n = new t,
                    r = e({
                        a: n,
                        b: n
                    });
                return !(r && r.a === r.b && r.a instanceof t && r.a.stack === n.stack)
            })
        },
        et = i.structuredClone,
        en = r || !ee(et, A) || !ee(et, M) || !!s(function() {
            var e = et(new i.AggregateError([1], Q, {
                cause: 3
            }));
            return "AggregateError" !== e.name || 1 !== e.errors[0] || e.message !== Q || 3 !== e.cause
        }),
        er = !et && J(function(e) {
            return new D(Q, {
                detail: e
            }).detail
        }),
        ea = J(et) || er,
        ei = function(e) {
            throw new M("Uncloneable type: " + e, Y)
        },
        eo = function(e, t) {
            throw new M((t || "Cloning") + " of " + e + " cannot be properly polyfilled in this engine", Y)
        },
        el = function(e, t) {
            return ea || eo(t), ea(e)
        },
        es = function() {
            var e;
            try {
                e = new i.DataTransfer
            } catch (t) {
                try {
                    e = new i.ClipboardEvent("").clipboardData
                } catch (e) {}
            }
            return e && e.items && e.files ? e : null
        },
        eu = function(e, t, n) {
            if (F(t, e)) return j(t, e);
            if ("SharedArrayBuffer" === (n || v(e))) r = ea ? ea(e) : e;
            else {
                var r, a, o, l, s, u, d = i.DataView;
                d || c(e.slice) || eo("ArrayBuffer");
                try {
                    if (c(e.slice) && !e.resizable) r = e.slice(0);
                    else
                        for (u = 0, a = e.byteLength, o = ("maxByteLength" in e) ? {
                                maxByteLength: e.maxByteLength
                            } : void 0, r = new ArrayBuffer(a, o), l = new d(e), s = new d(r); u < a; u++) s.setUint8(u, l.getUint8(u))
                } catch (e) {
                    throw new M("ArrayBuffer is detached", Y)
                }
            }
            return U(t, e, r), r
        },
        ec = function(e, t, n, r, a) {
            var o = i[t];
            return p(o) || eo(t), new o(eu(e.buffer, a), n, r)
        },
        ed = function(e, t) {
            if (h(e) && ei("Symbol"), !p(e)) return e;
            if (t) {
                if (F(t, e)) return j(t, e)
            } else t = new z;
            var n, r, a, l, s, u, d, f, m = v(e);
            switch (m) {
                case "Array":
                    a = P(_(e));
                    break;
                case "Object":
                    a = {};
                    break;
                case "Map":
                    a = new z;
                    break;
                case "Set":
                    a = new B;
                    break;
                case "RegExp":
                    a = new RegExp(e.source, k(e));
                    break;
                case "Error":
                    switch (r = e.name) {
                        case "AggregateError":
                            a = new(o(r))([]);
                            break;
                        case "EvalError":
                        case "RangeError":
                        case "ReferenceError":
                        case "SuppressedError":
                        case "SyntaxError":
                        case "TypeError":
                        case "URIError":
                            a = new(o(r));
                            break;
                        case "CompileError":
                        case "LinkError":
                        case "RuntimeError":
                            a = new(o("WebAssembly", r));
                            break;
                        default:
                            a = new A
                    }
                    break;
                case "DOMException":
                    a = new M(e.message, e.name);
                    break;
                case "ArrayBuffer":
                case "SharedArrayBuffer":
                    a = eu(e, t, m);
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
                    u = "DataView" === m ? e.byteLength : e.length, a = ec(e, m, e.byteOffset, u, t);
                    break;
                case "DOMQuad":
                    try {
                        a = new DOMQuad(ed(e.p1, t), ed(e.p2, t), ed(e.p3, t), ed(e.p4, t))
                    } catch (t) {
                        a = el(e, m)
                    }
                    break;
                case "File":
                    if (ea) try {
                        a = ea(e), v(a) !== m && (a = void 0)
                    } catch (e) {}
                    if (!a) try {
                        a = new File([e], e.name, e)
                    } catch (e) {}
                    a || eo(m);
                    break;
                case "FileList":
                    if (l = es()) {
                        for (s = 0, u = _(e); s < u; s++) l.items.add(ed(e[s], t));
                        a = l.files
                    } else a = el(e, m);
                    break;
                case "ImageData":
                    try {
                        a = new ImageData(ed(e.data, t), e.width, e.height, {
                            colorSpace: e.colorSpace
                        })
                    } catch (t) {
                        a = el(e, m)
                    }
                    break;
                default:
                    if (ea) a = ea(e);
                    else switch (m) {
                        case "BigInt":
                            a = R(e.valueOf());
                            break;
                        case "Boolean":
                            a = R(K(e));
                            break;
                        case "Number":
                            a = R(H(e));
                            break;
                        case "String":
                            a = R(Z(e));
                            break;
                        case "Date":
                            a = new I(G(e));
                            break;
                        case "Blob":
                            try {
                                a = e.slice(0, e.size, e.type)
                            } catch (e) {
                                eo(m)
                            }
                            break;
                        case "DOMPoint":
                        case "DOMPointReadOnly":
                            n = i[m];
                            try {
                                a = n.fromPoint ? n.fromPoint(e) : new n(e.x, e.y, e.z, e.w)
                            } catch (e) {
                                eo(m)
                            }
                            break;
                        case "DOMRect":
                        case "DOMRectReadOnly":
                            n = i[m];
                            try {
                                a = n.fromRect ? n.fromRect(e) : new n(e.x, e.y, e.width, e.height)
                            } catch (e) {
                                eo(m)
                            }
                            break;
                        case "DOMMatrix":
                        case "DOMMatrixReadOnly":
                            n = i[m];
                            try {
                                a = n.fromMatrix ? n.fromMatrix(e) : new n(e)
                            } catch (e) {
                                eo(m)
                            }
                            break;
                        case "AudioData":
                        case "VideoFrame":
                            c(e.clone) || eo(m);
                            try {
                                a = e.clone()
                            } catch (e) {
                                ei(m)
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
                            eo(m);
                        default:
                            ei(m)
                    }
            }
            switch (U(t, e, a), m) {
                case "Array":
                case "Object":
                    for (s = 0, u = _(d = V(e)); s < u; s++) f = d[s], b(a, f, ed(e[f], t));
                    break;
                case "Map":
                    e.forEach(function(e, n) {
                        U(a, ed(n, t), ed(e, t))
                    });
                    break;
                case "Set":
                    e.forEach(function(e) {
                        q(a, ed(e, t))
                    });
                    break;
                case "Error":
                    w(a, "message", ed(e.message, t)), y(e, "cause") && w(a, "cause", ed(e.cause, t)), "AggregateError" === r ? a.errors = ed(e.errors, t) : "SuppressedError" === r && (a.error = ed(e.error, t), a.suppressed = ed(e.suppressed, t));
                case "DOMException":
                    C && w(a, "stack", ed(e.stack, t))
            }
            return a
        },
        ef = function(e, t) {
            if (!p(e)) throw new L("Transfer option cannot be converted to a sequence");
            var n, r, a, o, l, s = [];
            m(e, function(e) {
                W(s, g(e))
            });
            for (var u = 0, f = _(s), h = new B; u < f;) {
                if ("ArrayBuffer" === (r = v(n = s[u++])) ? $(h, n) : F(t, n)) throw new M("Duplicate transferable", Y);
                if ("ArrayBuffer" === r) {
                    q(h, n);
                    continue
                }
                if (O) o = et(n, {
                    transfer: [n]
                });
                else switch (r) {
                    case "ImageBitmap":
                        d(a = i.OffscreenCanvas) || eo(r, X);
                        try {
                            (l = new a(n.width, n.height)).getContext("bitmaprenderer").transferFromImageBitmap(n), o = l.transferToImageBitmap()
                        } catch (e) {}
                        break;
                    case "AudioData":
                    case "VideoFrame":
                        c(n.clone) && c(n.close) || eo(r, X);
                        try {
                            o = n.clone(), n.close()
                        } catch (e) {}
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
                        eo(r, X)
                }
                if (void 0 === o) throw new M("This object cannot be transferred: " + r, Y);
                U(t, n, o)
            }
            return h
        },
        ep = function(e) {
            T(e, function(e) {
                O ? ea(e, {
                    transfer: [e]
                }) : c(e.transfer) ? e.transfer() : N ? N(e) : eo("ArrayBuffer", X)
            })
        };
    a({
        global: !0,
        enumerable: !0,
        sham: !O,
        forced: en
    }, {
        structuredClone: function(e) {
            var t, n, r = S(arguments.length, 1) > 1 && !f(arguments[1]) ? g(arguments[1]) : void 0,
                a = r ? r.transfer : void 0;
            void 0 !== a && (n = ef(a, t = new z));
            var i = ed(e, t);
            return n && ep(n), i
        }
    })
}, 864456, (e, t, n) => {
    "use strict";
    t.exports = e.r(632853)
}, 532238, (e, t, n) => {
    "use strict";
    e.r(112730), e.r(184237), e.r(249229), e.r(882282), e.r(39806), e.r(581369), e.r(297902), e.r(318313), e.r(808053), e.r(452498), t.exports = e.r(864456).structuredClone
}, 775959, (e, t, n) => {
    "use strict";
    t.exports = e.r(532238)
}, 335691, e => {
    "use strict";
    let t, n, r, a, i;
    e.i(769579), e.i(823130), e.i(775959);
    var o, l, s, u, c, d, f = e.i(645020),
        p = e.i(737344),
        h = e.i(695524),
        m = e.i(204078),
        g = e.i(960186),
        v = e.i(285586),
        y = e.i(420546),
        b = e.i(791803),
        w = e.i(218953);
    let _ = "u" < typeof __SENTRY_DEBUG__ || __SENTRY_DEBUG__;
    var S = e.i(59172),
        k = e.i(411187),
        x = e.i(865607),
        E = e.i(454181),
        T = e.i(557156);
    let N = m.GLOBAL_OBJ,
        C = null,
        O = new Map,
        R = new Map;

    function P(e) {
        let t = e.split("/").filter(Boolean),
            n = 0;
        for (let e of t)
            if (e.startsWith(":")) {
                let t = e.substring(1);
                t.endsWith("*?") ? n += 1e3 : t.endsWith("*") ? n += 100 : n += 10
            } return t.length > 0 && (n += 1 / t.length), n
    }

    function I(e) {
        if (O.has(e)) return O.get(e) ?? null;
        try {
            let t = new RegExp(e);
            return O.set(e, t), t
        } catch (t) {
            return _ && h.debug.warn("Could not compile regex", {
                regexString: e,
                error: t
            }), null
        }
    }

    function A() {
        if (!N?._sentryRouteManifest || "string" != typeof N._sentryRouteManifest) return null;
        let e = N._sentryRouteManifest;
        if (C && n === e) return C;
        O.clear(), R.clear();
        let t = {
            staticRoutes: [],
            dynamicRoutes: [],
            isrRoutes: []
        };
        try {
            if (t = JSON.parse(e), !Array.isArray(t.staticRoutes) || !Array.isArray(t.dynamicRoutes)) return null;
            return C = t, n = e, t
        } catch {
            return _ && h.debug.warn("Could not extract route manifest"), null
        }
    }
    let L = e => {
        let t = A();
        if (!t) return;
        let n = e.length > 1 && e.endsWith("/") ? e.slice(0, -1) : e;
        if (R.has(n)) return R.get(n);
        let {
            staticRoutes: r,
            dynamicRoutes: a
        } = t;
        if (!Array.isArray(r) || !Array.isArray(a)) return;
        let i = (function(e, t, n) {
            let r = [];
            if (t.some(t => t.path === e)) return r;
            for (let t of n)
                if (t.regex) {
                    let n = I(t.regex);
                    n?.test(e) && r.push(t.path)
                } if (!e.startsWith("/:")) {
                for (let t of n)
                    if (t.hasOptionalPrefix && t.regex) {
                        let n = "/" === e ? "/SENTRY_OPTIONAL_PREFIX" : `/SENTRY_OPTIONAL_PREFIX${e}`,
                            a = I(t.regex);
                        a?.test(n) && r.push(t.path)
                    }
            }
            return r
        })(n, r, a).sort((e, t) => P(e) - P(t))[0];
        return R.set(n, i), i
    };

    function D(e) {
        return e.length > 1 && e.endsWith("/") ? e.slice(0, -1) : e
    }
    let M = "incomplete-app-router-transaction",
        z = {
            current: void 0
        },
        F = m.GLOBAL_OBJ,
        j = m.GLOBAL_OBJ;

    function U(e) {
        try {
            return new URL(e, "http://example.com/").pathname
        } catch {
            return "/"
        }
    }
    let B = new WeakSet;

    function q(e, t, n) {
        B.has(t) || (B.add(t), ["back", "forward", "push", "replace"].forEach(r => {
            t?.[r] && (t[r] = new Proxy(t[r], {
                apply(t, a, i) {
                    !1;
                    let o = M,
                        l = {
                            [E.SEMANTIC_ATTRIBUTE_SENTRY_OP]: "navigation",
                            [E.SEMANTIC_ATTRIBUTE_SENTRY_ORIGIN]: "auto.navigation.nextjs.app_router_instrumentation",
                            [E.SEMANTIC_ATTRIBUTE_SENTRY_SOURCE]: "url"
                        },
                        s = i[0],
                        u = p.default.env._sentryBasePath ?? j._sentryBasePath,
                        c = u && "string" == typeof s && !s.startsWith(u) ? `${u}${s}` : s;
                    "push" === r ? (o = D(U(c)), l["navigation.type"] = "router.push") : "replace" === r ? (o = D(U(c)), l["navigation.type"] = "router.replace") : "back" === r ? l["navigation.type"] = "router.back" : "forward" === r && (l["navigation.type"] = "router.forward");
                    let d = L(o);
                    return n.current = (0, k.startBrowserTracingNavigationSpan)(e, {
                        name: d ?? o,
                        attributes: {
                            ...l,
                            [E.SEMANTIC_ATTRIBUTE_SENTRY_SOURCE]: d ? "route" : "url"
                        }
                    }), t.apply(a, i)
                }
            }))
        }))
    }
    var $ = e.i(854787),
        V = e.i(499678),
        W = e.i(573368);
    let K = W.default.events ? W.default : W.default.default,
        H = x.WINDOW;

    function Z() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
            t = (0, k.browserTracingIntegration)({
                ...e,
                instrumentNavigation: !1,
                instrumentPageLoad: !1,
                onRequestSpanStart() {
                    for (var t = arguments.length, n = Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                    let [a, {
                        headers: i
                    }] = n;
                    return i?.get("next-router-prefetch") && a?.setAttribute("http.request.prefetch", !0), e.onRequestSpanStart?.(...n)
                }
            }),
            {
                instrumentPageLoad: n = !0,
                instrumentNavigation: r = !0
            } = e;
        return {
            ...t,
            afterAllSetup(e) {
                !(0, k.isBotUserAgent)() && (r && function(e) {
                    if (x.WINDOW.document.getElementById("__NEXT_DATA__")) K.events.on("routeChangeStart", t => {
                        let n, r, a = (0, $.stripUrlQueryAndFragment)(t),
                            i = function(e) {
                                let t = H.__BUILD_MANIFEST?.sortedPages;
                                if (t) return t.find(t => {
                                    let n, r, a, i = (n = t.split("/"), r = "", n[n.length - 1]?.match(/^\[\[\.\.\..+\]\]$/) && (n.pop(), r = "(?:/(.+?))?"), a = n.map(e => e.replace(/^\[\.\.\..+\]$/, "(.+?)").replace(/^\[.*\]$/, "([^/]+?)")).join("/"), RegExp(`^${a}${r}(?:/)?$`));
                                    return e.match(i)
                                })
                            }(a);
                        i ? (n = i, r = "route") : (n = a, r = "url"), (0, k.startBrowserTracingNavigationSpan)(e, {
                            name: n,
                            attributes: {
                                [E.SEMANTIC_ATTRIBUTE_SENTRY_OP]: "navigation",
                                [E.SEMANTIC_ATTRIBUTE_SENTRY_ORIGIN]: "auto.navigation.nextjs.pages_router_instrumentation",
                                [E.SEMANTIC_ATTRIBUTE_SENTRY_SOURCE]: r
                            }
                        })
                    });
                    else {
                        let t, n, r;
                        x.WINDOW.addEventListener("popstate", () => {
                            let t = D(x.WINDOW.location.pathname),
                                n = L(t);
                            z.current?.isRecording() ? (z.current.updateName(n ?? t), z.current.setAttribute(E.SEMANTIC_ATTRIBUTE_SENTRY_SOURCE, n ? "route" : "url")) : z.current = (0, k.startBrowserTracingNavigationSpan)(e, {
                                name: n ?? t,
                                attributes: {
                                    [E.SEMANTIC_ATTRIBUTE_SENTRY_ORIGIN]: "auto.navigation.nextjs.app_router_instrumentation",
                                    [E.SEMANTIC_ATTRIBUTE_SENTRY_SOURCE]: n ? "route" : "url",
                                    "navigation.type": "browser.popstate"
                                }
                            })
                        }), t = !1, n = 0, r = setInterval(() => {
                            n++;
                            let a = F?.next?.router ?? F?.nd?.router;
                            t || n > 500 ? clearInterval(r) : a && (clearInterval(r), t = !0, q(e, a, z), ["nd", "next"].forEach(t => {
                                let n = F[t];
                                n && (F[t] = new Proxy(n, {
                                    set: (t, n, r) => ("router" === n && "object" == typeof r && null !== r && q(e, r, z), t[n] = r, !0)
                                }))
                            }))
                        }, 20)
                    }
                }(e), t.afterAllSetup(e), n && function(e) {
                    if (x.WINDOW.document.getElementById("__NEXT_DATA__")) ! function(e) {
                        let {
                            route: t,
                            params: n,
                            sentryTrace: r,
                            baggage: a
                        } = function() {
                            let e, t = H.document.getElementById("__NEXT_DATA__");
                            if (t?.innerHTML) try {
                                e = JSON.parse(t.innerHTML)
                            } catch {
                                _ && h.debug.warn("Could not extract __NEXT_DATA__")
                            }
                            if (!e) return {};
                            let n = {},
                                {
                                    page: r,
                                    query: a,
                                    props: i
                                } = e;
                            return n.route = r, n.params = a, i?.pageProps && (n.sentryTrace = i.pageProps._sentryTraceData, n.baggage = i.pageProps._sentryBaggage), n
                        }(), i = (0, V.parseBaggageHeader)(a), o = t || H.location.pathname;
                        i?.["sentry-transaction"] && "/_error" === o && (o = (o = i["sentry-transaction"]).replace(/^(GET|POST|PUT|DELETE|PATCH|HEAD|OPTIONS|TRACE|CONNECT)\s+/i, ""));
                        let l = (0, T.browserPerformanceTimeOrigin)();
                        (0, k.startBrowserTracingPageLoadSpan)(e, {
                            name: o,
                            startTime: l ? l / 1e3 : void 0,
                            attributes: {
                                [E.SEMANTIC_ATTRIBUTE_SENTRY_OP]: "pageload",
                                [E.SEMANTIC_ATTRIBUTE_SENTRY_ORIGIN]: "auto.pageload.nextjs.pages_router_instrumentation",
                                [E.SEMANTIC_ATTRIBUTE_SENTRY_SOURCE]: t ? "route" : "url",
                                ...n && e.getOptions().sendDefaultPii && {
                                    ...n
                                }
                            }
                        }, {
                            sentryTrace: r,
                            baggage: a
                        })
                    }(e);
                    else {
                        let t, n, r;
                        n = L(t = D(x.WINDOW.location.pathname)), r = (0, T.browserPerformanceTimeOrigin)(), (0, k.startBrowserTracingPageLoadSpan)(e, {
                            name: n ?? t,
                            startTime: r ? r / 1e3 : void 0,
                            attributes: {
                                [E.SEMANTIC_ATTRIBUTE_SENTRY_OP]: "pageload",
                                [E.SEMANTIC_ATTRIBUTE_SENTRY_ORIGIN]: "auto.pageload.nextjs.app_router_instrumentation",
                                [E.SEMANTIC_ATTRIBUTE_SENTRY_SOURCE]: n ? "route" : "url"
                            }
                        })
                    }
                }(e))
            }
        }
    }
    var G = e.i(930064),
        Q = e.i(217251);
    let Y = (0, G.defineIntegration)(e => {
            let {
                assetPrefix: t,
                basePath: n,
                rewriteFramesAssetPrefixPath: r,
                experimentalThirdPartyOriginStackFrames: a
            } = e;
            return {
                ...(0, Q.rewriteFramesIntegration)({
                    iteratee: e => {
                        if (a) {
                            let r = "u" > typeof window && window.location ? window.location.origin : "";
                            if (e.filename?.startsWith(r) && !e.filename.endsWith(".js")) return e;
                            if (t) e.filename?.startsWith(t) && (e.filename = e.filename.replace(t, "app://"));
                            else if (n) try {
                                let {
                                    origin: t
                                } = new URL(e.filename);
                                t === r && (e.filename = e.filename?.replace(t, "app://").replace(n, ""))
                            } catch {}
                        } else try {
                            let {
                                origin: t
                            } = new URL(e.filename);
                            e.filename = e.filename?.replace(t, "app://").replace(r, "")
                        } catch {}
                        return a ? (e.filename?.includes("/_next") && (e.filename = decodeURI(e.filename)), e.filename?.match(/\/_next\/static\/chunks\/(main-|main-app-|polyfills-|webpack-|framework-|framework\.)[0-9a-f]+\.js$/) && (e.in_app = !1)) : (e.filename?.startsWith("app:///_next") && (e.filename = decodeURI(e.filename)), e.filename?.match(/^app:\/\/\/_next\/static\/chunks\/(main-|main-app-|polyfills-|webpack-|framework-|framework\.)[0-9a-f]+\.js$/) && (e.in_app = !1)), e
                    }
                }),
                name: "NextjsClientStackFrameNormalization"
            }
        }),
        X = new(e.i(489767)).LRUMap(100);
    var J = e.i(551482);
    let ee = m.GLOBAL_OBJ,
        et = !1,
        en = m.GLOBAL_OBJ;
    var er = e.i(723941);

    function ea(e) {
        return null == e || Number.isNaN(e) ? String(Math.trunc(1e6 * performance.timeOrigin + 1e6 * performance.now())) : String(Math.trunc(1e9 * e))
    }

    function ei(e) {
        let t = [];
        for (let n of e) {
            for (let [e, r] of null == n || "object" != typeof n ? [] : Object.entries(n)) null != r && t.push({
                key: e,
                value: function e(t) {
                    switch (typeof t) {
                        case "string":
                            return {
                                stringValue: t
                            };
                        case "boolean":
                            return {
                                boolValue: t
                            };
                        case "number":
                            return Number.isInteger(t) ? {
                                intValue: String(t)
                            } : {
                                doubleValue: t
                            };
                        case "object":
                            if (null === t) return {
                                stringValue: "null"
                            };
                            if (Array.isArray(t)) return {
                                arrayValue: {
                                    values: t.map(e)
                                }
                            };
                            return {
                                kvlistValue: {
                                    values: Object.entries(t).map(t => {
                                        let [n, r] = t;
                                        return {
                                            key: n,
                                            value: e(r)
                                        }
                                    })
                                }
                            };
                        case "bigint":
                            return {
                                intValue: String(t)
                            };
                        case "symbol":
                        default:
                            return {
                                stringValue: String(t)
                            };
                        case "undefined":
                            return {
                                stringValue: "undefined"
                            };
                        case "function":
                            return {
                                stringValue: "[Function]"
                            }
                    }
                }(r)
            })
        }
        return t
    }(eJ = {})[eJ.UNSET = 0] = "UNSET", eJ[eJ.OK = 1] = "OK", eJ[eJ.ERROR = 2] = "ERROR";
    let eo = e => null == e || "" === e ? void 0 : e;

    function el(e) {
        if (!e) return {
            code: 0
        };
        let t = e.toLowerCase();
        return "ok" === t ? {
            code: 1
        } : ["cancelled", "unknown_error", "invalid_argument", "deadline_exceeded", "not_found", "already_exists", "permission_denied", "resource_exhausted", "failed_precondition", "aborted", "out_of_range", "unimplemented", "internal_error", "unavailable", "data_loss", "unauthenticated"].includes(t) ? {
            code: 2,
            message: e
        } : {
            code: 0
        }
    }

    function es(e) {
        if (!e) return 1;
        let t = e.toLowerCase();
        return t.includes("http") || t.includes("fetch") || t.includes("xhr") || t.includes("db") || t.includes("query") || t.includes("sql") ? 3 : t.includes("server") || t.includes("request") ? 2 : t.includes("publish") || t.includes("send") || t.includes("produce") ? 4 : t.includes("consume") || t.includes("receive") || t.includes("process") ? 5 : 1
    }
    let eu = new Set(["ttfb", "lcp", "fcp", "cls"]),
        ec = "sitetest3",
        ed = "https://otel-collector-otlp-http-sitetest3.simulpong.com/v1/traces",
        ef = {
            sitetest1: "https://otel-collector-otlp-http-sitetest1-snc3.simulpong.com/v1/traces",
            sitetest2: "https://otel-collector-otlp-http-sitetest2-snc2.simulpong.com/v1/traces",
            sitetest3: ed
        };
    var ep = e.i(587541);
    let eh = [/get663\.com/i, /\bg663/i],
        em = [/extensions\//i, /^chrome(-extensions?)?:\/\//i, /^moz-extension:\/\//i, /^safari(-web)?-extension:\/\//i, /^blob:/i, /^https?:\/\/arkoselabs\.(roblox\.com|sitetest\d\.robloxlabs\.com)\//i, /^https?:\/\/([a-z0-9-]+\.)*(arkoselabs|funcaptcha)\.com\//i, ...eh],
        eg = [...eh, /Failed to fetch \(get663\.com\)/i, /WKWebView API client did not respond to this postMessage/i, /ResizeObserver loop limit exceeded/i, /ResizeObserver loop completed with undelivered notifications/i, /^Script error\.?$/i, /Non-Error promise rejection captured with value: (undefined|null)$/i],
        ev = /^(?:Failed to fetch|Load failed|NetworkError when attempting to fetch resource\.) \(([^)]+)\)$/i,
        ey = [...ep.defaultUrlOptions.domainAllowlist, ".rbxcdn.com", ".simulpong.com"];
    var eb = e.i(245837);
    let ew = e => null == e ? void 0 : (0, f.parseFloat)(e) ?? void 0,
        e_ = "__rbxSentryInitedByRuntime__",
        eS = {
            sitetest3: "https://d63b2496d92bbb319e70a0e8dfa139a1@sentry.stage.rbx.com/23",
            sitetest2: "https://d63b2496d92bbb319e70a0e8dfa139a1@sentry.stage.rbx.com/23",
            sitetest1: "https://d63b2496d92bbb319e70a0e8dfa139a1@sentry.stage.rbx.com/23",
            production: "https://ea57fbe3ed0871c1ff6377cdd8d21405@sentry-relay.rbxinfra.com/23"
        } [e.i(152972).robloxEnv];
    var ek = e.i(473897),
        ex = e.i(645343),
        eE = e.i(556095),
        eT = e.i(564262),
        eN = e.i(358239),
        eC = e.i(673518);

    function eO(e) {
        return document.getElementById("rbx-sentry-config")?.getAttribute(e) ?? void 0
    }

    function eR(e, t) {
        let n = eO(e);
        return (n ? (0, f.parseFloat)(n) : null) ?? t
    }
    let eP = {
        deviceInfo: {
            deviceType: (0, eN.getDeviceClient)().deviceType,
            browser: (0, eC.browserFromUserAgent)(navigator.userAgent)
        },
        requestCountryCode: (r = eO("data-request-country-code") ?? "", (0, ek.downcast)(/^[A-Za-z]{2}$/.test(r) ? r.toUpperCase() : ""))
    };
    ! function(e) {
        let {
            appName: t,
            runtime: n,
            overrides: r,
            configure: a,
            traceSamplerRegexSettings: i,
            tracingResources: o
        } = e;
        if (globalThis[e_]) return;
        let l = function(e) {
            let t, n, r, a, i, o, {
                    appName: l,
                    runtime: s,
                    overrides: u,
                    traceSamplerRegexSettings: c,
                    tracingResources: d
                } = e,
                f = (t = p.default.env.SENTRY_DSN, n = p.default.env.ROBLOX_ENVIRONMENT ?? p.default.env.NEXT_PUBLIC_SENTRY_ENVIRONMENT ?? "production", r = p.default.env.SENTRY_RELEASE ?? "www-nextjs@master-af8933228b6224897a8f557d01a0b136676e8780" ?? "unknown", a = ew(p.default.env.SENTRY_SERVER_SAMPLE_RATE), i = ew(p.default.env.SENTRY_SERVER_TRACES_SAMPLE_RATE), o = !!t && "false" !== p.default.env.SENTRY_ENABLED && "false" !== p.default.env.NEXT_PUBLIC_SENTRY_ENABLED, {
                    dsn: t ?? void 0,
                    environment: n,
                    release: r,
                    sampleRate: a,
                    tracesSampleRate: i,
                    enabled: o
                }),
                h = "client" === s ? [Z({
                    detectRedirects: !0,
                    ignoreResourceSpans: ["resource.link", "resource.script", "resource.css", "resource.img", "resource.iframe"],
                    traceFetch: !1,
                    traceXHR: !1
                })] : [],
                m = u?.dsn ?? f.dsn,
                g = u?.environment ?? f.environment,
                v = u?.release ?? f.release,
                y = u?.sampleRate ?? f.sampleRate ?? 0,
                b = u?.tracesSampleRate ?? f.tracesSampleRate ?? 0,
                w = u?.enabled ?? (f.enabled && !!m),
                _ = {
                    dsn: m,
                    enabled: w,
                    environment: g,
                    release: v,
                    sampleRate: y,
                    tracesSampleRate: b,
                    tracesSampler: e => {
                        if (void 0 !== e.parentSampled) return +!!e.parentSampled;
                        let t = (e.name || window.location.pathname || "").toLowerCase(),
                            n = c ? Object.values(c).find(e => e.pattern.test(t))?.sampleRate : void 0;
                        return n ? n : b < 0 ? 0 : b > 1 ? 1 : b
                    },
                    integrations: h,
                    initialScope: {
                        tags: {
                            app: l,
                            runtime: s
                        }
                    },
                    beforeSend: e => "client" !== s || ! function(e) {
                        let t, n = e.breadcrumbs?.map(e => {
                            let t = null != e.data ? (0, er.serialize)(e.data).getOrDefault("") : "";
                            return [e.message, t].filter(Boolean).join(" ")
                        }).join(" ") ?? "";
                        return !!(n.length > 0 && eh.some(e => e.test(n))) || null != (t = e.exception?.values) && 0 !== t.length && t.every(e => {
                            let t;
                            if ("TypeError" !== e.type) return !1;
                            let n = ev.exec(e.value ?? "")?.[1];
                            return null != n && (t = n.replace(/:\d+$/, "").toLowerCase(), !ey.some(e => e.startsWith(".") ? t === e.slice(1) || t.endsWith(e) : t === e))
                        })
                    }(e) ? e : null
                };
            return "client" === s && (_.denyUrls = em, _.ignoreErrors = eg, _.beforeSendTransaction = e => (! function(e, t, n) {
                try {
                    let r, a = function(e, t) {
                        let n = e.contexts?.trace ?? {},
                            r = e.contexts?.otel,
                            a = n.trace_id,
                            i = n.span_id,
                            o = n.parent_span_id;
                        if (!a) return null;
                        let l = [...r?.resource ? ei([r.resource]) : ei([{
                                "service.name": "web"
                            }, e.environment ? {
                                "deployment.environment": e.environment
                            } : void 0, {
                                "telemetry.sdk.name": "@sentry/browser"
                            }, e.release ? {
                                "telemetry.sdk.version": e.release
                            } : void 0]), ...ei([{
                                "device.type": eo(t?.deviceInfo?.deviceType),
                                "browser.name": eo(t?.deviceInfo?.browser),
                                "geo.country.iso_code": eo(t?.requestCountryCode)
                            }])],
                            s = [],
                            u = e.contexts?.trace?.op,
                            c = e.contexts?.trace?.status,
                            d = function(e) {
                                if (!e || "object" != typeof e) return [];
                                let t = [];
                                for (let [n, r] of Object.entries(e))
                                    if ("number" == typeof r.value && eu.has(n)) {
                                        let e = "cls" === n ? 1e3 * r.value : r.value;
                                        t.push({
                                            key: `browser.web_vital.${n}`,
                                            value: {
                                                intValue: String(Math.round(e))
                                            }
                                        })
                                    } return t
                            }(e.measurements),
                            f = r?.attributes ? [...ei([r.attributes]), ...d] : [...ei([e.tags, {
                                "sentry.transaction": e.transaction
                            }, {
                                "sentry.op": u
                            }, u ? {
                                op: u
                            } : void 0, e.platform ? {
                                platform: e.platform
                            } : void 0, e.release ? {
                                release: e.release
                            } : void 0, "boolean" == typeof n.sampled ? {
                                sampled: n.sampled
                            } : void 0]), ...d];
                        for (let t of (s.push({
                                traceId: a,
                                spanId: i ?? "0000000000000000",
                                parentSpanId: o,
                                name: e.transaction ?? "unknown",
                                kind: es(u),
                                startTimeUnixNano: ea(e.start_timestamp),
                                endTimeUnixNano: ea(e.timestamp),
                                attributes: f,
                                status: el(c)
                            }), Array.isArray(e.spans) ? e.spans : [])) {
                            let e = t.description ?? t.op ?? "unknown",
                                n = t.op,
                                r = t.status,
                                o = ei([t.data, t.tags, n ? {
                                    op: n
                                } : void 0, {
                                    "sentry.op": n
                                }]),
                                l = {
                                    traceId: a,
                                    spanId: t.span_id ?? "0000000000000000",
                                    parentSpanId: t.parent_span_id ?? i,
                                    name: e,
                                    kind: es(n),
                                    startTimeUnixNano: ea(t.start_timestamp),
                                    endTimeUnixNano: ea(t.timestamp),
                                    attributes: o,
                                    status: el(r)
                                };
                            s.push(l)
                        }
                        return {
                            resourceSpans: [{
                                resource: {
                                    attributes: l
                                },
                                scopeSpans: [{
                                    scope: {
                                        name: "@sentry/browser",
                                        version: e.sdk?.version
                                    },
                                    spans: s
                                }]
                            }]
                        }
                    }(t, n);
                    if (null == a) return;
                    (r = er.serialize(a)).isErr() || fetch(e, {
                        method: "POST",
                        body: r.value,
                        headers: {
                            "content-type": "application/json"
                        }
                    }).then(e => {
                        e.ok || console.error("[OTEL DEBUG] Failed to send:", e.status, e.statusText)
                    }, e => {
                        console.error("[OTEL DEBUG] Fetch error:", e)
                    }).catch(e => {
                        console.error("[OTEL DEBUG] Catch error:", e)
                    })
                } catch (e) {
                    console.error("[OTEL DEBUG] sendToOtel error:", e)
                }
            }(function(e) {
                let {
                    production: t,
                    domainName: n
                } = function(e, t) {
                    let n = t?.domain;
                    if (null != n) {
                        let [e] = n.split("."), r = e?.trim().toLowerCase();
                        return {
                            production: t?.isTestingSite === "false",
                            domainName: null != r && r.length > 0 ? r : ec
                        }
                    }
                    if ("localhost" === e) return {
                        production: !1,
                        domainName: ec
                    };
                    let r = e.toLowerCase().split("."),
                        a = r.slice(-2).join("."),
                        i = r.find(e => e.startsWith("sitetest"));
                    return "roblox.com" === a || "simulprod.com" === a || "rblx.org" === a ? {
                        production: !0,
                        domainName: "roblox"
                    } : null != i ? {
                        production: !1,
                        domainName: i
                    } : {
                        production: !1,
                        domainName: ec
                    }
                }(e, void 0);
                return t ? "https://tracing.roblox.com/v1/traces" : ef[n.toLowerCase()] ?? ed
            }(eb.EnvironmentUrls.domain), e, d), e)), _
        }({
            appName: t,
            runtime: n,
            overrides: r,
            traceSamplerRegexSettings: i,
            tracingResources: o
        });
        a && (l = a(l)),
            function(e) {
                var t;
                let n, r, a, i, o;
                et && (0, h.consoleSandbox)(() => {
                    console.warn("[@sentry/nextjs] You are calling `Sentry.init()` more than once on the client. This can happen if you have both a `sentry.client.config.ts` and a `instrumentation-client.ts` file with `Sentry.init()` calls. It is recommended to call `Sentry.init()` once in `instrumentation-client.ts`.")
                }), et = !0, !_ && e.debug && (0, h.consoleSandbox)(() => {
                    console.warn("[@sentry/nextjs] You have enabled `debug: true`, but Sentry debug logging was removed from your bundle (likely via `withSentryConfig({ disableLogger: true })` / `webpack.treeshake.removeDebugLogging: true`). Set that option to `false` to see Sentry debug output.")
                }), ("u" < typeof __SENTRY_TRACING__ || __SENTRY_TRACING__) && function() {
                    x.WINDOW.document && function(e) {
                        let t = L(e) || e,
                            n = X.get(t);
                        if (void 0 !== n) return n;
                        let r = A();
                        if (!r?.isrRoutes || !Array.isArray(r.isrRoutes) || 0 === r.isrRoutes.length) return X.set(t, !1), !1;
                        let a = r.isrRoutes.includes(t);
                        return X.set(t, a), a
                    }(x.WINDOW.location.pathname) && (e("sentry-trace"), e("baggage"));

                    function e(e) {
                        try {
                            let t = x.WINDOW.document.querySelector(`meta[name="${e}"]`);
                            t && t.remove()
                        } catch {}
                    }
                }();
                let l = {
                    environment: e.environment || p.default.env.SENTRY_ENVIRONMENT || ((n = p.default.env.NEXT_PUBLIC_VERCEL_ENV) ? `vercel-${n}` : void 0) || "production",
                    defaultIntegrations: (t = e, r = (0, w.getDefaultIntegrations)(t), ("u" < typeof __SENTRY_TRACING__ || __SENTRY_TRACING__) && r.push(Z()), a = en._sentryRewriteFramesAssetPrefixPath || "", i = p.default.env._sentryBasePath || en._sentryBasePath, o = "true" === p.default.env._experimentalThirdPartyOriginStackFrames || "true" === en._experimentalThirdPartyOriginStackFrames, r.push(Y({
                        assetPrefix: "https://www-assets.roblox.com",
                        basePath: i,
                        rewriteFramesAssetPrefixPath: a,
                        experimentalThirdPartyOriginStackFrames: o
                    })), r),
                    release: p.default.env._sentryRelease || en._sentryRelease,
                    ...e
                };
                ! function(e) {
                    let t = p.default.env._sentryRewritesTunnelPath || ee._sentryRewritesTunnelPath;
                    if (t && e.dsn) {
                        let n = (0, J.dsnFromString)(e.dsn);
                        if (!n) return;
                        let r = n.host.match(/^o(\d+)\.ingest(?:\.([a-z]{2}))?\.sentry\.io$/);
                        if (r) {
                            let a = r[1],
                                i = r[2],
                                o = `${t}?o=${a}&p=${n.projectId}`;
                            i && (o += `&r=${i}`), e.tunnel = o, _ && h.debug.log(`Tunneling events to "${o}"`)
                        } else _ && h.debug.warn("Provided DSN is not a Sentry SaaS DSN. Will not tunnel events.")
                    }
                }(l), (0, g.applySdkMetadata)(l, "nextjs", ["nextjs", "react"]), (0, b.init)(l);
                let s = e => "transaction" === e.type && "/404" === e.transaction ? null : e;
                s.id = "NextClient404Filter", (0, v.addEventProcessor)(s);
                let u = e => "transaction" === e.type && e.transaction === M ? null : e;
                u.id = "IncompleteTransactionFilter", (0, v.addEventProcessor)(u);
                let c = (e, t) => {
                    var n;
                    return (n = t?.originalException, (0, S.isError)(n) && "string" == typeof n.digest && n.digest.startsWith("NEXT_REDIRECT;") || e.exception?.values?.[0]?.value === "NEXT_REDIRECT") ? null : e
                };
                c.id = "NextRedirectErrorFilter", (0, v.addEventProcessor)(c);
                try {
                    (0, y.getGlobalScope)().setTag("turbopack", !0)
                } catch {}
            }(l), globalThis[e_] = !0
    }({
        appName: "www-nextjs",
        runtime: "client",
        overrides: {
            dsn: eO("data-dsn"),
            environment: eO("data-env"),
            release: eO("data-release"),
            enabled: !!(a = eO("data-enabled")) && ("true" === a || "1" === a),
            sampleRate: eR("data-sample-rate", 0),
            tracesSampleRate: eR("data-traces-sample-rate", 0)
        },
        traceSamplerRegexSettings: {
            downloadPageRegex: {
                pattern: /^\/download\/?$/i,
                sampleRate: 1
            },
            loginRedirectRegex: {
                pattern: /^\/login-redirect\/?$/i,
                sampleRate: 1
            }
        },
        tracingResources: eP,
        configure: e => {
            var t;
            return e.dsn ? {
                ...e,
                transport: (t = e.dsn, (0, eT.makeMultiplexedTransport)(e => (0, ex.makeBrowserOfflineTransport)(eE.makeFetchTransport)({
                    ...e,
                    dbName: `sentry-offline:${e.url}`
                }), e => {
                    let n = [t];
                    return e.getEvent(["event"]) && n.push(eS), n
                }))
            } : e
        }
    });
    var eI = e.i(332507),
        eA = e.i(84193),
        eL = e.i(459557),
        eD = e.i(682259),
        eM = e.i(360702),
        ez = e.i(646424),
        eF = e.i(849735),
        ej = e.i(874775),
        eU = e.i(734899),
        eB = function(e, t) {
            return (eB = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
            })(e, t)
        };

    function eq(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function n() {
            this.constructor = e
        }
        eB(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
    }
    var e$ = function() {
        return (e$ = Object.assign || function(e) {
            for (var t, n = 1, r = arguments.length; n < r; n++)
                for (var a in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, a) && (e[a] = t[a]);
            return e
        }).apply(this, arguments)
    };

    function eV(e, t, n, r) {
        return new(n || (n = Promise))(function(a, i) {
            function o(e) {
                try {
                    s(r.next(e))
                } catch (e) {
                    i(e)
                }
            }

            function l(e) {
                try {
                    s(r.throw(e))
                } catch (e) {
                    i(e)
                }
            }

            function s(e) {
                var t;
                e.done ? a(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(o, l)
            }
            s((r = r.apply(e, t || [])).next())
        })
    }

    function eW(e, t) {
        var n, r, a, i = {
                label: 0,
                sent: function() {
                    if (1 & a[0]) throw a[1];
                    return a[1]
                },
                trys: [],
                ops: []
            },
            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return o.next = l(0), o.throw = l(1), o.return = l(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
            return this
        }), o;

        function l(l) {
            return function(s) {
                var u = [l, s];
                if (n) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, u[0] && (i = 0)), i;) try {
                    if (n = 1, r && (a = 2 & u[0] ? r.return : u[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, u[1])).done) return a;
                    switch (r = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                        case 0:
                        case 1:
                            a = u;
                            break;
                        case 4:
                            return i.label++, {
                                value: u[1],
                                done: !1
                            };
                        case 5:
                            i.label++, r = u[1], u = [0];
                            continue;
                        case 7:
                            u = i.ops.pop(), i.trys.pop();
                            continue;
                        default:
                            if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                i = 0;
                                continue
                            }
                            if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                i.label = u[1];
                                break
                            }
                            if (6 === u[0] && i.label < a[1]) {
                                i.label = a[1], a = u;
                                break
                            }
                            if (a && i.label < a[2]) {
                                i.label = a[2], i.ops.push(u);
                                break
                            }
                            a[2] && i.ops.pop(), i.trys.pop();
                            continue
                    }
                    u = t.call(e, i)
                } catch (e) {
                    u = [6, e], r = 0
                } finally {
                    n = a = 0
                }
                if (5 & u[0]) throw u[1];
                return {
                    value: u[0] ? u[1] : void 0,
                    done: !0
                }
            }
        }
    }
    "function" == typeof SuppressedError && SuppressedError;
    var eK = function() {
            function e(e) {
                void 0 === e && (e = {}), this.configuration = e
            }
            return Object.defineProperty(e.prototype, "config", {
                set: function(e) {
                    this.configuration = e
                },
                enumerable: !1,
                configurable: !0
            }), Object.defineProperty(e.prototype, "basePath", {
                get: function() {
                    return this.configuration.basePath
                },
                enumerable: !1,
                configurable: !0
            }), Object.defineProperty(e.prototype, "fetchApi", {
                get: function() {
                    return this.configuration.fetchApi || window.fetch.bind(window)
                },
                enumerable: !1,
                configurable: !0
            }), Object.defineProperty(e.prototype, "middleware", {
                get: function() {
                    return this.configuration.middleware || []
                },
                enumerable: !1,
                configurable: !0
            }), Object.defineProperty(e.prototype, "queryParamsStringify", {
                get: function() {
                    return this.configuration.queryParamsStringify || function e(t, n) {
                        return void 0 === n && (n = ""), Object.keys(t).map(function(r) {
                            return function t(n, r, a) {
                                void 0 === a && (a = "");
                                var i = a + (a.length ? "[".concat(n, "]") : n);
                                if (r instanceof Array) {
                                    var o = r.map(function(e) {
                                        return encodeURIComponent(String(e))
                                    }).join("&".concat(encodeURIComponent(i), "="));
                                    return "".concat(encodeURIComponent(i), "=").concat(o)
                                }
                                return r instanceof Set ? t(n, Array.from(r), a) : r instanceof Date ? "".concat(encodeURIComponent(i), "=").concat(encodeURIComponent(r.toISOString())) : r instanceof Object ? e(r, i) : "".concat(encodeURIComponent(i), "=").concat(encodeURIComponent(String(r)))
                            }(r, t[r], n)
                        }).filter(function(e) {
                            return e.length > 0
                        }).join("&")
                    }
                },
                enumerable: !1,
                configurable: !0
            }), Object.defineProperty(e.prototype, "username", {
                get: function() {
                    return this.configuration.username
                },
                enumerable: !1,
                configurable: !0
            }), Object.defineProperty(e.prototype, "password", {
                get: function() {
                    return this.configuration.password
                },
                enumerable: !1,
                configurable: !0
            }), Object.defineProperty(e.prototype, "apiKey", {
                get: function() {
                    var e = this.configuration.apiKey;
                    if (e) return "function" == typeof e ? e : function() {
                        return e
                    }
                },
                enumerable: !1,
                configurable: !0
            }), Object.defineProperty(e.prototype, "accessToken", {
                get: function() {
                    var e = this,
                        t = this.configuration.accessToken;
                    if (t) return "function" == typeof t ? t : function() {
                        return eV(e, void 0, void 0, function() {
                            return eW(this, function(e) {
                                return [2, t]
                            })
                        })
                    }
                },
                enumerable: !1,
                configurable: !0
            }), Object.defineProperty(e.prototype, "headers", {
                get: function() {
                    return this.configuration.headers
                },
                enumerable: !1,
                configurable: !0
            }), Object.defineProperty(e.prototype, "credentials", {
                get: function() {
                    return this.configuration.credentials
                },
                enumerable: !1,
                configurable: !0
            }), e
        }(),
        eH = new eK,
        eZ = function() {
            function e(e) {
                void 0 === e && (e = eH);
                var t = this;
                this.configuration = e, this.fetchApi = function(e, n) {
                    return eV(t, void 0, void 0, function() {
                        var t, r, a, i, o, l, s, u, c, d, f, p;
                        return eW(this, function(h) {
                            switch (h.label) {
                                case 0:
                                    t = {
                                        url: e,
                                        init: n
                                    }, r = 0, a = this.middleware, h.label = 1;
                                case 1:
                                    return r < a.length ? (p = a[r]).pre ? [4, p.pre(e$({
                                        fetch: this.fetchApi
                                    }, t))] : [3, 3] : [3, 4];
                                case 2:
                                    t = h.sent() || t, h.label = 3;
                                case 3:
                                    return r++, [3, 1];
                                case 4:
                                    i = void 0, o = performance.now(), h.label = 5;
                                case 5:
                                    return h.trys.push([5, 7, , 12]), [4, (this.configuration.fetchApi || fetch)(t.url, t.init)];
                                case 6:
                                    return i = h.sent(), l = performance.now(), [3, 12];
                                case 7:
                                    s = h.sent(), l = performance.now(), u = 0, c = this.middleware, h.label = 8;
                                case 8:
                                    return u < c.length ? (p = c[u]).onError ? [4, p.onError({
                                        fetch: this.fetchApi,
                                        url: t.url,
                                        init: t.init,
                                        error: s,
                                        response: i ? i.clone() : void 0
                                    })] : [3, 10] : [3, 11];
                                case 9:
                                    i = h.sent() || i, h.label = 10;
                                case 10:
                                    return u++, [3, 8];
                                case 11:
                                    if (void 0 === i) throw s instanceof Error ? new eQ(s, "The request failed and the interceptors did not return an alternative response") : s;
                                    return [3, 12];
                                case 12:
                                    d = 0, f = this.middleware, h.label = 13;
                                case 13:
                                    return d < f.length ? (p = f[d]).post ? [4, p.post({
                                        fetch: this.fetchApi,
                                        url: t.url,
                                        init: t.init,
                                        response: i.clone(),
                                        elapsedTime: l - o
                                    })] : [3, 15] : [3, 16];
                                case 14:
                                    i = h.sent() || i, h.label = 15;
                                case 15:
                                    return d++, [3, 13];
                                case 16:
                                    return [2, i]
                            }
                        })
                    })
                }, this.middleware = e.middleware
            }
            return e.prototype.withMiddleware = function() {
                for (var e, t = [], n = 0; n < arguments.length; n++) t[n] = arguments[n];
                var r = this.clone();
                return r.middleware = (e = r.middleware).concat.apply(e, t), r
            }, e.prototype.withPreMiddleware = function() {
                for (var e = [], t = 0; t < arguments.length; t++) e[t] = arguments[t];
                var n = e.map(function(e) {
                    return {
                        pre: e
                    }
                });
                return this.withMiddleware.apply(this, n)
            }, e.prototype.withPostMiddleware = function() {
                for (var e = [], t = 0; t < arguments.length; t++) e[t] = arguments[t];
                var n = e.map(function(e) {
                    return {
                        post: e
                    }
                });
                return this.withMiddleware.apply(this, n)
            }, e.prototype.isJsonMime = function(t) {
                return !!t && e.jsonRegex.test(t)
            }, e.prototype.request = function(e, t) {
                return eV(this, void 0, void 0, function() {
                    var n, r, a, i;
                    return eW(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return [4, this.createFetchParams(e, t)];
                            case 1:
                                return r = (n = o.sent()).url, a = n.init, [4, this.fetchApi(r, a)];
                            case 2:
                                if ((i = o.sent()) && i.status >= 200 && i.status < 300) return [2, i];
                                throw new eG(i, "Response from ".concat(i.url, " returned an error code ").concat(i.status))
                        }
                    })
                })
            }, e.prototype.createFetchParams = function(e, t) {
                return eV(this, void 0, void 0, function() {
                    var n, r, a, i, o, l, s, u = this;
                    return eW(this, function(c) {
                        var d, f;
                        switch (c.label) {
                            case 0:
                                return n = this.configuration.basePath + e.path, void 0 !== e.query && 0 !== Object.keys(e.query).length && (n += "?" + this.configuration.queryParamsStringify(e.query)), Object.keys(r = Object.assign({}, this.configuration.headers, e.headers)).forEach(function(e) {
                                    return void 0 === r[e] ? delete r[e] : {}
                                }), a = "function" == typeof t ? t : function() {
                                    return eV(u, void 0, void 0, function() {
                                        return eW(this, function(e) {
                                            return [2, t]
                                        })
                                    })
                                }, i = {
                                    method: e.method,
                                    headers: r,
                                    body: e.body,
                                    credentials: this.configuration.credentials
                                }, l = [e$({}, i)], [4, a({
                                    init: i,
                                    context: e
                                })];
                            case 1:
                                return o = e$.apply(void 0, l.concat([c.sent()])), s = e$(e$({}, o), {
                                    body: (d = o.body, "u" > typeof FormData && d instanceof FormData || o.body instanceof URLSearchParams || (f = o.body, "u" > typeof Blob && f instanceof Blob) ? o.body : JSON.stringify(o.body))
                                }), [2, {
                                    url: n,
                                    init: s
                                }]
                        }
                    })
                })
            }, e.prototype.clone = function() {
                var e = new(0, this.constructor)(this.configuration);
                return e.middleware = this.middleware.slice(), e
            }, e.jsonRegex = RegExp("^(:?application/json|[^;/ 	]+/[^;/ 	]+[+]json)[ 	]*(:?;.*)?$", "i"), e
        }(),
        eG = function(e) {
            function t(t, n) {
                var r = e.call(this, n) || this;
                return r.response = t, r.name = "ResponseError", r
            }
            return eq(t, e), t
        }(Error),
        eQ = function(e) {
            function t(t, n) {
                var r = e.call(this, n) || this;
                return r.cause = t, r.name = "FetchError", r
            }
            return eq(t, e), t
        }(Error),
        eY = function(e) {
            function t(t, n) {
                var r = e.call(this, n) || this;
                return r.field = t, r.name = "RequiredError", r
            }
            return eq(t, e), t
        }(Error);

    function eX(e, t) {
        return null != e[t]
    }
    var eJ, e0, e1 = function() {
            function e(e, t) {
                void 0 === t && (t = function(e) {
                    return e
                }), this.raw = e, this.transformer = t
            }
            return e.prototype.value = function() {
                return eV(this, void 0, void 0, function() {
                    var e;
                    return eW(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return e = this.transformer, [4, this.raw.json()];
                            case 1:
                                return [2, e.apply(this, [t.sent()])]
                        }
                    })
                })
            }, e
        }(),
        e2 = ((function(e) {
            this.raw = e
        }).prototype.value = function() {
            return eV(this, void 0, void 0, function() {
                return eW(this, function(e) {
                    return [2, void 0]
                })
            })
        }, (function(e) {
            this.raw = e
        }).prototype.value = function() {
            return eV(this, void 0, void 0, function() {
                return eW(this, function(e) {
                    switch (e.label) {
                        case 0:
                            return [4, this.raw.blob()];
                        case 1:
                            return [2, e.sent()]
                    }
                })
            })
        }, function() {
            function e(e) {
                this.raw = e
            }
            return e.prototype.value = function() {
                return eV(this, void 0, void 0, function() {
                    return eW(this, function(e) {
                        switch (e.label) {
                            case 0:
                                return [4, this.raw.text()];
                            case 1:
                                return [2, e.sent()]
                        }
                    })
                })
            }, e
        }()),
        e4 = "x-csrf-token",
        e3 = function() {
            function e() {
                var e;
                try {
                    if ("u" > typeof window) return void(this.currentToken = null != (e = localStorage.getItem(e4)) ? e : "")
                } catch (e) {
                    console.warn("Error reading localStorage key “".concat(e4, "”:"), e)
                }
                this.currentToken = ""
            }
            return e.prototype.storeCRSFToken = function(e) {
                this.currentToken = e;
                try {
                    "u" > typeof window && localStorage.setItem(e4, e)
                } catch (e) {
                    console.warn("Error setting localStorage key “".concat(e4, "”:"), e)
                }
            }, e.prototype.pre = function(e) {
                var t = e.url,
                    n = e.init,
                    r = this.currentToken;
                return n.headers && "object" == typeof n.headers && e4 in n.headers && (r = n.headers[e4]) && this.storeCRSFToken(r), "POST" === n.method || "PATCH" === n.method || "DELETE" === n.method || "PUT" === n.method ? Promise.resolve({
                    url: t,
                    init: this.prepareRequestInit(n)
                }) : Promise.resolve({
                    url: t,
                    init: n
                })
            }, e.prototype.post = function(e) {
                var t = e.fetch,
                    n = e.url,
                    r = e.init,
                    a = e.response,
                    i = a.headers.get(e4);
                return 403 === a.status && a.headers.has(e4) && null !== i ? (this.storeCRSFToken(i), t(n, this.prepareRequestInit(r))) : Promise.resolve(a)
            }, e.prototype.prepareRequestInit = function(e) {
                var t;
                return e$(e$({}, e), {
                    headers: e$(e$({}, e.headers), ((t = {})[e4] = this.currentToken, t))
                })
            }, e
        }(),
        e5 = "rblx-challenge-id",
        e8 = "rblx-challenge-type",
        e9 = "rblx-challenge-metadata";
    (tg = e0 || (e0 = {})).UNKNOWN = "unknown", tg.INVALIDATED = "invalidated", tg.ABANDONED = "abandoned", tg.LOADFAILED = "loadfailed";
    var e6 = function(e) {
            function t(t) {
                var n = e.call(this, "challenge error for challenge kind ".concat(t.kind)) || this;
                return n.parameters = t, n
            }
            return eq(t, e), t.prototype.match = function(e) {
                return this.parameters.kind === e.parameters.kind && JSON.stringify(this.parameters.data) === JSON.stringify(e.parameters.data)
            }, t.prototype.matchAbandoned = function(e) {
                return this.match(e) && e.parameters.kind === e0.ABANDONED
            }, t
        }(Error),
        e7 = function() {
            function e(e, t) {
                void 0 === t && (t = "iframe"), this.robloxSiteDomain = e, this.genericChallengeMiddlewareType = t, this.challengeLifecycleListener = null
            }
            return e.prototype.getTargetSubdomain = function() {
                return window.location.hostname.split(".").slice(0, -2).join(".")
            }, e.prototype.constructHybridChallengeFrameURL = function(e) {
                var t, n, r, a, i = new URLSearchParams([
                    ["challenge-type", "generic"],
                    ["dark-mode", "true"],
                    ["barista-mode", "true"],
                    ["generic-challenge-type", null != (t = e.headers.get(e8)) ? t : ""],
                    ["generic-challenge-id", null != (n = e.headers.get(e5)) ? n : ""],
                    ["challenge-metadata-json", null != (r = e.headers.get(e9)) ? r : ""],
                    ["origin", null != (a = this.getTargetSubdomain()) ? a : ""]
                ]);
                return new URL("https://www.".concat(this.robloxSiteDomain, "/challenge/cdn/hybrid?").concat(i.toString()))
            }, e.prototype.removeChallengeLifecycleListener = function() {
                this.challengeLifecycleListener && window.removeEventListener("message", this.challengeLifecycleListener, !1)
            }, e.prototype.createChallengeLifecycleListener = function(e, t, n, r) {
                var a = this;
                return function(i) {
                    var o, l, s, u, c, d;
                    if (i.data && i.data.genericChallengeResponse) {
                        var f, p, h, m, g, v = t.fetch,
                            y = t.url,
                            b = t.init,
                            w = t.response;
                        switch (i.data.genericChallengeResponse.type) {
                            case "challengeAbandoned":
                                a.removeChallengeLifecycleListener(), e.remove(), r(new e6({
                                    kind: e0.ABANDONED,
                                    data: {
                                        challengeType: null != (o = w.headers.get(e8)) ? o : ""
                                    }
                                }));
                                break;
                            case "challengeDisplayed":
                                break;
                            case "challengeCompleted":
                                a.removeChallengeLifecycleListener(), e.remove(), (g = i.data.genericChallengeResponse.data).challengeType && g.metadata ? n(v(y, (f = g.metadata, e$(e$({}, b), {
                                    headers: e$(e$({}, b.headers), ((p = {})[e5] = null != (h = w.headers.get(e5)) ? h : "", p[e9] = btoa(JSON.stringify(f)), p[e8] = null != (m = w.headers.get(e8)) ? m : "", p))
                                })))) : r(new e6({
                                    kind: e0.UNKNOWN,
                                    data: {
                                        challengeType: null != (l = w.headers.get(e8)) ? l : ""
                                    }
                                }));
                                break;
                            case "challengeInvalidated":
                                a.removeChallengeLifecycleListener(), e.remove(), (g = i.data.genericChallengeResponse.data) && g.challengeType && g.metadata ? r(new e6({
                                    kind: e0.INVALIDATED,
                                    data: g
                                })) : r(new e6({
                                    kind: e0.INVALIDATED,
                                    data: {
                                        challengeType: null != (s = w.headers.get(e8)) ? s : ""
                                    }
                                }));
                                break;
                            case "challengeParsed":
                                !1 === (g = i.data.genericChallengeResponse.data).parsed && (a.removeChallengeLifecycleListener(), e.remove(), r(new e6({
                                    kind: e0.UNKNOWN,
                                    data: {
                                        challengeType: null != (u = w.headers.get(e8)) ? u : ""
                                    }
                                })));
                                break;
                            case "challengeInitialized":
                                !1 === (g = i.data.genericChallengeResponse.data).initialized && (a.removeChallengeLifecycleListener(), e.remove(), r(new e6({
                                    kind: e0.UNKNOWN,
                                    data: {
                                        challengeType: null != (c = w.headers.get(e8)) ? c : ""
                                    }
                                })));
                                break;
                            case "challengePageLoaded":
                                !1 === (g = i.data.genericChallengeResponse.data).pageLoaded && (a.removeChallengeLifecycleListener(), e.remove(), r(new e6({
                                    kind: e0.LOADFAILED,
                                    data: {
                                        challengeType: null != (d = w.headers.get(e8)) ? d : ""
                                    }
                                })))
                        }
                    }
                }
            }, e.prototype.startChallengeLifecycleListener = function(e, t, n, r) {
                window && e && (this.challengeLifecycleListener = this.createChallengeLifecycleListener(e, t, n, r), window.addEventListener("message", this.challengeLifecycleListener, !1))
            }, e.prototype.post = function(e) {
                var t = this,
                    n = e.response;
                return 403 === n.status && n.headers.has(e5) && n.headers.has(e8) && n.headers.has(e9) && "iframe" === this.genericChallengeMiddlewareType ? new Promise(function(r, a) {
                    var i, o, l;
                    t.startChallengeLifecycleListener((i = t.constructHybridChallengeFrameURL(n), (o = document.createElement("iframe")).id = "challenge-frame", o.allowFullscreen = !0, o.setAttribute("allowtransparency", "true"), o.setAttribute("allow", "publickey-credentials-get;publickey-credentials-create"), o.style.cssText = "position: fixed; top: 0; left: 0; width: 100%; height: 100%; visibility: hidden; color-scheme: normal; border: none; z-index: 2147483647;", o.src = i.toString(), o.onload = function() {
                        o.style.visibility = "visible"
                    }, l = o, document && document.body ? document.body.appendChild(l) : null), e, r, a)
                }) : Promise.resolve(n)
            }, e
        }(),
        te = function() {
            var e = window.location.hostname.split(".").slice(0, -2).join(".");
            return e.includes("create") ? "creator_hub" : e.includes("advertise") ? "ads_manager" : "creator_hub"
        },
        tt = function(e, t) {
            try {
                fetch("https://apis.".concat(e, "/account-security-service/v1/metrics/record"), {
                    method: "POST",
                    body: JSON.stringify({
                        name: "load_time_hba_frame",
                        value: t,
                        labelValues: {
                            origin_site: te()
                        }
                    })
                })
            } catch (e) {}
        },
        tn = function(e, t) {
            try {
                fetch("https://apis.".concat(e, "/account-security-service/v1/metrics/record"), {
                    method: "POST",
                    body: JSON.stringify({
                        name: "response_time_hba_frame",
                        value: t,
                        labelValues: {
                            origin_site: te()
                        }
                    })
                })
            } catch (e) {}
        },
        tr = function(e, t, n, r, a, i, o) {
            var l;
            if (void 0 === o && (o = ta), window) {
                var s, u = performance.now(),
                    c = window.setTimeout(function() {
                        tn(n, performance.now() - u),
                            function(e) {
                                try {
                                    fetch("https://apis.".concat(e, "/account-security-service/v1/metrics/record"), {
                                        method: "POST",
                                        body: JSON.stringify({
                                            name: "event_hba_frame",
                                            value: 1,
                                            labelValues: {
                                                event_type: "FrameResponseTimedOut",
                                                origin_site: te()
                                            }
                                        })
                                    })
                                } catch (e) {}
                            }(n), e({
                                url: a.url,
                                init: a.init
                            })
                    }, o),
                    d = s = function(t) {
                        var r = t.data,
                            o = a.url,
                            l = a.init;
                        if (t.origin === "https://www.".concat(n) && "dataFromHbaFrame" === r.msg && "batHeader" === r.data.type && (!r.data.identifier || r.data.identifier === i))
                            if (!r.data.isError && r.data.batHeader) {
                                window.clearTimeout(c), window.removeEventListener("message", s, !1), tn(n, performance.now() - u);
                                var d = r.data.batHeader;
                                e({
                                    url: o,
                                    init: e$(e$({}, l), {
                                        headers: e$(e$({}, l.headers), {
                                            "x-bound-auth-token": d["x-bound-auth-token"]
                                        })
                                    })
                                })
                            } else window.clearTimeout(c), window.removeEventListener("message", s, !1), tn(n, performance.now() - u), e({
                                url: o,
                                init: l
                            })
                    };
                window.addEventListener("message", d, !1), null == (l = r.contentWindow) || l.postMessage({
                    msg: "signSubdomainRequest",
                    identifier: i,
                    serializedSubdomainRequestData: JSON.stringify({
                        url: a.url,
                        requestInit: a.init
                    })
                }, "https://www.".concat(n))
            }
        },
        ta = 100,
        ti = function() {
            function e(e, t, n) {
                void 0 === t && (t = 1500), void 0 === n && (n = ta);
                var r = this;
                this.getOrCreateHbaFrame = function() {
                    if (document) {
                        var e, t, n, a = document.getElementById("hba-frame");
                        return null === a && (e = r.robloxSiteDomain, (t = document.createElement("iframe")).id = "hba-frame", t.style.cssText = "position: fixed; top: 0; left: 0; width: 0%; height: 0%; z-index: -1", t.src = "https://www.".concat(e, "/hba/iframe"), n = t, a = (null == document ? void 0 : document.body) ? document.body.appendChild(n) : null), a
                    }
                    return null
                }, this.robloxSiteDomain = e, this.hbaFrameAlreadyLoaded = !1, this.hbaFrameLoadFailed = !1, this.hbaFrame = null, this.loadTimeOut = t, this.dataTimeOut = n
            }
            return e.prototype.pre = function(e) {
                var t = this;
                return new Promise(function(n, r) {
                    var a = e.url,
                        i = e.init;
                    if (t.hbaFrame = t.getOrCreateHbaFrame(), null !== t.hbaFrame) {
                        var o, l, s, u = crypto.randomUUID();
                        t.hbaFrameAlreadyLoaded ? tr(n, 0, t.robloxSiteDomain, t.hbaFrame, e, u, t.dataTimeOut) : t.hbaFrameLoadFailed ? n({
                            url: a,
                            init: i
                        }) : (o = t.robloxSiteDomain, l = t.hbaFrame, void 0 === (s = t.loadTimeOut) && (s = 1500), new Promise(function(e, t) {
                            var n, r, a = performance.now(),
                                i = window.setTimeout(function() {
                                    tt(o, performance.now() - a),
                                        function(e) {
                                            try {
                                                fetch("https://apis.".concat(e, "/account-security-service/v1/metrics/record"), {
                                                    method: "POST",
                                                    body: JSON.stringify({
                                                        name: "event_hba_frame",
                                                        value: 1,
                                                        labelValues: {
                                                            event_type: "FrameLoadTimedOut",
                                                            origin_site: te()
                                                        }
                                                    })
                                                })
                                            } catch (e) {}
                                        }(o), t(Error("Promise timed out after ".concat(s, " ms")))
                                }, s),
                                u = n = function(t) {
                                    var r = t.data;
                                    t.origin === "https://www.".concat(o) && "dataFromHbaFrame" === r.msg && "loaded" === r.data.type && (window.removeEventListener("message", n, !1), window.clearTimeout(i), tt(o, performance.now() - a), e())
                                };
                            window.addEventListener("message", u, !1), null == (r = l.contentWindow) || r.postMessage({
                                msg: "checkLoadedRequest"
                            }, "https://www.".concat(o))
                        })).then(function() {
                            t.hbaFrame ? (t.hbaFrameAlreadyLoaded = !0, tr(n, 0, t.robloxSiteDomain, t.hbaFrame, e, u, t.dataTimeOut)) : n({
                                url: a,
                                init: i
                            })
                        }).catch(function() {
                            t.hbaFrameLoadFailed = !0, n({
                                url: a,
                                init: i
                            })
                        })
                    } else n({
                        url: a,
                        init: i
                    })
                })
            }, e
        }(),
        to = function() {
            function e(e) {
                this.unifiedLogger = e
            }
            return e.prototype.post = function(e) {
                return this.unifiedLogger.logApiVitalsEvent({
                    eventName: "apiVitals",
                    parameters: {
                        elapsedTime: String(e.elapsedTime),
                        apiUrl: e.url,
                        statusCode: String(e.response.status)
                    }
                }), Promise.resolve(e.response)
            }, e
        }(),
        tl = function() {
            function e() {
                this.observers = []
            }
            return e.prototype.subscribe = function(e) {
                var t = this;
                return this.observers.push(e),
                    function() {
                        return t.unsubscribe(e)
                    }
            }, e.prototype.unsubscribe = function(e) {
                this.observers = this.observers.filter(function(t) {
                    return t !== e
                })
            }, e.prototype.post = function(e) {
                var t = e.url,
                    n = e.response;
                return 503 === n.status && this.observers.forEach(function(e) {
                    return e(t)
                }), Promise.resolve(n)
            }, e
        }(),
        ts = function() {
            function t() {}
            return t.prototype.parseUrl = function(e) {
                return e.replace(/#.*$/, "").replace(/\?.*$/, "").replace(/\/\d+/, "/number")
            }, t.prototype.post = function(t) {
                var n = this;
                return e.A(784553).then(function(e) {
                    var r, a = e.captureException;
                    return !1 === t.response.ok && !1 === [401, 403, 404].includes(t.response.status) && a(Error("Network error"), {
                        tags: {
                            apiUrl: n.parseUrl(t.url),
                            apiStatus: null == (r = t.response) ? void 0 : r.status,
                            cors: !1
                        }
                    }), t.response
                })
            }, t.prototype.onError = function(t) {
                var n = this;
                return e.A(784553).then(function(e) {
                    var r;
                    return (0, e.captureException)(Error("Network error"), {
                        tags: {
                            apiUrl: n.parseUrl(t.url),
                            apiStatus: null == (r = t.response) ? void 0 : r.status,
                            cors: !0
                        }
                    }), t.response
                })
            }, t
        }(),
        tu = new e3,
        tc = new tl,
        td = [function(e) {
            return !0 === e.enableSentry ? new ts : void 0
        }, function(e) {
            return e.robloxSiteDomain && e.enableBoundAuthToken ? new ti(e.robloxSiteDomain, e.boundAuthTokenLoadTimeout, e.boundAuthTokenDataTimeout) : void 0
        }, function(e) {
            return e.robloxSiteDomain ? new e7(e.robloxSiteDomain, e.genericChallengeMiddlewareType) : void 0
        }, function(e) {
            return e.unifiedLogger ? new to(e.unifiedLogger) : void 0
        }, function() {
            return tu
        }, function() {
            return tc
        }],
        tf = function(e) {
            function t(t) {
                void 0 === t && (t = {});
                var n = e$({}, t),
                    r = n.middleware || [];
                return r.unshift.apply(r, td.map(function(e) {
                    return e(n)
                }).filter(function(e) {
                    return void 0 !== e
                })), n.middleware = r, e.call(this, n) || this
            }
            return eq(t, e), t
        }(eK),
        tp = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return eq(t, e), t.prototype.registrationRegisterRaw = function(e, t) {
                return eV(this, void 0, void 0, function() {
                    var n, r;
                    return eW(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/register",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            identifier: e.identifier,
                                            key: e.key
                                        }
                                    }(e.registrationRegisterRequest)
                                }, t)];
                            case 1:
                                return [2, new e1(a.sent(), function(e) {
                                    return null == e ? e : {
                                        robloxApiKeyBase64: eX(e, "robloxApiKeyBase64") ? e.robloxApiKeyBase64 : void 0,
                                        robloxSignature: eX(e, "robloxSignature") ? e.robloxSignature : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.registrationRegister = function() {
                return eV(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eW(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.registrationRegisterRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t
        }(eZ),
        th = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return eq(t, e), t.prototype.challengeFetchRaw = function(e, t) {
                return eV(this, void 0, void 0, function() {
                    var n, r, a;
                    return eW(this, function(i) {
                        switch (i.label) {
                            case 0:
                                return n = {}, void 0 !== e.challengeId && (n.challengeId = e.challengeId), void 0 !== e.identifier && (n.identifier = e.identifier), r = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/fetch",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return a = i.sent(), this.isJsonMime(a.headers.get("content-type")) ? [2, new e1(a)] : [2, new e2(a)]
                        }
                    })
                })
            }, t.prototype.challengeFetch = function() {
                return eV(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eW(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.challengeFetchRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.challengeInitSessionRaw = function(e, t) {
                return eV(this, void 0, void 0, function() {
                    var n, r;
                    return eW(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/initSession",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            challengeId: e.challengeId,
                                            userId: e.userId,
                                            timestamp: e.timestamp,
                                            btid: e.btid
                                        }
                                    }(e.challengeInitSessionRequest)
                                }, t)];
                            case 1:
                                return [2, new e1(a.sent(), function(e) {
                                    return null == e ? e : {
                                        content: eX(e, "content") ? e.content : void 0,
                                        expectedNumCalls: eX(e, "expectedNumCalls") ? e.expectedNumCalls : void 0,
                                        expectedSymbols: eX(e, "expectedSymbols") ? e.expectedSymbols : void 0,
                                        identifiersToFetch: eX(e, "identifiersToFetch") ? e.identifiersToFetch : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.challengeInitSession = function() {
                return eV(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eW(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.challengeInitSessionRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.challengeRedeemSessionRaw = function(e, t) {
                return eV(this, void 0, void 0, function() {
                    var n, r;
                    return eW(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/redeemSession",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            userId: e.userId,
                                            challengeId: e.challengeId,
                                            btid: e.btid
                                        }
                                    }(e.challengeRedeemSessionRequest)
                                }, t)];
                            case 1:
                                return [2, new e1(a.sent())]
                        }
                    })
                })
            }, t.prototype.challengeRedeemSession = function() {
                return eV(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eW(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.challengeRedeemSessionRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.challengeSubmitRaw = function(e, t) {
                return eV(this, void 0, void 0, function() {
                    var n, r;
                    return eW(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.referer && null !== e.referer && (r.Referer = String(e.referer)), [4, this.request({
                                    path: "/v1/submit",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            userId: e.userId,
                                            challengeId: e.challengeId,
                                            payload: e.payload,
                                            payloadV2: e.payloadV2,
                                            params: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    key: e.key,
                                                    iv: e.iv
                                                }
                                            }(e.params),
                                            btid: e.btid
                                        }
                                    }(e.challengeSubmitRequest)
                                }, t)];
                            case 1:
                                return [2, new e1(a.sent())]
                        }
                    })
                })
            }, t.prototype.challengeSubmit = function() {
                return eV(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eW(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.challengeSubmitRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.challengeUploadRaw = function(e, t) {
                return eV(this, void 0, void 0, function() {
                    var n, r;
                    return eW(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return n = {}, (r = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (r["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                    path: "/v1/upload",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            identifier: e.identifier,
                                            timestamp: e.timestamp,
                                            fileBase64: e.fileBase64
                                        }
                                    }(e.challengeUploadRequest)
                                }, t)];
                            case 1:
                                return [2, new e1(a.sent(), function(e) {
                                    return null == e ? e : {
                                        scriptLocation: eX(e, "scriptLocation") ? e.scriptLocation : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.challengeUpload = function() {
                return eV(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), eW(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.challengeUploadRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t
        }(eZ);

    function tm(e) {
        var t, n;
        return null == (t = e) ? t : {
            isGeneric: eX(t, "isGeneric") ? t.isGeneric : void 0,
            metadata: eX(t, "metadata") ? null == (n = t.metadata) ? n : {
                accountRestoresPolicyEffectiveTimestamp: eX(n, "accountRestoresPolicyEffectiveTimestamp") ? n.accountRestoresPolicyEffectiveTimestamp : void 0,
                bodyResource: eX(n, "bodyResource") ? n.bodyResource : void 0,
                controllableGroupRobuxBalance: eX(n, "controllableGroupRobuxBalance") ? n.controllableGroupRobuxBalance : void 0,
                dismissalCount: eX(n, "dismissalCount") ? n.dismissalCount : void 0,
                displayType: eX(n, "displayType") ? n.displayType : void 0,
                forceResetTimestamp: eX(n, "forceResetTimestamp") ? n.forceResetTimestamp : void 0,
                headerResource: eX(n, "headerResource") ? n.headerResource : void 0,
                pageRestriction: eX(n, "pageRestriction") ? n.pageRestriction : void 0,
                robuxBalance: eX(n, "robuxBalance") ? n.robuxBalance : void 0,
                showAlertIcon: eX(n, "showAlertIcon") ? n.showAlertIcon : void 0,
                showBanner: eX(n, "showBanner") ? n.showBanner : void 0,
                showXButtonForDisable: eX(n, "showXButtonForDisable") ? n.showXButtonForDisable : void 0,
                tradableItemValue: eX(n, "tradableItemValue") ? n.tradableItemValue : void 0
            } : void 0,
            promptType: eX(t, "promptType") ? t.promptType : void 0
        }
    }
    var tg, tv, ty, tb, tw = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return eq(t, e), t.prototype.answerSecurityQuestionRaw = function(e, t) {
                return eV(this, void 0, void 0, function() {
                    var n, r;
                    return eW(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.answerSecurityQuestionRequest || void 0 === e.answerSecurityQuestionRequest) throw new eY("answerSecurityQuestionRequest", "Required parameter requestParameters.answerSecurityQuestionRequest was null or undefined when calling answerSecurityQuestion.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/security-question",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            answer: e.answer,
                                            sessionId: e.sessionId,
                                            userId: e.userId
                                        }
                                    }(e.answerSecurityQuestionRequest)
                                }, t)];
                            case 1:
                                return [2, new e1(a.sent(), function(e) {
                                    return null == e ? e : {
                                        answerCorrect: eX(e, "answerCorrect") ? e.answerCorrect : void 0,
                                        redemptionToken: eX(e, "redemptionToken") ? e.redemptionToken : void 0,
                                        shouldRequestNewQuestion: eX(e, "shouldRequestNewQuestion") ? e.shouldRequestNewQuestion : void 0,
                                        userWasForceReset: eX(e, "userWasForceReset") ? e.userWasForceReset : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.answerSecurityQuestion = function(e, t) {
                return eV(this, void 0, void 0, function() {
                    return eW(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.answerSecurityQuestionRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.createBotActivityTicketRaw = function(e, t) {
                return eV(this, void 0, void 0, function() {
                    var n, r;
                    return eW(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.createBotActivityTicketRequest || void 0 === e.createBotActivityTicketRequest) throw new eY("createBotActivityTicketRequest", "Required parameter requestParameters.createBotActivityTicketRequest was null or undefined when calling createBotActivityTicket.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/arkose/bot-activity-ticket",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            actionType: e.actionType,
                                            isTestRequest: e.isTestRequest,
                                            osType: e.osType,
                                            secretParameter: e.secretParameter,
                                            standardDeviations: e.standardDeviations
                                        }
                                    }(e.createBotActivityTicketRequest)
                                }, t)];
                            case 1:
                                return [2, new e1(a.sent())]
                        }
                    })
                })
            }, t.prototype.createBotActivityTicket = function(e, t) {
                return eV(this, void 0, void 0, function() {
                    return eW(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.createBotActivityTicketRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.getPromptAssignmentsRaw = function(e, t) {
                return eV(this, void 0, void 0, function() {
                    var n, r;
                    return eW(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.robloxctxAuthenticatedUserid || void 0 === e.robloxctxAuthenticatedUserid) throw new eY("robloxctxAuthenticatedUserid", "Required parameter requestParameters.robloxctxAuthenticatedUserid was null or undefined when calling getPromptAssignments.");
                                return n = {}, void 0 !== e.shouldReturnMetadata && (n.shouldReturnMetadata = e.shouldReturnMetadata), r = {}, void 0 !== e.robloxctxAuthenticatedUserid && null !== e.robloxctxAuthenticatedUserid && (r["robloxctx-authenticated-userid"] = String(e.robloxctxAuthenticatedUserid)), [4, this.request({
                                    path: "/v1/prompt-assignments",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return [2, new e1(a.sent(), function(e) {
                                    return e.map(tm)
                                })]
                        }
                    })
                })
            }, t.prototype.getPromptAssignments = function(e, t) {
                return eV(this, void 0, void 0, function() {
                    return eW(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.getPromptAssignmentsRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.getSecurityQuestionRaw = function(e, t) {
                return eV(this, void 0, void 0, function() {
                    var n, r;
                    return eW(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new eY("userId", "Required parameter requestParameters.userId was null or undefined when calling getSecurityQuestion.");
                                if (null === e.sessionId || void 0 === e.sessionId) throw new eY("sessionId", "Required parameter requestParameters.sessionId was null or undefined when calling getSecurityQuestion.");
                                return n = {}, void 0 !== e.userId && (n.userId = e.userId), void 0 !== e.sessionId && (n.sessionId = e.sessionId), r = {}, [4, this.request({
                                    path: "/v1/security-question",
                                    method: "GET",
                                    headers: r,
                                    query: n
                                }, t)];
                            case 1:
                                return [2, new e1(a.sent(), function(e) {
                                    return null == e ? e : {
                                        answerChoices: eX(e, "answerChoices") ? e.answerChoices : void 0,
                                        answerPrompt: eX(e, "answerPrompt") ? e.answerPrompt : void 0,
                                        correctAnswerChoiceCount: eX(e, "correctAnswerChoiceCount") ? e.correctAnswerChoiceCount : void 0,
                                        questionType: eX(e, "questionType") ? e.questionType : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.getSecurityQuestion = function(e, t) {
                return eV(this, void 0, void 0, function() {
                    return eW(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.getSecurityQuestionRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.handleHealthCheckRaw = function(e) {
                return eV(this, void 0, void 0, function() {
                    var t, n;
                    return eW(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return t = {}, n = {}, [4, this.request({
                                    path: "/health",
                                    method: "GET",
                                    headers: n,
                                    query: t
                                }, e)];
                            case 1:
                                return [2, new e1(r.sent())]
                        }
                    })
                })
            }, t.prototype.handleHealthCheck = function(e) {
                return eV(this, void 0, void 0, function() {
                    return eW(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.handleHealthCheckRaw(e)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.recordMetricRaw = function(e, t) {
                return eV(this, void 0, void 0, function() {
                    var n, r;
                    return eW(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.recordMetricRequest || void 0 === e.recordMetricRequest) throw new eY("recordMetricRequest", "Required parameter requestParameters.recordMetricRequest was null or undefined when calling recordMetric.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/metrics/record",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            identifier: e.identifier,
                                            labelValues: e.labelValues,
                                            name: e.name,
                                            value: e.value
                                        }
                                    }(e.recordMetricRequest)
                                }, t)];
                            case 1:
                                return [2, new e1(a.sent())]
                        }
                    })
                })
            }, t.prototype.recordMetric = function(e, t) {
                return eV(this, void 0, void 0, function() {
                    return eW(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.recordMetricRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.updatePromptAssignmentsRaw = function(e, t) {
                return eV(this, void 0, void 0, function() {
                    var n, r;
                    return eW(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.robloxctxAuthenticatedUserid || void 0 === e.robloxctxAuthenticatedUserid) throw new eY("robloxctxAuthenticatedUserid", "Required parameter requestParameters.robloxctxAuthenticatedUserid was null or undefined when calling updatePromptAssignments.");
                                if (null === e.updatePromptAssignmentRequest || void 0 === e.updatePromptAssignmentRequest) throw new eY("updatePromptAssignmentRequest", "Required parameter requestParameters.updatePromptAssignmentRequest was null or undefined when calling updatePromptAssignments.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", void 0 !== e.robloxctxAuthenticatedUserid && null !== e.robloxctxAuthenticatedUserid && (r["robloxctx-authenticated-userid"] = String(e.robloxctxAuthenticatedUserid)), [4, this.request({
                                    path: "/v1/prompt-assignments",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            action: e.action,
                                            metadata: function(e) {
                                                if (void 0 !== e) return null === e ? null : {
                                                    accountRestoresPolicyEffectiveTimestamp: e.accountRestoresPolicyEffectiveTimestamp,
                                                    bodyResource: e.bodyResource,
                                                    controllableGroupRobuxBalance: e.controllableGroupRobuxBalance,
                                                    dismissalCount: e.dismissalCount,
                                                    displayType: e.displayType,
                                                    forceResetTimestamp: e.forceResetTimestamp,
                                                    headerResource: e.headerResource,
                                                    pageRestriction: e.pageRestriction,
                                                    robuxBalance: e.robuxBalance,
                                                    showAlertIcon: e.showAlertIcon,
                                                    showBanner: e.showBanner,
                                                    showXButtonForDisable: e.showXButtonForDisable,
                                                    tradableItemValue: e.tradableItemValue
                                                }
                                            }(e.metadata),
                                            promptType: e.promptType
                                        }
                                    }(e.updatePromptAssignmentRequest)
                                }, t)];
                            case 1:
                                return [2, new e1(a.sent())]
                        }
                    })
                })
            }, t.prototype.updatePromptAssignments = function(e, t) {
                return eV(this, void 0, void 0, function() {
                    return eW(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.updatePromptAssignmentsRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.verifyRaw = function(e) {
                return eV(this, void 0, void 0, function() {
                    var t, n;
                    return eW(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return t = {}, n = {}, [4, this.request({
                                    path: "/v1/spycloud/verify",
                                    method: "GET",
                                    headers: n,
                                    query: t
                                }, e)];
                            case 1:
                                return [2, new e1(r.sent(), function(e) {
                                    return null == e ? e : {
                                        authenticated: eX(e, "authenticated") ? e.authenticated : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.verify = function(e) {
                return eV(this, void 0, void 0, function() {
                    return eW(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.verifyRaw(e)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t
        }(eZ),
        t_ = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return eq(t, e), t.prototype._continueRaw = function(e, t) {
                return eV(this, void 0, void 0, function() {
                    var n, r;
                    return eW(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.continueRequest || void 0 === e.continueRequest) throw new eY("continueRequest", "Required parameter requestParameters.continueRequest was null or undefined when calling _continue.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/continue",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            challengeID: e.challengeID,
                                            challengeMetadata: e.challengeMetadata,
                                            challengeType: e.challengeType
                                        }
                                    }(e.continueRequest)
                                }, t)];
                            case 1:
                                return [2, new e1(a.sent(), function(e) {
                                    return null == e ? e : {
                                        challengeId: eX(e, "challengeId") ? e.challengeId : void 0,
                                        challengeMetadata: eX(e, "challengeMetadata") ? e.challengeMetadata : void 0,
                                        challengeType: eX(e, "challengeType") ? e.challengeType : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype._continue = function(e, t) {
                return eV(this, void 0, void 0, function() {
                    return eW(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this._continueRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.challengeUserRaw = function(e, t) {
                return eV(this, void 0, void 0, function() {
                    var n, r;
                    return eW(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.challengeUserRequest || void 0 === e.challengeUserRequest) throw new eY("challengeUserRequest", "Required parameter requestParameters.challengeUserRequest was null or undefined when calling challengeUser.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/challengeUser",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            challengeSessionId: e.challengeSessionId,
                                            placeId: e.placeId
                                        }
                                    }(e.challengeUserRequest)
                                }, t)];
                            case 1:
                                return [2, new e1(a.sent())]
                        }
                    })
                })
            }, t.prototype.challengeUser = function(e, t) {
                return eV(this, void 0, void 0, function() {
                    return eW(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.challengeUserRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.getXboxTokenRaw = function(e) {
                return eV(this, void 0, void 0, function() {
                    var t, n;
                    return eW(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return t = {}, n = {}, [4, this.request({
                                    path: "/v1/xboxToken",
                                    method: "GET",
                                    headers: n,
                                    query: t
                                }, e)];
                            case 1:
                                return [2, new e1(r.sent(), function(e) {
                                    return null == e ? e : {
                                        token: eX(e, "token") ? e.token : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.getXboxToken = function(e) {
                return eV(this, void 0, void 0, function() {
                    return eW(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.getXboxTokenRaw(e)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.handleHealthCheckRaw = function(e) {
                return eV(this, void 0, void 0, function() {
                    var t, n;
                    return eW(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return t = {}, n = {}, [4, this.request({
                                    path: "/health",
                                    method: "GET",
                                    headers: n,
                                    query: t
                                }, e)];
                            case 1:
                                return [2, new e1(r.sent())]
                        }
                    })
                })
            }, t.prototype.handleHealthCheck = function(e) {
                return eV(this, void 0, void 0, function() {
                    return eW(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.handleHealthCheckRaw(e)];
                            case 1:
                                return [4, t.sent().value()];
                            case 2:
                                return [2, t.sent()]
                        }
                    })
                })
            }, t.prototype.initializeChallengeRaw = function(e, t) {
                return eV(this, void 0, void 0, function() {
                    var n, r;
                    return eW(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.initializeChallengeRequest || void 0 === e.initializeChallengeRequest) throw new eY("initializeChallengeRequest", "Required parameter requestParameters.initializeChallengeRequest was null or undefined when calling initializeChallenge.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/initializeChallenge",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            placeId: e.placeId,
                                            userId: e.userId
                                        }
                                    }(e.initializeChallengeRequest)
                                }, t)];
                            case 1:
                                return [2, new e1(a.sent(), function(e) {
                                    return null == e ? e : {
                                        challengeSessionId: eX(e, "challengeSessionId") ? e.challengeSessionId : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.initializeChallenge = function(e, t) {
                return eV(this, void 0, void 0, function() {
                    return eW(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.initializeChallengeRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.verifyChallengePassedRaw = function(e, t) {
                return eV(this, void 0, void 0, function() {
                    var n, r;
                    return eW(this, function(a) {
                        switch (a.label) {
                            case 0:
                                if (null === e.verifyChallengePassedRequest || void 0 === e.verifyChallengePassedRequest) throw new eY("verifyChallengePassedRequest", "Required parameter requestParameters.verifyChallengePassedRequest was null or undefined when calling verifyChallengePassed.");
                                return n = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/verifyChallengePassed",
                                    method: "POST",
                                    headers: r,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            challengeSessionId: e.challengeSessionId,
                                            placeId: e.placeId,
                                            userId: e.userId
                                        }
                                    }(e.verifyChallengePassedRequest)
                                }, t)];
                            case 1:
                                return [2, new e1(a.sent(), function(e) {
                                    return null == e ? e : {
                                        passed: eX(e, "passed") ? e.passed : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.verifyChallengePassed = function(e, t) {
                return eV(this, void 0, void 0, function() {
                    return eW(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.verifyChallengePassedRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t
        }(eZ),
        tS = function() {
            return (tS = Object.assign || function(e) {
                for (var t, n = 1, r = arguments.length; n < r; n++)
                    for (var a in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, a) && (e[a] = t[a]);
                return e
            }).apply(this, arguments)
        };

    function tk(e, t, n, r) {
        return new(n || (n = Promise))(function(a, i) {
            function o(e) {
                try {
                    s(r.next(e))
                } catch (e) {
                    i(e)
                }
            }

            function l(e) {
                try {
                    s(r.throw(e))
                } catch (e) {
                    i(e)
                }
            }

            function s(e) {
                var t;
                e.done ? a(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(o, l)
            }
            s((r = r.apply(e, t || [])).next())
        })
    }

    function tx(e, t) {
        var n, r, a, i = {
                label: 0,
                sent: function() {
                    if (1 & a[0]) throw a[1];
                    return a[1]
                },
                trys: [],
                ops: []
            },
            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return o.next = l(0), o.throw = l(1), o.return = l(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
            return this
        }), o;

        function l(l) {
            return function(s) {
                var u = [l, s];
                if (n) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, u[0] && (i = 0)), i;) try {
                    if (n = 1, r && (a = 2 & u[0] ? r.return : u[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, u[1])).done) return a;
                    switch (r = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                        case 0:
                        case 1:
                            a = u;
                            break;
                        case 4:
                            return i.label++, {
                                value: u[1],
                                done: !1
                            };
                        case 5:
                            i.label++, r = u[1], u = [0];
                            continue;
                        case 7:
                            u = i.ops.pop(), i.trys.pop();
                            continue;
                        default:
                            if (!(a = (a = i.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                i = 0;
                                continue
                            }
                            if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                i.label = u[1];
                                break
                            }
                            if (6 === u[0] && i.label < a[1]) {
                                i.label = a[1], a = u;
                                break
                            }
                            if (a && i.label < a[2]) {
                                i.label = a[2], i.ops.push(u);
                                break
                            }
                            a[2] && i.ops.pop(), i.trys.pop();
                            continue
                    }
                    u = t.call(e, i)
                } catch (e) {
                    u = [6, e], r = 0
                } finally {
                    n = a = 0
                }
                if (5 & u[0]) throw u[1];
                return {
                    value: u[0] ? u[1] : void 0,
                    done: !0
                }
            }
        }
    }
    "function" == typeof SuppressedError && SuppressedError, (tE = tv || (tv = {})).Login = "Login", tE.AppLogin = "AppLogin", tE.Signup = "Signup", tE.AppSignup = "AppSignup", tE.JoinGroup = "JoinGroup", tE.GroupWallPost = "GroupWallPost", tE.ResetPassword = "ResetPassword", tE.ToyCodeRedeem = "ToyCodeRedeem", tE.GameCardRedeem = "GameCardRedeem", tE.FollowUser = "FollowUser", tE.Generic = "Generic", tE.SupportRequest = "SupportRequest", tE.AssetComment = "AssetComment", tE.Marketplace = "Marketplace", (tT = ty || (ty = {}))[tT.UNKNOWN = 0] = "UNKNOWN", (tN = tb || (tb = {}))[tN.UNKNOWN = 0] = "UNKNOWN", tN[tN.FAILED_PREP = 1] = "FAILED_PREP", tN[tN.FAILED_MIREPOIX = 2] = "FAILED_MIREPOIX", tN[tN.FAILED_SIMMER = 3] = "FAILED_SIMMER";
    var tE, tT, tN, tC, tO, tR, tP, tI, tA, tL, tD, tM, tz, tF, tj, tU, tB, tq, t$, tV = Object.freeze({
        __proto__: null,
        get ErrorCode() {
            return tb
        }
    });
    (tW = tC || (tC = {}))[tW.UNKNOWN = 0] = "UNKNOWN", (tK = tO || (tO = {}))[tK.UNKNOWN = 0] = "UNKNOWN", (tH = tR || (tR = {})).ForceAuthenticator = "ForceAuthenticator", tH.ForceTwoStepVerification = "ForceTwoStepVerification", tH.BlockSession = "BlockSession", (tZ = tP || (tP = {}))[tZ.UNKNOWN = 0] = "UNKNOWN", (tG = tI || (tI = {}))[tG.UNKNOWN = 0] = "UNKNOWN", tG[tG.SESSION_INVALID = 1] = "SESSION_INVALID", tG[tG.ANSWER_INVALID = 2] = "ANSWER_INVALID", tG[tG.WORKER_LOAD_ERROR = 3] = "WORKER_LOAD_ERROR", tG[tG.TIMEOUT = 4] = "TIMEOUT", (tQ = tA || (tA = {})).INVALID = "PROOF_OF_SPACE_PUZZLE_TYPE_INVALID", tQ.NONINTERACTIVE = "PROOF_OF_SPACE_PUZZLE_TYPE_NONINTERACTIVE", tQ.INTERACTIVE = "PROOF_OF_SPACE_PUZZLE_TYPE_INTERACTIVE", (tY = tL || (tL = {}))[tY.UNKNOWN = 0] = "UNKNOWN", tY[tY.SESSION_INVALID = 1] = "SESSION_INVALID", tY[tY.ANSWER_INVALID = 2] = "ANSWER_INVALID", tY[tY.WORKER_LOAD_ERROR = 3] = "WORKER_LOAD_ERROR", (tX = tD || (tD = {}))[tX.UNKNOWN = 0] = "UNKNOWN", tX[tX.OTP_CODE_EXPIRED = 1] = "OTP_CODE_EXPIRED", (tJ = tM || (tM = {})).Password = "Password", tJ.OtpEmail = "Otp_Email", tJ.Passkey = "Passkey", (t0 = tz || (tz = {}))[t0.UNKNOWN = 0] = "UNKNOWN", t0[t0.INVALID_SESSION = 1] = "INVALID_SESSION", (t1 = tF || (tF = {})).INVALID = "ROSTILE_PUZZLE_TYPE_INVALID", t1.VISIBLE = "ROSTILE_PUZZLE_TYPE_VISIBLE", t1.INVISIBLE = "ROSTILE_PUZZLE_TYPE_INVISIBLE", (t2 = tj || (tj = {}))[t2.UNKNOWN = 0] = "UNKNOWN", t2[t2.SESSION_EXPIRED = 1] = "SESSION_EXPIRED", t2[t2.USER_WAS_FORCE_RESET = 2] = "USER_WAS_FORCE_RESET", (t4 = tU || (tU = {})).Unknown = "Unknown", t4.Login = "Login", t4.RobuxSpend = "RobuxSpend", t4.ItemTrade = "ItemTrade", t4.Resale = "Resale", t4.PasswordReset = "PasswordReset", t4.RevertAccount = "RevertAccount", t4.Generic = "Generic", t4.GenericWithRecoveryCodes = "GenericWithRecoveryCodes", (t3 = tB || (tB = {})).Email = "Email", t3.Authenticator = "Authenticator", t3.RecoveryCode = "RecoveryCode", t3.SMS = "SMS", t3.SecurityKey = "SecurityKey", t3.CrossDevice = "CrossDevice", t3.Password = "Password", t3.Passkey = "Passkey", (t5 = tq || (tq = {}))[t5.UNKNOWN = 0] = "UNKNOWN", t5[t5.SESSION_EXPIRED = 1] = "SESSION_EXPIRED", (t8 = t$ || (t$ = {}))[t8.UNKNOWN = 0] = "UNKNOWN";
    var tW, tK, tH, tZ, tG, tQ, tY, tX, tJ, t0, t1, t2, t4, t3, t5, t8, t9, t6, t7 = function(e, t) {
        return (t7 = Object.setPrototypeOf || ({
            __proto__: []
        }) instanceof Array && function(e, t) {
            e.__proto__ = t
        } || function(e, t) {
            for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
        })(e, t)
    };
    "function" == typeof SuppressedError && SuppressedError, (ne = t9 || (t9 = {})).UNKNOWN = "unknown", ne.INVALIDATED = "invalidated", ne.ABANDONED = "abandoned", ne.LOADFAILED = "loadfailed", (nt = t6 || (t6 = {}))[nt.UNKNOWN = 0] = "UNKNOWN";
    var ne, nt, nn, nr = "generic-challenge-error",
        na = function(e) {
            function t(t) {
                var n = e.call(this, "challenge error for challenge kind ".concat(t.kind)) || this;
                return n.parameters = t, n._className = nr, n
            }
            return function(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

                function n() {
                    this.constructor = e
                }
                t7(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
            }(t, e), t.prototype.match = function(e) {
                return this.parameters.kind === e.parameters.kind && (JSON.stringify(this.parameters.data) === JSON.stringify(e.parameters.data) || this._className === nr)
            }, t.prototype.matchAbandoned = function(e) {
                return this.match(e) && e.parameters.kind === t9.ABANDONED
            }, t
        }(Error);
    (nD = nn || (nn = {})).UNKNOWN = "unknown", nD.CHEF = "chef";
    var ni = function(e, t, n) {
        if (n || 2 == arguments.length)
            for (var r, a = 0, i = t.length; a < i; a++) !r && a in t || (r || (r = Array.prototype.slice.call(t, 0, a)), r[a] = t[a]);
        return e.concat(r || Array.prototype.slice.call(t))
    };

    function no(e, t, n, r, a, i, o, l, s) {
        switch (arguments.length) {
            case 1:
                return e;
            case 2:
                return function() {
                    return t(e.apply(this, arguments))
                };
            case 3:
                return function() {
                    return n(t(e.apply(this, arguments)))
                };
            case 4:
                return function() {
                    return r(n(t(e.apply(this, arguments))))
                };
            case 5:
                return function() {
                    return a(r(n(t(e.apply(this, arguments)))))
                };
            case 6:
                return function() {
                    return i(a(r(n(t(e.apply(this, arguments))))))
                };
            case 7:
                return function() {
                    return o(i(a(r(n(t(e.apply(this, arguments)))))))
                };
            case 8:
                return function() {
                    return l(o(i(a(r(n(t(e.apply(this, arguments))))))))
                };
            case 9:
                return function() {
                    return s(l(o(i(a(r(n(t(e.apply(this, arguments)))))))))
                }
        }
    }

    function nl(e, t, n, r, a, i, o, l, s) {
        switch (arguments.length) {
            case 1:
                return e;
            case 2:
                return t(e);
            case 3:
                return n(t(e));
            case 4:
                return r(n(t(e)));
            case 5:
                return a(r(n(t(e))));
            case 6:
                return i(a(r(n(t(e)))));
            case 7:
                return o(i(a(r(n(t(e))))));
            case 8:
                return l(o(i(a(r(n(t(e)))))));
            case 9:
                return s(l(o(i(a(r(n(t(e))))))));
            default:
                for (var u = arguments[0], c = 1; c < arguments.length; c++) u = arguments[c](u);
                return u
        }
    }
    var ns = function(e, t) {
            return t
        },
        nu = function(e, t) {
            var n = "number" == typeof e ? function(t) {
                return t.length >= e
            } : e;
            return function() {
                var e = Array.from(arguments);
                return n(arguments) ? t.apply(this, e) : function(n) {
                    return t.apply(void 0, ni([n], e, !1))
                }
            }
        },
        nc = function(e) {
            return {
                _tag: "Left",
                left: e
            }
        },
        nd = function(e) {
            return {
                _tag: "Right",
                right: e
            }
        },
        nf = function(e) {
            return "Left" === e._tag
        },
        np = function(e, t) {
            try {
                return nd(e())
            } catch (e) {
                return nc(t(e))
            }
        },
        nh = {
            _tag: "None"
        },
        nm = function(e) {
            return {
                _tag: "Some",
                value: e
            }
        },
        ng = function(e) {
            return "None" === e._tag
        },
        nv = function(e) {
            return function(t) {
                return ng(t) ? e() : t.value
            }
        },
        ny = function(e, t) {
            return nl(e, nb(t))
        },
        nb = function(e) {
            return function(t) {
                return function() {
                    return Promise.resolve().then(t).then(e)
                }
            }
        },
        nw = function(e) {
            return function() {
                return Promise.resolve(e)
            }
        },
        n_ = nu(2, function(e, t) {
            return function() {
                return Promise.resolve().then(e).then(function(e) {
                    return t(e)()
                })
            }
        }),
        nS = "Task",
        nk = {
            URI: nS,
            map: ny
        },
        nx = function(e, t) {
            var n, r, a, i, o = {
                label: 0,
                sent: function() {
                    if (1 & a[0]) throw a[1];
                    return a[1]
                },
                trys: [],
                ops: []
            };
            return i = {
                next: l(0),
                throw: l(1),
                return: l(2)
            }, "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                return this
            }), i;

            function l(l) {
                return function(s) {
                    var u = [l, s];
                    if (n) throw TypeError("Generator is already executing.");
                    for (; i && (i = 0, u[0] && (o = 0)), o;) try {
                        if (n = 1, r && (a = 2 & u[0] ? r.return : u[0] ? r.throw || ((a = r.return) && a.call(r), 0) : r.next) && !(a = a.call(r, u[1])).done) return a;
                        switch (r = 0, a && (u = [2 & u[0], a.value]), u[0]) {
                            case 0:
                            case 1:
                                a = u;
                                break;
                            case 4:
                                return o.label++, {
                                    value: u[1],
                                    done: !1
                                };
                            case 5:
                                o.label++, r = u[1], u = [0];
                                continue;
                            case 7:
                                u = o.ops.pop(), o.trys.pop();
                                continue;
                            default:
                                if (!(a = (a = o.trys).length > 0 && a[a.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                    o = 0;
                                    continue
                                }
                                if (3 === u[0] && (!a || u[1] > a[0] && u[1] < a[3])) {
                                    o.label = u[1];
                                    break
                                }
                                if (6 === u[0] && o.label < a[1]) {
                                    o.label = a[1], a = u;
                                    break
                                }
                                if (a && o.label < a[2]) {
                                    o.label = a[2], o.ops.push(u);
                                    break
                                }
                                a[2] && o.ops.pop(), o.trys.pop();
                                continue
                        }
                        u = t.call(e, o)
                    } catch (e) {
                        u = [6, e], r = 0
                    } finally {
                        n = a = 0
                    }
                    if (5 & u[0]) throw u[1];
                    return {
                        value: u[0] ? u[1] : void 0,
                        done: !0
                    }
                }
            }
        },
        nE = no(nd, nw),
        nT = (nM = {
            URI: nS,
            map: ny,
            of: nw,
            ap: function(e, t) {
                return nl(e, function(e) {
                    return function() {
                        return Promise.all([Promise.resolve().then(e), Promise.resolve().then(t)]).then(function(e) {
                            return (0, e[0])(e[1])
                        })
                    }
                })
            },
            chain: n_
        }, function(e) {
            return function(t) {
                var n;
                return nM.chain(t, (n = nM.of, function(t) {
                    return nf(t) ? e(t.left) : n(t.right)
                }))
            }
        }),
        nN = function(e, t) {
            return function() {
                var n, r, a, i;
                return n = void 0, r = void 0, a = void 0, i = function() {
                    return nx(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return n.trys.push([0, 2, , 3]), [4, e().then(nd)];
                            case 1:
                                return [2, n.sent()];
                            case 2:
                                return [2, nc(t(n.sent()))];
                            case 3:
                                return [2]
                        }
                    })
                }, new(a || (a = Promise))(function(e, t) {
                    function o(e) {
                        try {
                            s(i.next(e))
                        } catch (e) {
                            t(e)
                        }
                    }

                    function l(e) {
                        try {
                            s(i.throw(e))
                        } catch (e) {
                            t(e)
                        }
                    }

                    function s(t) {
                        var n;
                        t.done ? e(t.value) : ((n = t.value) instanceof a ? n : new a(function(e) {
                            e(n)
                        })).then(o, l)
                    }
                    s((i = i.apply(n, r || [])).next())
                })
            }
        },
        nC = (nz = {
            URI: "Either",
            map: function(e, t) {
                return nl(e, function(e) {
                    return nf(e) ? e : nd(t(e.right))
                })
            }
        }, function(e) {
            return function(t) {
                return nk.map(t, function(t) {
                    return nz.map(t, e)
                })
            }
        }),
        nO = nu(3, function(e, t, n) {
            return nk.map(e, function(e) {
                return nf(e) ? nc(t(e.left)) : nd(n(e.right))
            })
        }),
        nR = nE([]),
        nP = function(e) {
            return no(function(t) {
                return function() {
                    return Promise.all(t.map(function(t, n) {
                        return Promise.resolve().then(function() {
                            return e(n, t)()
                        })
                    }))
                }
            }, nb(function(e) {
                var t = ns(0, e[0]);
                if (nf(t)) return t;
                for (var n = [t.right], r = 1; r < e.length; r++) {
                    var a = ns(r, e[r]);
                    if (nf(a)) return a;
                    n.push(a.right)
                }
                return nd(n)
            }))
        },
        nI = function(e) {
            var t;
            return t = nP(function(t, n) {
                    return e(n)
                }),
                function(e) {
                    return e.length > 0 ? t(e) : nR
                }
        },
        nA = "u" > typeof globalThis ? globalThis : "u" > typeof window ? window : e.g,
        nL = {};
    ! function(e) {
        var t = nA && nA.__spreadArray || function(e, t, n) {
            if (n || 2 == arguments.length)
                for (var r, a = 0, i = t.length; a < i; a++) !r && a in t || (r || (r = Array.prototype.slice.call(t, 0, a)), r[a] = t[a]);
            return e.concat(r || Array.prototype.slice.call(t))
        };

        function n(e) {
            return e
        }

        function r(e) {
            return function() {
                return e
            }
        }

        function a(e, t, n, r, a, i, o, l, s) {
            switch (arguments.length) {
                case 1:
                    return e;
                case 2:
                    return function() {
                        return t(e.apply(this, arguments))
                    };
                case 3:
                    return function() {
                        return n(t(e.apply(this, arguments)))
                    };
                case 4:
                    return function() {
                        return r(n(t(e.apply(this, arguments))))
                    };
                case 5:
                    return function() {
                        return a(r(n(t(e.apply(this, arguments)))))
                    };
                case 6:
                    return function() {
                        return i(a(r(n(t(e.apply(this, arguments))))))
                    };
                case 7:
                    return function() {
                        return o(i(a(r(n(t(e.apply(this, arguments)))))))
                    };
                case 8:
                    return function() {
                        return l(o(i(a(r(n(t(e.apply(this, arguments))))))))
                    };
                case 9:
                    return function() {
                        return s(l(o(i(a(r(n(t(e.apply(this, arguments)))))))))
                    }
            }
        }

        function i(e) {
            throw Error("Called `absurd` function which should be uncallable")
        }
        Object.defineProperty(e, "__esModule", {
            value: !0
        }), e.dual = e.getEndomorphismMonoid = e.SK = e.hole = e.constVoid = e.constUndefined = e.constNull = e.constFalse = e.constTrue = e.unsafeCoerce = e.apply = e.getRing = e.getSemiring = e.getMonoid = e.getSemigroup = e.getBooleanAlgebra = void 0, e.identity = n, e.constant = r, e.flip = function(e) {
            return function() {
                for (var t = [], n = 0; n < arguments.length; n++) t[n] = arguments[n];
                return t.length > 1 ? e(t[1], t[0]) : function(n) {
                    return e(n)(t[0])
                }
            }
        }, e.flow = a, e.tuple = function() {
            for (var e = [], t = 0; t < arguments.length; t++) e[t] = arguments[t];
            return e
        }, e.increment = function(e) {
            return e + 1
        }, e.decrement = function(e) {
            return e - 1
        }, e.absurd = i, e.tupled = function(e) {
            return function(t) {
                return e.apply(void 0, t)
            }
        }, e.untupled = function(e) {
            return function() {
                for (var t = [], n = 0; n < arguments.length; n++) t[n] = arguments[n];
                return e(t)
            }
        }, e.pipe = function(e, t, n, r, a, i, o, l, s) {
            switch (arguments.length) {
                case 1:
                    return e;
                case 2:
                    return t(e);
                case 3:
                    return n(t(e));
                case 4:
                    return r(n(t(e)));
                case 5:
                    return a(r(n(t(e))));
                case 6:
                    return i(a(r(n(t(e)))));
                case 7:
                    return o(i(a(r(n(t(e))))));
                case 8:
                    return l(o(i(a(r(n(t(e)))))));
                case 9:
                    return s(l(o(i(a(r(n(t(e))))))));
                default:
                    for (var u = arguments[0], c = 1; c < arguments.length; c++) u = arguments[c](u);
                    return u
            }
        }, e.not = function(e) {
            return function(t) {
                return !e(t)
            }
        }, e.getBooleanAlgebra = function(e) {
            return function() {
                return {
                    meet: function(t, n) {
                        return function(r) {
                            return e.meet(t(r), n(r))
                        }
                    },
                    join: function(t, n) {
                        return function(r) {
                            return e.join(t(r), n(r))
                        }
                    },
                    zero: function() {
                        return e.zero
                    },
                    one: function() {
                        return e.one
                    },
                    implies: function(t, n) {
                        return function(r) {
                            return e.implies(t(r), n(r))
                        }
                    },
                    not: function(t) {
                        return function(n) {
                            return e.not(t(n))
                        }
                    }
                }
            }
        }, e.getSemigroup = function(e) {
            return function() {
                return {
                    concat: function(t, n) {
                        return function(r) {
                            return e.concat(t(r), n(r))
                        }
                    }
                }
            }
        }, e.getMonoid = function(t) {
            var n = (0, e.getSemigroup)(t);
            return function() {
                return {
                    concat: n().concat,
                    empty: function() {
                        return t.empty
                    }
                }
            }
        }, e.getSemiring = function(e) {
            return {
                add: function(t, n) {
                    return function(r) {
                        return e.add(t(r), n(r))
                    }
                },
                zero: function() {
                    return e.zero
                },
                mul: function(t, n) {
                    return function(r) {
                        return e.mul(t(r), n(r))
                    }
                },
                one: function() {
                    return e.one
                }
            }
        }, e.getRing = function(t) {
            var n = (0, e.getSemiring)(t);
            return {
                add: n.add,
                mul: n.mul,
                one: n.one,
                zero: n.zero,
                sub: function(e, n) {
                    return function(r) {
                        return t.sub(e(r), n(r))
                    }
                }
            }
        }, e.apply = function(e) {
            return function(t) {
                return t(e)
            }
        }, e.unsafeCoerce = n, e.constTrue = r(!0), e.constFalse = r(!1), e.constNull = r(null), e.constUndefined = r(void 0), e.constVoid = e.constUndefined, e.hole = i, e.SK = function(e, t) {
            return t
        }, e.getEndomorphismMonoid = function() {
            return {
                concat: function(e, t) {
                    return a(e, t)
                },
                empty: n
            }
        }, e.dual = function(e, n) {
            var r = "number" == typeof e ? function(t) {
                return t.length >= e
            } : e;
            return function() {
                var e = Array.from(arguments);
                return r(arguments) ? n.apply(this, e) : function(r) {
                    return n.apply(void 0, t([r], e, !1))
                }
            }
        }
    }(nL);
    var nD, nM, nz, nF, nj = ["sitetest1", "sitetest2", "sitetest3"],
        nU = ["roblox.com", "simulprod.com", "rblx.org"],
        nB = function(e) {
            void 0 === e && (e = window.location.hostname);
            var t, n = nj.filter(function(t) {
                return e.includes(t)
            });
            if (n.length > 0) return "https://apis.".concat(n[0], ".robloxlabs.com");
            var r = (t = e).startsWith("www.") ? t.slice(4) : t;
            return "localhost" === r || nU.some(function(e) {
                return r === e || r.endsWith(".".concat(e))
            }) ? "https://apis.roblox.com" : "https://apis.".concat(r)
        };
    (nF || (nF = {})).EventGeneric = "event_generic";
    var nq = "go/at-playbook",
        n$ = {};
    Object.defineProperty(n$, "__esModule", {
        value: !0
    }), n$.getIdentifiers = n$.getBtid = n$.getUserId = void 0, n$.getUserId = () => {
        var e;
        let t = document.querySelector('meta[name="user-data"]');
        return null != (e = null == t ? void 0 : t.getAttribute("data-userid")) ? e : null
    }, n$.getBtid = () => {
        let e = document.cookie.split(";").find(e => e.trim().startsWith("RBXEventTrackerV2="));
        if (!e) return null;
        let t = e.split("=").slice(1).join("=").split("&").find(e => "browserid" === e.split("=")[0]);
        return t ? t.split("=")[1] : null
    }, n$.getIdentifiers = () => ({
        userId: (0, n$.getUserId)(),
        btid: (0, n$.getBtid)()
    });
    var nV, nW, nK = new tw(new tf({
            basePath: "".concat(nB(), "/account-security-service"),
            genericChallengeMiddlewareType: "native",
            credentials: "include"
        })),
        nH = function(e) {
            nN(function() {
                return nK.recordMetric({
                    recordMetricRequest: {
                        name: nF.EventGeneric,
                        value: 1,
                        labelValues: {
                            event_type: "Success",
                            challenge_type: e
                        }
                    }
                })
            }, function(e) {
                return e
            })()
        },
        nZ = function(e) {
            nN(function() {
                return nK.recordMetric({
                    recordMetricRequest: {
                        name: nF.EventGeneric,
                        value: 1,
                        labelValues: {
                            event_type: "ParseFailure",
                            challenge_type: e
                        }
                    }
                })
            }, function(e) {
                return e
            })()
        },
        nG = function(e) {
            nN(function() {
                return nK.recordMetric({
                    recordMetricRequest: {
                        name: nF.EventGeneric,
                        value: 1,
                        labelValues: {
                            event_type: "ContinueFailure",
                            challenge_type: e
                        }
                    }
                })
            }, function(e) {
                return e
            })()
        },
        nQ = function(e, t) {
            var n = n$.getUserId() || n$.getBtid() || "unknown";
            nN(function() {
                return nK.recordMetric({
                    recordMetricRequest: {
                        name: e,
                        value: 1,
                        labelValues: t,
                        identifier: n
                    }
                })
            }, function(e) {
                return e
            })()
        },
        nY = new tp(new tf({
            basePath: "".concat(nB(), "/rotating-client-service"),
            genericChallengeMiddlewareType: "native",
            credentials: "include"
        })),
        nX = function(e) {
            var t = e.nonce,
                n = e.thunk;
            return null !== document.getElementById("prelude") ? Promise.resolve() : new Promise(function(e) {
                var r = document.createElement("script");
                r.src = "".concat(nB(), "/rotating-client-service/v1/prelude/latest"), r.id = "prelude", null != t && (r.nonce = t), r.onload = function() {
                    n().then(function() {
                        return e()
                    }, function() {
                        return e()
                    })
                }, r.onerror = function() {
                    return e()
                }, r.crossOrigin = "use-credentials", document.body.appendChild(r)
            })
        },
        nJ = function() {
            for (var e = [], t = 0; t < arguments.length; t++) e[t] = arguments[t];
            return tk(void 0, function(e, t) {
                for (var n, r = 0, a = t.length; r < a; r++) !n && r in t || (n || (n = Array.prototype.slice.call(t, 0, r)), n[r] = t[r]);
                return e.concat(n || Array.prototype.slice.call(t))
            }([], e), void 0, function(e) {
                var t, n, r, a, i, o, l, s, u;
                return void 0 === e && (e = nY), tx(this, function(c) {
                    switch (c.label) {
                        case 0:
                            return [4, tk(void 0, void 0, void 0, function() {
                                var e, t;
                                return tx(this, function(n) {
                                    switch (n.label) {
                                        case 0:
                                            return [4, nN(function() {
                                                return window.crypto.subtle.generateKey({
                                                    name: "ECDSA",
                                                    namedCurve: "P-256"
                                                }, !1, ["sign", "verify"])
                                            }, function(e) {
                                                return e
                                            })()];
                                        case 1:
                                            return nf(e = n.sent()) ? (nQ("foo", {
                                                f: nq
                                            }), [2, nc(null)]) : [4, nN(function() {
                                                return window.crypto.subtle.exportKey("spki", e.right.publicKey)
                                            }, function(e) {
                                                return e
                                            })()];
                                        case 2:
                                            return nf(t = n.sent()) ? (nQ("foo", {
                                                g: nq
                                            }), [2, nc(null)]) : [2, nd({
                                                publicKeySerialized: btoa(new Uint8Array(t.right).reduce(function(e, t) {
                                                    return e + String.fromCharCode(t)
                                                }, "")),
                                                keyPair: e.right
                                            })]
                                    }
                                })
                            })];
                        case 1:
                            return nf(t = c.sent()) ? (ChefScript.prelude.signingKeys = nh, ChefScript.prelude.publicKeySerialized = nh, [2]) : (r = (n = t.right).publicKeySerialized, a = n.keyPair, ChefScript.prelude.signingKeys = nm(a), ChefScript.prelude.publicKeySerialized = nm(r), i = null == (u = null == ChefScript ? void 0 : ChefScript.prelude) ? void 0 : u.nonce, [4, e.registrationRegister({
                                registrationRegisterRequest: {
                                    identifier: i,
                                    key: r
                                }
                            })]);
                        case 2:
                            return l = (o = c.sent()).robloxApiKeyBase64, [4, tk(void 0, [{
                                robloxSignature: null != (s = o.robloxSignature) ? s : "",
                                robloxVerificationKeyBase64: null != l ? l : "",
                                publicKeySerialized: r
                            }], void 0, function(e) {
                                var t, n, r, a, i, o, l, s = e.publicKeySerialized,
                                    u = e.robloxVerificationKeyBase64,
                                    c = e.robloxSignature;
                                return tx(this, function(e) {
                                    switch (e.label) {
                                        case 0:
                                            return nf(t = np(function() {
                                                return atob(c)
                                            }, function(e) {
                                                return e
                                            })) ? [2, {
                                                i: nq
                                            }] : nf(n = np(function() {
                                                return atob(u)
                                            }, function(e) {
                                                return e
                                            })) ? [2, {
                                                j: nq
                                            }] : (r = n.right.substring(26, n.right.length - 24 - 1), nf(a = np(function() {
                                                return atob(r)
                                            }, function(e) {
                                                return e
                                            })) ? [2, {
                                                k: nq
                                            }] : (i = Uint8Array.from(a.right, function(e) {
                                                return e.charCodeAt(0)
                                            }), [4, nN(function() {
                                                return tk(void 0, void 0, void 0, function() {
                                                    return tx(this, function(e) {
                                                        return [2, window.crypto.subtle.importKey("spki", i, {
                                                            name: "ECDSA",
                                                            namedCurve: "P-256"
                                                        }, !1, ["verify"])]
                                                    })
                                                })
                                            }, function(e) {
                                                return e
                                            })()]));
                                        case 1:
                                            return nf(o = e.sent()) ? [2, {
                                                l: nq
                                            }] : [4, nN(function() {
                                                return window.crypto.subtle.verify({
                                                    name: "ECDSA",
                                                    hash: "SHA-256"
                                                }, o.right, Uint8Array.from(t.right, function(e) {
                                                    return e.charCodeAt(0)
                                                }), Uint8Array.from(s, function(e) {
                                                    return e.charCodeAt(0)
                                                }))
                                            }, function(e) {
                                                return e
                                            })()];
                                        case 2:
                                            return nf(l = e.sent()) ? [2, {
                                                m: nq
                                            }] : l.right ? [2, {
                                                o: nq
                                            }] : [2, {
                                                n: nq
                                            }]
                                    }
                                })
                            })];
                        case 3:
                            return nQ("foo", c.sent()), [2]
                    }
                })
            })
        },
        n0 = new th(new tf({
            basePath: "".concat(nB(), "/rotating-client-service"),
            genericChallengeMiddlewareType: "native",
            credentials: "include"
        })),
        n1 = null,
        n2 = function(e) {
            var t = e.nonce;
            if (null != n1) return n1;
            if (null != document.getElementById("chef-boy-ardee")) return n1 = Promise.resolve();
            var n = document.createElement("script");
            return n.id = "chef-boy-ardee", null != t && (n.nonce = t), n.innerHTML = "const ChefScript = { thunks: {}, prelude: {}, protect: {} }", document.body.appendChild(n), n1 = Promise.race([nX({
                nonce: null != t ? t : null,
                thunk: function() {
                    return nJ()
                }
            }), new Promise(function(e) {
                setTimeout(e, 1e4)
            })])
        },
        n4 = function(e) {
            return Object.values(nn).includes(e)
        },
        n3 = Object.freeze({
            __proto__: null,
            isSupportedByGrasshopper: n4
        }),
        n5 = "Generic Challenge:";
    (o = nV || (nV = {})).assertEqual = e => {}, o.assertIs = function(e) {}, o.assertNever = function(e) {
        throw Error()
    }, o.arrayToEnum = e => {
        let t = {};
        for (let n of e) t[n] = n;
        return t
    }, o.getValidEnumValues = e => {
        let t = o.objectKeys(e).filter(t => "number" != typeof e[e[t]]),
            n = {};
        for (let r of t) n[r] = e[r];
        return o.objectValues(n)
    }, o.objectValues = e => o.objectKeys(e).map(function(t) {
        return e[t]
    }), o.objectKeys = "function" == typeof Object.keys ? e => Object.keys(e) : e => {
        let t = [];
        for (let n in e) Object.prototype.hasOwnProperty.call(e, n) && t.push(n);
        return t
    }, o.find = (e, t) => {
        for (let n of e)
            if (t(n)) return n
    }, o.isInteger = "function" == typeof Number.isInteger ? e => Number.isInteger(e) : e => "number" == typeof e && Number.isFinite(e) && Math.floor(e) === e, o.joinValues = function(e) {
        let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : " | ";
        return e.map(e => "string" == typeof e ? `'${e}'` : e).join(t)
    }, o.jsonStringifyReplacer = (e, t) => "bigint" == typeof t ? t.toString() : t, (nW || (nW = {})).mergeShapes = (e, t) => ({
        ...e,
        ...t
    });
    let n8 = nV.arrayToEnum(["string", "nan", "number", "integer", "float", "boolean", "date", "bigint", "symbol", "function", "undefined", "null", "array", "object", "unknown", "promise", "void", "never", "map", "set"]),
        n9 = e => {
            switch (typeof e) {
                case "undefined":
                    return n8.undefined;
                case "string":
                    return n8.string;
                case "number":
                    return Number.isNaN(e) ? n8.nan : n8.number;
                case "boolean":
                    return n8.boolean;
                case "function":
                    return n8.function;
                case "bigint":
                    return n8.bigint;
                case "symbol":
                    return n8.symbol;
                case "object":
                    return Array.isArray(e) ? n8.array : null === e ? n8.null : e.then && "function" == typeof e.then && e.catch && "function" == typeof e.catch ? n8.promise : "u" > typeof Map && e instanceof Map ? n8.map : "u" > typeof Set && e instanceof Set ? n8.set : "u" > typeof Date && e instanceof Date ? n8.date : n8.object;
                default:
                    return n8.unknown
            }
        },
        n6 = nV.arrayToEnum(["invalid_type", "invalid_literal", "custom", "invalid_union", "invalid_union_discriminator", "invalid_enum_value", "unrecognized_keys", "invalid_arguments", "invalid_return_type", "invalid_date", "invalid_string", "too_small", "too_big", "invalid_intersection_types", "not_multiple_of", "not_finite"]);
    class n7 extends Error {
        get errors() {
            return this.issues
        }
        format(e) {
            let t = e || function(e) {
                    return e.message
                },
                n = {
                    _errors: []
                },
                r = e => {
                    for (let a of e.issues)
                        if ("invalid_union" === a.code) a.unionErrors.map(r);
                        else if ("invalid_return_type" === a.code) r(a.returnTypeError);
                    else if ("invalid_arguments" === a.code) r(a.argumentsError);
                    else if (0 === a.path.length) n._errors.push(t(a));
                    else {
                        let e = n,
                            r = 0;
                        for (; r < a.path.length;) {
                            let n = a.path[r];
                            r === a.path.length - 1 ? (e[n] = e[n] || {
                                _errors: []
                            }, e[n]._errors.push(t(a))) : e[n] = e[n] || {
                                _errors: []
                            }, e = e[n], r++
                        }
                    }
                };
            return r(this), n
        }
        static assert(e) {
            if (!(e instanceof n7)) throw Error(`Not a ZodError: ${e}`)
        }
        toString() {
            return this.message
        }
        get message() {
            return JSON.stringify(this.issues, nV.jsonStringifyReplacer, 2)
        }
        get isEmpty() {
            return 0 === this.issues.length
        }
        flatten() {
            let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : e => e.message,
                t = {},
                n = [];
            for (let r of this.issues) r.path.length > 0 ? (t[r.path[0]] = t[r.path[0]] || [], t[r.path[0]].push(e(r))) : n.push(e(r));
            return {
                formErrors: n,
                fieldErrors: t
            }
        }
        get formErrors() {
            return this.flatten()
        }
        constructor(e) {
            var t;
            super(), t = this, this.issues = [], this.addIssue = e => {
                this.issues = [...this.issues, e]
            }, this.addIssues = function() {
                let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [];
                t.issues = [...t.issues, ...e]
            };
            const n = new.target.prototype;
            Object.setPrototypeOf ? Object.setPrototypeOf(this, n) : this.__proto__ = n, this.name = "ZodError", this.issues = e
        }
    }
    n7.create = e => new n7(e);
    let re = (e, t) => {
        let n;
        switch (e.code) {
            case n6.invalid_type:
                n = e.received === n8.undefined ? "Required" : `Expected ${e.expected}, received ${e.received}`;
                break;
            case n6.invalid_literal:
                n = `Invalid literal value, expected ${JSON.stringify(e.expected,nV.jsonStringifyReplacer)}`;
                break;
            case n6.unrecognized_keys:
                n = `Unrecognized key(s) in object: ${nV.joinValues(e.keys,", ")}`;
                break;
            case n6.invalid_union:
                n = "Invalid input";
                break;
            case n6.invalid_union_discriminator:
                n = `Invalid discriminator value. Expected ${nV.joinValues(e.options)}`;
                break;
            case n6.invalid_enum_value:
                n = `Invalid enum value. Expected ${nV.joinValues(e.options)}, received '${e.received}'`;
                break;
            case n6.invalid_arguments:
                n = "Invalid function arguments";
                break;
            case n6.invalid_return_type:
                n = "Invalid function return type";
                break;
            case n6.invalid_date:
                n = "Invalid date";
                break;
            case n6.invalid_string:
                "object" == typeof e.validation ? "includes" in e.validation ? (n = `Invalid input: must include "${e.validation.includes}"`, "number" == typeof e.validation.position && (n = `${n} at one or more positions greater than or equal to ${e.validation.position}`)) : "startsWith" in e.validation ? n = `Invalid input: must start with "${e.validation.startsWith}"` : "endsWith" in e.validation ? n = `Invalid input: must end with "${e.validation.endsWith}"` : nV.assertNever(e.validation) : n = "regex" !== e.validation ? `Invalid ${e.validation}` : "Invalid";
                break;
            case n6.too_small:
                n = "array" === e.type ? `Array must contain ${e.exact?"exactly":e.inclusive?"at least":"more than"} ${e.minimum} element(s)` : "string" === e.type ? `String must contain ${e.exact?"exactly":e.inclusive?"at least":"over"} ${e.minimum} character(s)` : "number" === e.type ? `Number must be ${e.exact?"exactly equal to ":e.inclusive?"greater than or equal to ":"greater than "}${e.minimum}` : "date" === e.type ? `Date must be ${e.exact?"exactly equal to ":e.inclusive?"greater than or equal to ":"greater than "}${new Date(Number(e.minimum))}` : "Invalid input";
                break;
            case n6.too_big:
                n = "array" === e.type ? `Array must contain ${e.exact?"exactly":e.inclusive?"at most":"less than"} ${e.maximum} element(s)` : "string" === e.type ? `String must contain ${e.exact?"exactly":e.inclusive?"at most":"under"} ${e.maximum} character(s)` : "number" === e.type ? `Number must be ${e.exact?"exactly":e.inclusive?"less than or equal to":"less than"} ${e.maximum}` : "bigint" === e.type ? `BigInt must be ${e.exact?"exactly":e.inclusive?"less than or equal to":"less than"} ${e.maximum}` : "date" === e.type ? `Date must be ${e.exact?"exactly":e.inclusive?"smaller than or equal to":"smaller than"} ${new Date(Number(e.maximum))}` : "Invalid input";
                break;
            case n6.custom:
                n = "Invalid input";
                break;
            case n6.invalid_intersection_types:
                n = "Intersection results could not be merged";
                break;
            case n6.not_multiple_of:
                n = `Number must be a multiple of ${e.multipleOf}`;
                break;
            case n6.not_finite:
                n = "Number must be finite";
                break;
            default:
                n = t.defaultError, nV.assertNever(e)
        }
        return {
            message: n
        }
    };

    function rt(e, t) {
        let n = (e => {
            let {
                data: t,
                path: n,
                errorMaps: r,
                issueData: a
            } = e, i = [...n, ...a.path || []], o = {
                ...a,
                path: i
            };
            if (void 0 !== a.message) return {
                ...a,
                path: i,
                message: a.message
            };
            let l = "";
            for (let e of r.filter(e => !!e).slice().reverse()) l = e(o, {
                data: t,
                defaultError: l
            }).message;
            return {
                ...a,
                path: i,
                message: l
            }
        })({
            issueData: t,
            data: e.data,
            path: e.path,
            errorMaps: [e.common.contextualErrorMap, e.schemaErrorMap, re, void 0].filter(e => !!e)
        });
        e.common.issues.push(n)
    }
    class rn {
        dirty() {
            "valid" === this.value && (this.value = "dirty")
        }
        abort() {
            "aborted" !== this.value && (this.value = "aborted")
        }
        static mergeArray(e, t) {
            let n = [];
            for (let r of t) {
                if ("aborted" === r.status) return rr;
                "dirty" === r.status && e.dirty(), n.push(r.value)
            }
            return {
                status: e.value,
                value: n
            }
        }
        static async mergeObjectAsync(e, t) {
            let n = [];
            for (let e of t) {
                let t = await e.key,
                    r = await e.value;
                n.push({
                    key: t,
                    value: r
                })
            }
            return rn.mergeObjectSync(e, n)
        }
        static mergeObjectSync(e, t) {
            let n = {};
            for (let r of t) {
                let {
                    key: t,
                    value: a
                } = r;
                if ("aborted" === t.status || "aborted" === a.status) return rr;
                "dirty" === t.status && e.dirty(), "dirty" === a.status && e.dirty(), "__proto__" !== t.value && (void 0 !== a.value || r.alwaysSet) && (n[t.value] = a.value)
            }
            return {
                status: e.value,
                value: n
            }
        }
        constructor() {
            this.value = "valid"
        }
    }
    let rr = Object.freeze({
            status: "aborted"
        }),
        ra = e => ({
            status: "dirty",
            value: e
        }),
        ri = e => ({
            status: "valid",
            value: e
        }),
        ro = e => "u" > typeof Promise && e instanceof Promise;
    (l = u || (u = {})).errToObj = e => "string" == typeof e ? {
        message: e
    } : e || {}, l.toString = e => "string" == typeof e ? e : e?.message;
    class rl {
        get path() {
            return this._cachedPath.length || (Array.isArray(this._key) ? this._cachedPath.push(...this._path, ...this._key) : this._cachedPath.push(...this._path, this._key)), this._cachedPath
        }
        constructor(e, t, n, r) {
            this._cachedPath = [], this.parent = e, this.data = t, this._path = n, this._key = r
        }
    }
    let rs = (e, t) => {
        if ("valid" === t.status) return {
            success: !0,
            data: t.value
        };
        if (!e.common.issues.length) throw Error("Validation failed but no issues detected.");
        return {
            success: !1,
            get error() {
                if (this._error) return this._error;
                let t = new n7(e.common.issues);
                return this._error = t, this._error
            }
        }
    };

    function ru(e) {
        if (!e) return {};
        let {
            errorMap: t,
            invalid_type_error: n,
            required_error: r,
            description: a
        } = e;
        if (t && (n || r)) throw Error('Can\'t use "invalid_type_error" or "required_error" in conjunction with custom error map.');
        return t ? {
            errorMap: t,
            description: a
        } : {
            errorMap: (t, a) => {
                let {
                    message: i
                } = e;
                return "invalid_enum_value" === t.code ? {
                    message: i ?? a.defaultError
                } : void 0 === a.data ? {
                    message: i ?? r ?? a.defaultError
                } : "invalid_type" !== t.code ? {
                    message: a.defaultError
                } : {
                    message: i ?? n ?? a.defaultError
                }
            },
            description: a
        }
    }
    class rc {
        get description() {
            return this._def.description
        }
        _getType(e) {
            return n9(e.data)
        }
        _getOrReturnCtx(e, t) {
            return t || {
                common: e.parent.common,
                data: e.data,
                parsedType: n9(e.data),
                schemaErrorMap: this._def.errorMap,
                path: e.path,
                parent: e.parent
            }
        }
        _processInputParams(e) {
            return {
                status: new rn,
                ctx: {
                    common: e.parent.common,
                    data: e.data,
                    parsedType: n9(e.data),
                    schemaErrorMap: this._def.errorMap,
                    path: e.path,
                    parent: e.parent
                }
            }
        }
        _parseSync(e) {
            let t = this._parse(e);
            if (ro(t)) throw Error("Synchronous parse encountered promise.");
            return t
        }
        _parseAsync(e) {
            return Promise.resolve(this._parse(e))
        }
        parse(e, t) {
            let n = this.safeParse(e, t);
            if (n.success) return n.data;
            throw n.error
        }
        safeParse(e, t) {
            let n = {
                    common: {
                        issues: [],
                        async: t?.async ?? !1,
                        contextualErrorMap: t?.errorMap
                    },
                    path: t?.path || [],
                    schemaErrorMap: this._def.errorMap,
                    parent: null,
                    data: e,
                    parsedType: n9(e)
                },
                r = this._parseSync({
                    data: e,
                    path: n.path,
                    parent: n
                });
            return rs(n, r)
        }
        "~validate"(e) {
            let t = {
                common: {
                    issues: [],
                    async: !!this["~standard"].async
                },
                path: [],
                schemaErrorMap: this._def.errorMap,
                parent: null,
                data: e,
                parsedType: n9(e)
            };
            if (!this["~standard"].async) try {
                let n = this._parseSync({
                    data: e,
                    path: [],
                    parent: t
                });
                return "valid" === n.status ? {
                    value: n.value
                } : {
                    issues: t.common.issues
                }
            } catch (e) {
                e?.message?.toLowerCase()?.includes("encountered") && (this["~standard"].async = !0), t.common = {
                    issues: [],
                    async: !0
                }
            }
            return this._parseAsync({
                data: e,
                path: [],
                parent: t
            }).then(e => "valid" === e.status ? {
                value: e.value
            } : {
                issues: t.common.issues
            })
        }
        async parseAsync(e, t) {
            let n = await this.safeParseAsync(e, t);
            if (n.success) return n.data;
            throw n.error
        }
        async safeParseAsync(e, t) {
            let n = {
                    common: {
                        issues: [],
                        contextualErrorMap: t?.errorMap,
                        async: !0
                    },
                    path: t?.path || [],
                    schemaErrorMap: this._def.errorMap,
                    parent: null,
                    data: e,
                    parsedType: n9(e)
                },
                r = this._parse({
                    data: e,
                    path: n.path,
                    parent: n
                });
            return rs(n, await (ro(r) ? r : Promise.resolve(r)))
        }
        refine(e, t) {
            return this._refinement((n, r) => {
                let a = e(n),
                    i = () => r.addIssue({
                        code: n6.custom,
                        ..."string" == typeof t || void 0 === t ? {
                            message: t
                        } : "function" == typeof t ? t(n) : t
                    });
                return "u" > typeof Promise && a instanceof Promise ? a.then(e => !!e || (i(), !1)) : !!a || (i(), !1)
            })
        }
        refinement(e, t) {
            return this._refinement((n, r) => !!e(n) || (r.addIssue("function" == typeof t ? t(n, r) : t), !1))
        }
        _refinement(e) {
            return new rJ({
                schema: this,
                typeName: c.ZodEffects,
                effect: {
                    type: "refinement",
                    refinement: e
                }
            })
        }
        superRefine(e) {
            return this._refinement(e)
        }
        optional() {
            return r0.create(this, this._def)
        }
        nullable() {
            return r1.create(this, this._def)
        }
        nullish() {
            return this.nullable().optional()
        }
        array() {
            return rU.create(this)
        }
        promise() {
            return rX.create(this, this._def)
        }
        or(e) {
            return rq.create([this, e], this._def)
        }
        and(e) {
            return r$.create(this, e, this._def)
        }
        transform(e) {
            return new rJ({
                ...ru(this._def),
                schema: this,
                typeName: c.ZodEffects,
                effect: {
                    type: "transform",
                    transform: e
                }
            })
        }
        default (e) {
            return new r2({
                ...ru(this._def),
                innerType: this,
                defaultValue: "function" == typeof e ? e : () => e,
                typeName: c.ZodDefault
            })
        }
        brand() {
            return new r5({
                typeName: c.ZodBranded,
                type: this,
                ...ru(this._def)
            })
        } catch (e) {
            return new r4({
                ...ru(this._def),
                innerType: this,
                catchValue: "function" == typeof e ? e : () => e,
                typeName: c.ZodCatch
            })
        }
        describe(e) {
            return new(0, this.constructor)({
                ...this._def,
                description: e
            })
        }
        pipe(e) {
            return r8.create(this, e)
        }
        readonly() {
            return r9.create(this)
        }
        isOptional() {
            return this.safeParse(void 0).success
        }
        isNullable() {
            return this.safeParse(null).success
        }
        constructor(e) {
            this.spa = this.safeParseAsync, this._def = e, this.parse = this.parse.bind(this), this.safeParse = this.safeParse.bind(this), this.parseAsync = this.parseAsync.bind(this), this.safeParseAsync = this.safeParseAsync.bind(this), this.spa = this.spa.bind(this), this.refine = this.refine.bind(this), this.refinement = this.refinement.bind(this), this.superRefine = this.superRefine.bind(this), this.optional = this.optional.bind(this), this.nullable = this.nullable.bind(this), this.nullish = this.nullish.bind(this), this.array = this.array.bind(this), this.promise = this.promise.bind(this), this.or = this.or.bind(this), this.and = this.and.bind(this), this.transform = this.transform.bind(this), this.brand = this.brand.bind(this), this.default = this.default.bind(this), this.catch = this.catch.bind(this), this.describe = this.describe.bind(this), this.pipe = this.pipe.bind(this), this.readonly = this.readonly.bind(this), this.isNullable = this.isNullable.bind(this), this.isOptional = this.isOptional.bind(this), this["~standard"] = {
                version: 1,
                vendor: "zod",
                validate: e => this["~validate"](e)
            }
        }
    }
    let rd = /^c[^\s-]{8,}$/i,
        rf = /^[0-9a-z]+$/,
        rp = /^[0-9A-HJKMNP-TV-Z]{26}$/i,
        rh = /^[0-9a-fA-F]{8}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{12}$/i,
        rm = /^[a-z0-9_-]{21}$/i,
        rg = /^[A-Za-z0-9-_]+\.[A-Za-z0-9-_]+\.[A-Za-z0-9-_]*$/,
        rv = /^[-+]?P(?!$)(?:(?:[-+]?\d+Y)|(?:[-+]?\d+[.,]\d+Y$))?(?:(?:[-+]?\d+M)|(?:[-+]?\d+[.,]\d+M$))?(?:(?:[-+]?\d+W)|(?:[-+]?\d+[.,]\d+W$))?(?:(?:[-+]?\d+D)|(?:[-+]?\d+[.,]\d+D$))?(?:T(?=[\d+-])(?:(?:[-+]?\d+H)|(?:[-+]?\d+[.,]\d+H$))?(?:(?:[-+]?\d+M)|(?:[-+]?\d+[.,]\d+M$))?(?:[-+]?\d+(?:[.,]\d+)?S)?)??$/,
        ry = /^(?!\.)(?!.*\.\.)([A-Z0-9_'+\-\.]*)[A-Z0-9_+-]@([A-Z0-9][A-Z0-9\-]*\.)+[A-Z]{2,}$/i,
        rb = /^(?:(?:25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\.){3}(?:25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])$/,
        rw = /^(?:(?:25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\.){3}(?:25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\/(3[0-2]|[12]?[0-9])$/,
        r_ = /^(([0-9a-fA-F]{1,4}:){7,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:)|fe80:(:[0-9a-fA-F]{0,4}){0,4}%[0-9a-zA-Z]{1,}|::(ffff(:0{1,4}){0,1}:){0,1}((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])|([0-9a-fA-F]{1,4}:){1,4}:((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9]))$/,
        rS = /^(([0-9a-fA-F]{1,4}:){7,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:)|fe80:(:[0-9a-fA-F]{0,4}){0,4}%[0-9a-zA-Z]{1,}|::(ffff(:0{1,4}){0,1}:){0,1}((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])|([0-9a-fA-F]{1,4}:){1,4}:((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9]))\/(12[0-8]|1[01][0-9]|[1-9]?[0-9])$/,
        rk = /^([0-9a-zA-Z+/]{4})*(([0-9a-zA-Z+/]{2}==)|([0-9a-zA-Z+/]{3}=))?$/,
        rx = /^([0-9a-zA-Z-_]{4})*(([0-9a-zA-Z-_]{2}(==)?)|([0-9a-zA-Z-_]{3}(=)?))?$/,
        rE = "((\\d\\d[2468][048]|\\d\\d[13579][26]|\\d\\d0[48]|[02468][048]00|[13579][26]00)-02-29|\\d{4}-((0[13578]|1[02])-(0[1-9]|[12]\\d|3[01])|(0[469]|11)-(0[1-9]|[12]\\d|30)|(02)-(0[1-9]|1\\d|2[0-8])))",
        rT = RegExp(`^${rE}$`);

    function rN(e) {
        let t = "[0-5]\\d";
        return e.precision ? t = `${t}\\.\\d{${e.precision}}` : null == e.precision && (t = `${t}(\\.\\d+)?`), `([01]\\d|2[0-3]):[0-5]\\d(:${t})${e.precision?"+":"?"}`
    }
    class rC extends rc {
        _parse(e) {
            var n, r, a, i;
            let o;
            if (this._def.coerce && (e.data = String(e.data)), this._getType(e) !== n8.string) {
                let t = this._getOrReturnCtx(e);
                return rt(t, {
                    code: n6.invalid_type,
                    expected: n8.string,
                    received: t.parsedType
                }), rr
            }
            let l = new rn;
            for (let s of this._def.checks)
                if ("min" === s.kind) e.data.length < s.value && (rt(o = this._getOrReturnCtx(e, o), {
                    code: n6.too_small,
                    minimum: s.value,
                    type: "string",
                    inclusive: !0,
                    exact: !1,
                    message: s.message
                }), l.dirty());
                else if ("max" === s.kind) e.data.length > s.value && (rt(o = this._getOrReturnCtx(e, o), {
                code: n6.too_big,
                maximum: s.value,
                type: "string",
                inclusive: !0,
                exact: !1,
                message: s.message
            }), l.dirty());
            else if ("length" === s.kind) {
                let t = e.data.length > s.value,
                    n = e.data.length < s.value;
                (t || n) && (o = this._getOrReturnCtx(e, o), t ? rt(o, {
                    code: n6.too_big,
                    maximum: s.value,
                    type: "string",
                    inclusive: !0,
                    exact: !0,
                    message: s.message
                }) : n && rt(o, {
                    code: n6.too_small,
                    minimum: s.value,
                    type: "string",
                    inclusive: !0,
                    exact: !0,
                    message: s.message
                }), l.dirty())
            } else if ("email" === s.kind) ry.test(e.data) || (rt(o = this._getOrReturnCtx(e, o), {
                validation: "email",
                code: n6.invalid_string,
                message: s.message
            }), l.dirty());
            else if ("emoji" === s.kind) t || (t = RegExp("^(\\p{Extended_Pictographic}|\\p{Emoji_Component})+$", "u")), t.test(e.data) || (rt(o = this._getOrReturnCtx(e, o), {
                validation: "emoji",
                code: n6.invalid_string,
                message: s.message
            }), l.dirty());
            else if ("uuid" === s.kind) rh.test(e.data) || (rt(o = this._getOrReturnCtx(e, o), {
                validation: "uuid",
                code: n6.invalid_string,
                message: s.message
            }), l.dirty());
            else if ("nanoid" === s.kind) rm.test(e.data) || (rt(o = this._getOrReturnCtx(e, o), {
                validation: "nanoid",
                code: n6.invalid_string,
                message: s.message
            }), l.dirty());
            else if ("cuid" === s.kind) rd.test(e.data) || (rt(o = this._getOrReturnCtx(e, o), {
                validation: "cuid",
                code: n6.invalid_string,
                message: s.message
            }), l.dirty());
            else if ("cuid2" === s.kind) rf.test(e.data) || (rt(o = this._getOrReturnCtx(e, o), {
                validation: "cuid2",
                code: n6.invalid_string,
                message: s.message
            }), l.dirty());
            else if ("ulid" === s.kind) rp.test(e.data) || (rt(o = this._getOrReturnCtx(e, o), {
                validation: "ulid",
                code: n6.invalid_string,
                message: s.message
            }), l.dirty());
            else if ("url" === s.kind) try {
                new URL(e.data)
            } catch {
                rt(o = this._getOrReturnCtx(e, o), {
                    validation: "url",
                    code: n6.invalid_string,
                    message: s.message
                }), l.dirty()
            } else "regex" === s.kind ? (s.regex.lastIndex = 0, s.regex.test(e.data) || (rt(o = this._getOrReturnCtx(e, o), {
                validation: "regex",
                code: n6.invalid_string,
                message: s.message
            }), l.dirty())) : "trim" === s.kind ? e.data = e.data.trim() : "includes" === s.kind ? e.data.includes(s.value, s.position) || (rt(o = this._getOrReturnCtx(e, o), {
                code: n6.invalid_string,
                validation: {
                    includes: s.value,
                    position: s.position
                },
                message: s.message
            }), l.dirty()) : "toLowerCase" === s.kind ? e.data = e.data.toLowerCase() : "toUpperCase" === s.kind ? e.data = e.data.toUpperCase() : "startsWith" === s.kind ? e.data.startsWith(s.value) || (rt(o = this._getOrReturnCtx(e, o), {
                code: n6.invalid_string,
                validation: {
                    startsWith: s.value
                },
                message: s.message
            }), l.dirty()) : "endsWith" === s.kind ? e.data.endsWith(s.value) || (rt(o = this._getOrReturnCtx(e, o), {
                code: n6.invalid_string,
                validation: {
                    endsWith: s.value
                },
                message: s.message
            }), l.dirty()) : "datetime" === s.kind ? (function(e) {
                let t = `${rE}T${rN(e)}`,
                    n = [];
                return n.push(e.local ? "Z?" : "Z"), e.offset && n.push("([+-]\\d{2}:?\\d{2})"), t = `${t}(${n.join("|")})`, RegExp(`^${t}$`)
            })(s).test(e.data) || (rt(o = this._getOrReturnCtx(e, o), {
                code: n6.invalid_string,
                validation: "datetime",
                message: s.message
            }), l.dirty()) : "date" === s.kind ? rT.test(e.data) || (rt(o = this._getOrReturnCtx(e, o), {
                code: n6.invalid_string,
                validation: "date",
                message: s.message
            }), l.dirty()) : "time" === s.kind ? RegExp(`^${rN(s)}$`).test(e.data) || (rt(o = this._getOrReturnCtx(e, o), {
                code: n6.invalid_string,
                validation: "time",
                message: s.message
            }), l.dirty()) : "duration" === s.kind ? rv.test(e.data) || (rt(o = this._getOrReturnCtx(e, o), {
                validation: "duration",
                code: n6.invalid_string,
                message: s.message
            }), l.dirty()) : "ip" === s.kind ? (n = e.data, ("v4" !== (r = s.version) && r || !rb.test(n)) && ("v6" !== r && r || !r_.test(n)) && (rt(o = this._getOrReturnCtx(e, o), {
                validation: "ip",
                code: n6.invalid_string,
                message: s.message
            }), l.dirty())) : "jwt" === s.kind ? function(e, t) {
                if (!rg.test(e)) return !1;
                try {
                    let [n] = e.split("."), r = n.replace(/-/g, "+").replace(/_/g, "/").padEnd(n.length + (4 - n.length % 4) % 4, "="), a = JSON.parse(atob(r));
                    return "object" == typeof a && null !== a && (!("typ" in a) || "JWT" === a?.typ) && !!a.alg && (!t || a.alg === t)
                } catch {
                    return !1
                }
            }(e.data, s.alg) || (rt(o = this._getOrReturnCtx(e, o), {
                validation: "jwt",
                code: n6.invalid_string,
                message: s.message
            }), l.dirty()) : "cidr" === s.kind ? (a = e.data, ("v4" !== (i = s.version) && i || !rw.test(a)) && ("v6" !== i && i || !rS.test(a)) && (rt(o = this._getOrReturnCtx(e, o), {
                validation: "cidr",
                code: n6.invalid_string,
                message: s.message
            }), l.dirty())) : "base64" === s.kind ? rk.test(e.data) || (rt(o = this._getOrReturnCtx(e, o), {
                validation: "base64",
                code: n6.invalid_string,
                message: s.message
            }), l.dirty()) : "base64url" === s.kind ? rx.test(e.data) || (rt(o = this._getOrReturnCtx(e, o), {
                validation: "base64url",
                code: n6.invalid_string,
                message: s.message
            }), l.dirty()) : nV.assertNever(s);
            return {
                status: l.value,
                value: e.data
            }
        }
        _regex(e, t, n) {
            return this.refinement(t => e.test(t), {
                validation: t,
                code: n6.invalid_string,
                ...u.errToObj(n)
            })
        }
        _addCheck(e) {
            return new rC({
                ...this._def,
                checks: [...this._def.checks, e]
            })
        }
        email(e) {
            return this._addCheck({
                kind: "email",
                ...u.errToObj(e)
            })
        }
        url(e) {
            return this._addCheck({
                kind: "url",
                ...u.errToObj(e)
            })
        }
        emoji(e) {
            return this._addCheck({
                kind: "emoji",
                ...u.errToObj(e)
            })
        }
        uuid(e) {
            return this._addCheck({
                kind: "uuid",
                ...u.errToObj(e)
            })
        }
        nanoid(e) {
            return this._addCheck({
                kind: "nanoid",
                ...u.errToObj(e)
            })
        }
        cuid(e) {
            return this._addCheck({
                kind: "cuid",
                ...u.errToObj(e)
            })
        }
        cuid2(e) {
            return this._addCheck({
                kind: "cuid2",
                ...u.errToObj(e)
            })
        }
        ulid(e) {
            return this._addCheck({
                kind: "ulid",
                ...u.errToObj(e)
            })
        }
        base64(e) {
            return this._addCheck({
                kind: "base64",
                ...u.errToObj(e)
            })
        }
        base64url(e) {
            return this._addCheck({
                kind: "base64url",
                ...u.errToObj(e)
            })
        }
        jwt(e) {
            return this._addCheck({
                kind: "jwt",
                ...u.errToObj(e)
            })
        }
        ip(e) {
            return this._addCheck({
                kind: "ip",
                ...u.errToObj(e)
            })
        }
        cidr(e) {
            return this._addCheck({
                kind: "cidr",
                ...u.errToObj(e)
            })
        }
        datetime(e) {
            return "string" == typeof e ? this._addCheck({
                kind: "datetime",
                precision: null,
                offset: !1,
                local: !1,
                message: e
            }) : this._addCheck({
                kind: "datetime",
                precision: void 0 === e?.precision ? null : e?.precision,
                offset: e?.offset ?? !1,
                local: e?.local ?? !1,
                ...u.errToObj(e?.message)
            })
        }
        date(e) {
            return this._addCheck({
                kind: "date",
                message: e
            })
        }
        time(e) {
            return "string" == typeof e ? this._addCheck({
                kind: "time",
                precision: null,
                message: e
            }) : this._addCheck({
                kind: "time",
                precision: void 0 === e?.precision ? null : e?.precision,
                ...u.errToObj(e?.message)
            })
        }
        duration(e) {
            return this._addCheck({
                kind: "duration",
                ...u.errToObj(e)
            })
        }
        regex(e, t) {
            return this._addCheck({
                kind: "regex",
                regex: e,
                ...u.errToObj(t)
            })
        }
        includes(e, t) {
            return this._addCheck({
                kind: "includes",
                value: e,
                position: t?.position,
                ...u.errToObj(t?.message)
            })
        }
        startsWith(e, t) {
            return this._addCheck({
                kind: "startsWith",
                value: e,
                ...u.errToObj(t)
            })
        }
        endsWith(e, t) {
            return this._addCheck({
                kind: "endsWith",
                value: e,
                ...u.errToObj(t)
            })
        }
        min(e, t) {
            return this._addCheck({
                kind: "min",
                value: e,
                ...u.errToObj(t)
            })
        }
        max(e, t) {
            return this._addCheck({
                kind: "max",
                value: e,
                ...u.errToObj(t)
            })
        }
        length(e, t) {
            return this._addCheck({
                kind: "length",
                value: e,
                ...u.errToObj(t)
            })
        }
        nonempty(e) {
            return this.min(1, u.errToObj(e))
        }
        trim() {
            return new rC({
                ...this._def,
                checks: [...this._def.checks, {
                    kind: "trim"
                }]
            })
        }
        toLowerCase() {
            return new rC({
                ...this._def,
                checks: [...this._def.checks, {
                    kind: "toLowerCase"
                }]
            })
        }
        toUpperCase() {
            return new rC({
                ...this._def,
                checks: [...this._def.checks, {
                    kind: "toUpperCase"
                }]
            })
        }
        get isDatetime() {
            return !!this._def.checks.find(e => "datetime" === e.kind)
        }
        get isDate() {
            return !!this._def.checks.find(e => "date" === e.kind)
        }
        get isTime() {
            return !!this._def.checks.find(e => "time" === e.kind)
        }
        get isDuration() {
            return !!this._def.checks.find(e => "duration" === e.kind)
        }
        get isEmail() {
            return !!this._def.checks.find(e => "email" === e.kind)
        }
        get isURL() {
            return !!this._def.checks.find(e => "url" === e.kind)
        }
        get isEmoji() {
            return !!this._def.checks.find(e => "emoji" === e.kind)
        }
        get isUUID() {
            return !!this._def.checks.find(e => "uuid" === e.kind)
        }
        get isNANOID() {
            return !!this._def.checks.find(e => "nanoid" === e.kind)
        }
        get isCUID() {
            return !!this._def.checks.find(e => "cuid" === e.kind)
        }
        get isCUID2() {
            return !!this._def.checks.find(e => "cuid2" === e.kind)
        }
        get isULID() {
            return !!this._def.checks.find(e => "ulid" === e.kind)
        }
        get isIP() {
            return !!this._def.checks.find(e => "ip" === e.kind)
        }
        get isCIDR() {
            return !!this._def.checks.find(e => "cidr" === e.kind)
        }
        get isBase64() {
            return !!this._def.checks.find(e => "base64" === e.kind)
        }
        get isBase64url() {
            return !!this._def.checks.find(e => "base64url" === e.kind)
        }
        get minLength() {
            let e = null;
            for (let t of this._def.checks) "min" === t.kind && (null === e || t.value > e) && (e = t.value);
            return e
        }
        get maxLength() {
            let e = null;
            for (let t of this._def.checks) "max" === t.kind && (null === e || t.value < e) && (e = t.value);
            return e
        }
    }
    rC.create = e => new rC({
        checks: [],
        typeName: c.ZodString,
        coerce: e?.coerce ?? !1,
        ...ru(e)
    });
    class rO extends rc {
        _parse(e) {
            let t;
            if (this._def.coerce && (e.data = Number(e.data)), this._getType(e) !== n8.number) {
                let t = this._getOrReturnCtx(e);
                return rt(t, {
                    code: n6.invalid_type,
                    expected: n8.number,
                    received: t.parsedType
                }), rr
            }
            let n = new rn;
            for (let r of this._def.checks) "int" === r.kind ? nV.isInteger(e.data) || (rt(t = this._getOrReturnCtx(e, t), {
                code: n6.invalid_type,
                expected: "integer",
                received: "float",
                message: r.message
            }), n.dirty()) : "min" === r.kind ? (r.inclusive ? e.data < r.value : e.data <= r.value) && (rt(t = this._getOrReturnCtx(e, t), {
                code: n6.too_small,
                minimum: r.value,
                type: "number",
                inclusive: r.inclusive,
                exact: !1,
                message: r.message
            }), n.dirty()) : "max" === r.kind ? (r.inclusive ? e.data > r.value : e.data >= r.value) && (rt(t = this._getOrReturnCtx(e, t), {
                code: n6.too_big,
                maximum: r.value,
                type: "number",
                inclusive: r.inclusive,
                exact: !1,
                message: r.message
            }), n.dirty()) : "multipleOf" === r.kind ? 0 !== function(e, t) {
                let n = (e.toString().split(".")[1] || "").length,
                    r = (t.toString().split(".")[1] || "").length,
                    a = n > r ? n : r;
                return Number.parseInt(e.toFixed(a).replace(".", "")) % Number.parseInt(t.toFixed(a).replace(".", "")) / 10 ** a
            }(e.data, r.value) && (rt(t = this._getOrReturnCtx(e, t), {
                code: n6.not_multiple_of,
                multipleOf: r.value,
                message: r.message
            }), n.dirty()) : "finite" === r.kind ? Number.isFinite(e.data) || (rt(t = this._getOrReturnCtx(e, t), {
                code: n6.not_finite,
                message: r.message
            }), n.dirty()) : nV.assertNever(r);
            return {
                status: n.value,
                value: e.data
            }
        }
        gte(e, t) {
            return this.setLimit("min", e, !0, u.toString(t))
        }
        gt(e, t) {
            return this.setLimit("min", e, !1, u.toString(t))
        }
        lte(e, t) {
            return this.setLimit("max", e, !0, u.toString(t))
        }
        lt(e, t) {
            return this.setLimit("max", e, !1, u.toString(t))
        }
        setLimit(e, t, n, r) {
            return new rO({
                ...this._def,
                checks: [...this._def.checks, {
                    kind: e,
                    value: t,
                    inclusive: n,
                    message: u.toString(r)
                }]
            })
        }
        _addCheck(e) {
            return new rO({
                ...this._def,
                checks: [...this._def.checks, e]
            })
        }
        int(e) {
            return this._addCheck({
                kind: "int",
                message: u.toString(e)
            })
        }
        positive(e) {
            return this._addCheck({
                kind: "min",
                value: 0,
                inclusive: !1,
                message: u.toString(e)
            })
        }
        negative(e) {
            return this._addCheck({
                kind: "max",
                value: 0,
                inclusive: !1,
                message: u.toString(e)
            })
        }
        nonpositive(e) {
            return this._addCheck({
                kind: "max",
                value: 0,
                inclusive: !0,
                message: u.toString(e)
            })
        }
        nonnegative(e) {
            return this._addCheck({
                kind: "min",
                value: 0,
                inclusive: !0,
                message: u.toString(e)
            })
        }
        multipleOf(e, t) {
            return this._addCheck({
                kind: "multipleOf",
                value: e,
                message: u.toString(t)
            })
        }
        finite(e) {
            return this._addCheck({
                kind: "finite",
                message: u.toString(e)
            })
        }
        safe(e) {
            return this._addCheck({
                kind: "min",
                inclusive: !0,
                value: Number.MIN_SAFE_INTEGER,
                message: u.toString(e)
            })._addCheck({
                kind: "max",
                inclusive: !0,
                value: Number.MAX_SAFE_INTEGER,
                message: u.toString(e)
            })
        }
        get minValue() {
            let e = null;
            for (let t of this._def.checks) "min" === t.kind && (null === e || t.value > e) && (e = t.value);
            return e
        }
        get maxValue() {
            let e = null;
            for (let t of this._def.checks) "max" === t.kind && (null === e || t.value < e) && (e = t.value);
            return e
        }
        get isInt() {
            return !!this._def.checks.find(e => "int" === e.kind || "multipleOf" === e.kind && nV.isInteger(e.value))
        }
        get isFinite() {
            let e = null,
                t = null;
            for (let n of this._def.checks) {
                if ("finite" === n.kind || "int" === n.kind || "multipleOf" === n.kind) return !0;
                "min" === n.kind ? (null === t || n.value > t) && (t = n.value) : "max" === n.kind && (null === e || n.value < e) && (e = n.value)
            }
            return Number.isFinite(t) && Number.isFinite(e)
        }
        constructor() {
            super(...arguments), this.min = this.gte, this.max = this.lte, this.step = this.multipleOf
        }
    }
    rO.create = e => new rO({
        checks: [],
        typeName: c.ZodNumber,
        coerce: e?.coerce || !1,
        ...ru(e)
    });
    class rR extends rc {
        _parse(e) {
            let t;
            if (this._def.coerce) try {
                e.data = BigInt(e.data)
            } catch {
                return this._getInvalidInput(e)
            }
            if (this._getType(e) !== n8.bigint) return this._getInvalidInput(e);
            let n = new rn;
            for (let r of this._def.checks) "min" === r.kind ? (r.inclusive ? e.data < r.value : e.data <= r.value) && (rt(t = this._getOrReturnCtx(e, t), {
                code: n6.too_small,
                type: "bigint",
                minimum: r.value,
                inclusive: r.inclusive,
                message: r.message
            }), n.dirty()) : "max" === r.kind ? (r.inclusive ? e.data > r.value : e.data >= r.value) && (rt(t = this._getOrReturnCtx(e, t), {
                code: n6.too_big,
                type: "bigint",
                maximum: r.value,
                inclusive: r.inclusive,
                message: r.message
            }), n.dirty()) : "multipleOf" === r.kind ? e.data % r.value !== BigInt(0) && (rt(t = this._getOrReturnCtx(e, t), {
                code: n6.not_multiple_of,
                multipleOf: r.value,
                message: r.message
            }), n.dirty()) : nV.assertNever(r);
            return {
                status: n.value,
                value: e.data
            }
        }
        _getInvalidInput(e) {
            let t = this._getOrReturnCtx(e);
            return rt(t, {
                code: n6.invalid_type,
                expected: n8.bigint,
                received: t.parsedType
            }), rr
        }
        gte(e, t) {
            return this.setLimit("min", e, !0, u.toString(t))
        }
        gt(e, t) {
            return this.setLimit("min", e, !1, u.toString(t))
        }
        lte(e, t) {
            return this.setLimit("max", e, !0, u.toString(t))
        }
        lt(e, t) {
            return this.setLimit("max", e, !1, u.toString(t))
        }
        setLimit(e, t, n, r) {
            return new rR({
                ...this._def,
                checks: [...this._def.checks, {
                    kind: e,
                    value: t,
                    inclusive: n,
                    message: u.toString(r)
                }]
            })
        }
        _addCheck(e) {
            return new rR({
                ...this._def,
                checks: [...this._def.checks, e]
            })
        }
        positive(e) {
            return this._addCheck({
                kind: "min",
                value: BigInt(0),
                inclusive: !1,
                message: u.toString(e)
            })
        }
        negative(e) {
            return this._addCheck({
                kind: "max",
                value: BigInt(0),
                inclusive: !1,
                message: u.toString(e)
            })
        }
        nonpositive(e) {
            return this._addCheck({
                kind: "max",
                value: BigInt(0),
                inclusive: !0,
                message: u.toString(e)
            })
        }
        nonnegative(e) {
            return this._addCheck({
                kind: "min",
                value: BigInt(0),
                inclusive: !0,
                message: u.toString(e)
            })
        }
        multipleOf(e, t) {
            return this._addCheck({
                kind: "multipleOf",
                value: e,
                message: u.toString(t)
            })
        }
        get minValue() {
            let e = null;
            for (let t of this._def.checks) "min" === t.kind && (null === e || t.value > e) && (e = t.value);
            return e
        }
        get maxValue() {
            let e = null;
            for (let t of this._def.checks) "max" === t.kind && (null === e || t.value < e) && (e = t.value);
            return e
        }
        constructor() {
            super(...arguments), this.min = this.gte, this.max = this.lte
        }
    }
    rR.create = e => new rR({
        checks: [],
        typeName: c.ZodBigInt,
        coerce: e?.coerce ?? !1,
        ...ru(e)
    });
    class rP extends rc {
        _parse(e) {
            if (this._def.coerce && (e.data = !!e.data), this._getType(e) !== n8.boolean) {
                let t = this._getOrReturnCtx(e);
                return rt(t, {
                    code: n6.invalid_type,
                    expected: n8.boolean,
                    received: t.parsedType
                }), rr
            }
            return ri(e.data)
        }
    }
    rP.create = e => new rP({
        typeName: c.ZodBoolean,
        coerce: e?.coerce || !1,
        ...ru(e)
    });
    class rI extends rc {
        _parse(e) {
            let t;
            if (this._def.coerce && (e.data = new Date(e.data)), this._getType(e) !== n8.date) {
                let t = this._getOrReturnCtx(e);
                return rt(t, {
                    code: n6.invalid_type,
                    expected: n8.date,
                    received: t.parsedType
                }), rr
            }
            if (Number.isNaN(e.data.getTime())) return rt(this._getOrReturnCtx(e), {
                code: n6.invalid_date
            }), rr;
            let n = new rn;
            for (let r of this._def.checks) "min" === r.kind ? e.data.getTime() < r.value && (rt(t = this._getOrReturnCtx(e, t), {
                code: n6.too_small,
                message: r.message,
                inclusive: !0,
                exact: !1,
                minimum: r.value,
                type: "date"
            }), n.dirty()) : "max" === r.kind ? e.data.getTime() > r.value && (rt(t = this._getOrReturnCtx(e, t), {
                code: n6.too_big,
                message: r.message,
                inclusive: !0,
                exact: !1,
                maximum: r.value,
                type: "date"
            }), n.dirty()) : nV.assertNever(r);
            return {
                status: n.value,
                value: new Date(e.data.getTime())
            }
        }
        _addCheck(e) {
            return new rI({
                ...this._def,
                checks: [...this._def.checks, e]
            })
        }
        min(e, t) {
            return this._addCheck({
                kind: "min",
                value: e.getTime(),
                message: u.toString(t)
            })
        }
        max(e, t) {
            return this._addCheck({
                kind: "max",
                value: e.getTime(),
                message: u.toString(t)
            })
        }
        get minDate() {
            let e = null;
            for (let t of this._def.checks) "min" === t.kind && (null === e || t.value > e) && (e = t.value);
            return null != e ? new Date(e) : null
        }
        get maxDate() {
            let e = null;
            for (let t of this._def.checks) "max" === t.kind && (null === e || t.value < e) && (e = t.value);
            return null != e ? new Date(e) : null
        }
    }
    rI.create = e => new rI({
        checks: [],
        coerce: e?.coerce || !1,
        typeName: c.ZodDate,
        ...ru(e)
    });
    class rA extends rc {
        _parse(e) {
            if (this._getType(e) !== n8.symbol) {
                let t = this._getOrReturnCtx(e);
                return rt(t, {
                    code: n6.invalid_type,
                    expected: n8.symbol,
                    received: t.parsedType
                }), rr
            }
            return ri(e.data)
        }
    }
    rA.create = e => new rA({
        typeName: c.ZodSymbol,
        ...ru(e)
    });
    class rL extends rc {
        _parse(e) {
            if (this._getType(e) !== n8.undefined) {
                let t = this._getOrReturnCtx(e);
                return rt(t, {
                    code: n6.invalid_type,
                    expected: n8.undefined,
                    received: t.parsedType
                }), rr
            }
            return ri(e.data)
        }
    }
    rL.create = e => new rL({
        typeName: c.ZodUndefined,
        ...ru(e)
    });
    class rD extends rc {
        _parse(e) {
            if (this._getType(e) !== n8.null) {
                let t = this._getOrReturnCtx(e);
                return rt(t, {
                    code: n6.invalid_type,
                    expected: n8.null,
                    received: t.parsedType
                }), rr
            }
            return ri(e.data)
        }
    }
    rD.create = e => new rD({
        typeName: c.ZodNull,
        ...ru(e)
    });
    class rM extends rc {
        _parse(e) {
            return ri(e.data)
        }
        constructor() {
            super(...arguments), this._any = !0
        }
    }
    rM.create = e => new rM({
        typeName: c.ZodAny,
        ...ru(e)
    });
    class rz extends rc {
        _parse(e) {
            return ri(e.data)
        }
        constructor() {
            super(...arguments), this._unknown = !0
        }
    }
    rz.create = e => new rz({
        typeName: c.ZodUnknown,
        ...ru(e)
    });
    class rF extends rc {
        _parse(e) {
            let t = this._getOrReturnCtx(e);
            return rt(t, {
                code: n6.invalid_type,
                expected: n8.never,
                received: t.parsedType
            }), rr
        }
    }
    rF.create = e => new rF({
        typeName: c.ZodNever,
        ...ru(e)
    });
    class rj extends rc {
        _parse(e) {
            if (this._getType(e) !== n8.undefined) {
                let t = this._getOrReturnCtx(e);
                return rt(t, {
                    code: n6.invalid_type,
                    expected: n8.void,
                    received: t.parsedType
                }), rr
            }
            return ri(e.data)
        }
    }
    rj.create = e => new rj({
        typeName: c.ZodVoid,
        ...ru(e)
    });
    class rU extends rc {
        _parse(e) {
            let {
                ctx: t,
                status: n
            } = this._processInputParams(e), r = this._def;
            if (t.parsedType !== n8.array) return rt(t, {
                code: n6.invalid_type,
                expected: n8.array,
                received: t.parsedType
            }), rr;
            if (null !== r.exactLength) {
                let e = t.data.length > r.exactLength.value,
                    a = t.data.length < r.exactLength.value;
                (e || a) && (rt(t, {
                    code: e ? n6.too_big : n6.too_small,
                    minimum: a ? r.exactLength.value : void 0,
                    maximum: e ? r.exactLength.value : void 0,
                    type: "array",
                    inclusive: !0,
                    exact: !0,
                    message: r.exactLength.message
                }), n.dirty())
            }
            if (null !== r.minLength && t.data.length < r.minLength.value && (rt(t, {
                    code: n6.too_small,
                    minimum: r.minLength.value,
                    type: "array",
                    inclusive: !0,
                    exact: !1,
                    message: r.minLength.message
                }), n.dirty()), null !== r.maxLength && t.data.length > r.maxLength.value && (rt(t, {
                    code: n6.too_big,
                    maximum: r.maxLength.value,
                    type: "array",
                    inclusive: !0,
                    exact: !1,
                    message: r.maxLength.message
                }), n.dirty()), t.common.async) return Promise.all([...t.data].map((e, n) => r.type._parseAsync(new rl(t, e, t.path, n)))).then(e => rn.mergeArray(n, e));
            let a = [...t.data].map((e, n) => r.type._parseSync(new rl(t, e, t.path, n)));
            return rn.mergeArray(n, a)
        }
        get element() {
            return this._def.type
        }
        min(e, t) {
            return new rU({
                ...this._def,
                minLength: {
                    value: e,
                    message: u.toString(t)
                }
            })
        }
        max(e, t) {
            return new rU({
                ...this._def,
                maxLength: {
                    value: e,
                    message: u.toString(t)
                }
            })
        }
        length(e, t) {
            return new rU({
                ...this._def,
                exactLength: {
                    value: e,
                    message: u.toString(t)
                }
            })
        }
        nonempty(e) {
            return this.min(1, e)
        }
    }
    rU.create = (e, t) => new rU({
        type: e,
        minLength: null,
        maxLength: null,
        exactLength: null,
        typeName: c.ZodArray,
        ...ru(t)
    });
    class rB extends rc {
        _getCached() {
            if (null !== this._cached) return this._cached;
            let e = this._def.shape(),
                t = nV.objectKeys(e);
            return this._cached = {
                shape: e,
                keys: t
            }, this._cached
        }
        _parse(e) {
            if (this._getType(e) !== n8.object) {
                let t = this._getOrReturnCtx(e);
                return rt(t, {
                    code: n6.invalid_type,
                    expected: n8.object,
                    received: t.parsedType
                }), rr
            }
            let {
                status: t,
                ctx: n
            } = this._processInputParams(e), {
                shape: r,
                keys: a
            } = this._getCached(), i = [];
            if (!(this._def.catchall instanceof rF && "strip" === this._def.unknownKeys))
                for (let e in n.data) a.includes(e) || i.push(e);
            let o = [];
            for (let e of a) {
                let t = r[e],
                    a = n.data[e];
                o.push({
                    key: {
                        status: "valid",
                        value: e
                    },
                    value: t._parse(new rl(n, a, n.path, e)),
                    alwaysSet: e in n.data
                })
            }
            if (this._def.catchall instanceof rF) {
                let e = this._def.unknownKeys;
                if ("passthrough" === e)
                    for (let e of i) o.push({
                        key: {
                            status: "valid",
                            value: e
                        },
                        value: {
                            status: "valid",
                            value: n.data[e]
                        }
                    });
                else if ("strict" === e) i.length > 0 && (rt(n, {
                    code: n6.unrecognized_keys,
                    keys: i
                }), t.dirty());
                else if ("strip" !== e) throw Error("Internal ZodObject error: invalid unknownKeys value.")
            } else {
                let e = this._def.catchall;
                for (let t of i) {
                    let r = n.data[t];
                    o.push({
                        key: {
                            status: "valid",
                            value: t
                        },
                        value: e._parse(new rl(n, r, n.path, t)),
                        alwaysSet: t in n.data
                    })
                }
            }
            return n.common.async ? Promise.resolve().then(async () => {
                let e = [];
                for (let t of o) {
                    let n = await t.key,
                        r = await t.value;
                    e.push({
                        key: n,
                        value: r,
                        alwaysSet: t.alwaysSet
                    })
                }
                return e
            }).then(e => rn.mergeObjectSync(t, e)) : rn.mergeObjectSync(t, o)
        }
        get shape() {
            return this._def.shape()
        }
        strict(e) {
            return u.errToObj, new rB({
                ...this._def,
                unknownKeys: "strict",
                ...void 0 !== e ? {
                    errorMap: (t, n) => {
                        let r = this._def.errorMap?.(t, n).message ?? n.defaultError;
                        return "unrecognized_keys" === t.code ? {
                            message: u.errToObj(e).message ?? r
                        } : {
                            message: r
                        }
                    }
                } : {}
            })
        }
        strip() {
            return new rB({
                ...this._def,
                unknownKeys: "strip"
            })
        }
        passthrough() {
            return new rB({
                ...this._def,
                unknownKeys: "passthrough"
            })
        }
        extend(e) {
            return new rB({
                ...this._def,
                shape: () => ({
                    ...this._def.shape(),
                    ...e
                })
            })
        }
        merge(e) {
            return new rB({
                unknownKeys: e._def.unknownKeys,
                catchall: e._def.catchall,
                shape: () => ({
                    ...this._def.shape(),
                    ...e._def.shape()
                }),
                typeName: c.ZodObject
            })
        }
        setKey(e, t) {
            return this.augment({
                [e]: t
            })
        }
        catchall(e) {
            return new rB({
                ...this._def,
                catchall: e
            })
        }
        pick(e) {
            let t = {};
            for (let n of nV.objectKeys(e)) e[n] && this.shape[n] && (t[n] = this.shape[n]);
            return new rB({
                ...this._def,
                shape: () => t
            })
        }
        omit(e) {
            let t = {};
            for (let n of nV.objectKeys(this.shape)) e[n] || (t[n] = this.shape[n]);
            return new rB({
                ...this._def,
                shape: () => t
            })
        }
        deepPartial() {
            return function e(t) {
                if (t instanceof rB) {
                    let n = {};
                    for (let r in t.shape) {
                        let a = t.shape[r];
                        n[r] = r0.create(e(a))
                    }
                    return new rB({
                        ...t._def,
                        shape: () => n
                    })
                }
                return t instanceof rU ? new rU({
                    ...t._def,
                    type: e(t.element)
                }) : t instanceof r0 ? r0.create(e(t.unwrap())) : t instanceof r1 ? r1.create(e(t.unwrap())) : t instanceof rV ? rV.create(t.items.map(t => e(t))) : t
            }(this)
        }
        partial(e) {
            let t = {};
            for (let n of nV.objectKeys(this.shape)) {
                let r = this.shape[n];
                e && !e[n] ? t[n] = r : t[n] = r.optional()
            }
            return new rB({
                ...this._def,
                shape: () => t
            })
        }
        required(e) {
            let t = {};
            for (let n of nV.objectKeys(this.shape))
                if (e && !e[n]) t[n] = this.shape[n];
                else {
                    let e = this.shape[n];
                    for (; e instanceof r0;) e = e._def.innerType;
                    t[n] = e
                } return new rB({
                ...this._def,
                shape: () => t
            })
        }
        keyof() {
            return rG(nV.objectKeys(this.shape))
        }
        constructor() {
            super(...arguments), this._cached = null, this.nonstrict = this.passthrough, this.augment = this.extend
        }
    }
    rB.create = (e, t) => new rB({
        shape: () => e,
        unknownKeys: "strip",
        catchall: rF.create(),
        typeName: c.ZodObject,
        ...ru(t)
    }), rB.strictCreate = (e, t) => new rB({
        shape: () => e,
        unknownKeys: "strict",
        catchall: rF.create(),
        typeName: c.ZodObject,
        ...ru(t)
    }), rB.lazycreate = (e, t) => new rB({
        shape: e,
        unknownKeys: "strip",
        catchall: rF.create(),
        typeName: c.ZodObject,
        ...ru(t)
    });
    class rq extends rc {
        _parse(e) {
            let {
                ctx: t
            } = this._processInputParams(e), n = this._def.options;
            if (t.common.async) return Promise.all(n.map(async e => {
                let n = {
                    ...t,
                    common: {
                        ...t.common,
                        issues: []
                    },
                    parent: null
                };
                return {
                    result: await e._parseAsync({
                        data: t.data,
                        path: t.path,
                        parent: n
                    }),
                    ctx: n
                }
            })).then(function(e) {
                for (let t of e)
                    if ("valid" === t.result.status) return t.result;
                for (let n of e)
                    if ("dirty" === n.result.status) return t.common.issues.push(...n.ctx.common.issues), n.result;
                let n = e.map(e => new n7(e.ctx.common.issues));
                return rt(t, {
                    code: n6.invalid_union,
                    unionErrors: n
                }), rr
            });
            {
                let e, r = [];
                for (let a of n) {
                    let n = {
                            ...t,
                            common: {
                                ...t.common,
                                issues: []
                            },
                            parent: null
                        },
                        i = a._parseSync({
                            data: t.data,
                            path: t.path,
                            parent: n
                        });
                    if ("valid" === i.status) return i;
                    "dirty" !== i.status || e || (e = {
                        result: i,
                        ctx: n
                    }), n.common.issues.length && r.push(n.common.issues)
                }
                if (e) return t.common.issues.push(...e.ctx.common.issues), e.result;
                let a = r.map(e => new n7(e));
                return rt(t, {
                    code: n6.invalid_union,
                    unionErrors: a
                }), rr
            }
        }
        get options() {
            return this._def.options
        }
    }
    rq.create = (e, t) => new rq({
        options: e,
        typeName: c.ZodUnion,
        ...ru(t)
    });
    class r$ extends rc {
        _parse(e) {
            let {
                status: t,
                ctx: n
            } = this._processInputParams(e), r = (e, r) => {
                if ("aborted" === e.status || "aborted" === r.status) return rr;
                let a = function e(t, n) {
                    let r = n9(t),
                        a = n9(n);
                    if (t === n) return {
                        valid: !0,
                        data: t
                    };
                    if (r === n8.object && a === n8.object) {
                        let r = nV.objectKeys(n),
                            a = nV.objectKeys(t).filter(e => -1 !== r.indexOf(e)),
                            i = {
                                ...t,
                                ...n
                            };
                        for (let r of a) {
                            let a = e(t[r], n[r]);
                            if (!a.valid) return {
                                valid: !1
                            };
                            i[r] = a.data
                        }
                        return {
                            valid: !0,
                            data: i
                        }
                    }
                    if (r === n8.array && a === n8.array) {
                        if (t.length !== n.length) return {
                            valid: !1
                        };
                        let r = [];
                        for (let a = 0; a < t.length; a++) {
                            let i = e(t[a], n[a]);
                            if (!i.valid) return {
                                valid: !1
                            };
                            r.push(i.data)
                        }
                        return {
                            valid: !0,
                            data: r
                        }
                    }
                    return r === n8.date && a === n8.date && +t == +n ? {
                        valid: !0,
                        data: t
                    } : {
                        valid: !1
                    }
                }(e.value, r.value);
                return a.valid ? (("dirty" === e.status || "dirty" === r.status) && t.dirty(), {
                    status: t.value,
                    value: a.data
                }) : (rt(n, {
                    code: n6.invalid_intersection_types
                }), rr)
            };
            return n.common.async ? Promise.all([this._def.left._parseAsync({
                data: n.data,
                path: n.path,
                parent: n
            }), this._def.right._parseAsync({
                data: n.data,
                path: n.path,
                parent: n
            })]).then(e => {
                let [t, n] = e;
                return r(t, n)
            }) : r(this._def.left._parseSync({
                data: n.data,
                path: n.path,
                parent: n
            }), this._def.right._parseSync({
                data: n.data,
                path: n.path,
                parent: n
            }))
        }
    }
    r$.create = (e, t, n) => new r$({
        left: e,
        right: t,
        typeName: c.ZodIntersection,
        ...ru(n)
    });
    class rV extends rc {
        _parse(e) {
            let {
                status: t,
                ctx: n
            } = this._processInputParams(e);
            if (n.parsedType !== n8.array) return rt(n, {
                code: n6.invalid_type,
                expected: n8.array,
                received: n.parsedType
            }), rr;
            if (n.data.length < this._def.items.length) return rt(n, {
                code: n6.too_small,
                minimum: this._def.items.length,
                inclusive: !0,
                exact: !1,
                type: "array"
            }), rr;
            !this._def.rest && n.data.length > this._def.items.length && (rt(n, {
                code: n6.too_big,
                maximum: this._def.items.length,
                inclusive: !0,
                exact: !1,
                type: "array"
            }), t.dirty());
            let r = [...n.data].map((e, t) => {
                let r = this._def.items[t] || this._def.rest;
                return r ? r._parse(new rl(n, e, n.path, t)) : null
            }).filter(e => !!e);
            return n.common.async ? Promise.all(r).then(e => rn.mergeArray(t, e)) : rn.mergeArray(t, r)
        }
        get items() {
            return this._def.items
        }
        rest(e) {
            return new rV({
                ...this._def,
                rest: e
            })
        }
    }
    rV.create = (e, t) => {
        if (!Array.isArray(e)) throw Error("You must pass an array of schemas to z.tuple([ ... ])");
        return new rV({
            items: e,
            typeName: c.ZodTuple,
            rest: null,
            ...ru(t)
        })
    };
    class rW extends rc {
        get keySchema() {
            return this._def.keyType
        }
        get valueSchema() {
            return this._def.valueType
        }
        _parse(e) {
            let {
                status: t,
                ctx: n
            } = this._processInputParams(e);
            if (n.parsedType !== n8.map) return rt(n, {
                code: n6.invalid_type,
                expected: n8.map,
                received: n.parsedType
            }), rr;
            let r = this._def.keyType,
                a = this._def.valueType,
                i = [...n.data.entries()].map((e, t) => {
                    let [i, o] = e;
                    return {
                        key: r._parse(new rl(n, i, n.path, [t, "key"])),
                        value: a._parse(new rl(n, o, n.path, [t, "value"]))
                    }
                });
            if (n.common.async) {
                let e = new Map;
                return Promise.resolve().then(async () => {
                    for (let n of i) {
                        let r = await n.key,
                            a = await n.value;
                        if ("aborted" === r.status || "aborted" === a.status) return rr;
                        "dirty" !== r.status && "dirty" !== a.status || t.dirty(), e.set(r.value, a.value)
                    }
                    return {
                        status: t.value,
                        value: e
                    }
                })
            } {
                let e = new Map;
                for (let n of i) {
                    let r = n.key,
                        a = n.value;
                    if ("aborted" === r.status || "aborted" === a.status) return rr;
                    "dirty" !== r.status && "dirty" !== a.status || t.dirty(), e.set(r.value, a.value)
                }
                return {
                    status: t.value,
                    value: e
                }
            }
        }
    }
    rW.create = (e, t, n) => new rW({
        valueType: t,
        keyType: e,
        typeName: c.ZodMap,
        ...ru(n)
    });
    class rK extends rc {
        _parse(e) {
            let {
                status: t,
                ctx: n
            } = this._processInputParams(e);
            if (n.parsedType !== n8.set) return rt(n, {
                code: n6.invalid_type,
                expected: n8.set,
                received: n.parsedType
            }), rr;
            let r = this._def;
            null !== r.minSize && n.data.size < r.minSize.value && (rt(n, {
                code: n6.too_small,
                minimum: r.minSize.value,
                type: "set",
                inclusive: !0,
                exact: !1,
                message: r.minSize.message
            }), t.dirty()), null !== r.maxSize && n.data.size > r.maxSize.value && (rt(n, {
                code: n6.too_big,
                maximum: r.maxSize.value,
                type: "set",
                inclusive: !0,
                exact: !1,
                message: r.maxSize.message
            }), t.dirty());
            let a = this._def.valueType;

            function i(e) {
                let n = new Set;
                for (let r of e) {
                    if ("aborted" === r.status) return rr;
                    "dirty" === r.status && t.dirty(), n.add(r.value)
                }
                return {
                    status: t.value,
                    value: n
                }
            }
            let o = [...n.data.values()].map((e, t) => a._parse(new rl(n, e, n.path, t)));
            return n.common.async ? Promise.all(o).then(e => i(e)) : i(o)
        }
        min(e, t) {
            return new rK({
                ...this._def,
                minSize: {
                    value: e,
                    message: u.toString(t)
                }
            })
        }
        max(e, t) {
            return new rK({
                ...this._def,
                maxSize: {
                    value: e,
                    message: u.toString(t)
                }
            })
        }
        size(e, t) {
            return this.min(e, t).max(e, t)
        }
        nonempty(e) {
            return this.min(1, e)
        }
    }
    rK.create = (e, t) => new rK({
        valueType: e,
        minSize: null,
        maxSize: null,
        typeName: c.ZodSet,
        ...ru(t)
    });
    class rH extends rc {
        get schema() {
            return this._def.getter()
        }
        _parse(e) {
            let {
                ctx: t
            } = this._processInputParams(e);
            return this._def.getter()._parse({
                data: t.data,
                path: t.path,
                parent: t
            })
        }
    }
    rH.create = (e, t) => new rH({
        getter: e,
        typeName: c.ZodLazy,
        ...ru(t)
    });
    class rZ extends rc {
        _parse(e) {
            if (e.data !== this._def.value) {
                let t = this._getOrReturnCtx(e);
                return rt(t, {
                    received: t.data,
                    code: n6.invalid_literal,
                    expected: this._def.value
                }), rr
            }
            return {
                status: "valid",
                value: e.data
            }
        }
        get value() {
            return this._def.value
        }
    }

    function rG(e, t) {
        return new rQ({
            values: e,
            typeName: c.ZodEnum,
            ...ru(t)
        })
    }
    rZ.create = (e, t) => new rZ({
        value: e,
        typeName: c.ZodLiteral,
        ...ru(t)
    });
    class rQ extends rc {
        _parse(e) {
            if ("string" != typeof e.data) {
                let t = this._getOrReturnCtx(e),
                    n = this._def.values;
                return rt(t, {
                    expected: nV.joinValues(n),
                    received: t.parsedType,
                    code: n6.invalid_type
                }), rr
            }
            if (this._cache || (this._cache = new Set(this._def.values)), !this._cache.has(e.data)) {
                let t = this._getOrReturnCtx(e),
                    n = this._def.values;
                return rt(t, {
                    received: t.data,
                    code: n6.invalid_enum_value,
                    options: n
                }), rr
            }
            return ri(e.data)
        }
        get options() {
            return this._def.values
        }
        get enum() {
            let e = {};
            for (let t of this._def.values) e[t] = t;
            return e
        }
        get Values() {
            let e = {};
            for (let t of this._def.values) e[t] = t;
            return e
        }
        get Enum() {
            let e = {};
            for (let t of this._def.values) e[t] = t;
            return e
        }
        extract(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : this._def;
            return rQ.create(e, {
                ...this._def,
                ...t
            })
        }
        exclude(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : this._def;
            return rQ.create(this.options.filter(t => !e.includes(t)), {
                ...this._def,
                ...t
            })
        }
    }
    rQ.create = rG;
    class rY extends rc {
        _parse(e) {
            let t = nV.getValidEnumValues(this._def.values),
                n = this._getOrReturnCtx(e);
            if (n.parsedType !== n8.string && n.parsedType !== n8.number) {
                let e = nV.objectValues(t);
                return rt(n, {
                    expected: nV.joinValues(e),
                    received: n.parsedType,
                    code: n6.invalid_type
                }), rr
            }
            if (this._cache || (this._cache = new Set(nV.getValidEnumValues(this._def.values))), !this._cache.has(e.data)) {
                let e = nV.objectValues(t);
                return rt(n, {
                    received: n.data,
                    code: n6.invalid_enum_value,
                    options: e
                }), rr
            }
            return ri(e.data)
        }
        get enum() {
            return this._def.values
        }
    }
    rY.create = (e, t) => new rY({
        values: e,
        typeName: c.ZodNativeEnum,
        ...ru(t)
    });
    class rX extends rc {
        unwrap() {
            return this._def.type
        }
        _parse(e) {
            let {
                ctx: t
            } = this._processInputParams(e);
            return t.parsedType !== n8.promise && !1 === t.common.async ? (rt(t, {
                code: n6.invalid_type,
                expected: n8.promise,
                received: t.parsedType
            }), rr) : ri((t.parsedType === n8.promise ? t.data : Promise.resolve(t.data)).then(e => this._def.type.parseAsync(e, {
                path: t.path,
                errorMap: t.common.contextualErrorMap
            })))
        }
    }
    rX.create = (e, t) => new rX({
        type: e,
        typeName: c.ZodPromise,
        ...ru(t)
    });
    class rJ extends rc {
        innerType() {
            return this._def.schema
        }
        sourceType() {
            return this._def.schema._def.typeName === c.ZodEffects ? this._def.schema.sourceType() : this._def.schema
        }
        _parse(e) {
            let {
                status: t,
                ctx: n
            } = this._processInputParams(e), r = this._def.effect || null, a = {
                addIssue: e => {
                    rt(n, e), e.fatal ? t.abort() : t.dirty()
                },
                get path() {
                    return n.path
                }
            };
            if (a.addIssue = a.addIssue.bind(a), "preprocess" === r.type) {
                let e = r.transform(n.data, a);
                if (n.common.async) return Promise.resolve(e).then(async e => {
                    if ("aborted" === t.value) return rr;
                    let r = await this._def.schema._parseAsync({
                        data: e,
                        path: n.path,
                        parent: n
                    });
                    return "aborted" === r.status ? rr : "dirty" === r.status || "dirty" === t.value ? ra(r.value) : r
                });
                {
                    if ("aborted" === t.value) return rr;
                    let r = this._def.schema._parseSync({
                        data: e,
                        path: n.path,
                        parent: n
                    });
                    return "aborted" === r.status ? rr : "dirty" === r.status || "dirty" === t.value ? ra(r.value) : r
                }
            }
            if ("refinement" === r.type) {
                let e = e => {
                    let t = r.refinement(e, a);
                    if (n.common.async) return Promise.resolve(t);
                    if (t instanceof Promise) throw Error("Async refinement encountered during synchronous parse operation. Use .parseAsync instead.");
                    return e
                };
                if (!1 === n.common.async) {
                    let r = this._def.schema._parseSync({
                        data: n.data,
                        path: n.path,
                        parent: n
                    });
                    return "aborted" === r.status ? rr : ("dirty" === r.status && t.dirty(), e(r.value), {
                        status: t.value,
                        value: r.value
                    })
                }
                return this._def.schema._parseAsync({
                    data: n.data,
                    path: n.path,
                    parent: n
                }).then(n => "aborted" === n.status ? rr : ("dirty" === n.status && t.dirty(), e(n.value).then(() => ({
                    status: t.value,
                    value: n.value
                }))))
            }
            if ("transform" === r.type) {
                if (!1 === n.common.async) {
                    let e = this._def.schema._parseSync({
                        data: n.data,
                        path: n.path,
                        parent: n
                    });
                    if ("valid" !== e.status) return rr;
                    let i = r.transform(e.value, a);
                    if (i instanceof Promise) throw Error("Asynchronous transform encountered during synchronous parse operation. Use .parseAsync instead.");
                    return {
                        status: t.value,
                        value: i
                    }
                }
                return this._def.schema._parseAsync({
                    data: n.data,
                    path: n.path,
                    parent: n
                }).then(e => "valid" === e.status ? Promise.resolve(r.transform(e.value, a)).then(e => ({
                    status: t.value,
                    value: e
                })) : rr)
            }
            nV.assertNever(r)
        }
    }
    rJ.create = (e, t, n) => new rJ({
        schema: e,
        typeName: c.ZodEffects,
        effect: t,
        ...ru(n)
    }), rJ.createWithPreprocess = (e, t, n) => new rJ({
        schema: t,
        effect: {
            type: "preprocess",
            transform: e
        },
        typeName: c.ZodEffects,
        ...ru(n)
    });
    class r0 extends rc {
        _parse(e) {
            return this._getType(e) === n8.undefined ? ri(void 0) : this._def.innerType._parse(e)
        }
        unwrap() {
            return this._def.innerType
        }
    }
    r0.create = (e, t) => new r0({
        innerType: e,
        typeName: c.ZodOptional,
        ...ru(t)
    });
    class r1 extends rc {
        _parse(e) {
            return this._getType(e) === n8.null ? ri(null) : this._def.innerType._parse(e)
        }
        unwrap() {
            return this._def.innerType
        }
    }
    r1.create = (e, t) => new r1({
        innerType: e,
        typeName: c.ZodNullable,
        ...ru(t)
    });
    class r2 extends rc {
        _parse(e) {
            let {
                ctx: t
            } = this._processInputParams(e), n = t.data;
            return t.parsedType === n8.undefined && (n = this._def.defaultValue()), this._def.innerType._parse({
                data: n,
                path: t.path,
                parent: t
            })
        }
        removeDefault() {
            return this._def.innerType
        }
    }
    r2.create = (e, t) => new r2({
        innerType: e,
        typeName: c.ZodDefault,
        defaultValue: "function" == typeof t.default ? t.default : () => t.default,
        ...ru(t)
    });
    class r4 extends rc {
        _parse(e) {
            let {
                ctx: t
            } = this._processInputParams(e), n = {
                ...t,
                common: {
                    ...t.common,
                    issues: []
                }
            }, r = this._def.innerType._parse({
                data: n.data,
                path: n.path,
                parent: {
                    ...n
                }
            });
            return ro(r) ? r.then(e => ({
                status: "valid",
                value: "valid" === e.status ? e.value : this._def.catchValue({
                    get error() {
                        return new n7(n.common.issues)
                    },
                    input: n.data
                })
            })) : {
                status: "valid",
                value: "valid" === r.status ? r.value : this._def.catchValue({
                    get error() {
                        return new n7(n.common.issues)
                    },
                    input: n.data
                })
            }
        }
        removeCatch() {
            return this._def.innerType
        }
    }
    r4.create = (e, t) => new r4({
        innerType: e,
        typeName: c.ZodCatch,
        catchValue: "function" == typeof t.catch ? t.catch : () => t.catch,
        ...ru(t)
    });
    class r3 extends rc {
        _parse(e) {
            if (this._getType(e) !== n8.nan) {
                let t = this._getOrReturnCtx(e);
                return rt(t, {
                    code: n6.invalid_type,
                    expected: n8.nan,
                    received: t.parsedType
                }), rr
            }
            return {
                status: "valid",
                value: e.data
            }
        }
    }
    r3.create = e => new r3({
        typeName: c.ZodNaN,
        ...ru(e)
    });
    class r5 extends rc {
        _parse(e) {
            let {
                ctx: t
            } = this._processInputParams(e), n = t.data;
            return this._def.type._parse({
                data: n,
                path: t.path,
                parent: t
            })
        }
        unwrap() {
            return this._def.type
        }
    }
    class r8 extends rc {
        _parse(e) {
            let {
                status: t,
                ctx: n
            } = this._processInputParams(e);
            if (n.common.async) return (async () => {
                let e = await this._def.in._parseAsync({
                    data: n.data,
                    path: n.path,
                    parent: n
                });
                return "aborted" === e.status ? rr : "dirty" === e.status ? (t.dirty(), ra(e.value)) : this._def.out._parseAsync({
                    data: e.value,
                    path: n.path,
                    parent: n
                })
            })();
            {
                let e = this._def.in._parseSync({
                    data: n.data,
                    path: n.path,
                    parent: n
                });
                return "aborted" === e.status ? rr : "dirty" === e.status ? (t.dirty(), {
                    status: "dirty",
                    value: e.value
                }) : this._def.out._parseSync({
                    data: e.value,
                    path: n.path,
                    parent: n
                })
            }
        }
        static create(e, t) {
            return new r8({
                in: e,
                out: t,
                typeName: c.ZodPipeline
            })
        }
    }
    class r9 extends rc {
        _parse(e) {
            let t = this._def.innerType._parse(e),
                n = e => ("valid" === e.status && (e.value = Object.freeze(e.value)), e);
            return ro(t) ? t.then(e => n(e)) : n(t)
        }
        unwrap() {
            return this._def.innerType
        }
    }
    r9.create = (e, t) => new r9({
        innerType: e,
        typeName: c.ZodReadonly,
        ...ru(t)
    }), rB.lazycreate, (s = c || (c = {})).ZodString = "ZodString", s.ZodNumber = "ZodNumber", s.ZodNaN = "ZodNaN", s.ZodBigInt = "ZodBigInt", s.ZodBoolean = "ZodBoolean", s.ZodDate = "ZodDate", s.ZodSymbol = "ZodSymbol", s.ZodUndefined = "ZodUndefined", s.ZodNull = "ZodNull", s.ZodAny = "ZodAny", s.ZodUnknown = "ZodUnknown", s.ZodNever = "ZodNever", s.ZodVoid = "ZodVoid", s.ZodArray = "ZodArray", s.ZodObject = "ZodObject", s.ZodUnion = "ZodUnion", s.ZodDiscriminatedUnion = "ZodDiscriminatedUnion", s.ZodIntersection = "ZodIntersection", s.ZodTuple = "ZodTuple", s.ZodRecord = "ZodRecord", s.ZodMap = "ZodMap", s.ZodSet = "ZodSet", s.ZodFunction = "ZodFunction", s.ZodLazy = "ZodLazy", s.ZodLiteral = "ZodLiteral", s.ZodEnum = "ZodEnum", s.ZodEffects = "ZodEffects", s.ZodNativeEnum = "ZodNativeEnum", s.ZodOptional = "ZodOptional", s.ZodNullable = "ZodNullable", s.ZodDefault = "ZodDefault", s.ZodCatch = "ZodCatch", s.ZodPromise = "ZodPromise", s.ZodBranded = "ZodBranded", s.ZodPipeline = "ZodPipeline", s.ZodReadonly = "ZodReadonly";
    let r6 = rC.create,
        r7 = rP.create;
    rF.create;
    let ae = rU.create,
        at = rB.create;
    rB.strictCreate, rq.create, r$.create, rV.create, rQ.create, rX.create;
    let an = r0.create;
    r1.create;
    var ar = at({
            sharedParameters: at({
                shouldAnalyze: r7().optional(),
                useContinueMode: r7().optional(),
                genericChallengeId: r6().optional()
            }).optional()
        }),
        aa = at({
            userId: r6(),
            challengeId: r6(),
            contentInlineBase64: r6(),
            expectedSymbols: ae(r6()),
            scriptIdentifiers: an(ae(r6())),
            btid: an(r6())
        }).and(ar),
        ai = ((d = {})[nn.UNKNOWN] = at({}), d[nn.CHEF] = aa, d),
        ao = function(e, t, n) {
            if ("" === e || "" === n || "" === t) return nh;
            var r = nL.pipe(function(e) {
                try {
                    return nm(e())
                } catch (e) {
                    return nh
                }
            }(function() {
                return atob(n)
            }), nv(function() {
                return n
            }));
            if (!Object.values(nn).includes(t)) return nh;
            var a = np(function() {
                return JSON.parse(r)
            }, function() {
                return null
            });
            if (nf(a)) return nh;
            var i = ai[t].safeParse(a.right);
            return i.success ? nm({
                challengeId: e,
                challengeType: t,
                challengeMetadata: a.right
            }) : (console.error(n5, i.error), nh)
        },
        al = function(e) {
            return tk(void 0, [e], void 0, function(e) {
                var t = e.challengeBaseProperties,
                    n = e.challengeSpecificProperties,
                    r = e.nonce;
                return tx(this, function(e) {
                    return [2, nL.pipe(nN(function() {
                        switch (n.challengeType) {
                            case nn.CHEF:
                                var e = n.challengeMetadata;
                                return tk(void 0, [tS(tS(tS({}, t), e), {
                                    onChallengeInvalidated: function(e) {
                                        return t.onChallengeInvalidated(tS({}, e))
                                    },
                                    onChallengeCompleted: function(e) {
                                        return t.onChallengeCompleted(tS({}, e))
                                    },
                                    nonce: r
                                })], void 0, function(e) {
                                    var t, n, r, a, i, o, l, s = e.userId,
                                        u = e.challengeId,
                                        c = e.nonce,
                                        d = e.scriptIdentifiers,
                                        f = e.expectedSymbols,
                                        p = e.onChallengeCompleted,
                                        h = e.onChallengeInvalidated,
                                        m = e.browserTrackerId;
                                    return tx(this, function(e) {
                                        switch (e.label) {
                                            case 0:
                                                return [4, n2({
                                                    nonce: c
                                                })];
                                            case 1:
                                                return e.sent(), ChefScript.thunks[u] = [], [4, tk(void 0, [{
                                                    challengeId: u,
                                                    nonce: null != c ? c : null,
                                                    fetchable: n0,
                                                    scriptIdentifiers: d
                                                }], void 0, function(e) {
                                                    var t, n, r, a, i, o = e.challengeId,
                                                        l = e.nonce,
                                                        s = e.fetchable,
                                                        u = e.scriptIdentifiers;
                                                    return tx(this, function(e) {
                                                        switch (e.label) {
                                                            case 0:
                                                                return ng(t = null == u ? nh : nm(u)) ? (nQ("foo", {
                                                                    a: nq
                                                                }), [2, !1]) : 0 === t.value.length ? [2, !1] : (n = function(e) {
                                                                    return function() {
                                                                        return s.challengeFetch({
                                                                            identifier: e,
                                                                            challengeId: o
                                                                        })
                                                                    }
                                                                }, r = nI(function(e) {
                                                                    return nN(e, function(e) {
                                                                        return e
                                                                    })
                                                                }), a = function(e) {
                                                                    return e.map(function(e) {
                                                                        return np(function() {
                                                                            return atob(e)
                                                                        }, function(e) {
                                                                            return e
                                                                        })
                                                                    })
                                                                }, [4, nL.pipe(t.value, function(e) {
                                                                    return e.map(n)
                                                                }, r, nC(a))()]);
                                                            case 1:
                                                                return nf(i = e.sent()) ? (nQ("foo", {
                                                                    b: nq
                                                                }), [2, !1]) : [2, i.right.map(function(e) {
                                                                    if (nf(e)) return !1;
                                                                    var t = document.createElement("script");
                                                                    return null != l && (t.nonce = l), t.innerHTML = e.right, document.body.append(t), t.remove(), !0
                                                                }).reduce(function(e, t) {
                                                                    return e && t
                                                                }, !!u)]
                                                        }
                                                    })
                                                })];
                                            case 2:
                                                var g;
                                                return e.sent() ? (t = f.map(function(e) {
                                                    return function(t) {
                                                        return window[e](tS(tS({}, t), {
                                                            expectedSymbol: e
                                                        }))
                                                    }
                                                }), r = (n = null == ChefScript ? void 0 : ChefScript.thunks) && n[u] && n[u].length > 0, a = nL.pipe((null == (l = null == ChefScript ? void 0 : ChefScript.prelude) ? void 0 : l.signingKeys) || nh, (g = function(e) {
                                                    return function(t) {
                                                        return tk(void 0, void 0, void 0, function() {
                                                            var n;
                                                            return tx(this, function(r) {
                                                                switch (r.label) {
                                                                    case 0:
                                                                        var a;
                                                                        return a = function() {
                                                                            return ""
                                                                        }, n = function(e) {
                                                                            return nf(e) ? a(e.left) : e.right
                                                                        }, [4, tk(void 0, [e, t], void 0, function(e, t) {
                                                                            var n, r, a = t.symbolEntry,
                                                                                i = t.nonce;
                                                                            return tx(this, function(t) {
                                                                                switch (t.label) {
                                                                                    case 0:
                                                                                        return n = (new TextEncoder).encode("".concat(a, "|").concat(i)), [4, nN(function() {
                                                                                            return window.crypto.subtle.sign({
                                                                                                name: "ECDSA",
                                                                                                hash: {
                                                                                                    name: "SHA-256"
                                                                                                }
                                                                                            }, e.privateKey, n)
                                                                                        }, function(e) {
                                                                                            return e
                                                                                        })()];
                                                                                    case 1:
                                                                                        return nf(r = t.sent()) ? (nQ("foo", {
                                                                                            h: nq
                                                                                        }), [2, nc("")]) : [2, nd(btoa(new Uint8Array(r.right).reduce(function(e, t) {
                                                                                            return e + String.fromCharCode(t)
                                                                                        }, "")))]
                                                                                }
                                                                            })
                                                                        })];
                                                                    case 1:
                                                                        return [2, n.apply(void 0, [r.sent()])]
                                                                }
                                                            })
                                                        })
                                                    }
                                                }, function(e) {
                                                    return ng(e) ? nh : nm(g(e.value))
                                                }), nv(function() {
                                                    return function(e) {
                                                        return tk(void 0, void 0, void 0, function() {
                                                            return tx(this, function(e) {
                                                                return [2, "sus"]
                                                            })
                                                        })
                                                    }
                                                })), i = null != m ? m : "", [4, nL.pipe(r ? n[u] : t, nI(function(e) {
                                                    return nN(function() {
                                                        return e({
                                                            userId: s,
                                                            btid: i,
                                                            challengeId: u,
                                                            rcsClient: n0,
                                                            sign: a
                                                        })
                                                    }, function(e) {
                                                        return e
                                                    })
                                                }), nO(function(e) {
                                                    return nQ("foo", {
                                                        d: nq,
                                                        e: e instanceof Error ? e.message : JSON.stringify(e)
                                                    }), h({
                                                        challengeType: nn.CHEF,
                                                        errorCode: tV.ErrorCode.FAILED_SIMMER,
                                                        errorMessage: "Simmer was too short!"
                                                    }), !1
                                                }, function() {
                                                    return p({
                                                        challengeType: nn.CHEF,
                                                        metadata: {
                                                            userId: s,
                                                            challengeId: u,
                                                            browserTrackerId: m
                                                        }
                                                    }), nQ("foo", {
                                                        e: nq
                                                    }), !0
                                                }))()]) : (nQ("foo", {
                                                    c: nq
                                                }), h({
                                                    challengeType: nn.CHEF,
                                                    errorCode: tV.ErrorCode.FAILED_PREP,
                                                    errorMessage: "Could not prep the cook successfully"
                                                }), delete ChefScript.thunks[u], [2, !1]);
                                            case 3:
                                                return o = e.sent(), delete ChefScript.thunks[u], [2, "Right" === o._tag]
                                        }
                                    })
                                });
                            case nn.UNKNOWN:
                                return Promise.resolve(!0);
                            default:
                                return Promise.resolve(!1)
                        }
                    }, function(e) {
                        return console.error(n5, "Failed to render challenge due to: ".concat(JSON.stringify(e instanceof Error ? e.message : e))), e
                    }), nT(function() {
                        return nw(!1)
                    }))()]
                })
            })
        },
        as = function(e) {
            var t = e.containerId,
                n = e.challengeTypeRaw,
                r = "".concat(t, "-").concat(n);
            if (null === document.getElementById(r)) {
                var a = document.createElement("div");
                a.id = r, document.body.appendChild(a)
            }
            return r
        },
        au = new t_(new tf({
            basePath: "".concat(nB(), "/challenge"),
            genericChallengeMiddlewareType: "native",
            credentials: "include"
        })),
        ac = function(e) {
            var t = e.challengeBaseProperties,
                n = e.challengeSpecificProperties,
                r = e.nonce,
                a = n.challengeMetadata.sharedParameters,
                i = n.challengeType,
                o = t.onChallengeCompleted;
            return function(e) {
                return tk(void 0, void 0, void 0, function() {
                    var l, s;
                    return tx(this, function(u) {
                        switch (u.label) {
                            case 0:
                                return l = nN(function() {
                                    return au._continue({
                                        continueRequest: {
                                            challengeID: (null == a ? void 0 : a.genericChallengeId) || n.challengeId,
                                            challengeType: e.challengeType,
                                            challengeMetadata: JSON.stringify(e.metadata)
                                        }
                                    })
                                }, function(e) {
                                    return e instanceof Error ? e.message : JSON.stringify(e)
                                }), s = function(n) {
                                    return tk(void 0, void 0, void 0, function() {
                                        var a, l, s, u, c, d, f, p, h;
                                        return tx(this, function(m) {
                                            switch (m.label) {
                                                case 0:
                                                    return n.challengeType ? n4(n.challengeType) ? ng(u = ao(null != (f = n.challengeId) ? f : "", n.challengeType, null != (p = n.challengeMetadata) ? p : "")) ? (nZ(n.challengeType), t.onChallengeInvalidated({
                                                        challengeType: i,
                                                        errorCode: t6.UNKNOWN,
                                                        errorMessage: ""
                                                    }), [2]) : (c = ac({
                                                        challengeBaseProperties: t,
                                                        challengeSpecificProperties: u.value,
                                                        nonce: r
                                                    }), as({
                                                        containerId: t.containerId,
                                                        challengeTypeRaw: null != (h = n.challengeType) ? h : ""
                                                    }), [4, al({
                                                        challengeBaseProperties: tS(tS({}, t), {
                                                            onChallengeCompleted: c
                                                        }),
                                                        challengeSpecificProperties: tS({}, u.value),
                                                        nonce: r
                                                    })]) : (t.legacyGenericRender ? (a = n.challengeType, l = function(e) {
                                                        nG(a), t.onChallengeInvalidated({
                                                            challengeType: a,
                                                            errorCode: t6.UNKNOWN,
                                                            errorMessage: e
                                                        })
                                                    }, nf(s = np(function() {
                                                        var e;
                                                        return JSON.parse(null != (e = n.challengeMetadata) ? e : "")
                                                    }, function() {
                                                        return null
                                                    })) ? (nZ(a), t.onChallengeInvalidated({
                                                        challengeType: a,
                                                        errorCode: t6.UNKNOWN,
                                                        errorMessage: "Failed to parse subsequent legacy challenge metadata"
                                                    })) : t.legacyGenericRender({
                                                        challengeBaseProperties: t,
                                                        challengeSpecificProperties: {
                                                            challengeId: null != (d = n.challengeId) ? d : "",
                                                            challengeType: a,
                                                            challengeMetadata: s.right
                                                        }
                                                    }).then(function(e) {
                                                        e ? nH(a) : l("Subsequent challenges failed!")
                                                    }, function() {
                                                        return l("Subsequent challenges failed!")
                                                    })) : (console.warn("[new middleware] legacy challenge type found but no fallback registered!"), t.onChallengeInvalidated({
                                                        challengeType: n.challengeType,
                                                        errorCode: t6.UNKNOWN,
                                                        errorMessage: "Subsequent challenges failed!"
                                                    })), [2]) : (o(e), [2]);
                                                case 1:
                                                    var g;
                                                    return m.sent() ? nH(n.challengeType) : (g = n.challengeType, nN(function() {
                                                        return nK.recordMetric({
                                                            recordMetricRequest: {
                                                                name: nF.EventGeneric,
                                                                value: 1,
                                                                labelValues: {
                                                                    event_type: "RenderFailure",
                                                                    challenge_type: g
                                                                }
                                                            }
                                                        })
                                                    }, function(e) {
                                                        return e
                                                    })(), t.onChallengeInvalidated({
                                                        challengeType: n.challengeType,
                                                        errorCode: t6.UNKNOWN,
                                                        errorMessage: "Subsequent challenges failed!"
                                                    })), [2]
                                            }
                                        })
                                    })
                                }, [4, nL.pipe(l, nO(function(e) {
                                    nG(i), t.onChallengeInvalidated({
                                        challengeType: i,
                                        errorCode: t6.UNKNOWN,
                                        errorMessage: "Unable to continue challenge due to: ".concat(e)
                                    })
                                }, function(e) {
                                    return s(e)
                                }))()];
                            case 1:
                                return u.sent(), [2]
                        }
                    })
                })
            }
        },
        ad = e.i(110584),
        af = e.i(49646),
        ap = e.i(880983);
    let ah = (e, t) => eM.AsyncResult.fromPromise(e, e => e instanceof Error ? e : t).andThen(e => e);
    var am = e.i(126392),
        ag = e.i(357355),
        av = e.i(380952),
        ay = e.i(815079),
        ab = e.i(889375),
        aw = e.i(645180),
        a_ = e.i(55336);
    globalThis._sentryRouteManifest = '{"dynamicRoutes":[{"path":"/:locale","regex":"^/([^/]+)$","paramNames":["locale"],"hasOptionalPrefix":true},{"path":"/:locale/my/avatar","regex":"^/([^/]+)/my/avatar$","paramNames":["locale"],"hasOptionalPrefix":true},{"path":"/:locale/my/messages","regex":"^/([^/]+)/my/messages$","paramNames":["locale"],"hasOptionalPrefix":true},{"path":"/:locale/wallet","regex":"^/([^/]+)/wallet$","paramNames":["locale"],"hasOptionalPrefix":true},{"path":"/:locale/avatar-item/:referralCode","regex":"^/([^/]+)/avatar-item/([^/]+)$","paramNames":["locale","referralCode"],"hasOptionalPrefix":true},{"path":"/:locale/download","regex":"^/([^/]+)/download$","paramNames":["locale"],"hasOptionalPrefix":true},{"path":"/:locale/download/@header","regex":"^/([^/]+)/download/@header$","paramNames":["locale"],"hasOptionalPrefix":true},{"path":"/:locale/giftcards","regex":"^/([^/]+)/giftcards$","paramNames":["locale"],"hasOptionalPrefix":true},{"path":"/:locale/giftcards/@header","regex":"^/([^/]+)/giftcards/@header$","paramNames":["locale"],"hasOptionalPrefix":true},{"path":"/:locale/home","regex":"^/([^/]+)/home$","paramNames":["locale"],"hasOptionalPrefix":true},{"path":"/:locale/login","regex":"^/([^/]+)/login$","paramNames":["locale"],"hasOptionalPrefix":true},{"path":"/:locale/login-redirect/v2","regex":"^/([^/]+)/login-redirect/v2$","paramNames":["locale"],"hasOptionalPrefix":true},{"path":"/:locale/plus-referral","regex":"^/([^/]+)/plus-referral$","paramNames":["locale"],"hasOptionalPrefix":true},{"path":"/:locale/spotlight/:pageSlug","regex":"^/([^/]+)/spotlight/([^/]+)$","paramNames":["locale","pageSlug"],"hasOptionalPrefix":true},{"path":"/:locale/supported-browsers","regex":"^/([^/]+)/supported-browsers$","paramNames":["locale"],"hasOptionalPrefix":true},{"path":"/:locale/upgrades/robux","regex":"^/([^/]+)/upgrades/robux$","paramNames":["locale"],"hasOptionalPrefix":true},{"path":"/:locale/upgrades/robux/v2","regex":"^/([^/]+)/upgrades/robux/v2$","paramNames":["locale"],"hasOptionalPrefix":true}],"staticRoutes":[],"isrRoutes":[]}', globalThis._sentryNextJsVersion = "16.2.6";
    let aS = () => (0, am.getCurrentUser)()?.id ?? null,
        ak = async () => await e.A(26582), ax = async e => {
            let {
                interceptChallenge: t
            } = await ak();
            return t(e)
        }, aE = async e => {
            let {
                renderChallenge: t
            } = await ak();
            return t(e)
        };
    globalThis._sentryRouteManifest = '{"dynamicRoutes":[{"path":"/:locale","regex":"^/([^/]+)$","paramNames":["locale"],"hasOptionalPrefix":true},{"path":"/:locale/my/avatar","regex":"^/([^/]+)/my/avatar$","paramNames":["locale"],"hasOptionalPrefix":true},{"path":"/:locale/my/messages","regex":"^/([^/]+)/my/messages$","paramNames":["locale"],"hasOptionalPrefix":true},{"path":"/:locale/wallet","regex":"^/([^/]+)/wallet$","paramNames":["locale"],"hasOptionalPrefix":true},{"path":"/:locale/avatar-item/:referralCode","regex":"^/([^/]+)/avatar-item/([^/]+)$","paramNames":["locale","referralCode"],"hasOptionalPrefix":true},{"path":"/:locale/download","regex":"^/([^/]+)/download$","paramNames":["locale"],"hasOptionalPrefix":true},{"path":"/:locale/download/@header","regex":"^/([^/]+)/download/@header$","paramNames":["locale"],"hasOptionalPrefix":true},{"path":"/:locale/giftcards","regex":"^/([^/]+)/giftcards$","paramNames":["locale"],"hasOptionalPrefix":true},{"path":"/:locale/giftcards/@header","regex":"^/([^/]+)/giftcards/@header$","paramNames":["locale"],"hasOptionalPrefix":true},{"path":"/:locale/home","regex":"^/([^/]+)/home$","paramNames":["locale"],"hasOptionalPrefix":true},{"path":"/:locale/login","regex":"^/([^/]+)/login$","paramNames":["locale"],"hasOptionalPrefix":true},{"path":"/:locale/login-redirect/v2","regex":"^/([^/]+)/login-redirect/v2$","paramNames":["locale"],"hasOptionalPrefix":true},{"path":"/:locale/plus-referral","regex":"^/([^/]+)/plus-referral$","paramNames":["locale"],"hasOptionalPrefix":true},{"path":"/:locale/spotlight/:pageSlug","regex":"^/([^/]+)/spotlight/([^/]+)$","paramNames":["locale","pageSlug"],"hasOptionalPrefix":true},{"path":"/:locale/supported-browsers","regex":"^/([^/]+)/supported-browsers$","paramNames":["locale"],"hasOptionalPrefix":true},{"path":"/:locale/upgrades/robux","regex":"^/([^/]+)/upgrades/robux$","paramNames":["locale"],"hasOptionalPrefix":true},{"path":"/:locale/upgrades/robux/v2","regex":"^/([^/]+)/upgrades/robux/v2$","paramNames":["locale"],"hasOptionalPrefix":true}],"staticRoutes":[],"isrRoutes":[]}', globalThis._sentryNextJsVersion = "16.2.6";
    let aT = (0, am.getCurrentUser)()?.id;
    if ((0, v.setUser)({
            id: (aT ?? -1).toString()
        }), (e => {
            let {
                getUserId: t,
                getLocale: n,
                challengeContainerId: r,
                onHbaUnauthorized: a,
                legacyInterceptChallenge: i,
                legacyRenderChallenge: o
            } = e, l = null, s = !1, u = "x-csrf-token", c = "x-bound-auth-token", d = ["POST", "PATCH", "PUT", "DELETE"];
            ez.setInterceptors([ej.retryInterceptor, e => eM.AsyncResult.fn(async (f, p) => {
                let h;
                null != l && (0, eD.arrayIncludes)(d, p.method) && p.headers.set(u, l);
                let m = f.host.endsWith(".roblox.com") || f.host.endsWith(".robloxlabs.com"),
                    g = t();
                if (m && null == g) {
                    let e = n();
                    p.headers.set("Accept-Language", `${(0,ap.localeToUppercaseDash)(e)};q=0.01`), ("GET" === p.method || "POST" === p.method) && (f = f.withSearchParamsAppended({
                        urlLocale: e
                    }))
                }
                let v = {
                        url: f.href,
                        method: p.method,
                        data: "string" == typeof p.body ? p.body : void 0
                    },
                    {
                        headers: b
                    } = await (0, ad.buildConfigBoundAuthToken)(v, null != g),
                    w = b?.[c];
                if (null != w && p.headers.set(c, String(w)), m && !p.headers.has("traceparent") && null != (0, y.getClient)()) {
                    let {
                        traceId: e,
                        spanId: t,
                        traceFlags: n
                    } = (h = (0, eL.startInactiveSpan)({
                        name: `${p.method} ${f.href}`,
                        op: "http.client",
                        attributes: {
                            "http.url": f.href,
                            "http.method": p.method
                        }
                    })).spanContext(), r = `00-${e}-${t}-${1&n?"01":"00"}`;
                    p.headers.set("traceparent", r)
                }
                let _ = null == a ? p : {
                        ...p,
                        includeBodyOnError: !0
                    },
                    S = await e(f, _).orElse(t => {
                        let n = t => null != a && (0, af.isHbaUnauthorizedError)(t) && (s || a()) ? (s = !0, eM.AsyncResult.fromPromise((0, eU.withResolvers)().promise, () => t)) : (t => {
                            if (t instanceof eF.HttpError) {
                                let n = "rblx-challenge-id",
                                    a = "rblx-challenge-type",
                                    l = "rblx-challenge-metadata",
                                    s = t.response.headers,
                                    u = s.get(n),
                                    c = s.get(a),
                                    d = s.get(l);
                                if (null != u && null != c && null != d) {
                                    let s = (t, r) => (p.headers.set(n, t), p.headers.set(a, c), p.headers.set(l, r), e(f, _));
                                    if (n3.isSupportedByGrasshopper(c)) return ah(tk(void 0, [{
                                        retryRequest: s,
                                        containerId: r,
                                        nonce: document.querySelector("script[nonce]")?.nonce,
                                        challengeId: u,
                                        challengeTypeRaw: c,
                                        challengeMetadataJsonBase64: d,
                                        legacyGenericRender: o
                                    }], void 0, function(e) {
                                        var t, n, r, a, i, o, l = e.retryRequest,
                                            s = e.containerId,
                                            u = e.nonce,
                                            c = e.challengeId,
                                            d = e.challengeTypeRaw,
                                            f = e.challengeMetadataJsonBase64,
                                            p = e.legacyGenericRender;
                                        return tx(this, function(e) {
                                            switch (e.label) {
                                                case 0:
                                                    return ng(t = ao(c, d, f)) ? (nZ(d), [2, Promise.reject(new na({
                                                        kind: t9.UNKNOWN,
                                                        data: {}
                                                    }))]) : (n = as({
                                                        containerId: s,
                                                        challengeTypeRaw: d
                                                    }), i = new Promise(function(e, t) {
                                                        r = e, a = t
                                                    }), [4, al({
                                                        challengeBaseProperties: tS(tS({}, o = {
                                                            containerId: n,
                                                            renderInline: !1,
                                                            onChallengeCompleted: function(e) {
                                                                nN(function() {
                                                                    return tk(void 0, void 0, void 0, function() {
                                                                        return tx(this, function(t) {
                                                                            return [2, r(l(c, btoa(JSON.stringify(e.metadata))))]
                                                                        })
                                                                    })
                                                                }, function(e) {
                                                                    return a(e)
                                                                })()
                                                            },
                                                            onChallengeInvalidated: function(e) {
                                                                return a(new na({
                                                                    kind: t9.INVALIDATED,
                                                                    data: e
                                                                }))
                                                            },
                                                            onModalChallengeAbandoned: function() {
                                                                return a(new na({
                                                                    kind: t9.ABANDONED,
                                                                    data: {
                                                                        challengeType: t.value
                                                                    }
                                                                }))
                                                            },
                                                            onChallengeAbandoned: null,
                                                            legacyGenericRender: p
                                                        }), {
                                                            onChallengeCompleted: ac({
                                                                challengeBaseProperties: o,
                                                                challengeSpecificProperties: t.value,
                                                                nonce: u
                                                            })
                                                        }),
                                                        challengeSpecificProperties: t.value,
                                                        nonce: u
                                                    })]);
                                                case 1:
                                                    return e.sent() || o.onChallengeInvalidated({
                                                        challengeType: t.value.challengeType,
                                                        errorCode: t6.UNKNOWN,
                                                        errorMessage: "Failed to render initial challenge"
                                                    }), [2, i]
                                            }
                                        })
                                    }), t);
                                    if (null != i) return ah(i({
                                        retryRequest: s,
                                        containerId: r,
                                        challengeId: u,
                                        challengeTypeRaw: c,
                                        challengeMetadataJsonBase64: d,
                                        newRenderChallenge: al,
                                        newParseChallenge: ao
                                    }), t)
                                }
                            }
                            return (0, eM.errAsync)(t)
                        })(t);
                        if (t instanceof eF.HttpError && 403 === t.response.status && (0, eD.arrayIncludes)(d, t.request.method)) {
                            let r = t.response.headers.get(u);
                            if (null != r) return l = r, p.headers.set(u, l), e(f, _).orElse(n)
                        }
                        return n(t)
                    });
                return null != h && (h.setStatus({
                    code: S.isOk() ? 1 : 2
                }), S.isOk() ? h.setAttribute("http.status_code", S.value.status) : S.error instanceof eF.HttpError && h.setAttribute("http.status_code", S.error.response.status), h.end()), S
            })])
        })({
            getUserId: aS,
            getLocale: av.getLocale,
            challengeContainerId: "generic-challenge",
            onHbaUnauthorized: a_.showHbaUnauthorized,
            legacyInterceptChallenge: ax,
            legacyRenderChallenge: aE
        }), (0, eA.setChallengeMounter)({
            mount: aw.showChallenge,
            unmount: aw.hideChallenge
        }), (0, eI.setChallengeModalLoaders)({
            EmailVerifyCodeModal: () => e.A(824788),
            PhoneUpsell: () => e.A(505658)
        }), null != aS()) {
        try {
            i = new Worker(ay.wwwRoblox.withPath("/worker-resources/script/").withSearchParams({
                component: "PageHeartbeatWorker",
                v: "1"
            }).href)
        } catch {}
        if (i) {
            let e = 0,
                t = Date.now();
            ["click", "dblclick", "focus", "hover", "keypress", "mousedown", "mouseenter", "mouseover", "scroll", "touchmove", "touchstart"].forEach(e => {
                ag.window?.addEventListener(e, () => {
                    t = Date.now()
                })
            }), i.onmessage = () => {
                Date.now() - t > 6e5 || ((0, ab.sendEvent)("pageHeartbeat_v2", `heartbeat${e+1}`), e += 1)
            }, i.postMessage(2e4)
        }
    }
    e.s([], 335691)
}, 38777, (e, t, n) => {
    "use strict";
    t.exports = e.f({
        "private-next-instrumentation-client": {
            id: () => 335691,
            module: () => e.r(335691)
        }
    })("private-next-instrumentation-client")
}, 560377, (e, t, n) => {
    "trimStart" in String.prototype || (String.prototype.trimStart = String.prototype.trimLeft), "trimEnd" in String.prototype || (String.prototype.trimEnd = String.prototype.trimRight), "description" in Symbol.prototype || Object.defineProperty(Symbol.prototype, "description", {
        configurable: !0,
        get: function() {
            var e = /\((.*)\)/.exec(this.toString());
            return e ? e[1] : void 0
        }
    }), Array.prototype.flat || (Array.prototype.flat = function(e, t) {
        return t = this.concat.apply([], this), e > 1 && t.some(Array.isArray) ? t.flat(e - 1) : t
    }, Array.prototype.flatMap = function(e, t) {
        return this.map(e, t).flat()
    }), Promise.prototype.finally || (Promise.prototype.finally = function(e) {
        if ("function" != typeof e) return this.then(e, e);
        var t = this.constructor || Promise;
        return this.then(function(n) {
            return t.resolve(e()).then(function() {
                return n
            })
        }, function(n) {
            return t.resolve(e()).then(function() {
                throw n
            })
        })
    }), Object.fromEntries || (Object.fromEntries = function(e) {
        return Array.from(e).reduce(function(e, t) {
            return e[t[0]] = t[1], e
        }, {})
    }), Array.prototype.at || (Array.prototype.at = function(e) {
        var t = Math.trunc(e) || 0;
        if (t < 0 && (t += this.length), !(t < 0 || t >= this.length)) return this[t]
    }), Object.hasOwn || (Object.hasOwn = function(e, t) {
        if (null == e) throw TypeError("Cannot convert undefined or null to object");
        return Object.prototype.hasOwnProperty.call(Object(e), t)
    }), "canParse" in URL || (URL.canParse = function(e, t) {
        try {
            return new URL(e, t), !0
        } catch (e) {
            return !1
        }
    })
}, 233469, (e, t, n) => {
    "use strict";
    Object.defineProperty(n, "__esModule", {
        value: !0
    }), e.r(560377), ("function" == typeof n.default || "object" == typeof n.default && null !== n.default) && void 0 === n.default.__esModule && (Object.defineProperty(n.default, "__esModule", {
        value: !0
    }), Object.assign(n.default, n), t.exports = n.default)
}, 271068, (e, t, n) => {
    "use strict";

    function r(e, t) {
        var n = e.length;
        for (e.push(t); 0 < n;) {
            var r = n - 1 >>> 1,
                a = e[r];
            if (0 < o(a, t)) e[r] = t, e[n] = a, n = r;
            else break
        }
    }

    function a(e) {
        return 0 === e.length ? null : e[0]
    }

    function i(e) {
        if (0 === e.length) return null;
        var t = e[0],
            n = e.pop();
        if (n !== t) {
            e[0] = n;
            for (var r = 0, a = e.length, i = a >>> 1; r < i;) {
                var l = 2 * (r + 1) - 1,
                    s = e[l],
                    u = l + 1,
                    c = e[u];
                if (0 > o(s, n)) u < a && 0 > o(c, s) ? (e[r] = c, e[u] = n, r = u) : (e[r] = s, e[l] = n, r = l);
                else if (u < a && 0 > o(c, n)) e[r] = c, e[u] = n, r = u;
                else break
            }
        }
        return t
    }

    function o(e, t) {
        var n = e.sortIndex - t.sortIndex;
        return 0 !== n ? n : e.id - t.id
    }
    if (n.unstable_now = void 0, "object" == typeof performance && "function" == typeof performance.now) {
        var l, s = performance;
        n.unstable_now = function() {
            return s.now()
        }
    } else {
        var u = Date,
            c = u.now();
        n.unstable_now = function() {
            return u.now() - c
        }
    }
    var d = [],
        f = [],
        p = 1,
        h = null,
        m = 3,
        g = !1,
        v = !1,
        y = !1,
        b = !1,
        w = "function" == typeof setTimeout ? setTimeout : null,
        _ = "function" == typeof clearTimeout ? clearTimeout : null,
        S = "u" > typeof setImmediate ? setImmediate : null;

    function k(e) {
        for (var t = a(f); null !== t;) {
            if (null === t.callback) i(f);
            else if (t.startTime <= e) i(f), t.sortIndex = t.expirationTime, r(d, t);
            else break;
            t = a(f)
        }
    }

    function x(e) {
        if (y = !1, k(e), !v)
            if (null !== a(d)) v = !0, E || (E = !0, l());
            else {
                var t = a(f);
                null !== t && A(x, t.startTime - e)
            }
    }
    var E = !1,
        T = -1,
        N = 5,
        C = -1;

    function O() {
        return !!b || !(n.unstable_now() - C < N)
    }

    function R() {
        if (b = !1, E) {
            var e = n.unstable_now();
            C = e;
            var t = !0;
            try {
                e: {
                    v = !1,
                    y && (y = !1, _(T), T = -1),
                    g = !0;
                    var r = m;
                    try {
                        t: {
                            for (k(e), h = a(d); null !== h && !(h.expirationTime > e && O());) {
                                var o = h.callback;
                                if ("function" == typeof o) {
                                    h.callback = null, m = h.priorityLevel;
                                    var s = o(h.expirationTime <= e);
                                    if (e = n.unstable_now(), "function" == typeof s) {
                                        h.callback = s, k(e), t = !0;
                                        break t
                                    }
                                    h === a(d) && i(d), k(e)
                                } else i(d);
                                h = a(d)
                            }
                            if (null !== h) t = !0;
                            else {
                                var u = a(f);
                                null !== u && A(x, u.startTime - e), t = !1
                            }
                        }
                        break e
                    }
                    finally {
                        h = null, m = r, g = !1
                    }
                }
            }
            finally {
                t ? l() : E = !1
            }
        }
    }
    if ("function" == typeof S) l = function() {
        S(R)
    };
    else if ("u" > typeof MessageChannel) {
        var P = new MessageChannel,
            I = P.port2;
        P.port1.onmessage = R, l = function() {
            I.postMessage(null)
        }
    } else l = function() {
        w(R, 0)
    };

    function A(e, t) {
        T = w(function() {
            e(n.unstable_now())
        }, t)
    }
    n.unstable_IdlePriority = 5, n.unstable_ImmediatePriority = 1, n.unstable_LowPriority = 4, n.unstable_NormalPriority = 3, n.unstable_Profiling = null, n.unstable_UserBlockingPriority = 2, n.unstable_cancelCallback = function(e) {
        e.callback = null
    }, n.unstable_forceFrameRate = function(e) {
        0 > e || 125 < e ? console.error("forceFrameRate takes a positive int between 0 and 125, forcing frame rates higher than 125 fps is not supported") : N = 0 < e ? Math.floor(1e3 / e) : 5
    }, n.unstable_getCurrentPriorityLevel = function() {
        return m
    }, n.unstable_next = function(e) {
        switch (m) {
            case 1:
            case 2:
            case 3:
                var t = 3;
                break;
            default:
                t = m
        }
        var n = m;
        m = t;
        try {
            return e()
        } finally {
            m = n
        }
    }, n.unstable_requestPaint = function() {
        b = !0
    }, n.unstable_runWithPriority = function(e, t) {
        switch (e) {
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
                break;
            default:
                e = 3
        }
        var n = m;
        m = e;
        try {
            return t()
        } finally {
            m = n
        }
    }, n.unstable_scheduleCallback = function(e, t, i) {
        var o = n.unstable_now();
        switch (i = "object" == typeof i && null !== i && "number" == typeof(i = i.delay) && 0 < i ? o + i : o, e) {
            case 1:
                var s = -1;
                break;
            case 2:
                s = 250;
                break;
            case 5:
                s = 0x3fffffff;
                break;
            case 4:
                s = 1e4;
                break;
            default:
                s = 5e3
        }
        return s = i + s, e = {
            id: p++,
            callback: t,
            priorityLevel: e,
            startTime: i,
            expirationTime: s,
            sortIndex: -1
        }, i > o ? (e.sortIndex = i, r(f, e), null === a(d) && e === a(f) && (y ? (_(T), T = -1) : y = !0, A(x, i - o))) : (e.sortIndex = s, r(d, e), v || g || (v = !0, E || (E = !0, l()))), e
    }, n.unstable_shouldYield = O, n.unstable_wrapCallback = function(e) {
        var t = m;
        return function() {
            var n = m;
            m = t;
            try {
                return e.apply(this, arguments)
            } finally {
                m = n
            }
        }
    }
}, 886405, (e, t, n) => {
    "use strict";
    t.exports = e.r(271068)
}, 368824, (e, t, n) => {
    "use strict";
    var r, a = e.i(737344),
        i = e.r(886405),
        o = e.r(420482),
        l = e.r(301775);

    function s(e) {
        var t = "https://react.dev/errors/" + e;
        if (1 < arguments.length) {
            t += "?args[]=" + encodeURIComponent(arguments[1]);
            for (var n = 2; n < arguments.length; n++) t += "&args[]=" + encodeURIComponent(arguments[n])
        }
        return "Minified React error #" + e + "; visit " + t + " for the full message or use the non-minified dev environment for full errors and additional helpful warnings."
    }

    function u(e) {
        return !(!e || 1 !== e.nodeType && 9 !== e.nodeType && 11 !== e.nodeType)
    }

    function c(e) {
        for (var t = e, n = t; n && !n.alternate;) 0 != (4098 & (t = n).flags) && (e = t.return), n = t.return;
        for (; t.return;) t = t.return;
        return 3 === t.tag ? e : null
    }

    function d(e) {
        if (13 === e.tag) {
            var t = e.memoizedState;
            if (null === t && null !== (e = e.alternate) && (t = e.memoizedState), null !== t) return t.dehydrated
        }
        return null
    }

    function f(e) {
        if (31 === e.tag) {
            var t = e.memoizedState;
            if (null === t && null !== (e = e.alternate) && (t = e.memoizedState), null !== t) return t.dehydrated
        }
        return null
    }

    function p(e) {
        if (c(e) !== e) throw Error(s(188))
    }

    function h(e, t, n, r, a, i) {
        for (; null !== e;) {
            if ((5 === e.tag || 6 === e.tag) && n(e, r, a, i) || (22 !== e.tag || null === e.memoizedState) && (t || 5 !== e.tag) && h(e.child, t, n, r, a, i)) return !0;
            e = e.sibling
        }
        return !1
    }

    function m(e) {
        for (e = e.return; null !== e;) {
            if (3 === e.tag || 5 === e.tag) return e;
            e = e.return
        }
        return null
    }

    function g(e) {
        switch (e.tag) {
            case 5:
            case 6:
                return e.stateNode;
            case 3:
                return e.stateNode.containerInfo;
            default:
                throw Error(s(559))
        }
    }
    var v = null,
        y = null;

    function b(e) {
        return v = e, !0
    }

    function w(e, t, n) {
        return e === n || e === t && (v = e, !0)
    }

    function _(e, t, n) {
        return e === n ? (y = e, !1) : e === t && (null !== y && (v = e), !0)
    }

    function S(e) {
        if (null === e) return null;
        do e = null === e ? null : e.return; while (e && 5 !== e.tag && 27 !== e.tag && 3 !== e.tag) return e || null
    }

    function k(e, t, n) {
        for (var r = 0, a = e; a; a = n(a)) r++;
        a = 0;
        for (var i = t; i; i = n(i)) a++;
        for (; 0 < r - a;) e = n(e), r--;
        for (; 0 < a - r;) t = n(t), a--;
        for (; r--;) {
            if (e === t || null !== t && e === t.alternate) return e;
            e = n(e), t = n(t)
        }
        return null
    }
    var x = Object.assign,
        E = Symbol.for("react.element"),
        T = Symbol.for("react.transitional.element"),
        N = Symbol.for("react.portal"),
        C = Symbol.for("react.fragment"),
        O = Symbol.for("react.strict_mode"),
        R = Symbol.for("react.profiler"),
        P = Symbol.for("react.consumer"),
        I = Symbol.for("react.context"),
        A = Symbol.for("react.forward_ref"),
        L = Symbol.for("react.suspense"),
        D = Symbol.for("react.suspense_list"),
        M = Symbol.for("react.memo"),
        z = Symbol.for("react.lazy");
    Symbol.for("react.scope");
    var F = Symbol.for("react.activity"),
        j = Symbol.for("react.legacy_hidden");
    Symbol.for("react.tracing_marker");
    var U = Symbol.for("react.memo_cache_sentinel"),
        B = Symbol.for("react.view_transition"),
        q = Symbol.iterator;

    function $(e) {
        return null === e || "object" != typeof e ? null : "function" == typeof(e = q && e[q] || e["@@iterator"]) ? e : null
    }
    var V = Symbol.for("react.client.reference"),
        W = Array.isArray,
        K = o.__CLIENT_INTERNALS_DO_NOT_USE_OR_WARN_USERS_THEY_CANNOT_UPGRADE,
        H = l.__DOM_INTERNALS_DO_NOT_USE_OR_WARN_USERS_THEY_CANNOT_UPGRADE,
        Z = {
            pending: !1,
            data: null,
            method: null,
            action: null
        },
        G = [],
        Q = -1;

    function Y(e) {
        return {
            current: e
        }
    }

    function X(e) {
        0 > Q || (e.current = G[Q], G[Q] = null, Q--)
    }

    function J(e, t) {
        G[++Q] = e.current, e.current = t
    }
    var ee = Y(null),
        et = Y(null),
        en = Y(null),
        er = Y(null);

    function ea(e, t) {
        switch (J(en, t), J(et, e), J(ee, null), t.nodeType) {
            case 9:
            case 11:
                e = (e = t.documentElement) && (e = e.namespaceURI) ? cc(e) : 0;
                break;
            default:
                if (e = t.tagName, t = t.namespaceURI) e = cd(t = cc(t), e);
                else switch (e) {
                    case "svg":
                        e = 1;
                        break;
                    case "math":
                        e = 2;
                        break;
                    default:
                        e = 0
                }
        }
        X(ee), J(ee, e)
    }

    function ei() {
        X(ee), X(et), X(en)
    }

    function eo(e) {
        var t = e.memoizedState;
        null !== t && (d_._currentValue = t.memoizedState, J(er, e));
        var n = cd(t = ee.current, e.type);
        t !== n && (J(et, e), J(ee, n))
    }

    function el(e) {
        et.current === e && (X(ee), X(et)), er.current === e && (X(er), d_._currentValue = Z)
    }

    function es(e) {
        if (void 0 === tG) try {
            throw Error()
        } catch (e) {
            var t = e.stack.trim().match(/\n( *(at )?)/);
            tG = t && t[1] || "", tQ = -1 < e.stack.indexOf("\n    at") ? " (<anonymous>)" : -1 < e.stack.indexOf("@") ? "@unknown:0:0" : ""
        }
        return "\n" + tG + e + tQ
    }
    var eu = !1;

    function ec(e, t) {
        if (!e || eu) return "";
        eu = !0;
        var n = Error.prepareStackTrace;
        Error.prepareStackTrace = void 0;
        try {
            var r = {
                DetermineComponentFrameRoot: function() {
                    try {
                        if (t) {
                            var n = function() {
                                throw Error()
                            };
                            if (Object.defineProperty(n.prototype, "props", {
                                    set: function() {
                                        throw Error()
                                    }
                                }), "object" == typeof Reflect && Reflect.construct) {
                                try {
                                    Reflect.construct(n, [])
                                } catch (e) {
                                    var r = e
                                }
                                Reflect.construct(e, [], n)
                            } else {
                                try {
                                    n.call()
                                } catch (e) {
                                    r = e
                                }
                                e.call(n.prototype)
                            }
                        } else {
                            try {
                                throw Error()
                            } catch (e) {
                                r = e
                            }(n = e()) && "function" == typeof n.catch && n.catch(function() {})
                        }
                    } catch (e) {
                        if (e && r && "string" == typeof e.stack) return [e.stack, r.stack]
                    }
                    return [null, null]
                }
            };
            r.DetermineComponentFrameRoot.displayName = "DetermineComponentFrameRoot";
            var a = Object.getOwnPropertyDescriptor(r.DetermineComponentFrameRoot, "name");
            a && a.configurable && Object.defineProperty(r.DetermineComponentFrameRoot, "name", {
                value: "DetermineComponentFrameRoot"
            });
            var i = r.DetermineComponentFrameRoot(),
                o = i[0],
                l = i[1];
            if (o && l) {
                var s = o.split("\n"),
                    u = l.split("\n");
                for (a = r = 0; r < s.length && !s[r].includes("DetermineComponentFrameRoot");) r++;
                for (; a < u.length && !u[a].includes("DetermineComponentFrameRoot");) a++;
                if (r === s.length || a === u.length)
                    for (r = s.length - 1, a = u.length - 1; 1 <= r && 0 <= a && s[r] !== u[a];) a--;
                for (; 1 <= r && 0 <= a; r--, a--)
                    if (s[r] !== u[a]) {
                        if (1 !== r || 1 !== a)
                            do
                                if (r--, a--, 0 > a || s[r] !== u[a]) {
                                    var c = "\n" + s[r].replace(" at new ", " at ");
                                    return e.displayName && c.includes("<anonymous>") && (c = c.replace("<anonymous>", e.displayName)), c
                                } while (1 <= r && 0 <= a) break
                    }
            }
        } finally {
            eu = !1, Error.prepareStackTrace = n
        }
        return (n = e ? e.displayName || e.name : "") ? es(n) : ""
    }

    function ed(e) {
        try {
            var t = "",
                n = null;
            do t += function(e, t) {
                switch (e.tag) {
                    case 26:
                    case 27:
                    case 5:
                        return es(e.type);
                    case 16:
                        return es("Lazy");
                    case 13:
                        return e.child !== t && null !== t ? es("Suspense Fallback") : es("Suspense");
                    case 19:
                        return es("SuspenseList");
                    case 0:
                    case 15:
                        return ec(e.type, !1);
                    case 11:
                        return ec(e.type.render, !1);
                    case 1:
                        return ec(e.type, !0);
                    case 31:
                        return es("Activity");
                    case 30:
                        return es("ViewTransition");
                    default:
                        return ""
                }
            }(e, n), n = e, e = e.return; while (e) return t
        } catch (e) {
            return "\nError generating stack: " + e.message + "\n" + e.stack
        }
    }
    var ef = Object.prototype.hasOwnProperty,
        ep = i.unstable_scheduleCallback,
        eh = i.unstable_cancelCallback,
        em = i.unstable_shouldYield,
        eg = i.unstable_requestPaint,
        ev = i.unstable_now,
        ey = i.unstable_getCurrentPriorityLevel,
        eb = i.unstable_ImmediatePriority,
        ew = i.unstable_UserBlockingPriority,
        e_ = i.unstable_NormalPriority,
        eS = i.unstable_LowPriority,
        ek = i.unstable_IdlePriority,
        ex = (i.log, i.unstable_setDisableYieldValue, null),
        eE = null,
        eT = Math.clz32 ? Math.clz32 : function(e) {
            return 0 == (e >>>= 0) ? 32 : 31 - (eN(e) / eC | 0) | 0
        },
        eN = Math.log,
        eC = Math.LN2,
        eO = 256,
        eR = 262144,
        eP = 4194304;

    function eI(e) {
        var t = 42 & e;
        if (0 !== t) return t;
        switch (e & -e) {
            case 1:
                return 1;
            case 2:
                return 2;
            case 4:
                return 4;
            case 8:
                return 8;
            case 16:
                return 16;
            case 32:
                return 32;
            case 64:
                return 64;
            case 128:
                return 128;
            case 256:
            case 512:
            case 1024:
            case 2048:
            case 4096:
            case 8192:
            case 16384:
            case 32768:
            case 65536:
            case 131072:
                return 261888 & e;
            case 262144:
            case 524288:
            case 1048576:
            case 2097152:
                return 3932160 & e;
            case 4194304:
            case 8388608:
            case 0x1000000:
            case 0x2000000:
                return 0x3c00000 & e;
            case 0x4000000:
                return 0x4000000;
            case 0x8000000:
                return 0x8000000;
            case 0x10000000:
                return 0x10000000;
            case 0x20000000:
                return 0x20000000;
            case 0x40000000:
                return 0;
            default:
                return e
        }
    }

    function eA(e, t, n) {
        var r = e.pendingLanes;
        if (0 === r) return 0;
        var a = 0,
            i = e.suspendedLanes,
            o = e.pingedLanes;
        e = e.warmLanes;
        var l = 0x7ffffff & r;
        return 0 !== l ? 0 != (r = l & ~i) ? a = eI(r) : 0 != (o &= l) ? a = eI(o) : n || 0 != (n = l & ~e) && (a = eI(n)) : 0 != (l = r & ~i) ? a = eI(l) : 0 !== o ? a = eI(o) : n || 0 != (n = r & ~e) && (a = eI(n)), 0 === a ? 0 : 0 !== t && t !== a && 0 == (t & i) && ((i = a & -a) >= (n = t & -t) || 32 === i && 0 != (4194048 & n)) ? t : a
    }

    function eL(e, t) {
        return 0 == (e.pendingLanes & ~(e.suspendedLanes & ~e.pingedLanes) & t)
    }

    function eD() {
        var e = eP;
        return 0 == (0x3c00000 & (eP <<= 1)) && (eP = 4194304), e
    }

    function eM(e) {
        for (var t = [], n = 0; 31 > n; n++) t.push(e);
        return t
    }

    function ez(e, t) {
        e.pendingLanes |= t, 0x10000000 !== t && (e.suspendedLanes = 0, e.pingedLanes = 0, e.warmLanes = 0)
    }

    function eF(e, t, n) {
        e.pendingLanes |= t, e.suspendedLanes &= ~t;
        var r = 31 - eT(t);
        e.entangledLanes |= t, e.entanglements[r] = 0x40000000 | e.entanglements[r] | 261930 & n
    }

    function ej(e, t) {
        var n = e.entangledLanes |= t;
        for (e = e.entanglements; n;) {
            var r = 31 - eT(n),
                a = 1 << r;
            a & t | e[r] & t && (e[r] |= t), n &= ~a
        }
    }

    function eU(e, t) {
        var n = t & -t;
        return 0 != ((n = 0 != (42 & n) ? 1 : eB(n)) & (e.suspendedLanes | t)) ? 0 : n
    }

    function eB(e) {
        switch (e) {
            case 2:
                e = 1;
                break;
            case 8:
                e = 4;
                break;
            case 32:
                e = 16;
                break;
            case 256:
            case 512:
            case 1024:
            case 2048:
            case 4096:
            case 8192:
            case 16384:
            case 32768:
            case 65536:
            case 131072:
            case 262144:
            case 524288:
            case 1048576:
            case 2097152:
            case 4194304:
            case 8388608:
            case 0x1000000:
            case 0x2000000:
                e = 128;
                break;
            case 0x10000000:
                e = 0x8000000;
                break;
            default:
                e = 0
        }
        return e
    }

    function eq(e) {
        return 2 < (e &= -e) ? 8 < e ? 0 != (0x7ffffff & e) ? 32 : 0x10000000 : 8 : 2
    }

    function e$() {
        var e = H.p;
        return 0 !== e ? e : void 0 === (e = window.event) ? 32 : dM(e.type)
    }

    function eV(e, t) {
        var n = H.p;
        try {
            return H.p = e, t()
        } finally {
            H.p = n
        }
    }
    var eW = Math.random().toString(36).slice(2),
        eK = "__reactFiber$" + eW,
        eH = "__reactProps$" + eW,
        eZ = "__reactContainer$" + eW,
        eG = "__reactEvents$" + eW,
        eQ = "__reactListeners$" + eW,
        eY = "__reactHandles$" + eW,
        eX = "__reactResources$" + eW,
        eJ = "__reactMarker$" + eW;

    function e0(e) {
        delete e[eK], delete e[eH], delete e[eG], delete e[eQ], delete e[eY]
    }

    function e1(e) {
        var t;
        if (t = e[eK]) return t;
        for (var n = e.parentNode; n;) {
            if (t = n[eZ] || n[eK]) {
                if (n = t.alternate, null !== t.child || null !== n && null !== n.child)
                    for (e = cY(e); null !== e;) {
                        if (n = e[eK]) return n;
                        e = cY(e)
                    }
                return t
            }
            n = (e = n).parentNode
        }
        return null
    }

    function e2(e) {
        if (e = e[eK] || e[eZ]) {
            var t = e.tag;
            if (5 === t || 6 === t || 13 === t || 31 === t || 26 === t || 27 === t || 3 === t) return e
        }
        return null
    }

    function e4(e) {
        var t = e.tag;
        if (5 === t || 26 === t || 27 === t || 6 === t) return e.stateNode;
        throw Error(s(33))
    }

    function e3(e) {
        var t = e[eX];
        return t || (t = e[eX] = {
            hoistableStyles: new Map,
            hoistableScripts: new Map
        }), t
    }

    function e5(e) {
        e[eJ] = !0
    }
    var e8 = new Set,
        e9 = {};

    function e6(e, t) {
        e7(e, t), e7(e + "Capture", t)
    }

    function e7(e, t) {
        for (e9[e] = t, e = 0; e < t.length; e++) e8.add(t[e])
    }
    var te = RegExp("^[:A-Z_a-z\\u00C0-\\u00D6\\u00D8-\\u00F6\\u00F8-\\u02FF\\u0370-\\u037D\\u037F-\\u1FFF\\u200C-\\u200D\\u2070-\\u218F\\u2C00-\\u2FEF\\u3001-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFFD][:A-Z_a-z\\u00C0-\\u00D6\\u00D8-\\u00F6\\u00F8-\\u02FF\\u0370-\\u037D\\u037F-\\u1FFF\\u200C-\\u200D\\u2070-\\u218F\\u2C00-\\u2FEF\\u3001-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFFD\\-.0-9\\u00B7\\u0300-\\u036F\\u203F-\\u2040]*$"),
        tt = {},
        tn = {},
        tr = !1;

    function ta() {
        var e = tr;
        return tr = !1, e
    }

    function ti(e, t, n) {
        if (ef.call(tn, t) || !ef.call(tt, t) && (te.test(t) ? tn[t] = !0 : (tt[t] = !0, !1)))
            if (null === n) e.removeAttribute(t);
            else {
                switch (typeof n) {
                    case "undefined":
                    case "function":
                    case "symbol":
                        e.removeAttribute(t);
                        return;
                    case "boolean":
                        var r = t.toLowerCase().slice(0, 5);
                        if ("data-" !== r && "aria-" !== r) return void e.removeAttribute(t)
                }
                e.setAttribute(t, n)
            }
    }

    function to(e, t, n) {
        if (null === n) e.removeAttribute(t);
        else {
            switch (typeof n) {
                case "undefined":
                case "function":
                case "symbol":
                case "boolean":
                    e.removeAttribute(t);
                    return
            }
            e.setAttribute(t, n)
        }
    }

    function tl(e, t, n, r) {
        if (null === r) e.removeAttribute(n);
        else {
            switch (typeof r) {
                case "undefined":
                case "function":
                case "symbol":
                case "boolean":
                    e.removeAttribute(n);
                    return
            }
            e.setAttributeNS(t, n, r)
        }
    }

    function ts(e) {
        switch (typeof e) {
            case "bigint":
            case "boolean":
            case "number":
            case "string":
            case "undefined":
            case "object":
                return e;
            default:
                return ""
        }
    }

    function tu(e) {
        var t = e.type;
        return (e = e.nodeName) && "input" === e.toLowerCase() && ("checkbox" === t || "radio" === t)
    }

    function tc(e) {
        if (!e._valueTracker) {
            var t = tu(e) ? "checked" : "value";
            e._valueTracker = function(e, t, n) {
                var r = Object.getOwnPropertyDescriptor(e.constructor.prototype, t);
                if (!e.hasOwnProperty(t) && void 0 !== r && "function" == typeof r.get && "function" == typeof r.set) {
                    var a = r.get,
                        i = r.set;
                    return Object.defineProperty(e, t, {
                        configurable: !0,
                        get: function() {
                            return a.call(this)
                        },
                        set: function(e) {
                            n = "" + e, i.call(this, e)
                        }
                    }), Object.defineProperty(e, t, {
                        enumerable: r.enumerable
                    }), {
                        getValue: function() {
                            return n
                        },
                        setValue: function(e) {
                            n = "" + e
                        },
                        stopTracking: function() {
                            e._valueTracker = null, delete e[t]
                        }
                    }
                }
            }(e, t, "" + e[t])
        }
    }

    function td(e) {
        if (!e) return !1;
        var t = e._valueTracker;
        if (!t) return !0;
        var n = t.getValue(),
            r = "";
        return e && (r = tu(e) ? e.checked ? "true" : "false" : e.value), (e = r) !== n && (t.setValue(e), !0)
    }

    function tf(e) {
        if (void 0 === (e = e || ("u" > typeof document ? document : void 0))) return null;
        try {
            return e.activeElement || e.body
        } catch (t) {
            return e.body
        }
    }
    var tp = /[\n"\\]/g;

    function th(e) {
        return e.replace(tp, function(e) {
            return "\\" + e.charCodeAt(0).toString(16) + " "
        })
    }

    function tm(e, t, n, r, a, i, o, l) {
        e.name = "", null != o && "function" != typeof o && "symbol" != typeof o && "boolean" != typeof o ? e.type = o : e.removeAttribute("type"), null != t ? "number" === o ? (0 === t && "" === e.value || e.value != t) && (e.value = "" + ts(t)) : e.value !== "" + ts(t) && (e.value = "" + ts(t)) : "submit" !== o && "reset" !== o || e.removeAttribute("value"), null != t ? tv(e, o, ts(t)) : null != n ? tv(e, o, ts(n)) : null != r && e.removeAttribute("value"), null == a && null != i && (e.defaultChecked = !!i), null != a && (e.checked = a && "function" != typeof a && "symbol" != typeof a), null != l && "function" != typeof l && "symbol" != typeof l && "boolean" != typeof l ? e.name = "" + ts(l) : e.removeAttribute("name")
    }

    function tg(e, t, n, r, a, i, o, l) {
        if (null != i && "function" != typeof i && "symbol" != typeof i && "boolean" != typeof i && (e.type = i), null != t || null != n) {
            if (("submit" === i || "reset" === i) && null == t) return void tc(e);
            n = null != n ? "" + ts(n) : "", t = null != t ? "" + ts(t) : n, l || t === e.value || (e.value = t), e.defaultValue = t
        }
        r = "function" != typeof(r = null != r ? r : a) && "symbol" != typeof r && !!r, e.checked = l ? e.checked : !!r, e.defaultChecked = !!r, null != o && "function" != typeof o && "symbol" != typeof o && "boolean" != typeof o && (e.name = o), tc(e)
    }

    function tv(e, t, n) {
        "number" === t && tf(e.ownerDocument) === e || e.defaultValue === "" + n || (e.defaultValue = "" + n)
    }

    function ty(e, t, n, r) {
        if (e = e.options, t) {
            t = {};
            for (var a = 0; a < n.length; a++) t["$" + n[a]] = !0;
            for (n = 0; n < e.length; n++) a = t.hasOwnProperty("$" + e[n].value), e[n].selected !== a && (e[n].selected = a), a && r && (e[n].defaultSelected = !0)
        } else {
            for (a = 0, n = "" + ts(n), t = null; a < e.length; a++) {
                if (e[a].value === n) {
                    e[a].selected = !0, r && (e[a].defaultSelected = !0);
                    return
                }
                null !== t || e[a].disabled || (t = e[a])
            }
            null !== t && (t.selected = !0)
        }
    }

    function tb(e, t, n) {
        if (null != t && ((t = "" + ts(t)) !== e.value && (e.value = t), null == n)) {
            e.defaultValue !== t && (e.defaultValue = t);
            return
        }
        e.defaultValue = null != n ? "" + ts(n) : ""
    }

    function tw(e, t, n, r) {
        if (null == t) {
            if (null != r) {
                if (null != n) throw Error(s(92));
                if (W(r)) {
                    if (1 < r.length) throw Error(s(93));
                    r = r[0]
                }
                n = r
            }
            null == n && (n = ""), t = n
        }
        e.defaultValue = n = ts(t), (r = e.textContent) === n && "" !== r && null !== r && (e.value = r), tc(e)
    }

    function t_(e, t) {
        if (t) {
            var n = e.firstChild;
            if (n && n === e.lastChild && 3 === n.nodeType) {
                n.nodeValue = t;
                return
            }
        }
        e.textContent = t
    }
    var tS = new Set("animationIterationCount aspectRatio borderImageOutset borderImageSlice borderImageWidth boxFlex boxFlexGroup boxOrdinalGroup columnCount columns flex flexGrow flexPositive flexShrink flexNegative flexOrder gridArea gridRow gridRowEnd gridRowSpan gridRowStart gridColumn gridColumnEnd gridColumnSpan gridColumnStart fontWeight lineClamp lineHeight opacity order orphans scale tabSize widows zIndex zoom fillOpacity floodOpacity stopOpacity strokeDasharray strokeDashoffset strokeMiterlimit strokeOpacity strokeWidth MozAnimationIterationCount MozBoxFlex MozBoxFlexGroup MozLineClamp msAnimationIterationCount msFlex msZoom msFlexGrow msFlexNegative msFlexOrder msFlexPositive msFlexShrink msGridColumn msGridColumnSpan msGridRow msGridRowSpan WebkitAnimationIterationCount WebkitBoxFlex WebKitBoxFlexGroup WebkitBoxOrdinalGroup WebkitColumnCount WebkitColumns WebkitFlex WebkitFlexGrow WebkitFlexPositive WebkitFlexShrink WebkitLineClamp".split(" "));

    function tk(e, t, n) {
        var r = 0 === t.indexOf("--");
        null == n || "boolean" == typeof n || "" === n ? r ? e.setProperty(t, "") : "float" === t ? e.cssFloat = "" : e[t] = "" : r ? e.setProperty(t, n) : "number" != typeof n || 0 === n || tS.has(t) ? "float" === t ? e.cssFloat = n : e[t] = ("" + n).trim() : e[t] = n + "px"
    }

    function tx(e, t, n) {
        if (null != t && "object" != typeof t) throw Error(s(62));
        if (e = e.style, null != n) {
            for (var r in n) !n.hasOwnProperty(r) || null != t && t.hasOwnProperty(r) || (0 === r.indexOf("--") ? e.setProperty(r, "") : "float" === r ? e.cssFloat = "" : e[r] = "", tr = !0);
            for (var a in t) r = t[a], t.hasOwnProperty(a) && n[a] !== r && (tk(e, a, r), tr = !0)
        } else
            for (var i in t) t.hasOwnProperty(i) && tk(e, i, t[i])
    }

    function tE(e) {
        if (-1 === e.indexOf("-")) return !1;
        switch (e) {
            case "annotation-xml":
            case "color-profile":
            case "font-face":
            case "font-face-src":
            case "font-face-uri":
            case "font-face-format":
            case "font-face-name":
            case "missing-glyph":
                return !1;
            default:
                return !0
        }
    }
    var tT = new Map([
            ["acceptCharset", "accept-charset"],
            ["htmlFor", "for"],
            ["httpEquiv", "http-equiv"],
            ["crossOrigin", "crossorigin"],
            ["accentHeight", "accent-height"],
            ["alignmentBaseline", "alignment-baseline"],
            ["arabicForm", "arabic-form"],
            ["baselineShift", "baseline-shift"],
            ["capHeight", "cap-height"],
            ["clipPath", "clip-path"],
            ["clipRule", "clip-rule"],
            ["colorInterpolation", "color-interpolation"],
            ["colorInterpolationFilters", "color-interpolation-filters"],
            ["colorProfile", "color-profile"],
            ["colorRendering", "color-rendering"],
            ["dominantBaseline", "dominant-baseline"],
            ["enableBackground", "enable-background"],
            ["fillOpacity", "fill-opacity"],
            ["fillRule", "fill-rule"],
            ["floodColor", "flood-color"],
            ["floodOpacity", "flood-opacity"],
            ["fontFamily", "font-family"],
            ["fontSize", "font-size"],
            ["fontSizeAdjust", "font-size-adjust"],
            ["fontStretch", "font-stretch"],
            ["fontStyle", "font-style"],
            ["fontVariant", "font-variant"],
            ["fontWeight", "font-weight"],
            ["glyphName", "glyph-name"],
            ["glyphOrientationHorizontal", "glyph-orientation-horizontal"],
            ["glyphOrientationVertical", "glyph-orientation-vertical"],
            ["horizAdvX", "horiz-adv-x"],
            ["horizOriginX", "horiz-origin-x"],
            ["imageRendering", "image-rendering"],
            ["letterSpacing", "letter-spacing"],
            ["lightingColor", "lighting-color"],
            ["markerEnd", "marker-end"],
            ["markerMid", "marker-mid"],
            ["markerStart", "marker-start"],
            ["maskType", "mask-type"],
            ["overlinePosition", "overline-position"],
            ["overlineThickness", "overline-thickness"],
            ["paintOrder", "paint-order"],
            ["panose-1", "panose-1"],
            ["pointerEvents", "pointer-events"],
            ["renderingIntent", "rendering-intent"],
            ["shapeRendering", "shape-rendering"],
            ["stopColor", "stop-color"],
            ["stopOpacity", "stop-opacity"],
            ["strikethroughPosition", "strikethrough-position"],
            ["strikethroughThickness", "strikethrough-thickness"],
            ["strokeDasharray", "stroke-dasharray"],
            ["strokeDashoffset", "stroke-dashoffset"],
            ["strokeLinecap", "stroke-linecap"],
            ["strokeLinejoin", "stroke-linejoin"],
            ["strokeMiterlimit", "stroke-miterlimit"],
            ["strokeOpacity", "stroke-opacity"],
            ["strokeWidth", "stroke-width"],
            ["textAnchor", "text-anchor"],
            ["textDecoration", "text-decoration"],
            ["textRendering", "text-rendering"],
            ["transformOrigin", "transform-origin"],
            ["underlinePosition", "underline-position"],
            ["underlineThickness", "underline-thickness"],
            ["unicodeBidi", "unicode-bidi"],
            ["unicodeRange", "unicode-range"],
            ["unitsPerEm", "units-per-em"],
            ["vAlphabetic", "v-alphabetic"],
            ["vHanging", "v-hanging"],
            ["vIdeographic", "v-ideographic"],
            ["vMathematical", "v-mathematical"],
            ["vectorEffect", "vector-effect"],
            ["vertAdvY", "vert-adv-y"],
            ["vertOriginX", "vert-origin-x"],
            ["vertOriginY", "vert-origin-y"],
            ["wordSpacing", "word-spacing"],
            ["writingMode", "writing-mode"],
            ["xmlnsXlink", "xmlns:xlink"],
            ["xHeight", "x-height"]
        ]),
        tN = /^[\u0000-\u001F ]*j[\r\n\t]*a[\r\n\t]*v[\r\n\t]*a[\r\n\t]*s[\r\n\t]*c[\r\n\t]*r[\r\n\t]*i[\r\n\t]*p[\r\n\t]*t[\r\n\t]*:/i;

    function tC(e) {
        return tN.test("" + e) ? "javascript:throw new Error('React has blocked a javascript: URL as a security precaution.')" : e
    }

    function tO() {}
    var tR = null;

    function tP(e) {
        return (e = e.target || e.srcElement || window).correspondingUseElement && (e = e.correspondingUseElement), 3 === e.nodeType ? e.parentNode : e
    }
    var tI = null,
        tA = null;

    function tL(e) {
        var t = e2(e);
        if (t && (e = t.stateNode)) {
            var n = e[eH] || null;
            switch (e = t.stateNode, t.type) {
                case "input":
                    if (tm(e, n.value, n.defaultValue, n.defaultValue, n.checked, n.defaultChecked, n.type, n.name), t = n.name, "radio" === n.type && null != t) {
                        for (n = e; n.parentNode;) n = n.parentNode;
                        for (n = n.querySelectorAll('input[name="' + th("" + t) + '"][type="radio"]'), t = 0; t < n.length; t++) {
                            var r = n[t];
                            if (r !== e && r.form === e.form) {
                                var a = r[eH] || null;
                                if (!a) throw Error(s(90));
                                tm(r, a.value, a.defaultValue, a.defaultValue, a.checked, a.defaultChecked, a.type, a.name)
                            }
                        }
                        for (t = 0; t < n.length; t++)(r = n[t]).form === e.form && td(r)
                    }
                    break;
                case "textarea":
                    tb(e, n.value, n.defaultValue);
                    break;
                case "select":
                    null != (t = n.value) && ty(e, !!n.multiple, t, !1)
            }
        }
    }
    var tD = !1;

    function tM(e, t, n) {
        if (tD) return e(t, n);
        tD = !0;
        try {
            return e(t)
        } finally {
            if (tD = !1, (null !== tI || null !== tA) && (ur(), tI && (t = tI, e = tA, tA = tI = null, tL(t), e)))
                for (t = 0; t < e.length; t++) tL(e[t])
        }
    }

    function tz(e, t) {
        var n = e.stateNode;
        if (null === n) return null;
        var r = n[eH] || null;
        if (null === r) return null;
        switch (n = r[t], t) {
            case "onClick":
            case "onClickCapture":
            case "onDoubleClick":
            case "onDoubleClickCapture":
            case "onMouseDown":
            case "onMouseDownCapture":
            case "onMouseMove":
            case "onMouseMoveCapture":
            case "onMouseUp":
            case "onMouseUpCapture":
            case "onMouseEnter":
                (r = !r.disabled) || (r = "button" !== (e = e.type) && "input" !== e && "select" !== e && "textarea" !== e), e = !r;
                break;
            default:
                e = !1
        }
        if (e) return null;
        if (n && "function" != typeof n) throw Error(s(231, t, typeof n));
        return n
    }
    var tF = "u" > typeof window && void 0 !== window.document && void 0 !== window.document.createElement,
        tj = !1;
    if (tF) try {
        var tU = {};
        Object.defineProperty(tU, "passive", {
            get: function() {
                tj = !0
            }
        }), window.addEventListener("test", tU, tU), window.removeEventListener("test", tU, tU)
    } catch (e) {
        tj = !1
    }
    var tB = null,
        tq = null,
        t$ = null;

    function tV() {
        if (t$) return t$;
        var e, t, n = tq,
            r = n.length,
            a = "value" in tB ? tB.value : tB.textContent,
            i = a.length;
        for (e = 0; e < r && n[e] === a[e]; e++);
        var o = r - e;
        for (t = 1; t <= o && n[r - t] === a[i - t]; t++);
        return t$ = a.slice(e, 1 < t ? 1 - t : void 0)
    }

    function tW(e) {
        var t = e.keyCode;
        return "charCode" in e ? 0 === (e = e.charCode) && 13 === t && (e = 13) : e = t, 10 === e && (e = 13), 32 <= e || 13 === e ? e : 0
    }

    function tK() {
        return !0
    }

    function tH() {
        return !1
    }

    function tZ(e) {
        function t(t, n, r, a, i) {
            for (var o in this._reactName = t, this._targetInst = r, this.type = n, this.nativeEvent = a, this.target = i, this.currentTarget = null, e) e.hasOwnProperty(o) && (t = e[o], this[o] = t ? t(a) : a[o]);
            return this.isDefaultPrevented = (null != a.defaultPrevented ? a.defaultPrevented : !1 === a.returnValue) ? tK : tH, this.isPropagationStopped = tH, this
        }
        return x(t.prototype, {
            preventDefault: function() {
                this.defaultPrevented = !0;
                var e = this.nativeEvent;
                e && (e.preventDefault ? e.preventDefault() : "unknown" != typeof e.returnValue && (e.returnValue = !1), this.isDefaultPrevented = tK)
            },
            stopPropagation: function() {
                var e = this.nativeEvent;
                e && (e.stopPropagation ? e.stopPropagation() : "unknown" != typeof e.cancelBubble && (e.cancelBubble = !0), this.isPropagationStopped = tK)
            },
            persist: function() {},
            isPersistent: tK
        }), t
    }
    var tG, tQ, tY, tX, tJ, t0 = {
            eventPhase: 0,
            bubbles: 0,
            cancelable: 0,
            timeStamp: function(e) {
                return e.timeStamp || Date.now()
            },
            defaultPrevented: 0,
            isTrusted: 0
        },
        t1 = tZ(t0),
        t2 = x({}, t0, {
            view: 0,
            detail: 0
        }),
        t4 = tZ(t2),
        t3 = x({}, t2, {
            screenX: 0,
            screenY: 0,
            clientX: 0,
            clientY: 0,
            pageX: 0,
            pageY: 0,
            ctrlKey: 0,
            shiftKey: 0,
            altKey: 0,
            metaKey: 0,
            getModifierState: ni,
            button: 0,
            buttons: 0,
            relatedTarget: function(e) {
                return void 0 === e.relatedTarget ? e.fromElement === e.srcElement ? e.toElement : e.fromElement : e.relatedTarget
            },
            movementX: function(e) {
                return "movementX" in e ? e.movementX : (e !== tJ && (tJ && "mousemove" === e.type ? (tY = e.screenX - tJ.screenX, tX = e.screenY - tJ.screenY) : tX = tY = 0, tJ = e), tY)
            },
            movementY: function(e) {
                return "movementY" in e ? e.movementY : tX
            }
        }),
        t5 = tZ(t3),
        t8 = tZ(x({}, t3, {
            dataTransfer: 0
        })),
        t9 = tZ(x({}, t2, {
            relatedTarget: 0
        })),
        t6 = tZ(x({}, t0, {
            animationName: 0,
            elapsedTime: 0,
            pseudoElement: 0
        })),
        t7 = tZ(x({}, t0, {
            clipboardData: function(e) {
                return "clipboardData" in e ? e.clipboardData : window.clipboardData
            }
        })),
        ne = tZ(x({}, t0, {
            data: 0
        })),
        nt = {
            Esc: "Escape",
            Spacebar: " ",
            Left: "ArrowLeft",
            Up: "ArrowUp",
            Right: "ArrowRight",
            Down: "ArrowDown",
            Del: "Delete",
            Win: "OS",
            Menu: "ContextMenu",
            Apps: "ContextMenu",
            Scroll: "ScrollLock",
            MozPrintableKey: "Unidentified"
        },
        nn = {
            8: "Backspace",
            9: "Tab",
            12: "Clear",
            13: "Enter",
            16: "Shift",
            17: "Control",
            18: "Alt",
            19: "Pause",
            20: "CapsLock",
            27: "Escape",
            32: " ",
            33: "PageUp",
            34: "PageDown",
            35: "End",
            36: "Home",
            37: "ArrowLeft",
            38: "ArrowUp",
            39: "ArrowRight",
            40: "ArrowDown",
            45: "Insert",
            46: "Delete",
            112: "F1",
            113: "F2",
            114: "F3",
            115: "F4",
            116: "F5",
            117: "F6",
            118: "F7",
            119: "F8",
            120: "F9",
            121: "F10",
            122: "F11",
            123: "F12",
            144: "NumLock",
            145: "ScrollLock",
            224: "Meta"
        },
        nr = {
            Alt: "altKey",
            Control: "ctrlKey",
            Meta: "metaKey",
            Shift: "shiftKey"
        };

    function na(e) {
        var t = this.nativeEvent;
        return t.getModifierState ? t.getModifierState(e) : !!(e = nr[e]) && !!t[e]
    }

    function ni() {
        return na
    }
    var no = tZ(x({}, t2, {
            key: function(e) {
                if (e.key) {
                    var t = nt[e.key] || e.key;
                    if ("Unidentified" !== t) return t
                }
                return "keypress" === e.type ? 13 === (e = tW(e)) ? "Enter" : String.fromCharCode(e) : "keydown" === e.type || "keyup" === e.type ? nn[e.keyCode] || "Unidentified" : ""
            },
            code: 0,
            location: 0,
            ctrlKey: 0,
            shiftKey: 0,
            altKey: 0,
            metaKey: 0,
            repeat: 0,
            locale: 0,
            getModifierState: ni,
            charCode: function(e) {
                return "keypress" === e.type ? tW(e) : 0
            },
            keyCode: function(e) {
                return "keydown" === e.type || "keyup" === e.type ? e.keyCode : 0
            },
            which: function(e) {
                return "keypress" === e.type ? tW(e) : "keydown" === e.type || "keyup" === e.type ? e.keyCode : 0
            }
        })),
        nl = tZ(x({}, t3, {
            pointerId: 0,
            width: 0,
            height: 0,
            pressure: 0,
            tangentialPressure: 0,
            tiltX: 0,
            tiltY: 0,
            twist: 0,
            pointerType: 0,
            isPrimary: 0
        })),
        ns = tZ(x({}, t0, {
            submitter: 0
        })),
        nu = tZ(x({}, t2, {
            touches: 0,
            targetTouches: 0,
            changedTouches: 0,
            altKey: 0,
            metaKey: 0,
            ctrlKey: 0,
            shiftKey: 0,
            getModifierState: ni
        })),
        nc = tZ(x({}, t0, {
            propertyName: 0,
            elapsedTime: 0,
            pseudoElement: 0
        })),
        nd = tZ(x({}, t3, {
            deltaX: function(e) {
                return "deltaX" in e ? e.deltaX : "wheelDeltaX" in e ? -e.wheelDeltaX : 0
            },
            deltaY: function(e) {
                return "deltaY" in e ? e.deltaY : "wheelDeltaY" in e ? -e.wheelDeltaY : "wheelDelta" in e ? -e.wheelDelta : 0
            },
            deltaZ: 0,
            deltaMode: 0
        })),
        nf = tZ(x({}, t0, {
            newState: 0,
            oldState: 0
        })),
        np = [9, 13, 27, 32],
        nh = tF && "CompositionEvent" in window,
        nm = null;
    tF && "documentMode" in document && (nm = document.documentMode);
    var ng = tF && "TextEvent" in window && !nm,
        nv = tF && (!nh || nm && 8 < nm && 11 >= nm),
        ny = !1;

    function nb(e, t) {
        switch (e) {
            case "keyup":
                return -1 !== np.indexOf(t.keyCode);
            case "keydown":
                return 229 !== t.keyCode;
            case "keypress":
            case "mousedown":
            case "focusout":
                return !0;
            default:
                return !1
        }
    }

    function nw(e) {
        return "object" == typeof(e = e.detail) && "data" in e ? e.data : null
    }
    var n_ = !1,
        nS = {
            color: !0,
            date: !0,
            datetime: !0,
            "datetime-local": !0,
            email: !0,
            month: !0,
            number: !0,
            password: !0,
            range: !0,
            search: !0,
            tel: !0,
            text: !0,
            time: !0,
            url: !0,
            week: !0
        };

    function nk(e) {
        var t = e && e.nodeName && e.nodeName.toLowerCase();
        return "input" === t ? !!nS[e.type] : "textarea" === t
    }

    function nx(e, t, n, r) {
        tI ? tA ? tA.push(r) : tA = [r] : tI = r, 0 < (t = u8(t, "onChange")).length && (n = new t1("onChange", "change", null, n, r), e.push({
            event: n,
            listeners: t
        }))
    }
    var nE = null,
        nT = null;

    function nN(e) {
        uX(e, 0)
    }

    function nC(e) {
        if (td(e4(e))) return e
    }

    function nO(e, t) {
        if ("change" === e) return t
    }
    var nR = !1;
    if (tF) {
        if (tF) {
            var nP = "oninput" in document;
            if (!nP) {
                var nI = document.createElement("div");
                nI.setAttribute("oninput", "return;"), nP = "function" == typeof nI.oninput
            }
            r = nP
        } else r = !1;
        nR = r && (!document.documentMode || 9 < document.documentMode)
    }

    function nA() {
        nE && (nE.detachEvent("onpropertychange", nL), nT = nE = null)
    }

    function nL(e) {
        if ("value" === e.propertyName && nC(nT)) {
            var t = [];
            nx(t, nT, e, tP(e)), tM(nN, t)
        }
    }

    function nD(e, t, n) {
        "focusin" === e ? (nA(), nE = t, nT = n, nE.attachEvent("onpropertychange", nL)) : "focusout" === e && nA()
    }

    function nM(e) {
        if ("selectionchange" === e || "keyup" === e || "keydown" === e) return nC(nT)
    }

    function nz(e, t) {
        if ("click" === e) return nC(t)
    }

    function nF(e, t) {
        if ("input" === e || "change" === e) return nC(t)
    }
    var nj = "function" == typeof Object.is ? Object.is : function(e, t) {
        return e === t && (0 !== e || 1 / e == 1 / t) || e != e && t != t
    };

    function nU(e, t) {
        if (nj(e, t)) return !0;
        if ("object" != typeof e || null === e || "object" != typeof t || null === t) return !1;
        var n = Object.keys(e),
            r = Object.keys(t);
        if (n.length !== r.length) return !1;
        for (r = 0; r < n.length; r++) {
            var a = n[r];
            if (!ef.call(t, a) || !nj(e[a], t[a])) return !1
        }
        return !0
    }

    function nB(e) {
        for (; e && e.firstChild;) e = e.firstChild;
        return e
    }

    function nq(e, t) {
        var n, r = nB(e);
        for (e = 0; r;) {
            if (3 === r.nodeType) {
                if (n = e + r.textContent.length, e <= t && n >= t) return {
                    node: r,
                    offset: t - e
                };
                e = n
            }
            e: {
                for (; r;) {
                    if (r.nextSibling) {
                        r = r.nextSibling;
                        break e
                    }
                    r = r.parentNode
                }
                r = void 0
            }
            r = nB(r)
        }
    }

    function n$(e) {
        e = null != e && null != e.ownerDocument && null != e.ownerDocument.defaultView ? e.ownerDocument.defaultView : window;
        for (var t = tf(e.document); t instanceof e.HTMLIFrameElement;) {
            try {
                var n = "string" == typeof t.contentWindow.location.href
            } catch (e) {
                n = !1
            }
            if (n) e = t.contentWindow;
            else break;
            t = tf(e.document)
        }
        return t
    }

    function nV(e) {
        var t = e && e.nodeName && e.nodeName.toLowerCase();
        return t && ("input" === t && ("text" === e.type || "search" === e.type || "tel" === e.type || "url" === e.type || "password" === e.type) || "textarea" === t || "true" === e.contentEditable)
    }
    var nW = tF && "documentMode" in document && 11 >= document.documentMode,
        nK = null,
        nH = null,
        nZ = null,
        nG = !1;

    function nQ(e, t, n) {
        var r = n.window === n ? n.document : 9 === n.nodeType ? n : n.ownerDocument;
        nG || null == nK || nK !== tf(r) || (r = "selectionStart" in (r = nK) && nV(r) ? {
            start: r.selectionStart,
            end: r.selectionEnd
        } : {
            anchorNode: (r = (r.ownerDocument && r.ownerDocument.defaultView || window).getSelection()).anchorNode,
            anchorOffset: r.anchorOffset,
            focusNode: r.focusNode,
            focusOffset: r.focusOffset
        }, nZ && nU(nZ, r) || (nZ = r, 0 < (r = u8(nH, "onSelect")).length && (t = new t1("onSelect", "select", null, t, n), e.push({
            event: t,
            listeners: r
        }), t.target = nK)))
    }

    function nY(e, t) {
        var n = {};
        return n[e.toLowerCase()] = t.toLowerCase(), n["Webkit" + e] = "webkit" + t, n["Moz" + e] = "moz" + t, n
    }
    var nX = {
            animationend: nY("Animation", "AnimationEnd"),
            animationiteration: nY("Animation", "AnimationIteration"),
            animationstart: nY("Animation", "AnimationStart"),
            transitionrun: nY("Transition", "TransitionRun"),
            transitionstart: nY("Transition", "TransitionStart"),
            transitioncancel: nY("Transition", "TransitionCancel"),
            transitionend: nY("Transition", "TransitionEnd")
        },
        nJ = {},
        n0 = {};

    function n1(e) {
        if (nJ[e]) return nJ[e];
        if (!nX[e]) return e;
        var t, n = nX[e];
        for (t in n)
            if (n.hasOwnProperty(t) && t in n0) return nJ[e] = n[t];
        return e
    }
    tF && (n0 = document.createElement("div").style, "AnimationEvent" in window || (delete nX.animationend.animation, delete nX.animationiteration.animation, delete nX.animationstart.animation), "TransitionEvent" in window || delete nX.transitionend.transition);
    var n2 = n1("animationend"),
        n4 = n1("animationiteration"),
        n3 = n1("animationstart"),
        n5 = n1("transitionrun"),
        n8 = n1("transitionstart"),
        n9 = n1("transitioncancel"),
        n6 = n1("transitionend"),
        n7 = new Map,
        re = "abort auxClick beforeToggle cancel canPlay canPlayThrough click close contextMenu copy cut drag dragEnd dragEnter dragExit dragLeave dragOver dragStart drop durationChange emptied encrypted ended error fullscreenChange fullscreenError gotPointerCapture input invalid keyDown keyPress keyUp load loadedData loadedMetadata loadStart lostPointerCapture mouseDown mouseMove mouseOut mouseOver mouseUp paste pause play playing pointerCancel pointerDown pointerMove pointerOut pointerOver pointerUp progress rateChange reset resize seeked seeking stalled submit suspend timeUpdate touchCancel touchEnd touchStart volumeChange scroll toggle touchMove waiting wheel".split(" ");

    function rt(e, t) {
        n7.set(e, t), e6(t, [e])
    }
    re.push("scrollEnd");
    var rn = 0;

    function rr(e, t) {
        return null != e.name && "auto" !== e.name ? e.name : null !== t.autoName ? t.autoName : t.autoName = e = "_" + (e = sG.identifierPrefix) + "t_" + (rn++).toString(32) + "_"
    }

    function ra(e) {
        if (null == e || "string" == typeof e) return e;
        var t = null,
            n = s4;
        if (null !== n)
            for (var r = 0; r < n.length; r++) {
                var a = e[n[r]];
                if (null != a) {
                    if ("none" === a) return "none";
                    t = null == t ? a : t + " " + a
                }
            }
        return null == t ? e.default : t
    }

    function ri(e, t) {
        return e = ra(e), null == (t = ra(t)) ? "auto" === e ? null : e : "auto" === t ? null : t
    }
    var ro = "function" == typeof reportError ? reportError : function(e) {
            if ("object" == typeof window && "function" == typeof window.ErrorEvent) {
                var t = new window.ErrorEvent("error", {
                    bubbles: !0,
                    cancelable: !0,
                    message: "object" == typeof e && null !== e && "string" == typeof e.message ? String(e.message) : String(e),
                    error: e
                });
                if (!window.dispatchEvent(t)) return
            } else if ("object" == typeof a.default && "function" == typeof a.default.emit) return void a.default.emit("uncaughtException", e);
            console.error(e)
        },
        rl = [],
        rs = 0,
        ru = 0;

    function rc() {
        for (var e = rs, t = ru = rs = 0; t < e;) {
            var n = rl[t];
            rl[t++] = null;
            var r = rl[t];
            rl[t++] = null;
            var a = rl[t];
            rl[t++] = null;
            var i = rl[t];
            if (rl[t++] = null, null !== r && null !== a) {
                var o = r.pending;
                null === o ? a.next = a : (a.next = o.next, o.next = a), r.pending = a
            }
            0 !== i && rh(n, a, i)
        }
    }

    function rd(e, t, n, r) {
        rl[rs++] = e, rl[rs++] = t, rl[rs++] = n, rl[rs++] = r, ru |= r, e.lanes |= r, null !== (e = e.alternate) && (e.lanes |= r)
    }

    function rf(e, t, n, r) {
        return rd(e, t, n, r), rm(e)
    }

    function rp(e, t) {
        return rd(e, null, null, t), rm(e)
    }

    function rh(e, t, n) {
        e.lanes |= n;
        var r = e.alternate;
        null !== r && (r.lanes |= n);
        for (var a = !1, i = e.return; null !== i;) i.childLanes |= n, null !== (r = i.alternate) && (r.childLanes |= n), 22 === i.tag && (null === (e = i.stateNode) || 1 & e._visibility || (a = !0)), e = i, i = i.return;
        return 3 === e.tag ? (i = e.stateNode, a && null !== t && (a = 31 - eT(n), null === (r = (e = i.hiddenUpdates)[a]) ? e[a] = [t] : r.push(t), t.lane = 0x20000000 | n), i) : null
    }

    function rm(e) {
        if (50 < s3) throw s3 = 0, s5 = null, Error(s(185));
        for (var t = e.return; null !== t;) t = (e = t).return;
        return 3 === e.tag ? e.stateNode : null
    }
    var rg = {};

    function rv(e, t, n, r) {
        this.tag = e, this.key = n, this.sibling = this.child = this.return = this.stateNode = this.type = this.elementType = null, this.index = 0, this.refCleanup = this.ref = null, this.pendingProps = t, this.dependencies = this.memoizedState = this.updateQueue = this.memoizedProps = null, this.mode = r, this.subtreeFlags = this.flags = 0, this.deletions = null, this.childLanes = this.lanes = 0, this.alternate = null
    }

    function ry(e, t, n, r) {
        return new rv(e, t, n, r)
    }

    function rb(e) {
        return !(!(e = e.prototype) || !e.isReactComponent)
    }

    function rw(e, t) {
        var n = e.alternate;
        return null === n ? ((n = ry(e.tag, t, e.key, e.mode)).elementType = e.elementType, n.type = e.type, n.stateNode = e.stateNode, n.alternate = e, e.alternate = n) : (n.pendingProps = t, n.type = e.type, n.flags = 0, n.subtreeFlags = 0, n.deletions = null), n.flags = 0x7f00000 & e.flags, n.childLanes = e.childLanes, n.lanes = e.lanes, n.child = e.child, n.memoizedProps = e.memoizedProps, n.memoizedState = e.memoizedState, n.updateQueue = e.updateQueue, t = e.dependencies, n.dependencies = null === t ? null : {
            lanes: t.lanes,
            firstContext: t.firstContext
        }, n.sibling = e.sibling, n.index = e.index, n.ref = e.ref, n.refCleanup = e.refCleanup, n
    }

    function r_(e, t) {
        e.flags &= 0x7f00002;
        var n = e.alternate;
        return null === n ? (e.childLanes = 0, e.lanes = t, e.child = null, e.subtreeFlags = 0, e.memoizedProps = null, e.memoizedState = null, e.updateQueue = null, e.dependencies = null, e.stateNode = null) : (e.childLanes = n.childLanes, e.lanes = n.lanes, e.child = n.child, e.subtreeFlags = 0, e.deletions = null, e.memoizedProps = n.memoizedProps, e.memoizedState = n.memoizedState, e.updateQueue = n.updateQueue, e.type = n.type, e.dependencies = null === (t = n.dependencies) ? null : {
            lanes: t.lanes,
            firstContext: t.firstContext
        }), e
    }

    function rS(e, t, n, r, a, i) {
        var o = 0;
        if (r = e, "function" == typeof e) rb(e) && (o = 1);
        else if ("string" == typeof e) o = ! function(e, t, n) {
            if (1 === n || null != t.itemProp) return !1;
            switch (e) {
                case "meta":
                case "title":
                    return !0;
                case "style":
                    if ("string" != typeof t.precedence || "string" != typeof t.href || "" === t.href) break;
                    return !0;
                case "link":
                    if ("string" != typeof t.rel || "string" != typeof t.href || "" === t.href || t.onLoad || t.onError) break;
                    if ("stylesheet" === t.rel) return e = t.disabled, "string" == typeof t.precedence && null == e;
                    return !0;
                case "script":
                    if (t.async && "function" != typeof t.async && "symbol" != typeof t.async && !t.onLoad && !t.onError && t.src && "string" == typeof t.src) return !0
            }
            return !1
        }(e, n, ee.current) ? "html" === e || "head" === e || "body" === e ? 27 : 5 : 26;
        else e: switch (e) {
            case F:
                return (e = ry(31, n, t, a)).elementType = F, e.lanes = i, e;
            case C:
                return rk(n.children, a, i, t);
            case O:
                o = 8, a |= 24;
                break;
            case R:
                return (e = ry(12, n, t, 2 | a)).elementType = R, e.lanes = i, e;
            case L:
                return (e = ry(13, n, t, a)).elementType = L, e.lanes = i, e;
            case D:
                return (e = ry(19, n, t, a)).elementType = D, e.lanes = i, e;
            case j:
            case B:
                return (e = ry(30, n, t, e = 32 | a)).elementType = B, e.lanes = i, e.stateNode = {
                    autoName: null,
                    paired: null,
                    clones: null,
                    ref: null
                }, e;
            default:
                if ("object" == typeof e && null !== e) switch (e.$$typeof) {
                    case I:
                        o = 10;
                        break e;
                    case P:
                        o = 9;
                        break e;
                    case A:
                        o = 11;
                        break e;
                    case M:
                        o = 14;
                        break e;
                    case z:
                        o = 16, r = null;
                        break e
                }
                o = 29, n = Error(s(130, null === e ? "null" : typeof e, "")), r = null
        }
        return (t = ry(o, n, t, a)).elementType = e, t.type = r, t.lanes = i, t
    }

    function rk(e, t, n, r) {
        return (e = ry(7, e, r, t)).lanes = n, e
    }

    function rx(e, t, n) {
        return (e = ry(6, e, null, t)).lanes = n, e
    }

    function rE(e) {
        var t = ry(18, null, null, 0);
        return t.stateNode = e, t
    }

    function rT(e, t, n) {
        return (t = ry(4, null !== e.children ? e.children : [], e.key, t)).lanes = n, t.stateNode = {
            containerInfo: e.containerInfo,
            pendingChildren: null,
            implementation: e.implementation
        }, t
    }
    var rN = new WeakMap;

    function rC(e, t) {
        if ("object" == typeof e && null !== e) {
            var n = rN.get(e);
            return void 0 !== n ? n : (t = {
                value: e,
                source: t,
                stack: ed(t)
            }, rN.set(e, t), t)
        }
        return {
            value: e,
            source: t,
            stack: ed(t)
        }
    }
    var rO = [],
        rR = 0,
        rP = null,
        rI = 0,
        rA = [],
        rL = 0,
        rD = null,
        rM = 1,
        rz = "";

    function rF(e, t) {
        rO[rR++] = rI, rO[rR++] = rP, rP = e, rI = t
    }

    function rj(e, t, n) {
        rA[rL++] = rM, rA[rL++] = rz, rA[rL++] = rD, rD = e;
        var r = rM;
        e = rz;
        var a = 32 - eT(r) - 1;
        r &= ~(1 << a), n += 1;
        var i = 32 - eT(t) + a;
        if (30 < i) {
            var o = a - a % 5;
            i = (r & (1 << o) - 1).toString(32), r >>= o, a -= o, rM = 1 << 32 - eT(t) + a | n << a | r, rz = i + e
        } else rM = 1 << i | n << a | r, rz = e
    }

    function rU(e) {
        null !== e.return && (rF(e, 1), rj(e, 1, 0))
    }

    function rB(e) {
        for (; e === rP;) rP = rO[--rR], rO[rR] = null, rI = rO[--rR], rO[rR] = null;
        for (; e === rD;) rD = rA[--rL], rA[rL] = null, rz = rA[--rL], rA[rL] = null, rM = rA[--rL], rA[rL] = null
    }

    function rq(e, t) {
        rA[rL++] = rM, rA[rL++] = rz, rA[rL++] = rD, rM = t.id, rz = t.overflow, rD = e
    }
    var r$ = null,
        rV = null,
        rW = !1,
        rK = null,
        rH = !1,
        rZ = Error(s(519));

    function rG(e) {
        var t = Error(s(418, 1 < arguments.length && void 0 !== arguments[1] && arguments[1] ? "text" : "HTML", ""));
        throw r1(rC(t, e)), rZ
    }

    function rQ(e) {
        var t = e.stateNode,
            n = e.type,
            r = e.memoizedProps;
        switch (t[eK] = e, t[eH] = r, n) {
            case "dialog":
                uJ("cancel", t), uJ("close", t);
                break;
            case "iframe":
            case "object":
            case "embed":
                uJ("load", t);
                break;
            case "video":
            case "audio":
                for (n = 0; n < uQ.length; n++) uJ(uQ[n], t);
                break;
            case "source":
                uJ("error", t);
                break;
            case "img":
            case "image":
            case "link":
                uJ("error", t), uJ("load", t);
                break;
            case "details":
                uJ("toggle", t);
                break;
            case "input":
                uJ("invalid", t), tg(t, r.value, r.defaultValue, r.checked, r.defaultChecked, r.type, r.name, !0);
                break;
            case "select":
                uJ("invalid", t);
                break;
            case "textarea":
                uJ("invalid", t), tw(t, r.value, r.defaultValue, r.children)
        }
        "string" != typeof(n = r.children) && "number" != typeof n && "bigint" != typeof n || t.textContent === "" + n || !0 === r.suppressHydrationWarning || cn(t.textContent, n) ? (null != r.popover && (uJ("beforetoggle", t), uJ("toggle", t)), null != r.onScroll && uJ("scroll", t), null != r.onScrollEnd && uJ("scrollend", t), null != r.onClick && (t.onclick = tO), t = !0) : t = !1, t || rG(e, !0)
    }

    function rY(e) {
        for (r$ = e.return; r$;) switch (r$.tag) {
            case 5:
            case 31:
            case 13:
                rH = !1;
                return;
            case 27:
            case 3:
                rH = !0;
                return;
            default:
                r$ = r$.return
        }
    }

    function rX(e) {
        if (e !== r$) return !1;
        if (!rW) return rY(e), rW = !0, !1;
        var t, n = e.tag;
        if ((t = 3 !== n && 27 !== n) && ((t = 5 === n) && (t = "form" === (t = e.type) || "button" === t || cf(e.type, e.memoizedProps)), t = !t), t && rV && rG(e), rY(e), 13 === n) {
            if (!(e = null !== (e = e.memoizedState) ? e.dehydrated : null)) throw Error(s(317));
            rV = cQ(e)
        } else if (31 === n) {
            if (!(e = null !== (e = e.memoizedState) ? e.dehydrated : null)) throw Error(s(317));
            rV = cQ(e)
        } else 27 === n ? (n = rV, cb(e.type) ? (e = cG, cG = null, rV = e) : rV = n) : rV = r$ ? cZ(e.stateNode.nextSibling) : null;
        return !0
    }

    function rJ() {
        rV = r$ = null, rW = !1
    }

    function r0() {
        var e = rK;
        return null !== e && (null === sB ? sB = e : sB.push.apply(sB, e), rK = null), e
    }

    function r1(e) {
        null === rK ? rK = [e] : rK.push(e)
    }
    var r2 = Y(null),
        r4 = null,
        r3 = null;

    function r5(e, t, n) {
        J(r2, t._currentValue), t._currentValue = n
    }

    function r8(e) {
        e._currentValue = r2.current, X(r2)
    }

    function r9(e, t, n) {
        for (; null !== e;) {
            var r = e.alternate;
            if ((e.childLanes & t) !== t ? (e.childLanes |= t, null !== r && (r.childLanes |= t)) : null !== r && (r.childLanes & t) !== t && (r.childLanes |= t), e === n) break;
            e = e.return
        }
    }

    function r6(e, t, n, r) {
        var a = e.child;
        for (null !== a && (a.return = e); null !== a;) {
            var i = a.dependencies;
            if (null !== i) {
                var o = a.child;
                i = i.firstContext;
                e: for (; null !== i;) {
                    var l = i;
                    i = a;
                    for (var u = 0; u < t.length; u++)
                        if (l.context === t[u]) {
                            i.lanes |= n, null !== (l = i.alternate) && (l.lanes |= n), r9(i.return, n, e), r || (o = null);
                            break e
                        } i = l.next
                }
            } else if (18 === a.tag) {
                if (null === (o = a.return)) throw Error(s(341));
                o.lanes |= n, null !== (i = o.alternate) && (i.lanes |= n), r9(o, n, e), o = null
            } else 13 === a.tag && null !== a.memoizedState && null === a.memoizedState.dehydrated ? (a.lanes |= n, null !== (o = a.alternate) && (o.lanes |= n), r9(a.return, n, e), o = r ? a.child : null) : o = a.child;
            if (null !== o) o.return = a;
            else
                for (o = a; null !== o;) {
                    if (o === e) {
                        o = null;
                        break
                    }
                    if (null !== (a = o.sibling)) {
                        a.return = o.return, o = a;
                        break
                    }
                    o = o.return
                }
            a = o
        }
    }

    function r7(e, t, n, r) {
        e = null;
        for (var a = t, i = !1; null !== a;) {
            if (!i) {
                if (0 != (524288 & a.flags)) i = !0;
                else if (0 != (262144 & a.flags)) break
            }
            if (10 === a.tag) {
                var o = a.alternate;
                if (null === o) throw Error(s(387));
                if (null !== (o = o.memoizedProps)) {
                    var l = a.type;
                    nj(a.pendingProps.value, o.value) || (null !== e ? e.push(l) : e = [l])
                }
            } else if (a === er.current) {
                if (null === (o = a.alternate)) throw Error(s(387));
                o.memoizedState.memoizedState !== a.memoizedState.memoizedState && (null !== e ? e.push(d_) : e = [d_])
            }
            a = a.return
        }
        return null !== e && r6(t, e, n, r), t.flags |= 262144, null !== e
    }

    function ae(e) {
        for (e = e.firstContext; null !== e;) {
            if (!nj(e.context._currentValue, e.memoizedValue)) return !0;
            e = e.next
        }
        return !1
    }

    function at(e) {
        r4 = e, r3 = null, null !== (e = e.dependencies) && (e.firstContext = null)
    }

    function an(e) {
        return aa(r4, e)
    }

    function ar(e, t) {
        return null === r4 && at(e), aa(e, t)
    }

    function aa(e, t) {
        var n = t._currentValue;
        if (t = {
                context: t,
                memoizedValue: n,
                next: null
            }, null === r3) {
            if (null === e) throw Error(s(308));
            r3 = t, e.dependencies = {
                lanes: 0,
                firstContext: t
            }, e.flags |= 524288
        } else r3 = r3.next = t;
        return n
    }
    var ai = "u" > typeof AbortController ? AbortController : function() {
            var e = [],
                t = this.signal = {
                    aborted: !1,
                    addEventListener: function(t, n) {
                        e.push(n)
                    }
                };
            this.abort = function() {
                t.aborted = !0, e.forEach(function(e) {
                    return e()
                })
            }
        },
        ao = i.unstable_scheduleCallback,
        al = i.unstable_NormalPriority,
        as = {
            $$typeof: I,
            Consumer: null,
            Provider: null,
            _currentValue: null,
            _currentValue2: null,
            _threadCount: 0
        };

    function au() {
        return {
            controller: new ai,
            data: new Map,
            refCount: 0
        }
    }

    function ac(e) {
        e.refCount--, 0 === e.refCount && ao(al, function() {
            e.controller.abort()
        })
    }

    function ad(e, t) {
        if (0 != (4194048 & e.pendingLanes)) {
            var n = e.transitionTypes;
            for (null === n && (n = e.transitionTypes = []), e = 0; e < t.length; e++) {
                var r = t[e]; - 1 === n.indexOf(r) && n.push(r)
            }
        }
    }
    var af = null,
        ap = null,
        ah = 0,
        am = 0,
        ag = null;

    function av() {
        if (0 == --ah && (af = null, null !== ap)) {
            null !== ag && (ag.status = "fulfilled");
            var e = ap;
            ap = null, am = 0, ag = null;
            for (var t = 0; t < e.length; t++)(0, e[t])()
        }
    }
    var ay = K.S;
    K.S = function(e, t) {
        if (sV = ev(), "object" == typeof t && null !== t && "function" == typeof t.then && function(e) {
                if (null === ap) {
                    var t = ap = [];
                    ah = 0, am = uK(), ag = {
                        status: "pending",
                        value: void 0,
                        then: function(e) {
                            t.push(e)
                        }
                    }
                }
                ah++, e.then(av, av)
            }(t), null !== af)
            for (var n = uA; null !== n;) ad(n, af), n = n.next;
        if (null !== (n = e.types)) {
            for (var r = uA; null !== r;) ad(r, n), r = r.next;
            if (0 !== am) {
                null === (r = af) && (r = af = []);
                for (var a = 0; a < n.length; a++) {
                    var i = n[a]; - 1 === r.indexOf(i) && r.push(i)
                }
            }
        }
        null !== ay && ay(e, t)
    };
    var ab = Y(null);

    function aw() {
        var e = ab.current;
        return null !== e ? e : sE.pooledCache
    }

    function a_(e, t) {
        null === t ? J(ab, ab.current) : J(ab, t.pool)
    }

    function aS() {
        var e = aw();
        return null === e ? null : {
            parent: as._currentValue,
            pool: e
        }
    }
    var ak = Error(s(460)),
        ax = Error(s(474)),
        aE = Error(s(542)),
        aT = {
            then: function() {}
        };

    function aN(e) {
        return "fulfilled" === (e = e.status) || "rejected" === e
    }

    function aC(e, t, n) {
        switch (void 0 === (n = e[n]) ? e.push(t) : n !== t && (t.then(tO, tO), t = n), t.status) {
            case "fulfilled":
                return t.value;
            case "rejected":
                throw aI(e = t.reason), e;
            default:
                if ("string" == typeof t.status) t.then(tO, tO);
                else {
                    if (null !== (e = sE) && 100 < e.shellSuspendCounter) throw Error(s(482));
                    (e = t).status = "pending", e.then(function(e) {
                        if ("pending" === t.status) {
                            var n = t;
                            n.status = "fulfilled", n.value = e
                        }
                    }, function(e) {
                        if ("pending" === t.status) {
                            var n = t;
                            n.status = "rejected", n.reason = e
                        }
                    })
                }
                switch (t.status) {
                    case "fulfilled":
                        return t.value;
                    case "rejected":
                        throw aI(e = t.reason), e
                }
                throw aR = t, ak
        }
    }

    function aO(e) {
        try {
            return (0, e._init)(e._payload)
        } catch (e) {
            if (null !== e && "object" == typeof e && "function" == typeof e.then) throw aR = e, ak;
            throw e
        }
    }
    var aR = null;

    function aP() {
        if (null === aR) throw Error(s(459));
        var e = aR;
        return aR = null, e
    }

    function aI(e) {
        if (e === ak || e === aE) throw Error(s(483))
    }
    var aA = null,
        aL = 0;

    function aD(e) {
        var t = aL;
        return aL += 1, null === aA && (aA = []), aC(aA, e, t)
    }

    function aM(e, t) {
        e.ref = void 0 !== (t = t.props.ref) ? t : null
    }

    function az(e, t) {
        if (t.$$typeof === E) throw Error(s(525));
        throw Error(s(31, "[object Object]" === (e = Object.prototype.toString.call(t)) ? "object with keys {" + Object.keys(t).join(", ") + "}" : e))
    }

    function aF(e) {
        function t(t, n) {
            if (e) {
                var r = t.deletions;
                null === r ? (t.deletions = [n], t.flags |= 16) : r.push(n)
            }
        }

        function n(n, r) {
            if (!e) return null;
            for (; null !== r;) t(n, r), r = r.sibling;
            return null
        }

        function r(e) {
            for (var t = new Map; null !== e;) null === e.key ? t.set(e.index, e) : t.set(e.key, e), e = e.sibling;
            return t
        }

        function a(e, t) {
            return (e = rw(e, t)).index = 0, e.sibling = null, e
        }

        function i(t, n, r) {
            return (t.index = r, e) ? null !== (r = t.alternate) ? (r = r.index) < n ? (t.flags |= 0x8000002, n) : r : (t.flags |= 0x8000002, n) : (t.flags |= 1048576, n)
        }

        function o(t) {
            return e && null === t.alternate && (t.flags |= 0x8000002), t
        }

        function l(e, t, n, r) {
            return null === t || 6 !== t.tag ? (t = rx(n, e.mode, r)).return = e : (t = a(t, n)).return = e, t
        }

        function u(e, t, n, r) {
            var i = n.type;
            return i === C ? (aM(e = d(e, t, n.props.children, r, n.key), n), e) : (null !== t && (t.elementType === i || "object" == typeof i && null !== i && i.$$typeof === z && aO(i) === t.type) ? aM(t = a(t, n.props), n) : aM(t = rS(n.type, n.key, n.props, null, e.mode, r), n), t.return = e, t)
        }

        function c(e, t, n, r) {
            return null === t || 4 !== t.tag || t.stateNode.containerInfo !== n.containerInfo || t.stateNode.implementation !== n.implementation ? (t = rT(n, e.mode, r)).return = e : (t = a(t, n.children || [])).return = e, t
        }

        function d(e, t, n, r, i) {
            return null === t || 7 !== t.tag ? (t = rk(n, e.mode, r, i)).return = e : (t = a(t, n)).return = e, t
        }

        function f(e, t, n) {
            if ("string" == typeof t && "" !== t || "number" == typeof t || "bigint" == typeof t) return (t = rx("" + t, e.mode, n)).return = e, t;
            if ("object" == typeof t && null !== t) {
                switch (t.$$typeof) {
                    case T:
                        return aM(n = rS(t.type, t.key, t.props, null, e.mode, n), t), n.return = e, n;
                    case N:
                        return (t = rT(t, e.mode, n)).return = e, t;
                    case z:
                        return f(e, t = aO(t), n)
                }
                if (W(t) || $(t)) return (t = rk(t, e.mode, n, null)).return = e, t;
                if ("function" == typeof t.then) return f(e, aD(t), n);
                if (t.$$typeof === I) return f(e, ar(e, t), n);
                az(e, t)
            }
            return null
        }

        function p(e, t, n, r) {
            var a = null !== t ? t.key : null;
            if ("string" == typeof n && "" !== n || "number" == typeof n || "bigint" == typeof n) return null !== a ? null : l(e, t, "" + n, r);
            if ("object" == typeof n && null !== n) {
                switch (n.$$typeof) {
                    case T:
                        return n.key === a ? u(e, t, n, r) : null;
                    case N:
                        return n.key === a ? c(e, t, n, r) : null;
                    case z:
                        return p(e, t, n = aO(n), r)
                }
                if (W(n) || $(n)) return null !== a ? null : d(e, t, n, r, null);
                if ("function" == typeof n.then) return p(e, t, aD(n), r);
                if (n.$$typeof === I) return p(e, t, ar(e, n), r);
                az(e, n)
            }
            return null
        }

        function h(e, t, n, r, a) {
            if ("string" == typeof r && "" !== r || "number" == typeof r || "bigint" == typeof r) return l(t, e = e.get(n) || null, "" + r, a);
            if ("object" == typeof r && null !== r) {
                switch (r.$$typeof) {
                    case T:
                        return u(t, e = e.get(null === r.key ? n : r.key) || null, r, a);
                    case N:
                        return c(t, e = e.get(null === r.key ? n : r.key) || null, r, a);
                    case z:
                        return h(e, t, n, r = aO(r), a)
                }
                if (W(r) || $(r)) return d(t, e = e.get(n) || null, r, a, null);
                if ("function" == typeof r.then) return h(e, t, n, aD(r), a);
                if (r.$$typeof === I) return h(e, t, n, ar(t, r), a);
                az(t, r)
            }
            return null
        }
        return function(l, u, c, d) {
            try {
                aL = 0;
                var m = function l(u, c, d, m) {
                    if ("object" == typeof d && null !== d && d.type === C && null === d.key && void 0 === d.props.ref && (d = d.props.children), "object" == typeof d && null !== d) {
                        switch (d.$$typeof) {
                            case T:
                                e: {
                                    for (var g = d.key; null !== c;) {
                                        if (c.key === g) {
                                            if ((g = d.type) === C) {
                                                if (7 === c.tag) {
                                                    n(u, c.sibling), aM(m = a(c, d.props.children), d), m.return = u, u = m;
                                                    break e
                                                }
                                            } else if (c.elementType === g || "object" == typeof g && null !== g && g.$$typeof === z && aO(g) === c.type) {
                                                n(u, c.sibling), aM(m = a(c, d.props), d), m.return = u, u = m;
                                                break e
                                            }
                                            n(u, c);
                                            break
                                        }
                                        t(u, c), c = c.sibling
                                    }
                                    d.type === C ? aM(m = rk(d.props.children, u.mode, m, d.key), d) : aM(m = rS(d.type, d.key, d.props, null, u.mode, m), d),
                                    m.return = u,
                                    u = m
                                }
                                return o(u);
                            case N:
                                e: {
                                    for (g = d.key; null !== c;) {
                                        if (c.key === g)
                                            if (4 === c.tag && c.stateNode.containerInfo === d.containerInfo && c.stateNode.implementation === d.implementation) {
                                                n(u, c.sibling), (m = a(c, d.children || [])).return = u, u = m;
                                                break e
                                            } else {
                                                n(u, c);
                                                break
                                            } t(u, c), c = c.sibling
                                    }(m = rT(d, u.mode, m)).return = u,
                                    u = m
                                }
                                return o(u);
                            case z:
                                return l(u, c, d = aO(d), m)
                        }
                        if (W(d)) return function(a, o, l, s) {
                            for (var u = null, c = null, d = o, m = o = 0, g = null; null !== d && m < l.length; m++) {
                                d.index > m ? (g = d, d = null) : g = d.sibling;
                                var v = p(a, d, l[m], s);
                                if (null === v) {
                                    null === d && (d = g);
                                    break
                                }
                                e && d && null === v.alternate && t(a, d), o = i(v, o, m), null === c ? u = v : c.sibling = v, c = v, d = g
                            }
                            if (m === l.length) return n(a, d), rW && rF(a, m), u;
                            if (null === d) {
                                for (; m < l.length; m++) null !== (d = f(a, l[m], s)) && (o = i(d, o, m), null === c ? u = d : c.sibling = d, c = d);
                                return rW && rF(a, m), u
                            }
                            for (d = r(d); m < l.length; m++) null !== (g = h(d, a, m, l[m], s)) && (e && null !== (v = g.alternate) && d.delete(null === v.key ? m : v.key), o = i(g, o, m), null === c ? u = g : c.sibling = g, c = g);
                            return e && d.forEach(function(e) {
                                return t(a, e)
                            }), rW && rF(a, m), u
                        }(u, c, d, m);
                        if ($(d)) {
                            if ("function" != typeof(g = $(d))) throw Error(s(150));
                            return function(a, o, l, u) {
                                if (null == l) throw Error(s(151));
                                for (var c = null, d = null, m = o, g = o = 0, v = null, y = l.next(); null !== m && !y.done; g++, y = l.next()) {
                                    m.index > g ? (v = m, m = null) : v = m.sibling;
                                    var b = p(a, m, y.value, u);
                                    if (null === b) {
                                        null === m && (m = v);
                                        break
                                    }
                                    e && m && null === b.alternate && t(a, m), o = i(b, o, g), null === d ? c = b : d.sibling = b, d = b, m = v
                                }
                                if (y.done) return n(a, m), rW && rF(a, g), c;
                                if (null === m) {
                                    for (; !y.done; g++, y = l.next()) null !== (y = f(a, y.value, u)) && (o = i(y, o, g), null === d ? c = y : d.sibling = y, d = y);
                                    return rW && rF(a, g), c
                                }
                                for (m = r(m); !y.done; g++, y = l.next()) null !== (y = h(m, a, g, y.value, u)) && (e && null !== (v = y.alternate) && m.delete(null === v.key ? g : v.key), o = i(y, o, g), null === d ? c = y : d.sibling = y, d = y);
                                return e && m.forEach(function(e) {
                                    return t(a, e)
                                }), rW && rF(a, g), c
                            }(u, c, d = g.call(d), m)
                        }
                        if ("function" == typeof d.then) return l(u, c, aD(d), m);
                        if (d.$$typeof === I) return l(u, c, ar(u, d), m);
                        az(u, d)
                    }
                    return "string" == typeof d && "" !== d || "number" == typeof d || "bigint" == typeof d ? (d = "" + d, null !== c && 6 === c.tag ? (n(u, c.sibling), (m = a(c, d)).return = u) : (n(u, c), (m = rx(d, u.mode, m)).return = u), o(u = m)) : n(u, c)
                }(l, u, c, d);
                return aA = null, m
            } catch (e) {
                if (e === ak || e === aE) throw e;
                var g = ry(29, e, null, l.mode);
                return g.lanes = d, g.return = l, g
            } finally {}
        }
    }
    var aj = aF(!0),
        aU = aF(!1),
        aB = !1;

    function aq(e) {
        e.updateQueue = {
            baseState: e.memoizedState,
            firstBaseUpdate: null,
            lastBaseUpdate: null,
            shared: {
                pending: null,
                lanes: 0,
                hiddenCallbacks: null
            },
            callbacks: null
        }
    }

    function a$(e, t) {
        e = e.updateQueue, t.updateQueue === e && (t.updateQueue = {
            baseState: e.baseState,
            firstBaseUpdate: e.firstBaseUpdate,
            lastBaseUpdate: e.lastBaseUpdate,
            shared: e.shared,
            callbacks: null
        })
    }

    function aV(e) {
        return {
            lane: e,
            tag: 0,
            payload: null,
            callback: null,
            next: null
        }
    }

    function aW(e, t, n) {
        var r = e.updateQueue;
        if (null === r) return null;
        if (r = r.shared, 0 != (2 & sx)) {
            var a = r.pending;
            return null === a ? t.next = t : (t.next = a.next, a.next = t), r.pending = t, t = rm(e), rh(e, null, n), t
        }
        return rd(e, r, t, n), rm(e)
    }

    function aK(e, t, n) {
        if (null !== (t = t.updateQueue) && (t = t.shared, 0 != (4194048 & n))) {
            var r = t.lanes;
            r &= e.pendingLanes, n |= r, t.lanes = n, ej(e, n)
        }
    }

    function aH(e, t) {
        var n = e.updateQueue,
            r = e.alternate;
        if (null !== r && n === (r = r.updateQueue)) {
            var a = null,
                i = null;
            if (null !== (n = n.firstBaseUpdate)) {
                do {
                    var o = {
                        lane: n.lane,
                        tag: n.tag,
                        payload: n.payload,
                        callback: null,
                        next: null
                    };
                    null === i ? a = i = o : i = i.next = o, n = n.next
                } while (null !== n) null === i ? a = i = t : i = i.next = t
            } else a = i = t;
            n = {
                baseState: r.baseState,
                firstBaseUpdate: a,
                lastBaseUpdate: i,
                shared: r.shared,
                callbacks: r.callbacks
            }, e.updateQueue = n;
            return
        }
        null === (e = n.lastBaseUpdate) ? n.firstBaseUpdate = t : e.next = t, n.lastBaseUpdate = t
    }
    var aZ = !1;

    function aG() {
        if (aZ) {
            var e = ag;
            if (null !== e) throw e
        }
    }

    function aQ(e, t, n, r) {
        aZ = !1;
        var a = e.updateQueue;
        aB = !1;
        var i = a.firstBaseUpdate,
            o = a.lastBaseUpdate,
            l = a.shared.pending;
        if (null !== l) {
            a.shared.pending = null;
            var s = l,
                u = s.next;
            s.next = null, null === o ? i = u : o.next = u, o = s;
            var c = e.alternate;
            null !== c && (l = (c = c.updateQueue).lastBaseUpdate) !== o && (null === l ? c.firstBaseUpdate = u : l.next = u, c.lastBaseUpdate = s)
        }
        if (null !== i) {
            var d = a.baseState;
            for (o = 0, c = u = s = null, l = i;;) {
                var f = -0x20000001 & l.lane,
                    p = f !== l.lane;
                if (p ? (sN & f) === f : (r & f) === f) {
                    0 !== f && f === am && (aZ = !0), null !== c && (c = c.next = {
                        lane: 0,
                        tag: l.tag,
                        payload: l.payload,
                        callback: null,
                        next: null
                    });
                    e: {
                        var h = e,
                            m = l;
                        switch (f = t, m.tag) {
                            case 1:
                                if ("function" == typeof(h = m.payload)) {
                                    d = h.call(n, d, f);
                                    break e
                                }
                                d = h;
                                break e;
                            case 3:
                                h.flags = -65537 & h.flags | 128;
                            case 0:
                                if (null == (f = "function" == typeof(h = m.payload) ? h.call(n, d, f) : h)) break e;
                                d = x({}, d, f);
                                break e;
                            case 2:
                                aB = !0
                        }
                    }
                    null !== (f = l.callback) && (e.flags |= 64, p && (e.flags |= 8192), null === (p = a.callbacks) ? a.callbacks = [f] : p.push(f))
                } else p = {
                    lane: f,
                    tag: l.tag,
                    payload: l.payload,
                    callback: l.callback,
                    next: null
                }, null === c ? (u = c = p, s = d) : c = c.next = p, o |= f;
                if (null === (l = l.next))
                    if (null === (l = a.shared.pending)) break;
                    else l = (p = l).next, p.next = null, a.lastBaseUpdate = p, a.shared.pending = null
            }
            null === c && (s = d), a.baseState = s, a.firstBaseUpdate = u, a.lastBaseUpdate = c, null === i && (a.shared.lanes = 0), sD |= o, e.lanes = o, e.memoizedState = d
        }
    }

    function aY(e, t) {
        if ("function" != typeof e) throw Error(s(191, e));
        e.call(t)
    }

    function aX(e, t) {
        var n = e.callbacks;
        if (null !== n)
            for (e.callbacks = null, e = 0; e < n.length; e++) aY(n[e], t)
    }
    var aJ = Y(null),
        a0 = Y(0);

    function a1(e, t) {
        J(a0, e = sA), J(aJ, t), sA = e | t.baseLanes
    }

    function a2() {
        J(a0, sA), J(aJ, aJ.current)
    }

    function a4() {
        sA = a0.current, X(aJ), X(a0)
    }
    var a3 = Y(null),
        a5 = null;

    function a8(e) {
        var t = e.alternate;
        J(it, 1 & it.current), J(a3, e), null === a5 && (null === t || null !== aJ.current ? a5 = e : null !== t.memoizedState && (a5 = e))
    }

    function a9(e) {
        J(it, it.current), J(a3, e), null === a5 && (a5 = e)
    }

    function a6(e) {
        22 === e.tag ? (J(it, it.current), J(a3, e), null === a5 && (a5 = e)) : a7()
    }

    function a7() {
        J(it, it.current), J(a3, a3.current)
    }

    function ie(e) {
        X(a3), a5 === e && (a5 = null), X(it)
    }
    var it = Y(0);

    function ir(e, t) {
        J(a3, a3.current), J(it, t)
    }

    function ia(e) {
        X(it), X(a3), a5 === e && (a5 = null)
    }

    function ii(e) {
        for (var t = e; null !== t;) {
            if (13 === t.tag) {
                var n = t.memoizedState;
                if (null !== n && (null === (n = n.dehydrated) || cK(n) || cH(n))) return t
            } else if (19 === t.tag && "independent" !== t.memoizedProps.revealOrder) {
                if (0 != (128 & t.flags)) return t
            } else if (null !== t.child) {
                t.child.return = t, t = t.child;
                continue
            }
            if (t === e) break;
            for (; null === t.sibling;) {
                if (null === t.return || t.return === e) return null;
                t = t.return
            }
            t.sibling.return = t.return, t = t.sibling
        }
        return null
    }
    var io = 0,
        il = null,
        is = null,
        iu = null,
        ic = !1,
        id = !1,
        ip = !1,
        ih = 0,
        im = 0,
        ig = null,
        iv = 0;

    function iy() {
        throw Error(s(321))
    }

    function ib(e, t) {
        if (null === t) return !1;
        for (var n = 0; n < t.length && n < e.length; n++)
            if (!nj(e[n], t[n])) return !1;
        return !0
    }

    function iw(e, t, n, r, a, i) {
        return io = i, il = t, t.memoizedState = null, t.updateQueue = null, t.lanes = 0, K.H = null === e || null === e.memoizedState ? oT : oN, ip = !1, i = n(r, a), ip = !1, id && (i = iS(t, n, r, a)), i_(e), i
    }

    function i_(e) {
        K.H = oE;
        var t = null !== is && null !== is.next;
        if (io = 0, iu = is = il = null, ic = !1, im = 0, ig = null, t) throw Error(s(300));
        null === e || o$ || null !== (e = e.dependencies) && ae(e) && (o$ = !0)
    }

    function iS(e, t, n, r) {
        il = e;
        var a = 0;
        do {
            if (id && (ig = null), im = 0, id = !1, 25 <= a) throw Error(s(301));
            if (a += 1, iu = is = null, null != e.updateQueue) {
                var i = e.updateQueue;
                i.lastEffect = null, i.events = null, i.stores = null, null != i.memoCache && (i.memoCache.index = 0)
            }
            K.H = oC, i = t(n, r)
        } while (id) return i
    }

    function ik() {
        var e = K.H,
            t = e.useState()[0];
        return t = "function" == typeof t.then ? iR(t) : t, e = e.useState()[0], (null !== is ? is.memoizedState : null) !== e && (il.flags |= 1024), t
    }

    function ix() {
        var e = 0 !== ih;
        return ih = 0, e
    }

    function iE(e, t, n) {
        t.updateQueue = e.updateQueue, t.flags &= -2053, e.lanes &= ~n
    }

    function iT(e) {
        if (ic) {
            for (e = e.memoizedState; null !== e;) {
                var t = e.queue;
                null !== t && (t.pending = null), e = e.next
            }
            ic = !1
        }
        io = 0, iu = is = il = null, id = !1, im = ih = 0, ig = null
    }

    function iN() {
        var e = {
            memoizedState: null,
            baseState: null,
            baseQueue: null,
            queue: null,
            next: null
        };
        return null === iu ? il.memoizedState = iu = e : iu = iu.next = e, iu
    }

    function iC() {
        if (null === is) {
            var e = il.alternate;
            e = null !== e ? e.memoizedState : null
        } else e = is.next;
        var t = null === iu ? il.memoizedState : iu.next;
        if (null !== t) iu = t, is = e;
        else {
            if (null === e) {
                if (null === il.alternate) throw Error(s(467));
                throw Error(s(310))
            }
            e = {
                memoizedState: (is = e).memoizedState,
                baseState: is.baseState,
                baseQueue: is.baseQueue,
                queue: is.queue,
                next: null
            }, null === iu ? il.memoizedState = iu = e : iu = iu.next = e
        }
        return iu
    }

    function iO() {
        return {
            lastEffect: null,
            events: null,
            stores: null,
            memoCache: null
        }
    }

    function iR(e) {
        var t = im;
        return im += 1, null === ig && (ig = []), e = aC(ig, e, t), t = il, null === (null === iu ? t.memoizedState : iu.next) && (K.H = null === (t = t.alternate) || null === t.memoizedState ? oT : oN), e
    }

    function iP(e) {
        if (null !== e && "object" == typeof e) {
            if ("function" == typeof e.then) return iR(e);
            if (e.$$typeof === I) return an(e)
        }
        throw Error(s(438, String(e)))
    }

    function iI(e) {
        var t = null,
            n = il.updateQueue;
        if (null !== n && (t = n.memoCache), null == t) {
            var r = il.alternate;
            null !== r && null !== (r = r.updateQueue) && null != (r = r.memoCache) && (t = {
                data: r.data.map(function(e) {
                    return e.slice()
                }),
                index: 0
            })
        }
        if (null == t && (t = {
                data: [],
                index: 0
            }), null === n && (n = iO(), il.updateQueue = n), n.memoCache = t, void 0 === (n = t.data[t.index]))
            for (n = t.data[t.index] = Array(e), r = 0; r < e; r++) n[r] = U;
        return t.index++, n
    }

    function iA(e, t) {
        return "function" == typeof t ? t(e) : t
    }

    function iL(e) {
        return iD(iC(), is, e)
    }

    function iD(e, t, n) {
        var r = e.queue;
        if (null === r) throw Error(s(311));
        r.lastRenderedReducer = n;
        var a = e.baseQueue,
            i = r.pending;
        if (null !== i) {
            if (null !== a) {
                var o = a.next;
                a.next = i.next, i.next = o
            }
            t.baseQueue = a = i, r.pending = null
        }
        if (i = e.baseState, null === a) e.memoizedState = i;
        else {
            t = a.next;
            var l = o = null,
                u = null,
                c = t,
                d = !1;
            do {
                var f = -0x20000001 & c.lane;
                if (f !== c.lane ? (sN & f) === f : (io & f) === f) {
                    var p = c.revertLane;
                    if (0 === p) null !== u && (u = u.next = {
                        lane: 0,
                        revertLane: 0,
                        gesture: null,
                        action: c.action,
                        hasEagerState: c.hasEagerState,
                        eagerState: c.eagerState,
                        next: null
                    }), f === am && (d = !0);
                    else if ((io & p) === p) {
                        c = c.next, p === am && (d = !0);
                        continue
                    } else f = {
                        lane: 0,
                        revertLane: c.revertLane,
                        gesture: null,
                        action: c.action,
                        hasEagerState: c.hasEagerState,
                        eagerState: c.eagerState,
                        next: null
                    }, null === u ? (l = u = f, o = i) : u = u.next = f, il.lanes |= p, sD |= p;
                    f = c.action, ip && n(i, f), i = c.hasEagerState ? c.eagerState : n(i, f)
                } else p = {
                    lane: f,
                    revertLane: c.revertLane,
                    gesture: c.gesture,
                    action: c.action,
                    hasEagerState: c.hasEagerState,
                    eagerState: c.eagerState,
                    next: null
                }, null === u ? (l = u = p, o = i) : u = u.next = p, il.lanes |= f, sD |= f;
                c = c.next
            } while (null !== c && c !== t) if (null === u ? o = i : u.next = l, !nj(i, e.memoizedState) && (o$ = !0, d && null !== (n = ag))) throw n;
            e.memoizedState = i, e.baseState = o, e.baseQueue = u, r.lastRenderedState = i
        }
        return null === a && (r.lanes = 0), [e.memoizedState, r.dispatch]
    }

    function iM(e) {
        var t = iC(),
            n = t.queue;
        if (null === n) throw Error(s(311));
        n.lastRenderedReducer = e;
        var r = n.dispatch,
            a = n.pending,
            i = t.memoizedState;
        if (null !== a) {
            n.pending = null;
            var o = a = a.next;
            do i = e(i, o.action), o = o.next; while (o !== a) nj(i, t.memoizedState) || (o$ = !0), t.memoizedState = i, null === t.baseQueue && (t.baseState = i), n.lastRenderedState = i
        }
        return [i, r]
    }

    function iz(e, t, n) {
        var r = il,
            a = iC(),
            i = rW;
        if (i) {
            if (void 0 === n) throw Error(s(407));
            n = n()
        } else n = t();
        var o = !nj((is || a).memoizedState, n);
        if (o && (a.memoizedState = n, o$ = !0), a = a.queue, i6(iU.bind(null, r, a, e), [e]), a.getSnapshot !== t || o || null !== iu && 1 & iu.memoizedState.tag) {
            if (r.flags |= 2048, i4(9, {
                    destroy: void 0
                }, ij.bind(null, r, a, n, t), null), null === sE) throw Error(s(349));
            i || 0 != (127 & io) || iF(r, t, n)
        }
        return n
    }

    function iF(e, t, n) {
        e.flags |= 16384, e = {
            getSnapshot: t,
            value: n
        }, null === (t = il.updateQueue) ? (t = iO(), il.updateQueue = t, t.stores = [e]) : null === (n = t.stores) ? t.stores = [e] : n.push(e)
    }

    function ij(e, t, n, r) {
        t.value = n, t.getSnapshot = r, iB(t) && iq(e)
    }

    function iU(e, t, n) {
        return n(function() {
            iB(t) && iq(e)
        })
    }

    function iB(e) {
        var t = e.getSnapshot;
        e = e.value;
        try {
            var n = t();
            return !nj(e, n)
        } catch (e) {
            return !0
        }
    }

    function iq(e) {
        var t = rp(e, 2);
        null !== t && s7(t, e, 2)
    }

    function i$(e) {
        var t = iN();
        return "function" == typeof e && (e = e()), t.memoizedState = t.baseState = e, t.queue = {
            pending: null,
            lanes: 0,
            dispatch: null,
            lastRenderedReducer: iA,
            lastRenderedState: e
        }, t
    }

    function iV(e, t, n, r) {
        return e.baseState = n, iD(e, is, "function" == typeof r ? r : iA)
    }

    function iW(e, t, n, r, a) {
        if (oS(e)) throw Error(s(485));
        if (null !== (e = t.action)) {
            var i = {
                payload: a,
                action: e,
                next: null,
                isTransition: !0,
                status: "pending",
                value: null,
                reason: null,
                listeners: [],
                then: function(e) {
                    i.listeners.push(e)
                }
            };
            null !== K.T ? n(!0) : i.isTransition = !1, r(i), null === (n = t.pending) ? (i.next = t.pending = i, iK(t, i)) : (i.next = n.next, t.pending = n.next = i)
        }
    }

    function iK(e, t) {
        var n = t.action,
            r = t.payload,
            a = e.state;
        if (t.isTransition) {
            var i = K.T,
                o = {};
            o.types = null !== i ? i.types : null, K.T = o;
            try {
                var l = n(a, r),
                    s = K.S;
                null !== s && s(o, l), iH(e, t, l)
            } catch (n) {
                iG(e, t, n)
            } finally {
                null !== i && null !== o.types && (i.types = o.types), K.T = i
            }
        } else try {
            i = n(a, r), iH(e, t, i)
        } catch (n) {
            iG(e, t, n)
        }
    }

    function iH(e, t, n) {
        null !== n && "object" == typeof n && "function" == typeof n.then ? n.then(function(n) {
            iZ(e, t, n)
        }, function(n) {
            return iG(e, t, n)
        }) : iZ(e, t, n)
    }

    function iZ(e, t, n) {
        t.status = "fulfilled", t.value = n, iQ(t), e.state = n, null !== (t = e.pending) && ((n = t.next) === t ? e.pending = null : (n = n.next, t.next = n, iK(e, n)))
    }

    function iG(e, t, n) {
        var r = e.pending;
        if (e.pending = null, null !== r) {
            r = r.next;
            do t.status = "rejected", t.reason = n, iQ(t), t = t.next; while (t !== r)
        }
        e.action = null
    }

    function iQ(e) {
        e = e.listeners;
        for (var t = 0; t < e.length; t++)(0, e[t])()
    }

    function iY(e, t) {
        return t
    }

    function iX(e, t) {
        if (rW) {
            var n = sE.formState;
            if (null !== n) {
                e: {
                    var r = il;
                    if (rW) {
                        if (rV) {
                            t: {
                                for (var a = rV, i = rH; 8 !== a.nodeType;)
                                    if (!i || null === (a = cZ(a.nextSibling))) {
                                        a = null;
                                        break t
                                    } a = "F!" === (i = a.data) || "F" === i ? a : null
                            }
                            if (a) {
                                rV = cZ(a.nextSibling), r = "F!" === a.data;
                                break e
                            }
                        }
                        rG(r)
                    }
                    r = !1
                }
                r && (t = n[0])
            }
        }
        return (n = iN()).memoizedState = n.baseState = t, r = {
            pending: null,
            lanes: 0,
            dispatch: null,
            lastRenderedReducer: iY,
            lastRenderedState: t
        }, n.queue = r, n = ob.bind(null, il, r), r.dispatch = n, r = i$(!1), i = o_.bind(null, il, !1, r.queue), r = iN(), a = {
            state: t,
            dispatch: null,
            action: e,
            pending: null
        }, r.queue = a, n = iW.bind(null, il, a, i, n), a.dispatch = n, r.memoizedState = e, [t, n, !1]
    }

    function iJ(e) {
        return i0(iC(), is, e)
    }

    function i0(e, t, n) {
        if (t = iD(e, t, iY)[0], e = iL(iA)[0], "object" == typeof t && null !== t && "function" == typeof t.then) try {
            var r = iR(t)
        } catch (e) {
            if (e === ak) throw aE;
            throw e
        } else r = t;
        var a = (t = iC()).queue,
            i = a.dispatch;
        return n !== t.memoizedState && (il.flags |= 2048, i4(9, {
            destroy: void 0
        }, i1.bind(null, a, n), null)), [r, i, e]
    }

    function i1(e, t) {
        e.action = t
    }

    function i2(e) {
        var t = iC(),
            n = is;
        if (null !== n) return i0(t, n, e);
        iC(), t = t.memoizedState;
        var r = (n = iC()).queue.dispatch;
        return n.memoizedState = e, [t, r, !1]
    }

    function i4(e, t, n, r) {
        return e = {
            tag: e,
            create: n,
            deps: r,
            inst: t,
            next: null
        }, null === (t = il.updateQueue) && (t = iO(), il.updateQueue = t), null === (n = t.lastEffect) ? t.lastEffect = e.next = e : (r = n.next, n.next = e, e.next = r, t.lastEffect = e), e
    }

    function i3() {
        return iC().memoizedState
    }

    function i5(e, t, n, r) {
        var a = iN();
        il.flags |= e, a.memoizedState = i4(1 | t, {
            destroy: void 0
        }, n, void 0 === r ? null : r)
    }

    function i8(e, t, n, r) {
        var a = iC();
        r = void 0 === r ? null : r;
        var i = a.memoizedState.inst;
        null !== is && null !== r && ib(r, is.memoizedState.deps) ? a.memoizedState = i4(t, i, n, r) : (il.flags |= e, a.memoizedState = i4(1 | t, i, n, r))
    }

    function i9(e, t) {
        i5(8390656, 8, e, t)
    }

    function i6(e, t) {
        i8(2048, 8, e, t)
    }

    function i7(e) {
        var t = iC().memoizedState,
            n = {
                ref: t,
                nextImpl: e
            };
        il.flags |= 4;
        var r = il.updateQueue;
        if (null === r) r = iO(), il.updateQueue = r, r.events = [n];
        else {
            var a = r.events;
            null === a ? r.events = [n] : a.push(n)
        }
        return function() {
            if (0 != (2 & sx)) throw Error(s(440));
            return t.impl.apply(void 0, arguments)
        }
    }

    function oe(e, t) {
        return i8(4, 2, e, t)
    }

    function ot(e, t) {
        return i8(4, 4, e, t)
    }

    function on(e, t) {
        if ("function" == typeof t) {
            var n = t(e = e());
            return function() {
                "function" == typeof n ? n() : t(null)
            }
        }
        if (null != t) return t.current = e = e(),
            function() {
                t.current = null
            }
    }

    function or(e, t, n) {
        n = null != n ? n.concat([e]) : null, i8(4, 4, on.bind(null, t, e), n)
    }

    function oa() {}

    function oi(e, t) {
        var n = iC();
        t = void 0 === t ? null : t;
        var r = n.memoizedState;
        return null !== t && ib(t, r[1]) ? r[0] : (n.memoizedState = [e, t], e)
    }

    function oo(e, t) {
        var n = iC();
        t = void 0 === t ? null : t;
        var r = n.memoizedState;
        return null !== t && ib(t, r[1]) ? r[0] : (n.memoizedState = [r = e(), t], r)
    }

    function ol(e, t, n) {
        return void 0 === n || 0 != (0x40000000 & io) && 0 == (261930 & sN) ? e.memoizedState = t : (e.memoizedState = n, e = s9(), il.lanes |= e, sD |= e, n)
    }

    function os(e, t, n, r) {
        return nj(n, t) ? n : null !== aJ.current ? (nj(e = ol(e, n, r), t) || (o$ = !0), e) : 0 == (106 & io) || 0 != (0x40000000 & io) && 0 == (261930 & sN) ? (o$ = !0, e.memoizedState = n) : (e = s9(), il.lanes |= e, sD |= e, t)
    }

    function ou(e, t, n, r, a) {
        var i = H.p;
        H.p = 0 !== i && 8 > i ? i : 8;
        var o = K.T,
            l = {};
        l.types = null !== o ? o.types : null, K.T = l, o_(e, !1, t, n);
        try {
            var s = a(),
                u = K.S;
            if (null !== u && u(l, s), null !== s && "object" == typeof s && "function" == typeof s.then) {
                var c, d, f = (c = [], d = {
                    status: "pending",
                    value: null,
                    reason: null,
                    then: function(e) {
                        c.push(e)
                    }
                }, s.then(function() {
                    d.status = "fulfilled", d.value = r;
                    for (var e = 0; e < c.length; e++)(0, c[e])(r)
                }, function(e) {
                    for (d.status = "rejected", d.reason = e, e = 0; e < c.length; e++)(0, c[e])(void 0)
                }), d);
                ow(e, t, f, s8(e))
            } else ow(e, t, r, s8(e))
        } catch (n) {
            ow(e, t, {
                then: function() {},
                status: "rejected",
                reason: n
            }, s8())
        } finally {
            H.p = i, null !== o && null !== l.types && (o.types = l.types), K.T = o
        }
    }

    function oc() {}

    function od(e, t, n, r) {
        if (5 !== e.tag) throw Error(s(476));
        var a = of(e).queue;
        ou(e, a, t, Z, null === n ? oc : function() {
            return op(e), n(r)
        })
    }

    function of(e) {
        var t = e.memoizedState;
        if (null !== t) return t;
        var n = {};
        return (t = {
            memoizedState: Z,
            baseState: Z,
            baseQueue: null,
            queue: {
                pending: null,
                lanes: 0,
                dispatch: null,
                lastRenderedReducer: iA,
                lastRenderedState: Z
            },
            next: null
        }).next = {
            memoizedState: n,
            baseState: n,
            baseQueue: null,
            queue: {
                pending: null,
                lanes: 0,
                dispatch: null,
                lastRenderedReducer: iA,
                lastRenderedState: n
            },
            next: null
        }, e.memoizedState = t, null !== (e = e.alternate) && (e.memoizedState = t), t
    }

    function op(e) {
        var t = of(e);
        null === t.next && (t = e.alternate.memoizedState), ow(e, t.next.queue, {}, s8())
    }

    function oh() {
        return an(d_)
    }

    function om() {
        return iC().memoizedState
    }

    function og() {
        return iC().memoizedState
    }

    function ov(e) {
        for (var t = e.return; null !== t;) {
            switch (t.tag) {
                case 24:
                case 3:
                    var n = s8(),
                        r = aW(t, e = aV(n), n);
                    null !== r && (s7(r, t, n), aK(r, t, n)), t = {
                        cache: au()
                    }, e.payload = t;
                    return
            }
            t = t.return
        }
    }

    function oy(e, t, n) {
        var r = s8();
        n = {
            lane: r,
            revertLane: 0,
            gesture: null,
            action: n,
            hasEagerState: !1,
            eagerState: null,
            next: null
        }, oS(e) ? ok(t, n) : null !== (n = rf(e, t, n, r)) && (s7(n, e, r), ox(n, t, r))
    }

    function ob(e, t, n) {
        ow(e, t, n, s8())
    }

    function ow(e, t, n, r) {
        var a = {
            lane: r,
            revertLane: 0,
            gesture: null,
            action: n,
            hasEagerState: !1,
            eagerState: null,
            next: null
        };
        if (oS(e)) ok(t, a);
        else {
            var i = e.alternate;
            if (0 === e.lanes && (null === i || 0 === i.lanes) && null !== (i = t.lastRenderedReducer)) try {
                var o = t.lastRenderedState,
                    l = i(o, n);
                if (a.hasEagerState = !0, a.eagerState = l, nj(l, o)) return rd(e, t, a, 0), null === sE && rc(), !1
            } catch (e) {} finally {}
            if (null !== (n = rf(e, t, a, r))) return s7(n, e, r), ox(n, t, r), !0
        }
        return !1
    }

    function o_(e, t, n, r) {
        if (r = {
                lane: 2,
                revertLane: uK(),
                gesture: null,
                action: r,
                hasEagerState: !1,
                eagerState: null,
                next: null
            }, oS(e)) {
            if (t) throw Error(s(479))
        } else null !== (t = rf(e, n, r, 2)) && s7(t, e, 2)
    }

    function oS(e) {
        var t = e.alternate;
        return e === il || null !== t && t === il
    }

    function ok(e, t) {
        id = ic = !0;
        var n = e.pending;
        null === n ? t.next = t : (t.next = n.next, n.next = t), e.pending = t
    }

    function ox(e, t, n) {
        if (0 != (4194048 & n)) {
            var r = t.lanes;
            r &= e.pendingLanes, t.lanes = n |= r, ej(e, n)
        }
    }
    var oE = {
            readContext: an,
            use: iP,
            useCallback: iy,
            useContext: iy,
            useEffect: iy,
            useImperativeHandle: iy,
            useLayoutEffect: iy,
            useInsertionEffect: iy,
            useMemo: iy,
            useReducer: iy,
            useRef: iy,
            useState: iy,
            useDebugValue: iy,
            useDeferredValue: iy,
            useTransition: iy,
            useSyncExternalStore: iy,
            useId: iy,
            useHostTransitionStatus: iy,
            useFormState: iy,
            useActionState: iy,
            useOptimistic: iy,
            useMemoCache: iy,
            useCacheRefresh: iy,
            useEffectEvent: iy
        },
        oT = {
            readContext: an,
            use: iP,
            useCallback: function(e, t) {
                return iN().memoizedState = [e, void 0 === t ? null : t], e
            },
            useContext: an,
            useEffect: i9,
            useImperativeHandle: function(e, t, n) {
                n = null != n ? n.concat([e]) : null, i5(4194308, 4, on.bind(null, t, e), n)
            },
            useLayoutEffect: function(e, t) {
                return i5(4194308, 4, e, t)
            },
            useInsertionEffect: function(e, t) {
                i5(4, 2, e, t)
            },
            useMemo: function(e, t) {
                var n = iN();
                t = void 0 === t ? null : t;
                var r = e();
                return n.memoizedState = [r, t], r
            },
            useReducer: function(e, t, n) {
                var r = iN();
                if (void 0 !== n) var a = n(t);
                else a = t;
                return r.memoizedState = r.baseState = a, r.queue = e = {
                    pending: null,
                    lanes: 0,
                    dispatch: null,
                    lastRenderedReducer: e,
                    lastRenderedState: a
                }, e = e.dispatch = oy.bind(null, il, e), [r.memoizedState, e]
            },
            useRef: function(e) {
                return iN().memoizedState = {
                    current: e
                }
            },
            useState: function(e) {
                var t = (e = i$(e)).queue,
                    n = ob.bind(null, il, t);
                return t.dispatch = n, [e.memoizedState, n]
            },
            useDebugValue: oa,
            useDeferredValue: function(e, t) {
                return ol(iN(), e, t)
            },
            useTransition: function() {
                var e = i$(!1);
                return e = ou.bind(null, il, e.queue, !0, !1), iN().memoizedState = e, [!1, e]
            },
            useSyncExternalStore: function(e, t, n) {
                var r = il,
                    a = iN();
                if (rW) {
                    if (void 0 === n) throw Error(s(407));
                    n = n()
                } else {
                    if (n = t(), null === sE) throw Error(s(349));
                    0 != (127 & sN) || iF(r, t, n)
                }
                a.memoizedState = n;
                var i = {
                    value: n,
                    getSnapshot: t
                };
                return a.queue = i, i9(iU.bind(null, r, i, e), [e]), r.flags |= 2048, i4(9, {
                    destroy: void 0
                }, ij.bind(null, r, i, n, t), null), n
            },
            useId: function() {
                var e = iN(),
                    t = sE.identifierPrefix;
                if (rW) {
                    var n = rz,
                        r = rM;
                    t = "_" + t + "R_" + (n = (r & ~(1 << 32 - eT(r) - 1)).toString(32) + n), 0 < (n = ih++) && (t += "H" + n.toString(32)), t += "_"
                } else t = "_" + t + "r_" + (n = iv++).toString(32) + "_";
                return e.memoizedState = t
            },
            useHostTransitionStatus: oh,
            useFormState: iX,
            useActionState: iX,
            useOptimistic: function(e) {
                var t = iN();
                t.memoizedState = t.baseState = e;
                var n = {
                    pending: null,
                    lanes: 0,
                    dispatch: null,
                    lastRenderedReducer: null,
                    lastRenderedState: null
                };
                return t.queue = n, t = o_.bind(null, il, !0, n), n.dispatch = t, [e, t]
            },
            useMemoCache: iI,
            useCacheRefresh: function() {
                return iN().memoizedState = ov.bind(null, il)
            },
            useEffectEvent: function(e) {
                var t = iN(),
                    n = {
                        impl: e
                    };
                return t.memoizedState = n,
                    function() {
                        if (0 != (2 & sx)) throw Error(s(440));
                        return n.impl.apply(void 0, arguments)
                    }
            }
        },
        oN = {
            readContext: an,
            use: iP,
            useCallback: oi,
            useContext: an,
            useEffect: i6,
            useImperativeHandle: or,
            useInsertionEffect: oe,
            useLayoutEffect: ot,
            useMemo: oo,
            useReducer: iL,
            useRef: i3,
            useState: function() {
                return iL(iA)
            },
            useDebugValue: oa,
            useDeferredValue: function(e, t) {
                return os(iC(), is.memoizedState, e, t)
            },
            useTransition: function() {
                var e = iL(iA)[0],
                    t = iC().memoizedState;
                return ["boolean" == typeof e ? e : iR(e), t]
            },
            useSyncExternalStore: iz,
            useId: om,
            useHostTransitionStatus: oh,
            useFormState: iJ,
            useActionState: iJ,
            useOptimistic: function(e, t) {
                return iV(iC(), is, e, t)
            },
            useMemoCache: iI,
            useCacheRefresh: og,
            useEffectEvent: i7
        },
        oC = {
            readContext: an,
            use: iP,
            useCallback: oi,
            useContext: an,
            useEffect: i6,
            useImperativeHandle: or,
            useInsertionEffect: oe,
            useLayoutEffect: ot,
            useMemo: oo,
            useReducer: iM,
            useRef: i3,
            useState: function() {
                return iM(iA)
            },
            useDebugValue: oa,
            useDeferredValue: function(e, t) {
                var n = iC();
                return null === is ? ol(n, e, t) : os(n, is.memoizedState, e, t)
            },
            useTransition: function() {
                var e = iM(iA)[0],
                    t = iC().memoizedState;
                return ["boolean" == typeof e ? e : iR(e), t]
            },
            useSyncExternalStore: iz,
            useId: om,
            useHostTransitionStatus: oh,
            useFormState: i2,
            useActionState: i2,
            useOptimistic: function(e, t) {
                var n = iC();
                return null !== is ? iV(n, is, e, t) : (n.baseState = e, [e, n.queue.dispatch])
            },
            useMemoCache: iI,
            useCacheRefresh: og,
            useEffectEvent: i7
        };

    function oO(e, t, n, r) {
        n = null == (n = n(r, t = e.memoizedState)) ? t : x({}, t, n), e.memoizedState = n, 0 === e.lanes && (e.updateQueue.baseState = n)
    }
    var oR = {
        enqueueSetState: function(e, t, n) {
            e = e._reactInternals;
            var r = s8(),
                a = aV(r);
            a.payload = t, null != n && (a.callback = n), null !== (t = aW(e, a, r)) && (s7(t, e, r), aK(t, e, r))
        },
        enqueueReplaceState: function(e, t, n) {
            e = e._reactInternals;
            var r = s8(),
                a = aV(r);
            a.tag = 1, a.payload = t, null != n && (a.callback = n), null !== (t = aW(e, a, r)) && (s7(t, e, r), aK(t, e, r))
        },
        enqueueForceUpdate: function(e, t) {
            e = e._reactInternals;
            var n = s8(),
                r = aV(n);
            r.tag = 2, null != t && (r.callback = t), null !== (t = aW(e, r, n)) && (s7(t, e, n), aK(t, e, n))
        }
    };

    function oP(e, t, n, r, a, i, o) {
        return "function" == typeof(e = e.stateNode).shouldComponentUpdate ? e.shouldComponentUpdate(r, i, o) : !t.prototype || !t.prototype.isPureReactComponent || !nU(n, r) || !nU(a, i)
    }

    function oI(e, t, n, r) {
        e = t.state, "function" == typeof t.componentWillReceiveProps && t.componentWillReceiveProps(n, r), "function" == typeof t.UNSAFE_componentWillReceiveProps && t.UNSAFE_componentWillReceiveProps(n, r), t.state !== e && oR.enqueueReplaceState(t, t.state, null)
    }

    function oA(e, t) {
        var n = t;
        if ("ref" in t)
            for (var r in n = {}, t) "ref" !== r && (n[r] = t[r]);
        if (e = e.defaultProps)
            for (var a in n === t && (n = x({}, n)), e) void 0 === n[a] && (n[a] = e[a]);
        return n
    }

    function oL(e) {
        ro(e)
    }

    function oD(e) {
        console.error(e)
    }

    function oM(e) {
        ro(e)
    }

    function oz(e, t) {
        try {
            (0, e.onUncaughtError)(t.value, {
                componentStack: t.stack
            })
        } catch (e) {
            setTimeout(function() {
                throw e
            })
        }
    }

    function oF(e, t, n) {
        try {
            (0, e.onCaughtError)(n.value, {
                componentStack: n.stack,
                errorBoundary: 1 === t.tag ? t.stateNode : null
            })
        } catch (e) {
            setTimeout(function() {
                throw e
            })
        }
    }

    function oj(e, t, n) {
        return (n = aV(n)).tag = 3, n.payload = {
            element: null
        }, n.callback = function() {
            oz(e, t)
        }, n
    }

    function oU(e) {
        return (e = aV(e)).tag = 3, e
    }

    function oB(e, t, n, r) {
        var a = n.type.getDerivedStateFromError;
        if ("function" == typeof a) {
            var i = r.value;
            e.payload = function() {
                return a(i)
            }, e.callback = function() {
                oF(t, n, r)
            }
        }
        var o = n.stateNode;
        null !== o && "function" == typeof o.componentDidCatch && (e.callback = function() {
            oF(t, n, r), "function" != typeof a && (null === sH ? sH = new Set([this]) : sH.add(this));
            var e = r.stack;
            this.componentDidCatch(r.value, {
                componentStack: null !== e ? e : ""
            })
        })
    }
    var oq = Error(s(461)),
        o$ = !1;

    function oV(e, t, n, r) {
        t.child = null === e ? aU(t, null, n, r) : aj(t, e.child, n, r)
    }

    function oW(e, t, n, r, a) {
        n = n.render;
        var i = t.ref;
        if ("ref" in r) {
            var o = {};
            for (var l in r) "ref" !== l && (o[l] = r[l])
        } else o = r;
        return (at(t), r = iw(e, t, n, o, i, a), l = ix(), null === e || o$) ? (rW && l && rU(t), t.flags |= 1, oV(e, t, r, a), t.child) : (iE(e, t, a), ll(e, t, a))
    }

    function oK(e, t, n, r, a) {
        if (null === e) {
            var i = n.type;
            return "function" != typeof i || rb(i) || void 0 !== i.defaultProps || null !== n.compare ? ((e = rS(n.type, null, r, t, t.mode, a)).ref = t.ref, e.return = t, t.child = e) : (t.tag = 15, t.type = i, oH(e, t, i, r, a))
        }
        if (i = e.child, !ls(e, a)) {
            var o = i.memoizedProps;
            if ((n = null !== (n = n.compare) ? n : nU)(o, r) && e.ref === t.ref) return ll(e, t, a)
        }
        return t.flags |= 1, (e = rw(i, r)).ref = t.ref, e.return = t, t.child = e
    }

    function oH(e, t, n, r, a) {
        if (null !== e) {
            var i = e.memoizedProps;
            if (nU(i, r) && e.ref === t.ref)
                if (o$ = !1, t.pendingProps = r = i, !ls(e, a)) return t.lanes = e.lanes, ll(e, t, a);
                else 0 != (131072 & e.flags) && (o$ = !0)
        }
        return o0(e, t, n, r, a)
    }

    function oZ(e, t, n, r) {
        var a = r.children,
            i = null !== e ? e.memoizedState : null;
        if (null === e && null === t.stateNode && (t.stateNode = {
                _visibility: 1,
                _pendingMarkers: null,
                _retryCache: null,
                _transitions: null
            }), "hidden" === r.mode) {
            if (0 != (128 & t.flags)) {
                if (i = null !== i ? i.baseLanes | n : n, null !== e) {
                    for (a = 0, r = t.child = e.child; null !== r;) a = a | r.lanes | r.childLanes, r = r.sibling;
                    r = a & ~i
                } else r = 0, t.child = null;
                return oQ(e, t, i, n, r)
            }
            if (0 == (0x20000000 & n)) return r = t.lanes = 0x20000000, oQ(e, t, null !== i ? i.baseLanes | n : n, n, r);
            t.memoizedState = {
                baseLanes: 0,
                cachePool: null
            }, null !== e && a_(t, null !== i ? i.cachePool : null), null !== i ? a1(t, i) : a2(), a6(t)
        } else null !== i ? (a_(t, i.cachePool), a1(t, i), a7(), t.memoizedState = null) : (null !== e && a_(t, null), a2(), a7());
        return oV(e, t, a, n), t.child
    }

    function oG(e, t) {
        return null !== e && 22 === e.tag || null !== t.stateNode || (t.stateNode = {
            _visibility: 1,
            _pendingMarkers: null,
            _retryCache: null,
            _transitions: null
        }), t.sibling
    }

    function oQ(e, t, n, r, a) {
        var i = aw();
        return t.memoizedState = {
            baseLanes: n,
            cachePool: i = null === i ? null : {
                parent: as._currentValue,
                pool: i
            }
        }, null !== e && a_(t, null), a2(), a6(t), null !== e && r7(e, t, r, !0), t.childLanes = a, null
    }

    function oY(e, t) {
        return (t = o7({
            mode: t.mode,
            children: t.children
        }, e.mode)).ref = e.ref, e.child = t, t.return = e, t
    }

    function oX(e, t, n) {
        return aj(t, e.child, null, n), e = oY(t, t.pendingProps), e.flags |= 2, ie(t), t.memoizedState = null, e
    }

    function oJ(e, t) {
        var n = t.ref;
        if (null === n) null !== e && null !== e.ref && (t.flags |= 4194816);
        else {
            if ("function" != typeof n && "object" != typeof n) throw Error(s(284));
            (null === e || e.ref !== n) && (t.flags |= 4194816)
        }
    }

    function o0(e, t, n, r, a) {
        return (at(t), n = iw(e, t, n, r, void 0, a), r = ix(), null === e || o$) ? (rW && r && rU(t), t.flags |= 1, oV(e, t, n, a), t.child) : (iE(e, t, a), ll(e, t, a))
    }

    function o1(e, t, n, r, a, i) {
        return (at(t), t.updateQueue = null, n = iS(t, r, n, a), i_(e), r = ix(), null === e || o$) ? (rW && r && rU(t), t.flags |= 1, oV(e, t, n, i), t.child) : (iE(e, t, i), ll(e, t, i))
    }

    function o2(e, t, n, r, a) {
        if (at(t), null === t.stateNode) {
            var i = rg,
                o = n.contextType;
            "object" == typeof o && null !== o && (i = an(o)), t.memoizedState = null !== (i = new n(r, i)).state && void 0 !== i.state ? i.state : null, i.updater = oR, t.stateNode = i, i._reactInternals = t, (i = t.stateNode).props = r, i.state = t.memoizedState, i.refs = {}, aq(t), o = n.contextType, i.context = "object" == typeof o && null !== o ? an(o) : rg, i.state = t.memoizedState, "function" == typeof(o = n.getDerivedStateFromProps) && (oO(t, n, o, r), i.state = t.memoizedState), "function" == typeof n.getDerivedStateFromProps || "function" == typeof i.getSnapshotBeforeUpdate || "function" != typeof i.UNSAFE_componentWillMount && "function" != typeof i.componentWillMount || (o = i.state, "function" == typeof i.componentWillMount && i.componentWillMount(), "function" == typeof i.UNSAFE_componentWillMount && i.UNSAFE_componentWillMount(), o !== i.state && oR.enqueueReplaceState(i, i.state, null), aQ(t, r, i, a), aG(), i.state = t.memoizedState), "function" == typeof i.componentDidMount && (t.flags |= 4194308), r = !0
        } else if (null === e) {
            i = t.stateNode;
            var l = t.memoizedProps,
                s = oA(n, l);
            i.props = s;
            var u = i.context,
                c = n.contextType;
            o = rg, "object" == typeof c && null !== c && (o = an(c));
            var d = n.getDerivedStateFromProps;
            c = "function" == typeof d || "function" == typeof i.getSnapshotBeforeUpdate, l = t.pendingProps !== l, c || "function" != typeof i.UNSAFE_componentWillReceiveProps && "function" != typeof i.componentWillReceiveProps || (l || u !== o) && oI(t, i, r, o), aB = !1;
            var f = t.memoizedState;
            i.state = f, aQ(t, r, i, a), aG(), u = t.memoizedState, l || f !== u || aB ? ("function" == typeof d && (oO(t, n, d, r), u = t.memoizedState), (s = aB || oP(t, n, s, r, f, u, o)) ? (c || "function" != typeof i.UNSAFE_componentWillMount && "function" != typeof i.componentWillMount || ("function" == typeof i.componentWillMount && i.componentWillMount(), "function" == typeof i.UNSAFE_componentWillMount && i.UNSAFE_componentWillMount()), "function" == typeof i.componentDidMount && (t.flags |= 4194308)) : ("function" == typeof i.componentDidMount && (t.flags |= 4194308), t.memoizedProps = r, t.memoizedState = u), i.props = r, i.state = u, i.context = o, r = s) : ("function" == typeof i.componentDidMount && (t.flags |= 4194308), r = !1)
        } else {
            i = t.stateNode, a$(e, t), c = oA(n, o = t.memoizedProps), i.props = c, d = t.pendingProps, f = i.context, u = n.contextType, s = rg, "object" == typeof u && null !== u && (s = an(u)), (u = "function" == typeof(l = n.getDerivedStateFromProps) || "function" == typeof i.getSnapshotBeforeUpdate) || "function" != typeof i.UNSAFE_componentWillReceiveProps && "function" != typeof i.componentWillReceiveProps || (o !== d || f !== s) && oI(t, i, r, s), aB = !1, f = t.memoizedState, i.state = f, aQ(t, r, i, a), aG();
            var p = t.memoizedState;
            o !== d || f !== p || aB || null !== e && null !== e.dependencies && ae(e.dependencies) ? ("function" == typeof l && (oO(t, n, l, r), p = t.memoizedState), (c = aB || oP(t, n, c, r, f, p, s) || null !== e && null !== e.dependencies && ae(e.dependencies)) ? (u || "function" != typeof i.UNSAFE_componentWillUpdate && "function" != typeof i.componentWillUpdate || ("function" == typeof i.componentWillUpdate && i.componentWillUpdate(r, p, s), "function" == typeof i.UNSAFE_componentWillUpdate && i.UNSAFE_componentWillUpdate(r, p, s)), "function" == typeof i.componentDidUpdate && (t.flags |= 4), "function" == typeof i.getSnapshotBeforeUpdate && (t.flags |= 1024)) : ("function" != typeof i.componentDidUpdate || o === e.memoizedProps && f === e.memoizedState || (t.flags |= 4), "function" != typeof i.getSnapshotBeforeUpdate || o === e.memoizedProps && f === e.memoizedState || (t.flags |= 1024), t.memoizedProps = r, t.memoizedState = p), i.props = r, i.state = p, i.context = s, r = c) : ("function" != typeof i.componentDidUpdate || o === e.memoizedProps && f === e.memoizedState || (t.flags |= 4), "function" != typeof i.getSnapshotBeforeUpdate || o === e.memoizedProps && f === e.memoizedState || (t.flags |= 1024), r = !1)
        }
        return i = r, oJ(e, t), r = 0 != (128 & t.flags), i || r ? (i = t.stateNode, n = r && "function" != typeof n.getDerivedStateFromError ? null : i.render(), t.flags |= 1, null !== e && r ? (t.child = aj(t, e.child, null, a), t.child = aj(t, null, n, a)) : oV(e, t, n, a), t.memoizedState = i.state, e = t.child) : e = ll(e, t, a), e
    }

    function o4(e, t, n, r) {
        return rJ(), t.flags |= 256, oV(e, t, n, r), t.child
    }
    var o3 = {
        dehydrated: null,
        treeContext: null,
        retryLane: 0,
        hydrationErrors: null
    };

    function o5(e) {
        return {
            baseLanes: e,
            cachePool: aS()
        }
    }

    function o8(e, t, n) {
        return e = null !== e ? e.childLanes & ~n : 0, t && (e |= sF), e
    }

    function o9(e, t, n) {
        var r, a = t.pendingProps,
            i = !1,
            o = 0 != (128 & t.flags);
        if ((r = o) || (r = (null === e || null !== e.memoizedState) && 0 != (2 & it.current)), r && (i = !0, t.flags &= -129), r = 0 != (32 & t.flags), t.flags &= -33, null === e) {
            if (rW) {
                if (i ? a8(t) : a7(), (e = rV) ? null !== (e = null !== (e = cW(e, rH)) && "&" !== e.data ? e : null) && (t.memoizedState = {
                        dehydrated: e,
                        treeContext: null !== rD ? {
                            id: rM,
                            overflow: rz
                        } : null,
                        retryLane: 0x20000000,
                        hydrationErrors: null
                    }, (n = rE(e)).return = t, t.child = n, r$ = t, rV = null) : e = null, null === e) throw rG(t);
                return cH(e) ? t.lanes = 32 : t.lanes = 0x20000000, null
            }
            var l = a.children;
            return (a = a.fallback, i) ? (a7(), l = o7({
                mode: "hidden",
                children: l
            }, i = t.mode), a = rk(a, i, n, null), l.return = t, a.return = t, l.sibling = a, t.child = l, (a = t.child).memoizedState = o5(n), a.childLanes = o8(e, r, n), t.memoizedState = o3, oG(null, a)) : (a8(t), o6(t, l))
        }
        var u = e.memoizedState;
        if (null !== u && null !== (l = u.dehydrated)) {
            if (o) 256 & t.flags ? (a8(t), t.flags &= -257, t = le(e, t, n)) : null !== t.memoizedState ? (a7(), t.child = e.child, t.flags |= 128, t = null) : (a7(), l = a.fallback, i = t.mode, a = o7({
                mode: "visible",
                children: a.children
            }, i), l = rk(l, i, n, null), l.flags |= 2, a.return = t, l.return = t, a.sibling = l, t.child = a, aj(t, e.child, null, n), (a = t.child).memoizedState = o5(n), a.childLanes = o8(e, r, n), t.memoizedState = o3, t = oG(null, a));
            else if (a8(t), cH(l)) {
                if (r = l.nextSibling && l.nextSibling.dataset) var c = r.dgst;
                r = c, (a = Error(s(419))).stack = "", a.digest = r, r1({
                    value: a,
                    source: null,
                    stack: null
                }), t = le(e, t, n)
            } else if (o$ || r7(e, t, n, !1), r = 0 != (n & e.childLanes), o$ || r) {
                if (null !== (r = sE) && 0 !== (a = eU(r, n)) && a !== u.retryLane) throw u.retryLane = a, rp(e, a), s7(r, e, a), oq;
                cK(l) || uc(), t = le(e, t, n)
            } else cK(l) ? (t.flags |= 192, t.child = e.child, t = null) : (e = u.treeContext, rV = cZ(l.nextSibling), r$ = t, rW = !0, rK = null, rH = !1, null !== e && rq(t, e), t = o6(t, a.children), t.flags |= 4096);
            return t
        }
        return i ? (a7(), l = a.fallback, i = t.mode, c = (u = e.child).sibling, (a = rw(u, {
            mode: "hidden",
            children: a.children
        })).subtreeFlags = 0x7f00000 & u.subtreeFlags, null !== c ? l = rw(c, l) : (l = rk(l, i, n, null), l.flags |= 2), l.return = t, a.return = t, a.sibling = l, t.child = a, oG(null, a), a = t.child, null === (l = e.child.memoizedState) ? l = o5(n) : (null !== (i = l.cachePool) ? (u = as._currentValue, i = i.parent !== u ? {
            parent: u,
            pool: u
        } : i) : i = aS(), l = {
            baseLanes: l.baseLanes | n,
            cachePool: i
        }), a.memoizedState = l, a.childLanes = o8(e, r, n), t.memoizedState = o3, oG(e.child, a)) : (a8(t), e = (n = e.child).sibling, (n = rw(n, {
            mode: "visible",
            children: a.children
        })).return = t, n.sibling = null, null !== e && (null === (r = t.deletions) ? (t.deletions = [e], t.flags |= 16) : r.push(e)), t.child = n, t.memoizedState = null, n)
    }

    function o6(e, t) {
        return (t = o7({
            mode: "visible",
            children: t
        }, e.mode)).return = e, e.child = t
    }

    function o7(e, t) {
        return (e = ry(22, e, null, t)).lanes = 0, e
    }

    function le(e, t, n) {
        return aj(t, e.child, null, n), e = o6(t, t.pendingProps.children), e.flags |= 2, t.memoizedState = null, e
    }

    function lt(e, t, n) {
        e.lanes |= t;
        var r = e.alternate;
        null !== r && (r.lanes |= t), r9(e.return, t, n)
    }

    function ln(e) {
        for (var t = null; null !== e;) {
            var n = e.alternate;
            null !== n && null === ii(n) && (t = e), e = e.sibling
        }
        return t
    }

    function lr(e, t, n, r, a, i) {
        var o = e.memoizedState;
        null === o ? e.memoizedState = {
            isBackwards: t,
            rendering: null,
            renderingStartTime: 0,
            last: r,
            tail: n,
            tailMode: a,
            treeForkCount: i
        } : (o.isBackwards = t, o.rendering = null, o.renderingStartTime = 0, o.last = r, o.tail = n, o.tailMode = a, o.treeForkCount = i)
    }

    function la(e) {
        var t = e.child;
        for (e.child = null; null !== t;) {
            var n = t.sibling;
            t.sibling = e.child, e.child = t, t = n
        }
    }

    function li(e, t, n) {
        var r = t.pendingProps,
            a = r.revealOrder,
            i = r.tail;
        r = r.children;
        var o = it.current;
        if (128 & t.flags) return ir(t, o), null;
        var l = 0 != (2 & o);
        if (l ? (o = 1 & o | 2, t.flags |= 128) : o &= 1, ir(t, o), "backwards" === a && null !== e ? (la(e), oV(e, t, r, n), la(e)) : oV(e, t, r, n), r = rW ? rI : 0, !l && null !== e && 0 != (128 & e.flags)) e: for (e = t.child; null !== e;) {
            if (13 === e.tag) null !== e.memoizedState && lt(e, n, t);
            else if (19 === e.tag) lt(e, n, t);
            else if (null !== e.child) {
                e.child.return = e, e = e.child;
                continue
            }
            if (e === t) break;
            for (; null === e.sibling;) {
                if (null === e.return || e.return === t) break e;
                e = e.return
            }
            e.sibling.return = e.return, e = e.sibling
        }
        switch (a) {
            case "backwards":
                null === (n = ln(t.child)) ? (a = t.child, t.child = null) : (a = n.sibling, n.sibling = null, la(t)), lr(t, !0, a, null, i, r);
                break;
            case "unstable_legacy-backwards":
                for (n = null, a = t.child, t.child = null; null !== a;) {
                    if (null !== (e = a.alternate) && null === ii(e)) {
                        t.child = a;
                        break
                    }
                    e = a.sibling, a.sibling = n, n = a, a = e
                }
                lr(t, !0, n, null, i, r);
                break;
            case "together":
                lr(t, !1, null, null, void 0, r);
                break;
            case "independent":
                t.memoizedState = null;
                break;
            default:
                null === (n = ln(t.child)) ? (a = t.child, t.child = null) : (a = n.sibling, n.sibling = null), lr(t, !1, a, n, i, r)
        }
        return t.child
    }

    function lo(e, t, n) {
        var r = t.pendingProps;
        return r5(t, t.type, r.value), oV(e, t, r.children, n), t.child
    }

    function ll(e, t, n) {
        if (null !== e && (t.dependencies = e.dependencies), sD |= t.lanes, 0 == (n & t.childLanes)) {
            if (null === e) return null;
            else if (r7(e, t, n, !1), 0 == (n & t.childLanes)) return null
        }
        if (null !== e && t.child !== e.child) throw Error(s(153));
        if (null !== t.child) {
            for (n = rw(e = t.child, e.pendingProps), t.child = n, n.return = t; null !== e.sibling;) e = e.sibling, (n = n.sibling = rw(e, e.pendingProps)).return = t;
            n.sibling = null
        }
        return t.child
    }

    function ls(e, t) {
        return 0 != (e.lanes & t) || !!(null !== (e = e.dependencies) && ae(e))
    }

    function lu(e, t, n) {
        if (null !== e)
            if (e.memoizedProps !== t.pendingProps) o$ = !0;
            else {
                if (!ls(e, n) && 0 == (128 & t.flags)) return o$ = !1,
                    function(e, t, n) {
                        switch (t.tag) {
                            case 3:
                                ea(t, t.stateNode.containerInfo), r5(t, as, e.memoizedState.cache), rJ();
                                break;
                            case 27:
                            case 5:
                                eo(t);
                                break;
                            case 4:
                                ea(t, t.stateNode.containerInfo);
                                break;
                            case 10:
                                r5(t, t.type, t.memoizedProps.value);
                                break;
                            case 31:
                                if (null !== t.memoizedState) return t.flags |= 128, a9(t), null;
                                break;
                            case 13:
                                var r = t.memoizedState;
                                if (null !== r) {
                                    if (null !== r.dehydrated) return a8(t), t.flags |= 128, null;
                                    r = r7(e, t, n, !1);
                                    var a = t.child.childLanes;
                                    if (r || 0 != (n & a)) return o9(e, t, n);
                                    return a8(t), null !== (e = ll(e, t, n)) ? e.sibling : null
                                }
                                a8(t);
                                break;
                            case 19:
                                if (128 & t.flags) return li(e, t, n);
                                if (a = 0 != (128 & e.flags), (r = 0 != (n & t.childLanes)) || (r7(e, t, n, !1), r = 0 != (n & t.childLanes)), a) {
                                    if (r) return li(e, t, n);
                                    t.flags |= 128
                                }
                                if (null !== (a = t.memoizedState) && (a.rendering = null, a.tail = null, a.lastEffect = null), ir(t, it.current), !r) return null;
                                break;
                            case 22:
                                return t.lanes = 0, oZ(e, t, n, t.pendingProps);
                            case 24:
                                r5(t, as, e.memoizedState.cache)
                        }
                        return ll(e, t, n)
                    }(e, t, n);
                o$ = 0 != (131072 & e.flags)
            }
        else o$ = !1, rW && 0 != (1048576 & t.flags) && rj(t, rI, t.index);
        switch (t.lanes = 0, t.tag) {
            case 16:
                e: {
                    var r = t.pendingProps;
                    if (e = aO(t.elementType), t.type = e, "function" == typeof e) rb(e) ? (r = oA(e, r), t.tag = 1, t = o2(null, t, e, r, n)) : (t.tag = 0, t = o0(null, t, e, r, n));
                    else {
                        if (null != e) {
                            var a = e.$$typeof;
                            if (a === A) {
                                t.tag = 11, t = oW(null, t, e, r, n);
                                break e
                            }
                            if (a === M) {
                                t.tag = 14, t = oK(null, t, e, r, n);
                                break e
                            }
                            if (a === I) {
                                t.tag = 10, t.type = e, t = lo(null, t, n);
                                break e
                            }
                        }
                        throw Error(s(306, t = function e(t) {
                            if (null == t) return null;
                            if ("function" == typeof t) return t.$$typeof === V ? null : t.displayName || t.name || null;
                            if ("string" == typeof t) return t;
                            switch (t) {
                                case C:
                                    return "Fragment";
                                case R:
                                    return "Profiler";
                                case O:
                                    return "StrictMode";
                                case L:
                                    return "Suspense";
                                case D:
                                    return "SuspenseList";
                                case F:
                                    return "Activity";
                                case B:
                                    return "ViewTransition"
                            }
                            if ("object" == typeof t) switch (t.$$typeof) {
                                case N:
                                    return "Portal";
                                case I:
                                    return t.displayName || "Context";
                                case P:
                                    return (t._context.displayName || "Context") + ".Consumer";
                                case A:
                                    var n = t.render;
                                    return (t = t.displayName) || (t = "" !== (t = n.displayName || n.name || "") ? "ForwardRef(" + t + ")" : "ForwardRef"), t;
                                case M:
                                    return null !== (n = t.displayName || null) ? n : e(t.type) || "Memo";
                                case z:
                                    n = t._payload, t = t._init;
                                    try {
                                        return e(t(n))
                                    } catch (e) {}
                            }
                            return null
                        }(e) || e, ""))
                    }
                }
                return t;
            case 0:
                return o0(e, t, t.type, t.pendingProps, n);
            case 1:
                return a = oA(r = t.type, t.pendingProps), o2(e, t, r, a, n);
            case 3:
                e: {
                    if (ea(t, t.stateNode.containerInfo), null === e) throw Error(s(387));r = t.pendingProps;
                    var i = t.memoizedState;a = i.element,
                    a$(e, t),
                    aQ(t, r, null, n);
                    var o = t.memoizedState;
                    if (r5(t, as, r = o.cache), r !== i.cache && r6(t, [as], n, !0), aG(), r = o.element, i.isDehydrated)
                        if (i = {
                                element: r,
                                isDehydrated: !1,
                                cache: o.cache
                            }, t.updateQueue.baseState = i, t.memoizedState = i, 256 & t.flags) {
                            t = o4(e, t, r, n);
                            break e
                        } else if (r !== a) {
                        r1(a = rC(Error(s(424)), t)), t = o4(e, t, r, n);
                        break e
                    } else
                        for (rV = cZ((e = 9 === (e = t.stateNode.containerInfo).nodeType ? e.body : "HTML" === e.nodeName ? e.ownerDocument.body : e).firstChild), r$ = t, rW = !0, rK = null, rH = !0, n = aU(t, null, r, n), t.child = n; n;) n.flags = -3 & n.flags | 4096, n = n.sibling;
                    else {
                        if (rJ(), r === a) {
                            t = ll(e, t, n);
                            break e
                        }
                        oV(e, t, r, n)
                    }
                    t = t.child
                }
                return t;
            case 26:
                return oJ(e, t), null === e ? (n = c8(t.type, null, t.pendingProps, null)) ? t.memoizedState = n : rW || (n = t.type, e = t.pendingProps, (r = cu(en.current).createElement(n))[eK] = t, r[eH] = e, ci(r, n, e), e5(r), t.stateNode = r) : t.memoizedState = c8(t.type, e.memoizedProps, t.pendingProps, e.memoizedState), null;
            case 27:
                return eo(t), null === e && rW && (r = t.stateNode = cX(t.type, t.pendingProps, en.current), r$ = t, rH = !0, a = rV, cb(t.type) ? (cG = a, rV = cZ(r.firstChild)) : rV = a), oV(e, t, t.pendingProps.children, n), oJ(e, t), null === e && (t.flags |= 4194304), t.child;
            case 5:
                return null === e && rW && ((a = r = rV) && (null !== (r = function(e, t, n, r) {
                    for (; 1 === e.nodeType;) {
                        if (e.nodeName.toLowerCase() !== t.toLowerCase()) {
                            if (!r && ("INPUT" !== e.nodeName || "hidden" !== e.type)) break
                        } else if (r) {
                            if (!e[eJ]) switch (t) {
                                case "meta":
                                    if (!e.hasAttribute("itemprop")) break;
                                    return e;
                                case "link":
                                    if ("stylesheet" === (a = e.getAttribute("rel")) && e.hasAttribute("data-precedence") || a !== n.rel || e.getAttribute("href") !== (null == n.href || "" === n.href ? null : n.href) || e.getAttribute("crossorigin") !== (null == n.crossOrigin ? null : n.crossOrigin) || e.getAttribute("title") !== (null == n.title ? null : n.title)) break;
                                    return e;
                                case "style":
                                    if (e.hasAttribute("data-precedence")) break;
                                    return e;
                                case "script":
                                    if (((a = e.getAttribute("src")) !== (null == n.src ? null : n.src) || e.getAttribute("type") !== (null == n.type ? null : n.type) || e.getAttribute("crossorigin") !== (null == n.crossOrigin ? null : n.crossOrigin)) && a && e.hasAttribute("async") && !e.hasAttribute("itemprop")) break;
                                    return e;
                                default:
                                    return e
                            }
                        } else {
                            if ("input" !== t || "hidden" !== e.type) return e;
                            var a = null == n.name ? null : "" + n.name;
                            if ("hidden" === n.type && e.getAttribute("name") === a) return e
                        }
                        if (null === (e = cZ(e.nextSibling))) break
                    }
                    return null
                }(r, t.type, t.pendingProps, rH)) ? (t.stateNode = r, r$ = t, rV = cZ(r.firstChild), rH = !1, a = !0) : a = !1), a || rG(t)), eo(t), a = t.type, i = t.pendingProps, o = null !== e ? e.memoizedProps : null, r = i.children, cf(a, i) ? r = null : null !== o && cf(a, o) && (t.flags |= 32), null !== t.memoizedState && (d_._currentValue = a = iw(e, t, ik, null, null, n)), oJ(e, t), oV(e, t, r, n), t.child;
            case 6:
                return null === e && rW && ((e = n = rV) && (null !== (n = function(e, t, n) {
                    if ("" === t) return null;
                    for (; 3 !== e.nodeType;)
                        if ((1 !== e.nodeType || "INPUT" !== e.nodeName || "hidden" !== e.type) && !n || null === (e = cZ(e.nextSibling))) return null;
                    return e
                }(n, t.pendingProps, rH)) ? (t.stateNode = n, r$ = t, rV = null, e = !0) : e = !1), e || rG(t)), null;
            case 13:
                return o9(e, t, n);
            case 4:
                return ea(t, t.stateNode.containerInfo), r = t.pendingProps, null === e ? t.child = aj(t, null, r, n) : oV(e, t, r, n), t.child;
            case 11:
                return oW(e, t, t.type, t.pendingProps, n);
            case 7:
                return r = t.pendingProps, oJ(e, t), oV(e, t, r, n), t.child;
            case 8:
            case 12:
                return oV(e, t, t.pendingProps.children, n), t.child;
            case 10:
                return lo(e, t, n);
            case 9:
                return a = t.type._context, r = t.pendingProps.children, at(t), r = r(a = an(a)), t.flags |= 1, oV(e, t, r, n), t.child;
            case 14:
                return oK(e, t, t.type, t.pendingProps, n);
            case 15:
                return oH(e, t, t.type, t.pendingProps, n);
            case 19:
                return li(e, t, n);
            case 31:
                var l = e,
                    u = t,
                    c = n,
                    d = u.pendingProps,
                    f = 0 != (128 & u.flags);
                if (u.flags &= -129, null === l) {
                    if (rW) {
                        if ("hidden" === d.mode) return l = oY(u, d), u.lanes = 0x20000000, oG(null, l);
                        if (a9(u), (l = rV) ? null !== (l = null !== (l = cW(l, rH)) && "&" === l.data ? l : null) && (u.memoizedState = {
                                dehydrated: l,
                                treeContext: null !== rD ? {
                                    id: rM,
                                    overflow: rz
                                } : null,
                                retryLane: 0x20000000,
                                hydrationErrors: null
                            }, (c = rE(l)).return = u, u.child = c, r$ = u, rV = null) : l = null, null === l) throw rG(u);
                        return u.lanes = 0x20000000, null
                    }
                    return oY(u, d)
                }
                var p = l.memoizedState;
                if (null !== p) {
                    var h = p.dehydrated;
                    if (a9(u), f)
                        if (256 & u.flags) u.flags &= -257, u = oX(l, u, c);
                        else if (null !== u.memoizedState) u.child = l.child, u.flags |= 128, u = null;
                    else throw Error(s(558));
                    else if (o$ || r7(l, u, c, !1), f = 0 != (c & l.childLanes), o$ || f) {
                        if (null !== (d = sE) && 0 !== (h = eU(d, c)) && h !== p.retryLane) throw p.retryLane = h, rp(l, h), s7(d, l, h), oq;
                        uc(), u = oX(l, u, c)
                    } else l = p.treeContext, rV = cZ(h.nextSibling), r$ = u, rW = !0, rK = null, rH = !1, null !== l && rq(u, l), u = oY(u, d), u.flags |= 4096;
                    return u
                }
                return (l = rw(l.child, {
                    mode: d.mode,
                    children: d.children
                })).ref = u.ref, u.child = l, l.return = u, l;
            case 22:
                return oZ(e, t, n, t.pendingProps);
            case 24:
                return at(t), r = an(as), null === e ? (null === (a = aw()) && (a = sE, i = au(), a.pooledCache = i, i.refCount++, null !== i && (a.pooledCacheLanes |= n), a = i), t.memoizedState = {
                    parent: r,
                    cache: a
                }, aq(t), r5(t, as, a)) : (0 != (e.lanes & n) && (a$(e, t), aQ(t, null, null, n), aG()), a = e.memoizedState, i = t.memoizedState, a.parent !== r ? (a = {
                    parent: r,
                    cache: r
                }, t.memoizedState = a, 0 === t.lanes && (t.memoizedState = t.updateQueue.baseState = a), r5(t, as, r)) : (r5(t, as, r = i.cache), r !== a.cache && r6(t, [as], n, !0))), oV(e, t, t.pendingProps.children, n), t.child;
            case 30:
                return null === t.stateNode && (t.stateNode = {
                    autoName: null,
                    paired: null,
                    clones: null,
                    ref: null
                }), null != (r = t.pendingProps).name && "auto" !== r.name ? t.flags |= null === e ? 0x1202000 : 0x1200000 : rW && rU(t), null !== e && e.memoizedProps.name !== r.name ? t.flags |= 4194816 : oJ(e, t), oV(e, t, r.children, n), t.child;
            case 29:
                throw t.pendingProps
        }
        throw Error(s(156, t.tag))
    }

    function lc(e) {
        e.flags |= 4
    }

    function ld(e, t, n, r, a) {
        var i;
        if ((i = 0 != (32 & e.mode)) && (i = null === n ? dc(t, r) : dc(t, r) && (r.src !== n.src || r.srcSet !== n.srcSet)), i) {
            if (e.flags |= 0x1000000, (0x13ffff40 & a) === a)
                if (e.stateNode.complete) e.flags |= 8192;
                else if (ul()) e.flags |= 8192;
            else throw aR = aT, ax
        } else e.flags &= -0x1000001
    }

    function lf(e, t) {
        if ("stylesheet" !== t.type || 0 != (4 & t.state.loading)) e.flags &= -0x1000001;
        else if (e.flags |= 0x1000000, !dd(t))
            if (ul()) e.flags |= 8192;
            else throw aR = aT, ax
    }

    function lp(e, t) {
        null !== t && (e.flags |= 4), 16384 & e.flags && (t = 22 !== e.tag ? eD() : 0x20000000, e.lanes |= t, sj |= t)
    }

    function lh(e, t) {
        if (!rW) switch (e.tailMode) {
            case "visible":
                break;
            case "collapsed":
                for (var n = e.tail, r = null; null !== n;) null !== n.alternate && (r = n), n = n.sibling;
                null === r ? t || null === e.tail ? e.tail = null : e.tail.sibling = null : r.sibling = null;
                break;
            default:
                for (n = null, t = e.tail; null !== t;) null !== t.alternate && (n = t), t = t.sibling;
                null === n ? e.tail = null : n.sibling = null
        }
    }

    function lm(e) {
        var t = null !== e.alternate && e.alternate.child === e.child,
            n = 0,
            r = 0;
        if (t)
            for (var a = e.child; null !== a;) n |= a.lanes | a.childLanes, r |= 0x7f00000 & a.subtreeFlags, r |= 0x7f00000 & a.flags, a.return = e, a = a.sibling;
        else
            for (a = e.child; null !== a;) n |= a.lanes | a.childLanes, r |= a.subtreeFlags, r |= a.flags, a.return = e, a = a.sibling;
        return e.subtreeFlags |= r, e.childLanes = n, t
    }

    function lg(e, t) {
        switch (rB(t), t.tag) {
            case 3:
                r8(as), ei();
                break;
            case 26:
            case 27:
            case 5:
                el(t);
                break;
            case 4:
                ei();
                break;
            case 31:
                null !== t.memoizedState && ie(t);
                break;
            case 13:
                ie(t);
                break;
            case 19:
                ia(t);
                break;
            case 10:
                r8(t.type);
                break;
            case 22:
            case 23:
                ie(t), a4(), null !== e && X(ab);
                break;
            case 24:
                r8(as)
        }
    }

    function lv(e, t) {
        try {
            var n = t.updateQueue,
                r = null !== n ? n.lastEffect : null;
            if (null !== r) {
                var a = r.next;
                n = a;
                do {
                    if ((n.tag & e) === e) {
                        r = void 0;
                        var i = n.create;
                        n.inst.destroy = r = i()
                    }
                    n = n.next
                } while (n !== a)
            }
        } catch (e) {
            uN(t, t.return, e)
        }
    }

    function ly(e, t, n) {
        try {
            var r = t.updateQueue,
                a = null !== r ? r.lastEffect : null;
            if (null !== a) {
                var i = a.next;
                r = i;
                do {
                    if ((r.tag & e) === e) {
                        var o = r.inst,
                            l = o.destroy;
                        if (void 0 !== l) {
                            o.destroy = void 0, a = t;
                            try {
                                l()
                            } catch (e) {
                                uN(a, n, e)
                            }
                        }
                    }
                    r = r.next
                } while (r !== i)
            }
        } catch (e) {
            uN(t, t.return, e)
        }
    }

    function lb(e) {
        var t = e.updateQueue;
        if (null !== t) {
            var n = e.stateNode;
            try {
                aX(t, n)
            } catch (t) {
                uN(e, e.return, t)
            }
        }
    }

    function lw(e, t, n) {
        n.props = oA(e.type, e.memoizedProps), n.state = e.memoizedState;
        try {
            n.componentWillUnmount()
        } catch (n) {
            uN(e, t, n)
        }
    }

    function l_(e, t) {
        try {
            var n = e.ref;
            if (null !== n) {
                switch (e.tag) {
                    case 26:
                    case 27:
                    case 5:
                        var r = e.stateNode;
                        break;
                    case 30:
                        var a = e.stateNode,
                            i = rr(e.memoizedProps, a);
                        (null === a.ref || a.ref.name !== i) && (a.ref = cO(i)), r = a.ref;
                        break;
                    case 7:
                        if (null === e.stateNode) {
                            var o = new cR(e);
                            h(e.child, !1, cB, o, void 0, void 0), e.stateNode = o
                        }
                        r = e.stateNode;
                        break;
                    default:
                        r = e.stateNode
                }
                "function" == typeof n ? e.refCleanup = n(r) : n.current = r
            }
        } catch (n) {
            uN(e, t, n)
        }
    }

    function lS(e, t) {
        var n = e.ref,
            r = e.refCleanup;
        if (null !== n)
            if ("function" == typeof r) try {
                r()
            } catch (n) {
                uN(e, t, n)
            } finally {
                e.refCleanup = null, null != (e = e.alternate) && (e.refCleanup = null)
            } else if ("function" == typeof n) try {
                n(null)
            } catch (n) {
                uN(e, t, n)
            } else n.current = null
    }

    function lk(e) {
        var t = e.type,
            n = e.memoizedProps,
            r = e.stateNode;
        try {
            switch (t) {
                case "button":
                case "input":
                case "select":
                case "textarea":
                    n.autoFocus && r.focus();
                    break;
                case "img":
                    n.src ? r.src = n.src : n.srcSet && (r.srcset = n.srcSet)
            }
        } catch (t) {
            uN(e, e.return, t)
        }
    }

    function lx(e, t, n) {
        try {
            var r = e.stateNode;
            (function(e, t, n, r) {
                switch (t) {
                    case "div":
                    case "span":
                    case "svg":
                    case "path":
                    case "a":
                    case "g":
                    case "p":
                    case "li":
                        break;
                    case "input":
                        var a = null,
                            i = null,
                            o = null,
                            l = null,
                            u = null,
                            c = null,
                            d = null;
                        for (h in n) {
                            var f = n[h];
                            if (n.hasOwnProperty(h) && null != f) switch (h) {
                                case "checked":
                                case "value":
                                    break;
                                case "defaultValue":
                                    u = f;
                                default:
                                    r.hasOwnProperty(h) || cr(e, t, h, null, r, f)
                            }
                        }
                        for (var p in r) {
                            var h = r[p];
                            if (f = n[p], r.hasOwnProperty(p) && (null != h || null != f)) switch (p) {
                                case "type":
                                    h !== f && (tr = !0), i = h;
                                    break;
                                case "name":
                                    h !== f && (tr = !0), a = h;
                                    break;
                                case "checked":
                                    h !== f && (tr = !0), c = h;
                                    break;
                                case "defaultChecked":
                                    h !== f && (tr = !0), d = h;
                                    break;
                                case "value":
                                    h !== f && (tr = !0), o = h;
                                    break;
                                case "defaultValue":
                                    h !== f && (tr = !0), l = h;
                                    break;
                                case "children":
                                case "dangerouslySetInnerHTML":
                                    if (null != h) throw Error(s(137, t));
                                    break;
                                default:
                                    h !== f && cr(e, t, p, h, r, f)
                            }
                        }
                        tm(e, o, l, u, c, d, i, a);
                        return;
                    case "select":
                        for (i in h = o = l = p = null, n)
                            if (u = n[i], n.hasOwnProperty(i) && null != u) switch (i) {
                                case "value":
                                    break;
                                case "multiple":
                                    h = u;
                                default:
                                    r.hasOwnProperty(i) || cr(e, t, i, null, r, u)
                            }
                        for (a in r)
                            if (i = r[a], u = n[a], r.hasOwnProperty(a) && (null != i || null != u)) switch (a) {
                                case "value":
                                    i !== u && (tr = !0), p = i;
                                    break;
                                case "defaultValue":
                                    i !== u && (tr = !0), l = i;
                                    break;
                                case "multiple":
                                    i !== u && (tr = !0), o = i;
                                default:
                                    i !== u && cr(e, t, a, i, r, u)
                            }
                        t = l, n = o, r = h, null != p ? ty(e, !!n, p, !1) : !!r != !!n && (null != t ? ty(e, !!n, t, !0) : ty(e, !!n, n ? [] : "", !1));
                        return;
                    case "textarea":
                        for (l in h = p = null, n)
                            if (a = n[l], n.hasOwnProperty(l) && null != a && !r.hasOwnProperty(l)) switch (l) {
                                case "value":
                                case "children":
                                    break;
                                default:
                                    cr(e, t, l, null, r, a)
                            }
                        for (o in r)
                            if (a = r[o], i = n[o], r.hasOwnProperty(o) && (null != a || null != i)) switch (o) {
                                case "value":
                                    a !== i && (tr = !0), p = a;
                                    break;
                                case "defaultValue":
                                    a !== i && (tr = !0), h = a;
                                    break;
                                case "children":
                                    break;
                                case "dangerouslySetInnerHTML":
                                    if (null != a) throw Error(s(91));
                                    break;
                                default:
                                    a !== i && cr(e, t, o, a, r, i)
                            }
                        tb(e, p, h);
                        return;
                    case "option":
                        for (var m in n) p = n[m], n.hasOwnProperty(m) && null != p && !r.hasOwnProperty(m) && ("selected" === m ? e.selected = !1 : cr(e, t, m, null, r, p));
                        for (u in r) p = r[u], h = n[u], r.hasOwnProperty(u) && p !== h && (null != p || null != h) && ("selected" === u ? (p !== h && (tr = !0), e.selected = p && "function" != typeof p && "symbol" != typeof p) : cr(e, t, u, p, r, h));
                        return;
                    case "img":
                    case "link":
                    case "area":
                    case "base":
                    case "br":
                    case "col":
                    case "embed":
                    case "hr":
                    case "keygen":
                    case "meta":
                    case "param":
                    case "source":
                    case "track":
                    case "wbr":
                    case "menuitem":
                        for (var g in n) p = n[g], n.hasOwnProperty(g) && null != p && !r.hasOwnProperty(g) && cr(e, t, g, null, r, p);
                        for (c in r)
                            if (p = r[c], h = n[c], r.hasOwnProperty(c) && p !== h && (null != p || null != h)) switch (c) {
                                case "children":
                                case "dangerouslySetInnerHTML":
                                    if (null != p) throw Error(s(137, t));
                                    break;
                                default:
                                    cr(e, t, c, p, r, h)
                            }
                        return;
                    default:
                        if (tE(t)) {
                            for (var v in n) p = n[v], n.hasOwnProperty(v) && void 0 !== p && !r.hasOwnProperty(v) && ca(e, t, v, void 0, r, p);
                            for (d in r) p = r[d], h = n[d], r.hasOwnProperty(d) && p !== h && (void 0 !== p || void 0 !== h) && ca(e, t, d, p, r, h);
                            return
                        }
                }
                for (var y in n) p = n[y], n.hasOwnProperty(y) && null != p && !r.hasOwnProperty(y) && cr(e, t, y, null, r, p);
                for (f in r) p = r[f], h = n[f], r.hasOwnProperty(f) && p !== h && (null != p || null != h) && cr(e, t, f, p, r, h)
            })(r, e.type, n, t), r[eH] = t
        } catch (t) {
            uN(e, e.return, t)
        }
    }

    function lE(e, t) {
        if ((5 === e.tag || 6 === e.tag) && null === e.alternate && null !== t)
            for (var n = 0; n < t.length; n++) c$(e.stateNode, t[n])
    }

    function lT(e) {
        for (var t = e.return; null !== t;) {
            if (lC(t)) {
                var n = t.stateNode,
                    r = e.stateNode;
                if (3 !== r.nodeType) {
                    var a = n._eventListeners;
                    if (null !== a)
                        for (var i = 0; i < a.length; i++) {
                            var o = a[i];
                            r.removeEventListener(o.type, o.listener, o.optionsOrUseCapture)
                        }
                    null != r.reactFragments && r.reactFragments.delete(n)
                }
            }
            if (lN(t)) break;
            t = t.return
        }
    }

    function lN(e) {
        return 5 === e.tag || 3 === e.tag || 26 === e.tag || 27 === e.tag && cb(e.type) || 4 === e.tag
    }

    function lC(e) {
        return e && 7 === e.tag && null !== e.stateNode
    }

    function lO(e) {
        e: for (;;) {
            for (; null === e.sibling;) {
                if (null === e.return || lN(e.return)) return null;
                e = e.return
            }
            for (e.sibling.return = e.return, e = e.sibling; 5 !== e.tag && 6 !== e.tag && 18 !== e.tag;) {
                if (27 === e.tag && cb(e.type) || 2 & e.flags || null === e.child || 4 === e.tag) continue e;
                e.child.return = e, e = e.child
            }
            if (!(2 & e.flags)) return e.stateNode
        }
    }

    function lR(e, t, n, r) {
        var a = e.tag;
        if (5 === a || 6 === a) a = e.stateNode, t ? n.insertBefore(a, t) : n.appendChild(a), lE(e, r), tr = !0;
        else if (4 !== a && (27 === a && cb(e.type) && (n = e.stateNode), null !== (e = e.child)))
            for (lR(e, t, n, r), e = e.sibling; null !== e;) lR(e, t, n, r), e = e.sibling
    }

    function lP(e) {
        var t = e.stateNode,
            n = e.memoizedProps;
        try {
            for (var r = e.type, a = t.attributes; a.length;) t.removeAttributeNode(a[0]);
            ci(t, r, n), t[eK] = e, t[eH] = n
        } catch (t) {
            uN(e, e.return, t)
        }
    }
    var lI = !1,
        lA = null;

    function lL(e) {
        (30 === e.tag || 0 != (0x2000000 & e.subtreeFlags)) && (lI = !0)
    }
    var lD = null;

    function lM() {
        var e = lD;
        return lD = null, e
    }
    var lz = 0;

    function lF(e, t, n, r, a) {
        return lz = 0,
            function e(t, n, r, a, i) {
                for (var o = !1; null !== t;) {
                    if (5 === t.tag) {
                        var l = t.stateNode;
                        if (null !== a) {
                            var s = cE(l);
                            a.push(s), s.view && (o = !0)
                        } else o || cE(l).view && (o = !0);
                        lI = !0, cS(l, 0 === lz ? n : n + "_" + lz, r), lz++
                    } else(22 !== t.tag || null === t.memoizedState) && (30 === t.tag && i || e(t.child, n, r, a, i) && (o = !0));
                    t = t.sibling
                }
                return o
            }(e.child, t, n, r, a)
    }

    function lj(e, t) {
        for (; null !== e;) 5 === e.tag ? ck(e.stateNode, e.memoizedProps) : (22 !== e.tag || null === e.memoizedState) && (30 === e.tag && t || lj(e.child, t)), e = e.sibling
    }

    function lU(e) {
        if (0 != (0x1200000 & e.subtreeFlags))
            for (e = e.child; null !== e;) {
                if ((22 !== e.tag || null === e.memoizedState) && (lU(e), 30 === e.tag && 0 != (0x1200000 & e.flags) && e.stateNode.paired)) {
                    var t = e.memoizedProps;
                    if (null == t.name || "auto" === t.name) throw Error(s(544));
                    var n = t.name;
                    "none" !== (t = ri(t.default, t.share)) && (lF(e, n, t, null, !1) || lj(e.child, !1))
                }
                e = e.sibling
            }
    }

    function lB(e, t) {
        if (30 === e.tag) {
            var n = e.stateNode,
                r = e.memoizedProps,
                a = rr(r, n),
                i = ri(r.default, n.paired ? r.share : r.enter);
            "none" !== i ? lF(e, a, i, null, !1) ? (lU(e), n.paired || t || s6(e, r.onEnter)) : lj(e.child, !1) : lU(e)
        } else if (0 != (0x2000000 & e.subtreeFlags))
            for (e = e.child; null !== e;) lB(e, t), e = e.sibling;
        else lU(e)
    }

    function lq(e) {
        if (null !== lA && 0 !== lA.size) {
            var t = lA;
            if (0 != (0x1200000 & e.subtreeFlags))
                for (e = e.child; null !== e;) {
                    if (22 !== e.tag || null === e.memoizedState) {
                        if (30 === e.tag && 0 != (0x1200000 & e.flags)) {
                            var n = e.memoizedProps,
                                r = n.name;
                            if (null != r && "auto" !== r) {
                                var a = t.get(r);
                                if (void 0 !== a) {
                                    var i = ri(n.default, n.share);
                                    if ("none" !== i && (lF(e, r, i, null, !1) ? (a.paired = i = e.stateNode, i.paired = a, s6(e, n.onShare)) : lj(e.child, !1)), t.delete(r), 0 === t.size) break
                                }
                            }
                        }
                        lq(e)
                    }
                    e = e.sibling
                }
        }
    }

    function l$(e) {
        if (30 === e.tag) {
            var t = e.memoizedProps,
                n = rr(t, e.stateNode),
                r = null !== lA ? lA.get(n) : void 0,
                a = ri(t.default, void 0 !== r ? t.share : t.exit);
            "none" !== a && (lF(e, n, a, null, !1) ? void 0 !== r ? (r.paired = a = e.stateNode, a.paired = r, lA.delete(n), s6(e, t.onShare)) : s6(e, t.onExit) : lj(e.child, !1)), null !== lA && lq(e)
        } else if (0 != (0x2000000 & e.subtreeFlags))
            for (e = e.child; null !== e;) l$(e), e = e.sibling;
        else null !== lA && lq(e)
    }

    function lV(e) {
        if (0 != (0x1200000 & e.subtreeFlags))
            for (e = e.child; null !== e;) {
                if (22 !== e.tag || null === e.memoizedState) {
                    if (30 === e.tag && 0 != (0x1200000 & e.flags)) {
                        var t = e.stateNode;
                        null !== t.paired && (t.paired = null, lj(e.child, !1))
                    }
                    lV(e)
                }
                e = e.sibling
            }
    }

    function lW(e) {
        if (30 === e.tag) e.stateNode.paired = null, lj(e.child, !1), lV(e);
        else if (0 != (0x2000000 & e.subtreeFlags))
            for (e = e.child; null !== e;) lW(e), e = e.sibling;
        else lV(e)
    }

    function lK(e, t, n, r, a, i, o) {
        for (var l = !1; null !== t;) {
            if (5 === t.tag) {
                var s = t.stateNode;
                if (null !== i && lz < i.length) {
                    var u, c = i[lz],
                        d = cE(s);
                    if ((c.view || d.view) && (l = !0), u = 0 == (4 & e.flags))
                        if (d.clip) u = !0;
                        else {
                            u = c.rect;
                            var f = d.rect;
                            u = u.y !== f.y || u.x !== f.x || u.height !== f.height || u.width !== f.width
                        } u && (e.flags |= 4), d.abs ? d = !c.abs : (c = c.rect, d = d.rect, d = c.height !== d.height || c.width !== d.width), d && (e.flags |= 32)
                } else e.flags |= 32;
                0 != (4 & e.flags) && cS(s, 0 === lz ? n : n + "_" + lz, a), l && 0 != (4 & e.flags) || (null === lD && (lD = []), lD.push(s, 0 === lz ? r : r + "_" + lz, t.memoizedProps)), lz++
            } else(22 !== t.tag || null === t.memoizedState) && (30 === t.tag && o ? e.flags |= 32 & t.flags : lK(e, t.child, n, r, a, i, o) && (l = !0));
            t = t.sibling
        }
        return l
    }
    var lH = !1,
        lZ = !1,
        lG = !1,
        lQ = !1,
        lY = "function" == typeof WeakSet ? WeakSet : Set,
        lX = null,
        lJ = !1,
        l0 = !1,
        l1 = !1,
        l2 = !1;

    function l4(e) {
        for (; null !== lX;) {
            var t = lX,
                n = e,
                r = t.alternate,
                a = t.flags;
            switch (t.tag) {
                case 0:
                case 11:
                case 15:
                    if (0 != (4 & a) && null !== (r = null !== (r = t.updateQueue) ? r.events : null))
                        for (n = 0; n < r.length; n++)(a = r[n]).ref.impl = a.nextImpl;
                    break;
                case 1:
                    if (0 != (1024 & a) && null !== r) {
                        n = void 0, a = r.memoizedProps, r = r.memoizedState;
                        var i = t.stateNode;
                        try {
                            var o = oA(t.type, a);
                            n = i.getSnapshotBeforeUpdate(o, r), i.__reactInternalSnapshotBeforeUpdate = n
                        } catch (e) {
                            uN(t, t.return, e)
                        }
                    }
                    break;
                case 3:
                    if (0 != (1024 & a)) {
                        if (9 === (n = (r = t.stateNode.containerInfo).nodeType)) cV(r);
                        else if (1 === n) switch (r.nodeName) {
                            case "HEAD":
                            case "HTML":
                            case "BODY":
                                cV(r);
                                break;
                            default:
                                r.textContent = ""
                        }
                    }
                    break;
                case 5:
                case 26:
                case 27:
                case 6:
                case 4:
                case 17:
                    break;
                case 30:
                    n && null !== r && (n = rr(r.memoizedProps, r.stateNode), "none" !== (a = ri((a = t.memoizedProps).default, a.update)) && lF(r, n, a, r.memoizedState = [], !0));
                    break;
                default:
                    if (0 != (1024 & a)) throw Error(s(163))
            }
            if (null !== (r = t.sibling)) {
                r.return = t.return, lX = r;
                break
            }
            lX = t.return
        }
    }

    function l3(e, t, n) {
        var r = n.flags;
        switch (n.tag) {
            case 0:
            case 11:
            case 15:
                su(e, n), 4 & r && lv(5, n);
                break;
            case 1:
                if (su(e, n), 4 & r)
                    if (e = n.stateNode, null === t) try {
                        e.componentDidMount()
                    } catch (e) {
                        uN(n, n.return, e)
                    } else {
                        var a = oA(n.type, t.memoizedProps);
                        t = t.memoizedState;
                        try {
                            e.componentDidUpdate(a, t, e.__reactInternalSnapshotBeforeUpdate)
                        } catch (e) {
                            uN(n, n.return, e)
                        }
                    }
                64 & r && lb(n), 512 & r && l_(n, n.return);
                break;
            case 3:
                if (su(e, n), 64 & r && null !== (e = n.updateQueue)) {
                    if (t = null, null !== n.child) switch (n.child.tag) {
                        case 27:
                        case 5:
                        case 1:
                            t = n.child.stateNode
                    }
                    try {
                        aX(e, t)
                    } catch (e) {
                        uN(n, n.return, e)
                    }
                }
                break;
            case 27:
                null === t && 4 & r && lP(n);
            case 26:
            case 5:
                su(e, n), null === t && 4 & r && lk(n), 512 & r && l_(n, n.return);
                break;
            case 12:
                su(e, n);
                break;
            case 31:
                su(e, n), 4 & r && se(e, n);
                break;
            case 13:
                su(e, n), 4 & r && st(e, n), 64 & r && null !== (e = n.memoizedState) && null !== (e = e.dehydrated) && function(e, t) {
                    var n = e.ownerDocument;
                    if ("$~" === e.data) e._reactRetry = t;
                    else if ("$?" !== e.data || "loading" !== n.readyState) t();
                    else {
                        var r = function() {
                            t(), n.removeEventListener("DOMContentLoaded", r)
                        };
                        n.addEventListener("DOMContentLoaded", r), e._reactRetry = r
                    }
                }(e, n = uP.bind(null, n));
                break;
            case 22:
                if (!(r = null !== n.memoizedState || lH)) {
                    t = null !== t && null !== t.memoizedState || lZ, a = lH;
                    var i = lZ;
                    lH = r, (lZ = t) && !i ? function e(t, n, r) {
                        for (r = r && 0 != (8772 & n.subtreeFlags), n = n.child; null !== n;) {
                            var a = n.alternate,
                                i = t,
                                o = n,
                                l = o.flags;
                            switch (o.tag) {
                                case 0:
                                case 11:
                                case 15:
                                    e(i, o, r), lv(4, o);
                                    break;
                                case 1:
                                    if (e(i, o, r), "function" == typeof(i = (a = o).stateNode).componentDidMount) try {
                                        i.componentDidMount()
                                    } catch (e) {
                                        uN(a, a.return, e)
                                    }
                                    if (null !== (i = (a = o).updateQueue)) {
                                        var s = a.stateNode;
                                        try {
                                            var u = i.shared.hiddenCallbacks;
                                            if (null !== u)
                                                for (i.shared.hiddenCallbacks = null, i = 0; i < u.length; i++) aY(u[i], s)
                                        } catch (e) {
                                            uN(a, a.return, e)
                                        }
                                    }
                                    r && 64 & l && lb(o), l_(o, o.return);
                                    break;
                                case 27:
                                    lP(o);
                                case 26:
                                case 5:
                                    if (5 === o.tag) {
                                        s = o;
                                        for (var c = s.return; null !== c && (lC(c) && c$(s.stateNode, c.stateNode), !lN(c));) c = c.return
                                    }
                                    e(i, o, r), r && null === a && 4 & l && lk(o), l_(o, o.return);
                                    break;
                                case 12:
                                    e(i, o, r);
                                    break;
                                case 31:
                                    e(i, o, r), r && 4 & l && se(i, o);
                                    break;
                                case 13:
                                    e(i, o, r), r && 4 & l && st(i, o);
                                    break;
                                case 22:
                                    null === o.memoizedState && e(i, o, r), l_(o, o.return);
                                    break;
                                case 30:
                                    e(i, o, r), l_(o, o.return);
                                    break;
                                case 7:
                                    l_(o, o.return);
                                default:
                                    e(i, o, r)
                            }
                            n = n.sibling
                        }
                    }(e, n, 0 != (8772 & n.subtreeFlags)) : su(e, n), lH = a, lZ = i
                }
                break;
            case 30:
                su(e, n), 512 & r && l_(n, n.return);
                break;
            case 7:
                512 & r && l_(n, n.return);
            default:
                su(e, n)
        }
    }

    function l5(e, t) {
        for (e = e.child; null !== e;)(function e(t, n) {
            switch (t.tag) {
                case 5:
                case 26:
                    try {
                        var r = t.stateNode;
                        if (n) {
                            var a = r.style;
                            "function" == typeof a.setProperty ? a.setProperty("display", "none", "important") : a.display = "none"
                        } else {
                            var i = t.stateNode,
                                o = t.memoizedProps.style,
                                l = null != o && o.hasOwnProperty("display") ? o.display : null;
                            i.style.display = null == l || "boolean" == typeof l ? "" : ("" + l).trim()
                        }
                    } catch (e) {
                        uN(t, t.return, e)
                    }! function t(n, r) {
                        if (0x4000000 & n.subtreeFlags)
                            for (n = n.child; null !== n;) {
                                e: {
                                    var a = n;
                                    switch (a.tag) {
                                        case 4:
                                            e(a, r);
                                            break e;
                                        case 22:
                                            null === a.memoizedState && t(a, r);
                                            break e;
                                        default:
                                            t(a, r)
                                    }
                                }
                                n = n.sibling
                            }
                    }(t, n);
                    break;
                case 6:
                    try {
                        t.stateNode.nodeValue = n ? "" : t.memoizedProps, tr = !0
                    } catch (e) {
                        uN(t, t.return, e)
                    }
                    break;
                case 18:
                    try {
                        var s = t.stateNode;
                        n ? c_(s, !0) : c_(t.stateNode, !1)
                    } catch (e) {
                        uN(t, t.return, e)
                    }
                    break;
                case 22:
                case 23:
                    null === t.memoizedState && l5(t, n);
                    break;
                default:
                    l5(t, n)
            }
        })(e, t), e = e.sibling
    }
    var l8 = null,
        l9 = !1;

    function l6(e, t, n) {
        for (n = n.child; null !== n;) l7(e, t, n), n = n.sibling
    }

    function l7(e, t, n) {
        if (eE && "function" == typeof eE.onCommitFiberUnmount) try {
            eE.onCommitFiberUnmount(ex, n)
        } catch (e) {}
        switch (n.tag) {
            case 26:
                lZ || lS(n, t), l6(e, t, n), n.memoizedState ? n.memoizedState.count-- : n.stateNode && (n = n.stateNode).parentNode.removeChild(n);
                break;
            case 27:
                lZ || lS(n, t);
                var r = l8,
                    a = l9;
                cb(n.type) && (l8 = n.stateNode, l9 = !1), l6(e, t, n), cJ(n.stateNode), l8 = r, l9 = a;
                break;
            case 5:
                lZ || lS(n, t), 5 !== n.tag && 6 !== n.tag || lT(n);
            case 6:
                if (r = l8, a = l9, l8 = null, l6(e, t, n), l8 = r, l9 = a, null !== l8)
                    if (l9) try {
                        (9 === l8.nodeType ? l8.body : "HTML" === l8.nodeName ? l8.ownerDocument.body : l8).removeChild(n.stateNode), tr = !0
                    } catch (e) {
                        uN(n, t, e)
                    } else try {
                        l8.removeChild(n.stateNode), tr = !0
                    } catch (e) {
                        uN(n, t, e)
                    }
                break;
            case 18:
                null !== l8 && (l9 ? (cw(9 === (e = l8).nodeType ? e.body : "HTML" === e.nodeName ? e.ownerDocument.body : e, n.stateNode), d0(e)) : cw(l8, n.stateNode));
                break;
            case 4:
                r = l8, a = l9, l8 = n.stateNode.containerInfo, l9 = !0, l6(e, t, n), l8 = r, l9 = a;
                break;
            case 0:
            case 11:
            case 14:
            case 15:
                ly(2, n, t), lZ || ly(4, n, t), l6(e, t, n);
                break;
            case 1:
                lZ || (lS(n, t), "function" == typeof(r = n.stateNode).componentWillUnmount && lw(n, t, r)), l6(e, t, n);
                break;
            case 21:
            default:
                l6(e, t, n);
                break;
            case 22:
                lZ = (r = lZ) || null !== n.memoizedState, l6(e, t, n), lZ = r;
                break;
            case 30:
                lS(n, t), l6(e, t, n);
                break;
            case 7:
                lZ || lS(n, t), l6(e, t, n)
        }
    }

    function se(e, t) {
        if (null === t.memoizedState && null !== (e = t.alternate) && null !== (e = e.memoizedState)) {
            e = e.dehydrated;
            try {
                d0(e)
            } catch (e) {
                uN(t, t.return, e)
            }
        }
    }

    function st(e, t) {
        if (null === t.memoizedState && null !== (e = t.alternate) && null !== (e = e.memoizedState) && null !== (e = e.dehydrated)) try {
            d0(e)
        } catch (e) {
            uN(t, t.return, e)
        }
    }

    function sn(e, t) {
        var n = function(e) {
            switch (e.tag) {
                case 31:
                case 13:
                case 19:
                    var t = e.stateNode;
                    return null === t && (t = e.stateNode = new lY), t;
                case 22:
                    return null === (t = (e = e.stateNode)._retryCache) && (t = e._retryCache = new lY), t;
                default:
                    throw Error(s(435, e.tag))
            }
        }(e);
        t.forEach(function(t) {
            if (!n.has(t)) {
                n.add(t);
                var r = uI.bind(null, e, t);
                t.then(r, r)
            }
        })
    }

    function sr(e, t, n) {
        var r = t.deletions;
        if (null !== r)
            for (var a = 0; a < r.length; a++) {
                var i = r[a],
                    o = e,
                    l = t,
                    u = l;
                e: for (; null !== u;) {
                    switch (u.tag) {
                        case 27:
                            if (cb(u.type)) {
                                l8 = u.stateNode, l9 = !1;
                                break e
                            }
                            break;
                        case 5:
                            l8 = u.stateNode, l9 = !1;
                            break e;
                        case 3:
                        case 4:
                            l8 = u.stateNode.containerInfo, l9 = !0;
                            break e
                    }
                    u = u.return
                }
                if (null === l8) throw Error(s(160));
                l7(o, l, i), l8 = null, l9 = !1, null !== (o = i.alternate) && (o.return = null), i.return = null
            }
        if (13886 & t.subtreeFlags)
            for (t = t.child; null !== t;) si(t, e, n), t = t.sibling
    }
    var sa = null;

    function si(e, t, n) {
        var r = e.alternate,
            a = e.flags;
        switch (e.tag) {
            case 0:
            case 11:
            case 14:
            case 15:
                sr(t, e, n), so(e), 4 & a && (ly(3, e, e.return), lv(3, e), ly(5, e, e.return));
                break;
            case 1:
                sr(t, e, n), so(e), 512 & a && (lZ || null === r || lS(r, r.return)), 64 & a && lH && null !== (e = e.updateQueue) && null !== (r = e.callbacks) && (t = e.shared.hiddenCallbacks, e.shared.hiddenCallbacks = null === t ? r : t.concat(r));
                break;
            case 26:
                var i = sa;
                if (sr(t, e, n), so(e), 512 & a && (lZ || null === r || lS(r, r.return)), 4 & a)
                    if (n = null !== r ? r.memoizedState : null, t = e.memoizedState, null === r)
                        if (null === t)
                            if (null === e.stateNode) {
                                e: {
                                    r = e.type,
                                    t = e.memoizedProps,
                                    n = i.ownerDocument || i;t: switch (r) {
                                        case "title":
                                            (!(a = n.getElementsByTagName("title")[0]) || a[eJ] || a[eK] || "http://www.w3.org/2000/svg" === a.namespaceURI || a.hasAttribute("itemprop")) && (a = n.createElement(r), n.head.insertBefore(a, n.querySelector("head > title"))), ci(a, r, t), a[eK] = e, e5(a), r = a;
                                            break e;
                                        case "link":
                                            if (i = ds("link", "href", n).get(r + (t.href || ""))) {
                                                for (var o = 0; o < i.length; o++)
                                                    if ((a = i[o]).getAttribute("href") === (null == t.href || "" === t.href ? null : t.href) && a.getAttribute("rel") === (null == t.rel ? null : t.rel) && a.getAttribute("title") === (null == t.title ? null : t.title) && a.getAttribute("crossorigin") === (null == t.crossOrigin ? null : t.crossOrigin)) {
                                                        i.splice(o, 1);
                                                        break t
                                                    }
                                            }
                                            ci(a = n.createElement(r), r, t), n.head.appendChild(a);
                                            break;
                                        case "meta":
                                            if (i = ds("meta", "content", n).get(r + (t.content || ""))) {
                                                for (o = 0; o < i.length; o++)
                                                    if ((a = i[o]).getAttribute("content") === (null == t.content ? null : "" + t.content) && a.getAttribute("name") === (null == t.name ? null : t.name) && a.getAttribute("property") === (null == t.property ? null : t.property) && a.getAttribute("http-equiv") === (null == t.httpEquiv ? null : t.httpEquiv) && a.getAttribute("charset") === (null == t.charSet ? null : t.charSet)) {
                                                        i.splice(o, 1);
                                                        break t
                                                    }
                                            }
                                            ci(a = n.createElement(r), r, t), n.head.appendChild(a);
                                            break;
                                        default:
                                            throw Error(s(468, r))
                                    }
                                    a[eK] = e,
                                    e5(a),
                                    r = a
                                }
                                e.stateNode = r
                            }
                else du(i, e.type, e.stateNode);
                else e.stateNode = dn(i, t, e.memoizedProps);
                else n !== t ? (null === n ? null !== r.stateNode && (r = r.stateNode).parentNode.removeChild(r) : n.count--, null === t ? du(i, e.type, e.stateNode) : dn(i, t, e.memoizedProps)) : null === t && null !== e.stateNode && lx(e, e.memoizedProps, r.memoizedProps);
                break;
            case 27:
                sr(t, e, n), so(e), 512 & a && (lZ || null === r || lS(r, r.return)), null !== r && 4 & a && lx(e, e.memoizedProps, r.memoizedProps);
                break;
            case 5:
                if (i = lG, lG = !1, sr(t, e, n), lG = i, so(e), 512 & a && (lZ || null === r || lS(r, r.return)), 32 & e.flags) {
                    t = e.stateNode;
                    try {
                        t_(t, ""), tr = !0
                    } catch (t) {
                        uN(e, e.return, t)
                    }
                }
                4 & a && null != e.stateNode && (t = e.memoizedProps, lx(e, t, null !== r ? r.memoizedProps : t)), 1024 & a && (lQ = !0);
                break;
            case 6:
                if (sr(t, e, n), so(e), 4 & a) {
                    if (null === e.stateNode) throw Error(s(162));
                    r = e.memoizedProps, t = e.stateNode;
                    try {
                        t.nodeValue = r, tr = !0
                    } catch (t) {
                        uN(e, e.return, t)
                    }
                }
                break;
            case 3:
                if (tr = !1, dl = null, i = sa, sa = c2(t.containerInfo), sr(t, e, n), sa = i, so(e), 4 & a && null !== r && r.memoizedState.isDehydrated) try {
                    d0(t.containerInfo)
                } catch (t) {
                    uN(e, e.return, t)
                }
                lQ && (lQ = !1, function e(t) {
                    if (1024 & t.subtreeFlags)
                        for (t = t.child; null !== t;) {
                            var n = t;
                            e(n), 5 === n.tag && 1024 & n.flags && (n = n.stateNode, dO = !0, n.reset(), dO = !1), t = t.sibling
                        }
                }(e)), tr = !1;
                break;
            case 4:
                r = lG, lG = lH, a = ta(), i = sa, sa = c2(e.stateNode.containerInfo), sr(t, e, n), so(e), sa = i, tr && l0 && (l1 = !0), tr = a, lG = r;
                break;
            case 12:
                sr(t, e, n), so(e);
                break;
            case 31:
            case 19:
                sr(t, e, n), so(e), 4 & a && null !== (r = e.updateQueue) && (e.updateQueue = null, sn(e, r));
                break;
            case 13:
                sr(t, e, n), so(e), 8192 & e.child.flags && null !== e.memoizedState != (null !== r && null !== r.memoizedState) && (s$ = ev()), 4 & a && null !== (r = e.updateQueue) && (e.updateQueue = null, sn(e, r));
                break;
            case 22:
                i = null !== e.memoizedState, o = null !== r && null !== r.memoizedState;
                var l = lH,
                    u = lZ,
                    c = lG;
                lH = l || i, lG = c || i, lZ = u || o, sr(t, e, n), lZ = u, lG = c, lH = l, so(e), 8192 & a && ((t = e.stateNode)._visibility = i ? -2 & t._visibility : 1 | t._visibility, i && (null === r || o || lH || lZ || function e(t) {
                    for (t = t.child; null !== t;) {
                        var n = t;
                        switch (n.tag) {
                            case 0:
                            case 11:
                            case 14:
                            case 15:
                                ly(4, n, n.return), e(n);
                                break;
                            case 1:
                                lS(n, n.return);
                                var r = n.stateNode;
                                "function" == typeof r.componentWillUnmount && lw(n, n.return, r), e(n);
                                break;
                            case 27:
                                cJ(n.stateNode);
                            case 26:
                            case 5:
                                lS(n, n.return), 5 !== n.tag && 6 !== n.tag || lT(n), e(n);
                                break;
                            case 22:
                                null === n.memoizedState && e(n);
                                break;
                            case 30:
                                lS(n, n.return), e(n);
                                break;
                            case 7:
                                lS(n, n.return);
                            default:
                                e(n)
                        }
                        t = t.sibling
                    }
                }(e)), !i && lG || l5(e, i)), 4 & a && null !== (r = e.updateQueue) && null !== (t = r.retryQueue) && (r.retryQueue = null, sn(e, t));
                break;
            case 30:
                512 & a && (lZ || null === r || lS(r, r.return)), a = ta(), i = l0, o = (0x13ffff00 & n) === n, l = e.memoizedProps, l0 = o && "none" !== ri(l.default, l.update), sr(t, e, n), so(e), o && null !== r && tr && (e.flags |= 4), l0 = i, tr = a;
                break;
            case 21:
                break;
            case 7:
                r && null !== r.stateNode && (r.stateNode._fragmentFiber = e);
            default:
                sr(t, e, n), so(e)
        }
    }

    function so(e) {
        var t = e.flags;
        if (2 & t) {
            try {
                for (var n, r = null, a = e.return; null !== a;) {
                    if (lC(a)) {
                        var i = a.stateNode;
                        null === r ? r = [i] : r.push(i)
                    }
                    if (lN(a)) {
                        n = a;
                        break
                    }
                    a = a.return
                }
                if (null == n) throw Error(s(160));
                switch (n.tag) {
                    case 27:
                        var o = n.stateNode,
                            l = lO(e);
                        lR(e, l, o, r);
                        break;
                    case 5:
                        var u = n.stateNode;
                        32 & n.flags && (t_(u, ""), n.flags &= -33);
                        var c = lO(e);
                        lR(e, c, u, r);
                        break;
                    case 3:
                    case 4:
                        var d = n.stateNode.containerInfo,
                            f = lO(e);
                        ! function e(t, n, r, a) {
                            var i = t.tag;
                            if (5 === i || 6 === i) i = t.stateNode, n ? (9 === r.nodeType ? r.body : "HTML" === r.nodeName ? r.ownerDocument.body : r).insertBefore(i, n) : ((n = 9 === r.nodeType ? r.body : "HTML" === r.nodeName ? r.ownerDocument.body : r).appendChild(i), null != (r = r._reactRootContainer) || null !== n.onclick || (n.onclick = tO)), lE(t, a), tr = !0;
                            else if (4 !== i && (27 === i && cb(t.type) && (r = t.stateNode, n = null), null !== (t = t.child)))
                                for (e(t, n, r, a), t = t.sibling; null !== t;) e(t, n, r, a), t = t.sibling
                        }(e, f, d, r);
                        break;
                    default:
                        throw Error(s(161))
                }
            } catch (t) {
                uN(e, e.return, t)
            }
            e.flags &= -3
        }
        4096 & t && (e.flags &= -4097)
    }

    function sl(e, t) {
        if (9270 & t.subtreeFlags)
            for (t = t.child; null !== t;) ss(t, e), t = t.sibling;
        else ! function e(t, n) {
            for (t = t.child; null !== t;) {
                if (30 === t.tag) {
                    var r = t.memoizedProps,
                        a = t.stateNode,
                        i = rr(r, a),
                        o = ri(r.default, r.update);
                    if (n) var l = null === (a = a.clones) ? null : a.map(cT);
                    else l = t.memoizedState, t.memoizedState = null;
                    a = t;
                    var s = t.child;
                    lz = 0, i = lK(a, s, i, i, o, l, !1), 0 != (4 & t.flags) && i && (n || s6(t, r.onUpdate))
                } else 0 != (0x2000000 & t.subtreeFlags) && e(t, n);
                t = t.sibling
            }
        }(t, !1)
    }

    function ss(e, t) {
        var n = e.alternate;
        if (null === n) lB(e, !1);
        else switch (e.tag) {
            case 3:
                if (l2 = lJ = !1, lM(), sl(t, e), !lJ && !l1) {
                    if (null !== (e = lD))
                        for (var r = 0; r < e.length; r += 3) {
                            n = e[r];
                            var a = e[r + 1];
                            ck(n, e[r + 2]), null !== (n = n.ownerDocument.documentElement) && n.animate({
                                opacity: [0, 0],
                                pointerEvents: ["none", "none"]
                            }, {
                                duration: 0,
                                fill: "forwards",
                                pseudoElement: "::view-transition-group(" + a + ")"
                            })
                        }
                    null !== (e = 9 === (e = t.containerInfo).nodeType ? e.documentElement : e.ownerDocument.documentElement) && "" === e.style.viewTransitionName && (e.style.viewTransitionName = "none", e.animate({
                        opacity: [0, 0],
                        pointerEvents: ["none", "none"]
                    }, {
                        duration: 0,
                        fill: "forwards",
                        pseudoElement: "::view-transition-group(root)"
                    }), e.animate({
                        width: [0, 0],
                        height: [0, 0]
                    }, {
                        duration: 0,
                        fill: "forwards",
                        pseudoElement: "::view-transition"
                    })), l2 = !0
                }
                lD = null;
                break;
            case 5:
            default:
                sl(t, e);
                break;
            case 4:
                r = lJ, lJ = !1, sl(t, e), lJ && (l1 = !0), lJ = r;
                break;
            case 22:
                null === e.memoizedState && (null !== n.memoizedState ? lB(e, !1) : sl(t, e));
                break;
            case 30:
                r = lJ, a = lM(), lJ = !1, sl(t, e), lJ && (e.flags |= 4);
                var i = e.memoizedProps,
                    o = e.stateNode;
                t = rr(i, o), o = rr(n.memoizedProps, o);
                var l = ri(i.default, i.update);
                "none" === l ? t = !1 : (i = n.memoizedState, n.memoizedState = null, n = e.child, lz = 0, t = lK(e, n, t, o, l, i, !0), lz !== (null === i ? 0 : i.length) && (e.flags |= 32)), 0 != (4 & e.flags) && t ? (s6(e, e.memoizedProps.onUpdate), lD = a) : null !== a && (a.push.apply(a, lD), lD = a), lJ = 0 != (32 & e.flags) || r
        }
    }

    function su(e, t) {
        if (8772 & t.subtreeFlags)
            for (t = t.child; null !== t;) l3(e, t.alternate, t), t = t.sibling
    }

    function sc(e, t) {
        var n = null;
        null !== e && null !== e.memoizedState && null !== e.memoizedState.cachePool && (n = e.memoizedState.cachePool.pool), e = null, null !== t.memoizedState && null !== t.memoizedState.cachePool && (e = t.memoizedState.cachePool.pool), e !== n && (null != e && e.refCount++, null != n && ac(n))
    }

    function sd(e, t) {
        e = null, null !== t.alternate && (e = t.alternate.memoizedState.cache), (t = t.memoizedState.cache) !== e && (t.refCount++, null != e && ac(e))
    }

    function sf(e, t, n, r) {
        var a = (0x13ffff00 & n) === n;
        if (t.subtreeFlags & (a ? 10262 : 10256))
            for (t = t.child; null !== t;) sp(e, t, n, r), t = t.sibling;
        else a && function e(t) {
            for (t = t.child; null !== t;) 30 === t.tag ? lj(t.child, !1) : 0 != (0x2000000 & t.subtreeFlags) && e(t), t = t.sibling
        }(t)
    }

    function sp(e, t, n, r) {
        var a = (0x13ffff00 & n) === n;
        a && null === t.alternate && null !== t.return && null !== t.return.alternate && lW(t);
        var i = t.flags;
        switch (t.tag) {
            case 0:
            case 11:
            case 15:
                sf(e, t, n, r), 2048 & i && lv(9, t);
                break;
            case 1:
            case 31:
            case 13:
            default:
                sf(e, t, n, r);
                break;
            case 3:
                sf(e, t, n, r), a && l2 && ("root" === (e = 9 === (e = e.containerInfo).nodeType ? e.body : "HTML" === e.nodeName ? e.ownerDocument.body : e).style.viewTransitionName && (e.style.viewTransitionName = ""), null !== (e = e.ownerDocument.documentElement) && "none" === e.style.viewTransitionName && (e.style.viewTransitionName = "")), 2048 & i && (i = null, null !== t.alternate && (i = t.alternate.memoizedState.cache), (t = t.memoizedState.cache) !== i && (t.refCount++, null != i && ac(i)));
                break;
            case 12:
                if (2048 & i) {
                    sf(e, t, n, r), i = t.stateNode;
                    try {
                        var o = t.memoizedProps,
                            l = o.id,
                            s = o.onPostCommit;
                        "function" == typeof s && s(l, null === t.alternate ? "mount" : "update", i.passiveEffectDuration, -0)
                    } catch (e) {
                        uN(t, t.return, e)
                    }
                } else sf(e, t, n, r);
                break;
            case 23:
                break;
            case 22:
                o = t.stateNode, l = t.alternate, null !== t.memoizedState ? (a && null !== l && null === l.memoizedState && lW(l), 2 & o._visibility ? sf(e, t, n, r) : sh(e, t)) : (a && null !== l && null !== l.memoizedState && lW(t), 2 & o._visibility ? sf(e, t, n, r) : (o._visibility |= 2, function e(t, n, r, a, i) {
                    for (i = i && 0 != (10256 & n.subtreeFlags), n = n.child; null !== n;) {
                        var o = n,
                            l = o.flags;
                        switch (o.tag) {
                            case 0:
                            case 11:
                            case 15:
                                e(t, o, r, a, i), lv(8, o);
                                break;
                            case 23:
                                break;
                            case 22:
                                var s = o.stateNode;
                                null !== o.memoizedState ? 2 & s._visibility ? e(t, o, r, a, i) : sh(t, o) : (s._visibility |= 2, e(t, o, r, a, i)), i && 2048 & l && sc(o.alternate, o);
                                break;
                            case 24:
                                e(t, o, r, a, i), i && 2048 & l && sd(o.alternate, o);
                                break;
                            default:
                                e(t, o, r, a, i)
                        }
                        n = n.sibling
                    }
                }(e, t, n, r, 0 != (10256 & t.subtreeFlags)))), 2048 & i && sc(l, t);
                break;
            case 24:
                sf(e, t, n, r), 2048 & i && sd(t.alternate, t);
                break;
            case 30:
                a && null !== (i = t.alternate) && (lj(i.child, !0), lj(t.child, !0)), sf(e, t, n, r)
        }
    }

    function sh(e, t) {
        if (10256 & t.subtreeFlags)
            for (t = t.child; null !== t;) {
                var n = t,
                    r = n.flags;
                switch (n.tag) {
                    case 22:
                        sh(e, n), 2048 & r && sc(n.alternate, n);
                        break;
                    case 24:
                        sh(e, n), 2048 & r && sd(n.alternate, n);
                        break;
                    default:
                        sh(e, n)
                }
                t = t.sibling
            }
    }
    var sm = 8192;

    function sg(e, t, n) {
        if (e.subtreeFlags & sm)
            for (e = e.child; null !== e;) sv(e, t, n), e = e.sibling
    }

    function sv(e, t, n) {
        switch (e.tag) {
            case 26:
                sg(e, t, n), e.flags & sm && (null !== e.memoizedState ? function(e, t, n, r) {
                    if ("stylesheet" === n.type && ("string" != typeof r.media || !1 !== matchMedia(r.media).matches) && 0 == (4 & n.state.loading)) {
                        if (null === n.instance) {
                            var a = c9(r.href),
                                i = t.querySelector(c6(a));
                            if (i) {
                                null !== (t = i._p) && "object" == typeof t && "function" == typeof t.then && (e.count++, e = dg.bind(e), t.then(e, e)), n.state.loading |= 4, n.instance = i, e5(i);
                                return
                            }
                            i = t.ownerDocument || t, r = c7(r), (a = c0.get(a)) && da(r, a), e5(i = i.createElement("link"));
                            var o = i;
                            o._p = new Promise(function(e, t) {
                                o.onload = e, o.onerror = t
                            }), ci(i, "link", r), n.instance = i
                        }
                        null === e.stylesheets && (e.stylesheets = new Map), e.stylesheets.set(n, t), (t = n.state.preload) && 0 == (3 & n.state.loading) && (e.count++, n = dg.bind(e), t.addEventListener("load", n), t.addEventListener("error", n))
                    }
                }(n, sa, e.memoizedState, e.memoizedProps) : (e = e.stateNode, (0x13ffff40 & t) === t && dp(n, e)));
                break;
            case 5:
                sg(e, t, n), e.flags & sm && (e = e.stateNode, (0x13ffff40 & t) === t && dp(n, e));
                break;
            case 3:
            case 4:
                var r = sa;
                sa = c2(e.stateNode.containerInfo), sg(e, t, n), sa = r;
                break;
            case 22:
                null === e.memoizedState && (null !== (r = e.alternate) && null !== r.memoizedState ? (r = sm, sm = 0x1000000, sg(e, t, n), sm = r) : sg(e, t, n));
                break;
            case 30:
                if (0 != (e.flags & sm) && null != (r = e.memoizedProps.name) && "auto" !== r) {
                    var a = e.stateNode;
                    a.paired = null, null === lA && (lA = new Map), lA.set(r, a)
                }
                sg(e, t, n);
                break;
            default:
                sg(e, t, n)
        }
    }

    function sy(e) {
        var t = e.alternate;
        if (null !== t && null !== (e = t.child)) {
            t.child = null;
            do t = e.sibling, e.sibling = null, e = t; while (null !== e)
        }
    }

    function sb(e) {
        var t = e.deletions;
        if (0 != (16 & e.flags)) {
            if (null !== t)
                for (var n = 0; n < t.length; n++) {
                    var r = t[n];
                    lX = r, s_(r, e)
                }
            sy(e)
        }
        if (10256 & e.subtreeFlags)
            for (e = e.child; null !== e;) sw(e), e = e.sibling
    }

    function sw(e) {
        switch (e.tag) {
            case 0:
            case 11:
            case 15:
                sb(e), 2048 & e.flags && ly(9, e, e.return);
                break;
            case 3:
            case 12:
            default:
                sb(e);
                break;
            case 22:
                var t = e.stateNode;
                null !== e.memoizedState && 2 & t._visibility && (null === e.return || 13 !== e.return.tag) ? (t._visibility &= -3, function e(t) {
                    var n = t.deletions;
                    if (0 != (16 & t.flags)) {
                        if (null !== n)
                            for (var r = 0; r < n.length; r++) {
                                var a = n[r];
                                lX = a, s_(a, t)
                            }
                        sy(t)
                    }
                    for (t = t.child; null !== t;) {
                        switch ((n = t).tag) {
                            case 0:
                            case 11:
                            case 15:
                                ly(8, n, n.return), e(n);
                                break;
                            case 22:
                                2 & (r = n.stateNode)._visibility && (r._visibility &= -3, e(n));
                                break;
                            default:
                                e(n)
                        }
                        t = t.sibling
                    }
                }(e)) : sb(e)
        }
    }

    function s_(e, t) {
        for (; null !== lX;) {
            var n = lX;
            switch (n.tag) {
                case 0:
                case 11:
                case 15:
                    ly(8, n, t);
                    break;
                case 23:
                case 22:
                    if (null !== n.memoizedState && null !== n.memoizedState.cachePool) {
                        var r = n.memoizedState.cachePool.pool;
                        null != r && r.refCount++
                    }
                    break;
                case 24:
                    ac(n.memoizedState.cache)
            }
            if (null !== (r = n.child)) r.return = n, lX = r;
            else
                for (n = e; null !== lX;) {
                    var a = (r = lX).sibling,
                        i = r.return;
                    if (! function e(t) {
                            var n = t.alternate;
                            null !== n && (t.alternate = null, e(n)), t.child = null, t.deletions = null, t.sibling = null, 5 === t.tag && null !== (n = t.stateNode) && e0(n), t.stateNode = null, t.return = null, t.dependencies = null, t.memoizedProps = null, t.memoizedState = null, t.pendingProps = null, t.stateNode = null, t.updateQueue = null
                        }(r), r === n) {
                        lX = null;
                        break
                    }
                    if (null !== a) {
                        a.return = i, lX = a;
                        break
                    }
                    lX = i
                }
        }
    }
    var sS = {
            getCacheForType: function(e) {
                var t = an(as),
                    n = t.data.get(e);
                return void 0 === n && (n = e(), t.data.set(e, n)), n
            },
            cacheSignal: function() {
                return an(as).controller.signal
            }
        },
        sk = "function" == typeof WeakMap ? WeakMap : Map,
        sx = 0,
        sE = null,
        sT = null,
        sN = 0,
        sC = 0,
        sO = null,
        sR = !1,
        sP = !1,
        sI = !1,
        sA = 0,
        sL = 0,
        sD = 0,
        sM = 0,
        sz = 0,
        sF = 0,
        sj = 0,
        sU = null,
        sB = null,
        sq = !1,
        s$ = 0,
        sV = 0,
        sW = 1 / 0,
        sK = null,
        sH = null,
        sZ = 0,
        sG = null,
        sQ = null,
        sY = 0,
        sX = 0,
        sJ = null,
        s0 = null,
        s1 = null,
        s2 = null,
        s4 = null,
        s3 = 0,
        s5 = null;

    function s8() {
        return 0 != (2 & sx) && 0 !== sN ? sN & -sN : null !== K.T ? uK() : e$()
    }

    function s9() {
        if (0 === sF)
            if (0 == (0x20000000 & sN) || rW) {
                var e = eR;
                0 == (3932160 & (eR <<= 1)) && (eR = 262144), sF = e
            } else sF = 0x20000000;
        return null !== (e = a3.current) && (e.flags |= 32), sF
    }

    function s6(e, t) {
        if (null != t) {
            var n = e.stateNode,
                r = n.ref;
            null === r && (r = n.ref = cO(rr(e.memoizedProps, n))), null === s2 && (s2 = []), s2.push(t.bind(null, r))
        }
    }

    function s7(e, t, n) {
        (e === sE && (2 === sC || 9 === sC) || null !== e.cancelPendingCommit) && (ui(e, 0), un(e, sN, sF, !1)), ez(e, n), (0 == (2 & sx) || e !== sE) && (e === sE && (0 == (2 & sx) && (sM |= n), 4 === sL && un(e, sN, sF, !1)), uj(e))
    }

    function ue(e, t, n) {
        if (0 != (6 & sx)) throw Error(s(327));
        for (var r = !n && 0 == (127 & t) && 0 == (t & e.expiredLanes) || eL(e, t), a = r ? function(e, t) {
                var n = sx;
                sx |= 2;
                var r = us(),
                    a = uu();
                sE !== e || sN !== t ? (sK = null, sW = ev() + 500, ui(e, t)) : sP = eL(e, t);
                e: for (;;) try {
                    if (0 !== sC && null !== sT) {
                        t = sT;
                        var i = sO;
                        t: switch (sC) {
                            case 1:
                                sC = 0, sO = null, uh(e, t, i, 1);
                                break;
                            case 2:
                            case 9:
                                if (aN(i)) {
                                    sC = 0, sO = null, up(t);
                                    break
                                }
                                t = function() {
                                    2 !== sC && 9 !== sC || sE !== e || (sC = 7), uj(e)
                                }, i.then(t, t);
                                break e;
                            case 3:
                                sC = 7;
                                break e;
                            case 4:
                                sC = 5;
                                break e;
                            case 7:
                                aN(i) ? (sC = 0, sO = null, up(t)) : (sC = 0, sO = null, uh(e, t, i, 7));
                                break;
                            case 5:
                                var o = null;
                                switch (sT.tag) {
                                    case 26:
                                        o = sT.memoizedState;
                                    case 5:
                                    case 27:
                                        var l = sT;
                                        if (o ? dd(o) : l.stateNode.complete) {
                                            sC = 0, sO = null;
                                            var u = l.sibling;
                                            if (null !== u) sT = u;
                                            else {
                                                var c = l.return;
                                                null !== c ? (sT = c, um(c)) : sT = null
                                            }
                                            break t
                                        }
                                }
                                sC = 0, sO = null, uh(e, t, i, 5);
                                break;
                            case 6:
                                sC = 0, sO = null, uh(e, t, i, 6);
                                break;
                            case 8:
                                ua(), sL = 6;
                                break e;
                            default:
                                throw Error(s(462))
                        }
                    }
                    for (; null !== sT && !em();) uf(sT);
                    break
                } catch (t) {
                    uo(e, t)
                }
                return (r3 = r4 = null, K.H = r, K.A = a, sx = n, null !== sT) ? 0 : (sE = null, sN = 0, rc(), sL)
            }(e, t) : ud(e, t, !0), i = r;;) {
            if (0 === a) sP && !r && un(e, t, 0, !1);
            else {
                if (n = e.current.alternate, i && ! function(e) {
                        for (var t = e;;) {
                            var n = t.tag;
                            if ((0 === n || 11 === n || 15 === n) && 16384 & t.flags && null !== (n = t.updateQueue) && null !== (n = n.stores))
                                for (var r = 0; r < n.length; r++) {
                                    var a = n[r],
                                        i = a.getSnapshot;
                                    a = a.value;
                                    try {
                                        if (!nj(i(), a)) return !1
                                    } catch (e) {
                                        return !1
                                    }
                                }
                            if (n = t.child, 16384 & t.subtreeFlags && null !== n) n.return = t, t = n;
                            else {
                                if (t === e) break;
                                for (; null === t.sibling;) {
                                    if (null === t.return || t.return === e) return !0;
                                    t = t.return
                                }
                                t.sibling.return = t.return, t = t.sibling
                            }
                        }
                        return !0
                    }(n)) {
                    a = ud(e, t, !1), i = !1;
                    continue
                }
                if (2 === a) {
                    if (i = t, e.errorRecoveryDisabledLanes & i) var o = 0;
                    else o = 0 != (o = -0x20000001 & e.pendingLanes) ? o : 0x20000000 & o ? 0x20000000 : 0;
                    if (0 !== o) {
                        t = o;
                        e: {
                            a = sU;
                            var l = e.current.memoizedState.isDehydrated;
                            if (l && (ui(e, o).flags |= 256), 2 !== (o = ud(e, o, !1))) {
                                if (sI && !l) {
                                    e.errorRecoveryDisabledLanes |= i, sM |= i, a = 4;
                                    break e
                                }
                                i = sB, sB = a, null !== i && (null === sB ? sB = i : sB.push.apply(sB, i))
                            }
                            a = o
                        }
                        if (i = !1, 2 !== a) continue
                    }
                }
                if (1 === a) {
                    ui(e, 0), un(e, t, 0, !0);
                    break
                }
                e: {
                    switch (r = e, i = a) {
                        case 0:
                        case 1:
                            throw Error(s(345));
                        case 4:
                            if ((4194048 & t) !== t && (0x3c00000 & t) !== t) break;
                        case 6:
                            un(r, t, sF, !sR);
                            break e;
                        case 2:
                            sB = null;
                            break;
                        case 3:
                        case 5:
                            break;
                        default:
                            throw Error(s(329))
                    }
                    if ((0x3c00000 & t) === t && 10 < (a = s$ + 300 - ev())) {
                        if (un(r, t, sF, !sR), 0 !== eA(r, 0, !0)) break e;
                        sY = t, r.timeoutHandle = ch(ut.bind(null, r, n, sB, sK, sq, t, sF, sM, sj, sR, i, "Throttled", -0, 0), a);
                        break e
                    }
                    ut(r, n, sB, sK, sq, t, sF, sM, sj, sR, i, null, -0, 0)
                }
            }
            break
        }
        uj(e)
    }

    function ut(e, t, n, r, a, i, o, l, s, u, c, d, f, p) {
        e.timeoutHandle = -1;
        var h, m, g = t.subtreeFlags,
            v = (0x13ffff00 & i) === i;
        if (d = null, (v || 8192 & g || 0x1002000 == (0x1002000 & g)) && (lA = null, sv(t, i, d = {
                stylesheets: null,
                count: 0,
                imgCount: 0,
                imgBytes: 0,
                suspenseyImages: [],
                waitingForImages: !0,
                waitingForViewTransition: !1,
                unsuspend: tO
            }), v && (g = d, null != (v = (9 === (v = e.containerInfo).nodeType ? v : v.ownerDocument).__reactViewTransition) && (g.count++, g.waitingForViewTransition = !0, g = dg.bind(g), v.finished.then(g, g))), null !== (h = d, m = g = (0x3c00000 & i) === i ? s$ - ev() : (4194048 & i) === i ? sV - ev() : 0, h.stylesheets && 0 === h.count && db(h, h.stylesheets), g = 0 < h.count || 0 < h.imgCount ? function(e) {
                var t = setTimeout(function() {
                    if (h.stylesheets && db(h, h.stylesheets), h.unsuspend) {
                        var e = h.unsuspend;
                        h.unsuspend = null, e()
                    }
                }, 6e4 + m);
                0 < h.imgBytes && 0 === dh && (dh = 62500 * function() {
                    if ("function" == typeof performance.getEntriesByType) {
                        for (var e = 0, t = 0, n = performance.getEntriesByType("resource"), r = 0; r < n.length; r++) {
                            var a = n[r],
                                i = a.transferSize,
                                o = a.initiatorType,
                                l = a.duration;
                            if (i && l && co(o)) {
                                for (o = 0, l = a.responseEnd, r += 1; r < n.length; r++) {
                                    var s = n[r],
                                        u = s.startTime;
                                    if (u > l) break;
                                    var c = s.transferSize,
                                        d = s.initiatorType;
                                    c && co(d) && (o += c * ((s = s.responseEnd) < l ? 1 : (l - u) / (s - u)))
                                }
                                if (--r, t += 8 * (i + o) / (a.duration / 1e3), 10 < ++e) break
                            }
                        }
                        if (0 < e) return t / e / 1e6
                    }
                    return navigator.connection && "number" == typeof(e = navigator.connection.downlink) ? e : 5
                }());
                var n = setTimeout(function() {
                    if (h.waitingForImages = !1, 0 === h.count && (h.stylesheets && db(h, h.stylesheets), h.unsuspend)) {
                        var e = h.unsuspend;
                        h.unsuspend = null, e()
                    }
                }, (h.imgBytes > dh ? 50 : 800) + m);
                return h.unsuspend = e,
                    function() {
                        h.unsuspend = null, clearTimeout(t), clearTimeout(n)
                    }
            } : null))) {
            sY = i, e.cancelPendingCommit = g(uv.bind(null, e, t, i, n, r, a, o, l, s, u, c, d, null, f, p)), un(e, i, o, !u);
            return
        }
        uv(e, t, i, n, r, a, o, l, s, u, c, d)
    }

    function un(e, t, n, r) {
        t &= ~sz, t &= ~sM, e.suspendedLanes |= t, e.pingedLanes &= ~t, r && (e.warmLanes |= t), r = e.expirationTimes;
        for (var a = t; 0 < a;) {
            var i = 31 - eT(a),
                o = 1 << i;
            r[i] = -1, a &= ~o
        }
        0 !== n && eF(e, n, t)
    }

    function ur() {
        return 0 != (6 & sx) || (uU(0, !1), !1)
    }

    function ua() {
        if (null !== sT) {
            if (0 === sC) var e = sT.return;
            else e = sT, r3 = r4 = null, iT(e), aA = null, aL = 0, e = sT;
            for (; null !== e;) lg(e.alternate, e), e = e.return;
            sT = null
        }
    }

    function ui(e, t) {
        var n = e.timeoutHandle; - 1 !== n && (e.timeoutHandle = -1, cm(n)), null !== (n = e.cancelPendingCommit) && (e.cancelPendingCommit = null, n()), sY = 0, ua(), sE = e, sT = n = rw(e.current, null), sN = t, sC = 0, sO = null, sR = !1, sP = eL(e, t), sI = !1, sj = sF = sz = sM = sD = sL = 0, sB = sU = null, sq = !1, 0 != (8 & t) && (t |= 32 & t);
        var r = e.entangledLanes;
        if (0 !== r)
            for (e = e.entanglements, r &= t; 0 < r;) {
                var a = 31 - eT(r),
                    i = 1 << a;
                t |= e[a], r &= ~i
            }
        return sA = t, rc(), n
    }

    function uo(e, t) {
        il = null, K.H = oE, t === ak || t === aE ? (t = aP(), sC = 3) : t === ax ? (t = aP(), sC = 4) : sC = t === oq ? 8 : null !== t && "object" == typeof t && "function" == typeof t.then ? 6 : 1, sO = t, null === sT && (sL = 1, oz(e, rC(t, e.current)))
    }

    function ul() {
        var e = a3.current;
        return null === e || ((4194048 & sN) === sN ? null === a5 : ((0x3c00000 & sN) === sN || 0 != (0x20000000 & sN)) && e === a5)
    }

    function us() {
        var e = K.H;
        return K.H = oE, null === e ? oE : e
    }

    function uu() {
        var e = K.A;
        return K.A = sS, e
    }

    function uc() {
        sL = 4, sR || (4194048 & sN) !== sN && null !== a3.current || (sP = !0), 0 == (0x7ffffff & sD) && 0 == (0x7ffffff & sM) || null === sE || un(sE, sN, sF, !1)
    }

    function ud(e, t, n) {
        var r = sx;
        sx |= 2;
        var a = us(),
            i = uu();
        (sE !== e || sN !== t) && (sK = null, ui(e, t)), t = !1;
        var o = sL;
        e: for (;;) try {
            if (0 !== sC && null !== sT) {
                var l = sT,
                    s = sO;
                switch (sC) {
                    case 8:
                        ua(), o = 6;
                        break e;
                    case 3:
                    case 2:
                    case 9:
                    case 6:
                        null === a3.current && (t = !0);
                        var u = sC;
                        if (sC = 0, sO = null, uh(e, l, s, u), n && sP) {
                            o = 0;
                            break e
                        }
                        break;
                    default:
                        u = sC, sC = 0, sO = null, uh(e, l, s, u)
                }
            }(function() {
                for (; null !== sT;) uf(sT)
            })(), o = sL;
            break
        } catch (t) {
            uo(e, t)
        }
        return t && e.shellSuspendCounter++, r3 = r4 = null, sx = r, K.H = a, K.A = i, null === sT && (sE = null, sN = 0, rc()), o
    }

    function uf(e) {
        var t = lu(e.alternate, e, sA);
        e.memoizedProps = e.pendingProps, null === t ? um(e) : sT = t
    }

    function up(e) {
        var t = e,
            n = t.alternate;
        switch (t.tag) {
            case 15:
            case 0:
                t = o1(n, t, t.pendingProps, t.type, void 0, sN);
                break;
            case 11:
                t = o1(n, t, t.pendingProps, t.type.render, t.ref, sN);
                break;
            case 5:
                iT(t);
                var r = t;
                r === r$ && (rW ? (rY(r), 5 === r.tag && null != r.stateNode && (rV = r.stateNode)) : (rY(r), rW = !0));
            default:
                lg(n, t), t = lu(n, t = sT = r_(t, sA), sA)
        }
        e.memoizedProps = e.pendingProps, null === t ? um(e) : sT = t
    }

    function uh(e, t, n, r) {
        r3 = r4 = null, iT(t), aA = null, aL = 0;
        var a = t.return;
        try {
            if (function(e, t, n, r, a) {
                    if (n.flags |= 32768, null !== r && "object" == typeof r && "function" == typeof r.then) {
                        if (null !== (t = n.alternate) && r7(t, n, a, !0), null !== (n = a3.current)) {
                            switch (n.tag) {
                                case 31:
                                case 13:
                                case 19:
                                    return null === a5 ? uc() : null === n.alternate && 0 === sL && (sL = 3), n.flags &= -257, n.flags |= 65536, n.lanes = a, r === aT ? n.flags |= 16384 : (null === (t = n.updateQueue) ? n.updateQueue = new Set([r]) : t.add(r), uC(e, r, a)), !1;
                                case 22:
                                    return n.flags |= 65536, r === aT ? n.flags |= 16384 : (null === (t = n.updateQueue) ? (t = {
                                        transitions: null,
                                        markerInstances: null,
                                        retryQueue: new Set([r])
                                    }, n.updateQueue = t) : null === (n = t.retryQueue) ? t.retryQueue = new Set([r]) : n.add(r), uC(e, r, a)), !1
                            }
                            throw Error(s(435, n.tag))
                        }
                        return uC(e, r, a), uc(), !1
                    }
                    if (rW) return null !== (t = a3.current) ? (0 == (65536 & t.flags) && (t.flags |= 256), t.flags |= 65536, t.lanes = a, r !== rZ && r1(rC(e = Error(s(422), {
                        cause: r
                    }), n))) : (r !== rZ && r1(rC(t = Error(s(423), {
                        cause: r
                    }), n)), e = e.current.alternate, e.flags |= 65536, a &= -a, e.lanes |= a, r = rC(r, n), a = oj(e.stateNode, r, a), aH(e, a), 4 !== sL && (sL = 2)), !1;
                    var i = Error(s(520), {
                        cause: r
                    });
                    if (i = rC(i, n), null === sU ? sU = [i] : sU.push(i), 4 !== sL && (sL = 2), null === t) return !0;
                    r = rC(r, n), n = t;
                    do {
                        switch (n.tag) {
                            case 3:
                                return n.flags |= 65536, e = a & -a, n.lanes |= e, e = oj(n.stateNode, r, e), aH(n, e), !1;
                            case 1:
                                if (t = n.type, i = n.stateNode, 0 == (128 & n.flags) && ("function" == typeof t.getDerivedStateFromError || null !== i && "function" == typeof i.componentDidCatch && (null === sH || !sH.has(i)))) return n.flags |= 65536, a &= -a, n.lanes |= a, oB(a = oU(a), e, n, r), aH(n, a), !1;
                                break;
                            case 22:
                                if (null !== n.memoizedState) return n.flags |= 65536, !1
                        }
                        n = n.return
                    } while (null !== n) return !1
                }(e, a, t, n, sN)) {
                sL = 1, oz(e, rC(n, e.current)), sT = null;
                return
            }
        } catch (t) {
            if (null !== a) throw sT = a, t;
            sL = 1, oz(e, rC(n, e.current)), sT = null;
            return
        }
        32768 & t.flags ? (rW || 1 === r ? e = !0 : sP || 0 != (0x20000000 & sN) ? e = !1 : (sR = e = !0, (2 === r || 9 === r || 3 === r || 6 === r) && null !== (r = a3.current) && 13 === r.tag && (r.flags |= 16384)), ug(t, e)) : um(t)
    }

    function um(e) {
        var t = e;
        do {
            if (0 != (32768 & t.flags)) return void ug(t, sR);
            e = t.return;
            var n = function(e, t, n) {
                var r = t.pendingProps;
                switch (rB(t), t.tag) {
                    case 16:
                    case 15:
                    case 0:
                    case 11:
                    case 7:
                    case 8:
                    case 12:
                    case 9:
                    case 14:
                    case 1:
                        return lm(t), null;
                    case 3:
                        return n = t.stateNode, r = null, null !== e && (r = e.memoizedState.cache), t.memoizedState.cache !== r && (t.flags |= 2048), r8(as), ei(), n.pendingContext && (n.context = n.pendingContext, n.pendingContext = null), (null === e || null === e.child) && (rX(t) ? lc(t) : null === e || e.memoizedState.isDehydrated && 0 == (256 & t.flags) || (t.flags |= 1024, r0())), lm(t), null;
                    case 26:
                        var a = t.type,
                            i = t.memoizedState;
                        return null === e ? (lc(t), null !== i ? (lm(t), lf(t, i)) : (lm(t), ld(t, a, null, r, n))) : i ? i !== e.memoizedState ? (lc(t), lm(t), lf(t, i)) : (lm(t), t.flags &= -0x1000001) : ((e = e.memoizedProps) !== r && lc(t), lm(t), ld(t, a, e, r, n)), null;
                    case 27:
                        if (el(t), n = en.current, a = t.type, null !== e && null != t.stateNode) e.memoizedProps !== r && lc(t);
                        else {
                            if (!r) {
                                if (null === t.stateNode) throw Error(s(166));
                                return lm(t), t.subtreeFlags &= -0x2000001, null
                            }
                            e = ee.current, rX(t) ? rQ(t, e) : (t.stateNode = e = cX(a, r, n), lc(t))
                        }
                        return lm(t), t.subtreeFlags &= -0x2000001, null;
                    case 5:
                        if (el(t), a = t.type, null !== e && null != t.stateNode) e.memoizedProps !== r && lc(t);
                        else {
                            if (!r) {
                                if (null === t.stateNode) throw Error(s(166));
                                return lm(t), t.subtreeFlags &= -0x2000001, null
                            }
                            if (i = ee.current, rX(t)) rQ(t, i);
                            else {
                                var o = cu(en.current);
                                switch (i) {
                                    case 1:
                                        i = o.createElementNS("http://www.w3.org/2000/svg", a);
                                        break;
                                    case 2:
                                        i = o.createElementNS("http://www.w3.org/1998/Math/MathML", a);
                                        break;
                                    default:
                                        switch (a) {
                                            case "svg":
                                                i = o.createElementNS("http://www.w3.org/2000/svg", a);
                                                break;
                                            case "math":
                                                i = o.createElementNS("http://www.w3.org/1998/Math/MathML", a);
                                                break;
                                            case "script":
                                                (i = o.createElement("div")).innerHTML = "<script></script>", i = i.removeChild(i.firstChild);
                                                break;
                                            case "select":
                                                i = "string" == typeof r.is ? o.createElement("select", {
                                                    is: r.is
                                                }) : o.createElement("select"), r.multiple ? i.multiple = !0 : r.size && (i.size = r.size);
                                                break;
                                            default:
                                                i = "string" == typeof r.is ? o.createElement(a, {
                                                    is: r.is
                                                }) : o.createElement(a)
                                        }
                                }
                                i[eK] = t, i[eH] = r;
                                e: for (o = t.child; null !== o;) {
                                    if (5 === o.tag || 6 === o.tag) i.appendChild(o.stateNode);
                                    else if (4 !== o.tag && 27 !== o.tag && null !== o.child) {
                                        o.child.return = o, o = o.child;
                                        continue
                                    }
                                    if (o === t) break;
                                    for (; null === o.sibling;) {
                                        if (null === o.return || o.return === t) break e;
                                        o = o.return
                                    }
                                    o.sibling.return = o.return, o = o.sibling
                                }
                                switch (t.stateNode = i, ci(i, a, r), a) {
                                    case "button":
                                    case "input":
                                    case "select":
                                    case "textarea":
                                        r = !!r.autoFocus;
                                        break;
                                    case "img":
                                        r = !0;
                                        break;
                                    default:
                                        r = !1
                                }
                                r && lc(t)
                            }
                        }
                        return lm(t), t.subtreeFlags &= -0x2000001, ld(t, t.type, null === e ? null : e.memoizedProps, t.pendingProps, n), null;
                    case 6:
                        if (e && null != t.stateNode) e.memoizedProps !== r && lc(t);
                        else {
                            if ("string" != typeof r && null === t.stateNode) throw Error(s(166));
                            if (e = en.current, rX(t)) {
                                if (e = t.stateNode, n = t.memoizedProps, r = null, null !== (a = r$)) switch (a.tag) {
                                    case 27:
                                    case 5:
                                        r = a.memoizedProps
                                }
                                e[eK] = t, (e = !!(e.nodeValue === n || null !== r && !0 === r.suppressHydrationWarning || cn(e.nodeValue, n))) || rG(t, !0)
                            } else(e = cu(e).createTextNode(r))[eK] = t, t.stateNode = e
                        }
                        return lm(t), null;
                    case 31:
                        if (n = t.memoizedState, null === e || null !== e.memoizedState) {
                            if (r = rX(t), null !== n) {
                                if (null === e) {
                                    if (!r) throw Error(s(318));
                                    if (!(e = null !== (e = t.memoizedState) ? e.dehydrated : null)) throw Error(s(557));
                                    e[eK] = t
                                } else rJ(), 0 == (128 & t.flags) && (t.memoizedState = null), t.flags |= 4;
                                lm(t), e = !1
                            } else n = r0(), null !== e && null !== e.memoizedState && (e.memoizedState.hydrationErrors = n), e = !0;
                            if (!e) {
                                if (256 & t.flags) return ie(t), t;
                                return ie(t), null
                            }
                            if (0 != (128 & t.flags)) throw Error(s(558))
                        }
                        return lm(t), null;
                    case 13:
                        if (r = t.memoizedState, null === e || null !== e.memoizedState && null !== e.memoizedState.dehydrated) {
                            if (a = rX(t), null !== r && null !== r.dehydrated) {
                                if (null === e) {
                                    if (!a) throw Error(s(318));
                                    if (!(a = null !== (a = t.memoizedState) ? a.dehydrated : null)) throw Error(s(317));
                                    a[eK] = t
                                } else rJ(), 0 == (128 & t.flags) && (t.memoizedState = null), t.flags |= 4;
                                lm(t), a = !1
                            } else a = r0(), null !== e && null !== e.memoizedState && (e.memoizedState.hydrationErrors = a), a = !0;
                            if (!a) {
                                if (256 & t.flags) return ie(t), t;
                                return ie(t), null
                            }
                        }
                        if (ie(t), 0 != (128 & t.flags)) return t.lanes = n, t;
                        return n = null !== r, e = null !== e && null !== e.memoizedState, n && (r = t.child, a = null, null !== r.alternate && null !== r.alternate.memoizedState && null !== r.alternate.memoizedState.cachePool && (a = r.alternate.memoizedState.cachePool.pool), i = null, null !== r.memoizedState && null !== r.memoizedState.cachePool && (i = r.memoizedState.cachePool.pool), i !== a && (r.flags |= 2048)), n !== e && n && (t.child.flags |= 8192), lp(t, t.updateQueue), lm(t), null;
                    case 4:
                        return ei(), null === e && u2(t.stateNode.containerInfo), t.flags |= 0x4000000, lm(t), null;
                    case 10:
                        return r8(t.type), lm(t), null;
                    case 19:
                        if (ia(t), null === (r = t.memoizedState)) return lm(t), null;
                        if (a = 0 != (128 & t.flags), null === (i = r.rendering))
                            if (a) lh(r, !1);
                            else {
                                if (0 !== sL || null !== e && 0 != (128 & e.flags))
                                    for (e = t.child; null !== e;) {
                                        if (null !== (i = ii(e))) {
                                            for (t.flags |= 128, lh(r, !1), t.updateQueue = e = i.updateQueue, lp(t, e), t.subtreeFlags = 0, e = n, n = t.child; null !== n;) r_(n, e), n = n.sibling;
                                            return ir(t, 1 & it.current | 2), rW && rF(t, r.treeForkCount), t.child
                                        }
                                        e = e.sibling
                                    }
                                null !== r.tail && ev() > sW && (t.flags |= 128, a = !0, lh(r, !1), t.lanes = 4194304)
                            }
                        else {
                            if (!a)
                                if (null !== (e = ii(i))) {
                                    if (t.flags |= 128, a = !0, t.updateQueue = e = e.updateQueue, lp(t, e), lh(r, !0), null === r.tail && "collapsed" !== r.tailMode && "visible" !== r.tailMode && !i.alternate && !rW) return lm(t), null
                                } else 2 * ev() - r.renderingStartTime > sW && 0x20000000 !== n && (t.flags |= 128, a = !0, lh(r, !1), t.lanes = 4194304);
                            r.isBackwards ? (i.sibling = t.child, t.child = i) : (null !== (e = r.last) ? e.sibling = i : t.child = i, r.last = i)
                        }
                        if (null !== r.tail) {
                            e = r.tail;
                            e: {
                                for (n = e; null !== n;) {
                                    if (null !== n.alternate) {
                                        n = !1;
                                        break e
                                    }
                                    n = n.sibling
                                }
                                n = !0
                            }
                            return r.rendering = e, r.tail = e.sibling, r.renderingStartTime = ev(), e.sibling = null, i = it.current, i = a ? 1 & i | 2 : 1 & i, "visible" === r.tailMode || "collapsed" === r.tailMode || !n || rW ? ir(t, i) : (n = i, J(a3, t), J(it, n), null === a5 && (a5 = t)), rW && rF(t, r.treeForkCount), e
                        }
                        return lm(t), null;
                    case 22:
                    case 23:
                        return ie(t), a4(), r = null !== t.memoizedState, null !== e ? null !== e.memoizedState !== r && (t.flags |= 8192) : r && (t.flags |= 8192), r ? 0 != (0x20000000 & n) && 0 == (128 & t.flags) && (lm(t), 6 & t.subtreeFlags && (t.flags |= 8192)) : lm(t), null !== (n = t.updateQueue) && lp(t, n.retryQueue), n = null, null !== e && null !== e.memoizedState && null !== e.memoizedState.cachePool && (n = e.memoizedState.cachePool.pool), r = null, null !== t.memoizedState && null !== t.memoizedState.cachePool && (r = t.memoizedState.cachePool.pool), r !== n && (t.flags |= 2048), null !== e && X(ab), null;
                    case 24:
                        return n = null, null !== e && (n = e.memoizedState.cache), t.memoizedState.cache !== n && (t.flags |= 2048), r8(as), lm(t), null;
                    case 25:
                        return null;
                    case 30:
                        return t.flags |= 0x2000000, lm(t), null
                }
                throw Error(s(156, t.tag))
            }(t.alternate, t, sA);
            if (null !== n) {
                sT = n;
                return
            }
            if (null !== (t = t.sibling)) {
                sT = t;
                return
            }
            sT = t = e
        } while (null !== t) 0 === sL && (sL = 5)
    }

    function ug(e, t) {
        do {
            var n = function(e, t) {
                switch (rB(t), t.tag) {
                    case 1:
                        return 65536 & (e = t.flags) ? (t.flags = -65537 & e | 128, t) : null;
                    case 3:
                        return r8(as), ei(), 0 != (65536 & (e = t.flags)) && 0 == (128 & e) ? (t.flags = -65537 & e | 128, t) : null;
                    case 26:
                    case 27:
                    case 5:
                        return el(t), null;
                    case 31:
                        if (null !== t.memoizedState) {
                            if (ie(t), null === t.alternate) throw Error(s(340));
                            rJ()
                        }
                        return 65536 & (e = t.flags) ? (t.flags = -65537 & e | 128, t) : null;
                    case 13:
                        if (ie(t), null !== (e = t.memoizedState) && null !== e.dehydrated) {
                            if (null === t.alternate) throw Error(s(340));
                            rJ()
                        }
                        return 65536 & (e = t.flags) ? (t.flags = -65537 & e | 128, t) : null;
                    case 19:
                        return ia(t), 65536 & (e = t.flags) ? (t.flags = -65537 & e | 128, null !== (e = t.memoizedState) && (e.rendering = null, e.tail = null), t.flags |= 4, t) : null;
                    case 4:
                        return ei(), null;
                    case 10:
                        return r8(t.type), null;
                    case 22:
                    case 23:
                        return ie(t), a4(), null !== e && X(ab), 65536 & (e = t.flags) ? (t.flags = -65537 & e | 128, t) : null;
                    case 24:
                        return r8(as), null;
                    default:
                        return null
                }
            }(e.alternate, e);
            if (null !== n) {
                n.flags &= 32767, sT = n;
                return
            }
            if (null !== (n = e.return) && (n.flags |= 32768, n.subtreeFlags = 0, n.deletions = null), !t && null !== (e = e.sibling)) {
                sT = e;
                return
            }
            sT = e = n
        } while (null !== e) sL = 6, sT = null
    }

    function uv(e, t, n, r, a, i, o, l, u, c, d, f) {
        e.cancelPendingCommit = null;
        do ux(); while (0 !== sZ) if (0 != (6 & sx)) throw Error(s(327));
        if (null !== t) {
            if (t === e.current) throw Error(s(177));
            e === sE && (sT = sE = null, sN = 0), sQ = t, sG = e, sY = n, sJ = a, s0 = r,
                function(e, t, n, r, a, i, o) {
                    var l, s = t.lanes | t.childLanes;
                    if (sX = s, ! function(e, t, n, r, a, i) {
                            var o = e.pendingLanes;
                            e.pendingLanes = n, e.suspendedLanes = 0, e.pingedLanes = 0, e.warmLanes = 0, e.expiredLanes &= n, e.entangledLanes &= n, e.errorRecoveryDisabledLanes &= n, e.shellSuspendCounter = 0;
                            var l = e.entanglements,
                                s = e.expirationTimes,
                                u = e.hiddenUpdates;
                            for (n = o & ~n; 0 < n;) {
                                var c = 31 - eT(n),
                                    d = 1 << c;
                                l[c] = 0, s[c] = -1;
                                var f = u[c];
                                if (null !== f)
                                    for (u[c] = null, c = 0; c < f.length; c++) {
                                        var p = f[c];
                                        null !== p && (p.lane &= -0x20000001)
                                    }
                                n &= ~d
                            }
                            0 !== r && eF(e, r, 0), 0 !== i && 0 === a && 0 !== e.tag && (e.suspendedLanes |= i & ~(o & ~t))
                        }(e, n, s |= ru, r, a, i), s2 = null, (0x13ffff00 & n) === n ? (l = e.transitionTypes, e.transitionTypes = null, s4 = l, r = 10262) : (s4 = null, r = 10256), 0 != (t.subtreeFlags & r) || 0 != (t.flags & r) ? (e.callbackNode = null, e.callbackPriority = 0, ep(e_, function() {
                            return uE(), null
                        })) : (e.callbackNode = null, e.callbackPriority = 0), lI = !1, r = 0 != (13878 & t.flags), 0 != (13878 & t.subtreeFlags) || r) {
                        r = K.T, K.T = null, a = H.p, H.p = 2, i = sx, sx |= 4;
                        try {
                            ! function(e, t, n) {
                                if (e = e.containerInfo, cl = dO, nV(e = n$(e))) {
                                    if ("selectionStart" in e) var r = {
                                        start: e.selectionStart,
                                        end: e.selectionEnd
                                    };
                                    else e: {
                                        var a = (r = (r = e.ownerDocument) && r.defaultView || window).getSelection && r.getSelection();
                                        if (a && 0 !== a.rangeCount) {
                                            r = a.anchorNode;
                                            var i, o = a.anchorOffset,
                                                l = a.focusNode;
                                            a = a.focusOffset;
                                            try {
                                                r.nodeType, l.nodeType
                                            } catch (e) {
                                                r = null;
                                                break e
                                            }
                                            var s = 0,
                                                u = -1,
                                                c = -1,
                                                d = 0,
                                                f = 0,
                                                p = e,
                                                h = null;
                                            t: for (;;) {
                                                for (; p !== r || 0 !== o && 3 !== p.nodeType || (u = s + o), p !== l || 0 !== a && 3 !== p.nodeType || (c = s + a), 3 === p.nodeType && (s += p.nodeValue.length), null !== (i = p.firstChild);) h = p, p = i;
                                                for (;;) {
                                                    if (p === e) break t;
                                                    if (h === r && ++d === o && (u = s), h === l && ++f === a && (c = s), null !== (i = p.nextSibling)) break;
                                                    h = (p = h).parentNode
                                                }
                                                p = i
                                            }
                                            r = -1 === u || -1 === c ? null : {
                                                start: u,
                                                end: c
                                            }
                                        } else r = null
                                    }
                                    r = r || {
                                        start: 0,
                                        end: 0
                                    }
                                } else r = null;
                                for (cs = {
                                        focusedElem: e,
                                        selectionRange: r
                                    }, dO = !1, n = (0x13ffff00 & n) === n, lX = t, t = n ? 9270 : 1028; null !== lX;) {
                                    if (e = lX, n && null !== (r = e.deletions))
                                        for (o = 0; o < r.length; o++) n && l$(r[o]);
                                    if (null === e.alternate && 0 != (2 & e.flags)) n && lL(e), l4(n);
                                    else {
                                        if (22 === e.tag) {
                                            if (r = e.alternate, null !== e.memoizedState) {
                                                null !== r && null === r.memoizedState && n && l$(r), l4(n);
                                                continue
                                            } else if (null !== r && null !== r.memoizedState) {
                                                n && lL(e), l4(n);
                                                continue
                                            }
                                        }
                                        r = e.child, 0 != (e.subtreeFlags & t) && null !== r ? (r.return = e, lX = r) : (n && function e(t) {
                                            for (t = t.child; null !== t;) {
                                                if (30 === t.tag) {
                                                    var n = t.memoizedProps,
                                                        r = rr(n, t.stateNode);
                                                    n = ri(n.default, n.update), t.flags &= -5, "none" !== n && lF(t, r, n, t.memoizedState = [], !1)
                                                } else 0 != (0x2000000 & t.subtreeFlags) && e(t);
                                                t = t.sibling
                                            }
                                        }(e), l4(n))
                                    }
                                }
                                lA = null
                            }(e, t, n)
                        } finally {
                            sx = i, H.p = a, K.T = r
                        }
                    }
                    sZ = 1, lI ? s1 = function(e, t, n, r, a, i, o, l, s) {
                        var u = 9 === t.nodeType ? t : t.ownerDocument;
                        try {
                            var c = u.startViewTransition({
                                update: function() {
                                    var t = u.defaultView,
                                        n = t.navigation && t.navigation.transition,
                                        o = u.fonts.status;
                                    r();
                                    var l = [];
                                    if ("loaded" === o && (u.documentElement.clientHeight, "loading" === u.fonts.status && l.push(u.fonts.ready)), o = l.length, null !== e)
                                        for (var s = e.suspenseyImages, c = 0, d = 0; d < s.length; d++) {
                                            var f = s[d];
                                            if (!f.complete) {
                                                var p = f.getBoundingClientRect();
                                                if (0 < p.bottom && 0 < p.right && p.top < t.innerHeight && p.left < t.innerWidth) {
                                                    if ((c += df(f)) > dh) {
                                                        l.length = o;
                                                        break
                                                    }
                                                    f = new Promise(cN.bind(f)), l.push(f)
                                                }
                                            }
                                        }
                                    return 0 < l.length ? (t = Promise.race([Promise.all(l), new Promise(function(e) {
                                        return setTimeout(e, 500)
                                    })]).then(a, a), (n ? Promise.allSettled([n.finished, t]) : t).then(i, i)) : (a(), n) ? n.finished.then(i, i) : void i()
                                },
                                types: n
                            });
                            u.__reactViewTransition = c;
                            var d = [];
                            return c.ready.then(function() {
                                for (var e = u.documentElement.getAnimations({
                                        subtree: !0
                                    }), t = 0; t < e.length; t++) {
                                    var n = e[t],
                                        r = n.effect,
                                        a = r.pseudoElement;
                                    if (null != a && a.startsWith("::view-transition")) {
                                        d.push(n), n = r.getKeyframes();
                                        for (var i = a = void 0, l = !0, s = 0; s < n.length; s++) {
                                            var c = n[s],
                                                f = c.width;
                                            if (void 0 === a) a = f;
                                            else if (a !== f) {
                                                l = !1;
                                                break
                                            }
                                            if (f = c.height, void 0 === i) i = f;
                                            else if (i !== f) {
                                                l = !1;
                                                break
                                            }
                                            delete c.width, delete c.height, "none" === c.transform && delete c.transform
                                        }
                                        l && void 0 !== a && void 0 !== i && (r.setKeyframes(n), (l = getComputedStyle(r.target, r.pseudoElement)).width !== a || l.height !== i) && ((l = n[0]).width = a, l.height = i, (l = n[n.length - 1]).width = a, l.height = i, r.setKeyframes(n))
                                    }
                                }
                                o()
                            }, function(e) {
                                u.__reactViewTransition === c && (u.__reactViewTransition = null);
                                try {
                                    "object" == typeof e && null !== e && "InvalidStateError" === e.name && ("View transition was skipped because document visibility state is hidden." === e.message || "Skipping view transition because document visibility state has become hidden." === e.message || "Skipping view transition because viewport size changed." === e.message || "Transition was aborted because of invalid state" === e.message) && (e = null), null !== e && s(e)
                                } finally {
                                    r(), a(), o()
                                }
                            }), c.finished.finally(function() {
                                for (var e = 0; e < d.length; e++) d[e].cancel();
                                u.__reactViewTransition === c && (u.__reactViewTransition = null), l()
                            }), c
                        } catch (e) {
                            return r(), a(), o(), null
                        }
                    }(o, e.containerInfo, s4, uw, u_, ub, uS, uE, uy) : (uw(), u_(), uS())
                }(e, t, n, o, l, u, f)
        }
    }

    function uy(e) {
        0 !== sZ && (0, sG.onRecoverableError)(e, {
            componentStack: null
        })
    }

    function ub() {
        3 === sZ && (sZ = 0, ss(sQ, sG), sZ = 4)
    }

    function uw() {
        if (1 === sZ) {
            sZ = 0;
            var e = sG,
                t = sQ,
                n = sY,
                r = 0 != (13878 & t.flags);
            if (0 != (13878 & t.subtreeFlags) || r) {
                r = K.T, K.T = null;
                var a = H.p;
                H.p = 2;
                var i = sx;
                sx |= 4;
                try {
                    l0 = l1 = !1, si(t, e, n), n = cs;
                    var o = n$(e.containerInfo),
                        l = n.focusedElem,
                        s = n.selectionRange;
                    if (o !== l && l && l.ownerDocument && function e(t, n) {
                            return !!t && !!n && (t === n || (!t || 3 !== t.nodeType) && (n && 3 === n.nodeType ? e(t, n.parentNode) : "contains" in t ? t.contains(n) : !!t.compareDocumentPosition && !!(16 & t.compareDocumentPosition(n))))
                        }(l.ownerDocument.documentElement, l)) {
                        if (null !== s && nV(l)) {
                            var u = s.start,
                                c = s.end;
                            if (void 0 === c && (c = u), "selectionStart" in l) l.selectionStart = u, l.selectionEnd = Math.min(c, l.value.length);
                            else {
                                var d = l.ownerDocument || document,
                                    f = d && d.defaultView || window;
                                if (f.getSelection) {
                                    var p = f.getSelection(),
                                        h = l.textContent.length,
                                        m = Math.min(s.start, h),
                                        g = void 0 === s.end ? m : Math.min(s.end, h);
                                    !p.extend && m > g && (o = g, g = m, m = o);
                                    var v = nq(l, m),
                                        y = nq(l, g);
                                    if (v && y && (1 !== p.rangeCount || p.anchorNode !== v.node || p.anchorOffset !== v.offset || p.focusNode !== y.node || p.focusOffset !== y.offset)) {
                                        var b = d.createRange();
                                        b.setStart(v.node, v.offset), p.removeAllRanges(), m > g ? (p.addRange(b), p.extend(y.node, y.offset)) : (b.setEnd(y.node, y.offset), p.addRange(b))
                                    }
                                }
                            }
                        }
                        for (d = [], p = l; p = p.parentNode;) 1 === p.nodeType && d.push({
                            element: p,
                            left: p.scrollLeft,
                            top: p.scrollTop
                        });
                        for ("function" == typeof l.focus && l.focus(), l = 0; l < d.length; l++) {
                            var w = d[l];
                            w.element.scrollLeft = w.left, w.element.scrollTop = w.top
                        }
                    }
                    dO = !!cl, cs = cl = null
                } finally {
                    sx = i, H.p = a, K.T = r
                }
            }
            e.current = t, sZ = 2
        }
    }

    function u_() {
        if (2 === sZ) {
            sZ = 0;
            var e = sG,
                t = sQ,
                n = 0 != (8772 & t.flags);
            if (0 != (8772 & t.subtreeFlags) || n) {
                n = K.T, K.T = null;
                var r = H.p;
                H.p = 2;
                var a = sx;
                sx |= 4;
                try {
                    l3(e, t.alternate, t)
                } finally {
                    sx = a, H.p = r, K.T = n
                }
            }
            sZ = 3
        }
    }

    function uS() {
        if (4 === sZ || 3 === sZ) {
            sZ = 0;
            var e = s1;
            s1 = null, eg();
            var t = sG,
                n = sQ,
                r = sY,
                a = s0,
                i = (0x13ffff00 & r) === r ? 10262 : 10256;
            if (0 != (n.subtreeFlags & i) || 0 != (n.flags & i) ? sZ = 5 : (sZ = 0, sQ = sG = null, uk(t, t.pendingLanes)), 0 === (i = t.pendingLanes) && (sH = null), eq(r), n = n.stateNode, eE && "function" == typeof eE.onCommitFiberRoot) try {
                eE.onCommitFiberRoot(ex, n, void 0, 128 == (128 & n.current.flags))
            } catch (e) {}
            if (null !== a) {
                n = K.T, i = H.p, H.p = 2, K.T = null;
                try {
                    for (var o = t.onRecoverableError, l = 0; l < a.length; l++) {
                        var s = a[l];
                        o(s.value, {
                            componentStack: s.stack
                        })
                    }
                } finally {
                    K.T = n, H.p = i
                }
            }
            if (a = s2, o = s4, s4 = null, null !== a && (s2 = null, null === o && (o = []), null !== e))
                for (s = 0; s < a.length; s++) void 0 !== (n = (0, a[s])(o)) && e.finished.finally(n);
            0 != (3 & sY) && ux(), uj(t), i = t.pendingLanes, 0 != (261930 & r) && 0 != (42 & i) ? t === s5 ? s3++ : (s3 = 0, s5 = t) : s3 = 0, uU(0, !1)
        }
    }

    function uk(e, t) {
        0 == (e.pooledCacheLanes &= t) && null != (t = e.pooledCache) && (e.pooledCache = null, ac(t))
    }

    function ux() {
        return null !== s1 && (s1.skipTransition(), s1 = null), uw(), u_(), uS(), uE()
    }

    function uE() {
        if (5 !== sZ) return !1;
        var e = sG,
            t = sX;
        sX = 0;
        var n = eq(sY),
            r = K.T,
            a = H.p;
        try {
            H.p = 32 > n ? 32 : n, K.T = null, n = sJ, sJ = null;
            var i = sG,
                o = sY;
            if (sZ = 0, sQ = sG = null, sY = 0, 0 != (6 & sx)) throw Error(s(331));
            var l = sx;
            if (sx |= 4, sw(i.current), sp(i, i.current, o, n), sx = l, uU(0, !1), eE && "function" == typeof eE.onPostCommitFiberRoot) try {
                eE.onPostCommitFiberRoot(ex, i)
            } catch (e) {}
            return !0
        } finally {
            H.p = a, K.T = r, uk(e, t)
        }
    }

    function uT(e, t, n) {
        t = rC(n, t), t = oj(e.stateNode, t, 2), null !== (e = aW(e, t, 2)) && (ez(e, 2), uj(e))
    }

    function uN(e, t, n) {
        if (3 === e.tag) uT(e, e, n);
        else
            for (; null !== t;) {
                if (3 === t.tag) {
                    uT(t, e, n);
                    break
                }
                if (1 === t.tag) {
                    var r = t.stateNode;
                    if ("function" == typeof t.type.getDerivedStateFromError || "function" == typeof r.componentDidCatch && (null === sH || !sH.has(r))) {
                        e = rC(n, e), null !== (r = aW(t, n = oU(2), 2)) && (oB(n, r, t, e), ez(r, 2), uj(r));
                        break
                    }
                }
                t = t.return
            }
    }

    function uC(e, t, n) {
        var r = e.pingCache;
        if (null === r) {
            r = e.pingCache = new sk;
            var a = new Set;
            r.set(t, a)
        } else void 0 === (a = r.get(t)) && (a = new Set, r.set(t, a));
        a.has(n) || (sI = !0, a.add(n), e = uO.bind(null, e, t, n), t.then(e, e))
    }

    function uO(e, t, n) {
        var r = e.pingCache;
        null !== r && r.delete(t), e.pingedLanes |= e.suspendedLanes & n, e.warmLanes &= ~n, sE === e && (sN & n) === n && (4 === sL || 3 === sL && (0x3c00000 & sN) === sN && 300 > ev() - s$ ? 0 == (2 & sx) && ui(e, 0) : sz |= n, sj === sN && (sj = 0)), uj(e)
    }

    function uR(e, t) {
        0 === t && (t = eD()), null !== (e = rp(e, t)) && (ez(e, t), uj(e))
    }

    function uP(e) {
        var t = e.memoizedState,
            n = 0;
        null !== t && (n = t.retryLane), uR(e, n)
    }

    function uI(e, t) {
        var n = 0;
        switch (e.tag) {
            case 31:
            case 13:
                var r = e.stateNode,
                    a = e.memoizedState;
                null !== a && (n = a.retryLane);
                break;
            case 19:
                r = e.stateNode;
                break;
            case 22:
                r = e.stateNode._retryCache;
                break;
            default:
                throw Error(s(314))
        }
        null !== r && r.delete(t), uR(e, n)
    }
    var uA = null,
        uL = null,
        uD = !1,
        uM = !1,
        uz = !1,
        uF = 0;

    function uj(e) {
        e !== uL && null === e.next && (null === uL ? uA = uL = e : uL = uL.next = e), uM = !0, uD || (uD = !0, cv(function() {
            0 != (6 & sx) ? ep(eb, uB) : uq()
        }))
    }

    function uU(e, t) {
        if (!uz && uM) {
            uz = !0;
            do
                for (var n = !1, r = uA; null !== r;) {
                    if (!t)
                        if (0 !== e) {
                            var a = r.pendingLanes;
                            if (0 === a) var i = 0;
                            else {
                                var o = r.suspendedLanes,
                                    l = r.pingedLanes;
                                i = 0xc000095 & (i = (1 << 31 - eT(42 | e) + 1) - 1 & (a & ~(o & ~l))) ? 0xc000095 & i | 1 : i ? 2 | i : 0
                            }
                            0 !== i && (n = !0, uW(r, i))
                        } else i = sN, 0 == (3 & (i = eA(r, r === sE ? i : 0, null !== r.cancelPendingCommit || -1 !== r.timeoutHandle))) || eL(r, i) || (n = !0, uW(r, i));
                    r = r.next
                }
            while (n) uz = !1
        }
    }

    function uB() {
        uq()
    }

    function uq() {
        uM = uD = !1;
        var e, t = 0;
        0 === uF || ((e = window.event) && "popstate" === e.type ? e === cp || (cp = e, 0) : (cp = null, 1)) || (t = uF);
        for (var n = ev(), r = null, a = uA; null !== a;) {
            var i = a.next,
                o = u$(a, n);
            0 === o ? (a.next = null, null === r ? uA = i : r.next = i, null === i && (uL = r)) : (r = a, (0 !== t || 0 != (3 & o)) && (uM = !0)), a = i
        }
        0 !== sZ && 5 !== sZ || uU(t, !1), 0 !== uF && (uF = 0)
    }

    function u$(e, t) {
        for (var n = e.suspendedLanes, r = e.pingedLanes, a = e.expirationTimes, i = -0x3c00001 & e.pendingLanes; 0 < i;) {
            var o = 31 - eT(i),
                l = 1 << o,
                s = a[o]; - 1 === s ? (0 == (l & n) || 0 != (l & r)) && (a[o] = function(e, t) {
                switch (e) {
                    case 1:
                    case 2:
                    case 4:
                    case 8:
                    case 64:
                        return t + 250;
                    case 16:
                    case 32:
                    case 128:
                    case 256:
                    case 512:
                    case 1024:
                    case 2048:
                    case 4096:
                    case 8192:
                    case 16384:
                    case 32768:
                    case 65536:
                    case 131072:
                    case 262144:
                    case 524288:
                    case 1048576:
                    case 2097152:
                        return t + 5e3;
                    default:
                        return -1
                }
            }(l, t)) : s <= t && (e.expiredLanes |= l), i &= ~l
        }
        if (t = sE, n = sN, n = eA(e, e === t ? n : 0, null !== e.cancelPendingCommit || -1 !== e.timeoutHandle), r = e.callbackNode, 0 === n || e === t && (2 === sC || 9 === sC) || null !== e.cancelPendingCommit) return null !== r && null !== r && eh(r), e.callbackNode = null, e.callbackPriority = 0;
        if (0 == (3 & n) || eL(e, n)) {
            if ((t = n & -n) === e.callbackPriority) return t;
            switch (null !== r && eh(r), eq(n)) {
                case 2:
                case 8:
                    n = ew;
                    break;
                case 32:
                default:
                    n = e_;
                    break;
                case 0x10000000:
                    n = ek
            }
            return n = ep(n, r = uV.bind(null, e)), e.callbackPriority = t, e.callbackNode = n, t
        }
        return null !== r && null !== r && eh(r), e.callbackPriority = 2, e.callbackNode = null, 2
    }

    function uV(e, t) {
        if (0 !== sZ && 5 !== sZ) return e.callbackNode = null, e.callbackPriority = 0, null;
        var n = e.callbackNode;
        if (ux() && e.callbackNode !== n) return null;
        var r = sN;
        return 0 === (r = eA(e, e === sE ? r : 0, null !== e.cancelPendingCommit || -1 !== e.timeoutHandle)) ? null : (ue(e, r, t), u$(e, ev()), null != e.callbackNode && e.callbackNode === n ? uV.bind(null, e) : null)
    }

    function uW(e, t) {
        if (ux()) return null;
        ue(e, t, !0)
    }

    function uK() {
        if (0 === uF) {
            var e = am;
            0 === e && (e = eO, 0 == (261888 & (eO <<= 1)) && (eO = 256)), uF = e
        }
        return uF
    }

    function uH(e) {
        return null == e || "symbol" == typeof e || "boolean" == typeof e ? null : "function" == typeof e ? e : tC(e)
    }
    for (var uZ = 0; uZ < re.length; uZ++) {
        var uG = re[uZ];
        rt(uG.toLowerCase(), "on" + (uG[0].toUpperCase() + uG.slice(1)))
    }
    rt(n2, "onAnimationEnd"), rt(n4, "onAnimationIteration"), rt(n3, "onAnimationStart"), rt("dblclick", "onDoubleClick"), rt("focusin", "onFocus"), rt("focusout", "onBlur"), rt(n5, "onTransitionRun"), rt(n8, "onTransitionStart"), rt(n9, "onTransitionCancel"), rt(n6, "onTransitionEnd"), e7("onMouseEnter", ["mouseout", "mouseover"]), e7("onMouseLeave", ["mouseout", "mouseover"]), e7("onPointerEnter", ["pointerout", "pointerover"]), e7("onPointerLeave", ["pointerout", "pointerover"]), e6("onChange", "change click focusin focusout input keydown keyup selectionchange".split(" ")), e6("onSelect", "focusout contextmenu dragend focusin keydown keyup mousedown mouseup selectionchange".split(" ")), e6("onBeforeInput", ["compositionend", "keypress", "textInput", "paste"]), e6("onCompositionEnd", "compositionend focusout keydown keypress keyup mousedown".split(" ")), e6("onCompositionStart", "compositionstart focusout keydown keypress keyup mousedown".split(" ")), e6("onCompositionUpdate", "compositionupdate focusout keydown keypress keyup mousedown".split(" "));
    var uQ = "abort canplay canplaythrough durationchange emptied encrypted ended error loadeddata loadedmetadata loadstart pause play playing progress ratechange resize seeked seeking stalled suspend timeupdate volumechange waiting".split(" "),
        uY = new Set("beforetoggle cancel close invalid load scroll scrollend toggle".split(" ").concat(uQ));

    function uX(e, t) {
        t = 0 != (4 & t);
        for (var n = 0; n < e.length; n++) {
            var r = e[n],
                a = r.event;
            r = r.listeners;
            e: {
                var i = void 0;
                if (t)
                    for (var o = r.length - 1; 0 <= o; o--) {
                        var l = r[o],
                            s = l.instance,
                            u = l.currentTarget;
                        if (l = l.listener, s !== i && a.isPropagationStopped()) break e;
                        i = l, a.currentTarget = u;
                        try {
                            i(a)
                        } catch (e) {
                            ro(e)
                        }
                        a.currentTarget = null, i = s
                    } else
                        for (o = 0; o < r.length; o++) {
                            if (s = (l = r[o]).instance, u = l.currentTarget, l = l.listener, s !== i && a.isPropagationStopped()) break e;
                            i = l, a.currentTarget = u;
                            try {
                                i(a)
                            } catch (e) {
                                ro(e)
                            }
                            a.currentTarget = null, i = s
                        }
            }
        }
    }

    function uJ(e, t) {
        var n = t[eG];
        void 0 === n && (n = t[eG] = new Set);
        var r = e + "__bubble";
        n.has(r) || (u4(t, e, 2, !1), n.add(r))
    }

    function u0(e, t, n) {
        var r = 0;
        t && (r |= 4), u4(n, e, r, t)
    }
    var u1 = "_reactListening" + Math.random().toString(36).slice(2);

    function u2(e) {
        if (!e[u1]) {
            e[u1] = !0, e8.forEach(function(t) {
                "selectionchange" !== t && (uY.has(t) || u0(t, !1, e), u0(t, !0, e))
            });
            var t = 9 === e.nodeType ? e : e.ownerDocument;
            null === t || t[u1] || (t[u1] = !0, u0("selectionchange", !1, t))
        }
    }

    function u4(e, t, n, r) {
        switch (dM(t)) {
            case 2:
                var a = dR;
                break;
            case 8:
                a = dP;
                break;
            default:
                a = dI
        }
        n = a.bind(null, t, n, e), a = void 0, tj && ("touchstart" === t || "touchmove" === t || "wheel" === t) && (a = !0), r ? void 0 !== a ? e.addEventListener(t, n, {
            capture: !0,
            passive: a
        }) : e.addEventListener(t, n, !0) : void 0 !== a ? e.addEventListener(t, n, {
            passive: a
        }) : e.addEventListener(t, n, !1)
    }

    function u3(e, t, n, r, a) {
        var i = r;
        if (0 == (1 & t) && 0 == (2 & t) && null !== r) e: for (;;) {
            if (null === r) return;
            var o = r.tag;
            if (3 === o || 4 === o) {
                var l = r.stateNode.containerInfo;
                if (l === a) break;
                if (4 === o)
                    for (o = r.return; null !== o;) {
                        var s = o.tag;
                        if ((3 === s || 4 === s) && o.stateNode.containerInfo === a) return;
                        o = o.return
                    }
                for (; null !== l;) {
                    if (null === (o = e1(l))) return;
                    if (5 === (s = o.tag) || 6 === s || 26 === s || 27 === s) {
                        r = i = o;
                        continue e
                    }
                    l = l.parentNode
                }
            }
            r = r.return
        }
        tM(function() {
            var r = i,
                a = tP(n),
                o = [];
            e: {
                var l = n7.get(e);
                if (void 0 !== l) {
                    var s = t1,
                        u = e;
                    switch (e) {
                        case "keypress":
                            if (0 === tW(n)) break e;
                        case "keydown":
                        case "keyup":
                            s = no;
                            break;
                        case "focusin":
                            u = "focus", s = t9;
                            break;
                        case "focusout":
                            u = "blur", s = t9;
                            break;
                        case "beforeblur":
                        case "afterblur":
                            s = t9;
                            break;
                        case "click":
                            if (2 === n.button) break e;
                        case "auxclick":
                        case "dblclick":
                        case "mousedown":
                        case "mousemove":
                        case "mouseup":
                        case "mouseout":
                        case "mouseover":
                        case "contextmenu":
                            s = t5;
                            break;
                        case "drag":
                        case "dragend":
                        case "dragenter":
                        case "dragexit":
                        case "dragleave":
                        case "dragover":
                        case "dragstart":
                        case "drop":
                            s = t8;
                            break;
                        case "touchcancel":
                        case "touchend":
                        case "touchmove":
                        case "touchstart":
                            s = nu;
                            break;
                        case n2:
                        case n4:
                        case n3:
                            s = t6;
                            break;
                        case n6:
                            s = nc;
                            break;
                        case "scroll":
                        case "scrollend":
                            s = t4;
                            break;
                        case "wheel":
                            s = nd;
                            break;
                        case "copy":
                        case "cut":
                        case "paste":
                            s = t7;
                            break;
                        case "gotpointercapture":
                        case "lostpointercapture":
                        case "pointercancel":
                        case "pointerdown":
                        case "pointermove":
                        case "pointerout":
                        case "pointerover":
                        case "pointerup":
                            s = nl;
                            break;
                        case "submit":
                            s = ns;
                            break;
                        case "toggle":
                        case "beforetoggle":
                            s = nf
                    }
                    var d = 0 != (4 & t),
                        f = !d && ("scroll" === e || "scrollend" === e),
                        p = d ? null !== l ? l + "Capture" : null : l;
                    d = [];
                    for (var h, m = r; null !== m;) {
                        var g = m;
                        if (h = g.stateNode, 5 !== (g = g.tag) && 26 !== g && 27 !== g || null === h || null === p || null != (g = tz(m, p)) && d.push(u5(m, g, h)), f) break;
                        m = m.return
                    }
                    0 < d.length && (l = new s(l, u, null, n, a), o.push({
                        event: l,
                        listeners: d
                    }))
                }
            }
            if (0 == (7 & t)) {
                s = "mouseover" === e || "pointerover" === e, l = "mouseout" === e || "pointerout" === e, !(s && n !== tR && (u = n.relatedTarget || n.fromElement) && (e1(u) || u[eZ])) && (l || s) && (u = a.window === a ? a : (s = a.ownerDocument) ? s.defaultView || s.parentWindow : window, l ? (s = n.relatedTarget || n.toElement, l = r, null !== (s = s ? e1(s) : null) && (f = c(s), d = s.tag, s !== f || 5 !== d && 27 !== d && 6 !== d) && (s = null)) : (l = null, s = r), l !== s && (d = t5, g = "onMouseLeave", p = "onMouseEnter", m = "mouse", ("pointerout" === e || "pointerover" === e) && (d = nl, g = "onPointerLeave", p = "onPointerEnter", m = "pointer"), f = null == l ? u : e4(l), h = null == s ? u : e4(s), (u = new d(g, m + "leave", l, n, a)).target = f, u.relatedTarget = h, g = null, e1(a) === r && ((d = new d(p, m + "enter", s, n, a)).target = h, d.relatedTarget = f, g = d), f = g, d = l && s ? k(l, s, u9) : null, null !== l && u6(o, u, l, d, !1), null !== s && null !== f && u6(o, f, s, d, !0)));
                e: {
                    if ("select" === (s = (l = r ? e4(r) : window).nodeName && l.nodeName.toLowerCase()) || "input" === s && "file" === l.type) var v, y = nO;
                    else if (nk(l))
                        if (nR) y = nF;
                        else {
                            y = nM;
                            var b = nD
                        }
                    else(s = l.nodeName) && "input" === s.toLowerCase() && ("checkbox" === l.type || "radio" === l.type) ? y = nz : r && tE(r.elementType) && (y = nO);
                    if (y && (y = y(e, r))) {
                        nx(o, y, n, a);
                        break e
                    }
                    b && b(e, l, r),
                    "focusout" === e && r && "number" === l.type && null != r.memoizedProps.value && tv(l, "number", l.value)
                }
                switch (b = r ? e4(r) : window, e) {
                    case "focusin":
                        (nk(b) || "true" === b.contentEditable) && (nK = b, nH = r, nZ = null);
                        break;
                    case "focusout":
                        nZ = nH = nK = null;
                        break;
                    case "mousedown":
                        nG = !0;
                        break;
                    case "contextmenu":
                    case "mouseup":
                    case "dragend":
                        nG = !1, nQ(o, n, a);
                        break;
                    case "selectionchange":
                        if (nW) break;
                    case "keydown":
                    case "keyup":
                        nQ(o, n, a)
                }
                if (nh) t: {
                    switch (e) {
                        case "compositionstart":
                            var w = "onCompositionStart";
                            break t;
                        case "compositionend":
                            w = "onCompositionEnd";
                            break t;
                        case "compositionupdate":
                            w = "onCompositionUpdate";
                            break t
                    }
                    w = void 0
                }
                else n_ ? nb(e, n) && (w = "onCompositionEnd") : "keydown" === e && 229 === n.keyCode && (w = "onCompositionStart");
                w && (nv && "ko" !== n.locale && (n_ || "onCompositionStart" !== w ? "onCompositionEnd" === w && n_ && (v = tV()) : (tq = "value" in (tB = a) ? tB.value : tB.textContent, n_ = !0)), 0 < (b = u8(r, w)).length && (w = new ne(w, e, null, n, a), o.push({
                    event: w,
                    listeners: b
                }), v ? w.data = v : null !== (v = nw(n)) && (w.data = v))), (v = ng ? function(e, t) {
                    switch (e) {
                        case "compositionend":
                            return nw(t);
                        case "keypress":
                            if (32 !== t.which) return null;
                            return ny = !0, " ";
                        case "textInput":
                            return " " === (e = t.data) && ny ? null : e;
                        default:
                            return null
                    }
                }(e, n) : function(e, t) {
                    if (n_) return "compositionend" === e || !nh && nb(e, t) ? (e = tV(), t$ = tq = tB = null, n_ = !1, e) : null;
                    switch (e) {
                        case "paste":
                        default:
                            return null;
                        case "keypress":
                            if (!(t.ctrlKey || t.altKey || t.metaKey) || t.ctrlKey && t.altKey) {
                                if (t.char && 1 < t.char.length) return t.char;
                                if (t.which) return String.fromCharCode(t.which)
                            }
                            return null;
                        case "compositionend":
                            return nv && "ko" !== t.locale ? null : t.data
                    }
                }(e, n)) && 0 < (w = u8(r, "onBeforeInput")).length && (b = new ne("onBeforeInput", "beforeinput", null, n, a), o.push({
                    event: b,
                    listeners: w
                }), b.data = v);
                var _ = e;
                if ("submit" === _ && r && r.stateNode === a) {
                    var S = uH((a[eH] || null).action),
                        x = n.submitter;
                    x && null !== (_ = (_ = x[eH] || null) ? uH(_.formAction) : x.getAttribute("formAction")) && (S = _, x = null);
                    var E = new t1("action", "action", null, n, a);
                    o.push({
                        event: E,
                        listeners: [{
                            instance: null,
                            listener: function() {
                                if (n.defaultPrevented) {
                                    if (0 !== uF) {
                                        var e = new FormData(a, x);
                                        od(r, {
                                            pending: !0,
                                            data: e,
                                            method: a.method,
                                            action: S
                                        }, null, e)
                                    }
                                } else "function" == typeof S && (E.preventDefault(), od(r, {
                                    pending: !0,
                                    data: e = new FormData(a, x),
                                    method: a.method,
                                    action: S
                                }, S, e))
                            },
                            currentTarget: a
                        }]
                    })
                }
            }
            uX(o, t)
        })
    }

    function u5(e, t, n) {
        return {
            instance: e,
            listener: t,
            currentTarget: n
        }
    }

    function u8(e, t) {
        for (var n = t + "Capture", r = []; null !== e;) {
            var a = e,
                i = a.stateNode;
            if (5 !== (a = a.tag) && 26 !== a && 27 !== a || null === i || (null != (a = tz(e, n)) && r.unshift(u5(e, a, i)), null != (a = tz(e, t)) && r.push(u5(e, a, i))), 3 === e.tag) return r;
            e = e.return
        }
        return []
    }

    function u9(e) {
        if (null === e) return null;
        do e = e.return; while (e && 5 !== e.tag && 27 !== e.tag) return e || null
    }

    function u6(e, t, n, r, a) {
        for (var i = t._reactName, o = []; null !== n && n !== r;) {
            var l = n,
                s = l.alternate,
                u = l.stateNode;
            if (l = l.tag, null !== s && s === r) break;
            5 !== l && 26 !== l && 27 !== l || null === u || (s = u, a ? null != (u = tz(n, i)) && o.unshift(u5(n, u, s)) : a || null != (u = tz(n, i)) && o.push(u5(n, u, s))), n = n.return
        }
        0 !== o.length && e.push({
            event: t,
            listeners: o
        })
    }
    var u7 = /\r\n?/g,
        ce = /\u0000|\uFFFD/g;

    function ct(e) {
        return ("string" == typeof e ? e : "" + e).replace(u7, "\n").replace(ce, "")
    }

    function cn(e, t) {
        return t = ct(t), ct(e) === t
    }

    function cr(e, t, n, r, a, i) {
        switch (n) {
            case "children":
                if ("string" == typeof r) "body" === t || "textarea" === t && "" === r || t_(e, r);
                else {
                    if ("number" != typeof r && "bigint" != typeof r) return;
                    "body" !== t && t_(e, "" + r)
                }
                break;
            case "className":
                to(e, "class", r);
                break;
            case "tabIndex":
                to(e, "tabindex", r);
                break;
            case "dir":
            case "role":
            case "viewBox":
            case "width":
            case "height":
                to(e, n, r);
                break;
            case "style":
                tx(e, r, i);
                return;
            case "data":
                if ("object" !== t) {
                    to(e, "data", r);
                    break
                }
            case "src":
            case "href":
                if ("" === r && ("a" !== t || "href" !== n) || null == r || "function" == typeof r || "symbol" == typeof r || "boolean" == typeof r) {
                    e.removeAttribute(n);
                    break
                }
                r = tC(r), e.setAttribute(n, r);
                break;
            case "action":
            case "formAction":
                if ("function" == typeof r) {
                    e.setAttribute(n, "javascript:throw new Error('A React form was unexpectedly submitted. If you called form.submit() manually, consider using form.requestSubmit() instead. If you\\'re trying to use event.stopPropagation() in a submit event handler, consider also calling event.preventDefault().')");
                    break
                }
                if ("function" == typeof i && ("formAction" === n ? ("input" !== t && cr(e, t, "name", a.name, a, null), cr(e, t, "formEncType", a.formEncType, a, null), cr(e, t, "formMethod", a.formMethod, a, null), cr(e, t, "formTarget", a.formTarget, a, null)) : (cr(e, t, "encType", a.encType, a, null), cr(e, t, "method", a.method, a, null), cr(e, t, "target", a.target, a, null))), null == r || "symbol" == typeof r || "boolean" == typeof r) {
                    e.removeAttribute(n);
                    break
                }
                r = tC(r), e.setAttribute(n, r);
                break;
            case "onClick":
                null != r && (e.onclick = tO);
                return;
            case "onScroll":
                null != r && uJ("scroll", e);
                return;
            case "onScrollEnd":
                null != r && uJ("scrollend", e);
                return;
            case "dangerouslySetInnerHTML":
                if (null != r) {
                    if ("object" != typeof r || !("__html" in r)) throw Error(s(61));
                    if (null != (n = r.__html)) {
                        if (null != a.children) throw Error(s(60));
                        e.innerHTML = n
                    }
                }
                break;
            case "multiple":
                e.multiple = r && "function" != typeof r && "symbol" != typeof r;
                break;
            case "muted":
                e.muted = r && "function" != typeof r && "symbol" != typeof r;
                break;
            case "suppressContentEditableWarning":
            case "suppressHydrationWarning":
            case "defaultValue":
            case "defaultChecked":
            case "innerHTML":
            case "ref":
            case "autoFocus":
                break;
            case "xlinkHref":
                if (null == r || "function" == typeof r || "boolean" == typeof r || "symbol" == typeof r) {
                    e.removeAttribute("xlink:href");
                    break
                }
                n = tC(r), e.setAttributeNS("http://www.w3.org/1999/xlink", "xlink:href", n);
                break;
            case "contentEditable":
            case "spellCheck":
            case "draggable":
            case "value":
            case "autoReverse":
            case "externalResourcesRequired":
            case "focusable":
            case "preserveAlpha":
                null != r && "function" != typeof r && "symbol" != typeof r ? e.setAttribute(n, r) : e.removeAttribute(n);
                break;
            case "inert":
            case "allowFullScreen":
            case "async":
            case "autoPlay":
            case "controls":
            case "default":
            case "defer":
            case "disabled":
            case "disablePictureInPicture":
            case "disableRemotePlayback":
            case "formNoValidate":
            case "hidden":
            case "loop":
            case "noModule":
            case "noValidate":
            case "open":
            case "playsInline":
            case "readOnly":
            case "required":
            case "reversed":
            case "scoped":
            case "seamless":
            case "itemScope":
                r && "function" != typeof r && "symbol" != typeof r ? e.setAttribute(n, "") : e.removeAttribute(n);
                break;
            case "capture":
            case "download":
                !0 === r ? e.setAttribute(n, "") : !1 !== r && null != r && "function" != typeof r && "symbol" != typeof r ? e.setAttribute(n, r) : e.removeAttribute(n);
                break;
            case "cols":
            case "rows":
            case "size":
            case "span":
                null != r && "function" != typeof r && "symbol" != typeof r && !isNaN(r) && 1 <= r ? e.setAttribute(n, r) : e.removeAttribute(n);
                break;
            case "rowSpan":
            case "start":
                null == r || "function" == typeof r || "symbol" == typeof r || isNaN(r) ? e.removeAttribute(n) : e.setAttribute(n, r);
                break;
            case "popover":
                uJ("beforetoggle", e), uJ("toggle", e), ti(e, "popover", r);
                break;
            case "xlinkActuate":
                tl(e, "http://www.w3.org/1999/xlink", "xlink:actuate", r);
                break;
            case "xlinkArcrole":
                tl(e, "http://www.w3.org/1999/xlink", "xlink:arcrole", r);
                break;
            case "xlinkRole":
                tl(e, "http://www.w3.org/1999/xlink", "xlink:role", r);
                break;
            case "xlinkShow":
                tl(e, "http://www.w3.org/1999/xlink", "xlink:show", r);
                break;
            case "xlinkTitle":
                tl(e, "http://www.w3.org/1999/xlink", "xlink:title", r);
                break;
            case "xlinkType":
                tl(e, "http://www.w3.org/1999/xlink", "xlink:type", r);
                break;
            case "xmlBase":
                tl(e, "http://www.w3.org/XML/1998/namespace", "xml:base", r);
                break;
            case "xmlLang":
                tl(e, "http://www.w3.org/XML/1998/namespace", "xml:lang", r);
                break;
            case "xmlSpace":
                tl(e, "http://www.w3.org/XML/1998/namespace", "xml:space", r);
                break;
            case "is":
                ti(e, "is", r);
                break;
            case "innerText":
            case "textContent":
                return;
            default:
                if (2 < n.length && ("o" === n[0] || "O" === n[0]) && ("n" === n[1] || "N" === n[1])) return;
                ti(e, n = tT.get(n) || n, r)
        }
        tr = !0
    }

    function ca(e, t, n, r, a, i) {
        switch (n) {
            case "style":
                tx(e, r, i);
                return;
            case "dangerouslySetInnerHTML":
                if (null != r) {
                    if ("object" != typeof r || !("__html" in r)) throw Error(s(61));
                    if (null != (n = r.__html)) {
                        if (null != a.children) throw Error(s(60));
                        e.innerHTML = n
                    }
                }
                break;
            case "children":
                if ("string" == typeof r) t_(e, r);
                else {
                    if ("number" != typeof r && "bigint" != typeof r) return;
                    t_(e, "" + r)
                }
                break;
            case "onScroll":
                null != r && uJ("scroll", e);
                return;
            case "onScrollEnd":
                null != r && uJ("scrollend", e);
                return;
            case "onClick":
                null != r && (e.onclick = tO);
                return;
            case "suppressContentEditableWarning":
            case "suppressHydrationWarning":
            case "innerHTML":
            case "ref":
            case "innerText":
            case "textContent":
                return;
            default:
                if (!e9.hasOwnProperty(n)) e: {
                    if ("o" === n[0] && "n" === n[1] && (a = n.endsWith("Capture"), t = n.slice(2, a ? n.length - 7 : void 0), "function" == typeof(i = null != (i = e[eH] || null) ? i[n] : null) && e.removeEventListener(t, i, a), "function" == typeof r)) {
                        "function" != typeof i && null !== i && (n in e ? e[n] = null : e.hasAttribute(n) && e.removeAttribute(n)), e.addEventListener(t, r, a);
                        break e
                    }
                    tr = !0,
                    n in e ? e[n] = r : !0 === r ? e.setAttribute(n, "") : ti(e, n, r)
                }
                return
        }
        tr = !0
    }

    function ci(e, t, n) {
        switch (t) {
            case "div":
            case "span":
            case "svg":
            case "path":
            case "a":
            case "g":
            case "p":
            case "li":
                break;
            case "img":
                uJ("error", e), uJ("load", e);
                var r, a = !1,
                    i = !1;
                for (r in n)
                    if (n.hasOwnProperty(r)) {
                        var o = n[r];
                        if (null != o) switch (r) {
                            case "src":
                                a = !0;
                                break;
                            case "srcSet":
                                i = !0;
                                break;
                            case "children":
                            case "dangerouslySetInnerHTML":
                                throw Error(s(137, t));
                            default:
                                cr(e, t, r, o, n, null)
                        }
                    } i && cr(e, t, "srcSet", n.srcSet, n, null), a && cr(e, t, "src", n.src, n, null);
                return;
            case "input":
                uJ("invalid", e);
                var l = r = o = i = null,
                    u = null,
                    c = null;
                for (a in n)
                    if (n.hasOwnProperty(a)) {
                        var d = n[a];
                        if (null != d) switch (a) {
                            case "name":
                                i = d;
                                break;
                            case "type":
                                o = d;
                                break;
                            case "checked":
                                u = d;
                                break;
                            case "defaultChecked":
                                c = d;
                                break;
                            case "value":
                                r = d;
                                break;
                            case "defaultValue":
                                l = d;
                                break;
                            case "children":
                            case "dangerouslySetInnerHTML":
                                if (null != d) throw Error(s(137, t));
                                break;
                            default:
                                cr(e, t, a, d, n, null)
                        }
                    } tg(e, r, l, u, c, o, i, !1);
                return;
            case "select":
                for (i in uJ("invalid", e), a = o = r = null, n)
                    if (n.hasOwnProperty(i) && null != (l = n[i])) switch (i) {
                        case "value":
                            r = l;
                            break;
                        case "defaultValue":
                            o = l;
                            break;
                        case "multiple":
                            a = l;
                        default:
                            cr(e, t, i, l, n, null)
                    }
                t = r, n = o, e.multiple = !!a, null != t ? ty(e, !!a, t, !1) : null != n && ty(e, !!a, n, !0);
                return;
            case "textarea":
                for (o in uJ("invalid", e), r = i = a = null, n)
                    if (n.hasOwnProperty(o) && null != (l = n[o])) switch (o) {
                        case "value":
                            a = l;
                            break;
                        case "defaultValue":
                            i = l;
                            break;
                        case "children":
                            r = l;
                            break;
                        case "dangerouslySetInnerHTML":
                            if (null != l) throw Error(s(91));
                            break;
                        default:
                            cr(e, t, o, l, n, null)
                    }
                tw(e, a, i, r);
                return;
            case "option":
                for (u in n) n.hasOwnProperty(u) && null != (a = n[u]) && ("selected" === u ? e.selected = a && "function" != typeof a && "symbol" != typeof a : cr(e, t, u, a, n, null));
                return;
            case "dialog":
                uJ("beforetoggle", e), uJ("toggle", e), uJ("cancel", e), uJ("close", e);
                break;
            case "iframe":
            case "object":
                uJ("load", e);
                break;
            case "video":
            case "audio":
                for (a = 0; a < uQ.length; a++) uJ(uQ[a], e);
                break;
            case "image":
                uJ("error", e), uJ("load", e);
                break;
            case "details":
                uJ("toggle", e);
                break;
            case "embed":
            case "source":
            case "link":
                uJ("error", e), uJ("load", e);
            case "area":
            case "base":
            case "br":
            case "col":
            case "hr":
            case "keygen":
            case "meta":
            case "param":
            case "track":
            case "wbr":
            case "menuitem":
                for (c in n)
                    if (n.hasOwnProperty(c) && null != (a = n[c])) switch (c) {
                        case "children":
                        case "dangerouslySetInnerHTML":
                            throw Error(s(137, t));
                        default:
                            cr(e, t, c, a, n, null)
                    }
                return;
            default:
                if (tE(t)) {
                    for (d in n) n.hasOwnProperty(d) && void 0 !== (a = n[d]) && ca(e, t, d, a, n, void 0);
                    return
                }
        }
        for (l in n) n.hasOwnProperty(l) && null != (a = n[l]) && cr(e, t, l, a, n, null)
    }

    function co(e) {
        switch (e) {
            case "css":
            case "script":
            case "font":
            case "img":
            case "image":
            case "input":
            case "link":
                return !0;
            default:
                return !1
        }
    }
    var cl = null,
        cs = null;

    function cu(e) {
        return 9 === e.nodeType ? e : e.ownerDocument
    }

    function cc(e) {
        switch (e) {
            case "http://www.w3.org/2000/svg":
                return 1;
            case "http://www.w3.org/1998/Math/MathML":
                return 2;
            default:
                return 0
        }
    }

    function cd(e, t) {
        if (0 === e) switch (t) {
            case "svg":
                return 1;
            case "math":
                return 2;
            default:
                return 0
        }
        return 1 === e && "foreignObject" === t ? 0 : e
    }

    function cf(e, t) {
        return "textarea" === e || "noscript" === e || "string" == typeof t.children || "number" == typeof t.children || "bigint" == typeof t.children || "object" == typeof t.dangerouslySetInnerHTML && null !== t.dangerouslySetInnerHTML && null != t.dangerouslySetInnerHTML.__html
    }
    var cp = null,
        ch = "function" == typeof setTimeout ? setTimeout : void 0,
        cm = "function" == typeof clearTimeout ? clearTimeout : void 0,
        cg = "function" == typeof Promise ? Promise : void 0,
        cv = "function" == typeof queueMicrotask ? queueMicrotask : void 0 !== cg ? function(e) {
            return cg.resolve(null).then(e).catch(cy)
        } : ch;

    function cy(e) {
        setTimeout(function() {
            throw e
        })
    }

    function cb(e) {
        return "head" === e
    }

    function cw(e, t) {
        var n = t,
            r = 0;
        do {
            var a = n.nextSibling;
            if (e.removeChild(n), a && 8 === a.nodeType)
                if ("/$" === (n = a.data) || "/&" === n) {
                    if (0 === r) {
                        e.removeChild(a), d0(t);
                        return
                    }
                    r--
                } else if ("$" === n || "$?" === n || "$~" === n || "$!" === n || "&" === n) r++;
            else if ("html" === n) cJ(e.ownerDocument.documentElement);
            else if ("head" === n) {
                cJ(n = e.ownerDocument.head);
                for (var i = n.firstChild; i;) {
                    var o = i.nextSibling,
                        l = i.nodeName;
                    i[eJ] || "SCRIPT" === l || "STYLE" === l || "LINK" === l && "stylesheet" === i.rel.toLowerCase() || n.removeChild(i), i = o
                }
            } else "body" === n && cJ(e.ownerDocument.body);
            n = a
        } while (n) d0(t)
    }

    function c_(e, t) {
        var n = e;
        e = 0;
        do {
            var r = n.nextSibling;
            if (1 === n.nodeType ? t ? (n._stashedDisplay = n.style.display, n.style.display = "none") : (n.style.display = n._stashedDisplay || "", "" === n.getAttribute("style") && n.removeAttribute("style")) : 3 === n.nodeType && (t ? (n._stashedText = n.nodeValue, n.nodeValue = "") : n.nodeValue = n._stashedText || ""), r && 8 === r.nodeType)
                if ("/$" === (n = r.data))
                    if (0 === e) break;
                    else e--;
            else "$" !== n && "$?" !== n && "$~" !== n && "$!" !== n || e++;
            n = r
        } while (n)
    }

    function cS(e, t, n) {
        if (t = CSS.escape(t) !== t ? "r-" + btoa(t).replace(/=/g, "") : t, e.style.viewTransitionName = t, null != n && (e.style.viewTransitionClass = n), "inline" === (n = getComputedStyle(e)).display) {
            if (1 === (t = e.getClientRects()).length) var r = 1;
            else
                for (var a = r = 0; a < t.length; a++) {
                    var i = t[a];
                    0 < i.width && 0 < i.height && r++
                }
            1 === r && ((e = e.style).display = 1 === t.length ? "inline-block" : "block", e.marginTop = "-" + n.paddingTop, e.marginBottom = "-" + n.paddingBottom)
        }
    }

    function ck(e, t) {
        e = e.style;
        var n = null != (t = t.style) ? t.hasOwnProperty("viewTransitionName") ? t.viewTransitionName : t.hasOwnProperty("view-transition-name") ? t["view-transition-name"] : null : null;
        e.viewTransitionName = null == n || "boolean" == typeof n ? "" : ("" + n).trim(), n = null != t ? t.hasOwnProperty("viewTransitionClass") ? t.viewTransitionClass : t.hasOwnProperty("view-transition-class") ? t["view-transition-class"] : null : null, e.viewTransitionClass = null == n || "boolean" == typeof n ? "" : ("" + n).trim(), "inline-block" === e.display && (null == t ? e.display = e.margin = "" : (n = t.display, e.display = null == n || "boolean" == typeof n ? "" : n, null != (n = t.margin) ? e.margin = n : (n = t.hasOwnProperty("marginTop") ? t.marginTop : t["margin-top"], e.marginTop = null == n || "boolean" == typeof n ? "" : n, t = t.hasOwnProperty("marginBottom") ? t.marginBottom : t["margin-bottom"], e.marginBottom = null == t || "boolean" == typeof t ? "" : t)))
    }

    function cx(e, t, n) {
        return n = n.ownerDocument.defaultView, {
            rect: e,
            abs: "absolute" === t.position || "fixed" === t.position,
            clip: "none" !== t.clipPath || "visible" !== t.overflow || "none" !== t.filter || "none" !== t.mask || "none" !== t.mask || "0px" !== t.borderRadius,
            view: 0 <= e.bottom && 0 <= e.right && e.top <= n.innerHeight && e.left <= n.innerWidth
        }
    }

    function cE(e) {
        return cx(e.getBoundingClientRect(), getComputedStyle(e), e)
    }

    function cT(e) {
        var t = e.getBoundingClientRect();
        return cx(t = new DOMRect(t.x + 2e4, t.y + 2e4, t.width, t.height), getComputedStyle(e), e)
    }

    function cN(e) {
        this.addEventListener("load", e), this.addEventListener("error", e)
    }

    function cC(e, t) {
        this._scope = document.documentElement, this._selector = "::view-transition-" + e + "(" + t + ")"
    }

    function cO(e) {
        return {
            name: e,
            group: new cC("group", e),
            imagePair: new cC("image-pair", e),
            old: new cC("old", e),
            new: new cC("new", e)
        }
    }

    function cR(e) {
        this._fragmentFiber = e, this._observers = this._eventListeners = null
    }

    function cP(e, t, n, r) {
        return g(e).addEventListener(t, n, r), !1
    }

    function cI(e, t, n, r) {
        return g(e).removeEventListener(t, n, r), !1
    }

    function cA(e) {
        return null == e ? "0" : "boolean" == typeof e ? "c=" + (e ? "1" : "0") : "c=" + (e.capture ? "1" : "0") + "&o=" + (e.once ? "1" : "0") + "&p=" + (e.passive ? "1" : "0")
    }

    function cL(e, t, n, r) {
        if (0 === e.length) return -1;
        r = cA(r);
        for (var a = 0; a < e.length; a++) {
            var i = e[a];
            if (i.type === t && i.listener === n && cA(i.optionsOrUseCapture) === r) return a
        }
        return -1
    }

    function cD(e, t) {
        return 6 !== e.tag && function(e, t) {
            function n() {
                r = !0
            }
            if (e.ownerDocument.activeElement === e) return !0;
            var r = !1;
            try {
                e.ownerDocument.addEventListener("focus", n, !0), (e.focus || HTMLElement.prototype.focus).call(e, t)
            } finally {
                e.ownerDocument.removeEventListener("focus", n, !0)
            }
            return r
        }(e = g(e), t)
    }

    function cM(e, t) {
        return t.push(e), !1
    }

    function cz(e, t) {
        return 6 !== e.tag && (e = g(e)) === t && (e.blur(), !0)
    }

    function cF(e, t) {
        return 6 !== e.tag && (e = g(e), t.observe(e), !1)
    }

    function cj(e, t) {
        return 6 !== e.tag && (e = g(e), t.unobserve(e), !1)
    }

    function cU(e, t) {
        if (6 === e.tag) {
            var n = (e = e.stateNode).ownerDocument.createRange();
            n.selectNodeContents(e), t.push.apply(t, n.getClientRects())
        } else e = g(e), t.push.apply(t, e.getClientRects());
        return !1
    }

    function cB(e, t) {
        return null != (e = g(e)) && cq(e, t), !1
    }

    function cq(e, t) {
        null == e.reactFragments && (e.reactFragments = new Set), e.reactFragments.add(t)
    }

    function c$(e, t) {
        if (3 !== e.nodeType) {
            var n = t._eventListeners;
            if (null !== n)
                for (var r = 0; r < n.length; r++) {
                    var a = n[r];
                    e.addEventListener(a.type, a.listener, a.optionsOrUseCapture)
                }
            null !== t._observers && t._observers.forEach(function(t) {
                t.observe(e)
            }), cq(e, t)
        }
    }

    function cV(e) {
        var t = e.firstChild;
        for (t && 10 === t.nodeType && (t = t.nextSibling); t;) {
            var n = t;
            switch (t = t.nextSibling, n.nodeName) {
                case "HTML":
                case "HEAD":
                case "BODY":
                    cV(n), e0(n);
                    continue;
                case "SCRIPT":
                case "STYLE":
                    continue;
                case "LINK":
                    if ("stylesheet" === n.rel.toLowerCase()) continue
            }
            e.removeChild(n)
        }
    }

    function cW(e, t) {
        for (; 8 !== e.nodeType;)
            if ((1 !== e.nodeType || "INPUT" !== e.nodeName || "hidden" !== e.type) && !t || null === (e = cZ(e.nextSibling))) return null;
        return e
    }

    function cK(e) {
        return "$?" === e.data || "$~" === e.data
    }

    function cH(e) {
        return "$!" === e.data || "$?" === e.data && "loading" !== e.ownerDocument.readyState
    }

    function cZ(e) {
        for (; null != e; e = e.nextSibling) {
            var t = e.nodeType;
            if (1 === t || 3 === t) break;
            if (8 === t) {
                if ("$" === (t = e.data) || "$!" === t || "$?" === t || "$~" === t || "&" === t || "F!" === t || "F" === t) break;
                if ("/$" === t || "/&" === t) return null
            }
        }
        return e
    }
    cC.prototype.animate = function(e, t) {
        return (t = "number" == typeof t ? {
            duration: t
        } : x({}, t)).pseudoElement = this._selector, this._scope.animate(e, t)
    }, cC.prototype.getAnimations = function() {
        for (var e = this._scope, t = this._selector, n = e.getAnimations({
                subtree: !0
            }), r = [], a = 0; a < n.length; a++) {
            var i = n[a].effect;
            null !== i && i.target === e && i.pseudoElement === t && r.push(n[a])
        }
        return r
    }, cC.prototype.getComputedStyle = function() {
        return getComputedStyle(this._scope, this._selector)
    }, cR.prototype.addEventListener = function(e, t, n) {
        null === this._eventListeners && (this._eventListeners = []);
        var r = this._eventListeners; - 1 === cL(r, e, t, n) && (r.push({
            type: e,
            listener: t,
            optionsOrUseCapture: n
        }), h(this._fragmentFiber.child, !1, cP, e, t, n)), this._eventListeners = r
    }, cR.prototype.removeEventListener = function(e, t, n) {
        var r = this._eventListeners;
        null != r && 0 < r.length && (h(this._fragmentFiber.child, !1, cI, e, t, n), e = cL(r, e, t, n), null !== this._eventListeners && this._eventListeners.splice(e, 1))
    }, cR.prototype.dispatchEvent = function(e) {
        var t = m(this._fragmentFiber);
        if (null === t) return !0;
        t = g(t);
        var n = this._eventListeners;
        if (null !== n && 0 < n.length || !e.bubbles) {
            var r = document.createTextNode("");
            if (n)
                for (var a = 0; a < n.length; a++) {
                    var i = n[a];
                    r.addEventListener(i.type, i.listener, i.optionsOrUseCapture)
                }
            if (t.appendChild(r), e = r.dispatchEvent(e), n)
                for (a = 0; a < n.length; a++) i = n[a], r.removeEventListener(i.type, i.listener, i.optionsOrUseCapture);
            return t.removeChild(r), e
        }
        return t.dispatchEvent(e)
    }, cR.prototype.focus = function(e) {
        h(this._fragmentFiber.child, !0, cD, e, void 0, void 0)
    }, cR.prototype.focusLast = function(e) {
        var t = [];
        h(this._fragmentFiber.child, !0, cM, t, void 0, void 0);
        for (var n = t.length - 1; 0 <= n && !cD(t[n], e); n--);
    }, cR.prototype.blur = function() {
        var e = m(this._fragmentFiber);
        if (null !== e) {
            var t = (e = g(e)).ownerDocument.activeElement;
            null !== t && e.contains(t) && h(this._fragmentFiber.child, !1, cz, t, void 0, void 0)
        }
    }, cR.prototype.observeUsing = function(e) {
        null === this._observers && (this._observers = new Set), this._observers.add(e), h(this._fragmentFiber.child, !1, cF, e, void 0, void 0)
    }, cR.prototype.unobserveUsing = function(e) {
        var t = this._observers;
        null !== t && t.has(e) && (t.delete(e), h(this._fragmentFiber.child, !1, cj, e, void 0, void 0))
    }, cR.prototype.getClientRects = function() {
        var e = [];
        return h(this._fragmentFiber.child, !1, cU, e, void 0, void 0), e
    }, cR.prototype.getRootNode = function(e) {
        var t = m(this._fragmentFiber);
        return null === t ? this : g(t).getRootNode(e)
    }, cR.prototype.compareDocumentPosition = function(e) {
        var t = m(this._fragmentFiber);
        if (null === t) return Node.DOCUMENT_POSITION_DISCONNECTED;
        var n = [];
        h(this._fragmentFiber.child, !1, cM, n, void 0, void 0);
        var r = g(t);
        if (0 === n.length) {
            n = this._fragmentFiber;
            var a = r.compareDocumentPosition(e);
            return t = a, r === e ? t = Node.DOCUMENT_POSITION_CONTAINS : a & Node.DOCUMENT_POSITION_CONTAINED_BY && (h(n.sibling, !1, b), n = v, v = null, t = null === n ? Node.DOCUMENT_POSITION_PRECEDING : 0 === (e = g(n).compareDocumentPosition(e)) || e & Node.DOCUMENT_POSITION_FOLLOWING ? Node.DOCUMENT_POSITION_FOLLOWING : Node.DOCUMENT_POSITION_PRECEDING), t | Node.DOCUMENT_POSITION_IMPLEMENTATION_SPECIFIC
        }
        t = g(n[0]), a = g(n[n.length - 1]);
        for (var i = !1, o = this._fragmentFiber.return; null !== o && (4 === o.tag && (i = !0), 3 !== o.tag && 5 !== o.tag);) o = o.return;
        if (null == (i = i ? t.parentElement : r)) return Node.DOCUMENT_POSITION_DISCONNECTED;
        r = i.compareDocumentPosition(t) & Node.DOCUMENT_POSITION_CONTAINED_BY, i = i.compareDocumentPosition(a) & Node.DOCUMENT_POSITION_CONTAINED_BY, o = t.compareDocumentPosition(e);
        var l = a.compareDocumentPosition(e),
            s = o & Node.DOCUMENT_POSITION_CONTAINED_BY || l & Node.DOCUMENT_POSITION_CONTAINED_BY;
        return l = r && i && o & Node.DOCUMENT_POSITION_FOLLOWING && l & Node.DOCUMENT_POSITION_PRECEDING, (t = r && t === e || i && a === e || s || l ? Node.DOCUMENT_POSITION_CONTAINED_BY : (r || t !== e) && (i || a !== e) ? o : Node.DOCUMENT_POSITION_IMPLEMENTATION_SPECIFIC) & Node.DOCUMENT_POSITION_DISCONNECTED || t & Node.DOCUMENT_POSITION_IMPLEMENTATION_SPECIFIC || function(e, t, n, r, a) {
            var i = e1(a);
            if (e & Node.DOCUMENT_POSITION_CONTAINED_BY) {
                if (n = !!i) e: {
                    for (; null !== i;) {
                        if (7 === i.tag && (i === t || i.alternate === t)) {
                            n = !0;
                            break e
                        }
                        i = i.return
                    }
                    n = !1
                }
                return n
            }
            if (e & Node.DOCUMENT_POSITION_CONTAINS) {
                if (null === i) return i = a.ownerDocument, a === i || a === i.body;
                e: {
                    for (i = t, t = m(t); null !== i;) {
                        if ((5 === i.tag || 3 === i.tag) && (i === t || i.alternate === t)) {
                            i = !0;
                            break e
                        }
                        i = i.return
                    }
                    i = !1
                }
                return i
            }
            return e & Node.DOCUMENT_POSITION_PRECEDING ? ((t = !!i) && !(t = i === n) && (null === (t = k(n, i, S)) ? t = !1 : (h(t, !0, w, i, n), i = v, v = null, t = null !== i)), t) : !!(e & Node.DOCUMENT_POSITION_FOLLOWING) && ((t = !!i) && !(t = i === r) && (null === (t = k(r, i, S)) ? t = !1 : (h(t, !0, _, i, r), i = v, y = v = null, t = null !== i)), t)
        }(t, this._fragmentFiber, n[0], n[n.length - 1], e) ? t : Node.DOCUMENT_POSITION_IMPLEMENTATION_SPECIFIC
    }, cR.prototype.scrollIntoView = function(e) {
        if ("object" == typeof e) throw Error(s(566));
        var t = [];
        h(this._fragmentFiber.child, !1, cM, t, void 0, void 0);
        var n = !1 !== e;
        if (0 === t.length) {
            t = this._fragmentFiber;
            var r = [null, null],
                a = m(t);
            null !== a && function e(t, n, r) {
                for (var a = 3 < arguments.length && void 0 !== arguments[3] && arguments[3]; null !== r;) {
                    if (r === n)
                        if (a = !0, !r.sibling) return !0;
                        else r = r.sibling;
                    if (5 === r.tag) {
                        if (a) return t[1] = r, !0;
                        t[0] = r
                    } else if ((22 !== r.tag || null === r.memoizedState) && e(t, n, r.child, a)) return !0;
                    r = r.sibling
                }
                return !1
            }(r, t, a.child), null !== (n = n ? r[1] || r[0] || m(this._fragmentFiber) : r[0] || r[1]) && g(n).scrollIntoView(e)
        } else
            for (r = n ? t.length - 1 : 0; r !== (n ? -1 : t.length);) {
                if (6 === (a = t[r]).tag) {
                    var i = (a = a.stateNode).ownerDocument.createRange();
                    i.selectNodeContents(a), a = i.getBoundingClientRect(), window.scrollTo(window.scrollX + a.left, n ? window.scrollY + a.top : window.scrollY + a.bottom - window.innerHeight)
                } else g(a).scrollIntoView(e);
                r += n ? -1 : 1
            }
    };
    var cG = null;

    function cQ(e) {
        e = e.nextSibling;
        for (var t = 0; e;) {
            if (8 === e.nodeType) {
                var n = e.data;
                if ("/$" === n || "/&" === n) {
                    if (0 === t) return cZ(e.nextSibling);
                    t--
                } else "$" !== n && "$!" !== n && "$?" !== n && "$~" !== n && "&" !== n || t++
            }
            e = e.nextSibling
        }
        return null
    }

    function cY(e) {
        e = e.previousSibling;
        for (var t = 0; e;) {
            if (8 === e.nodeType) {
                var n = e.data;
                if ("$" === n || "$!" === n || "$?" === n || "$~" === n || "&" === n) {
                    if (0 === t) return e;
                    t--
                } else "/$" !== n && "/&" !== n || t++
            }
            e = e.previousSibling
        }
        return null
    }

    function cX(e, t, n) {
        switch (t = cu(n), e) {
            case "html":
                if (!(e = t.documentElement)) throw Error(s(452));
                return e;
            case "head":
                if (!(e = t.head)) throw Error(s(453));
                return e;
            case "body":
                if (!(e = t.body)) throw Error(s(454));
                return e;
            default:
                throw Error(s(451))
        }
    }

    function cJ(e) {
        for (var t = e.attributes; t.length;) e.removeAttributeNode(t[0]);
        e0(e)
    }
    var c0 = new Map,
        c1 = new Set;

    function c2(e) {
        return "function" == typeof e.getRootNode ? e.getRootNode() : 9 === e.nodeType ? e : e.ownerDocument
    }
    var c4 = H.d;
    H.d = {
        f: function() {
            var e = c4.f(),
                t = ur();
            return e || t
        },
        r: function(e) {
            var t = e2(e);
            null !== t && 5 === t.tag && "form" === t.type ? op(t) : c4.r(e)
        },
        D: function(e) {
            c4.D(e), c5("dns-prefetch", e, null)
        },
        C: function(e, t) {
            c4.C(e, t), c5("preconnect", e, t)
        },
        L: function(e, t, n) {
            if (c4.L(e, t, n), c3 && e && t) {
                var r = 'link[rel="preload"][as="' + th(t) + '"]';
                "image" === t && n && n.imageSrcSet ? (r += '[imagesrcset="' + th(n.imageSrcSet) + '"]', "string" == typeof n.imageSizes && (r += '[imagesizes="' + th(n.imageSizes) + '"]')) : r += '[href="' + th(e) + '"]';
                var a = r;
                switch (t) {
                    case "style":
                        a = c9(e);
                        break;
                    case "script":
                        a = de(e)
                }
                c0.has(a) || (e = x({
                    rel: "preload",
                    href: "image" === t && n && n.imageSrcSet ? void 0 : e,
                    as: t
                }, n), c0.set(a, e), null !== c3.querySelector(r) || "style" === t && c3.querySelector(c6(a)) || "script" === t && c3.querySelector(dt(a)) || (ci(t = c3.createElement("link"), "link", e), e5(t), c3.head.appendChild(t)))
            }
        },
        m: function(e, t) {
            if (c4.m(e, t), c3 && e) {
                var n = t && "string" == typeof t.as ? t.as : "script",
                    r = 'link[rel="modulepreload"][as="' + th(n) + '"][href="' + th(e) + '"]',
                    a = r;
                switch (n) {
                    case "audioworklet":
                    case "paintworklet":
                    case "serviceworker":
                    case "sharedworker":
                    case "worker":
                    case "script":
                        a = de(e)
                }
                if (!c0.has(a) && (e = x({
                        rel: "modulepreload",
                        href: e
                    }, t), c0.set(a, e), null === c3.querySelector(r))) {
                    switch (n) {
                        case "audioworklet":
                        case "paintworklet":
                        case "serviceworker":
                        case "sharedworker":
                        case "worker":
                        case "script":
                            if (c3.querySelector(dt(a))) return
                    }
                    ci(n = c3.createElement("link"), "link", e), e5(n), c3.head.appendChild(n)
                }
            }
        },
        X: function(e, t) {
            if (c4.X(e, t), c3 && e) {
                var n = e3(c3).hoistableScripts,
                    r = de(e),
                    a = n.get(r);
                a || ((a = c3.querySelector(dt(r))) || (e = x({
                    src: e,
                    async: !0
                }, t), (t = c0.get(r)) && di(e, t), e5(a = c3.createElement("script")), ci(a, "link", e), c3.head.appendChild(a)), a = {
                    type: "script",
                    instance: a,
                    count: 1,
                    state: null
                }, n.set(r, a))
            }
        },
        S: function(e, t, n) {
            if (c4.S(e, t, n), c3 && e) {
                var r = e3(c3).hoistableStyles,
                    a = c9(e);
                t = t || "default";
                var i = r.get(a);
                if (!i) {
                    var o = {
                        loading: 0,
                        preload: null
                    };
                    if (i = c3.querySelector(c6(a))) o.loading = 5;
                    else {
                        e = x({
                            rel: "stylesheet",
                            href: e,
                            "data-precedence": t
                        }, n), (n = c0.get(a)) && da(e, n);
                        var l = i = c3.createElement("link");
                        e5(l), ci(l, "link", e), l._p = new Promise(function(e, t) {
                            l.onload = e, l.onerror = t
                        }), l.addEventListener("load", function() {
                            o.loading |= 1
                        }), l.addEventListener("error", function() {
                            o.loading |= 2
                        }), o.loading |= 4, dr(i, t, c3)
                    }
                    i = {
                        type: "stylesheet",
                        instance: i,
                        count: 1,
                        state: o
                    }, r.set(a, i)
                }
            }
        },
        M: function(e, t) {
            if (c4.M(e, t), c3 && e) {
                var n = e3(c3).hoistableScripts,
                    r = de(e),
                    a = n.get(r);
                a || ((a = c3.querySelector(dt(r))) || (e = x({
                    src: e,
                    async: !0,
                    type: "module"
                }, t), (t = c0.get(r)) && di(e, t), e5(a = c3.createElement("script")), ci(a, "link", e), c3.head.appendChild(a)), a = {
                    type: "script",
                    instance: a,
                    count: 1,
                    state: null
                }, n.set(r, a))
            }
        }
    };
    var c3 = "u" < typeof document ? null : document;

    function c5(e, t, n) {
        if (c3 && "string" == typeof t && t) {
            var r = th(t);
            r = 'link[rel="' + e + '"][href="' + r + '"]', "string" == typeof n && (r += '[crossorigin="' + n + '"]'), c1.has(r) || (c1.add(r), e = {
                rel: e,
                crossOrigin: n,
                href: t
            }, null === c3.querySelector(r) && (ci(t = c3.createElement("link"), "link", e), e5(t), c3.head.appendChild(t)))
        }
    }

    function c8(e, t, n, r) {
        var a = (a = en.current) ? c2(a) : null;
        if (!a) throw Error(s(446));
        switch (e) {
            case "meta":
            case "title":
                return null;
            case "style":
                return "string" == typeof n.precedence && "string" == typeof n.href ? (t = c9(n.href), (r = (n = e3(a).hoistableStyles).get(t)) || (r = {
                    type: "style",
                    instance: null,
                    count: 0,
                    state: null
                }, n.set(t, r)), r) : {
                    type: "void",
                    instance: null,
                    count: 0,
                    state: null
                };
            case "link":
                if ("stylesheet" === n.rel && "string" == typeof n.href && "string" == typeof n.precedence) {
                    e = c9(n.href);
                    var i, o, l, u, c = e3(a).hoistableStyles,
                        d = c.get(e);
                    if (d || (a = a.ownerDocument || a, d = {
                            type: "stylesheet",
                            instance: null,
                            count: 0,
                            state: {
                                loading: 0,
                                preload: null
                            }
                        }, c.set(e, d), (c = a.querySelector(c6(e))) && !c._p && (d.instance = c, d.state.loading = 5), c0.has(e) || (n = {
                            rel: "preload",
                            as: "style",
                            href: n.href,
                            crossOrigin: n.crossOrigin,
                            integrity: n.integrity,
                            media: n.media,
                            hrefLang: n.hrefLang,
                            referrerPolicy: n.referrerPolicy
                        }, c0.set(e, n), c || (i = a, o = e, l = n, u = d.state, i.querySelector('link[rel="preload"][as="style"][' + o + "]") ? u.loading = 1 : (u.preload = o = i.createElement("link"), o.addEventListener("load", function() {
                            return u.loading |= 1
                        }), o.addEventListener("error", function() {
                            return u.loading |= 2
                        }), ci(o, "link", l), e5(o), i.head.appendChild(o))))), t && null === r) throw Error(s(528, ""));
                    return d
                }
                if (t && null !== r) throw Error(s(529, ""));
                return null;
            case "script":
                return t = n.async, "string" == typeof(n = n.src) && t && "function" != typeof t && "symbol" != typeof t ? (t = de(n), (r = (n = e3(a).hoistableScripts).get(t)) || (r = {
                    type: "script",
                    instance: null,
                    count: 0,
                    state: null
                }, n.set(t, r)), r) : {
                    type: "void",
                    instance: null,
                    count: 0,
                    state: null
                };
            default:
                throw Error(s(444, e))
        }
    }

    function c9(e) {
        return 'href="' + th(e) + '"'
    }

    function c6(e) {
        return 'link[rel="stylesheet"][' + e + "]"
    }

    function c7(e) {
        return x({}, e, {
            "data-precedence": e.precedence,
            precedence: null
        })
    }

    function de(e) {
        return '[src="' + th(e) + '"]'
    }

    function dt(e) {
        return "script[async]" + e
    }

    function dn(e, t, n) {
        if (t.count++, null === t.instance) switch (t.type) {
            case "style":
                var r = e.querySelector('style[data-href~="' + th(n.href) + '"]');
                if (r) return t.instance = r, e5(r), r;
                var a = x({}, n, {
                    "data-href": n.href,
                    "data-precedence": n.precedence,
                    href: null,
                    precedence: null
                });
                return e5(r = (e.ownerDocument || e).createElement("style")), ci(r, "style", a), dr(r, n.precedence, e), t.instance = r;
            case "stylesheet":
                a = c9(n.href);
                var i = e.querySelector(c6(a));
                if (i) return t.state.loading |= 4, t.instance = i, e5(i), i;
                r = c7(n), (a = c0.get(a)) && da(r, a), e5(i = (e.ownerDocument || e).createElement("link"));
                var o = i;
                return o._p = new Promise(function(e, t) {
                    o.onload = e, o.onerror = t
                }), ci(i, "link", r), t.state.loading |= 4, dr(i, n.precedence, e), t.instance = i;
            case "script":
                if (i = de(n.src), a = e.querySelector(dt(i))) return t.instance = a, e5(a), a;
                return r = n, (a = c0.get(i)) && di(r = x({}, n), a), e5(a = (e = e.ownerDocument || e).createElement("script")), ci(a, "link", r), e.head.appendChild(a), t.instance = a;
            case "void":
                return null;
            default:
                throw Error(s(443, t.type))
        }
        return "stylesheet" === t.type && 0 == (4 & t.state.loading) && (r = t.instance, t.state.loading |= 4, dr(r, n.precedence, e)), t.instance
    }

    function dr(e, t, n) {
        for (var r = n.querySelectorAll('link[rel="stylesheet"][data-precedence],style[data-precedence]'), a = r.length ? r[r.length - 1] : null, i = a, o = 0; o < r.length; o++) {
            var l = r[o];
            if (l.dataset.precedence === t) i = l;
            else if (i !== a) break
        }
        i ? i.parentNode.insertBefore(e, i.nextSibling) : (t = 9 === n.nodeType ? n.head : n).insertBefore(e, t.firstChild)
    }

    function da(e, t) {
        null == e.crossOrigin && (e.crossOrigin = t.crossOrigin), null == e.referrerPolicy && (e.referrerPolicy = t.referrerPolicy), null == e.title && (e.title = t.title)
    }

    function di(e, t) {
        null == e.crossOrigin && (e.crossOrigin = t.crossOrigin), null == e.referrerPolicy && (e.referrerPolicy = t.referrerPolicy), null == e.integrity && (e.integrity = t.integrity)
    }
    var dl = null;

    function ds(e, t, n) {
        if (null === dl) {
            var r = new Map,
                a = dl = new Map;
            a.set(n, r)
        } else(r = (a = dl).get(n)) || (r = new Map, a.set(n, r));
        if (r.has(e)) return r;
        for (r.set(e, null), n = n.getElementsByTagName(e), a = 0; a < n.length; a++) {
            var i = n[a];
            if (!(i[eJ] || i[eK] || "link" === e && "stylesheet" === i.getAttribute("rel")) && "http://www.w3.org/2000/svg" !== i.namespaceURI) {
                var o = i.getAttribute(t) || "";
                o = e + o;
                var l = r.get(o);
                l ? l.push(i) : r.set(o, [i])
            }
        }
        return r
    }

    function du(e, t, n) {
        (e = e.ownerDocument || e).head.insertBefore(n, "title" === t ? e.querySelector("head > title") : null)
    }

    function dc(e, t) {
        return "img" === e && null != t.src && "" !== t.src && null == t.onLoad && "lazy" !== t.loading
    }

    function dd(e) {
        return "stylesheet" !== e.type || 0 != (3 & e.state.loading)
    }

    function df(e) {
        return (e.width || 100) * (e.height || 100) * ("number" == typeof devicePixelRatio ? devicePixelRatio : 1) * .25
    }

    function dp(e, t) {
        "function" == typeof t.decode && (e.imgCount++, t.complete || (e.imgBytes += df(t), e.suspenseyImages.push(t)), e = dv.bind(e), t.decode().then(e, e))
    }
    var dh = 0;

    function dm(e) {
        if (0 === e.count && (0 === e.imgCount || !e.waitingForImages)) {
            if (e.stylesheets) db(e, e.stylesheets);
            else if (e.unsuspend) {
                var t = e.unsuspend;
                e.unsuspend = null, t()
            }
        }
    }

    function dg() {
        this.count--, dm(this)
    }

    function dv() {
        this.imgCount--, dm(this)
    }
    var dy = null;

    function db(e, t) {
        e.stylesheets = null, null !== e.unsuspend && (e.count++, dy = new Map, t.forEach(dw, e), dy = null, dg.call(e))
    }

    function dw(e, t) {
        if (!(4 & t.state.loading)) {
            var n = dy.get(e);
            if (n) var r = n.get(null);
            else {
                n = new Map, dy.set(e, n);
                for (var a = e.querySelectorAll("link[data-precedence],style[data-precedence]"), i = 0; i < a.length; i++) {
                    var o = a[i];
                    ("LINK" === o.nodeName || "not all" !== o.getAttribute("media")) && (n.set(o.dataset.precedence, o), r = o)
                }
                r && n.set(null, r)
            }
            o = (a = t.instance).getAttribute("data-precedence"), (i = n.get(o) || r) === r && n.set(null, a), n.set(o, a), this.count++, r = dg.bind(this), a.addEventListener("load", r), a.addEventListener("error", r), i ? i.parentNode.insertBefore(a, i.nextSibling) : (e = 9 === e.nodeType ? e.head : e).insertBefore(a, e.firstChild), t.state.loading |= 4
        }
    }
    var d_ = {
        $$typeof: I,
        Provider: null,
        Consumer: null,
        _currentValue: Z,
        _currentValue2: Z,
        _threadCount: 0
    };

    function dS(e, t, n, r, a, i, o, l, s) {
        this.tag = 1, this.containerInfo = e, this.pingCache = this.current = this.pendingChildren = null, this.timeoutHandle = -1, this.callbackNode = this.next = this.pendingContext = this.context = this.cancelPendingCommit = null, this.callbackPriority = 0, this.expirationTimes = eM(-1), this.entangledLanes = this.shellSuspendCounter = this.errorRecoveryDisabledLanes = this.expiredLanes = this.warmLanes = this.pingedLanes = this.suspendedLanes = this.pendingLanes = 0, this.entanglements = eM(0), this.hiddenUpdates = eM(null), this.identifierPrefix = r, this.onUncaughtError = a, this.onCaughtError = i, this.onRecoverableError = o, this.pooledCache = null, this.pooledCacheLanes = 0, this.formState = s, this.transitionTypes = null, this.incompleteTransitions = new Map
    }

    function dk(e, t, n, r, a, i, o, l, s, u, c, d) {
        return e = new dS(e, t, n, o, s, u, c, d, l), t = 1, !0 === i && (t |= 24), i = ry(3, null, null, t), e.current = i, i.stateNode = e, t = au(), t.refCount++, e.pooledCache = t, t.refCount++, i.memoizedState = {
            element: r,
            isDehydrated: n,
            cache: t
        }, aq(i), e
    }

    function dx(e, t, n, r, a, i) {
        a = a ? rg : rg, null === r.context ? r.context = a : r.pendingContext = a, (r = aV(t)).payload = {
            element: n
        }, null !== (i = void 0 === i ? null : i) && (r.callback = i), null !== (n = aW(e, r, t)) && (s7(n, e, t), aK(n, e, t))
    }

    function dE(e, t) {
        if (null !== (e = e.memoizedState) && null !== e.dehydrated) {
            var n = e.retryLane;
            e.retryLane = 0 !== n && n < t ? n : t
        }
    }

    function dT(e, t) {
        dE(e, t), (e = e.alternate) && dE(e, t)
    }

    function dN(e) {
        if (13 === e.tag || 31 === e.tag) {
            var t = rp(e, 0x4000000);
            null !== t && s7(t, e, 0x4000000), dT(e, 0x4000000)
        }
    }

    function dC(e) {
        if (13 === e.tag || 31 === e.tag) {
            var t = s8(),
                n = rp(e, t = eB(t));
            null !== n && s7(n, e, t), dT(e, t)
        }
    }
    var dO = !0;

    function dR(e, t, n, r) {
        var a = K.T;
        K.T = null;
        var i = H.p;
        try {
            H.p = 2, dI(e, t, n, r)
        } finally {
            H.p = i, K.T = a
        }
    }

    function dP(e, t, n, r) {
        var a = K.T;
        K.T = null;
        var i = H.p;
        try {
            H.p = 8, dI(e, t, n, r)
        } finally {
            H.p = i, K.T = a
        }
    }

    function dI(e, t, n, r) {
        if (dO) {
            var a = dA(r);
            if (null === a) u3(e, t, r, dL, n), dW(e, r);
            else if (function(e, t, n, r, a) {
                    switch (t) {
                        case "focusin":
                            return dF = dK(dF, e, t, n, r, a), !0;
                        case "dragenter":
                            return dj = dK(dj, e, t, n, r, a), !0;
                        case "mouseover":
                            return dU = dK(dU, e, t, n, r, a), !0;
                        case "pointerover":
                            var i = a.pointerId;
                            return dB.set(i, dK(dB.get(i) || null, e, t, n, r, a)), !0;
                        case "gotpointercapture":
                            return i = a.pointerId, dq.set(i, dK(dq.get(i) || null, e, t, n, r, a)), !0
                    }
                    return !1
                }(a, e, t, n, r)) r.stopPropagation();
            else if (dW(e, r), 4 & t && -1 < dV.indexOf(e)) {
                for (; null !== a;) {
                    var i = e2(a);
                    if (null !== i) switch (i.tag) {
                        case 3:
                            if ((i = i.stateNode).current.memoizedState.isDehydrated) {
                                var o = eI(i.pendingLanes);
                                if (0 !== o) {
                                    var l = i;
                                    for (l.pendingLanes |= 2, l.entangledLanes |= 2; o;) {
                                        var s = 1 << 31 - eT(o);
                                        l.entanglements[1] |= s, o &= ~s
                                    }
                                    uj(i), 0 == (6 & sx) && (sW = ev() + 500, uU(0, !1))
                                }
                            }
                            break;
                        case 31:
                        case 13:
                            null !== (l = rp(i, 2)) && s7(l, i, 2), ur(), dT(i, 2)
                    }
                    if (null === (i = dA(r)) && u3(e, t, r, dL, n), i === a) break;
                    a = i
                }
                null !== a && r.stopPropagation()
            } else u3(e, t, r, null, n)
        }
    }

    function dA(e) {
        return dD(e = tP(e))
    }
    var dL = null;

    function dD(e) {
        if (dL = null, null !== (e = e1(e))) {
            var t = c(e);
            if (null === t) e = null;
            else {
                var n = t.tag;
                if (13 === n) {
                    if (null !== (e = d(t))) return e;
                    e = null
                } else if (31 === n) {
                    if (null !== (e = f(t))) return e;
                    e = null
                } else if (3 === n) {
                    if (t.stateNode.current.memoizedState.isDehydrated) return 3 === t.tag ? t.stateNode.containerInfo : null;
                    e = null
                } else t !== e && (e = null)
            }
        }
        return dL = e, null
    }

    function dM(e) {
        switch (e) {
            case "beforetoggle":
            case "cancel":
            case "click":
            case "close":
            case "contextmenu":
            case "copy":
            case "cut":
            case "auxclick":
            case "dblclick":
            case "dragend":
            case "dragstart":
            case "drop":
            case "focusin":
            case "focusout":
            case "input":
            case "invalid":
            case "keydown":
            case "keypress":
            case "keyup":
            case "mousedown":
            case "mouseup":
            case "paste":
            case "pause":
            case "play":
            case "pointercancel":
            case "pointerdown":
            case "pointerup":
            case "ratechange":
            case "reset":
            case "seeked":
            case "submit":
            case "toggle":
            case "touchcancel":
            case "touchend":
            case "touchstart":
            case "volumechange":
            case "change":
            case "selectionchange":
            case "textInput":
            case "compositionstart":
            case "compositionend":
            case "compositionupdate":
            case "beforeblur":
            case "afterblur":
            case "beforeinput":
            case "blur":
            case "fullscreenchange":
            case "fullscreenerror":
            case "focus":
            case "hashchange":
            case "popstate":
            case "select":
            case "selectstart":
                return 2;
            case "drag":
            case "dragenter":
            case "dragexit":
            case "dragleave":
            case "dragover":
            case "mousemove":
            case "mouseout":
            case "mouseover":
            case "pointermove":
            case "pointerout":
            case "pointerover":
            case "resize":
            case "scroll":
            case "touchmove":
            case "wheel":
            case "mouseenter":
            case "mouseleave":
            case "pointerenter":
            case "pointerleave":
                return 8;
            case "message":
                switch (ey()) {
                    case eb:
                        return 2;
                    case ew:
                        return 8;
                    case e_:
                    case eS:
                        return 32;
                    case ek:
                        return 0x10000000;
                    default:
                        return 32
                }
            default:
                return 32
        }
    }
    var dz = !1,
        dF = null,
        dj = null,
        dU = null,
        dB = new Map,
        dq = new Map,
        d$ = [],
        dV = "mousedown mouseup touchcancel touchend touchstart auxclick dblclick pointercancel pointerdown pointerup dragend dragstart drop compositionend compositionstart keydown keypress keyup input textInput copy cut paste click change contextmenu reset".split(" ");

    function dW(e, t) {
        switch (e) {
            case "focusin":
            case "focusout":
                dF = null;
                break;
            case "dragenter":
            case "dragleave":
                dj = null;
                break;
            case "mouseover":
            case "mouseout":
                dU = null;
                break;
            case "pointerover":
            case "pointerout":
                dB.delete(t.pointerId);
                break;
            case "gotpointercapture":
            case "lostpointercapture":
                dq.delete(t.pointerId)
        }
    }

    function dK(e, t, n, r, a, i) {
        return null === e || e.nativeEvent !== i ? (e = {
            blockedOn: t,
            domEventName: n,
            eventSystemFlags: r,
            nativeEvent: i,
            targetContainers: [a]
        }, null !== t && null !== (t = e2(t)) && dN(t)) : (e.eventSystemFlags |= r, t = e.targetContainers, null !== a && -1 === t.indexOf(a) && t.push(a)), e
    }

    function dH(e) {
        var t = e1(e.target);
        if (null !== t) {
            var n = c(t);
            if (null !== n) {
                if (13 === (t = n.tag)) {
                    if (null !== (t = d(n))) {
                        e.blockedOn = t, eV(e.priority, function() {
                            dC(n)
                        });
                        return
                    }
                } else if (31 === t) {
                    if (null !== (t = f(n))) {
                        e.blockedOn = t, eV(e.priority, function() {
                            dC(n)
                        });
                        return
                    }
                } else if (3 === t && n.stateNode.current.memoizedState.isDehydrated) {
                    e.blockedOn = 3 === n.tag ? n.stateNode.containerInfo : null;
                    return
                }
            }
        }
        e.blockedOn = null
    }

    function dZ(e) {
        if (null !== e.blockedOn) return !1;
        for (var t = e.targetContainers; 0 < t.length;) {
            var n = dA(e.nativeEvent);
            if (null !== n) return null !== (t = e2(n)) && dN(t), e.blockedOn = n, !1;
            var r = new(n = e.nativeEvent).constructor(n.type, n);
            tR = r, n.target.dispatchEvent(r), tR = null, t.shift()
        }
        return !0
    }

    function dG(e, t, n) {
        dZ(e) && n.delete(t)
    }

    function dQ() {
        dz = !1, null !== dF && dZ(dF) && (dF = null), null !== dj && dZ(dj) && (dj = null), null !== dU && dZ(dU) && (dU = null), dB.forEach(dG), dq.forEach(dG)
    }

    function dY(e, t) {
        e.blockedOn === t && (e.blockedOn = null, dz || (dz = !0, i.unstable_scheduleCallback(i.unstable_NormalPriority, dQ)))
    }
    var dX = null;

    function dJ(e) {
        dX !== e && (dX = e, i.unstable_scheduleCallback(i.unstable_NormalPriority, function() {
            dX === e && (dX = null);
            for (var t = 0; t < e.length; t += 3) {
                var n = e[t],
                    r = e[t + 1],
                    a = e[t + 2];
                if ("function" != typeof r)
                    if (null === dD(r || n)) continue;
                    else break;
                var i = e2(n);
                null !== i && (e.splice(t, 3), t -= 3, od(i, {
                    pending: !0,
                    data: a,
                    method: n.method,
                    action: r
                }, r, a))
            }
        }))
    }

    function d0(e) {
        function t(t) {
            return dY(t, e)
        }
        null !== dF && dY(dF, e), null !== dj && dY(dj, e), null !== dU && dY(dU, e), dB.forEach(t), dq.forEach(t);
        for (var n = 0; n < d$.length; n++) {
            var r = d$[n];
            r.blockedOn === e && (r.blockedOn = null)
        }
        for (; 0 < d$.length && null === (n = d$[0]).blockedOn;) dH(n), null === n.blockedOn && d$.shift();
        if (null != (n = (e.ownerDocument || e).$$reactFormReplay))
            for (r = 0; r < n.length; r += 3) {
                var a = n[r],
                    i = n[r + 1],
                    o = a[eH] || null;
                if ("function" == typeof i) o || dJ(n);
                else if (o) {
                    var l = null;
                    if (i && i.hasAttribute("formAction")) {
                        if (a = i, o = i[eH] || null) l = o.formAction;
                        else if (null !== dD(a)) continue
                    } else l = o.action;
                    "function" == typeof l ? n[r + 1] = l : (n.splice(r, 3), r -= 3), dJ(n)
                }
            }
    }

    function d1() {
        function e(e) {
            e.canIntercept && "react-transition" === e.info && e.intercept({
                handler: function() {
                    return new Promise(function(e) {
                        return a = e
                    })
                },
                focusReset: "manual",
                scroll: "manual"
            })
        }

        function t() {
            null !== a && (a(), a = null), r || setTimeout(n, 20)
        }

        function n() {
            if (!r && !navigation.transition) {
                var e = navigation.currentEntry;
                e && null != e.url && navigation.navigate(e.url, {
                    state: e.getState(),
                    info: "react-transition",
                    history: "replace"
                })
            }
        }
        if ("object" == typeof navigation) {
            var r = !1,
                a = null;
            return navigation.addEventListener("navigate", e), navigation.addEventListener("navigatesuccess", t), navigation.addEventListener("navigateerror", t), setTimeout(n, 100),
                function() {
                    r = !0, navigation.removeEventListener("navigate", e), navigation.removeEventListener("navigatesuccess", t), navigation.removeEventListener("navigateerror", t), null !== a && (a(), a = null)
                }
        }
    }

    function d2(e) {
        this._internalRoot = e
    }

    function d4(e) {
        this._internalRoot = e
    }
    d4.prototype.render = d2.prototype.render = function(e) {
        var t = this._internalRoot;
        if (null === t) throw Error(s(409));
        dx(t.current, s8(), e, t, null, null)
    }, d4.prototype.unmount = d2.prototype.unmount = function() {
        var e = this._internalRoot;
        if (null !== e) {
            this._internalRoot = null;
            var t = e.containerInfo;
            dx(e.current, 2, null, e, null, null), ur(), t[eZ] = null
        }
    }, d4.prototype.unstable_scheduleHydration = function(e) {
        if (e) {
            var t = e$();
            e = {
                blockedOn: null,
                target: e,
                priority: t
            };
            for (var n = 0; n < d$.length && 0 !== t && t < d$[n].priority; n++);
            d$.splice(n, 0, e), 0 === n && dH(e)
        }
    };
    var d3 = o.version;
    if ("19.3.0-canary-3f0b9e61-20260317" !== d3) throw Error(s(527, d3, "19.3.0-canary-3f0b9e61-20260317"));
    if (H.findDOMNode = function(e) {
            var t = e._reactInternals;
            if (void 0 === t) {
                if ("function" == typeof e.render) throw Error(s(188));
                throw Error(s(268, e = Object.keys(e).join(",")))
            }
            return null === (e = null !== (e = function(e) {
                var t = e.alternate;
                if (!t) {
                    if (null === (t = c(e))) throw Error(s(188));
                    return t !== e ? null : e
                }
                for (var n = e, r = t;;) {
                    var a = n.return;
                    if (null === a) break;
                    var i = a.alternate;
                    if (null === i) {
                        if (null !== (r = a.return)) {
                            n = r;
                            continue
                        }
                        break
                    }
                    if (a.child === i.child) {
                        for (i = a.child; i;) {
                            if (i === n) return p(a), e;
                            if (i === r) return p(a), t;
                            i = i.sibling
                        }
                        throw Error(s(188))
                    }
                    if (n.return !== r.return) n = a, r = i;
                    else {
                        for (var o = !1, l = a.child; l;) {
                            if (l === n) {
                                o = !0, n = a, r = i;
                                break
                            }
                            if (l === r) {
                                o = !0, r = a, n = i;
                                break
                            }
                            l = l.sibling
                        }
                        if (!o) {
                            for (l = i.child; l;) {
                                if (l === n) {
                                    o = !0, n = i, r = a;
                                    break
                                }
                                if (l === r) {
                                    o = !0, r = i, n = a;
                                    break
                                }
                                l = l.sibling
                            }
                            if (!o) throw Error(s(189))
                        }
                    }
                    if (n.alternate !== r) throw Error(s(190))
                }
                if (3 !== n.tag) throw Error(s(188));
                return n.stateNode.current === n ? e : t
            }(t)) ? function e(t) {
                var n = t.tag;
                if (5 === n || 26 === n || 27 === n || 6 === n) return t;
                for (t = t.child; null !== t;) {
                    if (null !== (n = e(t))) return n;
                    t = t.sibling
                }
                return null
            }(e) : null) ? null : e.stateNode
        }, "u" > typeof __REACT_DEVTOOLS_GLOBAL_HOOK__) {
        var d5 = __REACT_DEVTOOLS_GLOBAL_HOOK__;
        if (!d5.isDisabled && d5.supportsFiber) try {
            ex = d5.inject({
                bundleType: 0,
                version: "19.3.0-canary-3f0b9e61-20260317",
                rendererPackageName: "react-dom",
                currentDispatcherRef: K,
                reconcilerVersion: "19.3.0-canary-3f0b9e61-20260317"
            }), eE = d5
        } catch (e) {}
    }
    n.createRoot = function(e, t) {
        if (!u(e)) throw Error(s(299));
        var n = !1,
            r = "",
            a = oL,
            i = oD,
            o = oM;
        return null != t && (!0 === t.unstable_strictMode && (n = !0), void 0 !== t.identifierPrefix && (r = t.identifierPrefix), void 0 !== t.onUncaughtError && (a = t.onUncaughtError), void 0 !== t.onCaughtError && (i = t.onCaughtError), void 0 !== t.onRecoverableError && (o = t.onRecoverableError)), t = dk(e, 1, !1, null, null, n, r, null, a, i, o, d1), e[eZ] = t.current, u2(e), new d2(t)
    }, n.hydrateRoot = function(e, t, n) {
        if (!u(e)) throw Error(s(299));
        var r, a = !1,
            i = "",
            o = oL,
            l = oD,
            c = oM,
            d = null;
        return null != n && (!0 === n.unstable_strictMode && (a = !0), void 0 !== n.identifierPrefix && (i = n.identifierPrefix), void 0 !== n.onUncaughtError && (o = n.onUncaughtError), void 0 !== n.onCaughtError && (l = n.onCaughtError), void 0 !== n.onRecoverableError && (c = n.onRecoverableError), void 0 !== n.formState && (d = n.formState)), (t = dk(e, 1, !0, t, null != n ? n : null, a, i, d, o, l, c, d1)).context = (r = null, rg), n = t.current, (i = aV(a = eB(a = s8()))).callback = null, aW(n, i, a), n = a, t.current.lanes = n, ez(t, n), uj(t), e[eZ] = t.current, u2(e), new d4(t)
    }, n.version = "19.3.0-canary-3f0b9e61-20260317"
}, 859980, (e, t, n) => {
    "use strict";
    ! function e() {
        if ("u" > typeof __REACT_DEVTOOLS_GLOBAL_HOOK__ && "function" == typeof __REACT_DEVTOOLS_GLOBAL_HOOK__.checkDCE) try {
            __REACT_DEVTOOLS_GLOBAL_HOOK__.checkDCE(e)
        } catch (e) {
            console.error(e)
        }
    }(), t.exports = e.r(368824)
}, 847812, (e, t, n) => {
    "use strict";
    Object.defineProperty(n, "__esModule", {
        value: !0
    });
    var r = {
        onCaughtError: function() {
            return f
        },
        onUncaughtError: function() {
            return p
        }
    };
    for (var a in r) Object.defineProperty(n, a, {
        enumerable: !0,
        get: r[a]
    });
    let i = e.r(481258),
        o = e.r(346496),
        l = e.r(397204),
        s = e.r(915121),
        u = e.r(884592),
        c = i._(e.r(150582)),
        d = {
            decorateDevError: e => e,
            handleClientError: () => {},
            originConsoleError: console.error.bind(console)
        };

    function f(e, t) {
        let n, r = t.errorBoundary?.constructor;
        if (n = n || r === u.ErrorBoundaryHandler && t.errorBoundary.props.errorComponent === c.default) return p(e);
        (0, l.isBailoutToCSRError)(e) || (0, o.isNextRouterError)(e) || d.originConsoleError(e)
    }

    function p(e) {
        (0, l.isBailoutToCSRError)(e) || (0, o.isNextRouterError)(e) || (0, s.reportGlobalError)(e)
    }("function" == typeof n.default || "object" == typeof n.default && null !== n.default) && void 0 === n.default.__esModule && (Object.defineProperty(n.default, "__esModule", {
        value: !0
    }), Object.assign(n.default, n), t.exports = n.default)
}, 524878, (e, t, n) => {
    "use strict";
    Object.defineProperty(n, "__esModule", {
        value: !0
    }), Object.defineProperty(n, "AppRouterAnnouncer", {
        enumerable: !0,
        get: function() {
            return o
        }
    });
    let r = e.r(420482),
        a = e.r(301775),
        i = "next-route-announcer";

    function o(e) {
        let {
            tree: t
        } = e, [n, o] = (0, r.useState)(null);
        (0, r.useEffect)(() => (o(function() {
            let e = document.getElementsByName(i)[0];
            if (e?.shadowRoot?.childNodes[0]) return e.shadowRoot.childNodes[0];
            {
                let e = document.createElement(i);
                e.style.cssText = "position:absolute";
                let t = document.createElement("div");
                return t.ariaLive = "assertive", t.id = "__next-route-announcer__", t.role = "alert", t.style.cssText = "position:absolute;border:0;height:1px;margin:-1px;padding:0;width:1px;clip:rect(0 0 0 0);overflow:hidden;white-space:nowrap;word-wrap:normal", e.attachShadow({
                    mode: "open"
                }).appendChild(t), document.body.appendChild(e), t
            }
        }()), () => {
            let e = document.getElementsByTagName(i)[0];
            e?.isConnected && document.body.removeChild(e)
        }), []);
        let [l, s] = (0, r.useState)(""), u = (0, r.useRef)(void 0);
        return (0, r.useEffect)(() => {
            let e = "";
            if (document.title) e = document.title;
            else {
                let t = document.querySelector("h1");
                t && (e = t.innerText || t.textContent || "")
            }
            void 0 !== u.current && u.current !== e && s(e), u.current = e
        }, [t]), n ? (0, a.createPortal)(l, n) : null
    }("function" == typeof n.default || "object" == typeof n.default && null !== n.default) && void 0 === n.default.__esModule && (Object.defineProperty(n.default, "__esModule", {
        value: !0
    }), Object.assign(n.default, n), t.exports = n.default)
}, 163659, (e, t, n) => {
    "use strict";
    Object.defineProperty(n, "__esModule", {
        value: !0
    }), Object.defineProperty(n, "findHeadInCache", {
        enumerable: !0,
        get: function() {
            return i
        }
    });
    let r = e.r(660073),
        a = e.r(953885);

    function i(e, t) {
        return function e(t, n, i, o) {
            if (0 === Object.keys(n).length) return [t, i, o];
            let l = Object.keys(n).filter(e => "children" !== e);
            "children" in n && l.unshift("children");
            let s = t.slots;
            if (null !== s)
                for (let t of l) {
                    let [o, l] = n[t];
                    if (o === r.DEFAULT_SEGMENT_KEY) continue;
                    let u = s[t];
                    if (!u) continue;
                    let c = e(u, l, i + "/" + (0, a.createRouterCacheKey)(o), i + "/" + (0, a.createRouterCacheKey)(o, !0));
                    if (c) return c
                }
            return null
        }(e, t, "", "")
    }("function" == typeof n.default || "object" == typeof n.default && null !== n.default) && void 0 === n.default.__esModule && (Object.defineProperty(n.default, "__esModule", {
        value: !0
    }), Object.assign(n.default, n), t.exports = n.default)
}, 35464, (e, t, n) => {
    "use strict";
    Object.defineProperty(n, "__esModule", {
        value: !0
    });
    var r = {
        GracefulDegradeBoundary: function() {
            return l
        },
        default: function() {
            return s
        }
    };
    for (var a in r) Object.defineProperty(n, a, {
        enumerable: !0,
        get: r[a]
    });
    let i = e.r(19836),
        o = e.r(420482);
    class l extends o.Component {
        static getDerivedStateFromError(e) {
            return {
                hasError: !0
            }
        }
        componentDidMount() {
            let e = this.htmlRef.current;
            this.state.hasError && e && Object.entries(this.htmlAttributes).forEach(t => {
                let [n, r] = t;
                e.setAttribute(n, r)
            })
        }
        render() {
            let {
                hasError: e
            } = this.state;
            return ("u" > typeof window && !this.rootHtml && (this.rootHtml = document.documentElement.innerHTML, this.htmlAttributes = function(e) {
                let t = {};
                for (let n = 0; n < e.attributes.length; n++) {
                    let r = e.attributes[n];
                    t[r.name] = r.value
                }
                return t
            }(document.documentElement)), e) ? (0, i.jsx)("html", {
                ref: this.htmlRef,
                suppressHydrationWarning: !0,
                dangerouslySetInnerHTML: {
                    __html: this.rootHtml
                }
            }) : this.props.children
        }
        constructor(e) {
            super(e), this.state = {
                hasError: !1
            }, this.rootHtml = "", this.htmlAttributes = {}, this.htmlRef = (0, o.createRef)()
        }
    }
    let s = l;
    ("function" == typeof n.default || "object" == typeof n.default && null !== n.default) && void 0 === n.default.__esModule && (Object.defineProperty(n.default, "__esModule", {
        value: !0
    }), Object.assign(n.default, n), t.exports = n.default)
}, 842158, (e, t, n) => {
    "use strict";
    Object.defineProperty(n, "__esModule", {
        value: !0
    }), Object.defineProperty(n, "default", {
        enumerable: !0,
        get: function() {
            return u
        }
    });
    let r = e.r(481258),
        a = e.r(19836);
    e.r(420482);
    let i = r._(e.r(35464)),
        o = e.r(884592),
        l = e.r(180088),
        s = "u" > typeof window && (0, l.isBot)(window.navigator.userAgent);

    function u(e) {
        let {
            children: t,
            errorComponent: n,
            errorStyles: r,
            errorScripts: l
        } = e;
        return s ? (0, a.jsx)(i.default, {
            children: t
        }) : (0, a.jsx)(o.ErrorBoundary, {
            errorComponent: n,
            errorStyles: r,
            errorScripts: l,
            children: t
        })
    }("function" == typeof n.default || "object" == typeof n.default && null !== n.default) && void 0 === n.default.__esModule && (Object.defineProperty(n.default, "__esModule", {
        value: !0
    }), Object.assign(n.default, n), t.exports = n.default)
}, 445968, (e, t, n) => {
    "use strict";
    Object.defineProperty(n, "__esModule", {
        value: !0
    }), Object.defineProperty(n, "default", {
        enumerable: !0,
        get: function() {
            return A
        }
    });
    let r = e.r(481258),
        a = e.r(744066),
        i = e.r(19836),
        o = a._(e.r(420482)),
        l = e.r(466933),
        s = e.r(708724),
        u = e.r(190175),
        c = e.r(288255),
        d = e.r(162663),
        f = e.r(413367),
        p = e.r(524878),
        h = e.r(700707),
        m = e.r(163659),
        g = e.r(279632),
        v = e.r(838588),
        y = e.r(79280),
        b = e.r(551963),
        w = e.r(119327),
        _ = e.r(511259),
        S = e.r(992918),
        k = e.r(526905),
        x = e.r(418776),
        E = r._(e.r(842158)),
        T = r._(e.r(150582)),
        N = e.r(470446);
    e.r(330903);
    let C = {};

    function O(e) {
        let {
            appRouterState: t
        } = e;
        return (0, o.useInsertionEffect)(() => {
            let {
                tree: e,
                pushRef: n,
                canonicalUrl: r,
                renderedSearch: a
            } = t, i = {
                ...n.preserveCustomHistoryState ? window.history.state : {},
                __NA: !0,
                __PRIVATE_NEXTJS_INTERNALS_TREE: {
                    tree: e,
                    renderedSearch: a
                }
            };
            n.pendingPush && (0, u.createHrefFromUrl)(new URL(window.location.href)) !== r ? (n.pendingPush = !1, window.history.pushState(i, "", r)) : window.history.replaceState(i, "", r), (0, f.setLastCommittedTree)(e)
        }, [t]), (0, o.useEffect)(() => {
            (0, x.pingVisibleLinks)(t.nextUrl, t.tree)
        }, [t.nextUrl, t.tree]), null
    }

    function R(e) {
        null == e && (e = {});
        let t = window.history.state,
            n = t?.__NA;
        n && (e.__NA = n);
        let r = t?.__PRIVATE_NEXTJS_INTERNALS_TREE;
        return r && (e.__PRIVATE_NEXTJS_INTERNALS_TREE = r), e
    }

    function P(e) {
        let {
            headCacheNode: t
        } = e, n = null !== t ? t.head : null, r = null !== t ? t.prefetchHead : null, a = null !== r ? r : n;
        return (0, o.useDeferredValue)(n, a)
    }

    function I(e) {
        let t, {
                actionQueue: n,
                globalError: r,
                webSocket: a,
                staticIndicatorState: u
            } = e,
            f = (0, d.useActionQueue)(n),
            {
                canonicalUrl: w
            } = f,
            {
                searchParams: x,
                pathname: T
            } = (0, o.useMemo)(() => {
                let e = new URL(w, "u" < typeof window ? "http://n" : window.location.href);
                return {
                    searchParams: e.searchParams,
                    pathname: (0, y.hasBasePath)(e.pathname) ? (0, v.removeBasePath)(e.pathname) : e.pathname
                }
            }, [w]);
        (0, o.useEffect)(() => {
            let e = (0, b.extractSourcePageFromFlightRouterState)(f.tree);
            void 0 !== e ? window.next.__internal_src_page = e : delete window.next.__internal_src_page
        }, [f.tree]), (0, o.useEffect)(() => {
            function e(e) {
                e.persisted && window.history.state?.__PRIVATE_NEXTJS_INTERNALS_TREE && (C.pendingMpaPath = void 0, (0, d.dispatchAppRouterAction)({
                    type: s.ACTION_RESTORE,
                    url: new URL(window.location.href),
                    historyState: window.history.state.__PRIVATE_NEXTJS_INTERNALS_TREE
                }))
            }
            return window.addEventListener("pageshow", e), () => {
                window.removeEventListener("pageshow", e)
            }
        }, []), (0, o.useEffect)(() => {
            function e(e) {
                let t = "reason" in e ? e.reason : e.error;
                if ((0, k.isRedirectError)(t)) {
                    e.preventDefault();
                    let n = (0, S.getURLFromRedirectError)(t);
                    "push" === (0, S.getRedirectTypeFromError)(t) ? _.publicAppRouterInstance.push(n, {}): _.publicAppRouterInstance.replace(n, {})
                }
            }
            return window.addEventListener("error", e), window.addEventListener("unhandledrejection", e), () => {
                window.removeEventListener("error", e), window.removeEventListener("unhandledrejection", e)
            }
        }, []);
        let {
            pushRef: I
        } = f;
        if (I.mpaNavigation) {
            if (C.pendingMpaPath !== w) {
                let e = window.location;
                I.pendingPush ? e.assign(w) : e.replace(w), C.pendingMpaPath = w
            }
            throw g.unresolvedThenable
        }(0, o.useEffect)(() => {
            let e = window.history.pushState.bind(window.history),
                t = window.history.replaceState.bind(window.history),
                n = e => {
                    let t = window.location.href,
                        n = window.history.state?.__PRIVATE_NEXTJS_INTERNALS_TREE;
                    (0, o.startTransition)(() => {
                        (0, d.dispatchAppRouterAction)({
                            type: s.ACTION_RESTORE,
                            url: new URL(e ?? t, t),
                            historyState: n
                        })
                    })
                };
            window.history.pushState = function(t, r, a) {
                return t?.__NA || t?._N || (t = R(t), a && n(a)), e(t, r, a)
            }, window.history.replaceState = function(e, r, a) {
                return e?.__NA || e?._N || (e = R(e), a && n(a)), t(e, r, a)
            };
            let r = e => {
                if (e.state) {
                    if (!e.state.__NA) return void window.location.reload();
                    (0, o.startTransition)(() => {
                        (0, _.dispatchTraverseAction)(window.location.href, e.state.__PRIVATE_NEXTJS_INTERNALS_TREE)
                    })
                }
            };
            return window.addEventListener("popstate", r), () => {
                window.history.pushState = e, window.history.replaceState = t, window.removeEventListener("popstate", r)
            }
        }, []);
        let {
            cache: A,
            tree: L,
            nextUrl: D,
            focusAndScrollRef: M,
            previousNextUrl: z
        } = f, F = (0, o.useMemo)(() => (0, m.findHeadInCache)(A, L[1]), [A, L]), j = (0, o.useMemo)(() => (0, b.getSelectedParams)(L), [L]), U = (0, o.useMemo)(() => ({
            parentTree: L,
            parentCacheNode: A,
            parentSegmentPath: null,
            parentParams: {},
            parentLoadingData: null,
            debugNameContext: "/",
            url: w,
            isActive: !0
        }), [L, A, w]), B = (0, o.useMemo)(() => ({
            tree: L,
            focusAndScrollRef: M,
            nextUrl: D,
            previousNextUrl: z
        }), [L, M, D, z]);
        if (null !== F) {
            let [e, n, r] = F;
            t = (0, i.jsx)(P, {
                headCacheNode: e
            }, "u" < typeof window ? r : n)
        } else t = null;
        let q = (0, i.jsxs)(h.RedirectBoundary, {
            children: [t, (0, i.jsx)(N.RootLayoutBoundary, {
                children: A.rsc
            }), (0, i.jsx)(p.AppRouterAnnouncer, {
                tree: L
            })]
        });
        return q = (0, i.jsx)(E.default, {
            errorComponent: r[0],
            errorStyles: r[1],
            children: q
        }), (0, i.jsxs)(i.Fragment, {
            children: [(0, i.jsx)(O, {
                appRouterState: f
            }), null, (0, i.jsx)(c.NavigationPromisesContext.Provider, {
                value: null,
                children: (0, i.jsx)(c.PathParamsContext.Provider, {
                    value: j,
                    children: (0, i.jsx)(c.PathnameContext.Provider, {
                        value: T,
                        children: (0, i.jsx)(c.SearchParamsContext.Provider, {
                            value: x,
                            children: (0, i.jsx)(l.GlobalLayoutRouterContext.Provider, {
                                value: B,
                                children: (0, i.jsx)(l.AppRouterContext.Provider, {
                                    value: _.publicAppRouterInstance,
                                    children: (0, i.jsx)(l.LayoutRouterContext.Provider, {
                                        value: U,
                                        children: q
                                    })
                                })
                            })
                        })
                    })
                })
            })]
        })
    }

    function A(e) {
        let {
            actionQueue: t,
            globalErrorState: n,
            webSocket: r,
            staticIndicatorState: a
        } = e;
        (0, w.useNavFailureHandler)();
        let o = (0, i.jsx)(I, {
            actionQueue: t,
            globalError: n,
            webSocket: r,
            staticIndicatorState: a
        });
        return (0, i.jsx)(E.default, {
            errorComponent: T.default,
            children: o
        })
    }("function" == typeof n.default || "object" == typeof n.default && null !== n.default) && void 0 === n.default.__esModule && (Object.defineProperty(n.default, "__esModule", {
        value: !0
    }), Object.assign(n.default, n), t.exports = n.default)
}, 611792, (e, t, n) => {
    "use strict";
    Object.defineProperty(n, "__esModule", {
        value: !0
    }), Object.defineProperty(n, "createInitialRouterState", {
        enumerable: !0,
        get: function() {
            return f
        }
    });
    let r = e.r(190175),
        a = e.r(551963),
        i = e.r(589192),
        o = e.r(480367),
        l = e.r(259936),
        s = e.r(420587),
        u = e.r(143225),
        c = e.r(389638),
        d = e.r(845844);

    function f(e) {
        let {
            navigatedAt: t,
            initialRSCPayload: n,
            initialFlightStreamForCache: f,
            location: p
        } = e, {
            c: h,
            f: m,
            q: g,
            i: v,
            S: y,
            s: b,
            l: w,
            h: _,
            p: S,
            d: k
        } = n, x = h.join("/"), {
            tree: E,
            seedData: T,
            head: N
        } = (0, i.getFlightDataPartsFromPath)(m[0]), C = p ? (0, r.createHrefFromUrl)(p) : x, O = {
            metadataVaryPath: null
        }, R = (0, l.convertRootFlightRouterStateToRouteTree)(E, g, O), P = O.metadataVaryPath, I = (0, o.createInitialCacheNodeForHydration)(t, R, T, N, (0, u.computeDynamicStaleAt)(t, k ?? u.UnknownDynamicStaleTime));
        if (null !== p && null !== P) {
            if ((0, d.discoverKnownRoute)(Date.now(), p.pathname, null, null, R, P, v, C, y, !1), null !== T && void 0 !== b)
                if (void 0 !== w && null != f)(0, c.decodeStaticStage)(f, w, void 0).then(async e => {
                    let t = Date.now(),
                        n = await (0, l.getStaleAt)(t, e.s);
                    (0, l.writeStaticStageResponseIntoCache)(t, e.f, void 0, e.h, n, E, g, !0)
                }).catch(() => {});
                else {
                    let e = Date.now();
                    (0, l.getStaleAt)(e, b).then(t => {
                        (0, l.writeStaticStageResponseIntoCache)(e, m, void 0, _, t, E, g, !1)
                    }).catch(() => {}), f?.cancel()
                }
            else f?.cancel();
            null != S && (0, l.processRuntimePrefetchStream)(Date.now(), S, E, g).then(e => {
                null !== e && (0, l.writeDynamicRenderResponseIntoCache)(Date.now(), s.FetchStrategy.PPRRuntime, e.flightDatas, e.buildId, e.isResponsePartial, e.headVaryParams, e.staleAt, e.navigationSeed, null)
            }).catch(() => {})
        }
        return {
            tree: I.route,
            cache: I.node,
            pushRef: {
                pendingPush: !1,
                mpaNavigation: !1,
                preserveCustomHistoryState: !0
            },
            focusAndScrollRef: {
                scrollRef: null,
                forceScroll: !1,
                onlyHashChange: !1,
                hashFragment: null
            },
            canonicalUrl: C,
            renderedSearch: g,
            nextUrl: ((0, a.extractPathFromFlightRouterState)(E) || p?.pathname) ?? null,
            previousNextUrl: null,
            debugInfo: null
        }
    }("function" == typeof n.default || "object" == typeof n.default && null !== n.default) && void 0 === n.default.__esModule && (Object.defineProperty(n.default, "__esModule", {
        value: !0
    }), Object.assign(n.default, n), t.exports = n.default)
}, 677303, (e, t, n) => {
    "use strict";
    let r, a, i, o;
    Object.defineProperty(n, "__esModule", {
        value: !0
    }), Object.defineProperty(n, "hydrate", {
        enumerable: !0,
        get: function() {
            return j
        }
    });
    let l = e.r(481258),
        s = e.r(19836);
    e.r(233469);
    let u = l._(e.r(859980)),
        c = l._(e.r(420482)),
        d = e.r(78081),
        f = e.r(620229),
        p = e.r(867054),
        h = e.r(847812),
        m = e.r(412008),
        g = e.r(636740),
        v = e.r(511259),
        y = l._(e.r(445968)),
        b = e.r(611792);
    e.r(466933);
    let w = e.r(589192),
        _ = e.r(330903),
        S = e.r(365496),
        k = d.createFromReadableStream,
        x = d.createFromFetch,
        E = document,
        T = self.__next_instant_test ? self.__next_instant_test : void 0,
        N = new TextEncoder,
        C = !1,
        O = !1,
        R = null;

    function P(e) {
        if (0 === e[0]) i = [];
        else if (1 === e[0]) {
            if (!i) throw Object.defineProperty(Error("Unexpected server data: missing bootstrap script."), "__NEXT_ERROR_CODE", {
                value: "E18",
                enumerable: !1,
                configurable: !0
            });
            o ? o.enqueue(N.encode(e[1])) : i.push(e[1])
        } else if (2 === e[0]) R = e[1];
        else if (3 === e[0]) {
            if (!i) throw Object.defineProperty(Error("Unexpected server data: missing bootstrap script."), "__NEXT_ERROR_CODE", {
                value: "E18",
                enumerable: !1,
                configurable: !0
            });
            let n = atob(e[1]),
                r = new Uint8Array(n.length);
            for (var t = 0; t < n.length; t++) r[t] = n.charCodeAt(t);
            o ? o.enqueue(r) : i.push(r)
        }
    }
    let I = function() {
        o && !O && (o.close(), O = !0, i = void 0), C = !0
    };
    "loading" === document.readyState ? document.addEventListener("DOMContentLoaded", I, !1) : setTimeout(I);
    let A = self.__next_f = self.__next_f || [];
    A.forEach(P), A.length = 0, A.push = P;
    let L = new ReadableStream({
        start(e) {
            i && (i.forEach(t => {
                e.enqueue("string" == typeof t ? N.encode(t) : t)
            }), C && !O) && (null === e.desiredSize || e.desiredSize < 0 ? T || e.error(Object.defineProperty(Error("The connection to the page was unexpectedly closed, possibly due to the stop button being clicked, loss of Wi-Fi, or an unstable internet connection."), "__NEXT_ERROR_CODE", {
                value: "E117",
                enumerable: !1,
                configurable: !0
            })) : e.close(), O = !0, i = void 0), o = e
        }
    });
    if (T) a = Promise.resolve(x(T, {
        callServer: m.callServer,
        findSourceMapURL: g.findSourceMapURL,
        debugChannel: r,
        unstable_allowPartialStream: !0
    })).then(async e => (0, w.createInitialRSCPayloadFromFallbackPrerender)(await T, e));
    else if (window.__NEXT_CLIENT_RESUME) {
        let e = window.__NEXT_CLIENT_RESUME;
        a = Promise.resolve(x(e, {
            callServer: m.callServer,
            findSourceMapURL: g.findSourceMapURL,
            debugChannel: r
        })).then(async t => (0, w.createInitialRSCPayloadFromFallbackPrerender)(await e, t))
    } else a = k(L, {
        callServer: m.callServer,
        findSourceMapURL: g.findSourceMapURL,
        debugChannel: r,
        startTime: 0
    });

    function D(e) {
        let {
            initialRSCPayload: t,
            actionQueue: n,
            webSocket: r,
            staticIndicatorState: a
        } = e;
        return (0, s.jsx)(y.default, {
            actionQueue: n,
            globalErrorState: t.G,
            webSocket: r,
            staticIndicatorState: a
        })
    }
    let M = c.default.StrictMode;

    function z(e) {
        let {
            children: t
        } = e;
        return t
    }
    let F = {
        onDefaultTransitionIndicator: function() {
            return () => {}
        },
        onRecoverableError: p.onRecoverableError,
        onCaughtError: h.onCaughtError,
        onUncaughtError: h.onUncaughtError
    };
    async function j(e, t) {
        let n, r, i = await a;
        i.b ? (0, S.setNavigationBuildId)(i.b) : (0, S.setNavigationBuildId)((0, _.getDeploymentId)());
        let o = Date.now(),
            l = (0, v.createMutableActionQueue)((0, b.createInitialRouterState)({
                navigatedAt: o,
                initialRSCPayload: i,
                initialFlightStreamForCache: null,
                location: window.location
            }), e),
            d = (0, s.jsx)(M, {
                children: (0, s.jsx)(f.HeadManagerContext.Provider, {
                    value: {
                        appDir: !0
                    },
                    children: (0, s.jsx)(z, {
                        children: (0, s.jsx)(D, {
                            initialRSCPayload: i,
                            actionQueue: l,
                            webSocket: r,
                            staticIndicatorState: n
                        })
                    })
                })
            });
        "__next_error__" === document.documentElement.id ? u.default.createRoot(E, F).render(d) : c.default.startTransition(() => {
            u.default.hydrateRoot(E, d, {
                ...F,
                formState: R
            })
        })
    }("function" == typeof n.default || "object" == typeof n.default && null !== n.default) && void 0 === n.default.__esModule && (Object.defineProperty(n.default, "__esModule", {
        value: !0
    }), Object.assign(n.default, n), t.exports = n.default)
}, 264941, (e, t, n) => {
    "use strict";
    Object.defineProperty(n, "__esModule", {
        value: !0
    }), e.r(318648);
    let r = e.r(855458);
    e.r(867054), window.next.turbopack = !0, self.__webpack_hash__ = "";
    let a = e.r(38777);
    (0, r.appBootstrap)(t => {
        let {
            hydrate: n
        } = e.r(677303);
        n(a, t)
    }), ("function" == typeof n.default || "object" == typeof n.default && null !== n.default) && void 0 === n.default.__esModule && (Object.defineProperty(n.default, "__esModule", {
        value: !0
    }), Object.assign(n.default, n), t.exports = n.default)
}]);

//# debugId=21aa2395-d811-1325-21aa-dec7a586ab68
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/0r6f~cekjzl4z.js.map