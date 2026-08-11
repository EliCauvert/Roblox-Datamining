/*! For license information please see verificationUpsell.bundle.min.js.LICENSE.txt */ ! function() {
    var e = {
            976: function() {},
            8659: function(e, t, n) {
                "use strict";
                var r = n(1646),
                    o = {
                        childContextTypes: !0,
                        contextType: !0,
                        contextTypes: !0,
                        defaultProps: !0,
                        displayName: !0,
                        getDefaultProps: !0,
                        getDerivedStateFromError: !0,
                        getDerivedStateFromProps: !0,
                        mixins: !0,
                        propTypes: !0,
                        type: !0
                    },
                    i = {
                        name: !0,
                        length: !0,
                        prototype: !0,
                        caller: !0,
                        callee: !0,
                        arguments: !0,
                        arity: !0
                    },
                    a = {
                        $$typeof: !0,
                        compare: !0,
                        defaultProps: !0,
                        displayName: !0,
                        propTypes: !0,
                        type: !0
                    },
                    s = {};

                function c(e) {
                    return r.isMemo(e) ? a : s[e.$$typeof] || o
                }
                s[r.ForwardRef] = {
                    $$typeof: !0,
                    render: !0,
                    defaultProps: !0,
                    displayName: !0,
                    propTypes: !0
                }, s[r.Memo] = a;
                var l = Object.defineProperty,
                    u = Object.getOwnPropertyNames,
                    f = Object.getOwnPropertySymbols,
                    p = Object.getOwnPropertyDescriptor,
                    d = Object.getPrototypeOf,
                    y = Object.prototype;
                e.exports = function e(t, n, r) {
                    if ("string" != typeof n) {
                        if (y) {
                            var o = d(n);
                            o && o !== y && e(t, o, r)
                        }
                        var a = u(n);
                        f && (a = a.concat(f(n)));
                        for (var s = c(t), h = c(n), m = 0; m < a.length; ++m) {
                            var g = a[m];
                            if (!(i[g] || r && r[g] || h && h[g] || s && s[g])) {
                                var v = p(n, g);
                                try {
                                    l(t, g, v)
                                } catch (e) {}
                            }
                        }
                    }
                    return t
                }
            },
            2210: function(e, t) {
                "use strict";

                function n(e) {
                    return n = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(e) {
                        return typeof e
                    } : function(e) {
                        return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e
                    }, n(e)
                }
                var r = "function" == typeof Symbol && Symbol.for,
                    o = r ? Symbol.for("react.element") : 60103,
                    i = r ? Symbol.for("react.portal") : 60106,
                    a = r ? Symbol.for("react.fragment") : 60107,
                    s = r ? Symbol.for("react.strict_mode") : 60108,
                    c = r ? Symbol.for("react.profiler") : 60114,
                    l = r ? Symbol.for("react.provider") : 60109,
                    u = r ? Symbol.for("react.context") : 60110,
                    f = r ? Symbol.for("react.async_mode") : 60111,
                    p = r ? Symbol.for("react.concurrent_mode") : 60111,
                    d = r ? Symbol.for("react.forward_ref") : 60112,
                    y = r ? Symbol.for("react.suspense") : 60113,
                    h = r ? Symbol.for("react.suspense_list") : 60120,
                    m = r ? Symbol.for("react.memo") : 60115,
                    g = r ? Symbol.for("react.lazy") : 60116,
                    v = r ? Symbol.for("react.block") : 60121,
                    b = r ? Symbol.for("react.fundamental") : 60117,
                    x = r ? Symbol.for("react.responder") : 60118,
                    S = r ? Symbol.for("react.scope") : 60119;

                function w(e) {
                    if ("object" === n(e) && null !== e) {
                        var t = e.$$typeof;
                        switch (t) {
                            case o:
                                switch (e = e.type) {
                                    case f:
                                    case p:
                                    case a:
                                    case c:
                                    case s:
                                    case y:
                                        return e;
                                    default:
                                        switch (e = e && e.$$typeof) {
                                            case u:
                                            case d:
                                            case g:
                                            case m:
                                            case l:
                                                return e;
                                            default:
                                                return t
                                        }
                                }
                            case i:
                                return t
                        }
                    }
                }

                function P(e) {
                    return w(e) === p
                }
                t.AsyncMode = f, t.ConcurrentMode = p, t.ContextConsumer = u, t.ContextProvider = l, t.Element = o, t.ForwardRef = d, t.Fragment = a, t.Lazy = g, t.Memo = m, t.Portal = i, t.Profiler = c, t.StrictMode = s, t.Suspense = y, t.isAsyncMode = function(e) {
                    return P(e) || w(e) === f
                }, t.isConcurrentMode = P, t.isContextConsumer = function(e) {
                    return w(e) === u
                }, t.isContextProvider = function(e) {
                    return w(e) === l
                }, t.isElement = function(e) {
                    return "object" === n(e) && null !== e && e.$$typeof === o
                }, t.isForwardRef = function(e) {
                    return w(e) === d
                }, t.isFragment = function(e) {
                    return w(e) === a
                }, t.isLazy = function(e) {
                    return w(e) === g
                }, t.isMemo = function(e) {
                    return w(e) === m
                }, t.isPortal = function(e) {
                    return w(e) === i
                }, t.isProfiler = function(e) {
                    return w(e) === c
                }, t.isStrictMode = function(e) {
                    return w(e) === s
                }, t.isSuspense = function(e) {
                    return w(e) === y
                }, t.isValidElementType = function(e) {
                    return "string" == typeof e || "function" == typeof e || e === a || e === p || e === c || e === s || e === y || e === h || "object" === n(e) && null !== e && (e.$$typeof === g || e.$$typeof === m || e.$$typeof === l || e.$$typeof === u || e.$$typeof === d || e.$$typeof === b || e.$$typeof === x || e.$$typeof === S || e.$$typeof === v)
                }, t.typeOf = w
            },
            1646: function(e, t, n) {
                "use strict";
                e.exports = n(2210)
            },
            9396: function(e, t, n) {
                var r, o, i, a;

                function s(e) {
                    return s = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(e) {
                        return typeof e
                    } : function(e) {
                        return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e
                    }, s(e)
                }
                e = n.nmd(e), self, a = function() {
                    return function() {
                        var e = {
                                913: function(e, t, n) {
                                    "use strict";
                                    var r = n(651),
                                        o = n(601),
                                        i = o(r("String.prototype.indexOf"));
                                    e.exports = function(e, t) {
                                        var n = r(e, !!t);
                                        return "function" == typeof n && i(e, ".prototype.") > -1 ? o(n) : n
                                    }
                                },
                                601: function(e, t, n) {
                                    "use strict";
                                    var r = n(49),
                                        o = n(651),
                                        i = n(255),
                                        a = n(785),
                                        s = o("%Function.prototype.apply%"),
                                        c = o("%Function.prototype.call%"),
                                        l = o("%Reflect.apply%", !0) || r.call(c, s),
                                        u = n(649),
                                        f = o("%Math.max%");
                                    e.exports = function(e) {
                                        if ("function" != typeof e) throw new a("a function is required");
                                        var t = l(r, c, arguments);
                                        return i(t, 1 + f(0, e.length - (arguments.length - 1)), !0)
                                    };
                                    var p = function() {
                                        return l(r, s, arguments)
                                    };
                                    u ? u(e.exports, "apply", {
                                        value: p
                                    }) : e.exports.apply = p
                                },
                                295: function(e, t, n) {
                                    "use strict";
                                    var r = n(649),
                                        o = n(389),
                                        i = n(785),
                                        a = n(109);
                                    e.exports = function(e, t, n) {
                                        if (!e || "object" != s(e) && "function" != typeof e) throw new i("`obj` must be an object or a function`");
                                        if ("string" != typeof t && "symbol" != s(t)) throw new i("`property` must be a string or a symbol`");
                                        if (arguments.length > 3 && "boolean" != typeof arguments[3] && null !== arguments[3]) throw new i("`nonEnumerable`, if provided, must be a boolean or null");
                                        if (arguments.length > 4 && "boolean" != typeof arguments[4] && null !== arguments[4]) throw new i("`nonWritable`, if provided, must be a boolean or null");
                                        if (arguments.length > 5 && "boolean" != typeof arguments[5] && null !== arguments[5]) throw new i("`nonConfigurable`, if provided, must be a boolean or null");
                                        if (arguments.length > 6 && "boolean" != typeof arguments[6]) throw new i("`loose`, if provided, must be a boolean");
                                        var c = arguments.length > 3 ? arguments[3] : null,
                                            l = arguments.length > 4 ? arguments[4] : null,
                                            u = arguments.length > 5 ? arguments[5] : null,
                                            f = arguments.length > 6 && arguments[6],
                                            p = !!a && a(e, t);
                                        if (r) r(e, t, {
                                            configurable: null === u && p ? p.configurable : !u,
                                            enumerable: null === c && p ? p.enumerable : !c,
                                            value: n,
                                            writable: null === l && p ? p.writable : !l
                                        });
                                        else {
                                            if (!f && (c || l || u)) throw new o("This environment does not support defining a property as non-configurable, non-writable, or non-enumerable.");
                                            e[t] = n
                                        }
                                    }
                                },
                                649: function(e, t, n) {
                                    "use strict";
                                    var r = n(651)("%Object.defineProperty%", !0) || !1;
                                    if (r) try {
                                        r({}, "a", {
                                            value: 1
                                        })
                                    } catch (e) {
                                        r = !1
                                    }
                                    e.exports = r
                                },
                                55: function(e) {
                                    "use strict";
                                    e.exports = EvalError
                                },
                                293: function(e) {
                                    "use strict";
                                    e.exports = Error
                                },
                                888: function(e) {
                                    "use strict";
                                    e.exports = RangeError
                                },
                                900: function(e) {
                                    "use strict";
                                    e.exports = ReferenceError
                                },
                                389: function(e) {
                                    "use strict";
                                    e.exports = SyntaxError
                                },
                                785: function(e) {
                                    "use strict";
                                    e.exports = TypeError
                                },
                                436: function(e) {
                                    "use strict";
                                    e.exports = URIError
                                },
                                719: function(e) {
                                    "use strict";
                                    var t = Object.prototype.toString,
                                        n = Math.max,
                                        r = function(e, t) {
                                            for (var n = [], r = 0; r < e.length; r += 1) n[r] = e[r];
                                            for (var o = 0; o < t.length; o += 1) n[o + e.length] = t[o];
                                            return n
                                        };
                                    e.exports = function(e) {
                                        var o = this;
                                        if ("function" != typeof o || "[object Function]" !== t.apply(o)) throw new TypeError("Function.prototype.bind called on incompatible " + o);
                                        for (var i, a = function(e) {
                                                for (var t = [], n = 1, r = 0; n < e.length; n += 1, r += 1) t[r] = e[n];
                                                return t
                                            }(arguments), s = n(0, o.length - a.length), c = [], l = 0; l < s; l++) c[l] = "$" + l;
                                        if (i = Function("binder", "return function (" + function(e) {
                                                for (var t = "", n = 0; n < e.length; n += 1) t += e[n], n + 1 < e.length && (t += ",");
                                                return t
                                            }(c) + "){ return binder.apply(this,arguments); }")((function() {
                                                if (this instanceof i) {
                                                    var t = o.apply(this, r(a, arguments));
                                                    return Object(t) === t ? t : this
                                                }
                                                return o.apply(e, r(a, arguments))
                                            })), o.prototype) {
                                            var u = function() {};
                                            u.prototype = o.prototype, i.prototype = new u, u.prototype = null
                                        }
                                        return i
                                    }
                                },
                                49: function(e, t, n) {
                                    "use strict";
                                    var r = n(719);
                                    e.exports = Function.prototype.bind || r
                                },
                                651: function(e, t, n) {
                                    "use strict";
                                    var r, o = n(293),
                                        i = n(55),
                                        a = n(888),
                                        c = n(900),
                                        l = n(389),
                                        u = n(785),
                                        f = n(436),
                                        p = Function,
                                        d = function(e) {
                                            try {
                                                return p('"use strict"; return (' + e + ").constructor;")()
                                            } catch (e) {}
                                        },
                                        y = Object.getOwnPropertyDescriptor;
                                    if (y) try {
                                        y({}, "")
                                    } catch (e) {
                                        y = null
                                    }
                                    var h = function() {
                                            throw new u
                                        },
                                        m = y ? function() {
                                            try {
                                                return h
                                            } catch (e) {
                                                try {
                                                    return y(arguments, "callee").get
                                                } catch (e) {
                                                    return h
                                                }
                                            }
                                        }() : h,
                                        g = n(257)(),
                                        v = n(726)(),
                                        b = Object.getPrototypeOf || (v ? function(e) {
                                            return e.__proto__
                                        } : null),
                                        x = {},
                                        S = "undefined" != typeof Uint8Array && b ? b(Uint8Array) : r,
                                        w = {
                                            __proto__: null,
                                            "%AggregateError%": "undefined" == typeof AggregateError ? r : AggregateError,
                                            "%Array%": Array,
                                            "%ArrayBuffer%": "undefined" == typeof ArrayBuffer ? r : ArrayBuffer,
                                            "%ArrayIteratorPrototype%": g && b ? b([][Symbol.iterator]()) : r,
                                            "%AsyncFromSyncIteratorPrototype%": r,
                                            "%AsyncFunction%": x,
                                            "%AsyncGenerator%": x,
                                            "%AsyncGeneratorFunction%": x,
                                            "%AsyncIteratorPrototype%": x,
                                            "%Atomics%": "undefined" == typeof Atomics ? r : Atomics,
                                            "%BigInt%": "undefined" == typeof BigInt ? r : BigInt,
                                            "%BigInt64Array%": "undefined" == typeof BigInt64Array ? r : BigInt64Array,
                                            "%BigUint64Array%": "undefined" == typeof BigUint64Array ? r : BigUint64Array,
                                            "%Boolean%": Boolean,
                                            "%DataView%": "undefined" == typeof DataView ? r : DataView,
                                            "%Date%": Date,
                                            "%decodeURI%": decodeURI,
                                            "%decodeURIComponent%": decodeURIComponent,
                                            "%encodeURI%": encodeURI,
                                            "%encodeURIComponent%": encodeURIComponent,
                                            "%Error%": o,
                                            "%eval%": eval,
                                            "%EvalError%": i,
                                            "%Float32Array%": "undefined" == typeof Float32Array ? r : Float32Array,
                                            "%Float64Array%": "undefined" == typeof Float64Array ? r : Float64Array,
                                            "%FinalizationRegistry%": "undefined" == typeof FinalizationRegistry ? r : FinalizationRegistry,
                                            "%Function%": p,
                                            "%GeneratorFunction%": x,
                                            "%Int8Array%": "undefined" == typeof Int8Array ? r : Int8Array,
                                            "%Int16Array%": "undefined" == typeof Int16Array ? r : Int16Array,
                                            "%Int32Array%": "undefined" == typeof Int32Array ? r : Int32Array,
                                            "%isFinite%": isFinite,
                                            "%isNaN%": isNaN,
                                            "%IteratorPrototype%": g && b ? b(b([][Symbol.iterator]())) : r,
                                            "%JSON%": "object" == ("undefined" == typeof JSON ? "undefined" : s(JSON)) ? JSON : r,
                                            "%Map%": "undefined" == typeof Map ? r : Map,
                                            "%MapIteratorPrototype%": "undefined" != typeof Map && g && b ? b((new Map)[Symbol.iterator]()) : r,
                                            "%Math%": Math,
                                            "%Number%": Number,
                                            "%Object%": Object,
                                            "%parseFloat%": parseFloat,
                                            "%parseInt%": parseInt,
                                            "%Promise%": "undefined" == typeof Promise ? r : Promise,
                                            "%Proxy%": "undefined" == typeof Proxy ? r : Proxy,
                                            "%RangeError%": a,
                                            "%ReferenceError%": c,
                                            "%Reflect%": "undefined" == typeof Reflect ? r : Reflect,
                                            "%RegExp%": RegExp,
                                            "%Set%": "undefined" == typeof Set ? r : Set,
                                            "%SetIteratorPrototype%": "undefined" != typeof Set && g && b ? b((new Set)[Symbol.iterator]()) : r,
                                            "%SharedArrayBuffer%": "undefined" == typeof SharedArrayBuffer ? r : SharedArrayBuffer,
                                            "%String%": String,
                                            "%StringIteratorPrototype%": g && b ? b("" [Symbol.iterator]()) : r,
                                            "%Symbol%": g ? Symbol : r,
                                            "%SyntaxError%": l,
                                            "%ThrowTypeError%": m,
                                            "%TypedArray%": S,
                                            "%TypeError%": u,
                                            "%Uint8Array%": "undefined" == typeof Uint8Array ? r : Uint8Array,
                                            "%Uint8ClampedArray%": "undefined" == typeof Uint8ClampedArray ? r : Uint8ClampedArray,
                                            "%Uint16Array%": "undefined" == typeof Uint16Array ? r : Uint16Array,
                                            "%Uint32Array%": "undefined" == typeof Uint32Array ? r : Uint32Array,
                                            "%URIError%": f,
                                            "%WeakMap%": "undefined" == typeof WeakMap ? r : WeakMap,
                                            "%WeakRef%": "undefined" == typeof WeakRef ? r : WeakRef,
                                            "%WeakSet%": "undefined" == typeof WeakSet ? r : WeakSet
                                        };
                                    if (b) try {
                                        null.error
                                    } catch (e) {
                                        var P = b(b(e));
                                        w["%Error.prototype%"] = P
                                    }
                                    var E = function e(t) {
                                            var n;
                                            if ("%AsyncFunction%" === t) n = d("async function () {}");
                                            else if ("%GeneratorFunction%" === t) n = d("function* () {}");
                                            else if ("%AsyncGeneratorFunction%" === t) n = d("async function* () {}");
                                            else if ("%AsyncGenerator%" === t) {
                                                var r = e("%AsyncGeneratorFunction%");
                                                r && (n = r.prototype)
                                            } else if ("%AsyncIteratorPrototype%" === t) {
                                                var o = e("%AsyncGenerator%");
                                                o && b && (n = b(o.prototype))
                                            }
                                            return w[t] = n, n
                                        },
                                        A = {
                                            __proto__: null,
                                            "%ArrayBufferPrototype%": ["ArrayBuffer", "prototype"],
                                            "%ArrayPrototype%": ["Array", "prototype"],
                                            "%ArrayProto_entries%": ["Array", "prototype", "entries"],
                                            "%ArrayProto_forEach%": ["Array", "prototype", "forEach"],
                                            "%ArrayProto_keys%": ["Array", "prototype", "keys"],
                                            "%ArrayProto_values%": ["Array", "prototype", "values"],
                                            "%AsyncFunctionPrototype%": ["AsyncFunction", "prototype"],
                                            "%AsyncGenerator%": ["AsyncGeneratorFunction", "prototype"],
                                            "%AsyncGeneratorPrototype%": ["AsyncGeneratorFunction", "prototype", "prototype"],
                                            "%BooleanPrototype%": ["Boolean", "prototype"],
                                            "%DataViewPrototype%": ["DataView", "prototype"],
                                            "%DatePrototype%": ["Date", "prototype"],
                                            "%ErrorPrototype%": ["Error", "prototype"],
                                            "%EvalErrorPrototype%": ["EvalError", "prototype"],
                                            "%Float32ArrayPrototype%": ["Float32Array", "prototype"],
                                            "%Float64ArrayPrototype%": ["Float64Array", "prototype"],
                                            "%FunctionPrototype%": ["Function", "prototype"],
                                            "%Generator%": ["GeneratorFunction", "prototype"],
                                            "%GeneratorPrototype%": ["GeneratorFunction", "prototype", "prototype"],
                                            "%Int8ArrayPrototype%": ["Int8Array", "prototype"],
                                            "%Int16ArrayPrototype%": ["Int16Array", "prototype"],
                                            "%Int32ArrayPrototype%": ["Int32Array", "prototype"],
                                            "%JSONParse%": ["JSON", "parse"],
                                            "%JSONStringify%": ["JSON", "stringify"],
                                            "%MapPrototype%": ["Map", "prototype"],
                                            "%NumberPrototype%": ["Number", "prototype"],
                                            "%ObjectPrototype%": ["Object", "prototype"],
                                            "%ObjProto_toString%": ["Object", "prototype", "toString"],
                                            "%ObjProto_valueOf%": ["Object", "prototype", "valueOf"],
                                            "%PromisePrototype%": ["Promise", "prototype"],
                                            "%PromiseProto_then%": ["Promise", "prototype", "then"],
                                            "%Promise_all%": ["Promise", "all"],
                                            "%Promise_reject%": ["Promise", "reject"],
                                            "%Promise_resolve%": ["Promise", "resolve"],
                                            "%RangeErrorPrototype%": ["RangeError", "prototype"],
                                            "%ReferenceErrorPrototype%": ["ReferenceError", "prototype"],
                                            "%RegExpPrototype%": ["RegExp", "prototype"],
                                            "%SetPrototype%": ["Set", "prototype"],
                                            "%SharedArrayBufferPrototype%": ["SharedArrayBuffer", "prototype"],
                                            "%StringPrototype%": ["String", "prototype"],
                                            "%SymbolPrototype%": ["Symbol", "prototype"],
                                            "%SyntaxErrorPrototype%": ["SyntaxError", "prototype"],
                                            "%TypedArrayPrototype%": ["TypedArray", "prototype"],
                                            "%TypeErrorPrototype%": ["TypeError", "prototype"],
                                            "%Uint8ArrayPrototype%": ["Uint8Array", "prototype"],
                                            "%Uint8ClampedArrayPrototype%": ["Uint8ClampedArray", "prototype"],
                                            "%Uint16ArrayPrototype%": ["Uint16Array", "prototype"],
                                            "%Uint32ArrayPrototype%": ["Uint32Array", "prototype"],
                                            "%URIErrorPrototype%": ["URIError", "prototype"],
                                            "%WeakMapPrototype%": ["WeakMap", "prototype"],
                                            "%WeakSetPrototype%": ["WeakSet", "prototype"]
                                        },
                                        O = n(49),
                                        k = n(215),
                                        C = O.call(Function.call, Array.prototype.concat),
                                        R = O.call(Function.apply, Array.prototype.splice),
                                        j = O.call(Function.call, String.prototype.replace),
                                        I = O.call(Function.call, String.prototype.slice),
                                        T = O.call(Function.call, RegExp.prototype.exec),
                                        N = /[^%.[\]]+|\[(?:(-?\d+(?:\.\d+)?)|(["'])((?:(?!\2)[^\\]|\\.)*?)\2)\]|(?=(?:\.|\[\])(?:\.|\[\]|%$))/g,
                                        M = /\\(\\)?/g,
                                        _ = function(e, t) {
                                            var n, r = e;
                                            if (k(A, r) && (r = "%" + (n = A[r])[0] + "%"), k(w, r)) {
                                                var o = w[r];
                                                if (o === x && (o = E(r)), void 0 === o && !t) throw new u("intrinsic " + e + " exists, but is not available. Please file an issue!");
                                                return {
                                                    alias: n,
                                                    name: r,
                                                    value: o
                                                }
                                            }
                                            throw new l("intrinsic " + e + " does not exist!")
                                        };
                                    e.exports = function(e, t) {
                                        if ("string" != typeof e || 0 === e.length) throw new u("intrinsic name must be a non-empty string");
                                        if (arguments.length > 1 && "boolean" != typeof t) throw new u('"allowMissing" argument must be a boolean');
                                        if (null === T(/^%?[^%]*%?$/, e)) throw new l("`%` may not be present anywhere but at the beginning and end of the intrinsic name");
                                        var n = function(e) {
                                                var t = I(e, 0, 1),
                                                    n = I(e, -1);
                                                if ("%" === t && "%" !== n) throw new l("invalid intrinsic syntax, expected closing `%`");
                                                if ("%" === n && "%" !== t) throw new l("invalid intrinsic syntax, expected opening `%`");
                                                var r = [];
                                                return j(e, N, (function(e, t, n, o) {
                                                    r[r.length] = n ? j(o, M, "$1") : t || e
                                                })), r
                                            }(e),
                                            r = n.length > 0 ? n[0] : "",
                                            o = _("%" + r + "%", t),
                                            i = o.name,
                                            a = o.value,
                                            s = !1,
                                            c = o.alias;
                                        c && (r = c[0], R(n, C([0, 1], c)));
                                        for (var f = 1, p = !0; f < n.length; f += 1) {
                                            var d = n[f],
                                                h = I(d, 0, 1),
                                                m = I(d, -1);
                                            if (('"' === h || "'" === h || "`" === h || '"' === m || "'" === m || "`" === m) && h !== m) throw new l("property names with quotes must have matching quotes");
                                            if ("constructor" !== d && p || (s = !0), k(w, i = "%" + (r += "." + d) + "%")) a = w[i];
                                            else if (null != a) {
                                                if (!(d in a)) {
                                                    if (!t) throw new u("base intrinsic for " + e + " exists, but the property is not available.");
                                                    return
                                                }
                                                if (y && f + 1 >= n.length) {
                                                    var g = y(a, d);
                                                    a = (p = !!g) && "get" in g && !("originalValue" in g.get) ? g.get : a[d]
                                                } else p = k(a, d), a = a[d];
                                                p && !s && (w[i] = a)
                                            }
                                        }
                                        return a
                                    }
                                },
                                109: function(e, t, n) {
                                    "use strict";
                                    var r = n(651)("%Object.getOwnPropertyDescriptor%", !0);
                                    if (r) try {
                                        r([], "length")
                                    } catch (e) {
                                        r = null
                                    }
                                    e.exports = r
                                },
                                890: function(e, t, n) {
                                    "use strict";
                                    var r = n(649),
                                        o = function() {
                                            return !!r
                                        };
                                    o.hasArrayLengthDefineBug = function() {
                                        if (!r) return null;
                                        try {
                                            return 1 !== r([], "length", {
                                                value: 1
                                            }).length
                                        } catch (e) {
                                            return !0
                                        }
                                    }, e.exports = o
                                },
                                726: function(e) {
                                    "use strict";
                                    var t = {
                                            __proto__: null,
                                            foo: {}
                                        },
                                        n = Object;
                                    e.exports = function() {
                                        return {
                                            __proto__: t
                                        }.foo === t.foo && !(t instanceof n)
                                    }
                                },
                                257: function(e, t, n) {
                                    "use strict";
                                    var r = "undefined" != typeof Symbol && Symbol,
                                        o = n(843);
                                    e.exports = function() {
                                        return "function" == typeof r && "function" == typeof Symbol && "symbol" == s(r("foo")) && "symbol" == s(Symbol("bar")) && o()
                                    }
                                },
                                843: function(e) {
                                    "use strict";
                                    e.exports = function() {
                                        if ("function" != typeof Symbol || "function" != typeof Object.getOwnPropertySymbols) return !1;
                                        if ("symbol" == s(Symbol.iterator)) return !0;
                                        var e = {},
                                            t = Symbol("test"),
                                            n = Object(t);
                                        if ("string" == typeof t) return !1;
                                        if ("[object Symbol]" !== Object.prototype.toString.call(t)) return !1;
                                        if ("[object Symbol]" !== Object.prototype.toString.call(n)) return !1;
                                        for (t in e[t] = 42, e) return !1;
                                        if ("function" == typeof Object.keys && 0 !== Object.keys(e).length) return !1;
                                        if ("function" == typeof Object.getOwnPropertyNames && 0 !== Object.getOwnPropertyNames(e).length) return !1;
                                        var r = Object.getOwnPropertySymbols(e);
                                        if (1 !== r.length || r[0] !== t) return !1;
                                        if (!Object.prototype.propertyIsEnumerable.call(e, t)) return !1;
                                        if ("function" == typeof Object.getOwnPropertyDescriptor) {
                                            var o = Object.getOwnPropertyDescriptor(e, t);
                                            if (42 !== o.value || !0 !== o.enumerable) return !1
                                        }
                                        return !0
                                    }
                                },
                                215: function(e, t, n) {
                                    "use strict";
                                    var r = Function.prototype.call,
                                        o = Object.prototype.hasOwnProperty,
                                        i = n(49);
                                    e.exports = i.call(r, o)
                                },
                                709: function(e, t, n) {
                                    var r, o = 1 / 0,
                                        i = /[^\x00-\x2f\x3a-\x40\x5b-\x60\x7b-\x7f]+/g,
                                        a = /[\xc0-\xd6\xd8-\xf6\xf8-\xff\u0100-\u017f]/g,
                                        c = "\\ud800-\\udfff",
                                        l = "\\u2700-\\u27bf",
                                        u = "a-z\\xdf-\\xf6\\xf8-\\xff",
                                        f = "A-Z\\xc0-\\xd6\\xd8-\\xde",
                                        p = "\\xac\\xb1\\xd7\\xf7\\x00-\\x2f\\x3a-\\x40\\x5b-\\x60\\x7b-\\xbf\\u2000-\\u206f \\t\\x0b\\f\\xa0\\ufeff\\n\\r\\u2028\\u2029\\u1680\\u180e\\u2000\\u2001\\u2002\\u2003\\u2004\\u2005\\u2006\\u2007\\u2008\\u2009\\u200a\\u202f\\u205f\\u3000",
                                        d = "[" + p + "]",
                                        y = "[\\u0300-\\u036f\\ufe20-\\ufe23\\u20d0-\\u20f0]",
                                        h = "\\d+",
                                        m = "[" + l + "]",
                                        g = "[" + u + "]",
                                        v = "[^" + c + p + h + l + u + f + "]",
                                        b = "(?:\\ud83c[\\udde6-\\uddff]){2}",
                                        x = "[\\ud800-\\udbff][\\udc00-\\udfff]",
                                        S = "[" + f + "]",
                                        w = "(?:" + g + "|" + v + ")",
                                        P = "(?:" + S + "|" + v + ")",
                                        E = "(?:['’](?:d|ll|m|re|s|t|ve))?",
                                        A = "(?:['’](?:D|LL|M|RE|S|T|VE))?",
                                        O = "(?:" + y + "|\\ud83c[\\udffb-\\udfff])?",
                                        k = "[\\ufe0e\\ufe0f]?",
                                        C = k + O + "(?:\\u200d(?:" + ["[^" + c + "]", b, x].join("|") + ")" + k + O + ")*",
                                        R = "(?:" + [m, b, x].join("|") + ")" + C,
                                        j = RegExp("['’]", "g"),
                                        I = RegExp(y, "g"),
                                        T = RegExp([S + "?" + g + "+" + E + "(?=" + [d, S, "$"].join("|") + ")", P + "+" + A + "(?=" + [d, S + w, "$"].join("|") + ")", S + "?" + w + "+" + E, S + "+" + A, h, R].join("|"), "g"),
                                        N = /[a-z][A-Z]|[A-Z]{2,}[a-z]|[0-9][a-zA-Z]|[a-zA-Z][0-9]|[^a-zA-Z0-9 ]/,
                                        M = "object" == s(n.g) && n.g && n.g.Object === Object && n.g,
                                        _ = "object" == ("undefined" == typeof self ? "undefined" : s(self)) && self && self.Object === Object && self,
                                        D = M || _ || Function("return this")(),
                                        U = (r = {
                                            "À": "A",
                                            "Á": "A",
                                            "Â": "A",
                                            "Ã": "A",
                                            "Ä": "A",
                                            "Å": "A",
                                            "à": "a",
                                            "á": "a",
                                            "â": "a",
                                            "ã": "a",
                                            "ä": "a",
                                            "å": "a",
                                            "Ç": "C",
                                            "ç": "c",
                                            "Ð": "D",
                                            "ð": "d",
                                            "È": "E",
                                            "É": "E",
                                            "Ê": "E",
                                            "Ë": "E",
                                            "è": "e",
                                            "é": "e",
                                            "ê": "e",
                                            "ë": "e",
                                            "Ì": "I",
                                            "Í": "I",
                                            "Î": "I",
                                            "Ï": "I",
                                            "ì": "i",
                                            "í": "i",
                                            "î": "i",
                                            "ï": "i",
                                            "Ñ": "N",
                                            "ñ": "n",
                                            "Ò": "O",
                                            "Ó": "O",
                                            "Ô": "O",
                                            "Õ": "O",
                                            "Ö": "O",
                                            "Ø": "O",
                                            "ò": "o",
                                            "ó": "o",
                                            "ô": "o",
                                            "õ": "o",
                                            "ö": "o",
                                            "ø": "o",
                                            "Ù": "U",
                                            "Ú": "U",
                                            "Û": "U",
                                            "Ü": "U",
                                            "ù": "u",
                                            "ú": "u",
                                            "û": "u",
                                            "ü": "u",
                                            "Ý": "Y",
                                            "ý": "y",
                                            "ÿ": "y",
                                            "Æ": "Ae",
                                            "æ": "ae",
                                            "Þ": "Th",
                                            "þ": "th",
                                            "ß": "ss",
                                            "Ā": "A",
                                            "Ă": "A",
                                            "Ą": "A",
                                            "ā": "a",
                                            "ă": "a",
                                            "ą": "a",
                                            "Ć": "C",
                                            "Ĉ": "C",
                                            "Ċ": "C",
                                            "Č": "C",
                                            "ć": "c",
                                            "ĉ": "c",
                                            "ċ": "c",
                                            "č": "c",
                                            "Ď": "D",
                                            "Đ": "D",
                                            "ď": "d",
                                            "đ": "d",
                                            "Ē": "E",
                                            "Ĕ": "E",
                                            "Ė": "E",
                                            "Ę": "E",
                                            "Ě": "E",
                                            "ē": "e",
                                            "ĕ": "e",
                                            "ė": "e",
                                            "ę": "e",
                                            "ě": "e",
                                            "Ĝ": "G",
                                            "Ğ": "G",
                                            "Ġ": "G",
                                            "Ģ": "G",
                                            "ĝ": "g",
                                            "ğ": "g",
                                            "ġ": "g",
                                            "ģ": "g",
                                            "Ĥ": "H",
                                            "Ħ": "H",
                                            "ĥ": "h",
                                            "ħ": "h",
                                            "Ĩ": "I",
                                            "Ī": "I",
                                            "Ĭ": "I",
                                            "Į": "I",
                                            "İ": "I",
                                            "ĩ": "i",
                                            "ī": "i",
                                            "ĭ": "i",
                                            "į": "i",
                                            "ı": "i",
                                            "Ĵ": "J",
                                            "ĵ": "j",
                                            "Ķ": "K",
                                            "ķ": "k",
                                            "ĸ": "k",
                                            "Ĺ": "L",
                                            "Ļ": "L",
                                            "Ľ": "L",
                                            "Ŀ": "L",
                                            "Ł": "L",
                                            "ĺ": "l",
                                            "ļ": "l",
                                            "ľ": "l",
                                            "ŀ": "l",
                                            "ł": "l",
                                            "Ń": "N",
                                            "Ņ": "N",
                                            "Ň": "N",
                                            "Ŋ": "N",
                                            "ń": "n",
                                            "ņ": "n",
                                            "ň": "n",
                                            "ŋ": "n",
                                            "Ō": "O",
                                            "Ŏ": "O",
                                            "Ő": "O",
                                            "ō": "o",
                                            "ŏ": "o",
                                            "ő": "o",
                                            "Ŕ": "R",
                                            "Ŗ": "R",
                                            "Ř": "R",
                                            "ŕ": "r",
                                            "ŗ": "r",
                                            "ř": "r",
                                            "Ś": "S",
                                            "Ŝ": "S",
                                            "Ş": "S",
                                            "Š": "S",
                                            "ś": "s",
                                            "ŝ": "s",
                                            "ş": "s",
                                            "š": "s",
                                            "Ţ": "T",
                                            "Ť": "T",
                                            "Ŧ": "T",
                                            "ţ": "t",
                                            "ť": "t",
                                            "ŧ": "t",
                                            "Ũ": "U",
                                            "Ū": "U",
                                            "Ŭ": "U",
                                            "Ů": "U",
                                            "Ű": "U",
                                            "Ų": "U",
                                            "ũ": "u",
                                            "ū": "u",
                                            "ŭ": "u",
                                            "ů": "u",
                                            "ű": "u",
                                            "ų": "u",
                                            "Ŵ": "W",
                                            "ŵ": "w",
                                            "Ŷ": "Y",
                                            "ŷ": "y",
                                            "Ÿ": "Y",
                                            "Ź": "Z",
                                            "Ż": "Z",
                                            "Ž": "Z",
                                            "ź": "z",
                                            "ż": "z",
                                            "ž": "z",
                                            "Ĳ": "IJ",
                                            "ĳ": "ij",
                                            "Œ": "Oe",
                                            "œ": "oe",
                                            "ŉ": "'n",
                                            "ſ": "ss"
                                        }, function(e) {
                                            return null == r ? void 0 : r[e]
                                        }),
                                        L = Object.prototype.toString,
                                        F = D.Symbol,
                                        B = F ? F.prototype : void 0,
                                        q = B ? B.toString : void 0;

                                    function V(e) {
                                        return null == e ? "" : function(e) {
                                            if ("string" == typeof e) return e;
                                            if (function(e) {
                                                    return "symbol" == s(e) || function(e) {
                                                        return !!e && "object" == s(e)
                                                    }(e) && "[object Symbol]" == L.call(e)
                                                }(e)) return q ? q.call(e) : "";
                                            var t = e + "";
                                            return "0" == t && 1 / e == -o ? "-0" : t
                                        }(e)
                                    }
                                    var W, H = (W = function(e, t, n) {
                                        return e + (n ? "-" : "") + t.toLowerCase()
                                    }, function(e) {
                                        return function(e, t, n) {
                                            for (var r = -1, o = e ? e.length : 0; ++r < o;) n = t(n, e[r], r, e);
                                            return n
                                        }(function(e) {
                                            return function(e) {
                                                return N.test(e)
                                            }(e = V(e)) ? function(e) {
                                                return e.match(T) || []
                                            }(e) : function(e) {
                                                return e.match(i) || []
                                            }(e)
                                        }(function(e) {
                                            return (e = V(e)) && e.replace(a, U).replace(I, "")
                                        }(e).replace(j, "")), W, "")
                                    });
                                    e.exports = H
                                },
                                937: function(e, t, n) {
                                    var r = "function" == typeof Map && Map.prototype,
                                        o = Object.getOwnPropertyDescriptor && r ? Object.getOwnPropertyDescriptor(Map.prototype, "size") : null,
                                        i = r && o && "function" == typeof o.get ? o.get : null,
                                        a = r && Map.prototype.forEach,
                                        c = "function" == typeof Set && Set.prototype,
                                        l = Object.getOwnPropertyDescriptor && c ? Object.getOwnPropertyDescriptor(Set.prototype, "size") : null,
                                        u = c && l && "function" == typeof l.get ? l.get : null,
                                        f = c && Set.prototype.forEach,
                                        p = "function" == typeof WeakMap && WeakMap.prototype ? WeakMap.prototype.has : null,
                                        d = "function" == typeof WeakSet && WeakSet.prototype ? WeakSet.prototype.has : null,
                                        y = "function" == typeof WeakRef && WeakRef.prototype ? WeakRef.prototype.deref : null,
                                        h = Boolean.prototype.valueOf,
                                        m = Object.prototype.toString,
                                        g = Function.prototype.toString,
                                        v = String.prototype.match,
                                        b = String.prototype.slice,
                                        x = String.prototype.replace,
                                        S = String.prototype.toUpperCase,
                                        w = String.prototype.toLowerCase,
                                        P = RegExp.prototype.test,
                                        E = Array.prototype.concat,
                                        A = Array.prototype.join,
                                        O = Array.prototype.slice,
                                        k = Math.floor,
                                        C = "function" == typeof BigInt ? BigInt.prototype.valueOf : null,
                                        R = Object.getOwnPropertySymbols,
                                        j = "function" == typeof Symbol && "symbol" == s(Symbol.iterator) ? Symbol.prototype.toString : null,
                                        I = "function" == typeof Symbol && "object" == s(Symbol.iterator),
                                        T = "function" == typeof Symbol && Symbol.toStringTag && (Symbol.toStringTag, 1) ? Symbol.toStringTag : null,
                                        N = Object.prototype.propertyIsEnumerable,
                                        M = ("function" == typeof Reflect ? Reflect.getPrototypeOf : Object.getPrototypeOf) || ([].__proto__ === Array.prototype ? function(e) {
                                            return e.__proto__
                                        } : null);

                                    function _(e, t) {
                                        if (e === 1 / 0 || e === -1 / 0 || e != e || e && e > -1e3 && e < 1e3 || P.call(/e/, t)) return t;
                                        var n = /[0-9](?=(?:[0-9]{3})+(?![0-9]))/g;
                                        if ("number" == typeof e) {
                                            var r = e < 0 ? -k(-e) : k(e);
                                            if (r !== e) {
                                                var o = String(r),
                                                    i = b.call(t, o.length + 1);
                                                return x.call(o, n, "$&_") + "." + x.call(x.call(i, /([0-9]{3})/g, "$&_"), /_$/, "")
                                            }
                                        }
                                        return x.call(t, n, "$&_")
                                    }
                                    var D = n(634),
                                        U = D.custom,
                                        L = W(U) ? U : null;

                                    function F(e, t, n) {
                                        var r = "double" === (n.quoteStyle || t) ? '"' : "'";
                                        return r + e + r
                                    }

                                    function B(e) {
                                        return x.call(String(e), /"/g, "&quot;")
                                    }

                                    function q(e) {
                                        return !("[object Array]" !== $(e) || T && "object" == s(e) && T in e)
                                    }

                                    function V(e) {
                                        return !("[object RegExp]" !== $(e) || T && "object" == s(e) && T in e)
                                    }

                                    function W(e) {
                                        if (I) return e && "object" == s(e) && e instanceof Symbol;
                                        if ("symbol" == s(e)) return !0;
                                        if (!e || "object" != s(e) || !j) return !1;
                                        try {
                                            return j.call(e), !0
                                        } catch (e) {}
                                        return !1
                                    }
                                    e.exports = function e(t, r, o, c) {
                                        var l = r || {};
                                        if (K(l, "quoteStyle") && "single" !== l.quoteStyle && "double" !== l.quoteStyle) throw new TypeError('option "quoteStyle" must be "single" or "double"');
                                        if (K(l, "maxStringLength") && ("number" == typeof l.maxStringLength ? l.maxStringLength < 0 && l.maxStringLength !== 1 / 0 : null !== l.maxStringLength)) throw new TypeError('option "maxStringLength", if provided, must be a positive integer, Infinity, or `null`');
                                        var m = !K(l, "customInspect") || l.customInspect;
                                        if ("boolean" != typeof m && "symbol" !== m) throw new TypeError("option \"customInspect\", if provided, must be `true`, `false`, or `'symbol'`");
                                        if (K(l, "indent") && null !== l.indent && "\t" !== l.indent && !(parseInt(l.indent, 10) === l.indent && l.indent > 0)) throw new TypeError('option "indent" must be "\\t", an integer > 0, or `null`');
                                        if (K(l, "numericSeparator") && "boolean" != typeof l.numericSeparator) throw new TypeError('option "numericSeparator", if provided, must be `true` or `false`');
                                        var S = l.numericSeparator;
                                        if (void 0 === t) return "undefined";
                                        if (null === t) return "null";
                                        if ("boolean" == typeof t) return t ? "true" : "false";
                                        if ("string" == typeof t) return G(t, l);
                                        if ("number" == typeof t) {
                                            if (0 === t) return 1 / 0 / t > 0 ? "0" : "-0";
                                            var P = String(t);
                                            return S ? _(t, P) : P
                                        }
                                        if ("bigint" == typeof t) {
                                            var k = String(t) + "n";
                                            return S ? _(t, k) : k
                                        }
                                        var R = void 0 === l.depth ? 5 : l.depth;
                                        if (void 0 === o && (o = 0), o >= R && R > 0 && "object" == s(t)) return q(t) ? "[Array]" : "[Object]";
                                        var U, H = function(e, t) {
                                            var n;
                                            if ("\t" === e.indent) n = "\t";
                                            else {
                                                if (!("number" == typeof e.indent && e.indent > 0)) return null;
                                                n = A.call(Array(e.indent + 1), " ")
                                            }
                                            return {
                                                base: n,
                                                prev: A.call(Array(t + 1), n)
                                            }
                                        }(l, o);
                                        if (void 0 === c) c = [];
                                        else if (z(c, t) >= 0) return "[Circular]";

                                        function J(t, n, r) {
                                            if (n && (c = O.call(c)).push(n), r) {
                                                var i = {
                                                    depth: l.depth
                                                };
                                                return K(l, "quoteStyle") && (i.quoteStyle = l.quoteStyle), e(t, i, o + 1, c)
                                            }
                                            return e(t, l, o + 1, c)
                                        }
                                        if ("function" == typeof t && !V(t)) {
                                            var te = function(e) {
                                                    if (e.name) return e.name;
                                                    var t = v.call(g.call(e), /^function\s*([\w$]+)/);
                                                    return t ? t[1] : null
                                                }(t),
                                                ne = ee(t, J);
                                            return "[Function" + (te ? ": " + te : " (anonymous)") + "]" + (ne.length > 0 ? " { " + A.call(ne, ", ") + " }" : "")
                                        }
                                        if (W(t)) {
                                            var re = I ? x.call(String(t), /^(Symbol\(.*\))_[^)]*$/, "$1") : j.call(t);
                                            return "object" != s(t) || I ? re : Y(re)
                                        }
                                        if ((U = t) && "object" == s(U) && ("undefined" != typeof HTMLElement && U instanceof HTMLElement || "string" == typeof U.nodeName && "function" == typeof U.getAttribute)) {
                                            for (var oe = "<" + w.call(String(t.nodeName)), ie = t.attributes || [], ae = 0; ae < ie.length; ae++) oe += " " + ie[ae].name + "=" + F(B(ie[ae].value), "double", l);
                                            return oe += ">", t.childNodes && t.childNodes.length && (oe += "..."), oe + "</" + w.call(String(t.nodeName)) + ">"
                                        }
                                        if (q(t)) {
                                            if (0 === t.length) return "[]";
                                            var se = ee(t, J);
                                            return H && ! function(e) {
                                                for (var t = 0; t < e.length; t++)
                                                    if (z(e[t], "\n") >= 0) return !1;
                                                return !0
                                            }(se) ? "[" + X(se, H) + "]" : "[ " + A.call(se, ", ") + " ]"
                                        }
                                        if (function(e) {
                                                return !("[object Error]" !== $(e) || T && "object" == s(e) && T in e)
                                            }(t)) {
                                            var ce = ee(t, J);
                                            return "cause" in Error.prototype || !("cause" in t) || N.call(t, "cause") ? 0 === ce.length ? "[" + String(t) + "]" : "{ [" + String(t) + "] " + A.call(ce, ", ") + " }" : "{ [" + String(t) + "] " + A.call(E.call("[cause]: " + J(t.cause), ce), ", ") + " }"
                                        }
                                        if ("object" == s(t) && m) {
                                            if (L && "function" == typeof t[L] && D) return D(t, {
                                                depth: R - o
                                            });
                                            if ("symbol" !== m && "function" == typeof t.inspect) return t.inspect()
                                        }
                                        if (function(e) {
                                                if (!i || !e || "object" != s(e)) return !1;
                                                try {
                                                    i.call(e);
                                                    try {
                                                        u.call(e)
                                                    } catch (e) {
                                                        return !0
                                                    }
                                                    return e instanceof Map
                                                } catch (e) {}
                                                return !1
                                            }(t)) {
                                            var le = [];
                                            return a && a.call(t, (function(e, n) {
                                                le.push(J(n, t, !0) + " => " + J(e, t))
                                            })), Q("Map", i.call(t), le, H)
                                        }
                                        if (function(e) {
                                                if (!u || !e || "object" != s(e)) return !1;
                                                try {
                                                    u.call(e);
                                                    try {
                                                        i.call(e)
                                                    } catch (e) {
                                                        return !0
                                                    }
                                                    return e instanceof Set
                                                } catch (e) {}
                                                return !1
                                            }(t)) {
                                            var ue = [];
                                            return f && f.call(t, (function(e) {
                                                ue.push(J(e, t))
                                            })), Q("Set", u.call(t), ue, H)
                                        }
                                        if (function(e) {
                                                if (!p || !e || "object" != s(e)) return !1;
                                                try {
                                                    p.call(e, p);
                                                    try {
                                                        d.call(e, d)
                                                    } catch (e) {
                                                        return !0
                                                    }
                                                    return e instanceof WeakMap
                                                } catch (e) {}
                                                return !1
                                            }(t)) return Z("WeakMap");
                                        if (function(e) {
                                                if (!d || !e || "object" != s(e)) return !1;
                                                try {
                                                    d.call(e, d);
                                                    try {
                                                        p.call(e, p)
                                                    } catch (e) {
                                                        return !0
                                                    }
                                                    return e instanceof WeakSet
                                                } catch (e) {}
                                                return !1
                                            }(t)) return Z("WeakSet");
                                        if (function(e) {
                                                if (!y || !e || "object" != s(e)) return !1;
                                                try {
                                                    return y.call(e), !0
                                                } catch (e) {}
                                                return !1
                                            }(t)) return Z("WeakRef");
                                        if (function(e) {
                                                return !("[object Number]" !== $(e) || T && "object" == s(e) && T in e)
                                            }(t)) return Y(J(Number(t)));
                                        if (function(e) {
                                                if (!e || "object" != s(e) || !C) return !1;
                                                try {
                                                    return C.call(e), !0
                                                } catch (e) {}
                                                return !1
                                            }(t)) return Y(J(C.call(t)));
                                        if (function(e) {
                                                return !("[object Boolean]" !== $(e) || T && "object" == s(e) && T in e)
                                            }(t)) return Y(h.call(t));
                                        if (function(e) {
                                                return !("[object String]" !== $(e) || T && "object" == s(e) && T in e)
                                            }(t)) return Y(J(String(t)));
                                        if ("undefined" != typeof window && t === window) return "{ [object Window] }";
                                        if (t === n.g) return "{ [object globalThis] }";
                                        if (! function(e) {
                                                return !("[object Date]" !== $(e) || T && "object" == s(e) && T in e)
                                            }(t) && !V(t)) {
                                            var fe = ee(t, J),
                                                pe = M ? M(t) === Object.prototype : t instanceof Object || t.constructor === Object,
                                                de = t instanceof Object ? "" : "null prototype",
                                                ye = !pe && T && Object(t) === t && T in t ? b.call($(t), 8, -1) : de ? "Object" : "",
                                                he = (pe || "function" != typeof t.constructor ? "" : t.constructor.name ? t.constructor.name + " " : "") + (ye || de ? "[" + A.call(E.call([], ye || [], de || []), ": ") + "] " : "");
                                            return 0 === fe.length ? he + "{}" : H ? he + "{" + X(fe, H) + "}" : he + "{ " + A.call(fe, ", ") + " }"
                                        }
                                        return String(t)
                                    };
                                    var H = Object.prototype.hasOwnProperty || function(e) {
                                        return e in this
                                    };

                                    function K(e, t) {
                                        return H.call(e, t)
                                    }

                                    function $(e) {
                                        return m.call(e)
                                    }

                                    function z(e, t) {
                                        if (e.indexOf) return e.indexOf(t);
                                        for (var n = 0, r = e.length; n < r; n++)
                                            if (e[n] === t) return n;
                                        return -1
                                    }

                                    function G(e, t) {
                                        if (e.length > t.maxStringLength) {
                                            var n = e.length - t.maxStringLength,
                                                r = "... " + n + " more character" + (n > 1 ? "s" : "");
                                            return G(b.call(e, 0, t.maxStringLength), t) + r
                                        }
                                        return F(x.call(x.call(e, /(['\\])/g, "\\$1"), /[\x00-\x1f]/g, J), "single", t)
                                    }

                                    function J(e) {
                                        var t = e.charCodeAt(0),
                                            n = {
                                                8: "b",
                                                9: "t",
                                                10: "n",
                                                12: "f",
                                                13: "r"
                                            } [t];
                                        return n ? "\\" + n : "\\x" + (t < 16 ? "0" : "") + S.call(t.toString(16))
                                    }

                                    function Y(e) {
                                        return "Object(" + e + ")"
                                    }

                                    function Z(e) {
                                        return e + " { ? }"
                                    }

                                    function Q(e, t, n, r) {
                                        return e + " (" + t + ") {" + (r ? X(n, r) : A.call(n, ", ")) + "}"
                                    }

                                    function X(e, t) {
                                        if (0 === e.length) return "";
                                        var n = "\n" + t.prev + t.base;
                                        return n + A.call(e, "," + n) + "\n" + t.prev
                                    }

                                    function ee(e, t) {
                                        var n = q(e),
                                            r = [];
                                        if (n) {
                                            r.length = e.length;
                                            for (var o = 0; o < e.length; o++) r[o] = K(e, o) ? t(e[o], e) : ""
                                        }
                                        var i, a = "function" == typeof R ? R(e) : [];
                                        if (I) {
                                            i = {};
                                            for (var s = 0; s < a.length; s++) i["$" + a[s]] = a[s]
                                        }
                                        for (var c in e) K(e, c) && (n && String(Number(c)) === c && c < e.length || I && i["$" + c] instanceof Symbol || (P.call(/[^\w$]/, c) ? r.push(t(c, e) + ": " + t(e[c], e)) : r.push(c + ": " + t(e[c], e))));
                                        if ("function" == typeof R)
                                            for (var l = 0; l < a.length; l++) N.call(e, a[l]) && r.push("[" + t(a[l]) + "]: " + t(e[a[l]], e));
                                        return r
                                    }
                                },
                                647: function(e) {
                                    "use strict";
                                    var t = String.prototype.replace,
                                        n = /%20/g,
                                        r = "RFC3986";
                                    e.exports = {
                                        default: r,
                                        formatters: {
                                            RFC1738: function(e) {
                                                return t.call(e, n, "+")
                                            },
                                            RFC3986: function(e) {
                                                return String(e)
                                            }
                                        },
                                        RFC1738: "RFC1738",
                                        RFC3986: r
                                    }
                                },
                                882: function(e, t, n) {
                                    "use strict";
                                    var r = n(402),
                                        o = n(662),
                                        i = n(647),
                                        a = Object.prototype.hasOwnProperty,
                                        c = {
                                            brackets: function(e) {
                                                return e + "[]"
                                            },
                                            comma: "comma",
                                            indices: function(e, t) {
                                                return e + "[" + t + "]"
                                            },
                                            repeat: function(e) {
                                                return e
                                            }
                                        },
                                        l = Array.isArray,
                                        u = Array.prototype.push,
                                        f = function(e, t) {
                                            u.apply(e, l(t) ? t : [t])
                                        },
                                        p = Date.prototype.toISOString,
                                        d = i.default,
                                        y = {
                                            addQueryPrefix: !1,
                                            allowDots: !1,
                                            allowEmptyArrays: !1,
                                            arrayFormat: "indices",
                                            charset: "utf-8",
                                            charsetSentinel: !1,
                                            commaRoundTrip: !1,
                                            delimiter: "&",
                                            encode: !0,
                                            encodeDotInKeys: !1,
                                            encoder: o.encode,
                                            encodeValuesOnly: !1,
                                            filter: void 0,
                                            format: d,
                                            formatter: i.formatters[d],
                                            indices: !1,
                                            serializeDate: function(e) {
                                                return p.call(e)
                                            },
                                            skipNulls: !1,
                                            strictNullHandling: !1
                                        },
                                        h = {},
                                        m = function e(t, n, i, a, c, u, p, d, m, g, v, b, x, S, w, P, E, A) {
                                            for (var O, k = t, C = A, R = 0, j = !1; void 0 !== (C = C.get(h)) && !j;) {
                                                var I = C.get(t);
                                                if (R += 1, void 0 !== I) {
                                                    if (I === R) throw new RangeError("Cyclic object value");
                                                    j = !0
                                                }
                                                void 0 === C.get(h) && (R = 0)
                                            }
                                            if ("function" == typeof g ? k = g(n, k) : k instanceof Date ? k = x(k) : "comma" === i && l(k) && (k = o.maybeMap(k, (function(e) {
                                                    return e instanceof Date ? x(e) : e
                                                }))), null === k) {
                                                if (u) return m && !P ? m(n, y.encoder, E, "key", S) : n;
                                                k = ""
                                            }
                                            if ("string" == typeof(O = k) || "number" == typeof O || "boolean" == typeof O || "symbol" == s(O) || "bigint" == typeof O || o.isBuffer(k)) return m ? [w(P ? n : m(n, y.encoder, E, "key", S)) + "=" + w(m(k, y.encoder, E, "value", S))] : [w(n) + "=" + w(String(k))];
                                            var T, N = [];
                                            if (void 0 === k) return N;
                                            if ("comma" === i && l(k)) P && m && (k = o.maybeMap(k, m)), T = [{
                                                value: k.length > 0 ? k.join(",") || null : void 0
                                            }];
                                            else if (l(g)) T = g;
                                            else {
                                                var M = Object.keys(k);
                                                T = v ? M.sort(v) : M
                                            }
                                            var _ = d ? String(n).replace(/\./g, "%2E") : String(n),
                                                D = a && l(k) && 1 === k.length ? _ + "[]" : _;
                                            if (c && l(k) && 0 === k.length) return D + "[]";
                                            for (var U = 0; U < T.length; ++U) {
                                                var L = T[U],
                                                    F = "object" == s(L) && L && void 0 !== L.value ? L.value : k[L];
                                                if (!p || null !== F) {
                                                    var B = b && d ? String(L).replace(/\./g, "%2E") : String(L),
                                                        q = l(k) ? "function" == typeof i ? i(D, B) : D : D + (b ? "." + B : "[" + B + "]");
                                                    A.set(t, R);
                                                    var V = r();
                                                    V.set(h, A), f(N, e(F, q, i, a, c, u, p, d, "comma" === i && P && l(k) ? null : m, g, v, b, x, S, w, P, E, V))
                                                }
                                            }
                                            return N
                                        };
                                    e.exports = function(e, t) {
                                        var n, o = e,
                                            u = function(e) {
                                                if (!e) return y;
                                                if (void 0 !== e.allowEmptyArrays && "boolean" != typeof e.allowEmptyArrays) throw new TypeError("`allowEmptyArrays` option can only be `true` or `false`, when provided");
                                                if (void 0 !== e.encodeDotInKeys && "boolean" != typeof e.encodeDotInKeys) throw new TypeError("`encodeDotInKeys` option can only be `true` or `false`, when provided");
                                                if (null !== e.encoder && void 0 !== e.encoder && "function" != typeof e.encoder) throw new TypeError("Encoder has to be a function.");
                                                var t = e.charset || y.charset;
                                                if (void 0 !== e.charset && "utf-8" !== e.charset && "iso-8859-1" !== e.charset) throw new TypeError("The charset option must be either utf-8, iso-8859-1, or undefined");
                                                var n = i.default;
                                                if (void 0 !== e.format) {
                                                    if (!a.call(i.formatters, e.format)) throw new TypeError("Unknown format option provided.");
                                                    n = e.format
                                                }
                                                var r, o = i.formatters[n],
                                                    s = y.filter;
                                                if (("function" == typeof e.filter || l(e.filter)) && (s = e.filter), r = e.arrayFormat in c ? e.arrayFormat : "indices" in e ? e.indices ? "indices" : "repeat" : y.arrayFormat, "commaRoundTrip" in e && "boolean" != typeof e.commaRoundTrip) throw new TypeError("`commaRoundTrip` must be a boolean, or absent");
                                                var u = void 0 === e.allowDots ? !0 === e.encodeDotInKeys || y.allowDots : !!e.allowDots;
                                                return {
                                                    addQueryPrefix: "boolean" == typeof e.addQueryPrefix ? e.addQueryPrefix : y.addQueryPrefix,
                                                    allowDots: u,
                                                    allowEmptyArrays: "boolean" == typeof e.allowEmptyArrays ? !!e.allowEmptyArrays : y.allowEmptyArrays,
                                                    arrayFormat: r,
                                                    charset: t,
                                                    charsetSentinel: "boolean" == typeof e.charsetSentinel ? e.charsetSentinel : y.charsetSentinel,
                                                    commaRoundTrip: !!e.commaRoundTrip,
                                                    delimiter: void 0 === e.delimiter ? y.delimiter : e.delimiter,
                                                    encode: "boolean" == typeof e.encode ? e.encode : y.encode,
                                                    encodeDotInKeys: "boolean" == typeof e.encodeDotInKeys ? e.encodeDotInKeys : y.encodeDotInKeys,
                                                    encoder: "function" == typeof e.encoder ? e.encoder : y.encoder,
                                                    encodeValuesOnly: "boolean" == typeof e.encodeValuesOnly ? e.encodeValuesOnly : y.encodeValuesOnly,
                                                    filter: s,
                                                    format: n,
                                                    formatter: o,
                                                    serializeDate: "function" == typeof e.serializeDate ? e.serializeDate : y.serializeDate,
                                                    skipNulls: "boolean" == typeof e.skipNulls ? e.skipNulls : y.skipNulls,
                                                    sort: "function" == typeof e.sort ? e.sort : null,
                                                    strictNullHandling: "boolean" == typeof e.strictNullHandling ? e.strictNullHandling : y.strictNullHandling
                                                }
                                            }(t);
                                        "function" == typeof u.filter ? o = (0, u.filter)("", o) : l(u.filter) && (n = u.filter);
                                        var p = [];
                                        if ("object" != s(o) || null === o) return "";
                                        var d = c[u.arrayFormat],
                                            h = "comma" === d && u.commaRoundTrip;
                                        n || (n = Object.keys(o)), u.sort && n.sort(u.sort);
                                        for (var g = r(), v = 0; v < n.length; ++v) {
                                            var b = n[v],
                                                x = o[b];
                                            u.skipNulls && null === x || f(p, m(x, b, d, h, u.allowEmptyArrays, u.strictNullHandling, u.skipNulls, u.encodeDotInKeys, u.encode ? u.encoder : null, u.filter, u.sort, u.allowDots, u.serializeDate, u.format, u.formatter, u.encodeValuesOnly, u.charset, g))
                                        }
                                        var S = p.join(u.delimiter),
                                            w = !0 === u.addQueryPrefix ? "?" : "";
                                        return u.charsetSentinel && ("iso-8859-1" === u.charset ? w += "utf8=%26%2310003%3B&" : w += "utf8=%E2%9C%93&"), S.length > 0 ? w + S : ""
                                    }
                                },
                                662: function(e, t, n) {
                                    "use strict";
                                    var r = n(647),
                                        o = Object.prototype.hasOwnProperty,
                                        i = Array.isArray,
                                        a = function() {
                                            for (var e = [], t = 0; t < 256; ++t) e.push("%" + ((t < 16 ? "0" : "") + t.toString(16)).toUpperCase());
                                            return e
                                        }(),
                                        c = function(e, t) {
                                            for (var n = t && t.plainObjects ? {
                                                    __proto__: null
                                                } : {}, r = 0; r < e.length; ++r) void 0 !== e[r] && (n[r] = e[r]);
                                            return n
                                        },
                                        l = 1024;
                                    e.exports = {
                                        arrayToObject: c,
                                        assign: function(e, t) {
                                            return Object.keys(t).reduce((function(e, n) {
                                                return e[n] = t[n], e
                                            }), e)
                                        },
                                        combine: function(e, t) {
                                            return [].concat(e, t)
                                        },
                                        compact: function(e) {
                                            for (var t = [{
                                                    obj: {
                                                        o: e
                                                    },
                                                    prop: "o"
                                                }], n = [], r = 0; r < t.length; ++r)
                                                for (var o = t[r], a = o.obj[o.prop], c = Object.keys(a), l = 0; l < c.length; ++l) {
                                                    var u = c[l],
                                                        f = a[u];
                                                    "object" == s(f) && null !== f && -1 === n.indexOf(f) && (t.push({
                                                        obj: a,
                                                        prop: u
                                                    }), n.push(f))
                                                }
                                            return function(e) {
                                                for (; e.length > 1;) {
                                                    var t = e.pop(),
                                                        n = t.obj[t.prop];
                                                    if (i(n)) {
                                                        for (var r = [], o = 0; o < n.length; ++o) void 0 !== n[o] && r.push(n[o]);
                                                        t.obj[t.prop] = r
                                                    }
                                                }
                                            }(t), e
                                        },
                                        decode: function(e, t, n) {
                                            var r = e.replace(/\+/g, " ");
                                            if ("iso-8859-1" === n) return r.replace(/%[0-9a-f]{2}/gi, unescape);
                                            try {
                                                return decodeURIComponent(r)
                                            } catch (e) {
                                                return r
                                            }
                                        },
                                        encode: function(e, t, n, o, i) {
                                            if (0 === e.length) return e;
                                            var c = e;
                                            if ("symbol" == s(e) ? c = Symbol.prototype.toString.call(e) : "string" != typeof e && (c = String(e)), "iso-8859-1" === n) return escape(c).replace(/%u[0-9a-f]{4}/gi, (function(e) {
                                                return "%26%23" + parseInt(e.slice(2), 16) + "%3B"
                                            }));
                                            for (var u = "", f = 0; f < c.length; f += l) {
                                                for (var p = c.length >= l ? c.slice(f, f + l) : c, d = [], y = 0; y < p.length; ++y) {
                                                    var h = p.charCodeAt(y);
                                                    45 === h || 46 === h || 95 === h || 126 === h || h >= 48 && h <= 57 || h >= 65 && h <= 90 || h >= 97 && h <= 122 || i === r.RFC1738 && (40 === h || 41 === h) ? d[d.length] = p.charAt(y) : h < 128 ? d[d.length] = a[h] : h < 2048 ? d[d.length] = a[192 | h >> 6] + a[128 | 63 & h] : h < 55296 || h >= 57344 ? d[d.length] = a[224 | h >> 12] + a[128 | h >> 6 & 63] + a[128 | 63 & h] : (y += 1, h = 65536 + ((1023 & h) << 10 | 1023 & p.charCodeAt(y)), d[d.length] = a[240 | h >> 18] + a[128 | h >> 12 & 63] + a[128 | h >> 6 & 63] + a[128 | 63 & h])
                                                }
                                                u += d.join("")
                                            }
                                            return u
                                        },
                                        isBuffer: function(e) {
                                            return !(!e || "object" != s(e) || !(e.constructor && e.constructor.isBuffer && e.constructor.isBuffer(e)))
                                        },
                                        isRegExp: function(e) {
                                            return "[object RegExp]" === Object.prototype.toString.call(e)
                                        },
                                        maybeMap: function(e, t) {
                                            if (i(e)) {
                                                for (var n = [], r = 0; r < e.length; r += 1) n.push(t(e[r]));
                                                return n
                                            }
                                            return t(e)
                                        },
                                        merge: function e(t, n, r) {
                                            if (!n) return t;
                                            if ("object" != s(n) && "function" != typeof n) {
                                                if (i(t)) t.push(n);
                                                else {
                                                    if (!t || "object" != s(t)) return [t, n];
                                                    (r && (r.plainObjects || r.allowPrototypes) || !o.call(Object.prototype, n)) && (t[n] = !0)
                                                }
                                                return t
                                            }
                                            if (!t || "object" != s(t)) return [t].concat(n);
                                            var a = t;
                                            return i(t) && !i(n) && (a = c(t, r)), i(t) && i(n) ? (n.forEach((function(n, i) {
                                                if (o.call(t, i)) {
                                                    var a = t[i];
                                                    a && "object" == s(a) && n && "object" == s(n) ? t[i] = e(a, n, r) : t.push(n)
                                                } else t[i] = n
                                            })), t) : Object.keys(n).reduce((function(t, i) {
                                                var a = n[i];
                                                return o.call(t, i) ? t[i] = e(t[i], a, r) : t[i] = a, t
                                            }), a)
                                        }
                                    }
                                },
                                255: function(e, t, n) {
                                    "use strict";
                                    var r = n(651),
                                        o = n(295),
                                        i = n(890)(),
                                        a = n(109),
                                        s = n(785),
                                        c = r("%Math.floor%");
                                    e.exports = function(e, t) {
                                        if ("function" != typeof e) throw new s("`fn` is not a function");
                                        if ("number" != typeof t || t < 0 || t > 4294967295 || c(t) !== t) throw new s("`length` must be a positive 32-bit integer");
                                        var n = arguments.length > 2 && !!arguments[2],
                                            r = !0,
                                            l = !0;
                                        if ("length" in e && a) {
                                            var u = a(e, "length");
                                            u && !u.configurable && (r = !1), u && !u.writable && (l = !1)
                                        }
                                        return (r || l || !n) && (i ? o(e, "length", t, !0, !0) : o(e, "length", t)), e
                                    }
                                },
                                402: function(e, t, n) {
                                    "use strict";
                                    var r = n(651),
                                        o = n(913),
                                        i = n(937),
                                        a = n(785),
                                        c = r("%WeakMap%", !0),
                                        l = r("%Map%", !0),
                                        u = o("WeakMap.prototype.get", !0),
                                        f = o("WeakMap.prototype.set", !0),
                                        p = o("WeakMap.prototype.has", !0),
                                        d = o("Map.prototype.get", !0),
                                        y = o("Map.prototype.set", !0),
                                        h = o("Map.prototype.has", !0),
                                        m = function(e, t) {
                                            for (var n, r = e; null !== (n = r.next); r = n)
                                                if (n.key === t) return r.next = n.next, n.next = e.next, e.next = n, n
                                        };
                                    e.exports = function() {
                                        var e, t, n, r = {
                                            assert: function(e) {
                                                if (!r.has(e)) throw new a("Side channel does not contain " + i(e))
                                            },
                                            get: function(r) {
                                                if (c && r && ("object" == s(r) || "function" == typeof r)) {
                                                    if (e) return u(e, r)
                                                } else if (l) {
                                                    if (t) return d(t, r)
                                                } else if (n) return function(e, t) {
                                                    var n = m(e, t);
                                                    return n && n.value
                                                }(n, r)
                                            },
                                            has: function(r) {
                                                if (c && r && ("object" == s(r) || "function" == typeof r)) {
                                                    if (e) return p(e, r)
                                                } else if (l) {
                                                    if (t) return h(t, r)
                                                } else if (n) return function(e, t) {
                                                    return !!m(e, t)
                                                }(n, r);
                                                return !1
                                            },
                                            set: function(r, o) {
                                                c && r && ("object" == s(r) || "function" == typeof r) ? (e || (e = new c), f(e, r, o)) : l ? (t || (t = new l), y(t, r, o)) : (n || (n = {
                                                    key: {},
                                                    next: null
                                                }), function(e, t, n) {
                                                    var r = m(e, t);
                                                    r ? r.value = n : e.next = {
                                                        key: t,
                                                        next: e.next,
                                                        value: n
                                                    }
                                                }(n, r, o))
                                            }
                                        };
                                        return r
                                    }
                                },
                                634: function() {}
                            },
                            t = {};

                        function n(r) {
                            var o = t[r];
                            if (void 0 !== o) return o.exports;
                            var i = t[r] = {
                                exports: {}
                            };
                            return e[r](i, i.exports, n), i.exports
                        }
                        n.n = function(e) {
                            var t = e && e.__esModule ? function() {
                                return e.default
                            } : function() {
                                return e
                            };
                            return n.d(t, {
                                a: t
                            }), t
                        }, n.d = function(e, t) {
                            for (var r in t) n.o(t, r) && !n.o(e, r) && Object.defineProperty(e, r, {
                                enumerable: !0,
                                get: t[r]
                            })
                        }, n.g = function() {
                            if ("object" == ("undefined" == typeof globalThis ? "undefined" : s(globalThis))) return globalThis;
                            try {
                                return this || new Function("return this")()
                            } catch (e) {
                                if ("object" == ("undefined" == typeof window ? "undefined" : s(window))) return window
                            }
                        }(), n.o = function(e, t) {
                            return Object.prototype.hasOwnProperty.call(e, t)
                        };
                        var r = {};
                        return function() {
                            "use strict";
                            n.d(r, {
                                default: function() {
                                    return E
                                }
                            });
                            var e, t, o, i = n(882),
                                a = n.n(i);

                            function s(e) {
                                switch (e) {
                                    case "development":
                                        return o.Development;
                                    case "staging":
                                        return o.Staging;
                                    case "canary":
                                        return o.Canary;
                                    default:
                                        return o.Production
                                }
                            }! function(e) {
                                e.Cancel = "exit", e.Complete = "complete", e.Error = "error", e.Fail = "fail", e.Load = "load", e.Ready = "ready", e.Start = "start", e.Success = "success", e.DocumentCameraSelect = "document-camera-select", e.DocumentCameraCapture = "document-camera-capture", e.DocumentUpload = "document-upload", e.OneTimeLinkSent = "one-time-link-sent", e.OneTimeLinkStart = "one-time-link-start", e.OneTimeLinkExit = "one-time-link-exit", e.SelfieCameraSelect = "selfie-camera-select", e.SelfieCameraCapture = "selfie-camera-capture", e.SelfieRecordUpload = "selfie-record-upload", e.LoadCameraFailed = "load-camera-failed", e.PageChange = "page-change", e.InquiryLoad = "inquiry-load", e.CountrySelect = "country-select", e.VerificationChange = "verification-change"
                            }(e || (e = {})),
                            function(e) {
                                e.Open = "open", e.Exit = "exit", e.Destroy = "destroy"
                            }(t || (t = {})),
                            function(e) {
                                e.Development = "http://localhost:3000", e.Staging = "https://inquiry.withpersona-staging.com", e.Canary = "https://canary.withpersona.com", e.Production = "https://inquiry.withpersona.com"
                            }(o || (o = {}));
                            var c = n(709),
                                l = n.n(c),
                                u = function() {
                                    return u = Object.assign || function(e) {
                                        for (var t, n = 1, r = arguments.length; n < r; n++)
                                            for (var o in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
                                        return e
                                    }, u.apply(this, arguments)
                                };

                            function f(e) {
                                return Array.isArray(e) ? e.map(f) : function(e) {
                                    return null != e && e.constructor === Object
                                }(e) ? Object.keys(e).reduce((function(t, n) {
                                    var r;
                                    return u(u({}, t), ((r = {})[l()(n)] = f(e[n]), r))
                                }), {}) : e
                            }
                            var p = function(e) {
                                    var t = "function" == typeof Symbol && Symbol.iterator,
                                        n = t && e[t],
                                        r = 0;
                                    if (n) return n.call(e);
                                    if (e && "number" == typeof e.length) return {
                                        next: function() {
                                            return e && r >= e.length && (e = void 0), {
                                                value: e && e[r++],
                                                done: !e
                                            }
                                        }
                                    };
                                    throw new TypeError(t ? "Object is not iterable." : "Symbol.iterator is not defined.")
                                },
                                d = function(e, t) {
                                    var n = "function" == typeof Symbol && e[Symbol.iterator];
                                    if (!n) return e;
                                    var r, o, i = n.call(e),
                                        a = [];
                                    try {
                                        for (;
                                            (void 0 === t || t-- > 0) && !(r = i.next()).done;) a.push(r.value)
                                    } catch (e) {
                                        o = {
                                            error: e
                                        }
                                    } finally {
                                        try {
                                            r && !r.done && (n = i.return) && n.call(i)
                                        } finally {
                                            if (o) throw o.error
                                        }
                                    }
                                    return a
                                },
                                y = function() {
                                    function e(e) {
                                        this.id = e
                                    }
                                    return e.prototype.isMounted = function() {
                                        return null != document.getElementById(this.id)
                                    }, e.prototype.mount = function(e) {
                                        if (document.getElementById(this.id)) console.warn("persona: stylesheet ".concat(this.id, " already appended. skipping."));
                                        else {
                                            var t = m("style", {
                                                id: this.id
                                            }, [document.createTextNode(e)]);
                                            document.head.appendChild(t)
                                        }
                                    }, e.prototype.unmount = function() {
                                        var e, t = document.getElementById(this.id);
                                        null != t ? null === (e = t.parentNode) || void 0 === e || e.removeChild(t) : console.warn("persona: no stylesheet ".concat(this.id, " to remove. skipping."))
                                    }, e
                                }();

                            function h(e, t, n) {
                                var r, o, i, a;
                                void 0 === n && (n = []);
                                var s = document.createElementNS("http://www.w3.org/2000/svg", e);
                                try {
                                    for (var c = p(Object.entries(t)), l = c.next(); !l.done; l = c.next()) {
                                        var u = d(l.value, 2),
                                            f = u[0],
                                            y = u[1];
                                        "className" === f && (f = "class"), s.setAttribute(f, y)
                                    }
                                } catch (e) {
                                    r = {
                                        error: e
                                    }
                                } finally {
                                    try {
                                        l && !l.done && (o = c.return) && o.call(c)
                                    } finally {
                                        if (r) throw r.error
                                    }
                                }
                                try {
                                    for (var h = p(n), m = h.next(); !m.done; m = h.next()) {
                                        var g = m.value;
                                        !1 !== g && s.appendChild(g)
                                    }
                                } catch (e) {
                                    i = {
                                        error: e
                                    }
                                } finally {
                                    try {
                                        m && !m.done && (a = h.return) && a.call(h)
                                    } finally {
                                        if (i) throw i.error
                                    }
                                }
                                return s
                            }

                            function m(e, t, n) {
                                var r, o, i, a;
                                void 0 === n && (n = []);
                                var s = document.createElement(e);
                                try {
                                    for (var c = p(Object.entries(t)), l = c.next(); !l.done; l = c.next()) {
                                        var u = d(l.value, 2),
                                            f = u[0],
                                            y = u[1];
                                        "className" === f && (f = "class"), s.setAttribute(f, y)
                                    }
                                } catch (e) {
                                    r = {
                                        error: e
                                    }
                                } finally {
                                    try {
                                        l && !l.done && (o = c.return) && o.call(c)
                                    } finally {
                                        if (r) throw r.error
                                    }
                                }
                                try {
                                    for (var h = p(n), m = h.next(); !m.done; m = h.next()) {
                                        var g = m.value;
                                        !1 !== g && ("string" == typeof g ? s.appendChild(document.createTextNode(g)) : s.appendChild(g))
                                    }
                                } catch (e) {
                                    i = {
                                        error: e
                                    }
                                } finally {
                                    try {
                                        m && !m.done && (a = h.return) && a.call(h)
                                    } finally {
                                        if (i) throw i.error
                                    }
                                }
                                return s
                            }

                            function g(e) {
                                return "string" == typeof e ? e : "number" == typeof e ? "".concat(e, "px") : ""
                            }
                            var v = ["allow-scripts", "allow-same-origin", "allow-popups"],
                                b = ["allow-forms", "allow-modals", "allow-top-navigation-by-user-activation"];

                            function x(e, t, n, r) {
                                var o = r.accountId,
                                    i = r.accountTypeId,
                                    c = r.environment,
                                    l = r.environmentId,
                                    u = r.fields,
                                    p = r.frameAncestors,
                                    d = r.frameHeight,
                                    y = r.frameWidth,
                                    h = r.host,
                                    m = r.iframeTitle,
                                    x = r.inquiryId,
                                    S = r.language,
                                    w = r.messageTargetOrigin,
                                    P = r.referenceId,
                                    E = r.routingCountry,
                                    A = r.sandboxAttributes,
                                    O = void 0 === A ? b : A,
                                    k = r.sessionToken,
                                    C = r.styleVariant,
                                    R = r.templateId,
                                    j = r.templateVersionId,
                                    I = r.themeSetId,
                                    T = r.widgetPadding,
                                    N = !(!R && !j),
                                    M = null == R ? void 0 : R.startsWith("itmpl_");
                                if (!N && !x) throw new Error("Either templateId/templateVersionId or inquiryId must be specified to start a flow");
                                if (N && x) throw new Error("Only one of templateId/templateVersionId or inquiryId should be specified to start a flow");
                                if (o) {
                                    if (P) throw new Error("Cannot pass both accountId and referenceId");
                                    if (i) throw new Error("Cannot pass both accountId and accountTypeId")
                                }
                                var _ = s(h),
                                    D = a()({
                                        "client-version": "5.1.5",
                                        "container-id": t,
                                        "flow-type": n,
                                        "routing-country": E,
                                        "template-id": (M ? null : R) || null,
                                        "inquiry-template-id": (M ? R : null) || null,
                                        "inquiry-template-version-id": j || null,
                                        environment: c,
                                        "environment-id": l,
                                        "iframe-origin": window.location.origin,
                                        "frame-ancestors": null != p ? p : null,
                                        "message-target-origin": w || null,
                                        "inquiry-id": x || null,
                                        language: S,
                                        "session-token": k,
                                        "reference-id": P,
                                        "account-id": o,
                                        "account-type-id": i,
                                        fields: f(null != u ? u : {}),
                                        "style-variant": C || null,
                                        "theme-set-id": I,
                                        "widget-padding": T
                                    }, {
                                        addQueryPrefix: !0,
                                        skipNulls: !0
                                    });
                                return e.style.maxHeight = g(d), e.style.maxWidth = g(y), e.setAttribute("data-testid", "persona-widget__iframe"), "embedded" === n && e.setAttribute("aria-modal", "true"), e.title = null != m ? m : "Verify your identity", e.className = "persona-widget__iframe", e.allow = "camera;microphone;clipboard-write", e.setAttribute("sandbox", v.concat(O).join(" ")), e.frameBorder = "0", e.src = _ + "/widget" + D, e.onload = function() {}, e
                            }
                            var S = function() {
                                    function e() {}
                                    return e.log = function(e, t) {
                                        void 0 === t && (t = "info")
                                    }, e
                                }(),
                                w = function(e) {
                                    return e.split(".").slice(-2).join(".")
                                };

                            function P(t, n) {
                                var r = n.onLoad,
                                    o = n.onReady,
                                    i = n.onComplete,
                                    a = n.onEvent,
                                    c = n.onCancel,
                                    l = n.onError,
                                    u = n.templateId,
                                    f = n.templateVersionId,
                                    p = n.host,
                                    d = function(n) {
                                        var d, y = s(null != p ? p : "production");
                                        if ("" !== n.origin) try {
                                            if (w(new URL(n.origin).host) !== w(new URL(y).host)) return
                                        } catch (e) {
                                            return
                                        }
                                        if (!(u && u !== n.data.templateId || f && f !== n.data.templateVersionId || n.data.containerId && t !== n.data.containerId)) switch (null == a || a(n.data.name, n.data.metadata), n.data.name) {
                                            case e.Load:
                                                null == r || r();
                                                break;
                                            case e.Ready:
                                                null == o || o();
                                                break;
                                            case e.Complete:
                                            case e.Fail:
                                                null == i || i({
                                                    inquiryId: n.data.metadata.inquiryId,
                                                    status: n.data.metadata.status,
                                                    fields: null !== (d = n.data.metadata.fields) && void 0 !== d ? d : n.data.metadata.scopes
                                                });
                                                break;
                                            case e.Cancel:
                                                null == c || c({
                                                    inquiryId: n.data.metadata.inquiryId,
                                                    sessionToken: n.data.metadata.sessionToken
                                                });
                                                break;
                                            case e.Error:
                                                null == l || l(n.data.error)
                                        }
                                    };
                                return window.addEventListener("message", d),
                                    function() {
                                        window.removeEventListener("message", d)
                                    }
                            }
                            var E = {
                                Client: function() {
                                    function e(e) {
                                        var t, n, r, o, i, a, s, c, l, u, f, p = this;
                                        this._isLoading = !0, this._isOpen = !1, this.personaCSS = new y("persona-widget-styles"), this.globalCSS = new y("persona-global-styles"), this.onLoad = function() {
                                            var e, t;
                                            p._isLoading = !1, p.render(), null === (t = (e = p.options).onLoad) || void 0 === t || t.call(e)
                                        }, this.onReady = function() {
                                            var e, t;
                                            null === (t = (e = p.options).onReady) || void 0 === t || t.call(e)
                                        }, this.onComplete = function(e) {
                                            var t, n, r = e.inquiryId,
                                                o = e.status,
                                                i = e.fields;
                                            p._isOpen = !1, p.render(), null === (n = (t = p.options).onComplete) || void 0 === n || n.call(t, {
                                                inquiryId: r,
                                                status: o,
                                                fields: i
                                            })
                                        }, this.onCancel = function(e) {
                                            var t, n, r = e.inquiryId,
                                                o = e.sessionToken;
                                            p._isOpen = !1, p.render(), null === (n = (t = p.options).onCancel) || void 0 === n || n.call(t, {
                                                inquiryId: r,
                                                sessionToken: o
                                            })
                                        }, this.options = e, this.containerParent = null !== (n = null !== (t = e.parent) && void 0 !== t ? t : document.body) && void 0 !== n ? n : document.children[0], this.containerElement = m("div", {
                                            class: "persona-widget__overlay",
                                            style: "display: ".concat(this._isOpen ? "block" : "none")
                                        }), this.containerId = "persona-widget-" + new Array(16).fill(void 0).map((function() {
                                            return Math.floor(35 * Math.random()).toString(35)
                                        })).join(""), this.containerElement.setAttribute("id", this.containerId), this.loadingElement = m("div", {
                                            class: "persona-widget__centered-frame"
                                        }, [h("svg", {
                                            xmlns: "http://www.w3.org/2000/svg",
                                            width: "114",
                                            height: "114",
                                            class: "persona-widget__loading-spinner"
                                        }, [h("path", {
                                            fill: "none",
                                            stroke: "#0F2B72",
                                            strokeLinecap: "round",
                                            strokeLinejoin: "round",
                                            strokeWidth: "2",
                                            d: "M25.887 10.432a56.275 56.275 0 0 0-15.455 15.455 55.86 55.86 0 0 0-5.183 9.678A55.576 55.576 0 0 0 2.066 46.07m-.8 5.438A56.678 56.678 0 0 0 1 57m4.249 21.435a55.86 55.86 0 0 0 5.183 9.678 56.275 56.275 0 0 0 6.97 8.485m8.485 6.97a55.86 55.86 0 0 0 9.678 5.183 55.576 55.576 0 0 0 10.506 3.183c3.535.7 7.19 1.066 10.929 1.066 3.74 0 7.394-.367 10.929-1.066a55.576 55.576 0 0 0 10.506-3.183 55.86 55.86 0 0 0 9.678-5.183 56.275 56.275 0 0 0 15.455-15.455 55.86 55.86 0 0 0 5.183-9.678 55.576 55.576 0 0 0 3.183-10.506A56.274 56.274 0 0 0 113 57c0-3.74-.367-7.394-1.066-10.929a55.576 55.576 0 0 0-3.183-10.506M96.598 17.402a56.275 56.275 0 0 0-8.485-6.97 55.86 55.86 0 0 0-9.678-5.183A55.576 55.576 0 0 0 67.93 2.066 56.274 56.274 0 0 0 57 1c-3.74 0-7.394.367-10.929 1.066m-34.94 30.418A51.76 51.76 0 0 0 7.225 41.9a51.633 51.633 0 0 0-1.98 10 52.63 52.63 0 0 0 .744 15.247 51.633 51.633 0 0 0 7.768 18.743 52.188 52.188 0 0 0 10.254 11.308 52.188 52.188 0 0 0 8.472 5.67m9.417 3.905a51.633 51.633 0 0 0 10 1.98 52.63 52.63 0 0 0 10.197 0 51.939 51.939 0 0 0 10-1.98 51.61 51.61 0 0 0 9.418-3.904 51.984 51.984 0 0 0 8.472-5.671m3.782-3.43a52.308 52.308 0 0 0 3.429-3.78m9.575-17.89a51.633 51.633 0 0 0 1.98-10 52.63 52.63 0 0 0-.744-15.247 51.633 51.633 0 0 0-7.768-18.743 52.188 52.188 0 0 0-10.254-11.308m-4.097-3.043a51.984 51.984 0 0 0-4.375-2.628M67.148 5.99a51.939 51.939 0 0 0-5.05-.743 52.63 52.63 0 0 0-15.246.743 51.633 51.633 0 0 0-18.743 7.768M24.012 16.8a52.308 52.308 0 0 0-3.782 3.43"
                                        })])]), this.containerElement.append(this.loadingElement), this.isLoading ? this.loadingElement.style.display = "block" : this.loadingElement.style.display = "none", this.iframeElement = document.createElement("iframe"), this.unsubscribeFromEvents = P(this.containerId, {
                                            onLoad: null !== (r = this.onLoad) && void 0 !== r ? r : null,
                                            onReady: null !== (o = this.onReady) && void 0 !== o ? o : null,
                                            onComplete: null !== (i = this.onComplete) && void 0 !== i ? i : null,
                                            onCancel: null !== (a = this.onCancel) && void 0 !== a ? a : null,
                                            onEvent: null !== (s = this.options.onEvent) && void 0 !== s ? s : null,
                                            onError: null !== (c = this.options.onError) && void 0 !== c ? c : null,
                                            templateId: null !== (l = this.options.templateId) && void 0 !== l ? l : null,
                                            templateVersionId: null !== (u = this.options.templateVersionId) && void 0 !== u ? u : null,
                                            host: null !== (f = this.options.host) && void 0 !== f ? f : null
                                        }), this.containerElement.appendChild(this.iframeElement), this.containerParent.appendChild(this.containerElement), this.personaCSS.mount("@keyframes persona-widget__fadeIn {\n  from {\n    background-color: rgba(0, 0, 0, 0);\n    opacity: 0;\n  }\n  to {\n    /* persona-widget__overlay opacity = 0.7 */\n    background-color: rgba(0, 0, 0, 0.7);\n    opacity: 1;\n  }\n}\n\n@keyframes persona-widget__genieSlideIn {\n  from {\n    transform: translate(-50%, -40%) scale(0.8);\n  }\n  90% {\n    transform: translate(-50%, -51%) scale(1.01);\n  }\n  to {\n    transform: translate(-50%, -50%);\n  }\n}\n\n@keyframes persona-widget__slideDown {\n  from {\n    transform: translate(-50%, -55%);\n  }\n  to {\n    transform: translate(-50%, -50%);\n  }\n}\n\n.persona-widget__overlay {\n  position: fixed;\n  left: 0;\n  top: 0;\n  right: 0;\n  bottom: 0;\n  z-index: 9999;\n  animation: persona-widget__fadeIn 0.3s;\n  background-color: rgba(0, 0, 0, 0.7);\n}\n\n.persona-widget__overlay .persona-widget__centered-frame {\n  width: 120px;\n  height: 120px;\n  position: absolute;\n  left: calc(50% - 60px);\n  top: calc(50% - 60px);\n  z-index: 9999;\n}\n\n.persona-widget__overlay .persona-widget__loading-spinner {\n  position: absolute;\n  top: 50%;\n  left: 50%;\n  transform: translate(-50%, -50%);\n}\n\n.persona-widget__overlay .persona-widget__iframe {\n  animation: persona-widget__genieSlideIn 0.3s, persona-widget__slideDown ease-out 0.3s;\n\n  width: 100%;\n  height: 100%;\n\n  margin-left: auto;\n  margin-right: auto;\n  position: absolute;\n  left: 50%;\n  top: 50%;\n  transform: translate(-50%, -50%);\n\n  background-color: #ffffff;\n  border: none;\n  border-radius: 4px;\n  box-shadow: 0px 12px 40px 2px rgba(0, 0, 0, 0.4);\n\n  @media only screen and (min-width: 600.02px) and (min-height: 600.02px) {\n    max-width: 400px;\n    max-height: 650px;\n  }\n}\n");
                                        try {
                                            this.iframeElement = x(this.iframeElement, this.containerId, "embedded", this.options)
                                        } catch (e) {
                                            throw console.error("Persona", e), this.destroy(), e
                                        }
                                        this.render()
                                    }
                                    return e.preload = function(e) {
                                        return void 0 === e && (e = "production"), new Promise((function(t) {
                                            var n = s(e),
                                                r = document.createElement("iframe");
                                            r.frameBorder = "0", r.style.height = "0px", r.style.width = "0px", r.style.display = "none", r.src = n + "/preload", document.body.appendChild(r), r.onload = function() {
                                                document.body.removeChild(r), t()
                                            }
                                        }))
                                    }, e.prototype.render = function() {
                                        var e;
                                        null != this.containerElement ? (this.loadingElement.style.display = this.isLoading ? "block" : "none", this.containerElement.style.display = this.isOpen ? "block" : "none", this.isOpen && !this.globalCSS.isMounted() ? this.globalCSS.mount((e = this.containerId, "\n  /* Don't allow scrolling when widget is open */\n  html body {\n    overflow: hidden !important;\n  }\n\n  /* When the widget takes the full screen, hide everything else to prevent iOS scroll issues. */\n  @media ".concat("(max-width: 600px), (max-height: 420px)", " {\n    html body > *:not(#").concat(e, ") {\n      display: none !important;\n    }\n  }\n"))) : !this.isOpen && this.globalCSS.isMounted() && this.globalCSS.unmount()) : S.log("Cannot render client that has been destroyed", "error")
                                    }, e.prototype.open = function() {
                                        var e;
                                        null === (e = this.iframeElement.contentWindow) || void 0 === e || e.postMessage({
                                            action: t.Open,
                                            metadata: {}
                                        }, this.baseUrl), this._isOpen = !0, this.render()
                                    }, e.prototype.cancel = function(e) {
                                        var n;
                                        null === (n = this.iframeElement.contentWindow) || void 0 === n || n.postMessage({
                                            action: t.Exit,
                                            metadata: {
                                                force: e
                                            }
                                        }, this.baseUrl), this.render()
                                    }, e.prototype.destroy = function() {
                                        var e;
                                        null === (e = this.iframeElement.contentWindow) || void 0 === e || e.postMessage({
                                            action: t.Destroy,
                                            metadata: {}
                                        }, this.baseUrl), this.personaCSS.unmount(), this.globalCSS.unmount(), this.containerParent.removeChild(this.containerElement), this.unsubscribeFromEvents()
                                    }, Object.defineProperty(e.prototype, "isLoading", {
                                        get: function() {
                                            return this._isLoading
                                        },
                                        enumerable: !1,
                                        configurable: !0
                                    }), Object.defineProperty(e.prototype, "isOpen", {
                                        get: function() {
                                            return this._isOpen
                                        },
                                        enumerable: !1,
                                        configurable: !0
                                    }), Object.defineProperty(e.prototype, "baseUrl", {
                                        get: function() {
                                            return s(this.options.host)
                                        },
                                        enumerable: !1,
                                        configurable: !0
                                    }), e
                                }(),
                                setupIframe: x,
                                setupEvents: P
                            }
                        }(), r.default
                    }()
                }, "object" == s(t) && "object" == s(e) ? e.exports = a() : (o = [], void 0 === (i = "function" == typeof(r = a) ? r.apply(t, o) : r) || (e.exports = i))
            }
        },
        t = {};

    function n(r) {
        var o = t[r];
        if (void 0 !== o) return o.exports;
        var i = t[r] = {
            id: r,
            loaded: !1,
            exports: {}
        };
        return e[r](i, i.exports, n), i.loaded = !0, i.exports
    }
    n.n = function(e) {
            var t = e && e.__esModule ? function() {
                return e.default
            } : function() {
                return e
            };
            return n.d(t, {
                a: t
            }), t
        }, n.d = function(e, t) {
            for (var r in t) n.o(t, r) && !n.o(e, r) && Object.defineProperty(e, r, {
                enumerable: !0,
                get: t[r]
            })
        }, n.o = function(e, t) {
            return Object.prototype.hasOwnProperty.call(e, t)
        }, n.nmd = function(e) {
            return e.paths = [], e.children || (e.children = []), e
        },
        function() {
            "use strict";
            var e = CoreUtilities,
                t = React,
                r = n.n(t),
                o = ReactDOM,
                i = Roblox,
                a = n.n(i),
                s = PropTypes,
                c = n.n(s),
                l = ReactUtilities;

            function u() {
                return u = Object.assign || function(e) {
                    for (var t = 1; t < arguments.length; t++) {
                        var n = arguments[t];
                        for (var r in n) Object.prototype.hasOwnProperty.call(n, r) && (e[r] = n[r])
                    }
                    return e
                }, u.apply(this, arguments)
            }

            function f(e, t) {
                if (null == e) return {};
                var n, r, o = {},
                    i = Object.keys(e);
                for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                return o
            }

            function p(e, t) {
                if (null == e) return {};
                var n, r, o = f(e, t);
                if (Object.getOwnPropertySymbols) {
                    var i = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < i.length; r++) n = i[r], t.indexOf(n) >= 0 || Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                }
                return o
            }

            function d(e) {
                return d = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(e) {
                    return typeof e
                } : function(e) {
                    return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e
                }, d(e)
            }

            function y(e) {
                var t, n, r = "";
                if ("string" == typeof e || "number" == typeof e) r += e;
                else if ("object" == d(e))
                    if (Array.isArray(e))
                        for (t = 0; t < e.length; t++) e[t] && (n = y(e[t])) && (r && (r += " "), r += n);
                    else
                        for (t in e) e[t] && (r && (r += " "), r += t);
                return r
            }
            var h = function() {
                    for (var e, t, n = 0, r = ""; n < arguments.length;)(e = arguments[n++]) && (t = y(e)) && (r && (r += " "), r += t);
                    return r
                },
                m = n(8659),
                g = n.n(m),
                v = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(e) {
                    return typeof e
                } : function(e) {
                    return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e
                },
                b = "object" === ("undefined" == typeof window ? "undefined" : v(window)) && "object" === ("undefined" == typeof document ? "undefined" : v(document)) && 9 === document.nodeType;

            function x(e, t) {
                for (var n = 0; n < t.length; n++) {
                    var r = t[n];
                    r.enumerable = r.enumerable || !1, r.configurable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, r.key, r)
                }
            }

            function S(e, t, n) {
                return t && x(e.prototype, t), n && x(e, n), e
            }

            function w(e, t) {
                e.prototype = Object.create(t.prototype), e.prototype.constructor = e, e.__proto__ = t
            }

            function P(e) {
                if (void 0 === e) throw new ReferenceError("this hasn't been initialised - super() hasn't been called");
                return e
            }
            var E = {}.constructor;

            function A(e) {
                if (null == e || "object" != typeof e) return e;
                if (Array.isArray(e)) return e.map(A);
                if (e.constructor !== E) return e;
                var t = {};
                for (var n in e) t[n] = A(e[n]);
                return t
            }

            function O(e, t, n) {
                void 0 === e && (e = "unnamed");
                var r = n.jss,
                    o = A(t),
                    i = r.plugins.onCreateRule(e, o, n);
                return i || (e[0], null)
            }
            var k = function(e, t) {
                    for (var n = "", r = 0; r < e.length && "!important" !== e[r]; r++) n && (n += t), n += e[r];
                    return n
                },
                C = function(e) {
                    if (!Array.isArray(e)) return e;
                    var t = "";
                    if (Array.isArray(e[0]))
                        for (var n = 0; n < e.length && "!important" !== e[n]; n++) t && (t += ", "), t += k(e[n], " ");
                    else t = k(e, ", ");
                    return "!important" === e[e.length - 1] && (t += " !important"), t
                };

            function R(e) {
                return e && !1 === e.format ? {
                    linebreak: "",
                    space: ""
                } : {
                    linebreak: "\n",
                    space: " "
                }
            }

            function j(e, t) {
                for (var n = "", r = 0; r < t; r++) n += "  ";
                return n + e
            }

            function I(e, t, n) {
                void 0 === n && (n = {});
                var r = "";
                if (!t) return r;
                var o = n.indent,
                    i = void 0 === o ? 0 : o,
                    a = t.fallbacks;
                !1 === n.format && (i = -1 / 0);
                var s = R(n),
                    c = s.linebreak,
                    l = s.space;
                if (e && i++, a)
                    if (Array.isArray(a))
                        for (var u = 0; u < a.length; u++) {
                            var f = a[u];
                            for (var p in f) {
                                var d = f[p];
                                null != d && (r && (r += c), r += j(p + ":" + l + C(d) + ";", i))
                            }
                        } else
                            for (var y in a) {
                                var h = a[y];
                                null != h && (r && (r += c), r += j(y + ":" + l + C(h) + ";", i))
                            }
                for (var m in t) {
                    var g = t[m];
                    null != g && "fallbacks" !== m && (r && (r += c), r += j(m + ":" + l + C(g) + ";", i))
                }
                return (r || n.allowEmpty) && e ? (r && (r = "" + c + r + c), j("" + e + l + "{" + r, --i) + j("}", i)) : r
            }
            var T = /([[\].#*$><+~=|^:(),"'`\s])/g,
                N = "undefined" != typeof CSS && CSS.escape,
                M = function(e) {
                    return N ? N(e) : e.replace(T, "\\$1")
                },
                _ = function() {
                    function e(e, t, n) {
                        this.type = "style", this.isProcessed = !1;
                        var r = n.sheet,
                            o = n.Renderer;
                        this.key = e, this.options = n, this.style = t, r ? this.renderer = r.renderer : o && (this.renderer = new o)
                    }
                    return e.prototype.prop = function(e, t, n) {
                        if (void 0 === t) return this.style[e];
                        var r = !!n && n.force;
                        if (!r && this.style[e] === t) return this;
                        var o = t;
                        n && !1 === n.process || (o = this.options.jss.plugins.onChangeValue(t, e, this));
                        var i = null == o || !1 === o,
                            a = e in this.style;
                        if (i && !a && !r) return this;
                        var s = i && a;
                        if (s ? delete this.style[e] : this.style[e] = o, this.renderable && this.renderer) return s ? this.renderer.removeProperty(this.renderable, e) : this.renderer.setProperty(this.renderable, e, o), this;
                        var c = this.options.sheet;
                        return c && c.attached, this
                    }, e
                }(),
                D = function(e) {
                    function t(t, n, r) {
                        var o;
                        o = e.call(this, t, n, r) || this;
                        var i = r.selector,
                            a = r.scoped,
                            s = r.sheet,
                            c = r.generateId;
                        return i ? o.selectorText = i : !1 !== a && (o.id = c(P(P(o)), s), o.selectorText = "." + M(o.id)), o
                    }
                    w(t, e);
                    var n = t.prototype;
                    return n.applyTo = function(e) {
                        var t = this.renderer;
                        if (t) {
                            var n = this.toJSON();
                            for (var r in n) t.setProperty(e, r, n[r])
                        }
                        return this
                    }, n.toJSON = function() {
                        var e = {};
                        for (var t in this.style) {
                            var n = this.style[t];
                            "object" != typeof n ? e[t] = n : Array.isArray(n) && (e[t] = C(n))
                        }
                        return e
                    }, n.toString = function(e) {
                        var t = this.options.sheet,
                            n = !!t && t.options.link ? u({}, e, {
                                allowEmpty: !0
                            }) : e;
                        return I(this.selectorText, this.style, n)
                    }, S(t, [{
                        key: "selector",
                        set: function(e) {
                            if (e !== this.selectorText) {
                                this.selectorText = e;
                                var t = this.renderer,
                                    n = this.renderable;
                                if (n && t) t.setSelector(n, e) || t.replaceRule(n, this)
                            }
                        },
                        get: function() {
                            return this.selectorText
                        }
                    }]), t
                }(_),
                U = {
                    onCreateRule: function(e, t, n) {
                        return "@" === e[0] || n.parent && "keyframes" === n.parent.type ? null : new D(e, t, n)
                    }
                },
                L = {
                    indent: 1,
                    children: !0
                },
                F = /@([\w-]+)/,
                B = function() {
                    function e(e, t, n) {
                        this.type = "conditional", this.isProcessed = !1, this.key = e;
                        var r = e.match(F);
                        for (var o in this.at = r ? r[1] : "unknown", this.query = n.name || "@" + this.at, this.options = n, this.rules = new ue(u({}, n, {
                                parent: this
                            })), t) this.rules.add(o, t[o]);
                        this.rules.process()
                    }
                    var t = e.prototype;
                    return t.getRule = function(e) {
                        return this.rules.get(e)
                    }, t.indexOf = function(e) {
                        return this.rules.indexOf(e)
                    }, t.addRule = function(e, t, n) {
                        var r = this.rules.add(e, t, n);
                        return r ? (this.options.jss.plugins.onProcessRule(r), r) : null
                    }, t.replaceRule = function(e, t, n) {
                        var r = this.rules.replace(e, t, n);
                        return r && this.options.jss.plugins.onProcessRule(r), r
                    }, t.toString = function(e) {
                        void 0 === e && (e = L);
                        var t = R(e).linebreak;
                        if (null == e.indent && (e.indent = L.indent), null == e.children && (e.children = L.children), !1 === e.children) return this.query + " {}";
                        var n = this.rules.toString(e);
                        return n ? this.query + " {" + t + n + t + "}" : ""
                    }, e
                }(),
                q = /@container|@media|@supports\s+/,
                V = {
                    onCreateRule: function(e, t, n) {
                        return q.test(e) ? new B(e, t, n) : null
                    }
                },
                W = {
                    indent: 1,
                    children: !0
                },
                H = /@keyframes\s+([\w-]+)/,
                K = function() {
                    function e(e, t, n) {
                        this.type = "keyframes", this.at = "@keyframes", this.isProcessed = !1;
                        var r = e.match(H);
                        r && r[1] ? this.name = r[1] : this.name = "noname", this.key = this.type + "-" + this.name, this.options = n;
                        var o = n.scoped,
                            i = n.sheet,
                            a = n.generateId;
                        for (var s in this.id = !1 === o ? this.name : M(a(this, i)), this.rules = new ue(u({}, n, {
                                parent: this
                            })), t) this.rules.add(s, t[s], u({}, n, {
                            parent: this
                        }));
                        this.rules.process()
                    }
                    return e.prototype.toString = function(e) {
                        void 0 === e && (e = W);
                        var t = R(e).linebreak;
                        if (null == e.indent && (e.indent = W.indent), null == e.children && (e.children = W.children), !1 === e.children) return this.at + " " + this.id + " {}";
                        var n = this.rules.toString(e);
                        return n && (n = "" + t + n + t), this.at + " " + this.id + " {" + n + "}"
                    }, e
                }(),
                $ = /@keyframes\s+/,
                z = /\$([\w-]+)/g,
                G = function(e, t) {
                    return "string" == typeof e ? e.replace(z, (function(e, n) {
                        return n in t ? t[n] : e
                    })) : e
                },
                J = function(e, t, n) {
                    var r = e[t],
                        o = G(r, n);
                    o !== r && (e[t] = o)
                },
                Y = {
                    onCreateRule: function(e, t, n) {
                        return "string" == typeof e && $.test(e) ? new K(e, t, n) : null
                    },
                    onProcessStyle: function(e, t, n) {
                        return "style" === t.type && n ? ("animation-name" in e && J(e, "animation-name", n.keyframes), "animation" in e && J(e, "animation", n.keyframes), e) : e
                    },
                    onChangeValue: function(e, t, n) {
                        var r = n.options.sheet;
                        if (!r) return e;
                        switch (t) {
                            case "animation":
                            case "animation-name":
                                return G(e, r.keyframes);
                            default:
                                return e
                        }
                    }
                },
                Z = function(e) {
                    function t() {
                        return e.apply(this, arguments) || this
                    }
                    return w(t, e), t.prototype.toString = function(e) {
                        var t = this.options.sheet,
                            n = !!t && t.options.link ? u({}, e, {
                                allowEmpty: !0
                            }) : e;
                        return I(this.key, this.style, n)
                    }, t
                }(_),
                Q = {
                    onCreateRule: function(e, t, n) {
                        return n.parent && "keyframes" === n.parent.type ? new Z(e, t, n) : null
                    }
                },
                X = function() {
                    function e(e, t, n) {
                        this.type = "font-face", this.at = "@font-face", this.isProcessed = !1, this.key = e, this.style = t, this.options = n
                    }
                    return e.prototype.toString = function(e) {
                        var t = R(e).linebreak;
                        if (Array.isArray(this.style)) {
                            for (var n = "", r = 0; r < this.style.length; r++) n += I(this.at, this.style[r]), this.style[r + 1] && (n += t);
                            return n
                        }
                        return I(this.at, this.style, e)
                    }, e
                }(),
                ee = /@font-face/,
                te = {
                    onCreateRule: function(e, t, n) {
                        return ee.test(e) ? new X(e, t, n) : null
                    }
                },
                ne = function() {
                    function e(e, t, n) {
                        this.type = "viewport", this.at = "@viewport", this.isProcessed = !1, this.key = e, this.style = t, this.options = n
                    }
                    return e.prototype.toString = function(e) {
                        return I(this.key, this.style, e)
                    }, e
                }(),
                re = {
                    onCreateRule: function(e, t, n) {
                        return "@viewport" === e || "@-ms-viewport" === e ? new ne(e, t, n) : null
                    }
                },
                oe = function() {
                    function e(e, t, n) {
                        this.type = "simple", this.isProcessed = !1, this.key = e, this.value = t, this.options = n
                    }
                    return e.prototype.toString = function(e) {
                        if (Array.isArray(this.value)) {
                            for (var t = "", n = 0; n < this.value.length; n++) t += this.key + " " + this.value[n] + ";", this.value[n + 1] && (t += "\n");
                            return t
                        }
                        return this.key + " " + this.value + ";"
                    }, e
                }(),
                ie = {
                    "@charset": !0,
                    "@import": !0,
                    "@namespace": !0
                },
                ae = {
                    onCreateRule: function(e, t, n) {
                        return e in ie ? new oe(e, t, n) : null
                    }
                },
                se = [U, V, Y, Q, te, re, ae],
                ce = {
                    process: !0
                },
                le = {
                    force: !0,
                    process: !0
                },
                ue = function() {
                    function e(e) {
                        this.map = {}, this.raw = {}, this.index = [], this.counter = 0, this.options = e, this.classes = e.classes, this.keyframes = e.keyframes
                    }
                    var t = e.prototype;
                    return t.add = function(e, t, n) {
                        var r = this.options,
                            o = r.parent,
                            i = r.sheet,
                            a = r.jss,
                            s = r.Renderer,
                            c = r.generateId,
                            l = r.scoped,
                            f = u({
                                classes: this.classes,
                                parent: o,
                                sheet: i,
                                jss: a,
                                Renderer: s,
                                generateId: c,
                                scoped: l,
                                name: e,
                                keyframes: this.keyframes,
                                selector: void 0
                            }, n),
                            p = e;
                        e in this.raw && (p = e + "-d" + this.counter++), this.raw[p] = t, p in this.classes && (f.selector = "." + M(this.classes[p]));
                        var d = O(p, t, f);
                        if (!d) return null;
                        this.register(d);
                        var y = void 0 === f.index ? this.index.length : f.index;
                        return this.index.splice(y, 0, d), d
                    }, t.replace = function(e, t, n) {
                        var r = this.get(e),
                            o = this.index.indexOf(r);
                        r && this.remove(r);
                        var i = n;
                        return -1 !== o && (i = u({}, n, {
                            index: o
                        })), this.add(e, t, i)
                    }, t.get = function(e) {
                        return this.map[e]
                    }, t.remove = function(e) {
                        this.unregister(e), delete this.raw[e.key], this.index.splice(this.index.indexOf(e), 1)
                    }, t.indexOf = function(e) {
                        return this.index.indexOf(e)
                    }, t.process = function() {
                        var e = this.options.jss.plugins;
                        this.index.slice(0).forEach(e.onProcessRule, e)
                    }, t.register = function(e) {
                        this.map[e.key] = e, e instanceof D ? (this.map[e.selector] = e, e.id && (this.classes[e.key] = e.id)) : e instanceof K && this.keyframes && (this.keyframes[e.name] = e.id)
                    }, t.unregister = function(e) {
                        delete this.map[e.key], e instanceof D ? (delete this.map[e.selector], delete this.classes[e.key]) : e instanceof K && delete this.keyframes[e.name]
                    }, t.update = function() {
                        var e, t, n;
                        if ("string" == typeof(arguments.length <= 0 ? void 0 : arguments[0]) ? (e = arguments.length <= 0 ? void 0 : arguments[0], t = arguments.length <= 1 ? void 0 : arguments[1], n = arguments.length <= 2 ? void 0 : arguments[2]) : (t = arguments.length <= 0 ? void 0 : arguments[0], n = arguments.length <= 1 ? void 0 : arguments[1], e = null), e) this.updateOne(this.get(e), t, n);
                        else
                            for (var r = 0; r < this.index.length; r++) this.updateOne(this.index[r], t, n)
                    }, t.updateOne = function(t, n, r) {
                        void 0 === r && (r = ce);
                        var o = this.options,
                            i = o.jss.plugins,
                            a = o.sheet;
                        if (t.rules instanceof e) t.rules.update(n, r);
                        else {
                            var s = t.style;
                            if (i.onUpdate(n, t, a, r), r.process && s && s !== t.style) {
                                for (var c in i.onProcessStyle(t.style, t, a), t.style) {
                                    var l = t.style[c];
                                    l !== s[c] && t.prop(c, l, le)
                                }
                                for (var u in s) {
                                    var f = t.style[u],
                                        p = s[u];
                                    null == f && f !== p && t.prop(u, null, le)
                                }
                            }
                        }
                    }, t.toString = function(e) {
                        for (var t = "", n = this.options.sheet, r = !!n && n.options.link, o = R(e).linebreak, i = 0; i < this.index.length; i++) {
                            var a = this.index[i].toString(e);
                            (a || r) && (t && (t += o), t += a)
                        }
                        return t
                    }, e
                }(),
                fe = function() {
                    function e(e, t) {
                        for (var n in this.attached = !1, this.deployed = !1, this.classes = {}, this.keyframes = {}, this.options = u({}, t, {
                                sheet: this,
                                parent: this,
                                classes: this.classes,
                                keyframes: this.keyframes
                            }), t.Renderer && (this.renderer = new t.Renderer(this)), this.rules = new ue(this.options), e) this.rules.add(n, e[n]);
                        this.rules.process()
                    }
                    var t = e.prototype;
                    return t.attach = function() {
                        return this.attached || (this.renderer && this.renderer.attach(), this.attached = !0, this.deployed || this.deploy()), this
                    }, t.detach = function() {
                        return this.attached ? (this.renderer && this.renderer.detach(), this.attached = !1, this) : this
                    }, t.addRule = function(e, t, n) {
                        var r = this.queue;
                        this.attached && !r && (this.queue = []);
                        var o = this.rules.add(e, t, n);
                        return o ? (this.options.jss.plugins.onProcessRule(o), this.attached ? this.deployed ? (r ? r.push(o) : (this.insertRule(o), this.queue && (this.queue.forEach(this.insertRule, this), this.queue = void 0)), o) : o : (this.deployed = !1, o)) : null
                    }, t.replaceRule = function(e, t, n) {
                        var r = this.rules.get(e);
                        if (!r) return this.addRule(e, t, n);
                        var o = this.rules.replace(e, t, n);
                        return o && this.options.jss.plugins.onProcessRule(o), this.attached ? this.deployed ? (this.renderer && (o ? r.renderable && this.renderer.replaceRule(r.renderable, o) : this.renderer.deleteRule(r)), o) : o : (this.deployed = !1, o)
                    }, t.insertRule = function(e) {
                        this.renderer && this.renderer.insertRule(e)
                    }, t.addRules = function(e, t) {
                        var n = [];
                        for (var r in e) {
                            var o = this.addRule(r, e[r], t);
                            o && n.push(o)
                        }
                        return n
                    }, t.getRule = function(e) {
                        return this.rules.get(e)
                    }, t.deleteRule = function(e) {
                        var t = "object" == typeof e ? e : this.rules.get(e);
                        return !(!t || this.attached && !t.renderable) && (this.rules.remove(t), !(this.attached && t.renderable && this.renderer) || this.renderer.deleteRule(t.renderable))
                    }, t.indexOf = function(e) {
                        return this.rules.indexOf(e)
                    }, t.deploy = function() {
                        return this.renderer && this.renderer.deploy(), this.deployed = !0, this
                    }, t.update = function() {
                        var e;
                        return (e = this.rules).update.apply(e, arguments), this
                    }, t.updateOne = function(e, t, n) {
                        return this.rules.updateOne(e, t, n), this
                    }, t.toString = function(e) {
                        return this.rules.toString(e)
                    }, e
                }(),
                pe = function() {
                    function e() {
                        this.plugins = {
                            internal: [],
                            external: []
                        }, this.registry = {}
                    }
                    var t = e.prototype;
                    return t.onCreateRule = function(e, t, n) {
                        for (var r = 0; r < this.registry.onCreateRule.length; r++) {
                            var o = this.registry.onCreateRule[r](e, t, n);
                            if (o) return o
                        }
                        return null
                    }, t.onProcessRule = function(e) {
                        if (!e.isProcessed) {
                            for (var t = e.options.sheet, n = 0; n < this.registry.onProcessRule.length; n++) this.registry.onProcessRule[n](e, t);
                            e.style && this.onProcessStyle(e.style, e, t), e.isProcessed = !0
                        }
                    }, t.onProcessStyle = function(e, t, n) {
                        for (var r = 0; r < this.registry.onProcessStyle.length; r++) t.style = this.registry.onProcessStyle[r](t.style, t, n)
                    }, t.onProcessSheet = function(e) {
                        for (var t = 0; t < this.registry.onProcessSheet.length; t++) this.registry.onProcessSheet[t](e)
                    }, t.onUpdate = function(e, t, n, r) {
                        for (var o = 0; o < this.registry.onUpdate.length; o++) this.registry.onUpdate[o](e, t, n, r)
                    }, t.onChangeValue = function(e, t, n) {
                        for (var r = e, o = 0; o < this.registry.onChangeValue.length; o++) r = this.registry.onChangeValue[o](r, t, n);
                        return r
                    }, t.use = function(e, t) {
                        void 0 === t && (t = {
                            queue: "external"
                        });
                        var n = this.plugins[t.queue]; - 1 === n.indexOf(e) && (n.push(e), this.registry = [].concat(this.plugins.external, this.plugins.internal).reduce((function(e, t) {
                            for (var n in t) n in e && e[n].push(t[n]);
                            return e
                        }), {
                            onCreateRule: [],
                            onProcessRule: [],
                            onProcessStyle: [],
                            onProcessSheet: [],
                            onChangeValue: [],
                            onUpdate: []
                        }))
                    }, e
                }(),
                de = function() {
                    function e() {
                        this.registry = []
                    }
                    var t = e.prototype;
                    return t.add = function(e) {
                        var t = this.registry,
                            n = e.options.index;
                        if (-1 === t.indexOf(e))
                            if (0 === t.length || n >= this.index) t.push(e);
                            else
                                for (var r = 0; r < t.length; r++)
                                    if (t[r].options.index > n) return void t.splice(r, 0, e)
                    }, t.reset = function() {
                        this.registry = []
                    }, t.remove = function(e) {
                        var t = this.registry.indexOf(e);
                        this.registry.splice(t, 1)
                    }, t.toString = function(e) {
                        for (var t = void 0 === e ? {} : e, n = t.attached, r = f(t, ["attached"]), o = R(r).linebreak, i = "", a = 0; a < this.registry.length; a++) {
                            var s = this.registry[a];
                            null != n && s.attached !== n || (i && (i += o), i += s.toString(r))
                        }
                        return i
                    }, S(e, [{
                        key: "index",
                        get: function() {
                            return 0 === this.registry.length ? 0 : this.registry[this.registry.length - 1].options.index
                        }
                    }]), e
                }(),
                ye = new de,
                he = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof window && window.Math === Math ? window : "undefined" != typeof self && self.Math === Math ? self : Function("return this")(),
                me = "2f1acc6c3a606b082e5eef5e54414ffb";
            null == he[me] && (he[me] = 0);
            var ge = he[me]++,
                ve = function(e) {
                    void 0 === e && (e = {});
                    var t = 0;
                    return function(n, r) {
                        t += 1;
                        var o = "",
                            i = "";
                        return r && (r.options.classNamePrefix && (i = r.options.classNamePrefix), null != r.options.jss.id && (o = String(r.options.jss.id))), e.minify ? "" + (i || "c") + ge + o + t : i + n.key + "-" + ge + (o ? "-" + o : "") + "-" + t
                    }
                },
                be = function(e) {
                    var t;
                    return function() {
                        return t || (t = e()), t
                    }
                },
                xe = function(e, t) {
                    try {
                        return e.attributeStyleMap ? e.attributeStyleMap.get(t) : e.style.getPropertyValue(t)
                    } catch (e) {
                        return ""
                    }
                },
                Se = function(e, t, n) {
                    try {
                        var r = n;
                        if (Array.isArray(n) && (r = C(n)), e.attributeStyleMap) e.attributeStyleMap.set(t, r);
                        else {
                            var o = r ? r.indexOf("!important") : -1,
                                i = o > -1 ? r.substr(0, o - 1) : r;
                            e.style.setProperty(t, i, o > -1 ? "important" : "")
                        }
                    } catch (e) {
                        return !1
                    }
                    return !0
                },
                we = function(e, t) {
                    try {
                        e.attributeStyleMap ? e.attributeStyleMap.delete(t) : e.style.removeProperty(t)
                    } catch (e) {}
                },
                Pe = function(e, t) {
                    return e.selectorText = t, e.selectorText === t
                },
                Ee = be((function() {
                    return document.querySelector("head")
                }));

            function Ae(e) {
                var t = ye.registry;
                if (t.length > 0) {
                    var n = function(e, t) {
                        for (var n = 0; n < e.length; n++) {
                            var r = e[n];
                            if (r.attached && r.options.index > t.index && r.options.insertionPoint === t.insertionPoint) return r
                        }
                        return null
                    }(t, e);
                    if (n && n.renderer) return {
                        parent: n.renderer.element.parentNode,
                        node: n.renderer.element
                    };
                    if (n = function(e, t) {
                            for (var n = e.length - 1; n >= 0; n--) {
                                var r = e[n];
                                if (r.attached && r.options.insertionPoint === t.insertionPoint) return r
                            }
                            return null
                        }(t, e), n && n.renderer) return {
                        parent: n.renderer.element.parentNode,
                        node: n.renderer.element.nextSibling
                    }
                }
                var r = e.insertionPoint;
                if (r && "string" == typeof r) {
                    var o = function(e) {
                        for (var t = Ee(), n = 0; n < t.childNodes.length; n++) {
                            var r = t.childNodes[n];
                            if (8 === r.nodeType && r.nodeValue.trim() === e) return r
                        }
                        return null
                    }(r);
                    if (o) return {
                        parent: o.parentNode,
                        node: o.nextSibling
                    }
                }
                return !1
            }
            var Oe = be((function() {
                    var e = document.querySelector('meta[property="csp-nonce"]');
                    return e ? e.getAttribute("content") : null
                })),
                ke = function(e, t, n) {
                    try {
                        "insertRule" in e ? e.insertRule(t, n) : "appendRule" in e && e.appendRule(t)
                    } catch (e) {
                        return !1
                    }
                    return e.cssRules[n]
                },
                Ce = function(e, t) {
                    var n = e.cssRules.length;
                    return void 0 === t || t > n ? n : t
                },
                Re = function() {
                    function e(e) {
                        this.getPropertyValue = xe, this.setProperty = Se, this.removeProperty = we, this.setSelector = Pe, this.hasInsertedRules = !1, this.cssRules = [], e && ye.add(e), this.sheet = e;
                        var t = this.sheet ? this.sheet.options : {},
                            n = t.media,
                            r = t.meta,
                            o = t.element;
                        this.element = o || function() {
                            var e = document.createElement("style");
                            return e.textContent = "\n", e
                        }(), this.element.setAttribute("data-jss", ""), n && this.element.setAttribute("media", n), r && this.element.setAttribute("data-meta", r);
                        var i = Oe();
                        i && this.element.setAttribute("nonce", i)
                    }
                    var t = e.prototype;
                    return t.attach = function() {
                        if (!this.element.parentNode && this.sheet) {
                            ! function(e, t) {
                                var n = t.insertionPoint,
                                    r = Ae(t);
                                if (!1 !== r && r.parent) r.parent.insertBefore(e, r.node);
                                else if (n && "number" == typeof n.nodeType) {
                                    var o = n,
                                        i = o.parentNode;
                                    i && i.insertBefore(e, o.nextSibling)
                                } else Ee().appendChild(e)
                            }(this.element, this.sheet.options);
                            var e = Boolean(this.sheet && this.sheet.deployed);
                            this.hasInsertedRules && e && (this.hasInsertedRules = !1, this.deploy())
                        }
                    }, t.detach = function() {
                        if (this.sheet) {
                            var e = this.element.parentNode;
                            e && e.removeChild(this.element), this.sheet.options.link && (this.cssRules = [], this.element.textContent = "\n")
                        }
                    }, t.deploy = function() {
                        var e = this.sheet;
                        e && (e.options.link ? this.insertRules(e.rules) : this.element.textContent = "\n" + e.toString() + "\n")
                    }, t.insertRules = function(e, t) {
                        for (var n = 0; n < e.index.length; n++) this.insertRule(e.index[n], n, t)
                    }, t.insertRule = function(e, t, n) {
                        if (void 0 === n && (n = this.element.sheet), e.rules) {
                            var r = e,
                                o = n;
                            if ("conditional" === e.type || "keyframes" === e.type) {
                                var i = Ce(n, t);
                                if (!1 === (o = ke(n, r.toString({
                                        children: !1
                                    }), i))) return !1;
                                this.refCssRule(e, i, o)
                            }
                            return this.insertRules(r.rules, o), o
                        }
                        var a = e.toString();
                        if (!a) return !1;
                        var s = Ce(n, t),
                            c = ke(n, a, s);
                        return !1 !== c && (this.hasInsertedRules = !0, this.refCssRule(e, s, c), c)
                    }, t.refCssRule = function(e, t, n) {
                        e.renderable = n, e.options.parent instanceof fe && this.cssRules.splice(t, 0, n)
                    }, t.deleteRule = function(e) {
                        var t = this.element.sheet,
                            n = this.indexOf(e);
                        return -1 !== n && (t.deleteRule(n), this.cssRules.splice(n, 1), !0)
                    }, t.indexOf = function(e) {
                        return this.cssRules.indexOf(e)
                    }, t.replaceRule = function(e, t) {
                        var n = this.indexOf(e);
                        return -1 !== n && (this.element.sheet.deleteRule(n), this.cssRules.splice(n, 1), this.insertRule(t, n))
                    }, t.getRules = function() {
                        return this.element.sheet.cssRules
                    }, e
                }(),
                je = 0,
                Ie = function() {
                    function e(e) {
                        this.id = je++, this.version = "10.10.0", this.plugins = new pe, this.options = {
                            id: {
                                minify: !1
                            },
                            createGenerateId: ve,
                            Renderer: b ? Re : null,
                            plugins: []
                        }, this.generateId = ve({
                            minify: !1
                        });
                        for (var t = 0; t < se.length; t++) this.plugins.use(se[t], {
                            queue: "internal"
                        });
                        this.setup(e)
                    }
                    var t = e.prototype;
                    return t.setup = function(e) {
                        return void 0 === e && (e = {}), e.createGenerateId && (this.options.createGenerateId = e.createGenerateId), e.id && (this.options.id = u({}, this.options.id, e.id)), (e.createGenerateId || e.id) && (this.generateId = this.options.createGenerateId(this.options.id)), null != e.insertionPoint && (this.options.insertionPoint = e.insertionPoint), "Renderer" in e && (this.options.Renderer = e.Renderer), e.plugins && this.use.apply(this, e.plugins), this
                    }, t.createStyleSheet = function(e, t) {
                        void 0 === t && (t = {});
                        var n = t.index;
                        "number" != typeof n && (n = 0 === ye.index ? 0 : ye.index + 1);
                        var r = new fe(e, u({}, t, {
                            jss: this,
                            generateId: t.generateId || this.generateId,
                            insertionPoint: this.options.insertionPoint,
                            Renderer: this.options.Renderer,
                            index: n
                        }));
                        return this.plugins.onProcessSheet(r), r
                    }, t.removeStyleSheet = function(e) {
                        return e.detach(), ye.remove(e), this
                    }, t.createRule = function(e, t, n) {
                        if (void 0 === t && (t = {}), void 0 === n && (n = {}), "object" == typeof e) return this.createRule(void 0, e, t);
                        var r = u({}, n, {
                            name: e,
                            jss: this,
                            Renderer: this.options.Renderer
                        });
                        r.generateId || (r.generateId = this.generateId), r.classes || (r.classes = {}), r.keyframes || (r.keyframes = {});
                        var o = O(e, t, r);
                        return o && this.plugins.onProcessRule(o), o
                    }, t.use = function() {
                        for (var e = this, t = arguments.length, n = new Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                        return n.forEach((function(t) {
                            e.plugins.use(t)
                        })), this
                    }, e
                }(),
                Te = function(e) {
                    return new Ie(e)
                },
                Ne = "object" == typeof CSS && null != CSS && "number" in CSS;

            function Me(e) {
                var t = null;
                for (var n in e) {
                    var r = e[n],
                        o = typeof r;
                    if ("function" === o) t || (t = {}), t[n] = r;
                    else if ("object" === o && null !== r && !Array.isArray(r)) {
                        var i = Me(r);
                        i && (t || (t = {}), t[n] = i)
                    }
                }
                return t
            }
            Te();

            function _e() {
                var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                    t = e.baseClasses,
                    n = e.newClasses;
                e.Component;
                if (!n) return t;
                var r = u({}, t);
                return Object.keys(n).forEach((function(e) {
                    n[e] && (r[e] = "".concat(t[e], " ").concat(n[e]))
                })), r
            }
            var De = {
                    set: function(e, t, n, r) {
                        var o = e.get(t);
                        o || (o = new Map, e.set(t, o)), o.set(n, r)
                    },
                    get: function(e, t, n) {
                        var r = e.get(t);
                        return r ? r.get(n) : void 0
                    },
                    delete: function(e, t, n) {
                        e.get(t).delete(n)
                    }
                },
                Ue = De;
            var Le = r().createContext(null);

            function Fe() {
                return r().useContext(Le)
            }
            var Be = "function" == typeof Symbol && Symbol.for ? Symbol.for("mui.nested") : "__THEME_NESTED__",
                qe = ["checked", "disabled", "error", "focused", "focusVisible", "required", "expanded", "selected"];
            var Ve = Date.now(),
                We = "fnValues" + Ve,
                He = "fnStyle" + ++Ve,
                Ke = function() {
                    return {
                        onCreateRule: function(e, t, n) {
                            if ("function" != typeof t) return null;
                            var r = O(e, {}, n);
                            return r[He] = t, r
                        },
                        onProcessStyle: function(e, t) {
                            if (We in t || He in t) return e;
                            var n = {};
                            for (var r in e) {
                                var o = e[r];
                                "function" == typeof o && (delete e[r], n[r] = o)
                            }
                            return t[We] = n, e
                        },
                        onUpdate: function(e, t, n, r) {
                            var o = t,
                                i = o[He];
                            i && (o.style = i(e) || {});
                            var a = o[We];
                            if (a)
                                for (var s in a) o.prop(s, a[s](e), r)
                        }
                    }
                },
                $e = "@global",
                ze = "@global ",
                Ge = function() {
                    function e(e, t, n) {
                        for (var r in this.type = "global", this.at = $e, this.isProcessed = !1, this.key = e, this.options = n, this.rules = new ue(u({}, n, {
                                parent: this
                            })), t) this.rules.add(r, t[r]);
                        this.rules.process()
                    }
                    var t = e.prototype;
                    return t.getRule = function(e) {
                        return this.rules.get(e)
                    }, t.addRule = function(e, t, n) {
                        var r = this.rules.add(e, t, n);
                        return r && this.options.jss.plugins.onProcessRule(r), r
                    }, t.replaceRule = function(e, t, n) {
                        var r = this.rules.replace(e, t, n);
                        return r && this.options.jss.plugins.onProcessRule(r), r
                    }, t.indexOf = function(e) {
                        return this.rules.indexOf(e)
                    }, t.toString = function(e) {
                        return this.rules.toString(e)
                    }, e
                }(),
                Je = function() {
                    function e(e, t, n) {
                        this.type = "global", this.at = $e, this.isProcessed = !1, this.key = e, this.options = n;
                        var r = e.substr(8);
                        this.rule = n.jss.createRule(r, t, u({}, n, {
                            parent: this
                        }))
                    }
                    return e.prototype.toString = function(e) {
                        return this.rule ? this.rule.toString(e) : ""
                    }, e
                }(),
                Ye = /\s*,\s*/g;

            function Ze(e, t) {
                for (var n = e.split(Ye), r = "", o = 0; o < n.length; o++) r += t + " " + n[o].trim(), n[o + 1] && (r += ", ");
                return r
            }
            var Qe = function() {
                    return {
                        onCreateRule: function(e, t, n) {
                            if (!e) return null;
                            if (e === $e) return new Ge(e, t, n);
                            if ("@" === e[0] && e.substr(0, 8) === ze) return new Je(e, t, n);
                            var r = n.parent;
                            return r && ("global" === r.type || r.options.parent && "global" === r.options.parent.type) && (n.scoped = !1), n.selector || !1 !== n.scoped || (n.selector = e), null
                        },
                        onProcessRule: function(e, t) {
                            "style" === e.type && t && (function(e, t) {
                                var n = e.options,
                                    r = e.style,
                                    o = r ? r[$e] : null;
                                if (o) {
                                    for (var i in o) t.addRule(i, o[i], u({}, n, {
                                        selector: Ze(i, e.selector)
                                    }));
                                    delete r[$e]
                                }
                            }(e, t), function(e, t) {
                                var n = e.options,
                                    r = e.style;
                                for (var o in r)
                                    if ("@" === o[0] && o.substr(0, 7) === $e) {
                                        var i = Ze(o.substr(7), e.selector);
                                        t.addRule(i, r[o], u({}, n, {
                                            selector: i
                                        })), delete r[o]
                                    }
                            }(e, t))
                        }
                    }
                },
                Xe = /\s*,\s*/g,
                et = /&/g,
                tt = /\$([\w-]+)/g;
            var nt = function() {
                    function e(e, t) {
                        return function(n, r) {
                            var o = e.getRule(r) || t && t.getRule(r);
                            return o ? o.selector : r
                        }
                    }

                    function t(e, t) {
                        for (var n = t.split(Xe), r = e.split(Xe), o = "", i = 0; i < n.length; i++)
                            for (var a = n[i], s = 0; s < r.length; s++) {
                                var c = r[s];
                                o && (o += ", "), o += -1 !== c.indexOf("&") ? c.replace(et, a) : a + " " + c
                            }
                        return o
                    }

                    function n(e, t, n) {
                        if (n) return u({}, n, {
                            index: n.index + 1
                        });
                        var r = e.options.nestingLevel;
                        r = void 0 === r ? 1 : r + 1;
                        var o = u({}, e.options, {
                            nestingLevel: r,
                            index: t.indexOf(e) + 1
                        });
                        return delete o.name, o
                    }
                    return {
                        onProcessStyle: function(r, o, i) {
                            if ("style" !== o.type) return r;
                            var a, s, c = o,
                                l = c.options.parent;
                            for (var f in r) {
                                var p = -1 !== f.indexOf("&"),
                                    d = "@" === f[0];
                                if (p || d) {
                                    if (a = n(c, l, a), p) {
                                        var y = t(f, c.selector);
                                        s || (s = e(l, i)), y = y.replace(tt, s);
                                        var h = c.key + "-" + f;
                                        "replaceRule" in l ? l.replaceRule(h, r[f], u({}, a, {
                                            selector: y
                                        })) : l.addRule(h, r[f], u({}, a, {
                                            selector: y
                                        }))
                                    } else d && l.addRule(f, {}, a).addRule(c.key, r[f], {
                                        selector: c.selector
                                    });
                                    delete r[f]
                                }
                            }
                            return r
                        }
                    }
                },
                rt = /[A-Z]/g,
                ot = /^ms-/,
                it = {};

            function at(e) {
                return "-" + e.toLowerCase()
            }
            var st = function(e) {
                if (it.hasOwnProperty(e)) return it[e];
                var t = e.replace(rt, at);
                return it[e] = ot.test(t) ? "-" + t : t
            };

            function ct(e) {
                var t = {};
                for (var n in e) {
                    t[0 === n.indexOf("--") ? n : st(n)] = e[n]
                }
                return e.fallbacks && (Array.isArray(e.fallbacks) ? t.fallbacks = e.fallbacks.map(ct) : t.fallbacks = ct(e.fallbacks)), t
            }
            var lt = function() {
                    return {
                        onProcessStyle: function(e) {
                            if (Array.isArray(e)) {
                                for (var t = 0; t < e.length; t++) e[t] = ct(e[t]);
                                return e
                            }
                            return ct(e)
                        },
                        onChangeValue: function(e, t, n) {
                            if (0 === t.indexOf("--")) return e;
                            var r = st(t);
                            return t === r ? e : (n.prop(r, e), null)
                        }
                    }
                },
                ut = Ne && CSS ? CSS.px : "px",
                ft = Ne && CSS ? CSS.ms : "ms",
                pt = Ne && CSS ? CSS.percent : "%";

            function dt(e) {
                var t = /(-[a-z])/g,
                    n = function(e) {
                        return e[1].toUpperCase()
                    },
                    r = {};
                for (var o in e) r[o] = e[o], r[o.replace(t, n)] = e[o];
                return r
            }
            var yt = dt({
                "animation-delay": ft,
                "animation-duration": ft,
                "background-position": ut,
                "background-position-x": ut,
                "background-position-y": ut,
                "background-size": ut,
                border: ut,
                "border-bottom": ut,
                "border-bottom-left-radius": ut,
                "border-bottom-right-radius": ut,
                "border-bottom-width": ut,
                "border-left": ut,
                "border-left-width": ut,
                "border-radius": ut,
                "border-right": ut,
                "border-right-width": ut,
                "border-top": ut,
                "border-top-left-radius": ut,
                "border-top-right-radius": ut,
                "border-top-width": ut,
                "border-width": ut,
                "border-block": ut,
                "border-block-end": ut,
                "border-block-end-width": ut,
                "border-block-start": ut,
                "border-block-start-width": ut,
                "border-block-width": ut,
                "border-inline": ut,
                "border-inline-end": ut,
                "border-inline-end-width": ut,
                "border-inline-start": ut,
                "border-inline-start-width": ut,
                "border-inline-width": ut,
                "border-start-start-radius": ut,
                "border-start-end-radius": ut,
                "border-end-start-radius": ut,
                "border-end-end-radius": ut,
                margin: ut,
                "margin-bottom": ut,
                "margin-left": ut,
                "margin-right": ut,
                "margin-top": ut,
                "margin-block": ut,
                "margin-block-end": ut,
                "margin-block-start": ut,
                "margin-inline": ut,
                "margin-inline-end": ut,
                "margin-inline-start": ut,
                padding: ut,
                "padding-bottom": ut,
                "padding-left": ut,
                "padding-right": ut,
                "padding-top": ut,
                "padding-block": ut,
                "padding-block-end": ut,
                "padding-block-start": ut,
                "padding-inline": ut,
                "padding-inline-end": ut,
                "padding-inline-start": ut,
                "mask-position-x": ut,
                "mask-position-y": ut,
                "mask-size": ut,
                height: ut,
                width: ut,
                "min-height": ut,
                "max-height": ut,
                "min-width": ut,
                "max-width": ut,
                bottom: ut,
                left: ut,
                top: ut,
                right: ut,
                inset: ut,
                "inset-block": ut,
                "inset-block-end": ut,
                "inset-block-start": ut,
                "inset-inline": ut,
                "inset-inline-end": ut,
                "inset-inline-start": ut,
                "box-shadow": ut,
                "text-shadow": ut,
                "column-gap": ut,
                "column-rule": ut,
                "column-rule-width": ut,
                "column-width": ut,
                "font-size": ut,
                "font-size-delta": ut,
                "letter-spacing": ut,
                "text-decoration-thickness": ut,
                "text-indent": ut,
                "text-stroke": ut,
                "text-stroke-width": ut,
                "word-spacing": ut,
                motion: ut,
                "motion-offset": ut,
                outline: ut,
                "outline-offset": ut,
                "outline-width": ut,
                perspective: ut,
                "perspective-origin-x": pt,
                "perspective-origin-y": pt,
                "transform-origin": pt,
                "transform-origin-x": pt,
                "transform-origin-y": pt,
                "transform-origin-z": pt,
                "transition-delay": ft,
                "transition-duration": ft,
                "vertical-align": ut,
                "flex-basis": ut,
                "shape-margin": ut,
                size: ut,
                gap: ut,
                grid: ut,
                "grid-gap": ut,
                "row-gap": ut,
                "grid-row-gap": ut,
                "grid-column-gap": ut,
                "grid-template-rows": ut,
                "grid-template-columns": ut,
                "grid-auto-rows": ut,
                "grid-auto-columns": ut,
                "box-shadow-x": ut,
                "box-shadow-y": ut,
                "box-shadow-blur": ut,
                "box-shadow-spread": ut,
                "font-line-height": ut,
                "text-shadow-x": ut,
                "text-shadow-y": ut,
                "text-shadow-blur": ut
            });

            function ht(e, t, n) {
                if (null == t) return t;
                if (Array.isArray(t))
                    for (var r = 0; r < t.length; r++) t[r] = ht(e, t[r], n);
                else if ("object" == typeof t)
                    if ("fallbacks" === e)
                        for (var o in t) t[o] = ht(o, t[o], n);
                    else
                        for (var i in t) t[i] = ht(e + "-" + i, t[i], n);
                else if ("number" == typeof t && !1 === isNaN(t)) {
                    var a = n[e] || yt[e];
                    return !a || 0 === t && a === ut ? t.toString() : "function" == typeof a ? a(t).toString() : "" + t + a
                }
                return t
            }
            var mt = function(e) {
                void 0 === e && (e = {});
                var t = dt(e);
                return {
                    onProcessStyle: function(e, n) {
                        if ("style" !== n.type) return e;
                        for (var r in e) e[r] = ht(r, e[r], t);
                        return e
                    },
                    onChangeValue: function(e, n) {
                        return ht(n, e, t)
                    }
                }
            };

            function gt(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = new Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function vt(e, t) {
                if (e) {
                    if ("string" == typeof e) return gt(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    return "Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n ? Array.from(e) : "Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n) ? gt(e, t) : void 0
                }
            }

            function bt(e) {
                return function(e) {
                    if (Array.isArray(e)) return gt(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && Symbol.iterator in Object(e)) return Array.from(e)
                }(e) || vt(e) || function() {
                    throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var xt = "",
                St = "",
                wt = "",
                Pt = "",
                Et = b && "ontouchstart" in document.documentElement;
            if (b) {
                var At = {
                        Moz: "-moz-",
                        ms: "-ms-",
                        O: "-o-",
                        Webkit: "-webkit-"
                    },
                    Ot = document.createElement("p").style;
                for (var kt in At)
                    if (kt + "Transform" in Ot) {
                        xt = kt, St = At[kt];
                        break
                    }
                "Webkit" === xt && "msHyphens" in Ot && (xt = "ms", St = At.ms, Pt = "edge"), "Webkit" === xt && "-apple-trailing-word" in Ot && (wt = "apple")
            }
            var Ct = xt,
                Rt = St,
                jt = wt,
                It = Pt,
                Tt = Et;
            var Nt = {
                    noPrefill: ["appearance"],
                    supportedProperty: function(e) {
                        return "appearance" === e && ("ms" === Ct ? "-webkit-" + e : Rt + e)
                    }
                },
                Mt = {
                    noPrefill: ["color-adjust"],
                    supportedProperty: function(e) {
                        return "color-adjust" === e && ("Webkit" === Ct ? Rt + "print-" + e : e)
                    }
                },
                _t = /[-\s]+(.)?/g;

            function Dt(e, t) {
                return t ? t.toUpperCase() : ""
            }

            function Ut(e) {
                return e.replace(_t, Dt)
            }

            function Lt(e) {
                return Ut("-" + e)
            }
            var Ft, Bt = {
                    noPrefill: ["mask"],
                    supportedProperty: function(e, t) {
                        if (!/^mask/.test(e)) return !1;
                        if ("Webkit" === Ct) {
                            var n = "mask-image";
                            if (Ut(n) in t) return e;
                            if (Ct + Lt(n) in t) return Rt + e
                        }
                        return e
                    }
                },
                qt = {
                    noPrefill: ["text-orientation"],
                    supportedProperty: function(e) {
                        return "text-orientation" === e && ("apple" !== jt || Tt ? e : Rt + e)
                    }
                },
                Vt = {
                    noPrefill: ["transform"],
                    supportedProperty: function(e, t, n) {
                        return "transform" === e && (n.transform ? e : Rt + e)
                    }
                },
                Wt = {
                    noPrefill: ["transition"],
                    supportedProperty: function(e, t, n) {
                        return "transition" === e && (n.transition ? e : Rt + e)
                    }
                },
                Ht = {
                    noPrefill: ["writing-mode"],
                    supportedProperty: function(e) {
                        return "writing-mode" === e && ("Webkit" === Ct || "ms" === Ct && "edge" !== It ? Rt + e : e)
                    }
                },
                Kt = {
                    noPrefill: ["user-select"],
                    supportedProperty: function(e) {
                        return "user-select" === e && ("Moz" === Ct || "ms" === Ct || "apple" === jt ? Rt + e : e)
                    }
                },
                $t = {
                    supportedProperty: function(e, t) {
                        return !!/^break-/.test(e) && ("Webkit" === Ct ? "WebkitColumn" + Lt(e) in t && Rt + "column-" + e : "Moz" === Ct && ("page" + Lt(e) in t && "page-" + e))
                    }
                },
                zt = {
                    supportedProperty: function(e, t) {
                        if (!/^(border|margin|padding)-inline/.test(e)) return !1;
                        if ("Moz" === Ct) return e;
                        var n = e.replace("-inline", "");
                        return Ct + Lt(n) in t && Rt + n
                    }
                },
                Gt = {
                    supportedProperty: function(e, t) {
                        return Ut(e) in t && e
                    }
                },
                Jt = {
                    supportedProperty: function(e, t) {
                        var n = Lt(e);
                        return "-" === e[0] || "-" === e[0] && "-" === e[1] ? e : Ct + n in t ? Rt + e : "Webkit" !== Ct && "Webkit" + n in t && "-webkit-" + e
                    }
                },
                Yt = {
                    supportedProperty: function(e) {
                        return "scroll-snap" === e.substring(0, 11) && ("ms" === Ct ? "" + Rt + e : e)
                    }
                },
                Zt = {
                    supportedProperty: function(e) {
                        return "overscroll-behavior" === e && ("ms" === Ct ? Rt + "scroll-chaining" : e)
                    }
                },
                Qt = {
                    "flex-grow": "flex-positive",
                    "flex-shrink": "flex-negative",
                    "flex-basis": "flex-preferred-size",
                    "justify-content": "flex-pack",
                    order: "flex-order",
                    "align-items": "flex-align",
                    "align-content": "flex-line-pack"
                },
                Xt = {
                    supportedProperty: function(e, t) {
                        var n = Qt[e];
                        return !!n && (Ct + Lt(n) in t && Rt + n)
                    }
                },
                en = {
                    flex: "box-flex",
                    "flex-grow": "box-flex",
                    "flex-direction": ["box-orient", "box-direction"],
                    order: "box-ordinal-group",
                    "align-items": "box-align",
                    "flex-flow": ["box-orient", "box-direction"],
                    "justify-content": "box-pack"
                },
                tn = Object.keys(en),
                nn = function(e) {
                    return Rt + e
                },
                rn = {
                    supportedProperty: function(e, t, n) {
                        var r = n.multiple;
                        if (tn.indexOf(e) > -1) {
                            var o = en[e];
                            if (!Array.isArray(o)) return Ct + Lt(o) in t && Rt + o;
                            if (!r) return !1;
                            for (var i = 0; i < o.length; i++)
                                if (!(Ct + Lt(o[0]) in t)) return !1;
                            return o.map(nn)
                        }
                        return !1
                    }
                },
                on = [Nt, Mt, Bt, qt, Vt, Wt, Ht, Kt, $t, zt, Gt, Jt, Yt, Zt, Xt, rn],
                an = on.filter((function(e) {
                    return e.supportedProperty
                })).map((function(e) {
                    return e.supportedProperty
                })),
                sn = on.filter((function(e) {
                    return e.noPrefill
                })).reduce((function(e, t) {
                    return e.push.apply(e, bt(t.noPrefill)), e
                }), []),
                cn = {};
            if (b) {
                Ft = document.createElement("p");
                var ln = window.getComputedStyle(document.documentElement, "");
                for (var un in ln) isNaN(un) || (cn[ln[un]] = ln[un]);
                sn.forEach((function(e) {
                    return delete cn[e]
                }))
            }

            function fn(e, t) {
                if (void 0 === t && (t = {}), !Ft) return e;
                if (null != cn[e]) return cn[e];
                "transition" !== e && "transform" !== e || (t[e] = e in Ft.style);
                for (var n = 0; n < an.length && (cn[e] = an[n](e, Ft.style, t), !cn[e]); n++);
                try {
                    Ft.style[e] = ""
                } catch (e) {
                    return !1
                }
                return cn[e]
            }
            var pn, dn = {},
                yn = {
                    transition: 1,
                    "transition-property": 1,
                    "-webkit-transition": 1,
                    "-webkit-transition-property": 1
                },
                hn = /(^\s*[\w-]+)|, (\s*[\w-]+)(?![^()]*\))/g;

            function mn(e, t, n) {
                if ("var" === t) return "var";
                if ("all" === t) return "all";
                if ("all" === n) return ", all";
                var r = t ? fn(t) : ", " + fn(n);
                return r || (t || n)
            }

            function gn(e, t) {
                var n = t;
                if (!pn || "content" === e) return t;
                if ("string" != typeof n || !isNaN(parseInt(n, 10))) return n;
                var r = e + n;
                if (null != dn[r]) return dn[r];
                try {
                    pn.style[e] = n
                } catch (e) {
                    return dn[r] = !1, !1
                }
                if (yn[e]) n = n.replace(hn, mn);
                else if ("" === pn.style[e] && ("-ms-flex" === (n = Rt + n) && (pn.style[e] = "-ms-flexbox"), pn.style[e] = n, "" === pn.style[e])) return dn[r] = !1, !1;
                return pn.style[e] = "", dn[r] = n, dn[r]
            }
            b && (pn = document.createElement("p"));
            var vn = function() {
                function e(t) {
                    for (var n in t) {
                        var r = t[n];
                        if ("fallbacks" === n && Array.isArray(r)) t[n] = r.map(e);
                        else {
                            var o = !1,
                                i = fn(n);
                            i && i !== n && (o = !0);
                            var a = !1,
                                s = gn(i, C(r));
                            s && s !== r && (a = !0), (o || a) && (o && delete t[n], t[i || n] = s || r)
                        }
                    }
                    return t
                }
                return {
                    onProcessRule: function(e) {
                        if ("keyframes" === e.type) {
                            var t = e;
                            t.at = function(e) {
                                return "-" === e[1] || "ms" === Ct ? e : "@" + Rt + "keyframes" + e.substr(10)
                            }(t.at)
                        }
                    },
                    onProcessStyle: function(t, n) {
                        return "style" !== n.type ? t : e(t)
                    },
                    onChangeValue: function(e, t) {
                        return gn(t, C(e)) || e
                    }
                }
            };
            var bn = function() {
                var e = function(e, t) {
                    return e.length === t.length ? e > t ? 1 : -1 : e.length - t.length
                };
                return {
                    onProcessStyle: function(t, n) {
                        if ("style" !== n.type) return t;
                        for (var r = {}, o = Object.keys(t).sort(e), i = 0; i < o.length; i++) r[o[i]] = t[o[i]];
                        return r
                    }
                }
            };
            var xn = Te({
                    plugins: [Ke(), Qe(), nt(), lt(), mt(), "undefined" == typeof window ? null : vn(), bn()]
                }),
                Sn = function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                        t = e.disableGlobal,
                        n = void 0 !== t && t,
                        r = e.productionPrefix,
                        o = void 0 === r ? "jss" : r,
                        i = e.seed,
                        a = void 0 === i ? "" : i,
                        s = "" === a ? "" : "".concat(a, "-"),
                        c = 0,
                        l = function() {
                            return c += 1
                        };
                    return function(e, t) {
                        var r = t.options.name;
                        if (r && 0 === r.indexOf("Mui") && !t.options.link && !n) {
                            if (-1 !== qe.indexOf(e.key)) return "Mui-".concat(e.key);
                            var i = "".concat(s).concat(r, "-").concat(e.key);
                            return t.options.theme[Be] && "" === a ? "".concat(i, "-").concat(l()) : i
                        }
                        return "".concat(s).concat(o).concat(l())
                    }
                }(),
                wn = {
                    disableGeneration: !1,
                    generateClassName: Sn,
                    jss: xn,
                    sheetsCache: null,
                    sheetsManager: new Map,
                    sheetsRegistry: null
                },
                Pn = r().createContext(wn);
            var En = -1e9;

            function An(e) {
                return An = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(e) {
                    return typeof e
                } : function(e) {
                    return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e
                }, An(e)
            }

            function On(e) {
                return e && "object" === An(e) && e.constructor === Object
            }

            function kn(e, t) {
                var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {
                        clone: !0
                    },
                    r = n.clone ? u({}, e) : e;
                return On(e) && On(t) && Object.keys(t).forEach((function(o) {
                    "__proto__" !== o && (On(t[o]) && o in e ? r[o] = kn(e[o], t[o], n) : r[o] = t[o])
                })), r
            }
            var Cn = {};

            function Rn(e, t) {
                var n = e.state,
                    r = e.theme,
                    o = e.stylesOptions,
                    i = e.stylesCreator,
                    a = e.name;
                if (!o.disableGeneration) {
                    var s = Ue.get(o.sheetsManager, i, r);
                    s || (s = {
                        refs: 0,
                        staticSheet: null,
                        dynamicStyles: null
                    }, Ue.set(o.sheetsManager, i, r, s));
                    var c = u({}, i.options, o, {
                        theme: r,
                        flip: "boolean" == typeof o.flip ? o.flip : "rtl" === r.direction
                    });
                    c.generateId = c.serverGenerateClassName || c.generateClassName;
                    var l = o.sheetsRegistry;
                    if (0 === s.refs) {
                        var f;
                        o.sheetsCache && (f = Ue.get(o.sheetsCache, i, r));
                        var p = i.create(r, a);
                        f || ((f = o.jss.createStyleSheet(p, u({
                            link: !1
                        }, c))).attach(), o.sheetsCache && Ue.set(o.sheetsCache, i, r, f)), l && l.add(f), s.staticSheet = f, s.dynamicStyles = Me(p)
                    }
                    if (s.dynamicStyles) {
                        var d = o.jss.createStyleSheet(s.dynamicStyles, u({
                            link: !0
                        }, c));
                        d.update(t), d.attach(), n.dynamicSheet = d, n.classes = _e({
                            baseClasses: s.staticSheet.classes,
                            newClasses: d.classes
                        }), l && l.add(d)
                    } else n.classes = s.staticSheet.classes;
                    s.refs += 1
                }
            }

            function jn(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    n = t.name,
                    o = t.classNamePrefix,
                    i = t.Component,
                    a = t.defaultTheme,
                    s = void 0 === a ? Cn : a,
                    c = p(t, ["name", "classNamePrefix", "Component", "defaultTheme"]),
                    l = function(e) {
                        var t = "function" == typeof e;
                        return {
                            create: function(n, r) {
                                var o;
                                try {
                                    o = t ? e(n) : e
                                } catch (e) {
                                    throw e
                                }
                                if (!r || !n.overrides || !n.overrides[r]) return o;
                                var i = n.overrides[r],
                                    a = u({}, o);
                                return Object.keys(i).forEach((function(e) {
                                    a[e] = kn(a[e], i[e])
                                })), a
                            },
                            options: {}
                        }
                    }(e),
                    f = n || o || "makeStyles";
                l.options = {
                    index: En += 1,
                    name: n,
                    meta: f,
                    classNamePrefix: f
                };
                return function() {
                    var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                        t = Fe() || s,
                        o = u({}, r().useContext(Pn), c),
                        a = r().useRef(),
                        f = r().useRef();
                    ! function(e, t) {
                        var n, o = r().useRef([]),
                            i = r().useMemo((function() {
                                return {}
                            }), t);
                        o.current !== i && (o.current = i, n = e()), r().useEffect((function() {
                            return function() {
                                n && n()
                            }
                        }), [i])
                    }((function() {
                        var r = {
                            name: n,
                            state: {},
                            stylesCreator: l,
                            stylesOptions: o,
                            theme: t
                        };
                        return Rn(r, e), f.current = !1, a.current = r,
                            function() {
                                ! function(e) {
                                    var t = e.state,
                                        n = e.theme,
                                        r = e.stylesOptions,
                                        o = e.stylesCreator;
                                    if (!r.disableGeneration) {
                                        var i = Ue.get(r.sheetsManager, o, n);
                                        i.refs -= 1;
                                        var a = r.sheetsRegistry;
                                        0 === i.refs && (Ue.delete(r.sheetsManager, o, n), r.jss.removeStyleSheet(i.staticSheet), a && a.remove(i.staticSheet)), t.dynamicSheet && (r.jss.removeStyleSheet(t.dynamicSheet), a && a.remove(t.dynamicSheet))
                                    }
                                }(r)
                            }
                    }), [t, l]), r().useEffect((function() {
                        f.current && function(e, t) {
                            var n = e.state;
                            n.dynamicSheet && n.dynamicSheet.update(t)
                        }(a.current, e), f.current = !0
                    }));
                    var p = function(e, t, n) {
                        var r = e.state;
                        if (e.stylesOptions.disableGeneration) return t || {};
                        r.cacheClasses || (r.cacheClasses = {
                            value: null,
                            lastProp: null,
                            lastJSS: {}
                        });
                        var o = !1;
                        return r.classes !== r.cacheClasses.lastJSS && (r.cacheClasses.lastJSS = r.classes, o = !0), t !== r.cacheClasses.lastProp && (r.cacheClasses.lastProp = t, o = !0), o && (r.cacheClasses.value = _e({
                            baseClasses: r.cacheClasses.lastJSS,
                            newClasses: t,
                            Component: n
                        })), r.cacheClasses.value
                    }(a.current, e.classes, i);
                    return p
                }
            }
            var In = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                    return function(n) {
                        var o = t.defaultTheme,
                            i = t.withTheme,
                            a = void 0 !== i && i,
                            s = t.name,
                            c = p(t, ["defaultTheme", "withTheme", "name"]);
                        var l = s,
                            f = jn(e, u({
                                defaultTheme: o,
                                Component: n,
                                name: s || n.displayName,
                                classNamePrefix: l
                            }, c)),
                            d = r().forwardRef((function(e, t) {
                                e.classes;
                                var i, c = e.innerRef,
                                    l = p(e, ["classes", "innerRef"]),
                                    d = f(u({}, n.defaultProps, e)),
                                    y = l;
                                return ("string" == typeof s || a) && (i = Fe() || o, s && (y = function(e) {
                                    var t = e.theme,
                                        n = e.name,
                                        r = e.props;
                                    if (!t || !t.props || !t.props[n]) return r;
                                    var o, i = t.props[n];
                                    for (o in i) void 0 === r[o] && (r[o] = i[o]);
                                    return r
                                }({
                                    theme: i,
                                    name: s,
                                    props: l
                                })), a && !y.theme && (y.theme = i)), r().createElement(n, u({
                                    ref: c || t,
                                    classes: d
                                }, y))
                            }));
                        return g()(d, n), d
                    }
                },
                Tn = ["xs", "sm", "md", "lg", "xl"];

            function Nn(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function Mn(e, t, n) {
                var r;
                return u({
                    gutters: function() {
                        var n = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                        return console.warn(["Material-UI: theme.mixins.gutters() is deprecated.", "You can use the source of the mixin directly:", "\n      paddingLeft: theme.spacing(2),\n      paddingRight: theme.spacing(2),\n      [theme.breakpoints.up('sm')]: {\n        paddingLeft: theme.spacing(3),\n        paddingRight: theme.spacing(3),\n      },\n      "].join("\n")), u({
                            paddingLeft: t(2),
                            paddingRight: t(2)
                        }, n, Nn({}, e.up("sm"), u({
                            paddingLeft: t(3),
                            paddingRight: t(3)
                        }, n[e.up("sm")])))
                    },
                    toolbar: (r = {
                        minHeight: 56
                    }, Nn(r, "".concat(e.up("xs"), " and (orientation: landscape)"), {
                        minHeight: 48
                    }), Nn(r, e.up("sm"), {
                        minHeight: 64
                    }), r)
                }, n)
            }

            function _n(e) {
                for (var t = "https://mui.com/production-error/?code=" + e, n = 1; n < arguments.length; n += 1) t += "&args[]=" + encodeURIComponent(arguments[n]);
                return "Minified Material-UI error #" + e + "; visit " + t + " for the full message."
            }
            var Dn = {
                    black: "#000",
                    white: "#fff"
                },
                Un = {
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
                    A100: "#d5d5d5",
                    A200: "#aaaaaa",
                    A400: "#303030",
                    A700: "#616161"
                },
                Ln = {
                    50: "#e8eaf6",
                    100: "#c5cae9",
                    200: "#9fa8da",
                    300: "#7986cb",
                    400: "#5c6bc0",
                    500: "#3f51b5",
                    600: "#3949ab",
                    700: "#303f9f",
                    800: "#283593",
                    900: "#1a237e",
                    A100: "#8c9eff",
                    A200: "#536dfe",
                    A400: "#3d5afe",
                    A700: "#304ffe"
                },
                Fn = {
                    50: "#fce4ec",
                    100: "#f8bbd0",
                    200: "#f48fb1",
                    300: "#f06292",
                    400: "#ec407a",
                    500: "#e91e63",
                    600: "#d81b60",
                    700: "#c2185b",
                    800: "#ad1457",
                    900: "#880e4f",
                    A100: "#ff80ab",
                    A200: "#ff4081",
                    A400: "#f50057",
                    A700: "#c51162"
                },
                Bn = {
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
                qn = {
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
                Vn = {
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
                Wn = {
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
                };

            function Hn(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0,
                    n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 1;
                return Math.min(Math.max(t, e), n)
            }

            function Kn(e) {
                if (e.type) return e;
                if ("#" === e.charAt(0)) return Kn(function(e) {
                    e = e.substr(1);
                    var t = new RegExp(".{1,".concat(e.length >= 6 ? 2 : 1, "}"), "g"),
                        n = e.match(t);
                    return n && 1 === n[0].length && (n = n.map((function(e) {
                        return e + e
                    }))), n ? "rgb".concat(4 === n.length ? "a" : "", "(").concat(n.map((function(e, t) {
                        return t < 3 ? parseInt(e, 16) : Math.round(parseInt(e, 16) / 255 * 1e3) / 1e3
                    })).join(", "), ")") : ""
                }(e));
                var t = e.indexOf("("),
                    n = e.substring(0, t);
                if (-1 === ["rgb", "rgba", "hsl", "hsla"].indexOf(n)) throw new Error(_n(3, e));
                var r = e.substring(t + 1, e.length - 1).split(",");
                return {
                    type: n,
                    values: r = r.map((function(e) {
                        return parseFloat(e)
                    }))
                }
            }

            function $n(e) {
                var t = e.type,
                    n = e.values;
                return -1 !== t.indexOf("rgb") ? n = n.map((function(e, t) {
                    return t < 3 ? parseInt(e, 10) : e
                })) : -1 !== t.indexOf("hsl") && (n[1] = "".concat(n[1], "%"), n[2] = "".concat(n[2], "%")), "".concat(t, "(").concat(n.join(", "), ")")
            }

            function zn(e) {
                var t = "hsl" === (e = Kn(e)).type ? Kn(function(e) {
                    var t = (e = Kn(e)).values,
                        n = t[0],
                        r = t[1] / 100,
                        o = t[2] / 100,
                        i = r * Math.min(o, 1 - o),
                        a = function(e) {
                            var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : (e + n / 30) % 12;
                            return o - i * Math.max(Math.min(t - 3, 9 - t, 1), -1)
                        },
                        s = "rgb",
                        c = [Math.round(255 * a(0)), Math.round(255 * a(8)), Math.round(255 * a(4))];
                    return "hsla" === e.type && (s += "a", c.push(t[3])), $n({
                        type: s,
                        values: c
                    })
                }(e)).values : e.values;
                return t = t.map((function(e) {
                    return (e /= 255) <= .03928 ? e / 12.92 : Math.pow((e + .055) / 1.055, 2.4)
                })), Number((.2126 * t[0] + .7152 * t[1] + .0722 * t[2]).toFixed(3))
            }

            function Gn(e, t) {
                if (e = Kn(e), t = Hn(t), -1 !== e.type.indexOf("hsl")) e.values[2] *= 1 - t;
                else if (-1 !== e.type.indexOf("rgb"))
                    for (var n = 0; n < 3; n += 1) e.values[n] *= 1 - t;
                return $n(e)
            }

            function Jn(e, t) {
                if (e = Kn(e), t = Hn(t), -1 !== e.type.indexOf("hsl")) e.values[2] += (100 - e.values[2]) * t;
                else if (-1 !== e.type.indexOf("rgb"))
                    for (var n = 0; n < 3; n += 1) e.values[n] += (255 - e.values[n]) * t;
                return $n(e)
            }
            var Yn = {
                    text: {
                        primary: "rgba(0, 0, 0, 0.87)",
                        secondary: "rgba(0, 0, 0, 0.54)",
                        disabled: "rgba(0, 0, 0, 0.38)",
                        hint: "rgba(0, 0, 0, 0.38)"
                    },
                    divider: "rgba(0, 0, 0, 0.12)",
                    background: {
                        paper: Dn.white,
                        default: Un[50]
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
                Zn = {
                    text: {
                        primary: Dn.white,
                        secondary: "rgba(255, 255, 255, 0.7)",
                        disabled: "rgba(255, 255, 255, 0.5)",
                        hint: "rgba(255, 255, 255, 0.5)",
                        icon: "rgba(255, 255, 255, 0.5)"
                    },
                    divider: "rgba(255, 255, 255, 0.12)",
                    background: {
                        paper: Un[800],
                        default: "#303030"
                    },
                    action: {
                        active: Dn.white,
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

            function Qn(e, t, n, r) {
                var o = r.light || r,
                    i = r.dark || 1.5 * r;
                e[t] || (e.hasOwnProperty(n) ? e[t] = e[n] : "light" === t ? e.light = Jn(e.main, o) : "dark" === t && (e.dark = Gn(e.main, i)))
            }

            function Xn(e) {
                var t = e.primary,
                    n = void 0 === t ? {
                        light: Ln[300],
                        main: Ln[500],
                        dark: Ln[700]
                    } : t,
                    r = e.secondary,
                    o = void 0 === r ? {
                        light: Fn.A200,
                        main: Fn.A400,
                        dark: Fn.A700
                    } : r,
                    i = e.error,
                    a = void 0 === i ? {
                        light: Bn[300],
                        main: Bn[500],
                        dark: Bn[700]
                    } : i,
                    s = e.warning,
                    c = void 0 === s ? {
                        light: qn[300],
                        main: qn[500],
                        dark: qn[700]
                    } : s,
                    l = e.info,
                    f = void 0 === l ? {
                        light: Vn[300],
                        main: Vn[500],
                        dark: Vn[700]
                    } : l,
                    d = e.success,
                    y = void 0 === d ? {
                        light: Wn[300],
                        main: Wn[500],
                        dark: Wn[700]
                    } : d,
                    h = e.type,
                    m = void 0 === h ? "light" : h,
                    g = e.contrastThreshold,
                    v = void 0 === g ? 3 : g,
                    b = e.tonalOffset,
                    x = void 0 === b ? .2 : b,
                    S = p(e, ["primary", "secondary", "error", "warning", "info", "success", "type", "contrastThreshold", "tonalOffset"]);

                function w(e) {
                    var t = function(e, t) {
                        var n = zn(e),
                            r = zn(t);
                        return (Math.max(n, r) + .05) / (Math.min(n, r) + .05)
                    }(e, Zn.text.primary) >= v ? Zn.text.primary : Yn.text.primary;
                    return t
                }
                var P = function(e) {
                        var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 500,
                            n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 300,
                            r = arguments.length > 3 && void 0 !== arguments[3] ? arguments[3] : 700;
                        if (!(e = u({}, e)).main && e[t] && (e.main = e[t]), !e.main) throw new Error(_n(4, t));
                        if ("string" != typeof e.main) throw new Error(_n(5, JSON.stringify(e.main)));
                        return Qn(e, "light", n, x), Qn(e, "dark", r, x), e.contrastText || (e.contrastText = w(e.main)), e
                    },
                    E = {
                        dark: Zn,
                        light: Yn
                    };
                return kn(u({
                    common: Dn,
                    type: m,
                    primary: P(n),
                    secondary: P(o, "A400", "A200", "A700"),
                    error: P(a),
                    warning: P(c),
                    info: P(f),
                    success: P(y),
                    grey: Un,
                    contrastThreshold: v,
                    getContrastText: w,
                    augmentColor: P,
                    tonalOffset: x
                }, E[m]), S)
            }

            function er(e) {
                return Math.round(1e5 * e) / 1e5
            }

            function tr(e) {
                return er(e)
            }
            var nr = {
                    textTransform: "uppercase"
                },
                rr = '"Roboto", "Helvetica", "Arial", sans-serif';

            function or(e, t) {
                var n = "function" == typeof t ? t(e) : t,
                    r = n.fontFamily,
                    o = void 0 === r ? rr : r,
                    i = n.fontSize,
                    a = void 0 === i ? 14 : i,
                    s = n.fontWeightLight,
                    c = void 0 === s ? 300 : s,
                    l = n.fontWeightRegular,
                    f = void 0 === l ? 400 : l,
                    d = n.fontWeightMedium,
                    y = void 0 === d ? 500 : d,
                    h = n.fontWeightBold,
                    m = void 0 === h ? 700 : h,
                    g = n.htmlFontSize,
                    v = void 0 === g ? 16 : g,
                    b = n.allVariants,
                    x = n.pxToRem,
                    S = p(n, ["fontFamily", "fontSize", "fontWeightLight", "fontWeightRegular", "fontWeightMedium", "fontWeightBold", "htmlFontSize", "allVariants", "pxToRem"]);
                var w = a / 14,
                    P = x || function(e) {
                        return "".concat(e / v * w, "rem")
                    },
                    E = function(e, t, n, r, i) {
                        return u({
                            fontFamily: o,
                            fontWeight: e,
                            fontSize: P(t),
                            lineHeight: n
                        }, o === rr ? {
                            letterSpacing: "".concat(er(r / t), "em")
                        } : {}, i, b)
                    },
                    A = {
                        h1: E(c, 96, 1.167, -1.5),
                        h2: E(c, 60, 1.2, -.5),
                        h3: E(f, 48, 1.167, 0),
                        h4: E(f, 34, 1.235, .25),
                        h5: E(f, 24, 1.334, 0),
                        h6: E(y, 20, 1.6, .15),
                        subtitle1: E(f, 16, 1.75, .15),
                        subtitle2: E(y, 14, 1.57, .1),
                        body1: E(f, 16, 1.5, .15),
                        body2: E(f, 14, 1.43, .15),
                        button: E(y, 14, 1.75, .4, nr),
                        caption: E(f, 12, 1.66, .4),
                        overline: E(f, 12, 2.66, 1, nr)
                    };
                return kn(u({
                    htmlFontSize: v,
                    pxToRem: P,
                    round: tr,
                    fontFamily: o,
                    fontSize: a,
                    fontWeightLight: c,
                    fontWeightRegular: f,
                    fontWeightMedium: y,
                    fontWeightBold: m
                }, A), S, {
                    clone: !1
                })
            }

            function ir() {
                return ["".concat(arguments.length <= 0 ? void 0 : arguments[0], "px ").concat(arguments.length <= 1 ? void 0 : arguments[1], "px ").concat(arguments.length <= 2 ? void 0 : arguments[2], "px ").concat(arguments.length <= 3 ? void 0 : arguments[3], "px rgba(0,0,0,").concat(.2, ")"), "".concat(arguments.length <= 4 ? void 0 : arguments[4], "px ").concat(arguments.length <= 5 ? void 0 : arguments[5], "px ").concat(arguments.length <= 6 ? void 0 : arguments[6], "px ").concat(arguments.length <= 7 ? void 0 : arguments[7], "px rgba(0,0,0,").concat(.14, ")"), "".concat(arguments.length <= 8 ? void 0 : arguments[8], "px ").concat(arguments.length <= 9 ? void 0 : arguments[9], "px ").concat(arguments.length <= 10 ? void 0 : arguments[10], "px ").concat(arguments.length <= 11 ? void 0 : arguments[11], "px rgba(0,0,0,").concat(.12, ")")].join(",")
            }
            var ar = ["none", ir(0, 2, 1, -1, 0, 1, 1, 0, 0, 1, 3, 0), ir(0, 3, 1, -2, 0, 2, 2, 0, 0, 1, 5, 0), ir(0, 3, 3, -2, 0, 3, 4, 0, 0, 1, 8, 0), ir(0, 2, 4, -1, 0, 4, 5, 0, 0, 1, 10, 0), ir(0, 3, 5, -1, 0, 5, 8, 0, 0, 1, 14, 0), ir(0, 3, 5, -1, 0, 6, 10, 0, 0, 1, 18, 0), ir(0, 4, 5, -2, 0, 7, 10, 1, 0, 2, 16, 1), ir(0, 5, 5, -3, 0, 8, 10, 1, 0, 3, 14, 2), ir(0, 5, 6, -3, 0, 9, 12, 1, 0, 3, 16, 2), ir(0, 6, 6, -3, 0, 10, 14, 1, 0, 4, 18, 3), ir(0, 6, 7, -4, 0, 11, 15, 1, 0, 4, 20, 3), ir(0, 7, 8, -4, 0, 12, 17, 2, 0, 5, 22, 4), ir(0, 7, 8, -4, 0, 13, 19, 2, 0, 5, 24, 4), ir(0, 7, 9, -4, 0, 14, 21, 2, 0, 5, 26, 4), ir(0, 8, 9, -5, 0, 15, 22, 2, 0, 6, 28, 5), ir(0, 8, 10, -5, 0, 16, 24, 2, 0, 6, 30, 5), ir(0, 8, 11, -5, 0, 17, 26, 2, 0, 6, 32, 5), ir(0, 9, 11, -5, 0, 18, 28, 2, 0, 7, 34, 6), ir(0, 9, 12, -6, 0, 19, 29, 2, 0, 7, 36, 6), ir(0, 10, 13, -6, 0, 20, 31, 3, 0, 8, 38, 7), ir(0, 10, 13, -6, 0, 21, 33, 3, 0, 8, 40, 7), ir(0, 10, 14, -6, 0, 22, 35, 3, 0, 8, 42, 7), ir(0, 11, 14, -7, 0, 23, 36, 3, 0, 9, 44, 8), ir(0, 11, 15, -7, 0, 24, 38, 3, 0, 9, 46, 8)],
                sr = {
                    borderRadius: 4
                };

            function cr(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" != typeof Symbol && Symbol.iterator in Object(e)) {
                        var n = [],
                            r = !0,
                            o = !1,
                            i = void 0;
                        try {
                            for (var a, s = e[Symbol.iterator](); !(r = (a = s.next()).done) && (n.push(a.value), !t || n.length !== t); r = !0);
                        } catch (e) {
                            o = !0, i = e
                        } finally {
                            try {
                                r || null == s.return || s.return()
                            } finally {
                                if (o) throw i
                            }
                        }
                        return n
                    }
                }(e, t) || vt(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var lr = {
                    xs: 0,
                    sm: 600,
                    md: 960,
                    lg: 1280,
                    xl: 1920
                },
                ur = {
                    keys: ["xs", "sm", "md", "lg", "xl"],
                    up: function(e) {
                        return "@media (min-width:".concat(lr[e], "px)")
                    }
                };
            var fr = function(e, t) {
                return t ? kn(e, t, {
                    clone: !1
                }) : e
            };
            var pr = {
                    m: "margin",
                    p: "padding"
                },
                dr = {
                    t: "Top",
                    r: "Right",
                    b: "Bottom",
                    l: "Left",
                    x: ["Left", "Right"],
                    y: ["Top", "Bottom"]
                },
                yr = {
                    marginX: "mx",
                    marginY: "my",
                    paddingX: "px",
                    paddingY: "py"
                },
                hr = function(e) {
                    var t = {};
                    return function(n) {
                        return void 0 === t[n] && (t[n] = e(n)), t[n]
                    }
                }((function(e) {
                    if (e.length > 2) {
                        if (!yr[e]) return [e];
                        e = yr[e]
                    }
                    var t = cr(e.split(""), 2),
                        n = t[0],
                        r = t[1],
                        o = pr[n],
                        i = dr[r] || "";
                    return Array.isArray(i) ? i.map((function(e) {
                        return o + e
                    })) : [o + i]
                })),
                mr = ["m", "mt", "mr", "mb", "ml", "mx", "my", "p", "pt", "pr", "pb", "pl", "px", "py", "margin", "marginTop", "marginRight", "marginBottom", "marginLeft", "marginX", "marginY", "padding", "paddingTop", "paddingRight", "paddingBottom", "paddingLeft", "paddingX", "paddingY"];

            function gr(e) {
                var t = e.spacing || 8;
                return "number" == typeof t ? function(e) {
                    return t * e
                } : Array.isArray(t) ? function(e) {
                    return t[e]
                } : "function" == typeof t ? t : function() {}
            }

            function vr(e, t) {
                return function(n) {
                    return e.reduce((function(e, r) {
                        return e[r] = function(e, t) {
                            if ("string" == typeof t || null == t) return t;
                            var n = e(Math.abs(t));
                            return t >= 0 ? n : "number" == typeof n ? -n : "-".concat(n)
                        }(t, n), e
                    }), {})
                }
            }

            function br(e) {
                var t = gr(e.theme);
                return Object.keys(e).map((function(n) {
                    if (-1 === mr.indexOf(n)) return null;
                    var r = vr(hr(n), t),
                        o = e[n];
                    return function(e, t, n) {
                        if (Array.isArray(t)) {
                            var r = e.theme.breakpoints || ur;
                            return t.reduce((function(e, o, i) {
                                return e[r.up(r.keys[i])] = n(t[i]), e
                            }), {})
                        }
                        if ("object" === An(t)) {
                            var o = e.theme.breakpoints || ur;
                            return Object.keys(t).reduce((function(e, r) {
                                return e[o.up(r)] = n(t[r]), e
                            }), {})
                        }
                        return n(t)
                    }(e, o, r)
                })).reduce(fr, {})
            }
            br.propTypes = {}, br.filterProps = mr;
            var xr = {
                    easeInOut: "cubic-bezier(0.4, 0, 0.2, 1)",
                    easeOut: "cubic-bezier(0.0, 0, 0.2, 1)",
                    easeIn: "cubic-bezier(0.4, 0, 1, 1)",
                    sharp: "cubic-bezier(0.4, 0, 0.6, 1)"
                },
                Sr = {
                    shortest: 150,
                    shorter: 200,
                    short: 250,
                    standard: 300,
                    complex: 375,
                    enteringScreen: 225,
                    leavingScreen: 195
                };

            function wr(e) {
                return "".concat(Math.round(e), "ms")
            }
            var Pr = {
                    easing: xr,
                    duration: Sr,
                    create: function() {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : ["all"],
                            t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                            n = t.duration,
                            r = void 0 === n ? Sr.standard : n,
                            o = t.easing,
                            i = void 0 === o ? xr.easeInOut : o,
                            a = t.delay,
                            s = void 0 === a ? 0 : a;
                        p(t, ["duration", "easing", "delay"]);
                        return (Array.isArray(e) ? e : [e]).map((function(e) {
                            return "".concat(e, " ").concat("string" == typeof r ? r : wr(r), " ").concat(i, " ").concat("string" == typeof s ? s : wr(s))
                        })).join(",")
                    },
                    getAutoHeightDuration: function(e) {
                        if (!e) return 0;
                        var t = e / 36;
                        return Math.round(10 * (4 + 15 * Math.pow(t, .25) + t / 5))
                    }
                },
                Er = {
                    mobileStepper: 1e3,
                    speedDial: 1050,
                    appBar: 1100,
                    drawer: 1200,
                    modal: 1300,
                    snackbar: 1400,
                    tooltip: 1500
                };

            function Ar() {
                for (var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {}, t = e.breakpoints, n = void 0 === t ? {} : t, r = e.mixins, o = void 0 === r ? {} : r, i = e.palette, a = void 0 === i ? {} : i, s = e.spacing, c = e.typography, l = void 0 === c ? {} : c, f = p(e, ["breakpoints", "mixins", "palette", "spacing", "typography"]), d = Xn(a), y = function(e) {
                        var t = e.values,
                            n = void 0 === t ? {
                                xs: 0,
                                sm: 600,
                                md: 960,
                                lg: 1280,
                                xl: 1920
                            } : t,
                            r = e.unit,
                            o = void 0 === r ? "px" : r,
                            i = e.step,
                            a = void 0 === i ? 5 : i,
                            s = p(e, ["values", "unit", "step"]);

                        function c(e) {
                            var t = "number" == typeof n[e] ? n[e] : e;
                            return "@media (min-width:".concat(t).concat(o, ")")
                        }

                        function l(e, t) {
                            var r = Tn.indexOf(t);
                            return r === Tn.length - 1 ? c(e) : "@media (min-width:".concat("number" == typeof n[e] ? n[e] : e).concat(o, ") and ") + "(max-width:".concat((-1 !== r && "number" == typeof n[Tn[r + 1]] ? n[Tn[r + 1]] : t) - a / 100).concat(o, ")")
                        }
                        return u({
                            keys: Tn,
                            values: n,
                            up: c,
                            down: function(e) {
                                var t = Tn.indexOf(e) + 1,
                                    r = n[Tn[t]];
                                return t === Tn.length ? c("xs") : "@media (max-width:".concat(("number" == typeof r && t > 0 ? r : e) - a / 100).concat(o, ")")
                            },
                            between: l,
                            only: function(e) {
                                return l(e, e)
                            },
                            width: function(e) {
                                return n[e]
                            }
                        }, s)
                    }(n), h = function() {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : 8;
                        if (e.mui) return e;
                        var t = gr({
                                spacing: e
                            }),
                            n = function() {
                                for (var e = arguments.length, n = new Array(e), r = 0; r < e; r++) n[r] = arguments[r];
                                return 0 === n.length ? t(1) : 1 === n.length ? t(n[0]) : n.map((function(e) {
                                    if ("string" == typeof e) return e;
                                    var n = t(e);
                                    return "number" == typeof n ? "".concat(n, "px") : n
                                })).join(" ")
                            };
                        return Object.defineProperty(n, "unit", {
                            get: function() {
                                return e
                            }
                        }), n.mui = !0, n
                    }(s), m = kn({
                        breakpoints: y,
                        direction: "ltr",
                        mixins: Mn(y, h, o),
                        overrides: {},
                        palette: d,
                        props: {},
                        shadows: ar,
                        typography: or(d, l),
                        spacing: h,
                        shape: sr,
                        transitions: Pr,
                        zIndex: Er
                    }, f), g = arguments.length, v = new Array(g > 1 ? g - 1 : 0), b = 1; b < g; b++) v[b - 1] = arguments[b];
                return m = v.reduce((function(e, t) {
                    return kn(e, t)
                }), m)
            }
            var Or = Ar();
            var kr = function(e, t) {
                return In(e, u({
                    defaultTheme: Or
                }, t))
            };

            function Cr(e) {
                if ("string" != typeof e) throw new Error(_n(7));
                return e.charAt(0).toUpperCase() + e.slice(1)
            }
            var Rr = 44,
                jr = t.forwardRef((function(e, n) {
                    var r = e.classes,
                        o = e.className,
                        i = e.color,
                        a = void 0 === i ? "primary" : i,
                        s = e.disableShrink,
                        c = void 0 !== s && s,
                        l = e.size,
                        f = void 0 === l ? 40 : l,
                        d = e.style,
                        y = e.thickness,
                        m = void 0 === y ? 3.6 : y,
                        g = e.value,
                        v = void 0 === g ? 0 : g,
                        b = e.variant,
                        x = void 0 === b ? "indeterminate" : b,
                        S = p(e, ["classes", "className", "color", "disableShrink", "size", "style", "thickness", "value", "variant"]),
                        w = {},
                        P = {},
                        E = {};
                    if ("determinate" === x || "static" === x) {
                        var A = 2 * Math.PI * ((Rr - m) / 2);
                        w.strokeDasharray = A.toFixed(3), E["aria-valuenow"] = Math.round(v), w.strokeDashoffset = "".concat(((100 - v) / 100 * A).toFixed(3), "px"), P.transform = "rotate(-90deg)"
                    }
                    return t.createElement("div", u({
                        className: h(r.root, o, "inherit" !== a && r["color".concat(Cr(a))], {
                            determinate: r.determinate,
                            indeterminate: r.indeterminate,
                            static: r.static
                        } [x]),
                        style: u({
                            width: f,
                            height: f
                        }, P, d),
                        ref: n,
                        role: "progressbar"
                    }, E, S), t.createElement("svg", {
                        className: r.svg,
                        viewBox: "".concat(22, " ").concat(22, " ").concat(Rr, " ").concat(Rr)
                    }, t.createElement("circle", {
                        className: h(r.circle, c && r.circleDisableShrink, {
                            determinate: r.circleDeterminate,
                            indeterminate: r.circleIndeterminate,
                            static: r.circleStatic
                        } [x]),
                        style: w,
                        cx: Rr,
                        cy: Rr,
                        r: (Rr - m) / 2,
                        fill: "none",
                        strokeWidth: m
                    })))
                })),
                Ir = kr((function(e) {
                    return {
                        root: {
                            display: "inline-block"
                        },
                        static: {
                            transition: e.transitions.create("transform")
                        },
                        indeterminate: {
                            animation: "$circular-rotate 1.4s linear infinite"
                        },
                        determinate: {
                            transition: e.transitions.create("transform")
                        },
                        colorPrimary: {
                            color: e.palette.primary.main
                        },
                        colorSecondary: {
                            color: e.palette.secondary.main
                        },
                        svg: {
                            display: "block"
                        },
                        circle: {
                            stroke: "currentColor"
                        },
                        circleStatic: {
                            transition: e.transitions.create("stroke-dashoffset")
                        },
                        circleIndeterminate: {
                            animation: "$circular-dash 1.4s ease-in-out infinite",
                            strokeDasharray: "80px, 200px",
                            strokeDashoffset: "0px"
                        },
                        circleDeterminate: {
                            transition: e.transitions.create("stroke-dashoffset")
                        },
                        "@keyframes circular-rotate": {
                            "0%": {
                                transformOrigin: "50% 50%"
                            },
                            "100%": {
                                transform: "rotate(360deg)"
                            }
                        },
                        "@keyframes circular-dash": {
                            "0%": {
                                strokeDasharray: "1px, 200px",
                                strokeDashoffset: "0px"
                            },
                            "50%": {
                                strokeDasharray: "100px, 200px",
                                strokeDashoffset: "-15px"
                            },
                            "100%": {
                                strokeDasharray: "100px, 200px",
                                strokeDashoffset: "-125px"
                            }
                        },
                        circleDisableShrink: {
                            animation: "none"
                        }
                    }
                }), {
                    name: "MuiCircularProgress",
                    flip: !1
                })(jr),
                Tr = ReactStyleGuide,
                Nr = n(9396),
                Mr = n.n(Nr),
                _r = n(976);

            function Dr(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var n = [],
                        r = !0,
                        o = !1,
                        i = void 0;
                    try {
                        for (var a, s = e[Symbol.iterator](); !(r = (a = s.next()).done) && (n.push(a.value), !t || n.length !== t); r = !0);
                    } catch (e) {
                        o = !0, i = e
                    } finally {
                        try {
                            r || null == s.return || s.return()
                        } finally {
                            if (o) throw i
                        }
                    }
                    return n
                }(e, t) || function(e, t) {
                    if (!e) return;
                    if ("string" == typeof e) return Ur(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    "Object" === n && e.constructor && (n = e.constructor.name);
                    if ("Map" === n || "Set" === n) return Array.from(e);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return Ur(e, t)
                }(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function Ur(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = new Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function Lr(e, t) {
                var n = Object.keys(e);
                if (Object.getOwnPropertySymbols) {
                    var r = Object.getOwnPropertySymbols(e);
                    t && (r = r.filter((function(t) {
                        return Object.getOwnPropertyDescriptor(e, t).enumerable
                    }))), n.push.apply(n, r)
                }
                return n
            }

            function Fr(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {};
                    t % 2 ? Lr(Object(n), !0).forEach((function(t) {
                        Br(e, t, n[t])
                    })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(n)) : Lr(Object(n)).forEach((function(t) {
                        Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(n, t))
                    }))
                }
                return e
            }

            function Br(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }
            var qr = {
                    isOpen: !0
                },
                Vr = (0, t.createContext)(qr),
                Wr = function(e, t) {
                    return t.type === _r.CLOSE_AGE_ESTIMATION_PROMPT_MODAL ? Fr(Fr({}, e), {}, {
                        isOpen: !1
                    }) : qr
                },
                Hr = function(e) {
                    var n = e.children,
                        o = Dr((0, t.useReducer)(Wr, qr), 2),
                        i = o[0],
                        a = o[1];
                    return r().createElement(Vr.Provider, {
                        value: {
                            ageEstimationPromptModalState: i,
                            dispatch: a
                        }
                    }, n)
                };

            function Kr(e, t, n, r, o, i, a) {
                try {
                    var s = e[i](a),
                        c = s.value
                } catch (e) {
                    return void n(e)
                }
                s.done ? t(c) : Promise.resolve(c).then(r, o)
            }
            Hr.propTypes = {
                children: c().node.isRequired
            };
            var $r = i.EnvironmentUrls.apiGatewayUrl;

            function zr() {
                var t;
                return t = regeneratorRuntime.mark((function t() {
                    var n, r, o, i;
                    return regeneratorRuntime.wrap((function(t) {
                        for (;;) switch (t.prev = t.next) {
                            case 0:
                                return n = {
                                    retryable: !0,
                                    withCredentials: !0,
                                    url: "".concat($r, "/age-verification-service/v1/persona-id-verification/start-verification")
                                }, r = {
                                    generateLink: !0,
                                    ageEstimation: !0
                                }, t.prev = 2, t.next = 5, e.httpService.post(n, r);
                            case 5:
                                return o = t.sent, i = o.data, t.abrupt("return", i);
                            case 10:
                                throw t.prev = 10, t.t0 = t.catch(2), new Error("Error to start ID verification: ".concat(t.t0 || "unknown"));
                            case 13:
                            case "end":
                                return t.stop()
                        }
                    }), t, null, [
                        [2, 10]
                    ])
                })), zr = function() {
                    var e = this,
                        n = arguments;
                    return new Promise((function(r, o) {
                        var i = t.apply(e, n);

                        function a(e) {
                            Kr(i, r, o, a, s, "next", e)
                        }

                        function s(e) {
                            Kr(i, r, o, a, s, "throw", e)
                        }
                        a(void 0)
                    }))
                }, zr.apply(this, arguments)
            }
            var Gr = function() {
                return zr.apply(this, arguments)
            };

            function Jr(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var n = [],
                        r = !0,
                        o = !1,
                        i = void 0;
                    try {
                        for (var a, s = e[Symbol.iterator](); !(r = (a = s.next()).done) && (n.push(a.value), !t || n.length !== t); r = !0);
                    } catch (e) {
                        o = !0, i = e
                    } finally {
                        try {
                            r || null == s.return || s.return()
                        } finally {
                            if (o) throw i
                        }
                    }
                    return n
                }(e, t) || function(e, t) {
                    if (!e) return;
                    if ("string" == typeof e) return Yr(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    "Object" === n && e.constructor && (n = e.constructor.name);
                    if ("Map" === n || "Set" === n) return Array.from(e);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return Yr(e, t)
                }(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function Yr(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = new Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function Zr(e) {
                e.translate;
                var n = (0, t.useContext)(Vr).dispatch,
                    o = Jr((0, t.useState)(!0), 2),
                    i = o[0],
                    a = o[1];
                return (0, t.useEffect)((function() {
                    Gr().then((function(e) {
                        if (null != e && e.sessionIdentifier) var t = new(Mr().Client)({
                            inquiryId: e.sessionIdentifier,
                            onReady: function() {
                                t.open(), a(!1)
                            },
                            onComplete: function(e) {
                                e.inquiryId, e.status, e.fields;
                                n({
                                    type: _r.CLOSE_AGE_ESTIMATION_PROMPT_MODAL
                                })
                            },
                            onCancel: function(e) {
                                e.inquiryId, e.sessionToken;
                                n({
                                    type: _r.CLOSE_AGE_ESTIMATION_PROMPT_MODAL
                                })
                            },
                            onError: function(e) {
                                console.error(e), n({
                                    type: _r.CLOSE_AGE_ESTIMATION_PROMPT_MODAL
                                })
                            }
                        });
                        else a(!1)
                    })).catch((function(e) {
                        console.error("Error starting session: ".concat(e)), a(!1)
                    }))
                }), []), r().createElement(Tr.Modal, {
                    className: "age-estimation-upsell-modal",
                    show: i,
                    keyboard: !1,
                    backdrop: "static",
                    size: "lg",
                    "aria-labelledby": "contained-modal-title-vcenter",
                    scrollable: "true",
                    centered: "true"
                }, r().createElement(Ir, {
                    class: "spinner"
                }))
            }
            Zr.propTypes = {
                translate: c().func.isRequired
            };
            var Qr = Zr,
                Xr = "verificationUpsell-container",
                eo = {
                    common: ["Feature.AccountSettings"],
                    feature: "Feature.VerificationUpsell"
                };

            function to(e) {
                var t = e.translate;
                return r().createElement(Hr, null, r().createElement(Qr, {
                    translate: t
                }))
            }
            to.propTypes = {
                translate: c().func.isRequired
            };
            var no = (0, l.withTranslations)(to, eo),
                ro = "SET_USER_EMAIL_STATES",
                oo = "SET_MODAL_STATES",
                io = "SET_PAGENAME_STATE",
                ao = "SET_INPUT_STATE",
                so = "SET_ERROR_STATE",
                co = "SET_EMAIL_SENT_STATE",
                lo = "SET_RESEND_EMAIL_STATE",
                uo = "SET_EMAIL_UPDATING_STATE",
                fo = "SET_TRIGGER_ORIGIN",
                po = "SET_INPUT_CLEAR",
                yo = "SET_EMAIL_ADDED_STATE",
                ho = "Verification",
                mo = "UpdateEmail",
                go = "UpdatePassword",
                vo = "logout",
                bo = "buyRobuxPage",
                xo = "homepage",
                So = "premiumSubscriptionPage",
                wo = "purchaseWarning",
                Po = "notApprovedPage",
                Eo = "https://en.help.roblox.com/hc/articles/115004630823-Roblox-Privacy-and-Cookie-Policy",
                Ao = "Enter",
                Oo = "Action.PrivacyPolicy",
                ko = "Message.ConfirmationEmailNotSent",
                Co = "Message.InvalidEmailAddress",
                Ro = "Response.ErrorTryAgain",
                jo = "Response.TooManyAttemptsTryAgainLater";

            function Io(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var n = [],
                        r = !0,
                        o = !1,
                        i = void 0;
                    try {
                        for (var a, s = e[Symbol.iterator](); !(r = (a = s.next()).done) && (n.push(a.value), !t || n.length !== t); r = !0);
                    } catch (e) {
                        o = !0, i = e
                    } finally {
                        try {
                            r || null == s.return || s.return()
                        } finally {
                            if (o) throw i
                        }
                    }
                    return n
                }(e, t) || function(e, t) {
                    if (!e) return;
                    if ("string" == typeof e) return To(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    "Object" === n && e.constructor && (n = e.constructor.name);
                    if ("Map" === n || "Set" === n) return Array.from(e);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return To(e, t)
                }(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function To(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = new Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function No(e, t) {
                var n = Object.keys(e);
                if (Object.getOwnPropertySymbols) {
                    var r = Object.getOwnPropertySymbols(e);
                    t && (r = r.filter((function(t) {
                        return Object.getOwnPropertyDescriptor(e, t).enumerable
                    }))), n.push.apply(n, r)
                }
                return n
            }

            function Mo(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {};
                    t % 2 ? No(Object(n), !0).forEach((function(t) {
                        _o(e, t, n[t])
                    })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(n)) : No(Object(n)).forEach((function(t) {
                        Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(n, t))
                    }))
                }
                return e
            }

            function _o(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }
            var Do = "Action.SendConfirmationEmail",
                Uo = "Action.ResendConfirmationEmail",
                Lo = "Action.ChangeEmail",
                Fo = "Action.GenericSkip",
                Bo = "Action.Continue",
                qo = "Action.FinishSetup",
                Vo = "Action.LogoutWithRisk",
                Wo = "Description.VerifyEmailBody",
                Ho = "Description.AddEmailTextOver13",
                Ko = "Description.AddEmailTextUnder13",
                $o = "Description.AddEmailTextStrongMessaging",
                zo = "Description.AddEmailTextStrongMessagingU13",
                Go = "Heading.VerifyEmail",
                Jo = "Heading.AddEmail",
                Yo = "Heading.PleaseAddEmail",
                Zo = "Heading.CompleteSetupOnLogout",
                Qo = "Label.EmailInputPlaceholderOver13",
                Xo = "Label.EmailInputPlaceholderUnder13V2",
                ei = "Description.PleaseEnterEmail",
                ti = "Description.PleaseEnterParentEmail",
                ni = {
                    pageName: "",
                    isModalOpen: !1,
                    isEmailVerified: !1,
                    isEmailSent: !1,
                    isEmailUpdating: !1,
                    isEmailAdded: !1,
                    origin: "",
                    experimentParameters: null,
                    userEmail: "",
                    userEmailInput: "",
                    userEmailInputPlaceholder: Qo,
                    errorMsg: "",
                    titleText: Go,
                    bodyText: Wo,
                    primaryButtonText: Uo,
                    secondaryButtonText: Lo,
                    skipCallback: null,
                    closeCallback: null
                },
                ri = (0, t.createContext)(ni),
                oi = function(e, t) {
                    switch (t.type) {
                        case po:
                            return Mo(Mo({}, e), {}, {
                                userEmailInput: ""
                            });
                        case fo:
                            return Mo(Mo({}, e), {}, {
                                origin: t.origin,
                                skipCallback: t.skipCallback,
                                closeCallback: t.closeCallback
                            });
                        case ro:
                            return Mo(Mo({}, e), {}, {
                                isEmailVerified: t.isEmailVerified,
                                userEmail: t.userEmail
                            });
                        case io:
                            return Mo(Mo({}, e), {}, {
                                pageName: t.pageName
                            });
                        case so:
                            return Mo(Mo({}, e), {}, {
                                errorMsg: t.errorMsg
                            });
                        case uo:
                            return Mo(Mo({}, e), {}, {
                                isEmailUpdating: t.isEmailUpdating
                            });
                        case co:
                            return Mo(Mo({}, e), {}, {
                                isEmailSent: !0
                            });
                        case yo:
                            return Mo(Mo({}, e), {}, {
                                isEmailAdded: !0
                            });
                        case lo:
                            return Mo(Mo({}, e), {}, {
                                isEmailSent: !1
                            });
                        case ao:
                            return e.pageName === mo ? Mo(Mo({}, e), {}, {
                                userEmailInput: t.value,
                                errorMsg: ""
                            }) : e;
                        case oo:
                            if (e.pageName === mo) {
                                var n, r = i.CurrentUser && !i.CurrentUser.isUnder13;
                                n = r ? Qo : Xo;
                                var o, a, s = Do,
                                    c = "";
                                switch (e.skipCallback && (c = Fo), e.origin) {
                                    case vo:
                                        a = Zo, o = r ? $o : zo, s = qo, c = Vo;
                                        break;
                                    case xo:
                                    case Po:
                                        a = Yo, o = r ? ei : ti, s = Bo;
                                        break;
                                    default:
                                        a = Jo, o = r ? Ho : Ko
                                }
                                return Mo(Mo({}, e), {}, {
                                    pageName: mo,
                                    titleText: a,
                                    bodyText: o,
                                    primaryButtonText: s,
                                    secondaryButtonText: c,
                                    errorMsg: "",
                                    userEmailInputPlaceholder: n
                                })
                            }
                            return Mo(Mo({}, e), {}, {
                                pageName: ho,
                                titleText: Go,
                                bodyText: Wo,
                                primaryButtonText: Uo,
                                secondaryButtonText: Lo,
                                errorMsg: ""
                            });
                        default:
                            return e
                    }
                },
                ii = function(e) {
                    var n = e.children,
                        o = Io((0, t.useReducer)(oi, ni), 2),
                        i = o[0],
                        a = o[1];
                    return r().createElement(ri.Provider, {
                        value: {
                            emailUpsellState: i,
                            dispatch: a
                        }
                    }, n)
                };

            function ai() {
                return (0, t.useContext)(ri)
            }
            ii.propTypes = {
                children: c().node.isRequired
            };
            var si = HeaderScripts,
                ci = (!!i.DeviceMeta && (0, i.DeviceMeta)()).isAndroidApp;

            function li(e) {
                var t = e.show,
                    n = e.onHide,
                    o = e.onPrimaryAction,
                    i = e.onSecondaryAction,
                    a = e.onInputChange,
                    s = e.onBackAction,
                    c = e.onInputFocus,
                    l = e.onKeyDown,
                    u = e.translate,
                    f = ai().emailUpsellState,
                    p = f.pageName,
                    d = f.titleText,
                    y = f.bodyText,
                    h = f.primaryButtonText,
                    m = f.secondaryButtonText,
                    g = f.userEmailInput,
                    v = f.userEmailInputPlaceholder,
                    b = f.userEmail,
                    x = f.errorMsg,
                    S = f.isEmailSent,
                    w = f.isEmailUpdating,
                    P = null === si.authenticatedUser || void 0 === si.authenticatedUser ? void 0 : si.authenticatedUser.isUnder13;
                return r().createElement(Tr.Modal, {
                    show: t,
                    onHide: n,
                    className: "".concat(ci ? "verification-android-modal" : "", " verification-modal"),
                    size: "lg",
                    "aria-labelledby": "verification-upsell-modal-title",
                    scrollable: "true",
                    centered: "true"
                }, r().createElement(Tr.Modal.Header, {
                    useBaseBootstrapComponent: !0
                }, r().createElement("div", {
                    className: "verification-upsell-title-container"
                }, r().createElement(Tr.Modal.Title, {
                    id: "verification-upsell-modal-title"
                }, u(d))), p === go ? r().createElement("button", {
                    type: "button",
                    className: "close close-button",
                    onClick: s
                }, r().createElement("span", {
                    className: "icon-back"
                })) : r().createElement("button", {
                    type: "button",
                    className: "close close-button",
                    onClick: n
                }, r().createElement("span", {
                    className: "icon-close"
                }))), r().createElement(Tr.Modal.Body, null, r().createElement("div", {
                    className: "email-verification-upsell-image"
                }), r().createElement("p", {
                    className: "verification-upsell-text-body"
                }, u(y, {
                    emailAddress: b
                })), p === mo && r().createElement("input", {
                    type: "email",
                    autoFocus: !0,
                    className: "".concat(x ? "input-field-error" : "", " form-control input-field verification-upsell-modal-input"),
                    placeholder: u(v),
                    autoComplete: "email",
                    value: g,
                    onChange: function(e) {
                        return a(e.target.value)
                    },
                    onFocus: function() {
                        return c()
                    },
                    onKeyDown: function(e) {
                        return l(e.key)
                    }
                }), x && r().createElement("p", {
                    className: "text-error modal-error-message sms-code-error"
                }, u(x)), p === mo && P && r().createElement("div", {
                    className: "privacy-policy-button"
                }, r().createElement("a", {
                    href: Eo,
                    target: "_blank",
                    rel: "noreferrer"
                }, u(Oo)))), r().createElement(Tr.Modal.Footer, null, r().createElement("div", {
                    className: "verification-upsell-footer-container"
                }, p !== ho && r().createElement(Tr.Button, {
                    className: "modal-button verification-upsell-btn",
                    variant: Tr.Button.variants.cta,
                    size: Tr.Button.sizes.medium,
                    isDisabled: w,
                    onClick: o
                }, u(h)), p === ho && r().createElement("button", {
                    type: "button",
                    className: "".concat(S ? "resend-button-disabled" : "", " resend-verification-email-button"),
                    disabled: S || x,
                    onClick: o
                }, u(h)), m && r().createElement("button", {
                    type: "button",
                    className: "change-email-button",
                    onClick: i
                }, u(m)))))
            }
            li.propTypes = {
                translate: c().func.isRequired,
                onHide: c().func.isRequired,
                show: c().bool.isRequired,
                onPrimaryAction: c().func.isRequired,
                onSecondaryAction: c().func.isRequired,
                onInputChange: c().func.isRequired,
                onKeyDown: c().func.isRequired,
                onBackAction: c().func.isRequired,
                onInputFocus: c().func.isRequired
            };
            var ui = li,
                fi = CoreRobloxUtilities,
                pi = i.EnvironmentUrls.accountSettingsApi,
                di = i.EnvironmentUrls.authApi,
                yi = i.EnvironmentUrls.apiGatewayUrl,
                hi = i.EnvironmentUrls.accountInformationApi,
                mi = function() {
                    return {
                        retryable: !0,
                        withCredentials: !0,
                        url: "".concat(pi, "/v1/email")
                    }
                },
                gi = {
                    header: "alt_title",
                    body: "alt_body",
                    primaryButton: "alt_primary_button_text",
                    secondaryButton: "alt_secondary_button_text"
                },
                vi = function(e) {
                    var t, n = null == e || null === (t = e.data) || void 0 === t ? void 0 : t.errors;
                    return n && n[0] && n[0].code
                };

            function bi() {
                return i.Guac.callBehaviour("account-settings-ui").catch((function() {
                    return {}
                }))
            }

            function xi(e, t, n, r, o, i, a) {
                try {
                    var s = e[i](a),
                        c = s.value
                } catch (e) {
                    return void n(e)
                }
                s.done ? t(c) : Promise.resolve(c).then(r, o)
            }

            function Si(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise((function(r, o) {
                        var i = e.apply(t, n);

                        function a(e) {
                            xi(i, r, o, a, s, "next", e)
                        }

                        function s(e) {
                            xi(i, r, o, a, s, "throw", e)
                        }
                        a(void 0)
                    }))
                }
            }
            var wi = function() {
                    var t = {
                        retryable: !0,
                        withCredentials: !0,
                        url: "".concat(pi, "/v1/email/verify")
                    };
                    return e.httpService.post(t).then((function() {
                        return !0
                    }), (function(e) {
                        return vi(e)
                    }))
                },
                Pi = function() {
                    var t = Si(regeneratorRuntime.mark((function t(n) {
                        var r, o;
                        return regeneratorRuntime.wrap((function(t) {
                            for (;;) switch (t.prev = t.next) {
                                case 0:
                                    return t.next = 2, bi();
                                case 2:
                                    return r = t.sent, o = mi(), t.abrupt("return", e.httpService.get(o).then((function(e) {
                                        var t = e.data;
                                        if (null == t || !t.emailAddress || n.requireVerification && !t.verified) {
                                            var o = new CustomEvent("OpenVerificationModal", {
                                                detail: {
                                                    isEmailVerified: t.verified,
                                                    email: null == t ? void 0 : t.emailAddress,
                                                    skipCallback: n.skipCallback,
                                                    origin: n.origin,
                                                    experimentParameters: null == n ? void 0 : n.experimentParameters,
                                                    requireVerification: n.requireVerification,
                                                    closeCallback: n.closeCallback,
                                                    settingsUiPolicy: r
                                                }
                                            });
                                            window.dispatchEvent(o)
                                        }
                                        return t
                                    }), (function(e) {
                                        return console.log(e), !1
                                    })));
                                case 5:
                                case "end":
                                    return t.stop()
                            }
                        }), t)
                    })));
                    return function(e) {
                        return t.apply(this, arguments)
                    }
                }(),
                Ei = function() {
                    var t = Si(regeneratorRuntime.mark((function t() {
                        var n;
                        return regeneratorRuntime.wrap((function(t) {
                            for (;;) switch (t.prev = t.next) {
                                case 0:
                                    return n = {
                                        retryable: !0,
                                        withCredentials: !0,
                                        url: "".concat(di, "/v2/metadata")
                                    }, t.abrupt("return", e.httpService.get(n));
                                case 2:
                                case "end":
                                    return t.stop()
                            }
                        }), t)
                    })));
                    return function() {
                        return t.apply(this, arguments)
                    }
                }(),
                Ai = function() {
                    var t = Si(regeneratorRuntime.mark((function t() {
                        var n, r;
                        return regeneratorRuntime.wrap((function(t) {
                            for (;;) switch (t.prev = t.next) {
                                case 0:
                                    return n = {
                                        retryable: !0,
                                        withCredentials: !0,
                                        url: "".concat(yi, "/product-experimentation-platform/v1/projects/1/layers/Website.Logout.ContactMethodModal/values")
                                    }, r = {
                                        parameters: Object.values(gi).join(",")
                                    }, t.abrupt("return", e.httpService.get(n, r));
                                case 3:
                                case "end":
                                    return t.stop()
                            }
                        }), t)
                    })));
                    return function() {
                        return t.apply(this, arguments)
                    }
                }(),
                Oi = function() {
                    var e = Si(regeneratorRuntime.mark((function e(t) {
                        var n, r, o, i, a;
                        return regeneratorRuntime.wrap((function(e) {
                            for (;;) switch (e.prev = e.next) {
                                case 0:
                                    return e.next = 2, Ei();
                                case 2:
                                    if (o = e.sent, null !== (n = o.data) && void 0 !== n && n.IsEmailUpsellAtLogoutEnabled) {
                                        e.next = 5;
                                        break
                                    }
                                    return e.abrupt("return", !1);
                                case 5:
                                    return i = {}, e.prev = 6, e.next = 9, Ai();
                                case 9:
                                    i = e.sent, e.next = 14;
                                    break;
                                case 12:
                                    e.prev = 12, e.t0 = e.catch(6);
                                case 14:
                                    return a = vo, e.abrupt("return", Pi({
                                        origin: a,
                                        experimentParameters: null === (r = i) || void 0 === r ? void 0 : r.data,
                                        skipCallback: t
                                    }));
                                case 16:
                                case "end":
                                    return e.stop()
                            }
                        }), e, null, [
                            [6, 12]
                        ])
                    })));
                    return function(t) {
                        return e.apply(this, arguments)
                    }
                }(),
                ki = function() {
                    var e = Si(regeneratorRuntime.mark((function e(t) {
                        var n, r, o, i;
                        return regeneratorRuntime.wrap((function(e) {
                            for (;;) switch (e.prev = e.next) {
                                case 0:
                                    return e.next = 2, bi();
                                case 2:
                                    return r = e.sent, o = {}, e.prev = 4, e.next = 7, Ai();
                                case 7:
                                    o = e.sent, e.next = 13;
                                    break;
                                case 10:
                                    e.prev = 10, e.t0 = e.catch(4);
                                    try {
                                        fi.eventStreamService.sendEventWithTarget("authClientError", "logoutUpsell", {
                                            state: "logoutExperimentParamsFetchFailed"
                                        })
                                    } catch (e) {}
                                case 13:
                                    i = new CustomEvent("OpenVerificationModal", {
                                        detail: {
                                            origin: vo,
                                            skipCallback: t,
                                            isEmailVerified: !1,
                                            email: void 0,
                                            requireVerification: !1,
                                            experimentParameters: null === (n = o) || void 0 === n ? void 0 : n.data,
                                            settingsUiPolicy: r
                                        }
                                    }), window.dispatchEvent(i);
                                case 16:
                                case "end":
                                    return e.stop()
                            }
                        }), e, null, [
                            [4, 10]
                        ])
                    })));
                    return function(t) {
                        return e.apply(this, arguments)
                    }
                }(),
                Ci = function(e) {
                    return Pi({
                        origin: xo,
                        closeCallback: e
                    })
                },
                Ri = function(e) {
                    var t = e.indexOf("@"),
                        n = e.substring(0, 1);
                    return "".concat(n, "*****").concat(e.substring(t))
                },
                ji = "addEmail",
                Ii = "verifyEmail",
                Ti = "addPhone",
                Ni = "verifyPhone",
                Mi = "phoneAdded",
                _i = "discoverabilityConsent",
                Di = "unset",
                Ui = "homepage",
                Li = "settingsAccountInfo",
                Fi = "friendDiscoverySetting",
                Bi = "challenge",
                qi = function(e) {
                    switch (e) {
                        case ho:
                            return Ii;
                        case mo:
                            return ji;
                        default:
                            return ""
                    }
                },
                Vi = 9,
                Wi = Co,
                Hi = jo,
                Ki = Ro,
                $i = Vi,
                zi = 6;

            function Gi(e, t) {
                var n = Object.keys(e);
                if (Object.getOwnPropertySymbols) {
                    var r = Object.getOwnPropertySymbols(e);
                    t && (r = r.filter((function(t) {
                        return Object.getOwnPropertyDescriptor(e, t).enumerable
                    }))), n.push.apply(n, r)
                }
                return n
            }

            function Ji(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {};
                    t % 2 ? Gi(Object(n), !0).forEach((function(t) {
                        Yi(e, t, n[t])
                    })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(n)) : Gi(Object(n)).forEach((function(t) {
                        Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(n, t))
                    }))
                }
                return e
            }

            function Yi(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }
            var Zi = function(e, t) {
                    fi.eventStreamService.sendEventWithTarget(e.type, e.context, Ji(Ji({}, e.params), {}, {
                        origin: t.origin,
                        section: t.section
                    }))
                },
                Qi = function(e, t) {
                    var n = Ji({}, e);
                    return n.params = Ji(Ji({}, n.params), {}, {
                        errorCode: t
                    }), n
                },
                Xi = fi.eventStreamService.eventTypes,
                ea = "verificationUpsell",
                ta = {
                    showModal: {
                        name: "showModal",
                        type: Xi.modalAction,
                        context: ea,
                        params: {
                            aType: "shown"
                        }
                    },
                    dismissModal: {
                        name: "dismissModal",
                        type: Xi.modalAction,
                        context: ea,
                        params: {
                            aType: "dismissed"
                        }
                    },
                    touchEmail: {
                        name: "touchEmail",
                        type: Xi.formInteraction,
                        context: ea,
                        params: {
                            aType: "focus",
                            field: "email"
                        }
                    },
                    showError: {
                        name: "showError",
                        type: Xi.formInteraction,
                        context: ea,
                        params: {
                            aType: "shown",
                            field: "errorMessage"
                        }
                    },
                    clickContinue: {
                        name: "clickContinue",
                        type: Xi.formInteraction,
                        context: ea,
                        params: {
                            btn: "continue"
                        }
                    },
                    clickSendConfirmationEmail: {
                        name: "clickSendConfirmationEmail",
                        type: Xi.formInteraction,
                        context: ea,
                        params: {
                            aType: "click",
                            btn: "sendConfirmation"
                        }
                    },
                    clickResendConfirmationEmail: {
                        name: "clickResendConfirmationEmail",
                        type: Xi.formInteraction,
                        context: ea,
                        params: {
                            aType: "click",
                            btn: "resendConfirmation"
                        }
                    },
                    clickChangeEmail: {
                        name: "clickChangeEmail",
                        type: Xi.formInteraction,
                        context: ea,
                        params: {
                            aType: "click",
                            btn: "changeEmail"
                        }
                    },
                    skipLogoutAnyway: {
                        name: "skipLogoutAnyway",
                        type: Xi.formInteraction,
                        context: ea,
                        params: {
                            aType: "click",
                            btn: "skipLogoutAnyway"
                        }
                    },
                    skipPrepurchaseVerification: {
                        name: "skipPrepurchaseVerification",
                        type: Xi.formInteraction,
                        context: ea,
                        params: {
                            aType: "click",
                            btn: "skipPrepurchaseVerification"
                        }
                    }
                };

            function na(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var n = [],
                        r = !0,
                        o = !1,
                        i = void 0;
                    try {
                        for (var a, s = e[Symbol.iterator](); !(r = (a = s.next()).done) && (n.push(a.value), !t || n.length !== t); r = !0);
                    } catch (e) {
                        o = !0, i = e
                    } finally {
                        try {
                            r || null == s.return || s.return()
                        } finally {
                            if (o) throw i
                        }
                    }
                    return n
                }(e, t) || function(e, t) {
                    if (!e) return;
                    if ("string" == typeof e) return ra(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    "Object" === n && e.constructor && (n = e.constructor.name);
                    if ("Map" === n || "Set" === n) return Array.from(e);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return ra(e, t)
                }(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ra(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = new Array(t); n < t; n++) r[n] = e[n];
                return r
            }
            var oa = ko,
                ia = Co,
                aa = Vi;

            function sa(n) {
                var o = n.translate,
                    i = na((0, t.useState)(!1), 2),
                    a = i[0],
                    s = i[1],
                    c = ai(),
                    l = c.emailUpsellState,
                    u = c.dispatch;

                function f() {
                    var t, n, r, o = qi(l.pageName);
                    switch (l.pageName) {
                        case ho:
                            Zi(ta.clickResendConfirmationEmail, {
                                origin: l.origin,
                                section: o
                            }), wi().then((function(e) {
                                if (!0 !== e) {
                                    u({
                                        type: so,
                                        errorMsg: oa
                                    });
                                    var t = Qi(ta.showError, e);
                                    Zi(t, {
                                        origin: l.origin,
                                        section: o
                                    })
                                } else u({
                                    type: co
                                }), setTimeout((function() {
                                    u({
                                        type: lo
                                    })
                                }), 15e3)
                            }));
                            break;
                        case mo:
                            if (Zi(ta.clickContinue, {
                                    origin: l.origin,
                                    section: o
                                }), r = l.userEmailInput, /\S+@\S+\.\S+/.test(r)) Zi(ta.clickSendConfirmationEmail, {
                                origin: l.origin,
                                section: o
                            }), u({
                                type: uo,
                                isEmailUpdating: !0
                            }), (t = {
                                emailAddress: l.userEmailInput
                            }, n = mi(), e.httpService.post(n, t).then((function() {
                                return !0
                            }), (function(e) {
                                return vi(e)
                            }))).then((function(e) {
                                if (!0 !== e) {
                                    var t = function(e) {
                                            switch (e) {
                                                case zi:
                                                    return Hi;
                                                case $i:
                                                    return Wi;
                                                default:
                                                    return Ki
                                            }
                                        }(e),
                                        n = Qi(ta.showError, e);
                                    Zi(n, {
                                        origin: l.origin,
                                        section: o
                                    }), u({
                                        type: so,
                                        errorMsg: t
                                    }), u({
                                        type: uo,
                                        isEmailUpdating: !1
                                    })
                                } else u({
                                    type: ro,
                                    isEmailVerified: !1,
                                    userEmail: Ri(l.userEmailInput)
                                }), u({
                                    type: po
                                }), u({
                                    type: io,
                                    pageName: ho
                                }), u({
                                    type: oo
                                }), u({
                                    type: uo,
                                    isEmailUpdating: !1
                                }), u({
                                    type: yo
                                })
                            })), u({
                                type: oo
                            });
                            else {
                                var i = Qi(ta.showError, aa);
                                Zi(i, {
                                    origin: l.origin,
                                    section: o
                                }), u({
                                    type: so,
                                    errorMsg: ia
                                })
                            }
                    }
                }
                return (0, t.useEffect)((function() {
                    l.pageName && Zi(ta.showModal, {
                        origin: l.origin,
                        section: qi(l.pageName)
                    })
                }), [l.pageName]), (0, t.useEffect)((function() {
                    window.addEventListener("OpenVerificationModal", (function(e) {
                        var t, n;
                        s(!0), u({
                            type: fo,
                            origin: e.detail.origin,
                            skipCallback: e.detail.skipCallback,
                            closeCallback: e.detail.closeCallback
                        }), u({
                            type: ro,
                            isEmailVerified: e.detail.isEmailVerified,
                            userEmail: e.detail.email
                        });
                        var r = e.detail.requireVerification && e.detail.email ? ho : mo;
                        u({
                            type: io,
                            pageName: r
                        }), u({
                            type: oo,
                            experimentParameters: null === (t = e.detail) || void 0 === t ? void 0 : t.experimentParameters,
                            settingsUiPolicy: null === (n = e.detail) || void 0 === n ? void 0 : n.settingsUiPolicy
                        })
                    }), !1)
                }), []), r().createElement("div", null, r().createElement(ui, {
                    show: a,
                    onHide: function() {
                        return Zi(ta.dismissModal, {
                            origin: l.origin,
                            section: qi(l.pageName)
                        }), u({
                            type: po
                        }), l.closeCallback && l.closeCallback(l.isEmailAdded), void s(!1)
                    },
                    onPrimaryAction: function() {
                        return f()
                    },
                    onSecondaryAction: function() {
                        return function() {
                            var e = qi(l.pageName);
                            switch (l.pageName) {
                                case ho:
                                    Zi(ta.clickChangeEmail, {
                                        origin: l.origin,
                                        section: e
                                    }), u({
                                        type: io,
                                        pageName: mo
                                    }), u({
                                        type: oo
                                    });
                                    break;
                                case mo:
                                    l.skipCallback && (Zi(l.origin === vo ? ta.skipLogoutAnyway : ta.skipPrepurchaseVerification, {
                                        origin: l.origin,
                                        section: e
                                    }), l.skipCallback()), u({
                                        type: po
                                    }), s(!1)
                            }
                        }()
                    },
                    onInputFocus: function() {
                        Zi(ta.touchEmail, {
                            origin: l.origin,
                            section: qi(l.pageName)
                        })
                    },
                    onInputChange: function(e) {
                        return function(e) {
                            u({
                                type: ao,
                                pageName: mo,
                                value: e
                            })
                        }(e)
                    },
                    onKeyDown: function(e) {
                        return function(e) {
                            return e === Ao && f()
                        }(e)
                    },
                    onBackAction: function() {
                        return u({
                            type: io,
                            pageName: mo
                        }), void u({
                            type: oo
                        })
                    },
                    translate: o
                }))
            }
            sa.propTypes = {
                translate: c().func.isRequired
            };
            var ca = sa;

            function la(e) {
                var t = e.translate;
                return r().createElement(ii, null, r().createElement(ca, {
                    translate: t
                }))
            }
            la.propTypes = {
                translate: c().func.isRequired
            };
            var ua = (0, l.withTranslations)(la, eo),
                fa = "CLOSE_CONTACT_METHOD_PROMPT_MODAL",
                pa = "SET_LOGGING_VALUES";

            function da(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var n = [],
                        r = !0,
                        o = !1,
                        i = void 0;
                    try {
                        for (var a, s = e[Symbol.iterator](); !(r = (a = s.next()).done) && (n.push(a.value), !t || n.length !== t); r = !0);
                    } catch (e) {
                        o = !0, i = e
                    } finally {
                        try {
                            r || null == s.return || s.return()
                        } finally {
                            if (o) throw i
                        }
                    }
                    return n
                }(e, t) || function(e, t) {
                    if (!e) return;
                    if ("string" == typeof e) return ya(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    "Object" === n && e.constructor && (n = e.constructor.name);
                    if ("Map" === n || "Set" === n) return Array.from(e);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return ya(e, t)
                }(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ya(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = new Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function ha(e, t) {
                var n = Object.keys(e);
                if (Object.getOwnPropertySymbols) {
                    var r = Object.getOwnPropertySymbols(e);
                    t && (r = r.filter((function(t) {
                        return Object.getOwnPropertyDescriptor(e, t).enumerable
                    }))), n.push.apply(n, r)
                }
                return n
            }

            function ma(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {};
                    t % 2 ? ha(Object(n), !0).forEach((function(t) {
                        ga(e, t, n[t])
                    })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(n)) : ha(Object(n)).forEach((function(t) {
                        Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(n, t))
                    }))
                }
                return e
            }

            function ga(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }
            var va = {
                    isOpen: !0,
                    origin: "",
                    section: ""
                },
                ba = (0, t.createContext)(va),
                xa = function(e, t) {
                    switch (t.type) {
                        case fa:
                            return ma(ma({}, e), {}, {
                                isOpen: !1
                            });
                        case pa:
                            return ma(ma({}, e), {}, {
                                origin: t.origin,
                                section: t.section
                            });
                        default:
                            return va
                    }
                },
                Sa = function(e) {
                    var n = e.children,
                        o = da((0, t.useReducer)(xa, va), 2),
                        i = o[0],
                        a = o[1];
                    return r().createElement(ba.Provider, {
                        value: {
                            contactMethodPromptModalState: i,
                            dispatch: a
                        }
                    }, n)
                };
            Sa.propTypes = {
                children: c().node.isRequired
            };
            var wa = "Action.Done",
                Pa = "Action.Continue",
                Ea = "Action.AddPhoneNumber",
                Aa = "Action.ChangePhoneNumber",
                Oa = "Action.Verify",
                ka = "Action.ResendCode",
                Ca = "Action.CodeResent",
                Ra = "Heading.VerifyYourPhone",
                ja = "Label.EnterCode",
                Ia = "Label.PhoneNumber",
                Ta = "Heading.VerificationCode",
                Na = "Message.InvalidSmsCode",
                Ma = "Description.PhoneNumberNeverPublic",
                _a = "Heading.PhoneIsVerified",
                Da = "Description.PhoneForRecovery",
                Ua = "Response.PhoneNumberAlreadyLinked",
                La = "Response.TooManyVerificationAttempts",
                Fa = "Response.PhoneHasTooManyAssociatedAccounts",
                Ba = "Response.ErrorPhoneFormatInvalid",
                qa = "Response.InvalidPhoneNumberError",
                Va = "Response.ErrorTryAgain",
                Wa = "Label.Dialog.EditPhoneCurrentNumber",
                Ha = "Description.Dialog.EditPhoneWarning",
                Ka = "Action.Dialog.EditPhonePrimary",
                $a = "Action.Dialog.EditPhoneSecondary",
                za = "Heading.Dialog.RemovePhone",
                Ga = "Action.Dialog.RemovePhonePrimary",
                Ja = "Action.Dialog.RemovePhoneSecondary",
                Ya = "Description.Dialog.RemovePhoneWarning",
                Za = "Description.AddPhoneNumber",
                Qa = "Description.AddPhoneBody",
                Xa = "Description.UpdatePhoneNumber",
                es = "Heading.VerificationRequired",
                ts = "Heading.DontGetLockedOut",
                ns = "Label.RecoverIfPasswordLost",
                rs = "Heading.ImproveAccountSecurity",
                os = "Label.KeepBadActorsOut",
                is = "Action.AddPhoneNumber",
                as = "Action.AddEmailAddress",
                ss = "Action.LogOutText",
                cs = "Action.Support",
                ls = fi.eventStreamService.eventTypes,
                us = "contactMethodModal",
                fs = {
                    contactMethodPromptShown: {
                        name: "contactMethodPromptShown",
                        type: ls.modalAction,
                        context: us,
                        params: {
                            aType: "shown"
                        }
                    },
                    contactMethodPromptDismissed: {
                        name: "contactMethodPromptDismissed",
                        type: ls.modalAction,
                        context: us,
                        params: {
                            aType: "dismissed"
                        }
                    },
                    contactMethodPromptEmailClicked: {
                        name: "contactMethodPromptEmailClicked",
                        type: ls.buttonClick,
                        context: us,
                        params: {
                            btn: "email"
                        }
                    },
                    contactMethodPromptPhoneClicked: {
                        name: "contactMethodPromptPhoneClicked",
                        type: ls.buttonClick,
                        context: us,
                        params: {
                            btn: "phone"
                        }
                    },
                    contactMethodPromptSupportClicked: {
                        name: "contactMethodPromptSupportClicked",
                        type: ls.buttonClick,
                        context: us,
                        params: {
                            btn: "support"
                        }
                    },
                    contactMethodPromptLogoutClicked: {
                        name: "contactMethodPromptLogoutClicked",
                        type: ls.buttonClick,
                        context: us,
                        params: {
                            btn: "logout"
                        }
                    }
                };

            function ps() {
                return (0, t.useContext)(ba)
            }

            function ds(e) {
                var t = e.translate,
                    n = e.onHide,
                    o = ps().contactMethodPromptModalState,
                    a = es,
                    s = ts,
                    c = ns,
                    l = rs,
                    u = os,
                    f = is,
                    p = ss,
                    d = cs,
                    y = as,
                    h = function(e) {
                        e || null === i.UpsellService || void 0 === i.UpsellService || i.UpsellService.renderContactMethodPromptModal({
                            origin: o.origin,
                            section: o.section
                        })
                    };
                return r().createElement("div", null, r().createElement(Tr.Modal.Header, {
                    useBaseBootstrapComponent: !0
                }, r().createElement("div", {
                    className: "verification-upsell-title-container"
                }, r().createElement(Tr.Modal.Title, {
                    id: "verification-upsell-modal-title"
                }, t(a)))), r().createElement(Tr.Modal.Body, {
                    className: "verification-grid"
                }, r().createElement("span", {
                    className: "icon-spot-passcode-xl verification-grid-icon"
                }), r().createElement("div", null, r().createElement("div", {
                    className: "verification-upsell-title-container page-title "
                }, r().createElement("div", {
                    className: "font-header-2"
                }, t(s))), r().createElement("div", {
                    className: "text-description"
                }, t(c))), r().createElement("span", {
                    className: "icon-spot-success-xl verification-grid-icon"
                }), r().createElement("div", null, r().createElement("div", {
                    className: "verification-upsell-title-container page-title"
                }, r().createElement("div", {
                    className: "font-header-2"
                }, t(l))), r().createElement("div", {
                    className: "text-description"
                }, t(u)))), r().createElement(Tr.Modal.Footer, null, r().createElement("button", {
                    type: "button",
                    className: "btn-cta-md btn-max-width phone-number-verify-button",
                    onClick: function() {
                        n(), Zi(fs.contactMethodPromptPhoneClicked, {
                            origin: o.origin,
                            section: o.section
                        }), null === i.UpsellService || void 0 === i.UpsellService || i.UpsellService.renderPhoneUpsell({
                            onClose: h
                        })
                    }
                }, t(f)), r().createElement("button", {
                    type: "button",
                    className: " btn-secondary-md btn-max-width phone-number-resent-button",
                    onClick: function() {
                        n(), Zi(fs.contactMethodPromptEmailClicked, {
                            origin: o.origin,
                            section: o.section
                        }), null === i.UpsellService || void 0 === i.UpsellService || i.UpsellService.renderEmailUpsell(h)
                    }
                }, t(y)), r().createElement("div", null, r().createElement("div", {
                    className: "contact-method-prompt-links"
                }, r().createElement(Tr.Link, {
                    className: "text-default contact-method-link-button",
                    href: "https://en.help.roblox.com/hc/articles/203313350",
                    target: "_blank",
                    onClick: function() {
                        Zi(fs.contactMethodPromptSupportClicked, {
                            origin: o.origin,
                            section: o.section
                        })
                    }
                }, t(d)), r().createElement("button", {
                    type: "button",
                    className: "text-default contact-method-link-button",
                    onClick: function() {
                        Zi(fs.contactMethodPromptLogoutClicked, {
                            origin: o.origin,
                            section: o.section
                        }), i.NavigationService.logoutAndRedirect()
                    }
                }, t(p))))))
            }
            ds.propTypes = {
                translate: c().func.isRequired,
                onHide: c().func.isRequired
            };
            var ys = ds;

            function hs(e) {
                var n = e.translate,
                    o = e.origin,
                    i = e.section,
                    a = ps(),
                    s = a.contactMethodPromptModalState,
                    c = a.dispatch,
                    l = function() {
                        Zi(fs.contactMethodPromptDismissed, {
                            origin: s.origin,
                            section: s.section
                        }), c({
                            type: fa
                        })
                    };
                return (0, t.useEffect)((function() {
                    c({
                        type: pa,
                        origin: o,
                        section: i
                    })
                }), []), (0, t.useEffect)((function() {
                    s.origin && s.section && Zi(fs.contactMethodPromptShown, {
                        origin: s.origin,
                        section: s.section
                    })
                }), [s.origin, s.section]), r().createElement(Tr.Modal, {
                    show: s.isOpen,
                    onHide: l,
                    keyboard: !1,
                    className: "verification-modal",
                    backdrop: "static",
                    size: "lg",
                    "aria-labelledby": "verification-upsell-modal-title",
                    scrollable: "true",
                    centered: "true"
                }, r().createElement(ys, {
                    translate: n,
                    onHide: l
                }))
            }
            hs.propTypes = {
                translate: c().func.isRequired,
                section: c().string.isRequired,
                origin: c().string.isRequired
            };
            var ms = hs;

            function gs(e) {
                var t = e.translate,
                    n = e.origin,
                    o = e.section;
                return r().createElement(Sa, null, r().createElement(ms, {
                    translate: t,
                    origin: n,
                    section: o
                }))
            }
            gs.propTypes = {
                translate: c().func.isRequired,
                origin: c().string.isRequired,
                section: c().string.isRequired
            };
            var vs = (0, l.withTranslations)(gs, eo),
                bs = "CLOSE_PHONE_NUMBER_MODAL",
                xs = "SET_ERROR_MESSAGE",
                Ss = "SET_PHONE_NUMBER",
                ws = "SET_COUNTRY",
                Ps = "SET_PAGE",
                Es = "SET_PHONE_VERIFICATION_STATUS",
                As = "SET_PREFIX_OPTIONS_LIST",
                Os = "SET_LOGGING_VALUES",
                ks = "SET_DISCOVERABILITY_CONSENT_PREFILL",
                Cs = "US",
                Rs = function(e) {
                    return "+".concat(e)
                },
                js = function(e, t) {
                    return "".concat(e, " +(").concat(t, ")")
                },
                Is = function(e, t) {
                    return "\n+".concat(e).concat(t)
                },
                Ts = "Enter",
                Ns = " (",
                Ms = ")",
                _s = 6,
                Ds = 10,
                Us = 2,
                Ls = 3,
                Fs = 6,
                Bs = 8,
                qs = 9,
                Vs = 7,
                Ws = 6,
                Hs = "upsell-phone-number-number",
                Ks = "verification-code-input",
                $s = "ADD_PHONE_NUMBER_PAGE",
                zs = "VERIFY_PHONE_NUMBER_PAGE",
                Gs = "ADD_PHONE_SUCCESS_PAGE",
                Js = "DELETE_PHONE_CONFIRM_PAGE",
                Ys = "PHONE_DISCOVERABILITY_CONSENT_V2_PAGE",
                Zs = fi.eventStreamService.eventTypes,
                Qs = "verificationUpsell",
                Xs = {
                    phoneNumberModalDismissed: {
                        name: "phoneNumberModalDismissed",
                        type: Zs.modalAction,
                        context: Qs,
                        params: {
                            aType: "dismissed"
                        }
                    },
                    phoneNumberModalShown: {
                        name: "phoneNumberModalShown",
                        type: Zs.modalAction,
                        context: Qs,
                        params: {
                            aType: "shown"
                        }
                    },
                    phoneNumberModalErrorShown: {
                        name: "phoneNumberModalErrorShown",
                        type: Zs.modalAction,
                        context: Qs,
                        params: {
                            aType: "shown",
                            field: "errorMessage"
                        }
                    },
                    addPhonePrefixPressed: {
                        name: "addPhonePrefixPressed",
                        type: Zs.formInteraction,
                        context: Qs,
                        params: {
                            aType: "focus",
                            field: "countryPrefix"
                        }
                    },
                    addPhonePhoneNumberPressed: {
                        name: "addPhonePhoneNumberPressed",
                        type: Zs.formInteraction,
                        context: Qs,
                        params: {
                            aType: "focus",
                            field: "phoneNumber"
                        }
                    },
                    addPhoneContinuePressed: {
                        name: "addPhoneContinuePressed",
                        type: Zs.formInteraction,
                        context: Qs,
                        params: {
                            btn: "continue"
                        }
                    },
                    verifyPhoneChangePhoneNumberPressed: {
                        name: "verifyPhoneChangePhoneNumberPressed",
                        type: Zs.formInteraction,
                        context: Qs,
                        params: {
                            btn: "changePhoneNumber"
                        }
                    },
                    verifyPhoneCodeFieldPressed: {
                        name: "verifyPhoneCodeFieldPressed",
                        type: Zs.formInteraction,
                        context: Qs,
                        params: {
                            aType: "focus",
                            field: "verificationCode"
                        }
                    },
                    verifyPhoneContinuePressed: {
                        name: "verifyPhoneContinuePressed",
                        type: Zs.formInteraction,
                        context: Qs,
                        params: {
                            btn: "continue"
                        }
                    },
                    verifyPhoneResendPressed: {
                        name: "verifyPhoneResendPressed",
                        type: Zs.formInteraction,
                        context: Qs,
                        params: {
                            btn: "resendCode"
                        }
                    },
                    phoneAddedDonePressed: {
                        name: "phoneAddedDonePressed",
                        type: Zs.formInteraction,
                        context: Qs,
                        params: {
                            btn: "done"
                        }
                    }
                };

            function ec(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var n = [],
                        r = !0,
                        o = !1,
                        i = void 0;
                    try {
                        for (var a, s = e[Symbol.iterator](); !(r = (a = s.next()).done) && (n.push(a.value), !t || n.length !== t); r = !0);
                    } catch (e) {
                        o = !0, i = e
                    } finally {
                        try {
                            r || null == s.return || s.return()
                        } finally {
                            if (o) throw i
                        }
                    }
                    return n
                }(e, t) || function(e, t) {
                    if (!e) return;
                    if ("string" == typeof e) return tc(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    "Object" === n && e.constructor && (n = e.constructor.name);
                    if ("Map" === n || "Set" === n) return Array.from(e);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return tc(e, t)
                }(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tc(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = new Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function nc(e, t) {
                var n = Object.keys(e);
                if (Object.getOwnPropertySymbols) {
                    var r = Object.getOwnPropertySymbols(e);
                    t && (r = r.filter((function(t) {
                        return Object.getOwnPropertyDescriptor(e, t).enumerable
                    }))), n.push.apply(n, r)
                }
                return n
            }

            function rc(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {};
                    t % 2 ? nc(Object(n), !0).forEach((function(t) {
                        oc(e, t, n[t])
                    })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(n)) : nc(Object(n)).forEach((function(t) {
                        Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(n, t))
                    }))
                }
                return e
            }

            function oc(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }
            var ic = {
                    isOpen: !0,
                    pageName: $s,
                    errorMessage: "",
                    origin: Di,
                    phone: "",
                    isPhoneVerified: !1,
                    phonePrefixPickerIndex: 0,
                    phonePrefixOptionsList: [],
                    shouldDiscoverabilityConsentDefaultYes: !1
                },
                ac = (0, t.createContext)(ic),
                sc = function(e, t) {
                    var n;
                    switch (t.type) {
                        case Ss:
                            return rc(rc({}, e), {}, {
                                phone: t.phone,
                                errorMessage: ""
                            });
                        case ws:
                            return rc(rc({}, e), {}, {
                                phonePrefixPickerIndex: t.phonePrefixPickerIndex,
                                errorMessage: ""
                            });
                        case xs:
                            return rc(rc({}, e), {}, {
                                errorMessage: t.errorMessage
                            });
                        case Ps:
                            return rc(rc({}, e), {}, {
                                errorMessage: "",
                                pageName: t.pageName
                            });
                        case Es:
                            return rc(rc({}, e), {}, {
                                isPhoneVerified: t.isPhoneVerified
                            });
                        case ks:
                            return rc(rc({}, e), {}, {
                                shouldPrefillAffirmativeDiscoverabilityConsent: null !== (n = null == t ? void 0 : t.shouldPrefillAffirmativeDiscoverabilityConsent) && void 0 !== n && n
                            });
                        case As:
                            return rc(rc({}, e), {}, {
                                phonePrefixOptionsList: t.phonePrefixOptionsList
                            });
                        case Os:
                            return rc(rc({}, e), {}, {
                                origin: t.origin
                            });
                        case bs:
                            return rc(rc({}, ic), {}, {
                                isOpen: !1,
                                errorMessage: ""
                            });
                        default:
                            return ic
                    }
                },
                cc = function(e) {
                    var n = e.children,
                        o = ec((0, t.useReducer)(sc, ic), 2),
                        i = o[0],
                        a = o[1];
                    return r().createElement(ac.Provider, {
                        value: {
                            phoneUpsellState: i,
                            dispatch: a
                        }
                    }, n)
                };

            function lc() {
                return (0, t.useContext)(ac)
            }
            cc.propTypes = {
                children: c().node.isRequired
            };
            var uc = Cs,
                fc = function(t) {
                    return e.httpService.get(t).then((function(e) {
                        var t, n, r = e.data,
                            o = r.find((function(e) {
                                return !0 === e.isDefault
                            })),
                            i = null !== (t = null == o ? void 0 : o.code) && void 0 !== t ? t : uc;
                        return r.filter((function(e) {
                            return e.code !== i || (n = e, !1)
                        })), n && r.unshift(n), r
                    }), (function(e) {
                        return !1
                    }))
                },
                pc = function() {
                    var e = {
                        retryable: !0,
                        withCredentials: !0,
                        url: "".concat(yi, "/phone-number-api/v1/phone-prefix-list")
                    };
                    return fc(e)
                },
                dc = function(t) {
                    var n = t.phone,
                        r = t.prefix,
                        o = t.countryCode,
                        i = {
                            retryable: !0,
                            withCredentials: !0,
                            url: "".concat(hi, "/v1/phone")
                        },
                        a = {
                            countryCode: o,
                            prefix: r,
                            phone: n
                        };
                    return e.httpService.post(i, a)
                },
                yc = function() {
                    var t = {
                            code: arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : ""
                        },
                        n = {
                            retryable: !0,
                            withCredentials: !0,
                            url: "".concat(hi, "/v1/phone/verify")
                        };
                    return e.httpService.post(n, t)
                },
                hc = function(t) {
                    var n = {
                            retryable: !0,
                            withCredentials: !0,
                            url: "".concat(hi, "/v1/phone/resend")
                        },
                        r = t;
                    return r || (r = {}), e.httpService.post(n, r).then((function(e) {
                        e.data;
                        return !0
                    }), (function(e) {
                        return !1
                    }))
                },
                mc = function() {
                    var t = {
                        retryable: !0,
                        withCredentials: !0,
                        url: "".concat(hi, "/v1/phone/delete")
                    };
                    return e.httpService.post(t, {})
                },
                gc = Ua,
                vc = La,
                bc = Ba,
                xc = qa,
                Sc = Va,
                wc = Fa,
                Pc = Na,
                Ec = Ls,
                Ac = Fs,
                Oc = qs,
                kc = Us,
                Cc = Bs,
                Rc = Vs,
                jc = Ws,
                Ic = function(e) {
                    switch (e) {
                        case Ec:
                            return gc;
                        case Ac:
                            return vc;
                        case kc:
                            return bc;
                        case Cc:
                            return xc;
                        case Oc:
                            return wc;
                        default:
                            return Sc
                    }
                },
                Tc = function(e) {
                    switch (e) {
                        case jc:
                            return vc;
                        case Rc:
                            return Pc;
                        default:
                            return Sc
                    }
                },
                Nc = function(e) {
                    switch (e) {
                        case $s:
                            return Ti;
                        case zs:
                            return Ni;
                        case Gs:
                            return Mi;
                        case Ys:
                            return _i;
                        default:
                            return ""
                    }
                };

            function Mc(e) {
                var t = e.translate,
                    n = lc().phoneUpsellState;
                return r().createElement("p", {
                    className: "input-field-error-text sms-code-error text-error modal-error-message"
                }, n.errorMessage ? t(n.errorMessage) : null)
            }
            Mc.propTypes = {
                translate: c().func.isRequired
            };
            var _c = Mc;

            function Dc(e, t, n, r, o, i, a) {
                try {
                    var s = e[i](a),
                        c = s.value
                } catch (e) {
                    return void n(e)
                }
                s.done ? t(c) : Promise.resolve(c).then(r, o)
            }

            function Uc(e) {
                var n, o, i = e.translate,
                    a = lc(),
                    s = a.phoneUpsellState,
                    c = a.dispatch,
                    l = Rs,
                    u = js,
                    f = s.phone,
                    p = s.phonePrefixPickerIndex,
                    d = s.phonePrefixOptionsList,
                    y = s.pageName,
                    h = s.origin,
                    m = Hs,
                    g = Nc(y);
                (0, t.useEffect)((function() {
                    function e() {
                        var t;
                        return t = regeneratorRuntime.mark((function e() {
                            var t;
                            return regeneratorRuntime.wrap((function(e) {
                                for (;;) switch (e.prev = e.next) {
                                    case 0:
                                        if (t = d, 0 !== d.length) {
                                            e.next = 6;
                                            break
                                        }
                                        return e.next = 4, pc();
                                    case 4:
                                        t = e.sent, c({
                                            type: As,
                                            phonePrefixOptionsList: t
                                        });
                                    case 6:
                                    case "end":
                                        return e.stop()
                                }
                            }), e)
                        })), e = function() {
                            var e = this,
                                n = arguments;
                            return new Promise((function(r, o) {
                                var i = t.apply(e, n);

                                function a(e) {
                                    Dc(i, r, o, a, s, "next", e)
                                }

                                function s(e) {
                                    Dc(i, r, o, a, s, "throw", e)
                                }
                                a(void 0)
                            }))
                        }, e.apply(this, arguments)
                    }! function() {
                        e.apply(this, arguments)
                    }()
                }), []);
                var v = null !== (n = null == d || null === (o = d[p]) || void 0 === o ? void 0 : o.prefix) && void 0 !== n ? n : "";
                return r().createElement("div", null, r().createElement("label", {
                    htmlFor: m
                }, r().createElement("p", {
                    className: "verification-code-label font-caption-header text-primary"
                }, i(Ia))), r().createElement("div", {
                    id: "upsell-phone",
                    className: "phone-number-input-container input-field form-control"
                }, r().createElement("div", {
                    id: "upsell-phonenumber",
                    className: "phone-input-row"
                }, r().createElement("span", {
                    className: "phone-prefix-wrapper"
                }, r().createElement("div", {
                    className: "phone-prefix-selected text"
                }, l(v)), r().createElement("select", {
                    className: "phone-prefix-dropdown input-field rbx-select",
                    onChange: function(e) {
                        return function(e) {
                            var t = e.target.value;
                            c({
                                type: ws,
                                phonePrefixPickerIndex: t
                            })
                        }(e)
                    },
                    onFocus: function() {
                        Zi(Xs.addPhonePrefixPressed, {
                            origin: h,
                            section: g
                        })
                    },
                    value: p
                }, d.map((function(e, t) {
                    return r().createElement("option", {
                        className: "prefix-option",
                        value: t
                    }, u(e.localizedName, e.prefix))
                })))), r().createElement("div", {
                    id: "upsell-phonenumber-divider",
                    className: "phone-divider"
                }), r().createElement("input", {
                    id: m,
                    type: "tel",
                    value: f,
                    className: "phone-input form-control",
                    placeholder: i(Ia),
                    autoComplete: "tel-national",
                    onChange: function(e) {
                        return c({
                            type: Ss,
                            phone: e.target.value
                        })
                    },
                    onFocus: function() {
                        Zi(Xs.addPhonePhoneNumberPressed, {
                            origin: h,
                            section: g
                        })
                    }
                }))))
            }
            Uc.propTypes = {
                translate: c().func.isRequired
            };
            var Lc = Uc;

            function Fc(e, t, n, r, o, i, a) {
                try {
                    var s = e[i](a),
                        c = s.value
                } catch (e) {
                    return void n(e)
                }
                s.done ? t(c) : Promise.resolve(c).then(r, o)
            }

            function Bc(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var n = [],
                        r = !0,
                        o = !1,
                        i = void 0;
                    try {
                        for (var a, s = e[Symbol.iterator](); !(r = (a = s.next()).done) && (n.push(a.value), !t || n.length !== t); r = !0);
                    } catch (e) {
                        o = !0, i = e
                    } finally {
                        try {
                            r || null == s.return || s.return()
                        } finally {
                            if (o) throw i
                        }
                    }
                    return n
                }(e, t) || function(e, t) {
                    if (!e) return;
                    if ("string" == typeof e) return qc(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    "Object" === n && e.constructor && (n = e.constructor.name);
                    if ("Map" === n || "Set" === n) return Array.from(e);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return qc(e, t)
                }(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function qc(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = new Array(t); n < t; n++) r[n] = e[n];
                return r
            }
            var Vc = Ea,
                Wc = Ma,
                Hc = Wa,
                Kc = Ha,
                $c = Ka,
                zc = $a,
                Gc = Za,
                Jc = Qa,
                Yc = Oa,
                Zc = Xa;

            function Qc(e) {
                var n = e.translate,
                    o = e.onHide,
                    i = e.existingPhoneNumber,
                    a = e.requireLegalTextCheckbox,
                    s = e.headingKey,
                    c = e.descriptionKey,
                    l = e.legalTextKey,
                    u = e.buttonKey,
                    f = lc(),
                    p = f.phoneUpsellState,
                    d = f.dispatch,
                    y = p.phone,
                    h = p.phonePrefixPickerIndex,
                    m = p.phonePrefixOptionsList,
                    g = p.pageName,
                    v = p.origin,
                    b = Bc((0, t.useState)(!1), 2),
                    x = b[0],
                    S = b[1],
                    w = Bc((0, t.useState)(!1), 2),
                    P = w[0],
                    E = w[1],
                    A = Nc(g),
                    O = function() {
                        var e, t = (e = regeneratorRuntime.mark((function e() {
                            var t, n, r;
                            return regeneratorRuntime.wrap((function(e) {
                                for (;;) switch (e.prev = e.next) {
                                    case 0:
                                        return S(!0), t = m[h], n = t.prefix, r = t.code, Zi(Xs.addPhoneContinuePressed, {
                                            origin: v,
                                            section: A
                                        }), e.next = 5, dc({
                                            phone: y,
                                            prefix: n,
                                            countryCode: r
                                        }).then((function() {
                                            d({
                                                type: Ps,
                                                pageName: zs
                                            })
                                        })).catch((function(e) {
                                            var t = vi(e),
                                                n = Qi(Xs.phoneNumberModalErrorShown, t);
                                            Zi(n, {
                                                origin: v,
                                                section: A
                                            }), d({
                                                type: xs,
                                                errorMessage: Ic(t)
                                            })
                                        })).finally((function() {
                                            S(!1)
                                        }));
                                    case 5:
                                    case "end":
                                        return e.stop()
                                }
                            }), e)
                        })), function() {
                            var t = this,
                                n = arguments;
                            return new Promise((function(r, o) {
                                var i = e.apply(t, n);

                                function a(e) {
                                    Fc(i, r, o, a, s, "next", e)
                                }

                                function s(e) {
                                    Fc(i, r, o, a, s, "throw", e)
                                }
                                a(void 0)
                            }))
                        });
                        return function() {
                            return t.apply(this, arguments)
                        }
                    }();
                return r().createElement("div", null, r().createElement(Tr.Modal.Header, {
                    useBaseBootstrapComponent: !0
                }, r().createElement("div", {
                    className: "verification-upsell-title-container"
                }, r().createElement(Tr.Modal.Title, {
                    id: "verification-upsell-modal-title"
                }, n(i ? $c : s))), r().createElement("button", {
                    type: "button",
                    className: "close close-button",
                    onClick: o
                }, r().createElement("span", {
                    className: "icon-close"
                }))), r().createElement(Tr.Modal.Body, null, r().createElement("div", {
                    className: "phone-number-submission-container"
                }, r().createElement("div", {
                    className: "verification-upsell-text-body text-description"
                }, n(i ? Zc : c)), i && r().createElement(r().Fragment, null, r().createElement("div", {
                    className: "verification-upsell-text-body text-description"
                }, n(Hc), " ", i), r().createElement("div", {
                    className: "border-warning two-step-warning"
                }, r().createElement("span", {
                    className: "icon-warning-orange"
                }), r().createElement("span", {
                    className: "small text-warning form-warning-text"
                }, n(Kc)))), r().createElement(Lc, {
                    translate: n
                }), r().createElement("div", {
                    className: "phone-verification-nonpublic-text text-description font-caption-body"
                }, n(Wc)), r().createElement(_c, {
                    translate: n
                }))), r().createElement(Tr.Modal.Footer, null, a ? r().createElement("div", {
                    className: "phone-verification-legal-container checkbox"
                }, r().createElement("input", {
                    id: "phone-verification-legal-checkbox",
                    className: "checkbox",
                    type: "checkbox",
                    checked: P,
                    onChange: function() {
                        return E(!P)
                    }
                }), r().createElement("label", {
                    className: "text-description font-caption-body phone-verification-legal-text",
                    htmlFor: "phone-verification-legal-checkbox"
                }, n(l))) : r().createElement("div", {
                    className: "text-description font-caption-body phone-verification-legal-text"
                }, n(l)), r().createElement("div", {
                    className: "buttons-section"
                }, r().createElement(Tr.Button, {
                    type: "button",
                    id: "add-phone-number-continue-button",
                    className: "accept-btn",
                    variant: Tr.Button.variants.primary,
                    isDisabled: x || 0 === y.length || a && !P,
                    onClick: function() {
                        return O()
                    }
                }, n(u))), r().createElement("div", null, i && r().createElement("span", {
                    className: "text-report remove-phone-label",
                    onClick: function() {
                        return d({
                            type: Ps,
                            pageName: Js
                        })
                    },
                    onKeyDown: function() {
                        return d({
                            type: Ps,
                            pageName: Js
                        })
                    },
                    role: "button",
                    tabIndex: 0
                }, n(zc)))))
            }
            Qc.propTypes = {
                translate: c().func.isRequired,
                onHide: c().func.isRequired,
                existingPhoneNumber: c().string,
                requireLegalTextCheckbox: c().bool,
                headingKey: c().string,
                descriptionKey: c().string,
                legalTextKey: c().string,
                buttonKey: c().string
            }, Qc.defaultProps = {
                existingPhoneNumber: null,
                requireLegalTextCheckbox: !1,
                headingKey: Vc,
                descriptionKey: Gc,
                legalTextKey: Jc,
                buttonKey: Yc
            };
            var Xc = Qc;

            function el(e) {
                var t = e.translate,
                    n = e.onHide,
                    o = e.headingKey,
                    i = e.descriptionKey,
                    a = lc().phoneUpsellState,
                    s = a.origin,
                    c = a.pageName,
                    l = wa,
                    u = Nc(c);
                return r().createElement("div", null, r().createElement(Tr.Modal.Body, null, r().createElement("div", {
                    className: "phone-number-verification-upsell-image"
                }), r().createElement("div", {
                    className: "verification-upsell-title-container phone-number-verification-success-page-title page-title"
                }, r().createElement(Tr.Modal.Title, {
                    id: "verification-upsell-modal-title"
                }, t(o))), r().createElement("div", {
                    className: "phone-number-verification-text-body text-description"
                }, t(i))), r().createElement(Tr.Modal.Footer, null, r().createElement("button", {
                    type: "button",
                    className: "btn-cta-md btn-max-width phone-number-verify-button",
                    onClick: function() {
                        Zi(Xs.phoneAddedDonePressed, {
                            origin: s,
                            section: u
                        }), n()
                    }
                }, t(l))))
            }
            el.propTypes = {
                translate: c().func.isRequired,
                onHide: c().func.isRequired,
                headingKey: c().string,
                descriptionKey: c().string
            }, el.defaultProps = {
                headingKey: _a,
                descriptionKey: Da
            };
            var tl = el,
                nl = function(e, t, n, r) {
                    return new(n || (n = Promise))((function(o, i) {
                        function a(e) {
                            try {
                                c(r.next(e))
                            } catch (e) {
                                i(e)
                            }
                        }

                        function s(e) {
                            try {
                                c(r.throw(e))
                            } catch (e) {
                                i(e)
                            }
                        }

                        function c(e) {
                            var t;
                            e.done ? o(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                                e(t)
                            }))).then(a, s)
                        }
                        c((r = r.apply(e, t || [])).next())
                    }))
                },
                rl = function(e, t) {
                    var n, r, o, i, a = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    };
                    return i = {
                        next: s(0),
                        throw: s(1),
                        return: s(2)
                    }, "function" == typeof Symbol && (i[Symbol.iterator] = function() {
                        return this
                    }), i;

                    function s(i) {
                        return function(s) {
                            return function(i) {
                                if (n) throw new TypeError("Generator is already executing.");
                                for (; a;) try {
                                    if (n = 1, r && (o = 2 & i[0] ? r.return : i[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, i[1])).done) return o;
                                    switch (r = 0, o && (i = [2 & i[0], o.value]), i[0]) {
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
                                            a.label++, r = i[1], i = [0];
                                            continue;
                                        case 7:
                                            i = a.ops.pop(), a.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = a.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== i[0] && 2 !== i[0])) {
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
                                    i = [6, e], r = 0
                                } finally {
                                    n = o = 0
                                }
                                if (5 & i[0]) throw i[1];
                                return {
                                    value: i[0] ? i[1] : void 0,
                                    done: !0
                                }
                            }([i, s])
                        }
                    }
                },
                ol = function(e) {
                    var n = e.onHide,
                        o = e.origin,
                        a = (0, t.useMemo)((function() {
                            switch (o) {
                                case Li:
                                    return "phone-verification-discoverability-upsell-in-account-info";
                                case Fi:
                                    return "phone-verification-discoverability-upsell-in-friend-discovery-setting";
                                case Ui:
                                    return "web-home-voice-phone-verification-upsell";
                                default:
                                    return "unknown-phone-verification-upsell"
                            }
                        }), [o]),
                        s = (0, t.useCallback)((function() {
                            return nl(void 0, void 0, void 0, (function() {
                                return rl(this, (function(e) {
                                    switch (e.label) {
                                        case 0:
                                            return [4, i.AccessManagementUpsellV2Service.startAccessManagementUpsell({
                                                featureName: "CanEnableFriendDiscovery",
                                                featureSpecificData: {
                                                    consentFormType: "notice",
                                                    surface: a,
                                                    context: o
                                                },
                                                namespace: "account_management/GDPRPolicy"
                                            }).finally(n)];
                                        case 1:
                                            return e.sent(), [2]
                                    }
                                }))
                            }))
                        }), []);
                    return (0, t.useEffect)((function() {
                        s()
                    }), []), r().createElement(r().Fragment, null)
                },
                il = _s,
                al = function(e) {
                    return e.replace(/[^0-9]/g, "").substring(0, il)
                };

            function sl(e, t) {
                var n = Object.keys(e);
                if (Object.getOwnPropertySymbols) {
                    var r = Object.getOwnPropertySymbols(e);
                    t && (r = r.filter((function(t) {
                        return Object.getOwnPropertyDescriptor(e, t).enumerable
                    }))), n.push.apply(n, r)
                }
                return n
            }

            function cl(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {};
                    t % 2 ? sl(Object(n), !0).forEach((function(t) {
                        ll(e, t, n[t])
                    })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(n)) : sl(Object(n)).forEach((function(t) {
                        Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(n, t))
                    }))
                }
                return e
            }

            function ll(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function ul(e, t, n, r, o, i, a) {
                try {
                    var s = e[i](a),
                        c = s.value
                } catch (e) {
                    return void n(e)
                }
                s.done ? t(c) : Promise.resolve(c).then(r, o)
            }

            function fl(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise((function(r, o) {
                        var i = e.apply(t, n);

                        function a(e) {
                            ul(i, r, o, a, s, "next", e)
                        }

                        function s(e) {
                            ul(i, r, o, a, s, "throw", e)
                        }
                        a(void 0)
                    }))
                }
            }

            function pl(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var n = [],
                        r = !0,
                        o = !1,
                        i = void 0;
                    try {
                        for (var a, s = e[Symbol.iterator](); !(r = (a = s.next()).done) && (n.push(a.value), !t || n.length !== t); r = !0);
                    } catch (e) {
                        o = !0, i = e
                    } finally {
                        try {
                            r || null == s.return || s.return()
                        } finally {
                            if (o) throw i
                        }
                    }
                    return n
                }(e, t) || function(e, t) {
                    if (!e) return;
                    if ("string" == typeof e) return dl(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    "Object" === n && e.constructor && (n = e.constructor.name);
                    if ("Map" === n || "Set" === n) return Array.from(e);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return dl(e, t)
                }(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function dl(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = new Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function yl(e) {
                var n = e.translate,
                    o = e.onHide,
                    i = e.onVerify,
                    a = lc(),
                    s = a.phoneUpsellState,
                    c = a.dispatch,
                    l = s.phone,
                    u = s.phonePrefixOptionsList,
                    f = s.phonePrefixPickerIndex,
                    p = s.pageName,
                    d = s.origin,
                    y = pl((0, t.useState)({
                        code: "",
                        isReadyToSubmitCode: ""
                    }), 2),
                    h = y[0],
                    m = y[1],
                    g = Nc(p),
                    v = pl((0, t.useState)(0), 2),
                    b = v[0],
                    x = v[1],
                    S = pl((0, t.useState)(!1), 2),
                    w = S[0],
                    P = S[1],
                    E = pl((0, t.useState)(!1), 2),
                    A = E[0],
                    O = E[1],
                    k = Ra,
                    C = Aa,
                    R = Pa,
                    j = ka,
                    I = Ca,
                    T = ja,
                    N = Ta,
                    M = Ks,
                    _ = Ts,
                    D = _s,
                    U = Ns,
                    L = Ms,
                    F = Ds,
                    B = Is(u[f].prefix, l);

                function q() {
                    return (q = fl(regeneratorRuntime.mark((function e() {
                        var t, n, r;
                        return regeneratorRuntime.wrap((function(e) {
                            for (;;) switch (e.prev = e.next) {
                                case 0:
                                    if (Zi(Xs.verifyPhoneContinuePressed, {
                                            origin: d,
                                            section: g
                                        }), h.code.length === D) {
                                        e.next = 3;
                                        break
                                    }
                                    return e.abrupt("return");
                                case 3:
                                    return P(!0), c({
                                        type: xs,
                                        errorMessage: ""
                                    }), e.prev = 5, e.next = 8, yc(h.code);
                                case 8:
                                    return c({
                                        type: Es,
                                        isPhoneVerified: !0
                                    }), e.next = 11, i();
                                case 11:
                                    e.next = 20;
                                    break;
                                case 13:
                                    e.prev = 13, e.t0 = e.catch(5), t = vi(e.t0), n = Tc(t), r = Qi(Xs.phoneNumberModalErrorShown, t), Zi(r, {
                                        origin: d,
                                        section: g
                                    }), c({
                                        type: xs,
                                        errorMessage: n
                                    });
                                case 20:
                                    return e.prev = 20, m(cl(cl({}, h), {}, {
                                        isReadyToSubmitCode: !1
                                    })), P(!1), e.finish(20);
                                case 24:
                                case "end":
                                    return e.stop()
                            }
                        }), e, null, [
                            [5, 13, 20, 24]
                        ])
                    })))).apply(this, arguments)
                }
                return (0, t.useEffect)((function() {
                    h.isReadyToSubmitCode && function() {
                        q.apply(this, arguments)
                    }()
                }), [h]), (0, t.useEffect)((function() {
                    function e() {
                        return (e = fl(regeneratorRuntime.mark((function e() {
                            return regeneratorRuntime.wrap((function(e) {
                                for (;;) switch (e.prev = e.next) {
                                    case 0:
                                        return e.next = 2, bi();
                                    case 2:
                                        e.sent.displayPhoneVerificationResendButton ? O(!0) : O(!1);
                                    case 4:
                                    case "end":
                                        return e.stop()
                                }
                            }), e)
                        })))).apply(this, arguments)
                    }! function() {
                        e.apply(this, arguments)
                    }()
                }), []), r().createElement("div", null, r().createElement(Tr.Modal.Header, {
                    useBaseBootstrapComponent: !0
                }, r().createElement("div", {
                    className: "verification-upsell-title-container"
                }, r().createElement(Tr.Modal.Title, {
                    id: "verification-upsell-modal-title"
                }, n(k))), r().createElement("button", {
                    type: "button",
                    className: "close close-button",
                    onClick: o
                }, r().createElement("span", {
                    className: "icon-close"
                }))), r().createElement(Tr.Modal.Body, null, r().createElement("div", {
                    className: "phone-number-verification-upsell-image"
                }), r().createElement("div", {
                    className: "verification-upsell-text-body text-description"
                }, n(T, {
                    phoneNumber: B
                })), r().createElement("button", {
                    type: "button",
                    className: "phone-number-change-number-button phone-number-text-button",
                    onClick: function() {
                        Zi(Xs.verifyPhoneChangePhoneNumberPressed, {
                            origin: d,
                            section: g
                        }), c({
                            type: Ps,
                            pageName: $s
                        })
                    }
                }, n(C)), r().createElement("label", {
                    htmlFor: M
                }, r().createElement("p", {
                    className: "verification-code-label font-caption-header text-primary"
                }, n(N))), r().createElement("input", {
                    id: M,
                    type: "text",
                    inputMode: "numeric",
                    className: "".concat(s.errorMessage ? "input-field-error" : "", " form-control input-field input-number verification-code-input"),
                    onChange: function(e) {
                        return t = e.target.value, c({
                            type: xs,
                            errorMessage: ""
                        }), void m(cl(cl({}, h), {}, {
                            code: al(t)
                        }));
                        var t
                    },
                    onPaste: function(e) {
                        var t = (e.clipboardData || window.clipboardData).getData("text"),
                            n = al(t);
                        m({
                            code: n,
                            isReadyToSubmitCode: !0
                        })
                    },
                    autoComplete: "one-time-code",
                    placeholder: "000000",
                    onKeyDown: function(e) {
                        e.key === _ && m(cl(cl({}, h), {}, {
                            isReadyToSubmitCode: !0
                        }))
                    },
                    onFocus: function() {
                        Zi(Xs.verifyPhoneCodeFieldPressed, {
                            origin: d,
                            section: g
                        })
                    },
                    value: h.code
                }), r().createElement(_c, {
                    translate: n
                })), r().createElement(Tr.Modal.Footer, null, r().createElement("button", {
                    type: "button",
                    className: "btn-cta-md btn-max-width phone-number-verify-button",
                    disabled: w || 6 !== h.code.length,
                    onClick: function() {
                        m(cl(cl({}, h), {}, {
                            isReadyToSubmitCode: !0
                        }))
                    }
                }, n(R)), A ? 0 === b ? r().createElement("button", {
                    type: "button",
                    className: " btn-secondary-md btn-max-width phone-number-resent-button",
                    disabled: w,
                    onClick: function() {
                        Zi(Xs.verifyPhoneResendPressed, {
                            origin: d,
                            section: g
                        }), 0 === b && (hc(), function() {
                            if (0 === b) var e = setInterval((function() {
                                x((function(t) {
                                    return 1 === t && clearInterval(e), t - 1
                                }))
                            }), 1e3);
                            x(F)
                        }())
                    }
                }, n(j)) : r().createElement("button", {
                    type: "button",
                    className: " btn-secondary-md btn-max-width phone-number-resent-button btn-max-width resend-button-disabled"
                }, n(I), r().createElement("span", null, U + b + L)) : null))
            }
            yl.propTypes = {
                translate: c().func.isRequired,
                onHide: c().func.isRequired,
                onVerify: c().func.isRequired
            };
            var hl = yl;

            function ml(e, t, n, r, o, i, a) {
                try {
                    var s = e[i](a),
                        c = s.value
                } catch (e) {
                    return void n(e)
                }
                s.done ? t(c) : Promise.resolve(c).then(r, o)
            }

            function gl(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var n = [],
                        r = !0,
                        o = !1,
                        i = void 0;
                    try {
                        for (var a, s = e[Symbol.iterator](); !(r = (a = s.next()).done) && (n.push(a.value), !t || n.length !== t); r = !0);
                    } catch (e) {
                        o = !0, i = e
                    } finally {
                        try {
                            r || null == s.return || s.return()
                        } finally {
                            if (o) throw i
                        }
                    }
                    return n
                }(e, t) || function(e, t) {
                    if (!e) return;
                    if ("string" == typeof e) return vl(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    "Object" === n && e.constructor && (n = e.constructor.name);
                    if ("Map" === n || "Set" === n) return Array.from(e);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return vl(e, t)
                }(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function vl(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = new Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function bl(e) {
                var n = e.translate,
                    o = e.existingPhoneNumber,
                    i = e.onHide,
                    a = lc().dispatch,
                    s = za,
                    c = Ya,
                    l = Ga,
                    u = Ja,
                    f = gl((0, t.useState)(!1), 2),
                    p = f[0],
                    d = f[1],
                    y = function() {
                        var e, t = (e = regeneratorRuntime.mark((function e() {
                            return regeneratorRuntime.wrap((function(e) {
                                for (;;) switch (e.prev = e.next) {
                                    case 0:
                                        return d(!0), e.next = 3, mc().then((function() {
                                            i()
                                        })).catch((function(e) {
                                            var t = vi(e);
                                            a({
                                                type: xs,
                                                errorMessage: Ic(t)
                                            })
                                        })).finally((function() {
                                            d(!1)
                                        }));
                                    case 3:
                                    case "end":
                                        return e.stop()
                                }
                            }), e)
                        })), function() {
                            var t = this,
                                n = arguments;
                            return new Promise((function(r, o) {
                                var i = e.apply(t, n);

                                function a(e) {
                                    ml(i, r, o, a, s, "next", e)
                                }

                                function s(e) {
                                    ml(i, r, o, a, s, "throw", e)
                                }
                                a(void 0)
                            }))
                        });
                        return function() {
                            return t.apply(this, arguments)
                        }
                    }(),
                    h = o.match(/\d+$/);
                return r().createElement("div", null, r().createElement(Tr.Modal.Header, {
                    useBaseBootstrapComponent: !0
                }, r().createElement("div", {
                    className: "verification-upsell-title-container"
                }, r().createElement(Tr.Modal.Title, {
                    id: "verification-upsell-modal-title"
                }, n(s))), r().createElement("button", {
                    type: "button",
                    className: "close close-button",
                    onClick: i
                }, r().createElement("span", {
                    className: "icon-close"
                }))), r().createElement(Tr.Modal.Body, null, r().createElement("div", {
                    className: "phone-number-verification-text-body text-description"
                }, n(c, {
                    phoneLast4: h
                }))), r().createElement(Tr.Modal.Footer, null, r().createElement(_c, {
                    translate: n
                }), r().createElement(Tr.Button, {
                    className: "delete-phone-btn",
                    variant: Tr.Button.variants.primary,
                    size: Tr.Button.sizes.medium,
                    isLoading: p,
                    onClick: y
                }, n(l)), r().createElement(Tr.Button, {
                    variant: Tr.Button.variants.secondary,
                    size: Tr.Button.sizes.medium,
                    isLoading: p,
                    onClick: i
                }, n(u))))
            }
            bl.propTypes = {
                translate: c().func.isRequired,
                onHide: c().func.isRequired,
                existingPhoneNumber: c().string
            }, bl.defaultProps = {
                existingPhoneNumber: null
            };
            var xl = bl,
                Sl = function() {
                    var t = {
                        retryable: !0,
                        withCredentials: !0,
                        url: "".concat(yi, "/user-settings-api/v1/user-settings/metadata")
                    };
                    return e.httpService.get(t).then((function(e) {
                        return e.data
                    }), (function(e) {
                        return null
                    }))
                };

            function wl(e, t, n, r, o, i, a) {
                try {
                    var s = e[i](a),
                        c = s.value
                } catch (e) {
                    return void n(e)
                }
                s.done ? t(c) : Promise.resolve(c).then(r, o)
            }
            var Pl = function() {
                var e, t = (e = regeneratorRuntime.mark((function e() {
                    var t, n, r;
                    return regeneratorRuntime.wrap((function(e) {
                        for (;;) switch (e.prev = e.next) {
                            case 0:
                                return t = Gs, n = !1, e.next = 4, Sl();
                            case 4:
                                return !0 === (null == (r = e.sent) ? void 0 : r.isDiscoverabilitySettingsEnabled) && !0 === (null == r ? void 0 : r.showDiscoverabilityUpsells) && (t = Ys, n = !0 === (null == r ? void 0 : r.prefillDiscoverabilitySetting)), e.abrupt("return", {
                                    successPage: t,
                                    shouldPrefillAffirmativeDiscoverabilityConsent: n
                                });
                            case 7:
                            case "end":
                                return e.stop()
                        }
                    }), e)
                })), function() {
                    var t = this,
                        n = arguments;
                    return new Promise((function(r, o) {
                        var i = e.apply(t, n);

                        function a(e) {
                            wl(i, r, o, a, s, "next", e)
                        }

                        function s(e) {
                            wl(i, r, o, a, s, "throw", e)
                        }
                        a(void 0)
                    }))
                });
                return function() {
                    return t.apply(this, arguments)
                }
            }();

            function El(e, t, n, r, o, i, a) {
                try {
                    var s = e[i](a),
                        c = s.value
                } catch (e) {
                    return void n(e)
                }
                s.done ? t(c) : Promise.resolve(c).then(r, o)
            }

            function Al(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise((function(r, o) {
                        var i = e.apply(t, n);

                        function a(e) {
                            El(i, r, o, a, s, "next", e)
                        }

                        function s(e) {
                            El(i, r, o, a, s, "throw", e)
                        }
                        a(void 0)
                    }))
                }
            }

            function Ol(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var n = [],
                        r = !0,
                        o = !1,
                        i = void 0;
                    try {
                        for (var a, s = e[Symbol.iterator](); !(r = (a = s.next()).done) && (n.push(a.value), !t || n.length !== t); r = !0);
                    } catch (e) {
                        o = !0, i = e
                    } finally {
                        try {
                            r || null == s.return || s.return()
                        } finally {
                            if (o) throw i
                        }
                    }
                    return n
                }(e, t) || function(e, t) {
                    if (!e) return;
                    if ("string" == typeof e) return kl(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    "Object" === n && e.constructor && (n = e.constructor.name);
                    if ("Map" === n || "Set" === n) return Array.from(e);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return kl(e, t)
                }(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function kl(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = new Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function Cl(e) {
                var n = e.translate,
                    o = e.onClose,
                    i = e.origin,
                    a = e.existingPhoneNumber,
                    s = e.addPhoneRequireLegalTextCheckbox,
                    c = e.addPhoneHeadingKey,
                    l = e.addPhoneDescriptionKey,
                    u = e.addPhoneLegalTextKey,
                    f = e.addPhoneButtonKey,
                    p = e.beforeSuccess,
                    d = e.renderInWebview,
                    y = lc(),
                    h = y.phoneUpsellState,
                    m = y.dispatch,
                    g = Ol((0, t.useState)(Gs), 2),
                    v = g[0],
                    b = g[1],
                    x = Ol((0, t.useState)(void 0), 2),
                    S = x[0],
                    w = x[1],
                    P = Ol((0, t.useState)(void 0), 2),
                    E = P[0],
                    A = P[1],
                    O = Nc(h.pageName),
                    k = function() {
                        Zi(Xs.phoneNumberModalDismissed, {
                            origin: h.origin,
                            section: O
                        }), o(h.isPhoneVerified), m({
                            type: bs
                        })
                    },
                    C = function() {
                        var e = Al(regeneratorRuntime.mark((function e() {
                            var t, n, r, o;
                            return regeneratorRuntime.wrap((function(e) {
                                for (;;) switch (e.prev = e.next) {
                                    case 0:
                                        if (!p) {
                                            e.next = 15;
                                            break
                                        }
                                        return e.prev = 1, e.next = 4, p();
                                    case 4:
                                        t = e.sent, n = Ol(t, 2), r = n[0], o = n[1], w(r), A(o), e.next = 15;
                                        break;
                                    case 12:
                                        e.prev = 12, e.t0 = e.catch(1), console.error("Error from before success hook in phone verification: ".concat(e.t0), e.t0);
                                    case 15:
                                        m({
                                            type: Ps,
                                            pageName: v
                                        });
                                    case 16:
                                    case "end":
                                        return e.stop()
                                }
                            }), e, null, [
                                [1, 12]
                            ])
                        })));
                        return function() {
                            return e.apply(this, arguments)
                        }
                    }();
                return (0, t.useEffect)((function() {
                    h.origin !== Di && Zi(Xs.phoneNumberModalShown, {
                        origin: h.origin,
                        section: O
                    })
                }), [h.pageName, h.origin]), (0, t.useEffect)((function() {
                    m({
                        type: Os,
                        origin: i
                    })
                }), []), (0, t.useEffect)((function() {
                    function e() {
                        return (e = Al(regeneratorRuntime.mark((function e() {
                            var t, n, r;
                            return regeneratorRuntime.wrap((function(e) {
                                for (;;) switch (e.prev = e.next) {
                                    case 0:
                                        return e.next = 2, Pl();
                                    case 2:
                                        t = e.sent, n = t.successPage, r = t.shouldPrefillAffirmativeDiscoverabilityConsent, m({
                                            type: ks,
                                            shouldPrefillAffirmativeDiscoverabilityConsent: r
                                        }), b(n);
                                    case 7:
                                    case "end":
                                        return e.stop()
                                }
                            }), e)
                        })))).apply(this, arguments)
                    }
                    i !== Bi && function() {
                        e.apply(this, arguments)
                    }()
                }), []), r().createElement(Tr.Modal, {
                    show: h.isOpen,
                    onHide: k,
                    className: d ? "phone-verification-webview" : "verification-modal",
                    size: "lg",
                    "aria-labelledby": "verification-upsell-modal-title",
                    scrollable: "true",
                    centered: "true"
                }, function() {
                    switch (h.pageName) {
                        case $s:
                            return r().createElement(Xc, {
                                translate: n,
                                onHide: k,
                                existingPhoneNumber: a,
                                requireLegalTextCheckbox: s,
                                headingKey: c,
                                descriptionKey: l,
                                legalTextKey: u,
                                buttonKey: f
                            });
                        case zs:
                            return r().createElement(hl, {
                                translate: n,
                                onHide: k,
                                onVerify: C
                            });
                        case Gs:
                            return r().createElement(tl, {
                                translate: n,
                                onHide: k,
                                headingKey: S,
                                descriptionKey: E
                            });
                        case Js:
                            return r().createElement(xl, {
                                translate: n,
                                existingPhoneNumber: a,
                                onHide: k
                            });
                        case Ys:
                            return r().createElement(ol, {
                                onHide: k,
                                origin: i
                            });
                        default:
                            return r().createElement(Xc, {
                                translate: n,
                                onHide: k
                            })
                    }
                }())
            }
            Cl.propTypes = {
                translate: c().func.isRequired,
                onClose: c().func.isRequired,
                origin: c().string,
                existingPhoneNumber: c().string,
                addPhoneRequireLegalTextCheckbox: c().bool,
                addPhoneHeadingKey: c().string,
                addPhoneDescriptionKey: c().string,
                addPhoneLegalTextKey: c().string,
                addPhoneButtonKey: c().string,
                beforeSuccess: c().func,
                renderInWebview: c().bool
            }, Cl.defaultProps = {
                origin: Ui,
                existingPhoneNumber: null,
                addPhoneRequireLegalTextCheckbox: void 0,
                addPhoneHeadingKey: void 0,
                addPhoneDescriptionKey: void 0,
                addPhoneLegalTextKey: void 0,
                addPhoneButtonKey: void 0,
                beforeSuccess: null,
                renderInWebview: !1
            };
            var Rl = Cl;

            function jl(e) {
                var t = e.translate,
                    n = e.onClose,
                    o = e.origin,
                    i = e.existingPhoneNumber,
                    a = e.addPhoneRequireLegalTextCheckbox,
                    s = e.addPhoneHeadingKey,
                    c = e.addPhoneDescriptionKey,
                    l = e.addPhoneLegalTextKey,
                    u = e.addPhoneButtonKey,
                    f = e.beforeSuccess,
                    p = e.renderInWebview;
                return r().createElement(cc, null, r().createElement(Rl, {
                    translate: t,
                    onClose: n,
                    origin: o,
                    existingPhoneNumber: i,
                    addPhoneRequireLegalTextCheckbox: a,
                    addPhoneHeadingKey: s,
                    addPhoneDescriptionKey: c,
                    addPhoneLegalTextKey: l,
                    addPhoneButtonKey: u,
                    beforeSuccess: f,
                    renderInWebview: p
                }))
            }
            jl.propTypes = {
                translate: c().func.isRequired,
                origin: c().string,
                onClose: c().func,
                existingPhoneNumber: c().string,
                addPhoneRequireLegalTextCheckbox: c().bool,
                addPhoneHeadingKey: c().string,
                addPhoneDescriptionKey: c().string,
                addPhoneLegalTextKey: c().string,
                addPhoneButtonKey: c().string,
                beforeSuccess: c().func,
                renderInWebview: c().bool
            }, jl.defaultProps = {
                origin: void 0,
                onClose: function() {
                    return null
                },
                existingPhoneNumber: null,
                addPhoneRequireLegalTextCheckbox: void 0,
                addPhoneHeadingKey: void 0,
                addPhoneDescriptionKey: void 0,
                addPhoneLegalTextKey: void 0,
                addPhoneButtonKey: void 0,
                beforeSuccess: void 0,
                renderInWebview: void 0
            };
            var Il = (0, l.withTranslations)(jl, eo);
            a().UpsellService = {
                renderEmailUpsell: function(t) {
                    (0, e.ready)((function() {
                        var e = document.getElementById(Xr);
                        e && ((0, o.unmountComponentAtNode)(e), (0, o.render)(r().createElement(ua, null), e), Ci(t))
                    }))
                },
                renderPhoneUpsell: function() {
                    var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                        n = t.onClose,
                        i = t.origin,
                        a = t.existingPhoneNumber,
                        s = t.addPhoneRequireLegalTextCheckbox,
                        c = t.addPhoneHeadingKey,
                        l = t.addPhoneDescriptionKey,
                        u = t.addPhoneLegalTextKey,
                        f = t.addPhoneButtonKey,
                        p = t.beforeSuccess,
                        d = t.containerId,
                        y = t.renderInWebview;
                    (0, e.ready)((function() {
                        var e = document.getElementById(null != d ? d : "phoneVerificationUpsell-container");
                        e && ((0, o.unmountComponentAtNode)(e), (0, o.render)(r().createElement(Il, {
                            onClose: n,
                            origin: i,
                            existingPhoneNumber: a,
                            addPhoneRequireLegalTextCheckbox: s,
                            addPhoneHeadingKey: c,
                            addPhoneDescriptionKey: l,
                            addPhoneLegalTextKey: u,
                            addPhoneButtonKey: f,
                            beforeSuccess: p,
                            renderInWebview: y
                        }), e))
                    }))
                },
                renderContactMethodPromptModal: function(t) {
                    var n = t.origin,
                        i = t.section;
                    (0, e.ready)((function() {
                        var e = document.getElementById("contactMethodPrompt-container");
                        e && ((0, o.unmountComponentAtNode)(e), (0, o.render)(r().createElement(vs, {
                            origin: n,
                            section: i
                        }), e))
                    }))
                },
                renderAgeEstimationPromptModal: function() {
                    (0, e.ready)((function() {
                        var e = document.getElementById("ageEstimationPrompt-container");
                        e && ((0, o.unmountComponentAtNode)(e), (0, o.render)(r().createElement(no, null), e))
                    }))
                }
            }, a().EmailVerificationService = {
                handleUserEmailUpsellAtLogout: Oi,
                handleUserEmailUpsellAtBuyRobux: function(e) {
                    return Pi({
                        origin: bo,
                        skipCallback: e
                    })
                },
                handleUserEmailUpsellOnHomePage: Ci,
                handleUserEmailVerificationRequiredByPurchaseWarning: function() {
                    return Pi({
                        origin: wo,
                        requireVerification: !0
                    })
                },
                handleUserEmailUpsellAtPremiumSubscription: function(e) {
                    return Pi({
                        origin: So,
                        skipCallback: e
                    })
                },
                handleUserEmailVerificationRequiredByBan: function() {
                    return Pi({
                        origin: Po,
                        requireVerification: !0
                    })
                },
                openLogoutEmailUpsellModal: ki
            }, (0, e.ready)((function() {
                document.getElementById(Xr) && (0, o.render)(r().createElement(ua, null), document.getElementById(Xr))
            }))
        }()
}();
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/0496e6f027d123bf2dde32fbb8302e40-verificationUpsell.bundle.min.js.map

/* Bundle detector */
window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("VerificationUpsell");