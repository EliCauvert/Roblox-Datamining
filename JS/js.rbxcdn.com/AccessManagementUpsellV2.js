/*! For license information please see accessManagementUpsellV2.bundle.min.js.LICENSE.txt */ ! function() {
    var e = {
            5084: function(e) {
                "use strict";
                var t = {
                    single_source_shortest_paths: function(e, n, r) {
                        var o = {},
                            a = {};
                        a[n] = 0;
                        var i, l, c, s, u, d, f, p = t.PriorityQueue.make();
                        for (p.push(n, 0); !p.empty();)
                            for (c in l = (i = p.pop()).value, s = i.cost, u = e[l] || {}) u.hasOwnProperty(c) && (d = s + u[c], f = a[c], (void 0 === a[c] || f > d) && (a[c] = d, p.push(c, d), o[c] = l));
                        if (void 0 !== r && void 0 === a[r]) {
                            var y = ["Could not find a path from ", n, " to ", r, "."].join("");
                            throw new Error(y)
                        }
                        return o
                    },
                    extract_shortest_path_from_predecessor_list: function(e, t) {
                        for (var n = [], r = t; r;) n.push(r), e[r], r = e[r];
                        return n.reverse(), n
                    },
                    find_path: function(e, n, r) {
                        var o = t.single_source_shortest_paths(e, n, r);
                        return t.extract_shortest_path_from_predecessor_list(o, r)
                    },
                    PriorityQueue: {
                        make: function(e) {
                            var n, r = t.PriorityQueue,
                                o = {};
                            for (n in e = e || {}, r) r.hasOwnProperty(n) && (o[n] = r[n]);
                            return o.queue = [], o.sorter = e.sorter || r.default_sorter, o
                        },
                        default_sorter: function(e, t) {
                            return e.cost - t.cost
                        },
                        push: function(e, t) {
                            var n = {
                                value: e,
                                cost: t
                            };
                            this.queue.push(n), this.queue.sort(this.sorter)
                        },
                        pop: function() {
                            return this.queue.shift()
                        },
                        empty: function() {
                            return 0 === this.queue.length
                        }
                    }
                };
                e.exports = t
            },
            5717: function(e) {
                "use strict";
                e.exports = function(e) {
                    for (var t = [], n = e.length, r = 0; r < n; r++) {
                        var o = e.charCodeAt(r);
                        if (o >= 55296 && o <= 56319 && n > r + 1) {
                            var a = e.charCodeAt(r + 1);
                            a >= 56320 && a <= 57343 && (o = 1024 * (o - 55296) + a - 56320 + 65536, r += 1)
                        }
                        o < 128 ? t.push(o) : o < 2048 ? (t.push(o >> 6 | 192), t.push(63 & o | 128)) : o < 55296 || o >= 57344 && o < 65536 ? (t.push(o >> 12 | 224), t.push(o >> 6 & 63 | 128), t.push(63 & o | 128)) : o >= 65536 && o <= 1114111 ? (t.push(o >> 18 | 240), t.push(o >> 12 & 63 | 128), t.push(o >> 6 & 63 | 128), t.push(63 & o | 128)) : t.push(239, 191, 189)
                    }
                    return new Uint8Array(t).buffer
                }
            },
            8779: function(e, t, n) {
                "use strict";
                var r = n(1594);
                var o = "function" == typeof Object.is ? Object.is : function(e, t) {
                        return e === t && (0 !== e || 1 / e == 1 / t) || e != e && t != t
                    },
                    a = r.useState,
                    i = r.useEffect,
                    l = r.useLayoutEffect,
                    c = r.useDebugValue;

                function s(e) {
                    var t = e.getSnapshot;
                    e = e.value;
                    try {
                        var n = t();
                        return !o(e, n)
                    } catch (e) {
                        return !0
                    }
                }
                var u = "undefined" == typeof window || void 0 === window.document || void 0 === window.document.createElement ? function(e, t) {
                    return t()
                } : function(e, t) {
                    var n = t(),
                        r = a({
                            inst: {
                                value: n,
                                getSnapshot: t
                            }
                        }),
                        o = r[0].inst,
                        u = r[1];
                    return l((function() {
                        o.value = n, o.getSnapshot = t, s(o) && u({
                            inst: o
                        })
                    }), [e, n, t]), i((function() {
                        return s(o) && u({
                            inst: o
                        }), e((function() {
                            s(o) && u({
                                inst: o
                            })
                        }))
                    }), [e]), c(n), n
                };
                t.useSyncExternalStore = void 0 !== r.useSyncExternalStore ? r.useSyncExternalStore : u
            },
            7320: function(e, t, n) {
                "use strict";
                var r = n(1594),
                    o = n(3676);
                var a = "function" == typeof Object.is ? Object.is : function(e, t) {
                        return e === t && (0 !== e || 1 / e == 1 / t) || e != e && t != t
                    },
                    i = o.useSyncExternalStore,
                    l = r.useRef,
                    c = r.useEffect,
                    s = r.useMemo,
                    u = r.useDebugValue;
                t.useSyncExternalStoreWithSelector = function(e, t, n, r, o) {
                    var d = l(null);
                    if (null === d.current) {
                        var f = {
                            hasValue: !1,
                            value: null
                        };
                        d.current = f
                    } else f = d.current;
                    d = s((function() {
                        function e(e) {
                            if (!c) {
                                if (c = !0, i = e, e = r(e), void 0 !== o && f.hasValue) {
                                    var t = f.value;
                                    if (o(t, e)) return l = t
                                }
                                return l = e
                            }
                            if (t = l, a(i, e)) return t;
                            var n = r(e);
                            return void 0 !== o && o(t, n) ? t : (i = e, l = n)
                        }
                        var i, l, c = !1,
                            s = void 0 === n ? null : n;
                        return [function() {
                            return e(t())
                        }, null === s ? void 0 : function() {
                            return e(s())
                        }]
                    }), [t, n, r, o]);
                    var p = i(e, d[0], d[1]);
                    return c((function() {
                        f.hasValue = !0, f.value = p
                    }), [p]), u(p), p
                }
            },
            3676: function(e, t, n) {
                "use strict";
                e.exports = n(8779)
            },
            5390: function(e, t, n) {
                "use strict";
                e.exports = n(7320)
            },
            2056: function(e, t, n) {
                "use strict";
                var r = n(8922),
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
                    a = {
                        name: !0,
                        length: !0,
                        prototype: !0,
                        caller: !0,
                        callee: !0,
                        arguments: !0,
                        arity: !0
                    },
                    i = {
                        $$typeof: !0,
                        compare: !0,
                        defaultProps: !0,
                        displayName: !0,
                        propTypes: !0,
                        type: !0
                    },
                    l = {};

                function c(e) {
                    return r.isMemo(e) ? i : l[e.$$typeof] || o
                }
                l[r.ForwardRef] = {
                    $$typeof: !0,
                    render: !0,
                    defaultProps: !0,
                    displayName: !0,
                    propTypes: !0
                }, l[r.Memo] = i;
                var s = Object.defineProperty,
                    u = Object.getOwnPropertyNames,
                    d = Object.getOwnPropertySymbols,
                    f = Object.getOwnPropertyDescriptor,
                    p = Object.getPrototypeOf,
                    y = Object.prototype;
                e.exports = function e(t, n, r) {
                    if ("string" != typeof n) {
                        if (y) {
                            var o = p(n);
                            o && o !== y && e(t, o, r)
                        }
                        var i = u(n);
                        d && (i = i.concat(d(n)));
                        for (var l = c(t), h = c(n), m = 0; m < i.length; ++m) {
                            var v = i[m];
                            if (!(a[v] || r && r[v] || h && h[v] || l && l[v])) {
                                var g = f(n, v);
                                try {
                                    s(t, v, g)
                                } catch (e) {}
                            }
                        }
                    }
                    return t
                }
            },
            8326: function(e, t) {
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
                    a = r ? Symbol.for("react.portal") : 60106,
                    i = r ? Symbol.for("react.fragment") : 60107,
                    l = r ? Symbol.for("react.strict_mode") : 60108,
                    c = r ? Symbol.for("react.profiler") : 60114,
                    s = r ? Symbol.for("react.provider") : 60109,
                    u = r ? Symbol.for("react.context") : 60110,
                    d = r ? Symbol.for("react.async_mode") : 60111,
                    f = r ? Symbol.for("react.concurrent_mode") : 60111,
                    p = r ? Symbol.for("react.forward_ref") : 60112,
                    y = r ? Symbol.for("react.suspense") : 60113,
                    h = r ? Symbol.for("react.suspense_list") : 60120,
                    m = r ? Symbol.for("react.memo") : 60115,
                    v = r ? Symbol.for("react.lazy") : 60116,
                    g = r ? Symbol.for("react.block") : 60121,
                    b = r ? Symbol.for("react.fundamental") : 60117,
                    C = r ? Symbol.for("react.responder") : 60118,
                    w = r ? Symbol.for("react.scope") : 60119;

                function S(e) {
                    if ("object" === n(e) && null !== e) {
                        var t = e.$$typeof;
                        switch (t) {
                            case o:
                                switch (e = e.type) {
                                    case d:
                                    case f:
                                    case i:
                                    case c:
                                    case l:
                                    case y:
                                        return e;
                                    default:
                                        switch (e = e && e.$$typeof) {
                                            case u:
                                            case p:
                                            case v:
                                            case m:
                                            case s:
                                                return e;
                                            default:
                                                return t
                                        }
                                }
                            case a:
                                return t
                        }
                    }
                }

                function E(e) {
                    return S(e) === f
                }
                t.AsyncMode = d, t.ConcurrentMode = f, t.ContextConsumer = u, t.ContextProvider = s, t.Element = o, t.ForwardRef = p, t.Fragment = i, t.Lazy = v, t.Memo = m, t.Portal = a, t.Profiler = c, t.StrictMode = l, t.Suspense = y, t.isAsyncMode = function(e) {
                    return E(e) || S(e) === d
                }, t.isConcurrentMode = E, t.isContextConsumer = function(e) {
                    return S(e) === u
                }, t.isContextProvider = function(e) {
                    return S(e) === s
                }, t.isElement = function(e) {
                    return "object" === n(e) && null !== e && e.$$typeof === o
                }, t.isForwardRef = function(e) {
                    return S(e) === p
                }, t.isFragment = function(e) {
                    return S(e) === i
                }, t.isLazy = function(e) {
                    return S(e) === v
                }, t.isMemo = function(e) {
                    return S(e) === m
                }, t.isPortal = function(e) {
                    return S(e) === a
                }, t.isProfiler = function(e) {
                    return S(e) === c
                }, t.isStrictMode = function(e) {
                    return S(e) === l
                }, t.isSuspense = function(e) {
                    return S(e) === y
                }, t.isValidElementType = function(e) {
                    return "string" == typeof e || "function" == typeof e || e === i || e === f || e === c || e === l || e === y || e === h || "object" === n(e) && null !== e && (e.$$typeof === v || e.$$typeof === m || e.$$typeof === s || e.$$typeof === u || e.$$typeof === p || e.$$typeof === b || e.$$typeof === C || e.$$typeof === w || e.$$typeof === g)
                }, t.typeOf = S
            },
            8922: function(e, t, n) {
                "use strict";
                e.exports = n(8326)
            },
            4157: function(e, t) {
                "use strict";

                function n(e) {
                    return n = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(e) {
                        return typeof e
                    } : function(e) {
                        return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e
                    }, n(e)
                }
                var r, o = Symbol.for("react.element"),
                    a = Symbol.for("react.portal"),
                    i = Symbol.for("react.fragment"),
                    l = Symbol.for("react.strict_mode"),
                    c = Symbol.for("react.profiler"),
                    s = Symbol.for("react.provider"),
                    u = Symbol.for("react.context"),
                    d = Symbol.for("react.server_context"),
                    f = Symbol.for("react.forward_ref"),
                    p = Symbol.for("react.suspense"),
                    y = Symbol.for("react.suspense_list"),
                    h = Symbol.for("react.memo"),
                    m = Symbol.for("react.lazy"),
                    v = Symbol.for("react.offscreen");

                function g(e) {
                    if ("object" === n(e) && null !== e) {
                        var t = e.$$typeof;
                        switch (t) {
                            case o:
                                switch (e = e.type) {
                                    case i:
                                    case c:
                                    case l:
                                    case p:
                                    case y:
                                        return e;
                                    default:
                                        switch (e = e && e.$$typeof) {
                                            case d:
                                            case u:
                                            case f:
                                            case m:
                                            case h:
                                            case s:
                                                return e;
                                            default:
                                                return t
                                        }
                                }
                            case a:
                                return t
                        }
                    }
                }
                r = Symbol.for("react.module.reference")
            },
            6625: function(e, t, n) {
                "use strict";
                n(4157)
            },
            2373: function(e, t, n) {
                var r, o, a, i;

                function l(e) {
                    return l = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(e) {
                        return typeof e
                    } : function(e) {
                        return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e
                    }, l(e)
                }
                e = n.nmd(e), self, i = function() {
                    return function() {
                        var e = {
                                913: function(e, t, n) {
                                    "use strict";
                                    var r = n(651),
                                        o = n(601),
                                        a = o(r("String.prototype.indexOf"));
                                    e.exports = function(e, t) {
                                        var n = r(e, !!t);
                                        return "function" == typeof n && a(e, ".prototype.") > -1 ? o(n) : n
                                    }
                                },
                                601: function(e, t, n) {
                                    "use strict";
                                    var r = n(49),
                                        o = n(651),
                                        a = n(255),
                                        i = n(785),
                                        l = o("%Function.prototype.apply%"),
                                        c = o("%Function.prototype.call%"),
                                        s = o("%Reflect.apply%", !0) || r.call(c, l),
                                        u = n(649),
                                        d = o("%Math.max%");
                                    e.exports = function(e) {
                                        if ("function" != typeof e) throw new i("a function is required");
                                        var t = s(r, c, arguments);
                                        return a(t, 1 + d(0, e.length - (arguments.length - 1)), !0)
                                    };
                                    var f = function() {
                                        return s(r, l, arguments)
                                    };
                                    u ? u(e.exports, "apply", {
                                        value: f
                                    }) : e.exports.apply = f
                                },
                                295: function(e, t, n) {
                                    "use strict";
                                    var r = n(649),
                                        o = n(389),
                                        a = n(785),
                                        i = n(109);
                                    e.exports = function(e, t, n) {
                                        if (!e || "object" != l(e) && "function" != typeof e) throw new a("`obj` must be an object or a function`");
                                        if ("string" != typeof t && "symbol" != l(t)) throw new a("`property` must be a string or a symbol`");
                                        if (arguments.length > 3 && "boolean" != typeof arguments[3] && null !== arguments[3]) throw new a("`nonEnumerable`, if provided, must be a boolean or null");
                                        if (arguments.length > 4 && "boolean" != typeof arguments[4] && null !== arguments[4]) throw new a("`nonWritable`, if provided, must be a boolean or null");
                                        if (arguments.length > 5 && "boolean" != typeof arguments[5] && null !== arguments[5]) throw new a("`nonConfigurable`, if provided, must be a boolean or null");
                                        if (arguments.length > 6 && "boolean" != typeof arguments[6]) throw new a("`loose`, if provided, must be a boolean");
                                        var c = arguments.length > 3 ? arguments[3] : null,
                                            s = arguments.length > 4 ? arguments[4] : null,
                                            u = arguments.length > 5 ? arguments[5] : null,
                                            d = arguments.length > 6 && arguments[6],
                                            f = !!i && i(e, t);
                                        if (r) r(e, t, {
                                            configurable: null === u && f ? f.configurable : !u,
                                            enumerable: null === c && f ? f.enumerable : !c,
                                            value: n,
                                            writable: null === s && f ? f.writable : !s
                                        });
                                        else {
                                            if (!d && (c || s || u)) throw new o("This environment does not support defining a property as non-configurable, non-writable, or non-enumerable.");
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
                                        for (var a, i = function(e) {
                                                for (var t = [], n = 1, r = 0; n < e.length; n += 1, r += 1) t[r] = e[n];
                                                return t
                                            }(arguments), l = n(0, o.length - i.length), c = [], s = 0; s < l; s++) c[s] = "$" + s;
                                        if (a = Function("binder", "return function (" + function(e) {
                                                for (var t = "", n = 0; n < e.length; n += 1) t += e[n], n + 1 < e.length && (t += ",");
                                                return t
                                            }(c) + "){ return binder.apply(this,arguments); }")((function() {
                                                if (this instanceof a) {
                                                    var t = o.apply(this, r(i, arguments));
                                                    return Object(t) === t ? t : this
                                                }
                                                return o.apply(e, r(i, arguments))
                                            })), o.prototype) {
                                            var u = function() {};
                                            u.prototype = o.prototype, a.prototype = new u, u.prototype = null
                                        }
                                        return a
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
                                        a = n(55),
                                        i = n(888),
                                        c = n(900),
                                        s = n(389),
                                        u = n(785),
                                        d = n(436),
                                        f = Function,
                                        p = function(e) {
                                            try {
                                                return f('"use strict"; return (' + e + ").constructor;")()
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
                                        v = n(257)(),
                                        g = n(726)(),
                                        b = Object.getPrototypeOf || (g ? function(e) {
                                            return e.__proto__
                                        } : null),
                                        C = {},
                                        w = "undefined" != typeof Uint8Array && b ? b(Uint8Array) : r,
                                        S = {
                                            __proto__: null,
                                            "%AggregateError%": "undefined" == typeof AggregateError ? r : AggregateError,
                                            "%Array%": Array,
                                            "%ArrayBuffer%": "undefined" == typeof ArrayBuffer ? r : ArrayBuffer,
                                            "%ArrayIteratorPrototype%": v && b ? b([][Symbol.iterator]()) : r,
                                            "%AsyncFromSyncIteratorPrototype%": r,
                                            "%AsyncFunction%": C,
                                            "%AsyncGenerator%": C,
                                            "%AsyncGeneratorFunction%": C,
                                            "%AsyncIteratorPrototype%": C,
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
                                            "%EvalError%": a,
                                            "%Float32Array%": "undefined" == typeof Float32Array ? r : Float32Array,
                                            "%Float64Array%": "undefined" == typeof Float64Array ? r : Float64Array,
                                            "%FinalizationRegistry%": "undefined" == typeof FinalizationRegistry ? r : FinalizationRegistry,
                                            "%Function%": f,
                                            "%GeneratorFunction%": C,
                                            "%Int8Array%": "undefined" == typeof Int8Array ? r : Int8Array,
                                            "%Int16Array%": "undefined" == typeof Int16Array ? r : Int16Array,
                                            "%Int32Array%": "undefined" == typeof Int32Array ? r : Int32Array,
                                            "%isFinite%": isFinite,
                                            "%isNaN%": isNaN,
                                            "%IteratorPrototype%": v && b ? b(b([][Symbol.iterator]())) : r,
                                            "%JSON%": "object" == ("undefined" == typeof JSON ? "undefined" : l(JSON)) ? JSON : r,
                                            "%Map%": "undefined" == typeof Map ? r : Map,
                                            "%MapIteratorPrototype%": "undefined" != typeof Map && v && b ? b((new Map)[Symbol.iterator]()) : r,
                                            "%Math%": Math,
                                            "%Number%": Number,
                                            "%Object%": Object,
                                            "%parseFloat%": parseFloat,
                                            "%parseInt%": parseInt,
                                            "%Promise%": "undefined" == typeof Promise ? r : Promise,
                                            "%Proxy%": "undefined" == typeof Proxy ? r : Proxy,
                                            "%RangeError%": i,
                                            "%ReferenceError%": c,
                                            "%Reflect%": "undefined" == typeof Reflect ? r : Reflect,
                                            "%RegExp%": RegExp,
                                            "%Set%": "undefined" == typeof Set ? r : Set,
                                            "%SetIteratorPrototype%": "undefined" != typeof Set && v && b ? b((new Set)[Symbol.iterator]()) : r,
                                            "%SharedArrayBuffer%": "undefined" == typeof SharedArrayBuffer ? r : SharedArrayBuffer,
                                            "%String%": String,
                                            "%StringIteratorPrototype%": v && b ? b("" [Symbol.iterator]()) : r,
                                            "%Symbol%": v ? Symbol : r,
                                            "%SyntaxError%": s,
                                            "%ThrowTypeError%": m,
                                            "%TypedArray%": w,
                                            "%TypeError%": u,
                                            "%Uint8Array%": "undefined" == typeof Uint8Array ? r : Uint8Array,
                                            "%Uint8ClampedArray%": "undefined" == typeof Uint8ClampedArray ? r : Uint8ClampedArray,
                                            "%Uint16Array%": "undefined" == typeof Uint16Array ? r : Uint16Array,
                                            "%Uint32Array%": "undefined" == typeof Uint32Array ? r : Uint32Array,
                                            "%URIError%": d,
                                            "%WeakMap%": "undefined" == typeof WeakMap ? r : WeakMap,
                                            "%WeakRef%": "undefined" == typeof WeakRef ? r : WeakRef,
                                            "%WeakSet%": "undefined" == typeof WeakSet ? r : WeakSet
                                        };
                                    if (b) try {
                                        null.error
                                    } catch (e) {
                                        var E = b(b(e));
                                        S["%Error.prototype%"] = E
                                    }
                                    var P = function e(t) {
                                            var n;
                                            if ("%AsyncFunction%" === t) n = p("async function () {}");
                                            else if ("%GeneratorFunction%" === t) n = p("function* () {}");
                                            else if ("%AsyncGeneratorFunction%" === t) n = p("async function* () {}");
                                            else if ("%AsyncGenerator%" === t) {
                                                var r = e("%AsyncGeneratorFunction%");
                                                r && (n = r.prototype)
                                            } else if ("%AsyncIteratorPrototype%" === t) {
                                                var o = e("%AsyncGenerator%");
                                                o && b && (n = b(o.prototype))
                                            }
                                            return S[t] = n, n
                                        },
                                        T = {
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
                                        x = n(49),
                                        A = n(215),
                                        I = x.call(Function.call, Array.prototype.concat),
                                        k = x.call(Function.apply, Array.prototype.splice),
                                        D = x.call(Function.call, String.prototype.replace),
                                        N = x.call(Function.call, String.prototype.slice),
                                        O = x.call(Function.call, RegExp.prototype.exec),
                                        M = /[^%.[\]]+|\[(?:(-?\d+(?:\.\d+)?)|(["'])((?:(?!\2)[^\\]|\\.)*?)\2)\]|(?=(?:\.|\[\])(?:\.|\[\]|%$))/g,
                                        R = /\\(\\)?/g,
                                        j = function(e, t) {
                                            var n, r = e;
                                            if (A(T, r) && (r = "%" + (n = T[r])[0] + "%"), A(S, r)) {
                                                var o = S[r];
                                                if (o === C && (o = P(r)), void 0 === o && !t) throw new u("intrinsic " + e + " exists, but is not available. Please file an issue!");
                                                return {
                                                    alias: n,
                                                    name: r,
                                                    value: o
                                                }
                                            }
                                            throw new s("intrinsic " + e + " does not exist!")
                                        };
                                    e.exports = function(e, t) {
                                        if ("string" != typeof e || 0 === e.length) throw new u("intrinsic name must be a non-empty string");
                                        if (arguments.length > 1 && "boolean" != typeof t) throw new u('"allowMissing" argument must be a boolean');
                                        if (null === O(/^%?[^%]*%?$/, e)) throw new s("`%` may not be present anywhere but at the beginning and end of the intrinsic name");
                                        var n = function(e) {
                                                var t = N(e, 0, 1),
                                                    n = N(e, -1);
                                                if ("%" === t && "%" !== n) throw new s("invalid intrinsic syntax, expected closing `%`");
                                                if ("%" === n && "%" !== t) throw new s("invalid intrinsic syntax, expected opening `%`");
                                                var r = [];
                                                return D(e, M, (function(e, t, n, o) {
                                                    r[r.length] = n ? D(o, R, "$1") : t || e
                                                })), r
                                            }(e),
                                            r = n.length > 0 ? n[0] : "",
                                            o = j("%" + r + "%", t),
                                            a = o.name,
                                            i = o.value,
                                            l = !1,
                                            c = o.alias;
                                        c && (r = c[0], k(n, I([0, 1], c)));
                                        for (var d = 1, f = !0; d < n.length; d += 1) {
                                            var p = n[d],
                                                h = N(p, 0, 1),
                                                m = N(p, -1);
                                            if (('"' === h || "'" === h || "`" === h || '"' === m || "'" === m || "`" === m) && h !== m) throw new s("property names with quotes must have matching quotes");
                                            if ("constructor" !== p && f || (l = !0), A(S, a = "%" + (r += "." + p) + "%")) i = S[a];
                                            else if (null != i) {
                                                if (!(p in i)) {
                                                    if (!t) throw new u("base intrinsic for " + e + " exists, but the property is not available.");
                                                    return
                                                }
                                                if (y && d + 1 >= n.length) {
                                                    var v = y(i, p);
                                                    i = (f = !!v) && "get" in v && !("originalValue" in v.get) ? v.get : i[p]
                                                } else f = A(i, p), i = i[p];
                                                f && !l && (S[a] = i)
                                            }
                                        }
                                        return i
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
                                        return "function" == typeof r && "function" == typeof Symbol && "symbol" == l(r("foo")) && "symbol" == l(Symbol("bar")) && o()
                                    }
                                },
                                843: function(e) {
                                    "use strict";
                                    e.exports = function() {
                                        if ("function" != typeof Symbol || "function" != typeof Object.getOwnPropertySymbols) return !1;
                                        if ("symbol" == l(Symbol.iterator)) return !0;
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
                                        a = n(49);
                                    e.exports = a.call(r, o)
                                },
                                709: function(e, t, n) {
                                    var r, o = 1 / 0,
                                        a = /[^\x00-\x2f\x3a-\x40\x5b-\x60\x7b-\x7f]+/g,
                                        i = /[\xc0-\xd6\xd8-\xf6\xf8-\xff\u0100-\u017f]/g,
                                        c = "\\ud800-\\udfff",
                                        s = "\\u2700-\\u27bf",
                                        u = "a-z\\xdf-\\xf6\\xf8-\\xff",
                                        d = "A-Z\\xc0-\\xd6\\xd8-\\xde",
                                        f = "\\xac\\xb1\\xd7\\xf7\\x00-\\x2f\\x3a-\\x40\\x5b-\\x60\\x7b-\\xbf\\u2000-\\u206f \\t\\x0b\\f\\xa0\\ufeff\\n\\r\\u2028\\u2029\\u1680\\u180e\\u2000\\u2001\\u2002\\u2003\\u2004\\u2005\\u2006\\u2007\\u2008\\u2009\\u200a\\u202f\\u205f\\u3000",
                                        p = "[" + f + "]",
                                        y = "[\\u0300-\\u036f\\ufe20-\\ufe23\\u20d0-\\u20f0]",
                                        h = "\\d+",
                                        m = "[" + s + "]",
                                        v = "[" + u + "]",
                                        g = "[^" + c + f + h + s + u + d + "]",
                                        b = "(?:\\ud83c[\\udde6-\\uddff]){2}",
                                        C = "[\\ud800-\\udbff][\\udc00-\\udfff]",
                                        w = "[" + d + "]",
                                        S = "(?:" + v + "|" + g + ")",
                                        E = "(?:" + w + "|" + g + ")",
                                        P = "(?:['’](?:d|ll|m|re|s|t|ve))?",
                                        T = "(?:['’](?:D|LL|M|RE|S|T|VE))?",
                                        x = "(?:" + y + "|\\ud83c[\\udffb-\\udfff])?",
                                        A = "[\\ufe0e\\ufe0f]?",
                                        I = A + x + "(?:\\u200d(?:" + ["[^" + c + "]", b, C].join("|") + ")" + A + x + ")*",
                                        k = "(?:" + [m, b, C].join("|") + ")" + I,
                                        D = RegExp("['’]", "g"),
                                        N = RegExp(y, "g"),
                                        O = RegExp([w + "?" + v + "+" + P + "(?=" + [p, w, "$"].join("|") + ")", E + "+" + T + "(?=" + [p, w + S, "$"].join("|") + ")", w + "?" + S + "+" + P, w + "+" + T, h, k].join("|"), "g"),
                                        M = /[a-z][A-Z]|[A-Z]{2,}[a-z]|[0-9][a-zA-Z]|[a-zA-Z][0-9]|[^a-zA-Z0-9 ]/,
                                        R = "object" == l(n.g) && n.g && n.g.Object === Object && n.g,
                                        j = "object" == ("undefined" == typeof self ? "undefined" : l(self)) && self && self.Object === Object && self,
                                        F = R || j || Function("return this")(),
                                        V = (r = {
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
                                        U = Object.prototype.toString,
                                        L = F.Symbol,
                                        W = L ? L.prototype : void 0,
                                        K = W ? W.toString : void 0;

                                    function _(e) {
                                        return null == e ? "" : function(e) {
                                            if ("string" == typeof e) return e;
                                            if (function(e) {
                                                    return "symbol" == l(e) || function(e) {
                                                        return !!e && "object" == l(e)
                                                    }(e) && "[object Symbol]" == U.call(e)
                                                }(e)) return K ? K.call(e) : "";
                                            var t = e + "";
                                            return "0" == t && 1 / e == -o ? "-0" : t
                                        }(e)
                                    }
                                    var B, z = (B = function(e, t, n) {
                                        return e + (n ? "-" : "") + t.toLowerCase()
                                    }, function(e) {
                                        return function(e, t, n) {
                                            for (var r = -1, o = e ? e.length : 0; ++r < o;) n = t(n, e[r], r, e);
                                            return n
                                        }(function(e) {
                                            return function(e) {
                                                return M.test(e)
                                            }(e = _(e)) ? function(e) {
                                                return e.match(O) || []
                                            }(e) : function(e) {
                                                return e.match(a) || []
                                            }(e)
                                        }(function(e) {
                                            return (e = _(e)) && e.replace(i, V).replace(N, "")
                                        }(e).replace(D, "")), B, "")
                                    });
                                    e.exports = z
                                },
                                937: function(e, t, n) {
                                    var r = "function" == typeof Map && Map.prototype,
                                        o = Object.getOwnPropertyDescriptor && r ? Object.getOwnPropertyDescriptor(Map.prototype, "size") : null,
                                        a = r && o && "function" == typeof o.get ? o.get : null,
                                        i = r && Map.prototype.forEach,
                                        c = "function" == typeof Set && Set.prototype,
                                        s = Object.getOwnPropertyDescriptor && c ? Object.getOwnPropertyDescriptor(Set.prototype, "size") : null,
                                        u = c && s && "function" == typeof s.get ? s.get : null,
                                        d = c && Set.prototype.forEach,
                                        f = "function" == typeof WeakMap && WeakMap.prototype ? WeakMap.prototype.has : null,
                                        p = "function" == typeof WeakSet && WeakSet.prototype ? WeakSet.prototype.has : null,
                                        y = "function" == typeof WeakRef && WeakRef.prototype ? WeakRef.prototype.deref : null,
                                        h = Boolean.prototype.valueOf,
                                        m = Object.prototype.toString,
                                        v = Function.prototype.toString,
                                        g = String.prototype.match,
                                        b = String.prototype.slice,
                                        C = String.prototype.replace,
                                        w = String.prototype.toUpperCase,
                                        S = String.prototype.toLowerCase,
                                        E = RegExp.prototype.test,
                                        P = Array.prototype.concat,
                                        T = Array.prototype.join,
                                        x = Array.prototype.slice,
                                        A = Math.floor,
                                        I = "function" == typeof BigInt ? BigInt.prototype.valueOf : null,
                                        k = Object.getOwnPropertySymbols,
                                        D = "function" == typeof Symbol && "symbol" == l(Symbol.iterator) ? Symbol.prototype.toString : null,
                                        N = "function" == typeof Symbol && "object" == l(Symbol.iterator),
                                        O = "function" == typeof Symbol && Symbol.toStringTag && (Symbol.toStringTag, 1) ? Symbol.toStringTag : null,
                                        M = Object.prototype.propertyIsEnumerable,
                                        R = ("function" == typeof Reflect ? Reflect.getPrototypeOf : Object.getPrototypeOf) || ([].__proto__ === Array.prototype ? function(e) {
                                            return e.__proto__
                                        } : null);

                                    function j(e, t) {
                                        if (e === 1 / 0 || e === -1 / 0 || e != e || e && e > -1e3 && e < 1e3 || E.call(/e/, t)) return t;
                                        var n = /[0-9](?=(?:[0-9]{3})+(?![0-9]))/g;
                                        if ("number" == typeof e) {
                                            var r = e < 0 ? -A(-e) : A(e);
                                            if (r !== e) {
                                                var o = String(r),
                                                    a = b.call(t, o.length + 1);
                                                return C.call(o, n, "$&_") + "." + C.call(C.call(a, /([0-9]{3})/g, "$&_"), /_$/, "")
                                            }
                                        }
                                        return C.call(t, n, "$&_")
                                    }
                                    var F = n(634),
                                        V = F.custom,
                                        U = B(V) ? V : null;

                                    function L(e, t, n) {
                                        var r = "double" === (n.quoteStyle || t) ? '"' : "'";
                                        return r + e + r
                                    }

                                    function W(e) {
                                        return C.call(String(e), /"/g, "&quot;")
                                    }

                                    function K(e) {
                                        return !("[object Array]" !== H(e) || O && "object" == l(e) && O in e)
                                    }

                                    function _(e) {
                                        return !("[object RegExp]" !== H(e) || O && "object" == l(e) && O in e)
                                    }

                                    function B(e) {
                                        if (N) return e && "object" == l(e) && e instanceof Symbol;
                                        if ("symbol" == l(e)) return !0;
                                        if (!e || "object" != l(e) || !D) return !1;
                                        try {
                                            return D.call(e), !0
                                        } catch (e) {}
                                        return !1
                                    }
                                    e.exports = function e(t, r, o, c) {
                                        var s = r || {};
                                        if (q(s, "quoteStyle") && "single" !== s.quoteStyle && "double" !== s.quoteStyle) throw new TypeError('option "quoteStyle" must be "single" or "double"');
                                        if (q(s, "maxStringLength") && ("number" == typeof s.maxStringLength ? s.maxStringLength < 0 && s.maxStringLength !== 1 / 0 : null !== s.maxStringLength)) throw new TypeError('option "maxStringLength", if provided, must be a positive integer, Infinity, or `null`');
                                        var m = !q(s, "customInspect") || s.customInspect;
                                        if ("boolean" != typeof m && "symbol" !== m) throw new TypeError("option \"customInspect\", if provided, must be `true`, `false`, or `'symbol'`");
                                        if (q(s, "indent") && null !== s.indent && "\t" !== s.indent && !(parseInt(s.indent, 10) === s.indent && s.indent > 0)) throw new TypeError('option "indent" must be "\\t", an integer > 0, or `null`');
                                        if (q(s, "numericSeparator") && "boolean" != typeof s.numericSeparator) throw new TypeError('option "numericSeparator", if provided, must be `true` or `false`');
                                        var w = s.numericSeparator;
                                        if (void 0 === t) return "undefined";
                                        if (null === t) return "null";
                                        if ("boolean" == typeof t) return t ? "true" : "false";
                                        if ("string" == typeof t) return Y(t, s);
                                        if ("number" == typeof t) {
                                            if (0 === t) return 1 / 0 / t > 0 ? "0" : "-0";
                                            var E = String(t);
                                            return w ? j(t, E) : E
                                        }
                                        if ("bigint" == typeof t) {
                                            var A = String(t) + "n";
                                            return w ? j(t, A) : A
                                        }
                                        var k = void 0 === s.depth ? 5 : s.depth;
                                        if (void 0 === o && (o = 0), o >= k && k > 0 && "object" == l(t)) return K(t) ? "[Array]" : "[Object]";
                                        var V, z = function(e, t) {
                                            var n;
                                            if ("\t" === e.indent) n = "\t";
                                            else {
                                                if (!("number" == typeof e.indent && e.indent > 0)) return null;
                                                n = T.call(Array(e.indent + 1), " ")
                                            }
                                            return {
                                                base: n,
                                                prev: T.call(Array(t + 1), n)
                                            }
                                        }(s, o);
                                        if (void 0 === c) c = [];
                                        else if (G(c, t) >= 0) return "[Circular]";

                                        function $(t, n, r) {
                                            if (n && (c = x.call(c)).push(n), r) {
                                                var a = {
                                                    depth: s.depth
                                                };
                                                return q(s, "quoteStyle") && (a.quoteStyle = s.quoteStyle), e(t, a, o + 1, c)
                                            }
                                            return e(t, s, o + 1, c)
                                        }
                                        if ("function" == typeof t && !_(t)) {
                                            var te = function(e) {
                                                    if (e.name) return e.name;
                                                    var t = g.call(v.call(e), /^function\s*([\w$]+)/);
                                                    return t ? t[1] : null
                                                }(t),
                                                ne = ee(t, $);
                                            return "[Function" + (te ? ": " + te : " (anonymous)") + "]" + (ne.length > 0 ? " { " + T.call(ne, ", ") + " }" : "")
                                        }
                                        if (B(t)) {
                                            var re = N ? C.call(String(t), /^(Symbol\(.*\))_[^)]*$/, "$1") : D.call(t);
                                            return "object" != l(t) || N ? re : J(re)
                                        }
                                        if ((V = t) && "object" == l(V) && ("undefined" != typeof HTMLElement && V instanceof HTMLElement || "string" == typeof V.nodeName && "function" == typeof V.getAttribute)) {
                                            for (var oe = "<" + S.call(String(t.nodeName)), ae = t.attributes || [], ie = 0; ie < ae.length; ie++) oe += " " + ae[ie].name + "=" + L(W(ae[ie].value), "double", s);
                                            return oe += ">", t.childNodes && t.childNodes.length && (oe += "..."), oe + "</" + S.call(String(t.nodeName)) + ">"
                                        }
                                        if (K(t)) {
                                            if (0 === t.length) return "[]";
                                            var le = ee(t, $);
                                            return z && ! function(e) {
                                                for (var t = 0; t < e.length; t++)
                                                    if (G(e[t], "\n") >= 0) return !1;
                                                return !0
                                            }(le) ? "[" + Z(le, z) + "]" : "[ " + T.call(le, ", ") + " ]"
                                        }
                                        if (function(e) {
                                                return !("[object Error]" !== H(e) || O && "object" == l(e) && O in e)
                                            }(t)) {
                                            var ce = ee(t, $);
                                            return "cause" in Error.prototype || !("cause" in t) || M.call(t, "cause") ? 0 === ce.length ? "[" + String(t) + "]" : "{ [" + String(t) + "] " + T.call(ce, ", ") + " }" : "{ [" + String(t) + "] " + T.call(P.call("[cause]: " + $(t.cause), ce), ", ") + " }"
                                        }
                                        if ("object" == l(t) && m) {
                                            if (U && "function" == typeof t[U] && F) return F(t, {
                                                depth: k - o
                                            });
                                            if ("symbol" !== m && "function" == typeof t.inspect) return t.inspect()
                                        }
                                        if (function(e) {
                                                if (!a || !e || "object" != l(e)) return !1;
                                                try {
                                                    a.call(e);
                                                    try {
                                                        u.call(e)
                                                    } catch (e) {
                                                        return !0
                                                    }
                                                    return e instanceof Map
                                                } catch (e) {}
                                                return !1
                                            }(t)) {
                                            var se = [];
                                            return i && i.call(t, (function(e, n) {
                                                se.push($(n, t, !0) + " => " + $(e, t))
                                            })), X("Map", a.call(t), se, z)
                                        }
                                        if (function(e) {
                                                if (!u || !e || "object" != l(e)) return !1;
                                                try {
                                                    u.call(e);
                                                    try {
                                                        a.call(e)
                                                    } catch (e) {
                                                        return !0
                                                    }
                                                    return e instanceof Set
                                                } catch (e) {}
                                                return !1
                                            }(t)) {
                                            var ue = [];
                                            return d && d.call(t, (function(e) {
                                                ue.push($(e, t))
                                            })), X("Set", u.call(t), ue, z)
                                        }
                                        if (function(e) {
                                                if (!f || !e || "object" != l(e)) return !1;
                                                try {
                                                    f.call(e, f);
                                                    try {
                                                        p.call(e, p)
                                                    } catch (e) {
                                                        return !0
                                                    }
                                                    return e instanceof WeakMap
                                                } catch (e) {}
                                                return !1
                                            }(t)) return Q("WeakMap");
                                        if (function(e) {
                                                if (!p || !e || "object" != l(e)) return !1;
                                                try {
                                                    p.call(e, p);
                                                    try {
                                                        f.call(e, f)
                                                    } catch (e) {
                                                        return !0
                                                    }
                                                    return e instanceof WeakSet
                                                } catch (e) {}
                                                return !1
                                            }(t)) return Q("WeakSet");
                                        if (function(e) {
                                                if (!y || !e || "object" != l(e)) return !1;
                                                try {
                                                    return y.call(e), !0
                                                } catch (e) {}
                                                return !1
                                            }(t)) return Q("WeakRef");
                                        if (function(e) {
                                                return !("[object Number]" !== H(e) || O && "object" == l(e) && O in e)
                                            }(t)) return J($(Number(t)));
                                        if (function(e) {
                                                if (!e || "object" != l(e) || !I) return !1;
                                                try {
                                                    return I.call(e), !0
                                                } catch (e) {}
                                                return !1
                                            }(t)) return J($(I.call(t)));
                                        if (function(e) {
                                                return !("[object Boolean]" !== H(e) || O && "object" == l(e) && O in e)
                                            }(t)) return J(h.call(t));
                                        if (function(e) {
                                                return !("[object String]" !== H(e) || O && "object" == l(e) && O in e)
                                            }(t)) return J($(String(t)));
                                        if ("undefined" != typeof window && t === window) return "{ [object Window] }";
                                        if (t === n.g) return "{ [object globalThis] }";
                                        if (! function(e) {
                                                return !("[object Date]" !== H(e) || O && "object" == l(e) && O in e)
                                            }(t) && !_(t)) {
                                            var de = ee(t, $),
                                                fe = R ? R(t) === Object.prototype : t instanceof Object || t.constructor === Object,
                                                pe = t instanceof Object ? "" : "null prototype",
                                                ye = !fe && O && Object(t) === t && O in t ? b.call(H(t), 8, -1) : pe ? "Object" : "",
                                                he = (fe || "function" != typeof t.constructor ? "" : t.constructor.name ? t.constructor.name + " " : "") + (ye || pe ? "[" + T.call(P.call([], ye || [], pe || []), ": ") + "] " : "");
                                            return 0 === de.length ? he + "{}" : z ? he + "{" + Z(de, z) + "}" : he + "{ " + T.call(de, ", ") + " }"
                                        }
                                        return String(t)
                                    };
                                    var z = Object.prototype.hasOwnProperty || function(e) {
                                        return e in this
                                    };

                                    function q(e, t) {
                                        return z.call(e, t)
                                    }

                                    function H(e) {
                                        return m.call(e)
                                    }

                                    function G(e, t) {
                                        if (e.indexOf) return e.indexOf(t);
                                        for (var n = 0, r = e.length; n < r; n++)
                                            if (e[n] === t) return n;
                                        return -1
                                    }

                                    function Y(e, t) {
                                        if (e.length > t.maxStringLength) {
                                            var n = e.length - t.maxStringLength,
                                                r = "... " + n + " more character" + (n > 1 ? "s" : "");
                                            return Y(b.call(e, 0, t.maxStringLength), t) + r
                                        }
                                        return L(C.call(C.call(e, /(['\\])/g, "\\$1"), /[\x00-\x1f]/g, $), "single", t)
                                    }

                                    function $(e) {
                                        var t = e.charCodeAt(0),
                                            n = {
                                                8: "b",
                                                9: "t",
                                                10: "n",
                                                12: "f",
                                                13: "r"
                                            } [t];
                                        return n ? "\\" + n : "\\x" + (t < 16 ? "0" : "") + w.call(t.toString(16))
                                    }

                                    function J(e) {
                                        return "Object(" + e + ")"
                                    }

                                    function Q(e) {
                                        return e + " { ? }"
                                    }

                                    function X(e, t, n, r) {
                                        return e + " (" + t + ") {" + (r ? Z(n, r) : T.call(n, ", ")) + "}"
                                    }

                                    function Z(e, t) {
                                        if (0 === e.length) return "";
                                        var n = "\n" + t.prev + t.base;
                                        return n + T.call(e, "," + n) + "\n" + t.prev
                                    }

                                    function ee(e, t) {
                                        var n = K(e),
                                            r = [];
                                        if (n) {
                                            r.length = e.length;
                                            for (var o = 0; o < e.length; o++) r[o] = q(e, o) ? t(e[o], e) : ""
                                        }
                                        var a, i = "function" == typeof k ? k(e) : [];
                                        if (N) {
                                            a = {};
                                            for (var l = 0; l < i.length; l++) a["$" + i[l]] = i[l]
                                        }
                                        for (var c in e) q(e, c) && (n && String(Number(c)) === c && c < e.length || N && a["$" + c] instanceof Symbol || (E.call(/[^\w$]/, c) ? r.push(t(c, e) + ": " + t(e[c], e)) : r.push(c + ": " + t(e[c], e))));
                                        if ("function" == typeof k)
                                            for (var s = 0; s < i.length; s++) M.call(e, i[s]) && r.push("[" + t(i[s]) + "]: " + t(e[i[s]], e));
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
                                        a = n(647),
                                        i = Object.prototype.hasOwnProperty,
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
                                        s = Array.isArray,
                                        u = Array.prototype.push,
                                        d = function(e, t) {
                                            u.apply(e, s(t) ? t : [t])
                                        },
                                        f = Date.prototype.toISOString,
                                        p = a.default,
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
                                            format: p,
                                            formatter: a.formatters[p],
                                            indices: !1,
                                            serializeDate: function(e) {
                                                return f.call(e)
                                            },
                                            skipNulls: !1,
                                            strictNullHandling: !1
                                        },
                                        h = {},
                                        m = function e(t, n, a, i, c, u, f, p, m, v, g, b, C, w, S, E, P, T) {
                                            for (var x, A = t, I = T, k = 0, D = !1; void 0 !== (I = I.get(h)) && !D;) {
                                                var N = I.get(t);
                                                if (k += 1, void 0 !== N) {
                                                    if (N === k) throw new RangeError("Cyclic object value");
                                                    D = !0
                                                }
                                                void 0 === I.get(h) && (k = 0)
                                            }
                                            if ("function" == typeof v ? A = v(n, A) : A instanceof Date ? A = C(A) : "comma" === a && s(A) && (A = o.maybeMap(A, (function(e) {
                                                    return e instanceof Date ? C(e) : e
                                                }))), null === A) {
                                                if (u) return m && !E ? m(n, y.encoder, P, "key", w) : n;
                                                A = ""
                                            }
                                            if ("string" == typeof(x = A) || "number" == typeof x || "boolean" == typeof x || "symbol" == l(x) || "bigint" == typeof x || o.isBuffer(A)) return m ? [S(E ? n : m(n, y.encoder, P, "key", w)) + "=" + S(m(A, y.encoder, P, "value", w))] : [S(n) + "=" + S(String(A))];
                                            var O, M = [];
                                            if (void 0 === A) return M;
                                            if ("comma" === a && s(A)) E && m && (A = o.maybeMap(A, m)), O = [{
                                                value: A.length > 0 ? A.join(",") || null : void 0
                                            }];
                                            else if (s(v)) O = v;
                                            else {
                                                var R = Object.keys(A);
                                                O = g ? R.sort(g) : R
                                            }
                                            var j = p ? String(n).replace(/\./g, "%2E") : String(n),
                                                F = i && s(A) && 1 === A.length ? j + "[]" : j;
                                            if (c && s(A) && 0 === A.length) return F + "[]";
                                            for (var V = 0; V < O.length; ++V) {
                                                var U = O[V],
                                                    L = "object" == l(U) && U && void 0 !== U.value ? U.value : A[U];
                                                if (!f || null !== L) {
                                                    var W = b && p ? String(U).replace(/\./g, "%2E") : String(U),
                                                        K = s(A) ? "function" == typeof a ? a(F, W) : F : F + (b ? "." + W : "[" + W + "]");
                                                    T.set(t, k);
                                                    var _ = r();
                                                    _.set(h, T), d(M, e(L, K, a, i, c, u, f, p, "comma" === a && E && s(A) ? null : m, v, g, b, C, w, S, E, P, _))
                                                }
                                            }
                                            return M
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
                                                var n = a.default;
                                                if (void 0 !== e.format) {
                                                    if (!i.call(a.formatters, e.format)) throw new TypeError("Unknown format option provided.");
                                                    n = e.format
                                                }
                                                var r, o = a.formatters[n],
                                                    l = y.filter;
                                                if (("function" == typeof e.filter || s(e.filter)) && (l = e.filter), r = e.arrayFormat in c ? e.arrayFormat : "indices" in e ? e.indices ? "indices" : "repeat" : y.arrayFormat, "commaRoundTrip" in e && "boolean" != typeof e.commaRoundTrip) throw new TypeError("`commaRoundTrip` must be a boolean, or absent");
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
                                                    filter: l,
                                                    format: n,
                                                    formatter: o,
                                                    serializeDate: "function" == typeof e.serializeDate ? e.serializeDate : y.serializeDate,
                                                    skipNulls: "boolean" == typeof e.skipNulls ? e.skipNulls : y.skipNulls,
                                                    sort: "function" == typeof e.sort ? e.sort : null,
                                                    strictNullHandling: "boolean" == typeof e.strictNullHandling ? e.strictNullHandling : y.strictNullHandling
                                                }
                                            }(t);
                                        "function" == typeof u.filter ? o = (0, u.filter)("", o) : s(u.filter) && (n = u.filter);
                                        var f = [];
                                        if ("object" != l(o) || null === o) return "";
                                        var p = c[u.arrayFormat],
                                            h = "comma" === p && u.commaRoundTrip;
                                        n || (n = Object.keys(o)), u.sort && n.sort(u.sort);
                                        for (var v = r(), g = 0; g < n.length; ++g) {
                                            var b = n[g],
                                                C = o[b];
                                            u.skipNulls && null === C || d(f, m(C, b, p, h, u.allowEmptyArrays, u.strictNullHandling, u.skipNulls, u.encodeDotInKeys, u.encode ? u.encoder : null, u.filter, u.sort, u.allowDots, u.serializeDate, u.format, u.formatter, u.encodeValuesOnly, u.charset, v))
                                        }
                                        var w = f.join(u.delimiter),
                                            S = !0 === u.addQueryPrefix ? "?" : "";
                                        return u.charsetSentinel && ("iso-8859-1" === u.charset ? S += "utf8=%26%2310003%3B&" : S += "utf8=%E2%9C%93&"), w.length > 0 ? S + w : ""
                                    }
                                },
                                662: function(e, t, n) {
                                    "use strict";
                                    var r = n(647),
                                        o = Object.prototype.hasOwnProperty,
                                        a = Array.isArray,
                                        i = function() {
                                            for (var e = [], t = 0; t < 256; ++t) e.push("%" + ((t < 16 ? "0" : "") + t.toString(16)).toUpperCase());
                                            return e
                                        }(),
                                        c = function(e, t) {
                                            for (var n = t && t.plainObjects ? {
                                                    __proto__: null
                                                } : {}, r = 0; r < e.length; ++r) void 0 !== e[r] && (n[r] = e[r]);
                                            return n
                                        },
                                        s = 1024;
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
                                                for (var o = t[r], i = o.obj[o.prop], c = Object.keys(i), s = 0; s < c.length; ++s) {
                                                    var u = c[s],
                                                        d = i[u];
                                                    "object" == l(d) && null !== d && -1 === n.indexOf(d) && (t.push({
                                                        obj: i,
                                                        prop: u
                                                    }), n.push(d))
                                                }
                                            return function(e) {
                                                for (; e.length > 1;) {
                                                    var t = e.pop(),
                                                        n = t.obj[t.prop];
                                                    if (a(n)) {
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
                                        encode: function(e, t, n, o, a) {
                                            if (0 === e.length) return e;
                                            var c = e;
                                            if ("symbol" == l(e) ? c = Symbol.prototype.toString.call(e) : "string" != typeof e && (c = String(e)), "iso-8859-1" === n) return escape(c).replace(/%u[0-9a-f]{4}/gi, (function(e) {
                                                return "%26%23" + parseInt(e.slice(2), 16) + "%3B"
                                            }));
                                            for (var u = "", d = 0; d < c.length; d += s) {
                                                for (var f = c.length >= s ? c.slice(d, d + s) : c, p = [], y = 0; y < f.length; ++y) {
                                                    var h = f.charCodeAt(y);
                                                    45 === h || 46 === h || 95 === h || 126 === h || h >= 48 && h <= 57 || h >= 65 && h <= 90 || h >= 97 && h <= 122 || a === r.RFC1738 && (40 === h || 41 === h) ? p[p.length] = f.charAt(y) : h < 128 ? p[p.length] = i[h] : h < 2048 ? p[p.length] = i[192 | h >> 6] + i[128 | 63 & h] : h < 55296 || h >= 57344 ? p[p.length] = i[224 | h >> 12] + i[128 | h >> 6 & 63] + i[128 | 63 & h] : (y += 1, h = 65536 + ((1023 & h) << 10 | 1023 & f.charCodeAt(y)), p[p.length] = i[240 | h >> 18] + i[128 | h >> 12 & 63] + i[128 | h >> 6 & 63] + i[128 | 63 & h])
                                                }
                                                u += p.join("")
                                            }
                                            return u
                                        },
                                        isBuffer: function(e) {
                                            return !(!e || "object" != l(e) || !(e.constructor && e.constructor.isBuffer && e.constructor.isBuffer(e)))
                                        },
                                        isRegExp: function(e) {
                                            return "[object RegExp]" === Object.prototype.toString.call(e)
                                        },
                                        maybeMap: function(e, t) {
                                            if (a(e)) {
                                                for (var n = [], r = 0; r < e.length; r += 1) n.push(t(e[r]));
                                                return n
                                            }
                                            return t(e)
                                        },
                                        merge: function e(t, n, r) {
                                            if (!n) return t;
                                            if ("object" != l(n) && "function" != typeof n) {
                                                if (a(t)) t.push(n);
                                                else {
                                                    if (!t || "object" != l(t)) return [t, n];
                                                    (r && (r.plainObjects || r.allowPrototypes) || !o.call(Object.prototype, n)) && (t[n] = !0)
                                                }
                                                return t
                                            }
                                            if (!t || "object" != l(t)) return [t].concat(n);
                                            var i = t;
                                            return a(t) && !a(n) && (i = c(t, r)), a(t) && a(n) ? (n.forEach((function(n, a) {
                                                if (o.call(t, a)) {
                                                    var i = t[a];
                                                    i && "object" == l(i) && n && "object" == l(n) ? t[a] = e(i, n, r) : t.push(n)
                                                } else t[a] = n
                                            })), t) : Object.keys(n).reduce((function(t, a) {
                                                var i = n[a];
                                                return o.call(t, a) ? t[a] = e(t[a], i, r) : t[a] = i, t
                                            }), i)
                                        }
                                    }
                                },
                                255: function(e, t, n) {
                                    "use strict";
                                    var r = n(651),
                                        o = n(295),
                                        a = n(890)(),
                                        i = n(109),
                                        l = n(785),
                                        c = r("%Math.floor%");
                                    e.exports = function(e, t) {
                                        if ("function" != typeof e) throw new l("`fn` is not a function");
                                        if ("number" != typeof t || t < 0 || t > 4294967295 || c(t) !== t) throw new l("`length` must be a positive 32-bit integer");
                                        var n = arguments.length > 2 && !!arguments[2],
                                            r = !0,
                                            s = !0;
                                        if ("length" in e && i) {
                                            var u = i(e, "length");
                                            u && !u.configurable && (r = !1), u && !u.writable && (s = !1)
                                        }
                                        return (r || s || !n) && (a ? o(e, "length", t, !0, !0) : o(e, "length", t)), e
                                    }
                                },
                                402: function(e, t, n) {
                                    "use strict";
                                    var r = n(651),
                                        o = n(913),
                                        a = n(937),
                                        i = n(785),
                                        c = r("%WeakMap%", !0),
                                        s = r("%Map%", !0),
                                        u = o("WeakMap.prototype.get", !0),
                                        d = o("WeakMap.prototype.set", !0),
                                        f = o("WeakMap.prototype.has", !0),
                                        p = o("Map.prototype.get", !0),
                                        y = o("Map.prototype.set", !0),
                                        h = o("Map.prototype.has", !0),
                                        m = function(e, t) {
                                            for (var n, r = e; null !== (n = r.next); r = n)
                                                if (n.key === t) return r.next = n.next, n.next = e.next, e.next = n, n
                                        };
                                    e.exports = function() {
                                        var e, t, n, r = {
                                            assert: function(e) {
                                                if (!r.has(e)) throw new i("Side channel does not contain " + a(e))
                                            },
                                            get: function(r) {
                                                if (c && r && ("object" == l(r) || "function" == typeof r)) {
                                                    if (e) return u(e, r)
                                                } else if (s) {
                                                    if (t) return p(t, r)
                                                } else if (n) return function(e, t) {
                                                    var n = m(e, t);
                                                    return n && n.value
                                                }(n, r)
                                            },
                                            has: function(r) {
                                                if (c && r && ("object" == l(r) || "function" == typeof r)) {
                                                    if (e) return f(e, r)
                                                } else if (s) {
                                                    if (t) return h(t, r)
                                                } else if (n) return function(e, t) {
                                                    return !!m(e, t)
                                                }(n, r);
                                                return !1
                                            },
                                            set: function(r, o) {
                                                c && r && ("object" == l(r) || "function" == typeof r) ? (e || (e = new c), d(e, r, o)) : s ? (t || (t = new s), y(t, r, o)) : (n || (n = {
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
                            var a = t[r] = {
                                exports: {}
                            };
                            return e[r](a, a.exports, n), a.exports
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
                            if ("object" == ("undefined" == typeof globalThis ? "undefined" : l(globalThis))) return globalThis;
                            try {
                                return this || new Function("return this")()
                            } catch (e) {
                                if ("object" == ("undefined" == typeof window ? "undefined" : l(window))) return window
                            }
                        }(), n.o = function(e, t) {
                            return Object.prototype.hasOwnProperty.call(e, t)
                        };
                        var r = {};
                        return function() {
                            "use strict";
                            n.d(r, {
                                default: function() {
                                    return P
                                }
                            });
                            var e, t, o, a = n(882),
                                i = n.n(a);

                            function l(e) {
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
                                s = n.n(c),
                                u = function() {
                                    return u = Object.assign || function(e) {
                                        for (var t, n = 1, r = arguments.length; n < r; n++)
                                            for (var o in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
                                        return e
                                    }, u.apply(this, arguments)
                                };

                            function d(e) {
                                return Array.isArray(e) ? e.map(d) : function(e) {
                                    return null != e && e.constructor === Object
                                }(e) ? Object.keys(e).reduce((function(t, n) {
                                    var r;
                                    return u(u({}, t), ((r = {})[s()(n)] = d(e[n]), r))
                                }), {}) : e
                            }
                            var f = function(e) {
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
                                p = function(e, t) {
                                    var n = "function" == typeof Symbol && e[Symbol.iterator];
                                    if (!n) return e;
                                    var r, o, a = n.call(e),
                                        i = [];
                                    try {
                                        for (;
                                            (void 0 === t || t-- > 0) && !(r = a.next()).done;) i.push(r.value)
                                    } catch (e) {
                                        o = {
                                            error: e
                                        }
                                    } finally {
                                        try {
                                            r && !r.done && (n = a.return) && n.call(a)
                                        } finally {
                                            if (o) throw o.error
                                        }
                                    }
                                    return i
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
                                var r, o, a, i;
                                void 0 === n && (n = []);
                                var l = document.createElementNS("http://www.w3.org/2000/svg", e);
                                try {
                                    for (var c = f(Object.entries(t)), s = c.next(); !s.done; s = c.next()) {
                                        var u = p(s.value, 2),
                                            d = u[0],
                                            y = u[1];
                                        "className" === d && (d = "class"), l.setAttribute(d, y)
                                    }
                                } catch (e) {
                                    r = {
                                        error: e
                                    }
                                } finally {
                                    try {
                                        s && !s.done && (o = c.return) && o.call(c)
                                    } finally {
                                        if (r) throw r.error
                                    }
                                }
                                try {
                                    for (var h = f(n), m = h.next(); !m.done; m = h.next()) {
                                        var v = m.value;
                                        !1 !== v && l.appendChild(v)
                                    }
                                } catch (e) {
                                    a = {
                                        error: e
                                    }
                                } finally {
                                    try {
                                        m && !m.done && (i = h.return) && i.call(h)
                                    } finally {
                                        if (a) throw a.error
                                    }
                                }
                                return l
                            }

                            function m(e, t, n) {
                                var r, o, a, i;
                                void 0 === n && (n = []);
                                var l = document.createElement(e);
                                try {
                                    for (var c = f(Object.entries(t)), s = c.next(); !s.done; s = c.next()) {
                                        var u = p(s.value, 2),
                                            d = u[0],
                                            y = u[1];
                                        "className" === d && (d = "class"), l.setAttribute(d, y)
                                    }
                                } catch (e) {
                                    r = {
                                        error: e
                                    }
                                } finally {
                                    try {
                                        s && !s.done && (o = c.return) && o.call(c)
                                    } finally {
                                        if (r) throw r.error
                                    }
                                }
                                try {
                                    for (var h = f(n), m = h.next(); !m.done; m = h.next()) {
                                        var v = m.value;
                                        !1 !== v && ("string" == typeof v ? l.appendChild(document.createTextNode(v)) : l.appendChild(v))
                                    }
                                } catch (e) {
                                    a = {
                                        error: e
                                    }
                                } finally {
                                    try {
                                        m && !m.done && (i = h.return) && i.call(h)
                                    } finally {
                                        if (a) throw a.error
                                    }
                                }
                                return l
                            }

                            function v(e) {
                                return "string" == typeof e ? e : "number" == typeof e ? "".concat(e, "px") : ""
                            }
                            var g = ["allow-scripts", "allow-same-origin", "allow-popups"],
                                b = ["allow-forms", "allow-modals", "allow-top-navigation-by-user-activation"];

                            function C(e, t, n, r) {
                                var o = r.accountId,
                                    a = r.accountTypeId,
                                    c = r.environment,
                                    s = r.environmentId,
                                    u = r.fields,
                                    f = r.frameAncestors,
                                    p = r.frameHeight,
                                    y = r.frameWidth,
                                    h = r.host,
                                    m = r.iframeTitle,
                                    C = r.inquiryId,
                                    w = r.language,
                                    S = r.messageTargetOrigin,
                                    E = r.referenceId,
                                    P = r.routingCountry,
                                    T = r.sandboxAttributes,
                                    x = void 0 === T ? b : T,
                                    A = r.sessionToken,
                                    I = r.styleVariant,
                                    k = r.templateId,
                                    D = r.templateVersionId,
                                    N = r.themeSetId,
                                    O = r.widgetPadding,
                                    M = !(!k && !D),
                                    R = null == k ? void 0 : k.startsWith("itmpl_");
                                if (!M && !C) throw new Error("Either templateId/templateVersionId or inquiryId must be specified to start a flow");
                                if (M && C) throw new Error("Only one of templateId/templateVersionId or inquiryId should be specified to start a flow");
                                if (o) {
                                    if (E) throw new Error("Cannot pass both accountId and referenceId");
                                    if (a) throw new Error("Cannot pass both accountId and accountTypeId")
                                }
                                var j = l(h),
                                    F = i()({
                                        "client-version": "5.1.5",
                                        "container-id": t,
                                        "flow-type": n,
                                        "routing-country": P,
                                        "template-id": (R ? null : k) || null,
                                        "inquiry-template-id": (R ? k : null) || null,
                                        "inquiry-template-version-id": D || null,
                                        environment: c,
                                        "environment-id": s,
                                        "iframe-origin": window.location.origin,
                                        "frame-ancestors": null != f ? f : null,
                                        "message-target-origin": S || null,
                                        "inquiry-id": C || null,
                                        language: w,
                                        "session-token": A,
                                        "reference-id": E,
                                        "account-id": o,
                                        "account-type-id": a,
                                        fields: d(null != u ? u : {}),
                                        "style-variant": I || null,
                                        "theme-set-id": N,
                                        "widget-padding": O
                                    }, {
                                        addQueryPrefix: !0,
                                        skipNulls: !0
                                    });
                                return e.style.maxHeight = v(p), e.style.maxWidth = v(y), e.setAttribute("data-testid", "persona-widget__iframe"), "embedded" === n && e.setAttribute("aria-modal", "true"), e.title = null != m ? m : "Verify your identity", e.className = "persona-widget__iframe", e.allow = "camera;microphone;clipboard-write", e.setAttribute("sandbox", g.concat(x).join(" ")), e.frameBorder = "0", e.src = j + "/widget" + F, e.onload = function() {}, e
                            }
                            var w = function() {
                                    function e() {}
                                    return e.log = function(e, t) {
                                        void 0 === t && (t = "info")
                                    }, e
                                }(),
                                S = function(e) {
                                    return e.split(".").slice(-2).join(".")
                                };

                            function E(t, n) {
                                var r = n.onLoad,
                                    o = n.onReady,
                                    a = n.onComplete,
                                    i = n.onEvent,
                                    c = n.onCancel,
                                    s = n.onError,
                                    u = n.templateId,
                                    d = n.templateVersionId,
                                    f = n.host,
                                    p = function(n) {
                                        var p, y = l(null != f ? f : "production");
                                        if ("" !== n.origin) try {
                                            if (S(new URL(n.origin).host) !== S(new URL(y).host)) return
                                        } catch (e) {
                                            return
                                        }
                                        if (!(u && u !== n.data.templateId || d && d !== n.data.templateVersionId || n.data.containerId && t !== n.data.containerId)) switch (null == i || i(n.data.name, n.data.metadata), n.data.name) {
                                            case e.Load:
                                                null == r || r();
                                                break;
                                            case e.Ready:
                                                null == o || o();
                                                break;
                                            case e.Complete:
                                            case e.Fail:
                                                null == a || a({
                                                    inquiryId: n.data.metadata.inquiryId,
                                                    status: n.data.metadata.status,
                                                    fields: null !== (p = n.data.metadata.fields) && void 0 !== p ? p : n.data.metadata.scopes
                                                });
                                                break;
                                            case e.Cancel:
                                                null == c || c({
                                                    inquiryId: n.data.metadata.inquiryId,
                                                    sessionToken: n.data.metadata.sessionToken
                                                });
                                                break;
                                            case e.Error:
                                                null == s || s(n.data.error)
                                        }
                                    };
                                return window.addEventListener("message", p),
                                    function() {
                                        window.removeEventListener("message", p)
                                    }
                            }
                            var P = {
                                Client: function() {
                                    function e(e) {
                                        var t, n, r, o, a, i, l, c, s, u, d, f = this;
                                        this._isLoading = !0, this._isOpen = !1, this.personaCSS = new y("persona-widget-styles"), this.globalCSS = new y("persona-global-styles"), this.onLoad = function() {
                                            var e, t;
                                            f._isLoading = !1, f.render(), null === (t = (e = f.options).onLoad) || void 0 === t || t.call(e)
                                        }, this.onReady = function() {
                                            var e, t;
                                            null === (t = (e = f.options).onReady) || void 0 === t || t.call(e)
                                        }, this.onComplete = function(e) {
                                            var t, n, r = e.inquiryId,
                                                o = e.status,
                                                a = e.fields;
                                            f._isOpen = !1, f.render(), null === (n = (t = f.options).onComplete) || void 0 === n || n.call(t, {
                                                inquiryId: r,
                                                status: o,
                                                fields: a
                                            })
                                        }, this.onCancel = function(e) {
                                            var t, n, r = e.inquiryId,
                                                o = e.sessionToken;
                                            f._isOpen = !1, f.render(), null === (n = (t = f.options).onCancel) || void 0 === n || n.call(t, {
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
                                        })])]), this.containerElement.append(this.loadingElement), this.isLoading ? this.loadingElement.style.display = "block" : this.loadingElement.style.display = "none", this.iframeElement = document.createElement("iframe"), this.unsubscribeFromEvents = E(this.containerId, {
                                            onLoad: null !== (r = this.onLoad) && void 0 !== r ? r : null,
                                            onReady: null !== (o = this.onReady) && void 0 !== o ? o : null,
                                            onComplete: null !== (a = this.onComplete) && void 0 !== a ? a : null,
                                            onCancel: null !== (i = this.onCancel) && void 0 !== i ? i : null,
                                            onEvent: null !== (l = this.options.onEvent) && void 0 !== l ? l : null,
                                            onError: null !== (c = this.options.onError) && void 0 !== c ? c : null,
                                            templateId: null !== (s = this.options.templateId) && void 0 !== s ? s : null,
                                            templateVersionId: null !== (u = this.options.templateVersionId) && void 0 !== u ? u : null,
                                            host: null !== (d = this.options.host) && void 0 !== d ? d : null
                                        }), this.containerElement.appendChild(this.iframeElement), this.containerParent.appendChild(this.containerElement), this.personaCSS.mount("@keyframes persona-widget__fadeIn {\n  from {\n    background-color: rgba(0, 0, 0, 0);\n    opacity: 0;\n  }\n  to {\n    /* persona-widget__overlay opacity = 0.7 */\n    background-color: rgba(0, 0, 0, 0.7);\n    opacity: 1;\n  }\n}\n\n@keyframes persona-widget__genieSlideIn {\n  from {\n    transform: translate(-50%, -40%) scale(0.8);\n  }\n  90% {\n    transform: translate(-50%, -51%) scale(1.01);\n  }\n  to {\n    transform: translate(-50%, -50%);\n  }\n}\n\n@keyframes persona-widget__slideDown {\n  from {\n    transform: translate(-50%, -55%);\n  }\n  to {\n    transform: translate(-50%, -50%);\n  }\n}\n\n.persona-widget__overlay {\n  position: fixed;\n  left: 0;\n  top: 0;\n  right: 0;\n  bottom: 0;\n  z-index: 9999;\n  animation: persona-widget__fadeIn 0.3s;\n  background-color: rgba(0, 0, 0, 0.7);\n}\n\n.persona-widget__overlay .persona-widget__centered-frame {\n  width: 120px;\n  height: 120px;\n  position: absolute;\n  left: calc(50% - 60px);\n  top: calc(50% - 60px);\n  z-index: 9999;\n}\n\n.persona-widget__overlay .persona-widget__loading-spinner {\n  position: absolute;\n  top: 50%;\n  left: 50%;\n  transform: translate(-50%, -50%);\n}\n\n.persona-widget__overlay .persona-widget__iframe {\n  animation: persona-widget__genieSlideIn 0.3s, persona-widget__slideDown ease-out 0.3s;\n\n  width: 100%;\n  height: 100%;\n\n  margin-left: auto;\n  margin-right: auto;\n  position: absolute;\n  left: 50%;\n  top: 50%;\n  transform: translate(-50%, -50%);\n\n  background-color: #ffffff;\n  border: none;\n  border-radius: 4px;\n  box-shadow: 0px 12px 40px 2px rgba(0, 0, 0, 0.4);\n\n  @media only screen and (min-width: 600.02px) and (min-height: 600.02px) {\n    max-width: 400px;\n    max-height: 650px;\n  }\n}\n");
                                        try {
                                            this.iframeElement = C(this.iframeElement, this.containerId, "embedded", this.options)
                                        } catch (e) {
                                            throw console.error("Persona", e), this.destroy(), e
                                        }
                                        this.render()
                                    }
                                    return e.preload = function(e) {
                                        return void 0 === e && (e = "production"), new Promise((function(t) {
                                            var n = l(e),
                                                r = document.createElement("iframe");
                                            r.frameBorder = "0", r.style.height = "0px", r.style.width = "0px", r.style.display = "none", r.src = n + "/preload", document.body.appendChild(r), r.onload = function() {
                                                document.body.removeChild(r), t()
                                            }
                                        }))
                                    }, e.prototype.render = function() {
                                        var e;
                                        null != this.containerElement ? (this.loadingElement.style.display = this.isLoading ? "block" : "none", this.containerElement.style.display = this.isOpen ? "block" : "none", this.isOpen && !this.globalCSS.isMounted() ? this.globalCSS.mount((e = this.containerId, "\n  /* Don't allow scrolling when widget is open */\n  html body {\n    overflow: hidden !important;\n  }\n\n  /* When the widget takes the full screen, hide everything else to prevent iOS scroll issues. */\n  @media ".concat("(max-width: 600px), (max-height: 420px)", " {\n    html body > *:not(#").concat(e, ") {\n      display: none !important;\n    }\n  }\n"))) : !this.isOpen && this.globalCSS.isMounted() && this.globalCSS.unmount()) : w.log("Cannot render client that has been destroyed", "error")
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
                                            return l(this.options.host)
                                        },
                                        enumerable: !1,
                                        configurable: !0
                                    }), e
                                }(),
                                setupIframe: C,
                                setupEvents: E
                            }
                        }(), r.default
                    }()
                }, "object" == l(t) && "object" == l(e) ? e.exports = i() : (o = [], void 0 === (a = "function" == typeof(r = i) ? r.apply(t, o) : r) || (e.exports = a))
            },
            5574: function(e, t, n) {
                var r = n(5024),
                    o = n(3496),
                    a = n(8154),
                    i = n(195);

                function l(e, t, n, a, i) {
                    var l = [].slice.call(arguments, 1),
                        c = l.length,
                        s = "function" == typeof l[c - 1];
                    if (!s && !r()) throw new Error("Callback required as last argument");
                    if (!s) {
                        if (c < 1) throw new Error("Too few arguments provided");
                        return 1 === c ? (n = t, t = a = void 0) : 2 !== c || t.getContext || (a = n, n = t, t = void 0), new Promise((function(r, i) {
                            try {
                                var l = o.create(n, a);
                                r(e(l, t, a))
                            } catch (e) {
                                i(e)
                            }
                        }))
                    }
                    if (c < 2) throw new Error("Too few arguments provided");
                    2 === c ? (i = n, n = t, t = a = void 0) : 3 === c && (t.getContext && void 0 === i ? (i = a, a = void 0) : (i = a, a = n, n = t, t = void 0));
                    try {
                        var u = o.create(n, a);
                        i(null, e(u, t, a))
                    } catch (e) {
                        i(e)
                    }
                }
                t.create = o.create, l.bind(null, a.render), t.toDataURL = l.bind(null, a.renderToDataURL), l.bind(null, (function(e, t, n) {
                    return i.render(e, n)
                }))
            },
            5024: function(e) {
                e.exports = function() {
                    return "function" == typeof Promise && Promise.prototype && Promise.prototype.then
                }
            },
            3498: function(e, t, n) {
                var r = n(2701).getSymbolSize;
                t.getRowColCoords = function(e) {
                    if (1 === e) return [];
                    for (var t = Math.floor(e / 7) + 2, n = r(e), o = 145 === n ? 26 : 2 * Math.ceil((n - 13) / (2 * t - 2)), a = [n - 7], i = 1; i < t - 1; i++) a[i] = a[i - 1] - o;
                    return a.push(6), a.reverse()
                }, t.getPositions = function(e) {
                    for (var n = [], r = t.getRowColCoords(e), o = r.length, a = 0; a < o; a++)
                        for (var i = 0; i < o; i++) 0 === a && 0 === i || 0 === a && i === o - 1 || a === o - 1 && 0 === i || n.push([r[a], r[i]]);
                    return n
                }
            },
            2734: function(e, t, n) {
                var r = n(1145),
                    o = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", " ", "$", "%", "*", "+", "-", ".", "/", ":"];

                function a(e) {
                    this.mode = r.ALPHANUMERIC, this.data = e
                }
                a.getBitsLength = function(e) {
                    return 11 * Math.floor(e / 2) + e % 2 * 6
                }, a.prototype.getLength = function() {
                    return this.data.length
                }, a.prototype.getBitsLength = function() {
                    return a.getBitsLength(this.data.length)
                }, a.prototype.write = function(e) {
                    var t;
                    for (t = 0; t + 2 <= this.data.length; t += 2) {
                        var n = 45 * o.indexOf(this.data[t]);
                        n += o.indexOf(this.data[t + 1]), e.put(n, 11)
                    }
                    this.data.length % 2 && e.put(o.indexOf(this.data[t]), 6)
                }, e.exports = a
            },
            5330: function(e) {
                function t() {
                    this.buffer = [], this.length = 0
                }
                t.prototype = {
                    get: function(e) {
                        var t = Math.floor(e / 8);
                        return 1 == (this.buffer[t] >>> 7 - e % 8 & 1)
                    },
                    put: function(e, t) {
                        for (var n = 0; n < t; n++) this.putBit(1 == (e >>> t - n - 1 & 1))
                    },
                    getLengthInBits: function() {
                        return this.length
                    },
                    putBit: function(e) {
                        var t = Math.floor(this.length / 8);
                        this.buffer.length <= t && this.buffer.push(0), e && (this.buffer[t] |= 128 >>> this.length % 8), this.length++
                    }
                }, e.exports = t
            },
            7345: function(e) {
                function t(e) {
                    if (!e || e < 1) throw new Error("BitMatrix size must be defined and greater than 0");
                    this.size = e, this.data = new Uint8Array(e * e), this.reservedBit = new Uint8Array(e * e)
                }
                t.prototype.set = function(e, t, n, r) {
                    var o = e * this.size + t;
                    this.data[o] = n, r && (this.reservedBit[o] = !0)
                }, t.prototype.get = function(e, t) {
                    return this.data[e * this.size + t]
                }, t.prototype.xor = function(e, t, n) {
                    this.data[e * this.size + t] ^= n
                }, t.prototype.isReserved = function(e, t) {
                    return this.reservedBit[e * this.size + t]
                }, e.exports = t
            },
            7557: function(e, t, n) {
                var r = n(5717),
                    o = n(1145);

                function a(e) {
                    this.mode = o.BYTE, "string" == typeof e && (e = r(e)), this.data = new Uint8Array(e)
                }
                a.getBitsLength = function(e) {
                    return 8 * e
                }, a.prototype.getLength = function() {
                    return this.data.length
                }, a.prototype.getBitsLength = function() {
                    return a.getBitsLength(this.data.length)
                }, a.prototype.write = function(e) {
                    for (var t = 0, n = this.data.length; t < n; t++) e.put(this.data[t], 8)
                }, e.exports = a
            },
            7185: function(e, t, n) {
                var r = n(5308),
                    o = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 1, 2, 2, 4, 1, 2, 4, 4, 2, 4, 4, 4, 2, 4, 6, 5, 2, 4, 6, 6, 2, 5, 8, 8, 4, 5, 8, 8, 4, 5, 8, 11, 4, 8, 10, 11, 4, 9, 12, 16, 4, 9, 16, 16, 6, 10, 12, 18, 6, 10, 17, 16, 6, 11, 16, 19, 6, 13, 18, 21, 7, 14, 21, 25, 8, 16, 20, 25, 8, 17, 23, 25, 9, 17, 23, 34, 9, 18, 25, 30, 10, 20, 27, 32, 12, 21, 29, 35, 12, 23, 34, 37, 12, 25, 34, 40, 13, 26, 35, 42, 14, 28, 38, 45, 15, 29, 40, 48, 16, 31, 43, 51, 17, 33, 45, 54, 18, 35, 48, 57, 19, 37, 51, 60, 19, 38, 53, 63, 20, 40, 56, 66, 21, 43, 59, 70, 22, 45, 62, 74, 24, 47, 65, 77, 25, 49, 68, 81],
                    a = [7, 10, 13, 17, 10, 16, 22, 28, 15, 26, 36, 44, 20, 36, 52, 64, 26, 48, 72, 88, 36, 64, 96, 112, 40, 72, 108, 130, 48, 88, 132, 156, 60, 110, 160, 192, 72, 130, 192, 224, 80, 150, 224, 264, 96, 176, 260, 308, 104, 198, 288, 352, 120, 216, 320, 384, 132, 240, 360, 432, 144, 280, 408, 480, 168, 308, 448, 532, 180, 338, 504, 588, 196, 364, 546, 650, 224, 416, 600, 700, 224, 442, 644, 750, 252, 476, 690, 816, 270, 504, 750, 900, 300, 560, 810, 960, 312, 588, 870, 1050, 336, 644, 952, 1110, 360, 700, 1020, 1200, 390, 728, 1050, 1260, 420, 784, 1140, 1350, 450, 812, 1200, 1440, 480, 868, 1290, 1530, 510, 924, 1350, 1620, 540, 980, 1440, 1710, 570, 1036, 1530, 1800, 570, 1064, 1590, 1890, 600, 1120, 1680, 1980, 630, 1204, 1770, 2100, 660, 1260, 1860, 2220, 720, 1316, 1950, 2310, 750, 1372, 2040, 2430];
                t.getBlocksCount = function(e, t) {
                    switch (t) {
                        case r.L:
                            return o[4 * (e - 1) + 0];
                        case r.M:
                            return o[4 * (e - 1) + 1];
                        case r.Q:
                            return o[4 * (e - 1) + 2];
                        case r.H:
                            return o[4 * (e - 1) + 3];
                        default:
                            return
                    }
                }, t.getTotalCodewordsCount = function(e, t) {
                    switch (t) {
                        case r.L:
                            return a[4 * (e - 1) + 0];
                        case r.M:
                            return a[4 * (e - 1) + 1];
                        case r.Q:
                            return a[4 * (e - 1) + 2];
                        case r.H:
                            return a[4 * (e - 1) + 3];
                        default:
                            return
                    }
                }
            },
            5308: function(e, t) {
                t.L = {
                    bit: 1
                }, t.M = {
                    bit: 0
                }, t.Q = {
                    bit: 3
                }, t.H = {
                    bit: 2
                }, t.isValid = function(e) {
                    return e && void 0 !== e.bit && e.bit >= 0 && e.bit < 4
                }, t.from = function(e, n) {
                    if (t.isValid(e)) return e;
                    try {
                        return function(e) {
                            if ("string" != typeof e) throw new Error("Param is not a string");
                            switch (e.toLowerCase()) {
                                case "l":
                                case "low":
                                    return t.L;
                                case "m":
                                case "medium":
                                    return t.M;
                                case "q":
                                case "quartile":
                                    return t.Q;
                                case "h":
                                case "high":
                                    return t.H;
                                default:
                                    throw new Error("Unknown EC Level: " + e)
                            }
                        }(e)
                    } catch (e) {
                        return n
                    }
                }
            },
            6305: function(e, t, n) {
                var r = n(2701).getSymbolSize;
                t.getPositions = function(e) {
                    var t = r(e);
                    return [
                        [0, 0],
                        [t - 7, 0],
                        [0, t - 7]
                    ]
                }
            },
            5826: function(e, t, n) {
                var r = n(2701),
                    o = r.getBCHDigit(1335);
                t.getEncodedBits = function(e, t) {
                    for (var n = e.bit << 3 | t, a = n << 10; r.getBCHDigit(a) - o >= 0;) a ^= 1335 << r.getBCHDigit(a) - o;
                    return 21522 ^ (n << 10 | a)
                }
            },
            2666: function(e, t) {
                var n = new Uint8Array(512),
                    r = new Uint8Array(256);
                ! function() {
                    for (var e = 1, t = 0; t < 255; t++) n[t] = e, r[e] = t, 256 & (e <<= 1) && (e ^= 285);
                    for (var o = 255; o < 512; o++) n[o] = n[o - 255]
                }(), t.log = function(e) {
                    if (e < 1) throw new Error("log(" + e + ")");
                    return r[e]
                }, t.exp = function(e) {
                    return n[e]
                }, t.mul = function(e, t) {
                    return 0 === e || 0 === t ? 0 : n[r[e] + r[t]]
                }
            },
            3308: function(e, t, n) {
                var r = n(1145),
                    o = n(2701);

                function a(e) {
                    this.mode = r.KANJI, this.data = e
                }
                a.getBitsLength = function(e) {
                    return 13 * e
                }, a.prototype.getLength = function() {
                    return this.data.length
                }, a.prototype.getBitsLength = function() {
                    return a.getBitsLength(this.data.length)
                }, a.prototype.write = function(e) {
                    var t;
                    for (t = 0; t < this.data.length; t++) {
                        var n = o.toSJIS(this.data[t]);
                        if (n >= 33088 && n <= 40956) n -= 33088;
                        else {
                            if (!(n >= 57408 && n <= 60351)) throw new Error("Invalid SJIS character: " + this.data[t] + "\nMake sure your charset is UTF-8");
                            n -= 49472
                        }
                        n = 192 * (n >>> 8 & 255) + (255 & n), e.put(n, 13)
                    }
                }, e.exports = a
            },
            4029: function(e, t) {
                t.Patterns = {
                    PATTERN000: 0,
                    PATTERN001: 1,
                    PATTERN010: 2,
                    PATTERN011: 3,
                    PATTERN100: 4,
                    PATTERN101: 5,
                    PATTERN110: 6,
                    PATTERN111: 7
                };
                var n = 3,
                    r = 3,
                    o = 40,
                    a = 10;

                function i(e, n, r) {
                    switch (e) {
                        case t.Patterns.PATTERN000:
                            return (n + r) % 2 == 0;
                        case t.Patterns.PATTERN001:
                            return n % 2 == 0;
                        case t.Patterns.PATTERN010:
                            return r % 3 == 0;
                        case t.Patterns.PATTERN011:
                            return (n + r) % 3 == 0;
                        case t.Patterns.PATTERN100:
                            return (Math.floor(n / 2) + Math.floor(r / 3)) % 2 == 0;
                        case t.Patterns.PATTERN101:
                            return n * r % 2 + n * r % 3 == 0;
                        case t.Patterns.PATTERN110:
                            return (n * r % 2 + n * r % 3) % 2 == 0;
                        case t.Patterns.PATTERN111:
                            return (n * r % 3 + (n + r) % 2) % 2 == 0;
                        default:
                            throw new Error("bad maskPattern:" + e)
                    }
                }
                t.isValid = function(e) {
                    return null != e && "" !== e && !isNaN(e) && e >= 0 && e <= 7
                }, t.from = function(e) {
                    return t.isValid(e) ? parseInt(e, 10) : void 0
                }, t.getPenaltyN1 = function(e) {
                    for (var t = e.size, r = 0, o = 0, a = 0, i = null, l = null, c = 0; c < t; c++) {
                        o = a = 0, i = l = null;
                        for (var s = 0; s < t; s++) {
                            var u = e.get(c, s);
                            u === i ? o++ : (o >= 5 && (r += n + (o - 5)), i = u, o = 1), (u = e.get(s, c)) === l ? a++ : (a >= 5 && (r += n + (a - 5)), l = u, a = 1)
                        }
                        o >= 5 && (r += n + (o - 5)), a >= 5 && (r += n + (a - 5))
                    }
                    return r
                }, t.getPenaltyN2 = function(e) {
                    for (var t = e.size, n = 0, o = 0; o < t - 1; o++)
                        for (var a = 0; a < t - 1; a++) {
                            var i = e.get(o, a) + e.get(o, a + 1) + e.get(o + 1, a) + e.get(o + 1, a + 1);
                            4 !== i && 0 !== i || n++
                        }
                    return n * r
                }, t.getPenaltyN3 = function(e) {
                    for (var t = e.size, n = 0, r = 0, a = 0, i = 0; i < t; i++) {
                        r = a = 0;
                        for (var l = 0; l < t; l++) r = r << 1 & 2047 | e.get(i, l), l >= 10 && (1488 === r || 93 === r) && n++, a = a << 1 & 2047 | e.get(l, i), l >= 10 && (1488 === a || 93 === a) && n++
                    }
                    return n * o
                }, t.getPenaltyN4 = function(e) {
                    for (var t = 0, n = e.data.length, r = 0; r < n; r++) t += e.data[r];
                    return Math.abs(Math.ceil(100 * t / n / 5) - 10) * a
                }, t.applyMask = function(e, t) {
                    for (var n = t.size, r = 0; r < n; r++)
                        for (var o = 0; o < n; o++) t.isReserved(o, r) || t.xor(o, r, i(e, o, r))
                }, t.getBestMask = function(e, n) {
                    for (var r = Object.keys(t.Patterns).length, o = 0, a = 1 / 0, i = 0; i < r; i++) {
                        n(i), t.applyMask(i, e);
                        var l = t.getPenaltyN1(e) + t.getPenaltyN2(e) + t.getPenaltyN3(e) + t.getPenaltyN4(e);
                        t.applyMask(i, e), l < a && (a = l, o = i)
                    }
                    return o
                }
            },
            1145: function(e, t, n) {
                var r = n(2893),
                    o = n(2795);
                t.NUMERIC = {
                    id: "Numeric",
                    bit: 1,
                    ccBits: [10, 12, 14]
                }, t.ALPHANUMERIC = {
                    id: "Alphanumeric",
                    bit: 2,
                    ccBits: [9, 11, 13]
                }, t.BYTE = {
                    id: "Byte",
                    bit: 4,
                    ccBits: [8, 16, 16]
                }, t.KANJI = {
                    id: "Kanji",
                    bit: 8,
                    ccBits: [8, 10, 12]
                }, t.MIXED = {
                    bit: -1
                }, t.getCharCountIndicator = function(e, t) {
                    if (!e.ccBits) throw new Error("Invalid mode: " + e);
                    if (!r.isValid(t)) throw new Error("Invalid version: " + t);
                    return t >= 1 && t < 10 ? e.ccBits[0] : t < 27 ? e.ccBits[1] : e.ccBits[2]
                }, t.getBestModeForData = function(e) {
                    return o.testNumeric(e) ? t.NUMERIC : o.testAlphanumeric(e) ? t.ALPHANUMERIC : o.testKanji(e) ? t.KANJI : t.BYTE
                }, t.toString = function(e) {
                    if (e && e.id) return e.id;
                    throw new Error("Invalid mode")
                }, t.isValid = function(e) {
                    return e && e.bit && e.ccBits
                }, t.from = function(e, n) {
                    if (t.isValid(e)) return e;
                    try {
                        return function(e) {
                            if ("string" != typeof e) throw new Error("Param is not a string");
                            switch (e.toLowerCase()) {
                                case "numeric":
                                    return t.NUMERIC;
                                case "alphanumeric":
                                    return t.ALPHANUMERIC;
                                case "kanji":
                                    return t.KANJI;
                                case "byte":
                                    return t.BYTE;
                                default:
                                    throw new Error("Unknown mode: " + e)
                            }
                        }(e)
                    } catch (e) {
                        return n
                    }
                }
            },
            8808: function(e, t, n) {
                var r = n(1145);

                function o(e) {
                    this.mode = r.NUMERIC, this.data = e.toString()
                }
                o.getBitsLength = function(e) {
                    return 10 * Math.floor(e / 3) + (e % 3 ? e % 3 * 3 + 1 : 0)
                }, o.prototype.getLength = function() {
                    return this.data.length
                }, o.prototype.getBitsLength = function() {
                    return o.getBitsLength(this.data.length)
                }, o.prototype.write = function(e) {
                    var t, n, r;
                    for (t = 0; t + 3 <= this.data.length; t += 3) n = this.data.substr(t, 3), r = parseInt(n, 10), e.put(r, 10);
                    var o = this.data.length - t;
                    o > 0 && (n = this.data.substr(t), r = parseInt(n, 10), e.put(r, 3 * o + 1))
                }, e.exports = o
            },
            9004: function(e, t, n) {
                var r = n(2666);
                t.mul = function(e, t) {
                    for (var n = new Uint8Array(e.length + t.length - 1), o = 0; o < e.length; o++)
                        for (var a = 0; a < t.length; a++) n[o + a] ^= r.mul(e[o], t[a]);
                    return n
                }, t.mod = function(e, t) {
                    for (var n = new Uint8Array(e); n.length - t.length >= 0;) {
                        for (var o = n[0], a = 0; a < t.length; a++) n[a] ^= r.mul(t[a], o);
                        for (var i = 0; i < n.length && 0 === n[i];) i++;
                        n = n.slice(i)
                    }
                    return n
                }, t.generateECPolynomial = function(e) {
                    for (var n = new Uint8Array([1]), o = 0; o < e; o++) n = t.mul(n, new Uint8Array([1, r.exp(o)]));
                    return n
                }
            },
            3496: function(e, t, n) {
                var r = n(2701),
                    o = n(5308),
                    a = n(5330),
                    i = n(7345),
                    l = n(3498),
                    c = n(6305),
                    s = n(4029),
                    u = n(7185),
                    d = n(7181),
                    f = n(2184),
                    p = n(5826),
                    y = n(1145),
                    h = n(144);

                function m(e, t, n) {
                    var r, o, a = e.size,
                        i = p.getEncodedBits(t, n);
                    for (r = 0; r < 15; r++) o = 1 == (i >> r & 1), r < 6 ? e.set(r, 8, o, !0) : r < 8 ? e.set(r + 1, 8, o, !0) : e.set(a - 15 + r, 8, o, !0), r < 8 ? e.set(8, a - r - 1, o, !0) : r < 9 ? e.set(8, 15 - r - 1 + 1, o, !0) : e.set(8, 15 - r - 1, o, !0);
                    e.set(a - 8, 8, 1, !0)
                }

                function v(e, t, n) {
                    var o = new a;
                    n.forEach((function(t) {
                        o.put(t.mode.bit, 4), o.put(t.getLength(), y.getCharCountIndicator(t.mode, e)), t.write(o)
                    }));
                    var i = 8 * (r.getSymbolTotalCodewords(e) - u.getTotalCodewordsCount(e, t));
                    for (o.getLengthInBits() + 4 <= i && o.put(0, 4); o.getLengthInBits() % 8 != 0;) o.putBit(0);
                    for (var l = (i - o.getLengthInBits()) / 8, c = 0; c < l; c++) o.put(c % 2 ? 17 : 236, 8);
                    return function(e, t, n) {
                        for (var o = r.getSymbolTotalCodewords(t), a = u.getTotalCodewordsCount(t, n), i = o - a, l = u.getBlocksCount(t, n), c = l - o % l, s = Math.floor(o / l), f = Math.floor(i / l), p = f + 1, y = s - f, h = new d(y), m = 0, v = new Array(l), g = new Array(l), b = 0, C = new Uint8Array(e.buffer), w = 0; w < l; w++) {
                            var S = w < c ? f : p;
                            v[w] = C.slice(m, m + S), g[w] = h.encode(v[w]), m += S, b = Math.max(b, S)
                        }
                        var E, P, T = new Uint8Array(o),
                            x = 0;
                        for (E = 0; E < b; E++)
                            for (P = 0; P < l; P++) E < v[P].length && (T[x++] = v[P][E]);
                        for (E = 0; E < y; E++)
                            for (P = 0; P < l; P++) T[x++] = g[P][E];
                        return T
                    }(o, e, t)
                }

                function g(e, t, n, o) {
                    var a;
                    if (Array.isArray(e)) a = h.fromArray(e);
                    else {
                        if ("string" != typeof e) throw new Error("Invalid data");
                        var u = t;
                        if (!u) {
                            var d = h.rawSplit(e);
                            u = f.getBestVersionForData(d, n)
                        }
                        a = h.fromString(e, u || 40)
                    }
                    var p = f.getBestVersionForData(a, n);
                    if (!p) throw new Error("The amount of data is too big to be stored in a QR Code");
                    if (t) {
                        if (t < p) throw new Error("\nThe chosen QR Code version cannot contain this amount of data.\nMinimum version required to store current data is: " + p + ".\n")
                    } else t = p;
                    var y = v(t, n, a),
                        g = r.getSymbolSize(t),
                        b = new i(g);
                    return function(e, t) {
                            for (var n = e.size, r = c.getPositions(t), o = 0; o < r.length; o++)
                                for (var a = r[o][0], i = r[o][1], l = -1; l <= 7; l++)
                                    if (!(a + l <= -1 || n <= a + l))
                                        for (var s = -1; s <= 7; s++) i + s <= -1 || n <= i + s || (l >= 0 && l <= 6 && (0 === s || 6 === s) || s >= 0 && s <= 6 && (0 === l || 6 === l) || l >= 2 && l <= 4 && s >= 2 && s <= 4 ? e.set(a + l, i + s, !0, !0) : e.set(a + l, i + s, !1, !0))
                        }(b, t),
                        function(e) {
                            for (var t = e.size, n = 8; n < t - 8; n++) {
                                var r = n % 2 == 0;
                                e.set(n, 6, r, !0), e.set(6, n, r, !0)
                            }
                        }(b),
                        function(e, t) {
                            for (var n = l.getPositions(t), r = 0; r < n.length; r++)
                                for (var o = n[r][0], a = n[r][1], i = -2; i <= 2; i++)
                                    for (var c = -2; c <= 2; c++) - 2 === i || 2 === i || -2 === c || 2 === c || 0 === i && 0 === c ? e.set(o + i, a + c, !0, !0) : e.set(o + i, a + c, !1, !0)
                        }(b, t), m(b, n, 0), t >= 7 && function(e, t) {
                            for (var n, r, o, a = e.size, i = f.getEncodedBits(t), l = 0; l < 18; l++) n = Math.floor(l / 3), r = l % 3 + a - 8 - 3, o = 1 == (i >> l & 1), e.set(n, r, o, !0), e.set(r, n, o, !0)
                        }(b, t),
                        function(e, t) {
                            for (var n = e.size, r = -1, o = n - 1, a = 7, i = 0, l = n - 1; l > 0; l -= 2)
                                for (6 === l && l--;;) {
                                    for (var c = 0; c < 2; c++)
                                        if (!e.isReserved(o, l - c)) {
                                            var s = !1;
                                            i < t.length && (s = 1 == (t[i] >>> a & 1)), e.set(o, l - c, s), -1 == --a && (i++, a = 7)
                                        } if ((o += r) < 0 || n <= o) {
                                        o -= r, r = -r;
                                        break
                                    }
                                }
                        }(b, y), isNaN(o) && (o = s.getBestMask(b, m.bind(null, b, n))), s.applyMask(o, b), m(b, n, o), {
                            modules: b,
                            version: t,
                            errorCorrectionLevel: n,
                            maskPattern: o,
                            segments: a
                        }
                }
                t.create = function(e, t) {
                    if (void 0 === e || "" === e) throw new Error("No input text");
                    var n, a, i = o.M;
                    return void 0 !== t && (i = o.from(t.errorCorrectionLevel, o.M), n = f.from(t.version), a = s.from(t.maskPattern), t.toSJISFunc && r.setToSJISFunction(t.toSJISFunc)), g(e, n, i, a)
                }
            },
            7181: function(e, t, n) {
                var r = n(9004);

                function o(e) {
                    this.genPoly = void 0, this.degree = e, this.degree && this.initialize(this.degree)
                }
                o.prototype.initialize = function(e) {
                    this.degree = e, this.genPoly = r.generateECPolynomial(this.degree)
                }, o.prototype.encode = function(e) {
                    if (!this.genPoly) throw new Error("Encoder not initialized");
                    var t = new Uint8Array(e.length + this.degree);
                    t.set(e);
                    var n = r.mod(t, this.genPoly),
                        o = this.degree - n.length;
                    if (o > 0) {
                        var a = new Uint8Array(this.degree);
                        return a.set(n, o), a
                    }
                    return n
                }, e.exports = o
            },
            2795: function(e, t) {
                var n = "[0-9]+",
                    r = "(?:[u3000-u303F]|[u3040-u309F]|[u30A0-u30FF]|[uFF00-uFFEF]|[u4E00-u9FAF]|[u2605-u2606]|[u2190-u2195]|u203B|[u2010u2015u2018u2019u2025u2026u201Cu201Du2225u2260]|[u0391-u0451]|[u00A7u00A8u00B1u00B4u00D7u00F7])+",
                    o = "(?:(?![A-Z0-9 $%*+\\-./:]|" + (r = r.replace(/u/g, "\\u")) + ")(?:.|[\r\n]))+";
                t.KANJI = new RegExp(r, "g"), t.BYTE_KANJI = new RegExp("[^A-Z0-9 $%*+\\-./:]+", "g"), t.BYTE = new RegExp(o, "g"), t.NUMERIC = new RegExp(n, "g"), t.ALPHANUMERIC = new RegExp("[A-Z $%*+\\-./:]+", "g");
                var a = new RegExp("^" + r + "$"),
                    i = new RegExp("^" + n + "$"),
                    l = new RegExp("^[A-Z0-9 $%*+\\-./:]+$");
                t.testKanji = function(e) {
                    return a.test(e)
                }, t.testNumeric = function(e) {
                    return i.test(e)
                }, t.testAlphanumeric = function(e) {
                    return l.test(e)
                }
            },
            144: function(e, t, n) {
                var r = n(1145),
                    o = n(8808),
                    a = n(2734),
                    i = n(7557),
                    l = n(3308),
                    c = n(2795),
                    s = n(2701),
                    u = n(5084);

                function d(e) {
                    return unescape(encodeURIComponent(e)).length
                }

                function f(e, t, n) {
                    for (var r, o = []; null !== (r = e.exec(n));) o.push({
                        data: r[0],
                        index: r.index,
                        mode: t,
                        length: r[0].length
                    });
                    return o
                }

                function p(e) {
                    var t, n, o = f(c.NUMERIC, r.NUMERIC, e),
                        a = f(c.ALPHANUMERIC, r.ALPHANUMERIC, e);
                    return s.isKanjiModeEnabled() ? (t = f(c.BYTE, r.BYTE, e), n = f(c.KANJI, r.KANJI, e)) : (t = f(c.BYTE_KANJI, r.BYTE, e), n = []), o.concat(a, t, n).sort((function(e, t) {
                        return e.index - t.index
                    })).map((function(e) {
                        return {
                            data: e.data,
                            mode: e.mode,
                            length: e.length
                        }
                    }))
                }

                function y(e, t) {
                    switch (t) {
                        case r.NUMERIC:
                            return o.getBitsLength(e);
                        case r.ALPHANUMERIC:
                            return a.getBitsLength(e);
                        case r.KANJI:
                            return l.getBitsLength(e);
                        case r.BYTE:
                            return i.getBitsLength(e)
                    }
                }

                function h(e, t) {
                    var n, c = r.getBestModeForData(e);
                    if ((n = r.from(t, c)) !== r.BYTE && n.bit < c.bit) throw new Error('"' + e + '" cannot be encoded with mode ' + r.toString(n) + ".\n Suggested mode is: " + r.toString(c));
                    switch (n !== r.KANJI || s.isKanjiModeEnabled() || (n = r.BYTE), n) {
                        case r.NUMERIC:
                            return new o(e);
                        case r.ALPHANUMERIC:
                            return new a(e);
                        case r.KANJI:
                            return new l(e);
                        case r.BYTE:
                            return new i(e)
                    }
                }
                t.fromArray = function(e) {
                    return e.reduce((function(e, t) {
                        return "string" == typeof t ? e.push(h(t, null)) : t.data && e.push(h(t.data, t.mode)), e
                    }), [])
                }, t.fromString = function(e, n) {
                    for (var o = function(e) {
                            for (var t = [], n = 0; n < e.length; n++) {
                                var o = e[n];
                                switch (o.mode) {
                                    case r.NUMERIC:
                                        t.push([o, {
                                            data: o.data,
                                            mode: r.ALPHANUMERIC,
                                            length: o.length
                                        }, {
                                            data: o.data,
                                            mode: r.BYTE,
                                            length: o.length
                                        }]);
                                        break;
                                    case r.ALPHANUMERIC:
                                        t.push([o, {
                                            data: o.data,
                                            mode: r.BYTE,
                                            length: o.length
                                        }]);
                                        break;
                                    case r.KANJI:
                                        t.push([o, {
                                            data: o.data,
                                            mode: r.BYTE,
                                            length: d(o.data)
                                        }]);
                                        break;
                                    case r.BYTE:
                                        t.push([{
                                            data: o.data,
                                            mode: r.BYTE,
                                            length: d(o.data)
                                        }])
                                }
                            }
                            return t
                        }(p(e, s.isKanjiModeEnabled())), a = function(e, t) {
                            for (var n = {}, o = {
                                    start: {}
                                }, a = ["start"], i = 0; i < e.length; i++) {
                                for (var l = e[i], c = [], s = 0; s < l.length; s++) {
                                    var u = l[s],
                                        d = "" + i + s;
                                    c.push(d), n[d] = {
                                        node: u,
                                        lastCount: 0
                                    }, o[d] = {};
                                    for (var f = 0; f < a.length; f++) {
                                        var p = a[f];
                                        n[p] && n[p].node.mode === u.mode ? (o[p][d] = y(n[p].lastCount + u.length, u.mode) - y(n[p].lastCount, u.mode), n[p].lastCount += u.length) : (n[p] && (n[p].lastCount = u.length), o[p][d] = y(u.length, u.mode) + 4 + r.getCharCountIndicator(u.mode, t))
                                    }
                                }
                                a = c
                            }
                            for (var h = 0; h < a.length; h++) o[a[h]].end = 0;
                            return {
                                map: o,
                                table: n
                            }
                        }(o, n), i = u.find_path(a.map, "start", "end"), l = [], c = 1; c < i.length - 1; c++) l.push(a.table[i[c]].node);
                    return t.fromArray(function(e) {
                        return e.reduce((function(e, t) {
                            var n = e.length - 1 >= 0 ? e[e.length - 1] : null;
                            return n && n.mode === t.mode ? (e[e.length - 1].data += t.data, e) : (e.push(t), e)
                        }), [])
                    }(l))
                }, t.rawSplit = function(e) {
                    return t.fromArray(p(e, s.isKanjiModeEnabled()))
                }
            },
            2701: function(e, t) {
                var n, r = [0, 26, 44, 70, 100, 134, 172, 196, 242, 292, 346, 404, 466, 532, 581, 655, 733, 815, 901, 991, 1085, 1156, 1258, 1364, 1474, 1588, 1706, 1828, 1921, 2051, 2185, 2323, 2465, 2611, 2761, 2876, 3034, 3196, 3362, 3532, 3706];
                t.getSymbolSize = function(e) {
                    if (!e) throw new Error('"version" cannot be null or undefined');
                    if (e < 1 || e > 40) throw new Error('"version" should be in range from 1 to 40');
                    return 4 * e + 17
                }, t.getSymbolTotalCodewords = function(e) {
                    return r[e]
                }, t.getBCHDigit = function(e) {
                    for (var t = 0; 0 !== e;) t++, e >>>= 1;
                    return t
                }, t.setToSJISFunction = function(e) {
                    if ("function" != typeof e) throw new Error('"toSJISFunc" is not a valid function.');
                    n = e
                }, t.isKanjiModeEnabled = function() {
                    return void 0 !== n
                }, t.toSJIS = function(e) {
                    return n(e)
                }
            },
            2893: function(e, t) {
                t.isValid = function(e) {
                    return !isNaN(e) && e >= 1 && e <= 40
                }
            },
            2184: function(e, t, n) {
                var r = n(2701),
                    o = n(7185),
                    a = n(5308),
                    i = n(1145),
                    l = n(2893),
                    c = r.getBCHDigit(7973);

                function s(e, t) {
                    return i.getCharCountIndicator(e, t) + 4
                }

                function u(e, t) {
                    var n = 0;
                    return e.forEach((function(e) {
                        var r = s(e.mode, t);
                        n += r + e.getBitsLength()
                    })), n
                }
                t.from = function(e, t) {
                    return l.isValid(e) ? parseInt(e, 10) : t
                }, t.getCapacity = function(e, t, n) {
                    if (!l.isValid(e)) throw new Error("Invalid QR Code version");
                    void 0 === n && (n = i.BYTE);
                    var a = 8 * (r.getSymbolTotalCodewords(e) - o.getTotalCodewordsCount(e, t));
                    if (n === i.MIXED) return a;
                    var c = a - s(n, e);
                    switch (n) {
                        case i.NUMERIC:
                            return Math.floor(c / 10 * 3);
                        case i.ALPHANUMERIC:
                            return Math.floor(c / 11 * 2);
                        case i.KANJI:
                            return Math.floor(c / 13);
                        case i.BYTE:
                        default:
                            return Math.floor(c / 8)
                    }
                }, t.getBestVersionForData = function(e, n) {
                    var r, o = a.from(n, a.M);
                    if (Array.isArray(e)) {
                        if (e.length > 1) return function(e, n) {
                            for (var r = 1; r <= 40; r++)
                                if (u(e, r) <= t.getCapacity(r, n, i.MIXED)) return r
                        }(e, o);
                        if (0 === e.length) return 1;
                        r = e[0]
                    } else r = e;
                    return function(e, n, r) {
                        for (var o = 1; o <= 40; o++)
                            if (n <= t.getCapacity(o, r, e)) return o
                    }(r.mode, r.getLength(), o)
                }, t.getEncodedBits = function(e) {
                    if (!l.isValid(e) || e < 7) throw new Error("Invalid QR Code version");
                    for (var t = e << 12; r.getBCHDigit(t) - c >= 0;) t ^= 7973 << r.getBCHDigit(t) - c;
                    return e << 12 | t
                }
            },
            8154: function(e, t, n) {
                var r = n(8793);
                t.render = function(e, t, n) {
                    var o = n,
                        a = t;
                    void 0 !== o || t && t.getContext || (o = t, t = void 0), t || (a = function() {
                        try {
                            return document.createElement("canvas")
                        } catch (e) {
                            throw new Error("You need to specify a canvas element")
                        }
                    }()), o = r.getOptions(o);
                    var i = r.getImageWidth(e.modules.size, o),
                        l = a.getContext("2d"),
                        c = l.createImageData(i, i);
                    return r.qrToImageData(c.data, e, o),
                        function(e, t, n) {
                            e.clearRect(0, 0, t.width, t.height), t.style || (t.style = {}), t.height = n, t.width = n, t.style.height = n + "px", t.style.width = n + "px"
                        }(l, a, i), l.putImageData(c, 0, 0), a
                }, t.renderToDataURL = function(e, n, r) {
                    var o = r;
                    void 0 !== o || n && n.getContext || (o = n, n = void 0), o || (o = {});
                    var a = t.render(e, n, o),
                        i = o.type || "image/png",
                        l = o.rendererOpts || {};
                    return a.toDataURL(i, l.quality)
                }
            },
            195: function(e, t, n) {
                var r = n(8793);

                function o(e, t) {
                    var n = e.a / 255,
                        r = t + '="' + e.hex + '"';
                    return n < 1 ? r + " " + t + '-opacity="' + n.toFixed(2).slice(1) + '"' : r
                }

                function a(e, t, n) {
                    var r = e + t;
                    return void 0 !== n && (r += " " + n), r
                }
                t.render = function(e, t, n) {
                    var i = r.getOptions(t),
                        l = e.modules.size,
                        c = e.modules.data,
                        s = l + 2 * i.margin,
                        u = i.color.light.a ? "<path " + o(i.color.light, "fill") + ' d="M0 0h' + s + "v" + s + 'H0z"/>' : "",
                        d = "<path " + o(i.color.dark, "stroke") + ' d="' + function(e, t, n) {
                            for (var r = "", o = 0, i = !1, l = 0, c = 0; c < e.length; c++) {
                                var s = Math.floor(c % t),
                                    u = Math.floor(c / t);
                                s || i || (i = !0), e[c] ? (l++, c > 0 && s > 0 && e[c - 1] || (r += i ? a("M", s + n, .5 + u + n) : a("m", o, 0), o = 0, i = !1), s + 1 < t && e[c + 1] || (r += a("h", l), l = 0)) : o++
                            }
                            return r
                        }(c, l, i.margin) + '"/>',
                        f = 'viewBox="0 0 ' + s + " " + s + '"',
                        p = '<svg xmlns="http://www.w3.org/2000/svg" ' + (i.width ? 'width="' + i.width + '" height="' + i.width + '" ' : "") + f + ' shape-rendering="crispEdges">' + u + d + "</svg>\n";
                    return "function" == typeof n && n(null, p), p
                }
            },
            8793: function(e, t) {
                function n(e) {
                    if ("number" == typeof e && (e = e.toString()), "string" != typeof e) throw new Error("Color should be defined as hex string");
                    var t = e.slice().replace("#", "").split("");
                    if (t.length < 3 || 5 === t.length || t.length > 8) throw new Error("Invalid hex color: " + e);
                    3 !== t.length && 4 !== t.length || (t = Array.prototype.concat.apply([], t.map((function(e) {
                        return [e, e]
                    })))), 6 === t.length && t.push("F", "F");
                    var n = parseInt(t.join(""), 16);
                    return {
                        r: n >> 24 & 255,
                        g: n >> 16 & 255,
                        b: n >> 8 & 255,
                        a: 255 & n,
                        hex: "#" + t.slice(0, 6).join("")
                    }
                }
                t.getOptions = function(e) {
                    e || (e = {}), e.color || (e.color = {});
                    var t = void 0 === e.margin || null === e.margin || e.margin < 0 ? 4 : e.margin,
                        r = e.width && e.width >= 21 ? e.width : void 0,
                        o = e.scale || 4;
                    return {
                        width: r,
                        scale: r ? 4 : o,
                        margin: t,
                        color: {
                            dark: n(e.color.dark || "#000000ff"),
                            light: n(e.color.light || "#ffffffff")
                        },
                        type: e.type,
                        rendererOpts: e.rendererOpts || {}
                    }
                }, t.getScale = function(e, t) {
                    return t.width && t.width >= e + 2 * t.margin ? t.width / (e + 2 * t.margin) : t.scale
                }, t.getImageWidth = function(e, n) {
                    var r = t.getScale(e, n);
                    return Math.floor((e + 2 * n.margin) * r)
                }, t.qrToImageData = function(e, n, r) {
                    for (var o = n.modules.size, a = n.modules.data, i = t.getScale(o, r), l = Math.floor((o + 2 * r.margin) * i), c = r.margin * i, s = [r.color.light, r.color.dark], u = 0; u < l; u++)
                        for (var d = 0; d < l; d++) {
                            var f = 4 * (u * l + d),
                                p = r.color.light;
                            if (u >= c && d >= c && u < l - c && d < l - c) p = s[a[Math.floor((u - c) / i) * o + Math.floor((d - c) / i)] ? 1 : 0];
                            e[f++] = p.r, e[f++] = p.g, e[f++] = p.b, e[f] = p.a
                        }
                }
            },
            9870: function(e, t) {
                var n;
                ! function() {
                    "use strict";
                    var r = {}.hasOwnProperty;

                    function o() {
                        for (var e = [], t = 0; t < arguments.length; t++) {
                            var n = arguments[t];
                            if (n) {
                                var a = typeof n;
                                if ("string" === a || "number" === a) e.push(n);
                                else if (Array.isArray(n)) {
                                    if (n.length) {
                                        var i = o.apply(null, n);
                                        i && e.push(i)
                                    }
                                } else if ("object" === a) {
                                    if (n.toString !== Object.prototype.toString && !n.toString.toString().includes("[native code]")) {
                                        e.push(n.toString());
                                        continue
                                    }
                                    for (var l in n) r.call(n, l) && n[l] && e.push(l)
                                }
                            }
                        }
                        return e.join(" ")
                    }
                    e.exports ? (o.default = o, e.exports = o) : void 0 === (n = function() {
                        return o
                    }.apply(t, [])) || (e.exports = n)
                }()
            },
            3614: function(e) {
                e.exports = "https://images.rbxcdn.com/2928664fe1fc6aca88583a6f606d60ba-apple-badge-en_us.svg"
            },
            138: function(e) {
                e.exports = "https://images.rbxcdn.com/6fa4cf63eff9cd6e796a2fe59d3dbb3c-apple-badge-ja_jp.svg"
            },
            377: function(e) {
                e.exports = "https://images.rbxcdn.com/df567a27fa3f48d96cc95c01a1703b87-google-badge-en_us.svg"
            },
            1133: function(e) {
                e.exports = "https://images.rbxcdn.com/c1b8a7e5b8cdfd01b6f3fce23fb05adc-google-badge-ja_jp.svg"
            },
            1594: function(e) {
                "use strict";
                e.exports = React
            }
        },
        t = {};

    function n(r) {
        var o = t[r];
        if (void 0 !== o) return o.exports;
        var a = t[r] = {
            id: r,
            loaded: !1,
            exports: {}
        };
        return e[r](a, a.exports, n), a.loaded = !0, a.exports
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
            if ("object" == typeof globalThis) return globalThis;
            try {
                return this || new Function("return this")()
            } catch (e) {
                if ("object" == typeof window) return window
            }
        }(), n.o = function(e, t) {
            return Object.prototype.hasOwnProperty.call(e, t)
        }, n.nmd = function(e) {
            return e.paths = [], e.children || (e.children = []), e
        }, n.nc = void 0,
        function() {
            "use strict";
            var e = n(1594),
                t = n.n(e),
                r = Roblox,
                o = n.n(r),
                a = ReactDOM,
                i = n.n(a),
                l = CoreUtilities,
                c = "access-management-upsell-container",
                s = ReactUtilities,
                u = n(3676),
                d = n(5390);
            var f = function(e) {
                    e()
                },
                p = function() {
                    return f
                },
                y = Symbol.for("react-redux-context"),
                h = "undefined" != typeof globalThis ? globalThis : {};

            function m() {
                var t;
                if (!e.createContext) return {};
                var n = null != (t = h[y]) ? t : h[y] = new Map,
                    r = n.get(e.createContext);
                return r || (r = e.createContext(null), n.set(e.createContext, r)), r
            }
            var v = m();

            function g() {
                var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : v;
                return function() {
                    return (0, e.useContext)(t)
                }
            }
            var b = g();
            var C = function() {
                    throw new Error("uSES not initialized!")
                },
                w = function(e, t) {
                    return e === t
                };

            function S() {
                var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : v,
                    n = t === v ? b : g(t);
                return function(t) {
                    var r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                        o = "function" == typeof r ? {
                            equalityFn: r
                        } : r,
                        a = o.equalityFn,
                        i = void 0 === a ? w : a,
                        l = o.stabilityCheck,
                        c = void 0 === l ? void 0 : l;
                    o.noopCheck;
                    var s, u, d, f = n(),
                        p = f.store,
                        y = f.subscription,
                        h = f.getServerState,
                        m = f.stabilityCheck,
                        v = (f.noopCheck, (0, e.useRef)(!0), (0, e.useCallback)((s = {}, u = t.name, d = function(e) {
                            return t(e)
                        }, u in s ? Object.defineProperty(s, u, {
                            value: d,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : s[u] = d, s)[t.name], [t, m, c])),
                        g = C(y.addNestedSub, p.getState, h || p.getState, v, i);
                    return (0, e.useDebugValue)(g), g
                }
            }
            var E = S();
            n(2056), n(6625);
            var P = {
                notify: function() {},
                get: function() {
                    return []
                }
            };

            function T(e, t) {
                var n, r = P;

                function o() {
                    i.onStateChange && i.onStateChange()
                }

                function a() {
                    n || (n = t ? t.addNestedSub(o) : e.subscribe(o), r = function() {
                        var e = p(),
                            t = null,
                            n = null;
                        return {
                            clear: function() {
                                t = null, n = null
                            },
                            notify: function() {
                                e((function() {
                                    for (var e = t; e;) e.callback(), e = e.next
                                }))
                            },
                            get: function() {
                                for (var e = [], n = t; n;) e.push(n), n = n.next;
                                return e
                            },
                            subscribe: function(e) {
                                var r = !0,
                                    o = n = {
                                        callback: e,
                                        next: null,
                                        prev: n
                                    };
                                return o.prev ? o.prev.next = o : t = o,
                                    function() {
                                        r && null !== t && (r = !1, o.next ? o.next.prev = o.prev : n = o.prev, o.prev ? o.prev.next = o.next : t = o.next)
                                    }
                            }
                        }
                    }())
                }
                var i = {
                    addNestedSub: function(e) {
                        return a(), r.subscribe(e)
                    },
                    notifyNestedSubs: function() {
                        r.notify()
                    },
                    handleChangeWrapper: o,
                    isSubscribed: function() {
                        return Boolean(n)
                    },
                    trySubscribe: a,
                    tryUnsubscribe: function() {
                        n && (n(), n = void 0, r.clear(), r = P)
                    },
                    getListeners: function() {
                        return r
                    }
                };
                return i
            }
            var x = !("undefined" == typeof window || void 0 === window.document || void 0 === window.document.createElement) ? e.useLayoutEffect : e.useEffect;
            var A = function(t) {
                var n = t.store,
                    r = t.context,
                    o = t.children,
                    a = t.serverState,
                    i = t.stabilityCheck,
                    l = void 0 === i ? "once" : i,
                    c = t.noopCheck,
                    s = void 0 === c ? "once" : c,
                    u = e.useMemo((function() {
                        var e = T(n);
                        return {
                            store: n,
                            subscription: e,
                            getServerState: a ? function() {
                                return a
                            } : void 0,
                            stabilityCheck: l,
                            noopCheck: s
                        }
                    }), [n, a, l, s]),
                    d = e.useMemo((function() {
                        return n.getState()
                    }), [n]);
                x((function() {
                    var e = u.subscription;
                    return e.onStateChange = e.notifyNestedSubs, e.trySubscribe(), d !== n.getState() && e.notifyNestedSubs(),
                        function() {
                            e.tryUnsubscribe(), e.onStateChange = void 0
                        }
                }), [u, d]);
                var f = r || v;
                return e.createElement(f.Provider, {
                    value: u
                }, o)
            };

            function I() {
                var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : v,
                    t = e === v ? b : g(e);
                return function() {
                    return t().store
                }
            }
            var k = I();

            function D() {
                var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : v,
                    t = e === v ? k : I(e);
                return function() {
                    return t().dispatch
                }
            }
            var N, O = D();
            ! function(e) {
                C = e
            }(d.useSyncExternalStoreWithSelector),
            function(e) {
                0
            }(u.useSyncExternalStore), N = a.unstable_batchedUpdates, f = N;
            var M = function() {
                return M = Object.assign || function(e) {
                    for (var t, n = 1, r = arguments.length; n < r; n++)
                        for (var o in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
                    return e
                }, M.apply(this, arguments)
            };

            function R(e, t) {
                var n = {};
                for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && t.indexOf(r) < 0 && (n[r] = e[r]);
                if (null != e && "function" == typeof Object.getOwnPropertySymbols) {
                    var o = 0;
                    for (r = Object.getOwnPropertySymbols(e); o < r.length; o++) t.indexOf(r[o]) < 0 && Object.prototype.propertyIsEnumerable.call(e, r[o]) && (n[r[o]] = e[r[o]])
                }
                return n
            }

            function j(e) {
                var t, n, r = "";
                if ("string" == typeof e || "number" == typeof e) r += e;
                else if ("object" == typeof e)
                    if (Array.isArray(e)) {
                        var o = e.length;
                        for (t = 0; t < o; t++) e[t] && (n = j(e[t])) && (r && (r += " "), r += n)
                    } else
                        for (n in e) e[n] && (r && (r += " "), r += n);
                return r
            }
            var F = function() {
                    for (var e, t, n = 0, r = "", o = arguments.length; n < o; n++)(e = arguments[n]) && (t = j(e)) && (r && (r += " "), r += t);
                    return r
                },
                V = ReactJSX;

            function U(e, t) {
                var n = Object.keys(e);
                if (Object.getOwnPropertySymbols) {
                    var r = Object.getOwnPropertySymbols(e);
                    t && (r = r.filter((function(t) {
                        return Object.getOwnPropertyDescriptor(e, t).enumerable
                    }))), n.push.apply(n, r)
                }
                return n
            }

            function L(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {};
                    t % 2 ? U(Object(n), !0).forEach((function(t) {
                        W(e, t, n[t])
                    })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(n)) : U(Object(n)).forEach((function(t) {
                        Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(n, t))
                    }))
                }
                return e
            }

            function W(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function K(e, t) {
                if (null == e) return {};
                var n, r, o = function(e, t) {
                    if (null == e) return {};
                    var n, r, o = {},
                        a = Object.keys(e);
                    for (r = 0; r < a.length; r++) n = a[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var a = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < a.length; r++) n = a[r], t.indexOf(n) >= 0 || Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                }
                return o
            }

            function _(e) {
                return _ = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(e) {
                    return typeof e
                } : function(e) {
                    return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e
                }, _(e)
            }

            function B(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }
            var z = Symbol.for("react.lazy"),
                q = e[" use ".trim().toString()];

            function H(e) {
                return null != e && "object" == _(e) && "$$typeof" in e && e.$$typeof === z && "_payload" in e && "object" == _(t = e._payload) && null !== t && "then" in t;
                var t
            }
            var G = function(t) {
                var n = Y(t),
                    r = e.forwardRef((function(t, r) {
                        var o = t.children,
                            a = K(t, ["children"]);
                        H(o) && "function" == typeof q && (o = q(o._payload));
                        var i = e.Children.toArray(o),
                            l = i.find(J);
                        if (l) {
                            var c = l.props.children,
                                s = i.map((function(t) {
                                    return t === l ? e.Children.count(c) > 1 ? e.Children.only(null) : e.isValidElement(c) ? c.props.children : null : t
                                }));
                            return (0, V.jsx)(n, L(L({}, a), {}, {
                                ref: r,
                                children: e.isValidElement(c) ? e.cloneElement(c, void 0, s) : null
                            }))
                        }
                        return (0, V.jsx)(n, L(L({}, a), {}, {
                            ref: r,
                            children: o
                        }))
                    }));
                return r.displayName = "".concat(t, ".Slot"), r
            }("Slot");

            function Y(t) {
                var n = e.forwardRef((function(t, n) {
                    var r = t.children,
                        o = K(t, ["children"]);
                    if (H(r) && "function" == typeof q && (r = q(r._payload)), e.isValidElement(r)) {
                        var a = function(e) {
                                var t, n, r = null === (t = Object.getOwnPropertyDescriptor(e.props, "ref")) || void 0 === t ? void 0 : t.get,
                                    o = r && "isReactWarning" in r && r.isReactWarning;
                                return o ? e.ref : (o = (r = null === (n = Object.getOwnPropertyDescriptor(e, "ref")) || void 0 === n ? void 0 : n.get) && "isReactWarning" in r && r.isReactWarning) ? e.props.ref : e.props.ref || e.ref
                            }(r),
                            i = function(e, t) {
                                var n = L({}, t),
                                    r = function(r) {
                                        var o = e[r],
                                            a = t[r];
                                        /^on[A-Z]/.test(r) ? o && a ? n[r] = function() {
                                            var e = a.apply(void 0, arguments);
                                            return o.apply(void 0, arguments), e
                                        } : o && (n[r] = o) : "style" === r ? n[r] = L(L({}, o), a) : "className" === r && (n[r] = [o, a].filter(Boolean).join(" "))
                                    };
                                for (var o in t) r(o);
                                return L(L({}, e), n)
                            }(o, r.props);
                        return r.type !== e.Fragment && (i.ref = n ? function() {
                            for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                            return function(e) {
                                var n = !1,
                                    r = t.map((function(t) {
                                        var r = B(t, e);
                                        return n || "function" != typeof r || (n = !0), r
                                    }));
                                if (n) return function() {
                                    for (var e = 0; e < r.length; e++) {
                                        var n = r[e];
                                        "function" == typeof n ? n() : B(t[e], null)
                                    }
                                }
                            }
                        }(n, a) : a), e.cloneElement(r, i)
                    }
                    return e.Children.count(r) > 1 ? e.Children.only(null) : null
                }));
                return n.displayName = "".concat(t, ".SlotClone"), n
            }
            var $ = Symbol("radix.slottable");

            function J(t) {
                return e.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === $
            }
            var Q = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                X = function() {
                    return t().createElement("div", {
                        role: "presentation",
                        className: "absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none"
                    })
                };

            function Z(e, t) {
                void 0 === t && (t = {});
                var n = t.insertAt;
                if (e && "undefined" != typeof document) {
                    var r = document.head || document.getElementsByTagName("head")[0],
                        o = document.createElement("style");
                    o.type = "text/css", "top" === n && r.firstChild ? r.insertBefore(o, r.firstChild) : r.appendChild(o), o.styleSheet ? o.styleSheet.cssText = e : o.appendChild(document.createTextNode(e))
                }
            }
            Z("@keyframes rotation{0%{transform:rotate(0deg)}to{transform:rotate(359deg)}}.foundation-web-loading-spinner{animation:rotation 1s linear infinite normal}");
            var ee = function(e) {
                    var n = e.width,
                        r = e.height;
                    return t().createElement("svg", {
                        className: "foundation-web-loading-spinner",
                        width: n,
                        height: r,
                        viewBox: "0 0 20 20",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg"
                    }, t().createElement("path", {
                        fillRule: "evenodd",
                        clipRule: "evenodd",
                        fill: "currentColor",
                        d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                    }))
                },
                te = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]"
                },
                ne = t().forwardRef((function(e, n) {
                    var r = e.name,
                        o = e.size,
                        a = void 0 === o ? "Medium" : o,
                        i = e.className,
                        l = (e.children, R(e, ["name", "size", "className", "children"]));
                    return t().createElement("span", Object.assign({
                        ref: n,
                        role: "presentation",
                        className: F("grow-0 shrink-0 basis-auto icon", r, te[a], i)
                    }, l))
                }));
            ne.displayName = "Icon";
            var re = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                oe = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                ae = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-alert", "content-action-alert"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                ie = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                le = (0, e.forwardRef)((function(e, n) {
                    var r = e.children,
                        o = e.className,
                        a = e.style,
                        i = e.isDisabled,
                        l = void 0 !== i && i,
                        c = e.isLoading,
                        s = void 0 !== c && c,
                        u = e.icon,
                        d = e.size,
                        f = void 0 === d ? "Large" : d,
                        p = e.variant,
                        y = void 0 === p ? "Emphasis" : p,
                        h = e.asChild,
                        m = R(e, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        v = F("foundation-web-button", l ? "opacity-[0.5]" : [Q, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", oe[f], l ? ie[y] : ae[y], o),
                        g = Object.assign({
                            textDecoration: "none"
                        }, a),
                        b = function(e) {
                            return t().createElement(t().Fragment, null, t().createElement(X, null), s && t().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, t().createElement(ee, {
                                width: re[f],
                                height: re[f]
                            })), t().createElement("span", {
                                className: F("flex items-center min-width-0", "Large" === f || "Medium" === f ? "gap-small" : "gap-xsmall", s && "invisible")
                            }, u && t().createElement(ne, {
                                name: u,
                                size: f
                            }), t().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, e)))
                        };
                    if (h) {
                        var C = R(m, ["as"]),
                            w = t().Children.only(r);
                        return t().createElement(G, Object.assign({
                            ref: n
                        }, C, {
                            className: v,
                            style: g,
                            "aria-disabled": l || void 0
                        }), t().cloneElement(w, {}, b(w.props.children)))
                    }
                    if ("a" === m.as) {
                        m.as;
                        var S = m.href,
                            E = R(m, ["as", "href"]);
                        return t().createElement("a", Object.assign({
                            ref: n
                        }, E, {
                            "aria-disabled": l,
                            href: l ? void 0 : S,
                            className: v,
                            style: g
                        }), b(r))
                    }
                    var P = R(m, ["as"]);
                    return t().createElement("button", Object.assign({
                        ref: n,
                        type: "button"
                    }, P, {
                        disabled: l,
                        className: v,
                        style: g
                    }), b(r))
                }));

            function ce(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var n = [],
                        r = !0,
                        o = !1,
                        a = void 0;
                    try {
                        for (var i, l = e[Symbol.iterator](); !(r = (i = l.next()).done) && (n.push(i.value), !t || n.length !== t); r = !0);
                    } catch (e) {
                        o = !0, a = e
                    } finally {
                        try {
                            r || null == l.return || l.return()
                        } finally {
                            if (o) throw a
                        }
                    }
                    return n
                }(e, t) || function(e, t) {
                    if (!e) return;
                    if ("string" == typeof e) return se(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    "Object" === n && e.constructor && (n = e.constructor.name);
                    if ("Map" === n || "Set" === n) return Array.from(e);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return se(e, t)
                }(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function se(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = new Array(t); n < t; n++) r[n] = e[n];
                return r
            }
            var ue = null !== globalThis && void 0 !== globalThis && globalThis.document ? e.useLayoutEffect : function() {},
                de = e[" useId ".trim().toString()] || function() {},
                fe = 0;

            function pe(t) {
                var n = ce(e.useState(de()), 2),
                    r = n[0],
                    o = n[1];
                return ue((function() {
                    t || o((function(e) {
                        return null != e ? e : String(fe++)
                    }))
                }), [t]), t || (r ? "radix-".concat(r) : "")
            }

            function ye(e, t) {
                var n;
                if ("undefined" == typeof Symbol || null == e[Symbol.iterator]) {
                    if (Array.isArray(e) || (n = ve(e)) || t && e && "number" == typeof e.length) {
                        n && (e = n);
                        var r = 0,
                            o = function() {};
                        return {
                            s: o,
                            n: function() {
                                return r >= e.length ? {
                                    done: !0
                                } : {
                                    done: !1,
                                    value: e[r++]
                                }
                            },
                            e: function(e) {
                                throw e
                            },
                            f: o
                        }
                    }
                    throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }
                var a, i = !0,
                    l = !1;
                return {
                    s: function() {
                        n = e[Symbol.iterator]()
                    },
                    n: function() {
                        var e = n.next();
                        return i = e.done, e
                    },
                    e: function(e) {
                        l = !0, a = e
                    },
                    f: function() {
                        try {
                            i || null == n.return || n.return()
                        } finally {
                            if (l) throw a
                        }
                    }
                }
            }

            function he(e) {
                return function(e) {
                    if (Array.isArray(e)) return ge(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && Symbol.iterator in Object(e)) return Array.from(e)
                }(e) || ve(e) || function() {
                    throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function me(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var n = [],
                        r = !0,
                        o = !1,
                        a = void 0;
                    try {
                        for (var i, l = e[Symbol.iterator](); !(r = (i = l.next()).done) && (n.push(i.value), !t || n.length !== t); r = !0);
                    } catch (e) {
                        o = !0, a = e
                    } finally {
                        try {
                            r || null == l.return || l.return()
                        } finally {
                            if (o) throw a
                        }
                    }
                    return n
                }(e, t) || ve(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ve(e, t) {
                if (e) {
                    if ("string" == typeof e) return ge(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    return "Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n ? Array.from(e) : "Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n) ? ge(e, t) : void 0
                }
            }

            function ge(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = new Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function be(e, t) {
                var n = Object.keys(e);
                if (Object.getOwnPropertySymbols) {
                    var r = Object.getOwnPropertySymbols(e);
                    t && (r = r.filter((function(t) {
                        return Object.getOwnPropertyDescriptor(e, t).enumerable
                    }))), n.push.apply(n, r)
                }
                return n
            }

            function Ce(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {};
                    t % 2 ? be(Object(n), !0).forEach((function(t) {
                        we(e, t, n[t])
                    })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(n)) : be(Object(n)).forEach((function(t) {
                        Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(n, t))
                    }))
                }
                return e
            }

            function we(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function Se(e, t) {
                if (null == e) return {};
                var n, r, o = function(e, t) {
                    if (null == e) return {};
                    var n, r, o = {},
                        a = Object.keys(e);
                    for (r = 0; r < a.length; r++) n = a[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var a = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < a.length; r++) n = a[r], t.indexOf(n) >= 0 || Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                }
                return o
            }

            function Ee(e, t) {
                var n = (arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {}).checkForDefaultPrevented,
                    r = void 0 === n || n;
                return function(n) {
                    if (null != e && e(n), !1 === r || !n.defaultPrevented) return null == t ? void 0 : t(n)
                }
            }

            function Pe(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function Te() {
                for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return function(e) {
                    var n = !1,
                        r = t.map((function(t) {
                            var r = Pe(t, e);
                            return n || "function" != typeof r || (n = !0), r
                        }));
                    if (n) return function() {
                        for (var e = 0; e < r.length; e++) {
                            var n = r[e];
                            "function" == typeof n ? n() : Pe(t[e], null)
                        }
                    }
                }
            }

            function xe() {
                for (var t = arguments.length, n = new Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return e.useCallback(Te.apply(void 0, n), n)
            }
            var Ae = Symbol("radix.slottable");

            function Ie(t) {
                return e.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === Ae
            }
            var ke = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((function(t, n) {
                var r = function(t) {
                        var n = function(t) {
                                var n = e.forwardRef((function(t, n) {
                                    var r = t.children,
                                        o = Se(t, ["children"]);
                                    if (e.isValidElement(r)) {
                                        var a = function(e) {
                                                var t, n, r = null === (t = Object.getOwnPropertyDescriptor(e.props, "ref")) || void 0 === t ? void 0 : t.get,
                                                    o = r && "isReactWarning" in r && r.isReactWarning;
                                                return o ? e.ref : (o = (r = null === (n = Object.getOwnPropertyDescriptor(e, "ref")) || void 0 === n ? void 0 : n.get) && "isReactWarning" in r && r.isReactWarning) ? e.props.ref : e.props.ref || e.ref
                                            }(r),
                                            i = function(e, t) {
                                                var n = Ce({}, t),
                                                    r = function(r) {
                                                        var o = e[r],
                                                            a = t[r];
                                                        /^on[A-Z]/.test(r) ? o && a ? n[r] = function() {
                                                            a.apply(void 0, arguments), o.apply(void 0, arguments)
                                                        } : o && (n[r] = o) : "style" === r ? n[r] = Ce(Ce({}, o), a) : "className" === r && (n[r] = [o, a].filter(Boolean).join(" "))
                                                    };
                                                for (var o in t) r(o);
                                                return Ce(Ce({}, e), n)
                                            }(o, r.props);
                                        return r.type !== e.Fragment && (i.ref = n ? Te(n, a) : a), e.cloneElement(r, i)
                                    }
                                    return e.Children.count(r) > 1 ? e.Children.only(null) : null
                                }));
                                return n.displayName = "".concat(t, ".SlotClone"), n
                            }(t),
                            r = e.forwardRef((function(t, r) {
                                var o = t.children,
                                    a = Se(t, ["children"]),
                                    i = e.Children.toArray(o),
                                    l = i.find(Ie);
                                if (l) {
                                    var c = l.props.children,
                                        s = i.map((function(t) {
                                            return t === l ? e.Children.count(c) > 1 ? e.Children.only(null) : e.isValidElement(c) ? c.props.children : null : t
                                        }));
                                    return (0, V.jsx)(n, Ce(Ce({}, a), {}, {
                                        ref: r,
                                        children: e.isValidElement(c) ? e.cloneElement(c, void 0, s) : null
                                    }))
                                }
                                return (0, V.jsx)(n, Ce(Ce({}, a), {}, {
                                    ref: r,
                                    children: o
                                }))
                            }));
                        return r.displayName = "".concat(t, ".Slot"), r
                    }("Primitive.".concat(n)),
                    o = e.forwardRef((function(e, t) {
                        var o = e.asChild,
                            a = Se(e, ["asChild"]),
                            i = o ? r : n;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, V.jsx)(i, Ce(Ce({}, a), {}, {
                            ref: t
                        }))
                    }));
                return o.displayName = "Primitive.".concat(n), Ce(Ce({}, t), {}, we({}, n, o))
            }), {});

            function De(t) {
                var n = e.useRef(t);
                return e.useEffect((function() {
                    n.current = t
                })), e.useMemo((function() {
                    return function() {
                        for (var e, t = arguments.length, r = new Array(t), o = 0; o < t; o++) r[o] = arguments[o];
                        return null === (e = n.current) || void 0 === e ? void 0 : e.call.apply(e, [n].concat(r))
                    }
                }), [])
            }
            var Ne, Oe = "dismissableLayer.update",
                Me = e.createContext({
                    layers: new Set,
                    layersWithOutsidePointerEventsDisabled: new Set,
                    branches: new Set
                }),
                Re = e.forwardRef((function(t, n) {
                    var r, o = t.disableOutsidePointerEvents,
                        a = void 0 !== o && o,
                        i = t.onEscapeKeyDown,
                        l = t.onPointerDownOutside,
                        c = t.onFocusOutside,
                        s = t.onInteractOutside,
                        u = t.onDismiss,
                        d = Se(t, ["disableOutsidePointerEvents", "onEscapeKeyDown", "onPointerDownOutside", "onFocusOutside", "onInteractOutside", "onDismiss"]),
                        f = e.useContext(Me),
                        p = me(e.useState(null), 2),
                        y = p[0],
                        h = p[1],
                        m = null !== (r = null == y ? void 0 : y.ownerDocument) && void 0 !== r ? r : null === globalThis || void 0 === globalThis ? void 0 : globalThis.document,
                        v = me(e.useState({}), 2)[1],
                        g = xe(n, (function(e) {
                            return h(e)
                        })),
                        b = Array.from(f.layers),
                        C = me(he(f.layersWithOutsidePointerEventsDisabled).slice(-1), 1)[0],
                        w = b.indexOf(C),
                        S = y ? b.indexOf(y) : -1,
                        E = f.layersWithOutsidePointerEventsDisabled.size > 0,
                        P = S >= w,
                        T = function(t) {
                            var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null === globalThis || void 0 === globalThis ? void 0 : globalThis.document,
                                r = De(t),
                                o = e.useRef(!1),
                                a = e.useRef((function() {}));
                            return e.useEffect((function() {
                                var e = function(e) {
                                        if (e.target && !o.current) {
                                            var t = function() {
                                                    Fe("dismissableLayer.pointerDownOutside", r, i, {
                                                        discrete: !0
                                                    })
                                                },
                                                i = {
                                                    originalEvent: e
                                                };
                                            "touch" === e.pointerType ? (n.removeEventListener("click", a.current), a.current = t, n.addEventListener("click", a.current, {
                                                once: !0
                                            })) : t()
                                        } else n.removeEventListener("click", a.current);
                                        o.current = !1
                                    },
                                    t = window.setTimeout((function() {
                                        n.addEventListener("pointerdown", e)
                                    }), 0);
                                return function() {
                                    window.clearTimeout(t), n.removeEventListener("pointerdown", e), n.removeEventListener("click", a.current)
                                }
                            }), [n, r]), {
                                onPointerDownCapture: function() {
                                    return o.current = !0
                                }
                            }
                        }((function(e) {
                            var t = e.target,
                                n = he(f.branches).some((function(e) {
                                    return e.contains(t)
                                }));
                            P && !n && (null != l && l(e), null != s && s(e), e.defaultPrevented || null == u || u())
                        }), m),
                        x = function(t) {
                            var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null === globalThis || void 0 === globalThis ? void 0 : globalThis.document,
                                r = De(t),
                                o = e.useRef(!1);
                            return e.useEffect((function() {
                                var e = function(e) {
                                    e.target && !o.current && Fe("dismissableLayer.focusOutside", r, {
                                        originalEvent: e
                                    }, {
                                        discrete: !1
                                    })
                                };
                                return n.addEventListener("focusin", e),
                                    function() {
                                        return n.removeEventListener("focusin", e)
                                    }
                            }), [n, r]), {
                                onFocusCapture: function() {
                                    return o.current = !0
                                },
                                onBlurCapture: function() {
                                    return o.current = !1
                                }
                            }
                        }((function(e) {
                            var t = e.target;
                            he(f.branches).some((function(e) {
                                return e.contains(t)
                            })) || (null != c && c(e), null != s && s(e), e.defaultPrevented || null == u || u())
                        }), m);
                    return function(t) {
                        var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null === globalThis || void 0 === globalThis ? void 0 : globalThis.document,
                            r = function(t) {
                                var n = e.useRef(t);
                                return e.useEffect((function() {
                                    n.current = t
                                })), e.useMemo((function() {
                                    return function() {
                                        for (var e, t = arguments.length, r = new Array(t), o = 0; o < t; o++) r[o] = arguments[o];
                                        return null === (e = n.current) || void 0 === e ? void 0 : e.call.apply(e, [n].concat(r))
                                    }
                                }), [])
                            }(t);
                        e.useEffect((function() {
                            var e = function(e) {
                                "Escape" === e.key && r(e)
                            };
                            return n.addEventListener("keydown", e, {
                                    capture: !0
                                }),
                                function() {
                                    return n.removeEventListener("keydown", e, {
                                        capture: !0
                                    })
                                }
                        }), [r, n])
                    }((function(e) {
                        S === f.layers.size - 1 && (null != i && i(e), !e.defaultPrevented && u && (e.preventDefault(), u()))
                    }), m), e.useEffect((function() {
                        if (y) return a && (0 === f.layersWithOutsidePointerEventsDisabled.size && (Ne = m.body.style.pointerEvents, m.body.style.pointerEvents = "none"), f.layersWithOutsidePointerEventsDisabled.add(y)), f.layers.add(y), je(),
                            function() {
                                a && 1 === f.layersWithOutsidePointerEventsDisabled.size && (m.body.style.pointerEvents = Ne)
                            }
                    }), [y, m, a, f]), e.useEffect((function() {
                        return function() {
                            y && (f.layers.delete(y), f.layersWithOutsidePointerEventsDisabled.delete(y), je())
                        }
                    }), [y, f]), e.useEffect((function() {
                        var e = function() {
                            return v({})
                        };
                        return document.addEventListener(Oe, e),
                            function() {
                                return document.removeEventListener(Oe, e)
                            }
                    }), []), (0, V.jsx)(ke.div, Ce(Ce({}, d), {}, {
                        ref: g,
                        style: Ce({
                            pointerEvents: E ? P ? "auto" : "none" : void 0
                        }, t.style),
                        onFocusCapture: Ee(t.onFocusCapture, x.onFocusCapture),
                        onBlurCapture: Ee(t.onBlurCapture, x.onBlurCapture),
                        onPointerDownCapture: Ee(t.onPointerDownCapture, T.onPointerDownCapture)
                    }))
                }));

            function je() {
                var e = new CustomEvent(Oe);
                document.dispatchEvent(e)
            }

            function Fe(e, t, n, r) {
                var o = r.discrete,
                    i = n.originalEvent.target,
                    l = new CustomEvent(e, {
                        bubbles: !1,
                        cancelable: !0,
                        detail: n
                    });
                t && i.addEventListener(e, t, {
                    once: !0
                }), o ? function(e, t) {
                    e && a.flushSync((function() {
                        return e.dispatchEvent(t)
                    }))
                }(i, l) : i.dispatchEvent(l)
            }

            function Ve(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function Ue() {
                for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return function(e) {
                    var n = !1,
                        r = t.map((function(t) {
                            var r = Ve(t, e);
                            return n || "function" != typeof r || (n = !0), r
                        }));
                    if (n) return function() {
                        for (var e = 0; e < r.length; e++) {
                            var n = r[e];
                            "function" == typeof n ? n() : Ve(t[e], null)
                        }
                    }
                }
            }
            Re.displayName = "DismissableLayer", e.forwardRef((function(t, n) {
                var r = e.useContext(Me),
                    o = e.useRef(null),
                    a = xe(n, o);
                return e.useEffect((function() {
                    var e = o.current;
                    if (e) return r.branches.add(e),
                        function() {
                            r.branches.delete(e)
                        }
                }), [r.branches]), (0, V.jsx)(ke.div, Ce(Ce({}, t), {}, {
                    ref: a
                }))
            })).displayName = "DismissableLayerBranch";
            var Le = Symbol("radix.slottable");

            function We(t) {
                return e.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === Le
            }
            var Ke = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((function(t, n) {
                var r = function(t) {
                        var n = function(t) {
                                var n = e.forwardRef((function(t, n) {
                                    var r = t.children,
                                        o = Se(t, ["children"]);
                                    if (e.isValidElement(r)) {
                                        var a = function(e) {
                                                var t, n, r = null === (t = Object.getOwnPropertyDescriptor(e.props, "ref")) || void 0 === t ? void 0 : t.get,
                                                    o = r && "isReactWarning" in r && r.isReactWarning;
                                                return o ? e.ref : (o = (r = null === (n = Object.getOwnPropertyDescriptor(e, "ref")) || void 0 === n ? void 0 : n.get) && "isReactWarning" in r && r.isReactWarning) ? e.props.ref : e.props.ref || e.ref
                                            }(r),
                                            i = function(e, t) {
                                                var n = Ce({}, t),
                                                    r = function(r) {
                                                        var o = e[r],
                                                            a = t[r];
                                                        /^on[A-Z]/.test(r) ? o && a ? n[r] = function() {
                                                            a.apply(void 0, arguments), o.apply(void 0, arguments)
                                                        } : o && (n[r] = o) : "style" === r ? n[r] = Ce(Ce({}, o), a) : "className" === r && (n[r] = [o, a].filter(Boolean).join(" "))
                                                    };
                                                for (var o in t) r(o);
                                                return Ce(Ce({}, e), n)
                                            }(o, r.props);
                                        return r.type !== e.Fragment && (i.ref = n ? Ue(n, a) : a), e.cloneElement(r, i)
                                    }
                                    return e.Children.count(r) > 1 ? e.Children.only(null) : null
                                }));
                                return n.displayName = "".concat(t, ".SlotClone"), n
                            }(t),
                            r = e.forwardRef((function(t, r) {
                                var o = t.children,
                                    a = Se(t, ["children"]),
                                    i = e.Children.toArray(o),
                                    l = i.find(We);
                                if (l) {
                                    var c = l.props.children,
                                        s = i.map((function(t) {
                                            return t === l ? e.Children.count(c) > 1 ? e.Children.only(null) : e.isValidElement(c) ? c.props.children : null : t
                                        }));
                                    return (0, V.jsx)(n, Ce(Ce({}, a), {}, {
                                        ref: r,
                                        children: e.isValidElement(c) ? e.cloneElement(c, void 0, s) : null
                                    }))
                                }
                                return (0, V.jsx)(n, Ce(Ce({}, a), {}, {
                                    ref: r,
                                    children: o
                                }))
                            }));
                        return r.displayName = "".concat(t, ".Slot"), r
                    }("Primitive.".concat(n)),
                    o = e.forwardRef((function(e, t) {
                        var o = e.asChild,
                            a = Se(e, ["asChild"]),
                            i = o ? r : n;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, V.jsx)(i, Ce(Ce({}, a), {}, {
                            ref: t
                        }))
                    }));
                return o.displayName = "Primitive.".concat(n), Ce(Ce({}, t), {}, we({}, n, o))
            }), {});

            function _e(t) {
                var n = e.useRef(t);
                return e.useEffect((function() {
                    n.current = t
                })), e.useMemo((function() {
                    return function() {
                        for (var e, t = arguments.length, r = new Array(t), o = 0; o < t; o++) r[o] = arguments[o];
                        return null === (e = n.current) || void 0 === e ? void 0 : e.call.apply(e, [n].concat(r))
                    }
                }), [])
            }
            var Be = "focusScope.autoFocusOnMount",
                ze = "focusScope.autoFocusOnUnmount",
                qe = {
                    bubbles: !1,
                    cancelable: !0
                },
                He = e.forwardRef((function(t, n) {
                    var r = t.loop,
                        o = void 0 !== r && r,
                        a = t.trapped,
                        i = void 0 !== a && a,
                        l = t.onMountAutoFocus,
                        c = t.onUnmountAutoFocus,
                        s = Se(t, ["loop", "trapped", "onMountAutoFocus", "onUnmountAutoFocus"]),
                        u = me(e.useState(null), 2),
                        d = u[0],
                        f = u[1],
                        p = _e(l),
                        y = _e(c),
                        h = e.useRef(null),
                        m = function() {
                            for (var t = arguments.length, n = new Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                            return e.useCallback(Ue.apply(void 0, n), n)
                        }(n, (function(e) {
                            return f(e)
                        })),
                        v = e.useRef({
                            paused: !1,
                            pause: function() {
                                this.paused = !0
                            },
                            resume: function() {
                                this.paused = !1
                            }
                        }).current;
                    e.useEffect((function() {
                        if (i) {
                            var e = function(e) {
                                    if (!v.paused && d) {
                                        var t = e.target;
                                        d.contains(t) ? h.current = t : Je(h.current, {
                                            select: !0
                                        })
                                    }
                                },
                                t = function(e) {
                                    if (!v.paused && d) {
                                        var t = e.relatedTarget;
                                        null !== t && (d.contains(t) || Je(h.current, {
                                            select: !0
                                        }))
                                    }
                                };
                            document.addEventListener("focusin", e), document.addEventListener("focusout", t);
                            var n = new MutationObserver((function(e) {
                                if (document.activeElement === document.body) {
                                    var t, n = ye(e);
                                    try {
                                        for (n.s(); !(t = n.n()).done;) {
                                            t.value.removedNodes.length > 0 && Je(d)
                                        }
                                    } catch (e) {
                                        n.e(e)
                                    } finally {
                                        n.f()
                                    }
                                }
                            }));
                            return d && n.observe(d, {
                                    childList: !0,
                                    subtree: !0
                                }),
                                function() {
                                    document.removeEventListener("focusin", e), document.removeEventListener("focusout", t), n.disconnect()
                                }
                        }
                    }), [i, d, v.paused]), e.useEffect((function() {
                        if (d) {
                            Qe.add(v);
                            var e = document.activeElement;
                            if (!d.contains(e)) {
                                var t = new CustomEvent(Be, qe);
                                d.addEventListener(Be, p), d.dispatchEvent(t), t.defaultPrevented || (function(e) {
                                    var t, n = (arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}).select,
                                        r = void 0 !== n && n,
                                        o = document.activeElement,
                                        a = ye(e);
                                    try {
                                        for (a.s(); !(t = a.n()).done;) {
                                            if (Je(t.value, {
                                                    select: r
                                                }), document.activeElement !== o) return
                                        }
                                    } catch (e) {
                                        a.e(e)
                                    } finally {
                                        a.f()
                                    }
                                }(Ge(d).filter((function(e) {
                                    return "A" !== e.tagName
                                })), {
                                    select: !0
                                }), document.activeElement === e && Je(d))
                            }
                            return function() {
                                d.removeEventListener(Be, p), setTimeout((function() {
                                    var t = new CustomEvent(ze, qe);
                                    d.addEventListener(ze, y), d.dispatchEvent(t), t.defaultPrevented || Je(null != e ? e : document.body, {
                                        select: !0
                                    }), d.removeEventListener(ze, y), Qe.remove(v)
                                }), 0)
                            }
                        }
                    }), [d, p, y, v]);
                    var g = e.useCallback((function(e) {
                        if ((o || i) && !v.paused) {
                            var t = "Tab" === e.key && !e.altKey && !e.ctrlKey && !e.metaKey,
                                n = document.activeElement;
                            if (t && n) {
                                var r = e.currentTarget,
                                    a = function(e) {
                                        var t = Ge(e);
                                        return [Ye(t, e), Ye(t.reverse(), e)]
                                    }(r),
                                    l = me(a, 2),
                                    c = l[0],
                                    s = l[1];
                                c && s ? e.shiftKey || n !== s ? e.shiftKey && n === c && (e.preventDefault(), o && Je(s, {
                                    select: !0
                                })) : (e.preventDefault(), o && Je(c, {
                                    select: !0
                                })) : n === r && e.preventDefault()
                            }
                        }
                    }), [o, i, v.paused]);
                    return (0, V.jsx)(Ke.div, Ce(Ce({
                        tabIndex: -1
                    }, s), {}, {
                        ref: m,
                        onKeyDown: g
                    }))
                }));

            function Ge(e) {
                for (var t = [], n = document.createTreeWalker(e, NodeFilter.SHOW_ELEMENT, {
                        acceptNode: function(e) {
                            var t = "INPUT" === e.tagName && "hidden" === e.type;
                            return e.disabled || e.hidden || t ? NodeFilter.FILTER_SKIP : e.tabIndex >= 0 ? NodeFilter.FILTER_ACCEPT : NodeFilter.FILTER_SKIP
                        }
                    }); n.nextNode();) t.push(n.currentNode);
                return t
            }

            function Ye(e, t) {
                var n, r = ye(e);
                try {
                    for (r.s(); !(n = r.n()).done;) {
                        var o = n.value;
                        if (!$e(o, {
                                upTo: t
                            })) return o
                    }
                } catch (e) {
                    r.e(e)
                } finally {
                    r.f()
                }
            }

            function $e(e, t) {
                var n = t.upTo;
                if ("hidden" === getComputedStyle(e).visibility) return !0;
                for (; e;) {
                    if (void 0 !== n && e === n) return !1;
                    if ("none" === getComputedStyle(e).display) return !0;
                    e = e.parentElement
                }
                return !1
            }

            function Je(e) {
                var t = (arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}).select,
                    n = void 0 !== t && t;
                if (e && e.focus) {
                    var r = document.activeElement;
                    e.focus({
                        preventScroll: !0
                    }), e !== r && function(e) {
                        return e instanceof HTMLInputElement && "select" in e
                    }(e) && n && e.select()
                }
            }
            He.displayName = "FocusScope";
            var Qe = function() {
                var e = [];
                return {
                    add: function(t) {
                        var n = e[0];
                        t !== n && null != n && n.pause(), (e = Xe(e, t)).unshift(t)
                    },
                    remove: function(t) {
                        var n;
                        null === (n = (e = Xe(e, t))[0]) || void 0 === n || n.resume()
                    }
                }
            }();

            function Xe(e, t) {
                var n = he(e),
                    r = n.indexOf(t);
                return -1 !== r && n.splice(r, 1), n
            }

            function Ze(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }
            var et = Symbol("radix.slottable");

            function tt(t) {
                return e.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === et
            }
            var nt = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((function(t, n) {
                    var r = function(t) {
                            var n = function(t) {
                                    var n = e.forwardRef((function(t, n) {
                                        var r = t.children,
                                            o = Se(t, ["children"]);
                                        if (e.isValidElement(r)) {
                                            var a = function(e) {
                                                    var t, n, r = null === (t = Object.getOwnPropertyDescriptor(e.props, "ref")) || void 0 === t ? void 0 : t.get,
                                                        o = r && "isReactWarning" in r && r.isReactWarning;
                                                    return o ? e.ref : (o = (r = null === (n = Object.getOwnPropertyDescriptor(e, "ref")) || void 0 === n ? void 0 : n.get) && "isReactWarning" in r && r.isReactWarning) ? e.props.ref : e.props.ref || e.ref
                                                }(r),
                                                i = function(e, t) {
                                                    var n = Ce({}, t),
                                                        r = function(r) {
                                                            var o = e[r],
                                                                a = t[r];
                                                            /^on[A-Z]/.test(r) ? o && a ? n[r] = function() {
                                                                a.apply(void 0, arguments), o.apply(void 0, arguments)
                                                            } : o && (n[r] = o) : "style" === r ? n[r] = Ce(Ce({}, o), a) : "className" === r && (n[r] = [o, a].filter(Boolean).join(" "))
                                                        };
                                                    for (var o in t) r(o);
                                                    return Ce(Ce({}, e), n)
                                                }(o, r.props);
                                            return r.type !== e.Fragment && (i.ref = n ? function() {
                                                for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                                return function(e) {
                                                    var n = !1,
                                                        r = t.map((function(t) {
                                                            var r = Ze(t, e);
                                                            return n || "function" != typeof r || (n = !0), r
                                                        }));
                                                    if (n) return function() {
                                                        for (var e = 0; e < r.length; e++) {
                                                            var n = r[e];
                                                            "function" == typeof n ? n() : Ze(t[e], null)
                                                        }
                                                    }
                                                }
                                            }(n, a) : a), e.cloneElement(r, i)
                                        }
                                        return e.Children.count(r) > 1 ? e.Children.only(null) : null
                                    }));
                                    return n.displayName = "".concat(t, ".SlotClone"), n
                                }(t),
                                r = e.forwardRef((function(t, r) {
                                    var o = t.children,
                                        a = Se(t, ["children"]),
                                        i = e.Children.toArray(o),
                                        l = i.find(tt);
                                    if (l) {
                                        var c = l.props.children,
                                            s = i.map((function(t) {
                                                return t === l ? e.Children.count(c) > 1 ? e.Children.only(null) : e.isValidElement(c) ? c.props.children : null : t
                                            }));
                                        return (0, V.jsx)(n, Ce(Ce({}, a), {}, {
                                            ref: r,
                                            children: e.isValidElement(c) ? e.cloneElement(c, void 0, s) : null
                                        }))
                                    }
                                    return (0, V.jsx)(n, Ce(Ce({}, a), {}, {
                                        ref: r,
                                        children: o
                                    }))
                                }));
                            return r.displayName = "".concat(t, ".Slot"), r
                        }("Primitive.".concat(n)),
                        o = e.forwardRef((function(e, t) {
                            var o = e.asChild,
                                a = Se(e, ["asChild"]),
                                i = o ? r : n;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, V.jsx)(i, Ce(Ce({}, a), {}, {
                                ref: t
                            }))
                        }));
                    return o.displayName = "Primitive.".concat(n), Ce(Ce({}, t), {}, we({}, n, o))
                }), {}),
                rt = null !== globalThis && void 0 !== globalThis && globalThis.document ? e.useLayoutEffect : function() {},
                ot = e.forwardRef((function(t, n) {
                    var r, o = t.container,
                        a = Se(t, ["container"]),
                        l = me(e.useState(!1), 2),
                        c = l[0],
                        s = l[1];
                    rt((function() {
                        return s(!0)
                    }), []);
                    var u = o || c && (null === globalThis || void 0 === globalThis || null === (r = globalThis.document) || void 0 === r ? void 0 : r.body);
                    return u ? i().createPortal((0, V.jsx)(nt.div, Ce(Ce({}, a), {}, {
                        ref: n
                    })), u) : null
                }));
            ot.displayName = "Portal";
            var at = 0;

            function it() {
                var e = document.createElement("span");
                return e.setAttribute("data-radix-focus-guard", ""), e.tabIndex = 0, e.style.outline = "none", e.style.opacity = "0", e.style.position = "fixed", e.style.pointerEvents = "none", e
            }
            var lt = "right-scroll-bar-position",
                ct = "width-before-scroll-bar";

            function st(e, t) {
                return "function" == typeof e ? e(t) : e && (e.current = t), e
            }
            var ut = "undefined" != typeof window ? e.useLayoutEffect : e.useEffect,
                dt = new WeakMap;

            function ft(e) {
                return e
            }
            var pt = function(t) {
                var n = t.sideCar,
                    r = R(t, ["sideCar"]);
                if (!n) throw new Error("Sidecar: please provide `sideCar` property to import the right car");
                var o = n.read();
                if (!o) throw new Error("Sidecar medium not found");
                return e.createElement(o, M({}, r))
            };
            pt.isSideCarExport = !0;
            var yt = function(e) {
                    void 0 === e && (e = {});
                    var t = function(e, t) {
                        void 0 === t && (t = ft);
                        var n = [],
                            r = !1;
                        return {
                            read: function() {
                                if (r) throw new Error("Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`.");
                                return n.length ? n[n.length - 1] : null
                            },
                            useMedium: function(e) {
                                var o = t(e, r);
                                return n.push(o),
                                    function() {
                                        n = n.filter((function(e) {
                                            return e !== o
                                        }))
                                    }
                            },
                            assignSyncMedium: function(e) {
                                for (r = !0; n.length;) {
                                    var t = n;
                                    n = [], t.forEach(e)
                                }
                                n = {
                                    push: function(t) {
                                        return e(t)
                                    },
                                    filter: function() {
                                        return n
                                    }
                                }
                            },
                            assignMedium: function(e) {
                                r = !0;
                                var t = [];
                                if (n.length) {
                                    var o = n;
                                    n = [], o.forEach(e), t = n
                                }
                                var a = function() {
                                        var n = t;
                                        t = [], n.forEach(e)
                                    },
                                    i = function() {
                                        return Promise.resolve().then(a)
                                    };
                                i(), n = {
                                    push: function(e) {
                                        t.push(e), i()
                                    },
                                    filter: function(e) {
                                        return t = t.filter(e), n
                                    }
                                }
                            }
                        }
                    }();
                    return t.options = M({
                        async: !0,
                        ssr: !1
                    }, e), t
                }(),
                ht = function() {},
                mt = e.forwardRef((function(t, n) {
                    var r = e.useRef(null),
                        o = e.useState({
                            onScrollCapture: ht,
                            onWheelCapture: ht,
                            onTouchMoveCapture: ht
                        }),
                        a = o[0],
                        i = o[1],
                        l = t.forwardProps,
                        c = t.children,
                        s = t.className,
                        u = t.removeScrollBar,
                        d = t.enabled,
                        f = t.shards,
                        p = t.sideCar,
                        y = t.noIsolation,
                        h = t.inert,
                        m = t.allowPinchZoom,
                        v = t.as,
                        g = void 0 === v ? "div" : v,
                        b = t.gapMode,
                        C = R(t, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                        w = p,
                        S = function(t, n) {
                            var r, o, a, i = (r = n || null, o = function(e) {
                                return t.forEach((function(t) {
                                    return st(t, e)
                                }))
                            }, (a = (0, e.useState)((function() {
                                return {
                                    value: r,
                                    callback: o,
                                    facade: {
                                        get current() {
                                            return a.value
                                        },
                                        set current(e) {
                                            var t = a.value;
                                            t !== e && (a.value = e, a.callback(e, t))
                                        }
                                    }
                                }
                            }))[0]).callback = o, a.facade);
                            return ut((function() {
                                var e = dt.get(i);
                                if (e) {
                                    var n = new Set(e),
                                        r = new Set(t),
                                        o = i.current;
                                    n.forEach((function(e) {
                                        r.has(e) || st(e, null)
                                    })), r.forEach((function(e) {
                                        n.has(e) || st(e, o)
                                    }))
                                }
                                dt.set(i, t)
                            }), [t]), i
                        }([r, n]),
                        E = M(M({}, C), a);
                    return e.createElement(e.Fragment, null, d && e.createElement(w, {
                        sideCar: yt,
                        removeScrollBar: u,
                        shards: f,
                        noIsolation: y,
                        inert: h,
                        setCallbacks: i,
                        allowPinchZoom: !!m,
                        lockRef: r,
                        gapMode: b
                    }), l ? e.cloneElement(e.Children.only(c), M(M({}, E), {
                        ref: S
                    })) : e.createElement(g, M({}, E, {
                        className: s,
                        ref: S
                    }), c))
                }));
            mt.defaultProps = {
                enabled: !0,
                removeScrollBar: !0,
                inert: !1
            }, mt.classNames = {
                fullWidth: ct,
                zeroRight: lt
            };
            var vt = function() {
                    var e = 0,
                        t = null;
                    return {
                        add: function(r) {
                            var o, a;
                            0 == e && (t = function() {
                                if (!document) return null;
                                var e = document.createElement("style");
                                e.type = "text/css";
                                var t = n.nc;
                                return t && e.setAttribute("nonce", t), e
                            }()) && (a = r, (o = t).styleSheet ? o.styleSheet.cssText = a : o.appendChild(document.createTextNode(a)), function(e) {
                                (document.head || document.getElementsByTagName("head")[0]).appendChild(e)
                            }(t)), e++
                        },
                        remove: function() {
                            !--e && t && (t.parentNode && t.parentNode.removeChild(t), t = null)
                        }
                    }
                },
                gt = function() {
                    var t, n = (t = vt(), function(n, r) {
                        e.useEffect((function() {
                            return t.add(n),
                                function() {
                                    t.remove()
                                }
                        }), [n && r])
                    });
                    return function(e) {
                        var t = e.styles,
                            r = e.dynamic;
                        return n(t, r), null
                    }
                },
                bt = {
                    left: 0,
                    top: 0,
                    right: 0,
                    gap: 0
                },
                Ct = function(e) {
                    return parseInt(e || "", 10) || 0
                },
                wt = gt(),
                St = "data-scroll-locked",
                Et = function(e, t, n, r) {
                    var o = e.left,
                        a = e.top,
                        i = e.right,
                        l = e.gap;
                    return void 0 === n && (n = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(r, ";\n   padding-right: ").concat(l, "px ").concat(r, ";\n  }\n  body[").concat(St, "] {\n    overflow: hidden ").concat(r, ";\n    overscroll-behavior: contain;\n    ").concat([t && "position: relative ".concat(r, ";"), "margin" === n && "\n    padding-left: ".concat(o, "px;\n    padding-top: ").concat(a, "px;\n    padding-right: ").concat(i, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(l, "px ").concat(r, ";\n    "), "padding" === n && "padding-right: ".concat(l, "px ").concat(r, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(lt, " {\n    right: ").concat(l, "px ").concat(r, ";\n  }\n  \n  .").concat(ct, " {\n    margin-right: ").concat(l, "px ").concat(r, ";\n  }\n  \n  .").concat(lt, " .").concat(lt, " {\n    right: 0 ").concat(r, ";\n  }\n  \n  .").concat(ct, " .").concat(ct, " {\n    margin-right: 0 ").concat(r, ";\n  }\n  \n  body[").concat(St, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(l, "px;\n  }\n")
                },
                Pt = function() {
                    var e = parseInt(document.body.getAttribute(St) || "0", 10);
                    return isFinite(e) ? e : 0
                },
                Tt = function(t) {
                    var n = t.noRelative,
                        r = t.noImportant,
                        o = t.gapMode,
                        a = void 0 === o ? "margin" : o;
                    e.useEffect((function() {
                        return document.body.setAttribute(St, (Pt() + 1).toString()),
                            function() {
                                var e = Pt() - 1;
                                e <= 0 ? document.body.removeAttribute(St) : document.body.setAttribute(St, e.toString())
                            }
                    }), []);
                    var i = e.useMemo((function() {
                        return function(e) {
                            if (void 0 === e && (e = "margin"), "undefined" == typeof window) return bt;
                            var t = function(e) {
                                    var t = window.getComputedStyle(document.body),
                                        n = t["padding" === e ? "paddingLeft" : "marginLeft"],
                                        r = t["padding" === e ? "paddingTop" : "marginTop"],
                                        o = t["padding" === e ? "paddingRight" : "marginRight"];
                                    return [Ct(n), Ct(r), Ct(o)]
                                }(e),
                                n = document.documentElement.clientWidth,
                                r = window.innerWidth;
                            return {
                                left: t[0],
                                top: t[1],
                                right: t[2],
                                gap: Math.max(0, r - n + t[2] - t[0])
                            }
                        }(a)
                    }), [a]);
                    return e.createElement(wt, {
                        styles: Et(i, !n, a, r ? "" : "!important")
                    })
                },
                xt = !1;
            if ("undefined" != typeof window) try {
                var At = Object.defineProperty({}, "passive", {
                    get: function() {
                        return xt = !0, !0
                    }
                });
                window.addEventListener("test", At, At), window.removeEventListener("test", At, At)
            } catch (B) {
                xt = !1
            }
            var It = !!xt && {
                    passive: !1
                },
                kt = function(e, t) {
                    if (!(e instanceof Element)) return !1;
                    var n = window.getComputedStyle(e);
                    return "hidden" !== n[t] && !(n.overflowY === n.overflowX && ! function(e) {
                        return "TEXTAREA" === e.tagName
                    }(e) && "visible" === n[t])
                },
                Dt = function(e, t) {
                    var n = t.ownerDocument,
                        r = t;
                    do {
                        if ("undefined" != typeof ShadowRoot && r instanceof ShadowRoot && (r = r.host), Nt(e, r)) {
                            var o = Ot(e, r);
                            if (o[1] > o[2]) return !0
                        }
                        r = r.parentNode
                    } while (r && r !== n.body);
                    return !1
                },
                Nt = function(e, t) {
                    return "v" === e ? function(e) {
                        return kt(e, "overflowY")
                    }(t) : function(e) {
                        return kt(e, "overflowX")
                    }(t)
                },
                Ot = function(e, t) {
                    return "v" === e ? [(n = t).scrollTop, n.scrollHeight, n.clientHeight] : function(e) {
                        return [e.scrollLeft, e.scrollWidth, e.clientWidth]
                    }(t);
                    var n
                },
                Mt = function(e) {
                    return "changedTouches" in e ? [e.changedTouches[0].clientX, e.changedTouches[0].clientY] : [0, 0]
                },
                Rt = function(e) {
                    return [e.deltaX, e.deltaY]
                },
                jt = function(e) {
                    return e && "current" in e ? e.current : e
                },
                Ft = function(e) {
                    return "\n  .block-interactivity-".concat(e, " {pointer-events: none;}\n  .allow-interactivity-").concat(e, " {pointer-events: all;}\n")
                },
                Vt = 0,
                Ut = [];

            function Lt(e) {
                for (var t = null; null !== e;) e instanceof ShadowRoot && (t = e.host, e = e.host), e = e.parentNode;
                return t
            }
            var Wt, Kt = (Wt = function(t) {
                    var n = e.useRef([]),
                        r = e.useRef([0, 0]),
                        o = e.useRef(),
                        a = e.useState(Vt++)[0],
                        i = e.useState(gt)[0],
                        l = e.useRef(t);
                    e.useEffect((function() {
                        l.current = t
                    }), [t]), e.useEffect((function() {
                        if (t.inert) {
                            document.body.classList.add("block-interactivity-".concat(a));
                            var e = function(e, t, n) {
                                if (n || 2 === arguments.length)
                                    for (var r, o = 0, a = t.length; o < a; o++) !r && o in t || (r || (r = Array.prototype.slice.call(t, 0, o)), r[o] = t[o]);
                                return e.concat(r || Array.prototype.slice.call(t))
                            }([t.lockRef.current], (t.shards || []).map(jt), !0).filter(Boolean);
                            return e.forEach((function(e) {
                                    return e.classList.add("allow-interactivity-".concat(a))
                                })),
                                function() {
                                    document.body.classList.remove("block-interactivity-".concat(a)), e.forEach((function(e) {
                                        return e.classList.remove("allow-interactivity-".concat(a))
                                    }))
                                }
                        }
                    }), [t.inert, t.lockRef.current, t.shards]);
                    var c = e.useCallback((function(e, t) {
                            if ("touches" in e && 2 === e.touches.length || "wheel" === e.type && e.ctrlKey) return !l.current.allowPinchZoom;
                            var n, a = Mt(e),
                                i = r.current,
                                c = "deltaX" in e ? e.deltaX : i[0] - a[0],
                                s = "deltaY" in e ? e.deltaY : i[1] - a[1],
                                u = e.target,
                                d = Math.abs(c) > Math.abs(s) ? "h" : "v";
                            if ("touches" in e && "h" === d && "range" === u.type) return !1;
                            var f = Dt(d, u);
                            if (!f) return !0;
                            if (f ? n = d : (n = "v" === d ? "h" : "v", f = Dt(d, u)), !f) return !1;
                            if (!o.current && "changedTouches" in e && (c || s) && (o.current = n), !n) return !0;
                            var p = o.current || n;
                            return function(e, t, n, r, o) {
                                var a = function(e, t) {
                                        return "h" === e && "rtl" === t ? -1 : 1
                                    }(e, window.getComputedStyle(t).direction),
                                    i = a * r,
                                    l = n.target,
                                    c = t.contains(l),
                                    s = !1,
                                    u = i > 0,
                                    d = 0,
                                    f = 0;
                                do {
                                    var p = Ot(e, l),
                                        y = p[0],
                                        h = p[1] - p[2] - a * y;
                                    (y || h) && Nt(e, l) && (d += h, f += y), l = l instanceof ShadowRoot ? l.host : l.parentNode
                                } while (!c && l !== document.body || c && (t.contains(l) || t === l));
                                return (u && (o && Math.abs(d) < 1 || !o && i > d) || !u && (o && Math.abs(f) < 1 || !o && -i > f)) && (s = !0), s
                            }(p, t, e, "h" === p ? c : s, !0)
                        }), []),
                        s = e.useCallback((function(e) {
                            var t = e;
                            if (Ut.length && Ut[Ut.length - 1] === i) {
                                var r = "deltaY" in t ? Rt(t) : Mt(t),
                                    o = n.current.filter((function(e) {
                                        return e.name === t.type && (e.target === t.target || t.target === e.shadowParent) && function(e, t) {
                                            return e[0] === t[0] && e[1] === t[1]
                                        }(e.delta, r)
                                    }))[0];
                                if (o && o.should) t.cancelable && t.preventDefault();
                                else if (!o) {
                                    var a = (l.current.shards || []).map(jt).filter(Boolean).filter((function(e) {
                                        return e.contains(t.target)
                                    }));
                                    (a.length > 0 ? c(t, a[0]) : !l.current.noIsolation) && t.cancelable && t.preventDefault()
                                }
                            }
                        }), []),
                        u = e.useCallback((function(e, t, r, o) {
                            var a = {
                                name: e,
                                delta: t,
                                target: r,
                                should: o,
                                shadowParent: Lt(r)
                            };
                            n.current.push(a), setTimeout((function() {
                                n.current = n.current.filter((function(e) {
                                    return e !== a
                                }))
                            }), 1)
                        }), []),
                        d = e.useCallback((function(e) {
                            r.current = Mt(e), o.current = void 0
                        }), []),
                        f = e.useCallback((function(e) {
                            u(e.type, Rt(e), e.target, c(e, t.lockRef.current))
                        }), []),
                        p = e.useCallback((function(e) {
                            u(e.type, Mt(e), e.target, c(e, t.lockRef.current))
                        }), []);
                    e.useEffect((function() {
                        return Ut.push(i), t.setCallbacks({
                                onScrollCapture: f,
                                onWheelCapture: f,
                                onTouchMoveCapture: p
                            }), document.addEventListener("wheel", s, It), document.addEventListener("touchmove", s, It), document.addEventListener("touchstart", d, It),
                            function() {
                                Ut = Ut.filter((function(e) {
                                    return e !== i
                                })), document.removeEventListener("wheel", s, It), document.removeEventListener("touchmove", s, It), document.removeEventListener("touchstart", d, It)
                            }
                    }), []);
                    var y = t.removeScrollBar,
                        h = t.inert;
                    return e.createElement(e.Fragment, null, h ? e.createElement(i, {
                        styles: Ft(a)
                    }) : null, y ? e.createElement(Tt, {
                        gapMode: t.gapMode
                    }) : null)
                }, yt.useMedium(Wt), pt),
                _t = e.forwardRef((function(t, n) {
                    return e.createElement(mt, M({}, t, {
                        ref: n,
                        sideCar: Kt
                    }))
                }));
            _t.classNames = mt.classNames;
            var Bt = _t,
                zt = new WeakMap,
                qt = new WeakMap,
                Ht = {},
                Gt = 0,
                Yt = function e(t) {
                    return t && (t.host || e(t.parentNode))
                },
                $t = function(e, t, n) {
                    void 0 === n && (n = "data-aria-hidden");
                    var r = Array.from(Array.isArray(e) ? e : [e]),
                        o = t || function(e) {
                            return "undefined" == typeof document ? null : (Array.isArray(e) ? e[0] : e).ownerDocument.body
                        }(e);
                    return o ? (r.push.apply(r, Array.from(o.querySelectorAll("[aria-live]"))), function(e, t, n, r) {
                        var o = function(e, t) {
                            return t.map((function(t) {
                                if (e.contains(t)) return t;
                                var n = Yt(t);
                                return n && e.contains(n) ? n : (console.error("aria-hidden", t, "in not contained inside", e, ". Doing nothing"), null)
                            })).filter((function(e) {
                                return Boolean(e)
                            }))
                        }(t, Array.isArray(e) ? e : [e]);
                        Ht[n] || (Ht[n] = new WeakMap);
                        var a = Ht[n],
                            i = [],
                            l = new Set,
                            c = new Set(o);
                        return o.forEach((function e(t) {
                                t && !l.has(t) && (l.add(t), e(t.parentNode))
                            })),
                            function e(t) {
                                t && !c.has(t) && Array.prototype.forEach.call(t.children, (function(t) {
                                    if (l.has(t)) e(t);
                                    else try {
                                        var o = t.getAttribute(r),
                                            c = null !== o && "false" !== o,
                                            s = (zt.get(t) || 0) + 1,
                                            u = (a.get(t) || 0) + 1;
                                        zt.set(t, s), a.set(t, u), i.push(t), 1 === s && c && qt.set(t, !0), 1 === u && t.setAttribute(n, "true"), c || t.setAttribute(r, "true")
                                    } catch (o) {
                                        console.error("aria-hidden: cannot operate on ", t, o)
                                    }
                                }))
                            }(t), l.clear(), Gt++,
                            function() {
                                i.forEach((function(e) {
                                    var t = zt.get(e) - 1,
                                        o = a.get(e) - 1;
                                    zt.set(e, t), a.set(e, o), t || (qt.has(e) || e.removeAttribute(r), qt.delete(e)), o || e.removeAttribute(n)
                                })), --Gt || (zt = new WeakMap, zt = new WeakMap, qt = new WeakMap, Ht = {})
                            }
                    }(r, o, n, "aria-hidden")) : function() {
                        return null
                    }
                };

            function Jt(e) {
                return function(e) {
                    if (Array.isArray(e)) return en(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && Symbol.iterator in Object(e)) return Array.from(e)
                }(e) || Zt(e) || function() {
                    throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function Qt(e, t) {
                if (null == e) return {};
                var n, r, o = function(e, t) {
                    if (null == e) return {};
                    var n, r, o = {},
                        a = Object.keys(e);
                    for (r = 0; r < a.length; r++) n = a[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var a = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < a.length; r++) n = a[r], t.indexOf(n) >= 0 || Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                }
                return o
            }

            function Xt(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var n = [],
                        r = !0,
                        o = !1,
                        a = void 0;
                    try {
                        for (var i, l = e[Symbol.iterator](); !(r = (i = l.next()).done) && (n.push(i.value), !t || n.length !== t); r = !0);
                    } catch (e) {
                        o = !0, a = e
                    } finally {
                        try {
                            r || null == l.return || l.return()
                        } finally {
                            if (o) throw a
                        }
                    }
                    return n
                }(e, t) || Zt(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function Zt(e, t) {
                if (e) {
                    if ("string" == typeof e) return en(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    return "Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n ? Array.from(e) : "Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n) ? en(e, t) : void 0
                }
            }

            function en(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = new Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function tn(e, t) {
                var n = Object.keys(e);
                if (Object.getOwnPropertySymbols) {
                    var r = Object.getOwnPropertySymbols(e);
                    t && (r = r.filter((function(t) {
                        return Object.getOwnPropertyDescriptor(e, t).enumerable
                    }))), n.push.apply(n, r)
                }
                return n
            }

            function nn(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {};
                    t % 2 ? tn(Object(n), !0).forEach((function(t) {
                        rn(e, t, n[t])
                    })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(n)) : tn(Object(n)).forEach((function(t) {
                        Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(n, t))
                    }))
                }
                return e
            }

            function rn(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function on(e, t) {
                var n = (arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {}).checkForDefaultPrevented,
                    r = void 0 === n || n;
                return function(n) {
                    if (null != e && e(n), !1 === r || !n.defaultPrevented) return null == t ? void 0 : t(n)
                }
            }

            function an(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function ln() {
                for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                return function(e) {
                    var n = !1,
                        r = t.map((function(t) {
                            var r = an(t, e);
                            return n || "function" != typeof r || (n = !0), r
                        }));
                    if (n) return function() {
                        for (var e = 0; e < r.length; e++) {
                            var n = r[e];
                            "function" == typeof n ? n() : an(t[e], null)
                        }
                    }
                }
            }

            function cn() {
                for (var t = arguments.length, n = new Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                return e.useCallback(ln.apply(void 0, n), n)
            }

            function sn() {
                for (var t = arguments.length, n = new Array(t), r = 0; r < t; r++) n[r] = arguments[r];
                var o = n[0];
                if (1 === n.length) return o;
                var a = function() {
                    var t = n.map((function(e) {
                        return {
                            useScope: e(),
                            scopeName: e.scopeName
                        }
                    }));
                    return function(n) {
                        var r = t.reduce((function(e, t) {
                            var r = t.useScope,
                                o = t.scopeName;
                            return nn(nn({}, e), r(n)["__scope".concat(o)])
                        }), {});
                        return e.useMemo((function() {
                            return rn({}, "__scope".concat(o.scopeName), r)
                        }), [r])
                    }
                };
                return a.scopeName = o.scopeName, a
            }

            function un(t) {
                var n = e.useRef(t);
                return e.useEffect((function() {
                    n.current = t
                })), e.useMemo((function() {
                    return function() {
                        for (var e, t = arguments.length, r = new Array(t), o = 0; o < t; o++) r[o] = arguments[o];
                        return null === (e = n.current) || void 0 === e ? void 0 : e.call.apply(e, [n].concat(r))
                    }
                }), [])
            }
            var dn = null !== globalThis && void 0 !== globalThis && globalThis.document ? e.useLayoutEffect : function() {},
                fn = function(t) {
                    var n = t.present,
                        r = t.children,
                        o = function(t) {
                            var n = Xt(e.useState(), 2),
                                r = n[0],
                                o = n[1],
                                a = e.useRef({}),
                                i = e.useRef(t),
                                l = e.useRef("none"),
                                c = function(t, n) {
                                    return e.useReducer((function(e, t) {
                                        var r;
                                        return null !== (r = n[e][t]) && void 0 !== r ? r : e
                                    }), t)
                                }(t ? "mounted" : "unmounted", {
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
                                }),
                                s = Xt(c, 2),
                                u = s[0],
                                d = s[1];
                            return e.useEffect((function() {
                                var e = pn(a.current);
                                l.current = "mounted" === u ? e : "none"
                            }), [u]), dn((function() {
                                var e = a.current,
                                    n = i.current;
                                if (n !== t) {
                                    var r = l.current,
                                        o = pn(e);
                                    t ? d("MOUNT") : "none" === o || "none" === (null == e ? void 0 : e.display) ? d("UNMOUNT") : d(n && r !== o ? "ANIMATION_OUT" : "UNMOUNT"), i.current = t
                                }
                            }), [t, d]), dn((function() {
                                if (r) {
                                    var e, t, n = null !== (e = r.ownerDocument.defaultView) && void 0 !== e ? e : window,
                                        o = function(e) {
                                            var o = pn(a.current).includes(e.animationName);
                                            if (e.target === r && o && (d("ANIMATION_END"), !i.current)) {
                                                var l = r.style.animationFillMode;
                                                r.style.animationFillMode = "forwards", t = n.setTimeout((function() {
                                                    "forwards" === r.style.animationFillMode && (r.style.animationFillMode = l)
                                                }))
                                            }
                                        },
                                        c = function(e) {
                                            e.target === r && (l.current = pn(a.current))
                                        };
                                    return r.addEventListener("animationstart", c), r.addEventListener("animationcancel", o), r.addEventListener("animationend", o),
                                        function() {
                                            n.clearTimeout(t), r.removeEventListener("animationstart", c), r.removeEventListener("animationcancel", o), r.removeEventListener("animationend", o)
                                        }
                                }
                                d("ANIMATION_END")
                            }), [r, d]), {
                                isPresent: ["mounted", "unmountSuspended"].includes(u),
                                ref: e.useCallback((function(e) {
                                    e && (a.current = getComputedStyle(e)), o(e)
                                }), [])
                            }
                        }(n),
                        a = "function" == typeof r ? r({
                            present: o.isPresent
                        }) : e.Children.only(r),
                        i = cn(o.ref, function(e) {
                            var t, n, r = null === (t = Object.getOwnPropertyDescriptor(e.props, "ref")) || void 0 === t ? void 0 : t.get,
                                o = r && "isReactWarning" in r && r.isReactWarning;
                            return o ? e.ref : (o = (r = null === (n = Object.getOwnPropertyDescriptor(e, "ref")) || void 0 === n ? void 0 : n.get) && "isReactWarning" in r && r.isReactWarning) ? e.props.ref : e.props.ref || e.ref
                        }(a));
                    return "function" == typeof r || o.isPresent ? e.cloneElement(a, {
                        ref: i
                    }) : null
                };

            function pn(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }

            function yn(t) {
                var n = function(t) {
                        var n = e.forwardRef((function(t, n) {
                            var r = t.children,
                                o = Qt(t, ["children"]);
                            if (e.isValidElement(r)) {
                                var a = function(e) {
                                        var t, n, r = null === (t = Object.getOwnPropertyDescriptor(e.props, "ref")) || void 0 === t ? void 0 : t.get,
                                            o = r && "isReactWarning" in r && r.isReactWarning;
                                        return o ? e.ref : (o = (r = null === (n = Object.getOwnPropertyDescriptor(e, "ref")) || void 0 === n ? void 0 : n.get) && "isReactWarning" in r && r.isReactWarning) ? e.props.ref : e.props.ref || e.ref
                                    }(r),
                                    i = function(e, t) {
                                        var n = nn({}, t),
                                            r = function(r) {
                                                var o = e[r],
                                                    a = t[r];
                                                /^on[A-Z]/.test(r) ? o && a ? n[r] = function() {
                                                    a.apply(void 0, arguments), o.apply(void 0, arguments)
                                                } : o && (n[r] = o) : "style" === r ? n[r] = nn(nn({}, o), a) : "className" === r && (n[r] = [o, a].filter(Boolean).join(" "))
                                            };
                                        for (var o in t) r(o);
                                        return nn(nn({}, e), n)
                                    }(o, r.props);
                                return r.type !== e.Fragment && (i.ref = n ? ln(n, a) : a), e.cloneElement(r, i)
                            }
                            return e.Children.count(r) > 1 ? e.Children.only(null) : null
                        }));
                        return n.displayName = "".concat(t, ".SlotClone"), n
                    }(t),
                    r = e.forwardRef((function(t, r) {
                        var o = t.children,
                            a = Qt(t, ["children"]),
                            i = e.Children.toArray(o),
                            l = i.find(mn);
                        if (l) {
                            var c = l.props.children,
                                s = i.map((function(t) {
                                    return t === l ? e.Children.count(c) > 1 ? e.Children.only(null) : e.isValidElement(c) ? c.props.children : null : t
                                }));
                            return (0, V.jsx)(n, nn(nn({}, a), {}, {
                                ref: r,
                                children: e.isValidElement(c) ? e.cloneElement(c, void 0, s) : null
                            }))
                        }
                        return (0, V.jsx)(n, nn(nn({}, a), {}, {
                            ref: r,
                            children: o
                        }))
                    }));
                return r.displayName = "".concat(t, ".Slot"), r
            }
            fn.displayName = "Presence";
            var hn = Symbol("radix.slottable");

            function mn(t) {
                return e.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === hn
            }
            var vn = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((function(t, n) {
                    var r = yn("Primitive.".concat(n)),
                        o = e.forwardRef((function(e, t) {
                            var o = e.asChild,
                                a = Qt(e, ["asChild"]),
                                i = o ? r : n;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, V.jsx)(i, nn(nn({}, a), {}, {
                                ref: t
                            }))
                        }));
                    return o.displayName = "Primitive.".concat(n), nn(nn({}, t), {}, rn({}, n, o))
                }), {}),
                gn = "Dialog",
                bn = function(t) {
                    var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        r = [],
                        o = function() {
                            var n = r.map((function(t) {
                                return e.createContext(t)
                            }));
                            return function(r) {
                                var o = (null == r ? void 0 : r[t]) || n;
                                return e.useMemo((function() {
                                    return rn({}, "__scope".concat(t), nn(nn({}, r), {}, rn({}, t, o)))
                                }), [r, o])
                            }
                        };
                    return o.scopeName = t, [function(n, o) {
                        var a = e.createContext(o),
                            i = r.length;
                        r = [].concat(Jt(r), [o]);
                        var l = function(n) {
                            var r, o = n.scope,
                                l = n.children,
                                c = Qt(n, ["scope", "children"]),
                                s = (null == o || null === (r = o[t]) || void 0 === r ? void 0 : r[i]) || a,
                                u = e.useMemo((function() {
                                    return c
                                }), Object.values(c));
                            return (0, V.jsx)(s.Provider, {
                                value: u,
                                children: l
                            })
                        };
                        return l.displayName = n + "Provider", [l, function(r, l) {
                            var c, s = (null == l || null === (c = l[t]) || void 0 === c ? void 0 : c[i]) || a,
                                u = e.useContext(s);
                            if (u) return u;
                            if (void 0 !== o) return o;
                            throw new Error("`".concat(r, "` must be used within `").concat(n, "`"))
                        }]
                    }, sn.apply(void 0, [o].concat(Jt(n)))]
                }(gn),
                Cn = Xt(bn, 2),
                wn = Cn[0],
                Sn = (Cn[1], Xt(wn(gn), 2)),
                En = Sn[0],
                Pn = Sn[1],
                Tn = function(t) {
                    var n = t.__scopeDialog,
                        r = t.children,
                        o = t.open,
                        a = t.defaultOpen,
                        i = t.onOpenChange,
                        l = t.modal,
                        c = void 0 === l || l,
                        s = e.useRef(null),
                        u = e.useRef(null),
                        d = function(t) {
                            var n = t.prop,
                                r = t.defaultProp,
                                o = t.onChange,
                                a = void 0 === o ? function() {} : o,
                                i = function(t) {
                                    var n = t.defaultProp,
                                        r = t.onChange,
                                        o = e.useState(n),
                                        a = Xt(o, 1)[0],
                                        i = e.useRef(a),
                                        l = un(r);
                                    return e.useEffect((function() {
                                        i.current !== a && (l(a), i.current = a)
                                    }), [a, i, l]), o
                                }({
                                    defaultProp: r,
                                    onChange: a
                                }),
                                l = Xt(i, 2),
                                c = l[0],
                                s = l[1],
                                u = void 0 !== n,
                                d = u ? n : c,
                                f = un(a);
                            return [d, e.useCallback((function(e) {
                                if (u) {
                                    var t = "function" == typeof e ? e(n) : e;
                                    t !== n && f(t)
                                } else s(e)
                            }), [u, n, s, f])]
                        }({
                            prop: o,
                            defaultProp: a,
                            onChange: i
                        }),
                        f = Xt(d, 2),
                        p = f[0],
                        y = void 0 !== p && p,
                        h = f[1];
                    return (0, V.jsx)(En, {
                        scope: n,
                        triggerRef: s,
                        contentRef: u,
                        contentId: pe(),
                        titleId: pe(),
                        descriptionId: pe(),
                        open: y,
                        onOpenChange: h,
                        onOpenToggle: e.useCallback((function() {
                            return h((function(e) {
                                return !e
                            }))
                        }), [h]),
                        modal: c,
                        children: r
                    })
                };
            Tn.displayName = gn;
            var xn = "DialogTrigger",
                An = e.forwardRef((function(e, t) {
                    var n = e.__scopeDialog,
                        r = Qt(e, ["__scopeDialog"]),
                        o = Pn(xn, n),
                        a = cn(t, o.triggerRef);
                    return (0, V.jsx)(vn.button, nn(nn({
                        type: "button",
                        "aria-haspopup": "dialog",
                        "aria-expanded": o.open,
                        "aria-controls": o.contentId,
                        "data-state": Yn(o.open)
                    }, r), {}, {
                        ref: a,
                        onClick: on(e.onClick, o.onOpenToggle)
                    }))
                }));
            An.displayName = xn;
            var In = "DialogPortal",
                kn = Xt(wn(In, {
                    forceMount: void 0
                }), 2),
                Dn = kn[0],
                Nn = kn[1],
                On = function(t) {
                    var n = t.__scopeDialog,
                        r = t.forceMount,
                        o = t.children,
                        a = t.container,
                        i = Pn(In, n);
                    return (0, V.jsx)(Dn, {
                        scope: n,
                        forceMount: r,
                        children: e.Children.map(o, (function(e) {
                            return (0, V.jsx)(fn, {
                                present: r || i.open,
                                children: (0, V.jsx)(ot, {
                                    asChild: !0,
                                    container: a,
                                    children: e
                                })
                            })
                        }))
                    })
                };
            On.displayName = In;
            var Mn = "DialogOverlay",
                Rn = e.forwardRef((function(e, t) {
                    var n = Nn(Mn, e.__scopeDialog),
                        r = e.forceMount,
                        o = void 0 === r ? n.forceMount : r,
                        a = Qt(e, ["forceMount"]),
                        i = Pn(Mn, e.__scopeDialog);
                    return i.modal ? (0, V.jsx)(fn, {
                        present: o || i.open,
                        children: (0, V.jsx)(Fn, nn(nn({}, a), {}, {
                            ref: t
                        }))
                    }) : null
                }));
            Rn.displayName = Mn;
            var jn = yn("DialogOverlay.RemoveScroll"),
                Fn = e.forwardRef((function(e, t) {
                    var n = e.__scopeDialog,
                        r = Qt(e, ["__scopeDialog"]),
                        o = Pn(Mn, n);
                    return (0, V.jsx)(Bt, {
                        as: jn,
                        allowPinchZoom: !0,
                        shards: [o.contentRef],
                        children: (0, V.jsx)(vn.div, nn(nn({
                            "data-state": Yn(o.open)
                        }, r), {}, {
                            ref: t,
                            style: nn({
                                pointerEvents: "auto"
                            }, r.style)
                        }))
                    })
                })),
                Vn = "DialogContent",
                Un = e.forwardRef((function(e, t) {
                    var n = Nn(Vn, e.__scopeDialog),
                        r = e.forceMount,
                        o = void 0 === r ? n.forceMount : r,
                        a = Qt(e, ["forceMount"]),
                        i = Pn(Vn, e.__scopeDialog);
                    return (0, V.jsx)(fn, {
                        present: o || i.open,
                        children: i.modal ? (0, V.jsx)(Ln, nn(nn({}, a), {}, {
                            ref: t
                        })) : (0, V.jsx)(Wn, nn(nn({}, a), {}, {
                            ref: t
                        }))
                    })
                }));
            Un.displayName = Vn;
            var Ln = e.forwardRef((function(t, n) {
                    var r = Pn(Vn, t.__scopeDialog),
                        o = e.useRef(null),
                        a = cn(n, r.contentRef, o);
                    return e.useEffect((function() {
                        var e = o.current;
                        if (e) return $t(e)
                    }), []), (0, V.jsx)(Kn, nn(nn({}, t), {}, {
                        ref: a,
                        trapFocus: r.open,
                        disableOutsidePointerEvents: !0,
                        onCloseAutoFocus: on(t.onCloseAutoFocus, (function(e) {
                            var t;
                            e.preventDefault(), null === (t = r.triggerRef.current) || void 0 === t || t.focus()
                        })),
                        onPointerDownOutside: on(t.onPointerDownOutside, (function(e) {
                            var t = e.detail.originalEvent,
                                n = 0 === t.button && !0 === t.ctrlKey;
                            (2 === t.button || n) && e.preventDefault()
                        })),
                        onFocusOutside: on(t.onFocusOutside, (function(e) {
                            return e.preventDefault()
                        }))
                    }))
                })),
                Wn = e.forwardRef((function(t, n) {
                    var r = Pn(Vn, t.__scopeDialog),
                        o = e.useRef(!1),
                        a = e.useRef(!1);
                    return (0, V.jsx)(Kn, nn(nn({}, t), {}, {
                        ref: n,
                        trapFocus: !1,
                        disableOutsidePointerEvents: !1,
                        onCloseAutoFocus: function(e) {
                            var n, i;
                            null !== (n = t.onCloseAutoFocus) && void 0 !== n && n.call(t, e), e.defaultPrevented || (o.current || null !== (i = r.triggerRef.current) && void 0 !== i && i.focus(), e.preventDefault()), o.current = !1, a.current = !1
                        },
                        onInteractOutside: function(e) {
                            var n, i;
                            null !== (n = t.onInteractOutside) && void 0 !== n && n.call(t, e), e.defaultPrevented || (o.current = !0, "pointerdown" === e.detail.originalEvent.type && (a.current = !0));
                            var l = e.target;
                            (null === (i = r.triggerRef.current) || void 0 === i ? void 0 : i.contains(l)) && e.preventDefault(), "focusin" === e.detail.originalEvent.type && a.current && e.preventDefault()
                        }
                    }))
                })),
                Kn = e.forwardRef((function(t, n) {
                    var r = t.__scopeDialog,
                        o = t.trapFocus,
                        a = t.onOpenAutoFocus,
                        i = t.onCloseAutoFocus,
                        l = Qt(t, ["__scopeDialog", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus"]),
                        c = Pn(Vn, r),
                        s = e.useRef(null),
                        u = cn(n, s);
                    return e.useEffect((function() {
                        var e, t, n = document.querySelectorAll("[data-radix-focus-guard]");
                        return document.body.insertAdjacentElement("afterbegin", null !== (e = n[0]) && void 0 !== e ? e : it()), document.body.insertAdjacentElement("beforeend", null !== (t = n[1]) && void 0 !== t ? t : it()), at++,
                            function() {
                                1 === at && document.querySelectorAll("[data-radix-focus-guard]").forEach((function(e) {
                                    return e.remove()
                                })), at--
                            }
                    }), []), (0, V.jsxs)(V.Fragment, {
                        children: [(0, V.jsx)(He, {
                            asChild: !0,
                            loop: !0,
                            trapped: o,
                            onMountAutoFocus: a,
                            onUnmountAutoFocus: i,
                            children: (0, V.jsx)(Re, nn(nn({
                                role: "dialog",
                                id: c.contentId,
                                "aria-describedby": c.descriptionId,
                                "aria-labelledby": c.titleId,
                                "data-state": Yn(c.open)
                            }, l), {}, {
                                ref: u,
                                onDismiss: function() {
                                    return c.onOpenChange(!1)
                                }
                            }))
                        }), (0, V.jsxs)(V.Fragment, {
                            children: [(0, V.jsx)(Zn, {
                                titleId: c.titleId
                            }), (0, V.jsx)(er, {
                                contentRef: s,
                                descriptionId: c.descriptionId
                            })]
                        })]
                    })
                })),
                _n = "DialogTitle",
                Bn = e.forwardRef((function(e, t) {
                    var n = e.__scopeDialog,
                        r = Qt(e, ["__scopeDialog"]),
                        o = Pn(_n, n);
                    return (0, V.jsx)(vn.h2, nn(nn({
                        id: o.titleId
                    }, r), {}, {
                        ref: t
                    }))
                }));
            Bn.displayName = _n;
            var zn = "DialogDescription",
                qn = e.forwardRef((function(e, t) {
                    var n = e.__scopeDialog,
                        r = Qt(e, ["__scopeDialog"]),
                        o = Pn(zn, n);
                    return (0, V.jsx)(vn.p, nn(nn({
                        id: o.descriptionId
                    }, r), {}, {
                        ref: t
                    }))
                }));
            qn.displayName = zn;
            var Hn = "DialogClose",
                Gn = e.forwardRef((function(e, t) {
                    var n = e.__scopeDialog,
                        r = Qt(e, ["__scopeDialog"]),
                        o = Pn(Hn, n);
                    return (0, V.jsx)(vn.button, nn(nn({
                        type: "button"
                    }, r), {}, {
                        ref: t,
                        onClick: on(e.onClick, (function() {
                            return o.onOpenChange(!1)
                        }))
                    }))
                }));

            function Yn(e) {
                return e ? "open" : "closed"
            }
            Gn.displayName = Hn;
            var $n = "DialogTitleWarning",
                Jn = function(t, n) {
                    var r = e.createContext(n),
                        o = function(t) {
                            var n = t.children,
                                o = Qt(t, ["children"]),
                                a = e.useMemo((function() {
                                    return o
                                }), Object.values(o));
                            return (0, V.jsx)(r.Provider, {
                                value: a,
                                children: n
                            })
                        };
                    return o.displayName = t + "Provider", [o, function(o) {
                        var a = e.useContext(r);
                        if (a) return a;
                        if (void 0 !== n) return n;
                        throw new Error("`".concat(o, "` must be used within `").concat(t, "`"))
                    }]
                }($n, {
                    contentName: Vn,
                    titleName: _n,
                    docsSlug: "dialog"
                }),
                Qn = Xt(Jn, 2),
                Xn = (Qn[0], Qn[1]),
                Zn = function(t) {
                    var n = t.titleId,
                        r = Xn($n),
                        o = "`".concat(r.contentName, "` requires a `").concat(r.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(r.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(r.docsSlug);
                    return e.useEffect((function() {
                        n && (document.getElementById(n) || console.error(o))
                    }), [o, n]), null
                },
                er = function(t) {
                    var n = t.contentRef,
                        r = t.descriptionId,
                        o = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(Xn("DialogDescriptionWarning").contentName, "}.");
                    return e.useEffect((function() {
                        var e, t = null === (e = n.current) || void 0 === e ? void 0 : e.getAttribute("aria-describedby");
                        r && t && (document.getElementById(r) || console.warn(o))
                    }), [o, n, r]), null
                },
                tr = Tn,
                nr = On,
                rr = Rn,
                or = Un,
                ar = Bn,
                ir = Gn;

            function lr(e, t) {
                var n = Object.keys(e);
                if (Object.getOwnPropertySymbols) {
                    var r = Object.getOwnPropertySymbols(e);
                    t && (r = r.filter((function(t) {
                        return Object.getOwnPropertyDescriptor(e, t).enumerable
                    }))), n.push.apply(n, r)
                }
                return n
            }

            function cr(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {};
                    t % 2 ? lr(Object(n), !0).forEach((function(t) {
                        sr(e, t, n[t])
                    })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(n)) : lr(Object(n)).forEach((function(t) {
                        Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(n, t))
                    }))
                }
                return e
            }

            function sr(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function ur(e, t) {
                if (null == e) return {};
                var n, r, o = function(e, t) {
                    if (null == e) return {};
                    var n, r, o = {},
                        a = Object.keys(e);
                    for (r = 0; r < a.length; r++) n = a[r], t.indexOf(n) >= 0 || (o[n] = e[n]);
                    return o
                }(e, t);
                if (Object.getOwnPropertySymbols) {
                    var a = Object.getOwnPropertySymbols(e);
                    for (r = 0; r < a.length; r++) n = a[r], t.indexOf(n) >= 0 || Object.prototype.propertyIsEnumerable.call(e, n) && (o[n] = e[n])
                }
                return o
            }

            function dr(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }
            var fr = Symbol("radix.slottable");

            function pr(t) {
                return e.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === fr
            }
            var yr = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce((function(t, n) {
                    var r = function(t) {
                            var n = function(t) {
                                    var n = e.forwardRef((function(t, n) {
                                        var r = t.children,
                                            o = ur(t, ["children"]);
                                        if (e.isValidElement(r)) {
                                            var a = function(e) {
                                                    var t, n, r = null === (t = Object.getOwnPropertyDescriptor(e.props, "ref")) || void 0 === t ? void 0 : t.get,
                                                        o = r && "isReactWarning" in r && r.isReactWarning;
                                                    return o ? e.ref : (o = (r = null === (n = Object.getOwnPropertyDescriptor(e, "ref")) || void 0 === n ? void 0 : n.get) && "isReactWarning" in r && r.isReactWarning) ? e.props.ref : e.props.ref || e.ref
                                                }(r),
                                                i = function(e, t) {
                                                    var n = cr({}, t),
                                                        r = function(r) {
                                                            var o = e[r],
                                                                a = t[r];
                                                            /^on[A-Z]/.test(r) ? o && a ? n[r] = function() {
                                                                var e = a.apply(void 0, arguments);
                                                                return o.apply(void 0, arguments), e
                                                            } : o && (n[r] = o) : "style" === r ? n[r] = cr(cr({}, o), a) : "className" === r && (n[r] = [o, a].filter(Boolean).join(" "))
                                                        };
                                                    for (var o in t) r(o);
                                                    return cr(cr({}, e), n)
                                                }(o, r.props);
                                            return r.type !== e.Fragment && (i.ref = n ? function() {
                                                for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                                                return function(e) {
                                                    var n = !1,
                                                        r = t.map((function(t) {
                                                            var r = dr(t, e);
                                                            return n || "function" != typeof r || (n = !0), r
                                                        }));
                                                    if (n) return function() {
                                                        for (var e = 0; e < r.length; e++) {
                                                            var n = r[e];
                                                            "function" == typeof n ? n() : dr(t[e], null)
                                                        }
                                                    }
                                                }
                                            }(n, a) : a), e.cloneElement(r, i)
                                        }
                                        return e.Children.count(r) > 1 ? e.Children.only(null) : null
                                    }));
                                    return n.displayName = "".concat(t, ".SlotClone"), n
                                }(t),
                                r = e.forwardRef((function(t, r) {
                                    var o = t.children,
                                        a = ur(t, ["children"]),
                                        i = e.Children.toArray(o),
                                        l = i.find(pr);
                                    if (l) {
                                        var c = l.props.children,
                                            s = i.map((function(t) {
                                                return t === l ? e.Children.count(c) > 1 ? e.Children.only(null) : e.isValidElement(c) ? c.props.children : null : t
                                            }));
                                        return (0, V.jsx)(n, cr(cr({}, a), {}, {
                                            ref: r,
                                            children: e.isValidElement(c) ? e.cloneElement(c, void 0, s) : null
                                        }))
                                    }
                                    return (0, V.jsx)(n, cr(cr({}, a), {}, {
                                        ref: r,
                                        children: o
                                    }))
                                }));
                            return r.displayName = "".concat(t, ".Slot"), r
                        }("Primitive.".concat(n)),
                        o = e.forwardRef((function(e, t) {
                            var o = e.asChild,
                                a = ur(e, ["asChild"]),
                                i = o ? r : n;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, V.jsx)(i, cr(cr({}, a), {}, {
                                ref: t
                            }))
                        }));
                    return o.displayName = "Primitive.".concat(n), cr(cr({}, t), {}, sr({}, n, o))
                }), {}),
                hr = Object.freeze({
                    position: "absolute",
                    border: 0,
                    width: 1,
                    height: 1,
                    padding: 0,
                    margin: -1,
                    overflow: "hidden",
                    clip: "rect(0, 0, 0, 0)",
                    whiteSpace: "nowrap",
                    wordWrap: "normal"
                }),
                mr = e.forwardRef((function(e, t) {
                    return (0, V.jsx)(yr.span, cr(cr({}, e), {}, {
                        ref: t,
                        style: cr(cr({}, hr), e.style)
                    }))
                }));
            mr.displayName = "VisuallyHidden", Z(".bg-common-backdrop{background-color:var(--color-common-backdrop)}.shadow-transient-high{box-shadow:var(--size-0) var(--size-50) var(--size-100) -.5px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-250) var(--size-500) -.75px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-400) var(--size-800) -1px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-1200) var(--size-1400) -1.5px var(--alpha-color-shadow-subtle)}.shadow-transient-low{box-shadow:var(--size-0) var(--size-50) var(--size-100) -.5px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-250) var(--size-500) -.75px var(--alpha-color-shadow-subtle)}.foundation-web-portal-zindex{z-index:1050}.fui-future-shadow-affixed-low{box-shadow:0 0 var(--size-100) 0 var(--fui-future-alpha-color-shadow-subtle),0 0 var(--size-500) 0 var(--fui-future-alpha-color-shadow-subtle)}.light-theme,.system-theme,:root{--alpha-color-shadow-subtle:rgba(0,0,0,.08);--fui-future-alpha-color-shadow-subtle:rgba(0,0,0,.08);--fui-future-alpha-color-system-progress:var(--light-mode-system-contrast)}.dark-theme{--alpha-color-shadow-subtle:rgba(4,4,8,.25);--fui-future-alpha-color-shadow-subtle:rgba(4,4,8,.25);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}@media (prefers-color-scheme:dark){:is(:root,.system-theme){--alpha-color-shadow-subtle:rgba(4,4,8,.25);--fui-future-alpha-color-shadow-subtle:rgba(4,4,8,.25);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}}:is(:root,.light-theme,.system-theme) .stroke-contrast-alpha{border-color:rgba(27,37,75,.5)}.dark-theme .stroke-contrast-alpha{border-color:rgba(208,217,251,.4)}@media (prefers-color-scheme:dark){:is(:root,.system-theme) .stroke-contrast-alpha{border-color:rgba(208,217,251,.4)}}.foundation-web-input.stroke-contrast-alpha:focus,.foundation-web-input.stroke-contrast-alpha:focus-within,.foundation-web-input.stroke-emphasis:focus,.foundation-web-input.stroke-emphasis:focus-within{border-color:var(--color-system-emphasis);box-shadow:inset 0 0 0 1px var(--color-system-emphasis)}.foundation-web-input.stroke-system-alert:focus,.foundation-web-input.stroke-system-alert:focus-within{box-shadow:inset 0 0 0 1px var(--color-system-alert)}");
            var vr = {
                    Small: "padding-xsmall",
                    Medium: "padding-small",
                    Large: "padding-medium"
                },
                gr = {
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-100"
                },
                br = function(e) {
                    var n = e.variant,
                        r = e.size,
                        o = e.isCircular,
                        a = e.className,
                        i = R(e, ["variant", "size", "isCircular", "className"]);
                    return t().createElement("button", Object.assign({
                        type: "button",
                        className: F("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", Q, gr[n], vr[r], o && "radius-circle", a)
                    }, i), t().createElement(X, null), t().createElement(ne, {
                        name: "icon-regular-x",
                        size: r
                    }))
                };
            Z(".foundation-web-dialog-overlay{bottom:0;display:grid;left:0;overflow-y:auto;place-items:center;position:fixed;right:0;top:0}.foundation-web-dialog-close-container{right:var(--size-300);top:var(--size-300);z-index:1}.foundation-web-dialog-hero-media{border-top-left-radius:var(--radius-large);border-top-right-radius:var(--radius-large);margin-left:calc(var(--stroke-standard)*-1);margin-right:calc(var(--stroke-standard)*-1);margin-top:calc(var(--stroke-standard)*-1);overflow:clip}.foundation-web-dialog-content[data-size=Small]{max-width:calc(var(--size-100)*80);min-width:calc(var(--size-100)*75)}.foundation-web-dialog-content[data-size=Medium]{max-width:calc(var(--size-100)*120);min-width:calc(var(--size-100)*75)}.foundation-web-dialog-content[data-size=Large]{max-width:calc(var(--size-100)*160);min-width:calc(var(--size-100)*75)}@keyframes foundation-web-dialog-backdrop-fade-in{0%{opacity:0}to{opacity:1}}@keyframes foundation-web-dialog-backdrop-fade-out{0%{opacity:1}to{opacity:0}}@keyframes foundation-web-dialog-content-scale-in{0%{transform:scale(.975)}to{transform:scale(1)}}@keyframes foundation-web-dialog-content-scale-out{0%{transform:scale(1)}to{transform:scale(.975)}}@media (prefers-reduced-motion:no-preference){.foundation-web-dialog-overlay[data-state=open]{animation:foundation-web-dialog-backdrop-fade-in var(--time-100) var(--ease-linear)}.foundation-web-dialog-overlay[data-state=closed]{animation:foundation-web-dialog-backdrop-fade-out var(--time-100) var(--ease-linear)}.foundation-web-dialog-content[data-state=open]{animation:foundation-web-dialog-content-scale-in var(--time-300) var(--ease-standard-out)}.foundation-web-dialog-content[data-state=closed]{animation:foundation-web-dialog-content-scale-out var(--time-300) var(--ease-standard-out)}}");
            var Cr = (0, e.createContext)({
                    size: "Medium",
                    isModal: !0,
                    hasCloseAffordance: !1,
                    hasMarginTop: !0,
                    hasMarginBottom: !0,
                    hasDescription: !1,
                    type: "Default"
                }),
                wr = function() {
                    var t = (0, e.useContext)(Cr);
                    if (!t) throw new Error("Dialog components must be used within a Dialog");
                    return t
                },
                Sr = {
                    Small: "padding-x-large",
                    Medium: "padding-x-xlarge",
                    Large: "padding-x-xlarge"
                },
                Er = {
                    Small: "padding-top-large",
                    Medium: "padding-top-xlarge",
                    Large: "padding-top-xlarge"
                },
                Pr = {
                    Small: "padding-bottom-large",
                    Medium: "padding-bottom-xlarge",
                    Large: "padding-bottom-xlarge"
                },
                Tr = function(n) {
                    var r = n.open,
                        o = n.onOpenChange,
                        a = n.children,
                        i = n.size,
                        l = n.type,
                        c = void 0 === l ? "Default" : l,
                        s = n.isModal,
                        u = n.hasCloseAffordance,
                        d = n.closeLabel,
                        f = n.hasMarginTop,
                        p = void 0 === f || f,
                        y = n.hasMarginBottom,
                        h = void 0 === y || y,
                        m = n.hasDescription,
                        v = void 0 !== m && m,
                        g = n.experimentalDisablePointerEventsStylingOnBody,
                        b = void 0 !== g && g,
                        C = (0, e.useMemo)((function() {
                            return {
                                size: i,
                                isModal: s,
                                type: c,
                                hasCloseAffordance: u,
                                closeLabel: d,
                                hasMarginTop: p,
                                hasMarginBottom: h,
                                hasDescription: v
                            }
                        }), [i, s, c, u, d, p, h, v]);
                    return (0, e.useEffect)((function() {
                        b && setTimeout((function() {
                            Object.assign(document.body.style, {
                                pointerEvents: "unset"
                            })
                        }), 0)
                    }), [b, r]), t().createElement(Cr.Provider, {
                        value: C
                    }, t().createElement(tr, {
                        open: r,
                        onOpenChange: o
                    }, a))
                };
            Tr.displayName = "Dialog";
            var xr = function(e) {
                var n = e.children,
                    r = e.className,
                    o = e.style,
                    a = e.overlayClassName,
                    i = e.overlayStyle,
                    l = e.onOpenAutoFocus,
                    c = R(e, ["children", "className", "style", "overlayClassName", "overlayStyle", "onOpenAutoFocus"]),
                    s = wr(),
                    u = s.size,
                    d = s.isModal,
                    f = s.hasCloseAffordance,
                    p = s.closeLabel,
                    y = s.hasDescription,
                    h = F("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", d && "bg-common-backdrop", a),
                    m = F("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", r);
                return t().createElement(nr, null, t().createElement(rr, {
                    className: h,
                    style: i
                }, t().createElement(or, Object.assign({
                    className: m,
                    "data-size": u,
                    style: o,
                    onOpenAutoFocus: l
                }, !y && {
                    "aria-describedby": void 0
                }, c), f && t().createElement("div", {
                    className: "absolute foundation-web-dialog-close-container"
                }, t().createElement(ir, {
                    asChild: !0
                }, t().createElement(br, {
                    variant: "OverMedia",
                    size: u,
                    isCircular: !0,
                    "aria-label": p
                }))), n)))
            };
            xr.displayName = "DialogContent";
            var Ar = function(e) {
                var n = e.children,
                    r = e.className,
                    o = R(e, ["children", "className"]),
                    a = wr(),
                    i = a.size,
                    l = a.hasMarginTop,
                    c = a.hasMarginBottom,
                    s = F(Sr[i], l && Er[i], c && Pr[i], r);
                return t().createElement("div", Object.assign({
                    className: s
                }, o), n)
            };
            Ar.displayName = "DialogBody";
            var Ir = function(e) {
                var n = e.children,
                    r = e.className,
                    o = e.hidden,
                    a = R(e, ["children", "className", "hidden"]),
                    i = t().createElement(ar, Object.assign({
                        className: r
                    }, a), n);
                return o ? t().createElement(mr, null, i) : i
            };
            Ir.displayName = "DialogTitle";
            Z("@keyframes progress-circle-rotate{0%{transform:rotate(0deg)}to{transform:rotate(1turn)}}.foundation-web-progress-circle-indeterminate{animation:progress-circle-rotate 1.4s linear infinite;transform-origin:50% 50%}");
            var kr = {
                    Small: {
                        dimension: 16,
                        strokeWidth: 2,
                        textClass: "text-caption-small"
                    },
                    Medium: {
                        dimension: 32,
                        strokeWidth: 3,
                        textClass: "text-caption-small",
                        valueContainerSize: 36
                    },
                    Large: {
                        dimension: 48,
                        strokeWidth: 4,
                        textClass: "text-caption-medium",
                        valueContainerSize: 52
                    }
                },
                Dr = t().forwardRef((function(e, n) {
                    var r = e.className,
                        o = e.size,
                        a = void 0 === o ? "Large" : o,
                        i = e.variant,
                        l = void 0 === i ? "Determinate" : i,
                        c = e.value,
                        s = void 0 === c ? 0 : c,
                        u = e.showValue,
                        d = void 0 !== u && u,
                        f = e.ariaLabel,
                        p = R(e, ["className", "size", "variant", "value", "showValue", "ariaLabel"]),
                        y = kr[a],
                        h = y.dimension,
                        m = y.strokeWidth,
                        v = y.textClass,
                        g = y.valueContainerSize,
                        b = (h - m) / 2,
                        C = 2 * Math.PI * b,
                        w = h / 2,
                        S = Math.min(100, Math.max(0, s)),
                        E = C * (1 - S / 100),
                        P = d && void 0 !== g ? g : h,
                        T = "Determinate" === l;
                    return t().createElement("div", Object.assign({
                        ref: n,
                        className: F("foundation-web-progress-circle inline-flex items-center justify-center", r),
                        role: "progressbar",
                        "aria-label": f,
                        "aria-valuemin": T ? 0 : void 0,
                        "aria-valuemax": T ? 100 : void 0,
                        "aria-valuenow": T ? S : void 0,
                        style: {
                            width: P,
                            height: P
                        }
                    }, p), t().createElement("svg", {
                        width: h,
                        height: h,
                        viewBox: "0 0 ".concat(h, " ").concat(h),
                        className: "relative"
                    }, t().createElement("circle", {
                        cx: w,
                        cy: w,
                        r: b,
                        fill: "none",
                        strokeWidth: m,
                        style: {
                            stroke: "var(--color-shift-200)"
                        }
                    }), t().createElement("circle", {
                        cx: w,
                        cy: w,
                        r: b,
                        fill: "none",
                        strokeWidth: m,
                        strokeDasharray: T ? C : "".concat(.75 * C, " ").concat(.25 * C),
                        strokeDashoffset: T ? E : 0,
                        strokeLinecap: "round",
                        className: F(!T && "foundation-web-progress-circle-indeterminate"),
                        style: T ? {
                            stroke: "var(--fui-future-alpha-color-system-progress)",
                            transform: "rotate(-90deg)",
                            transformOrigin: "50% 50%",
                            transition: "stroke-dashoffset 0.3s ease-out"
                        } : {
                            stroke: "var(--fui-future-alpha-color-system-progress)",
                            transformOrigin: "50% 50%"
                        }
                    })), T && d && "Large" === a && t().createElement("div", {
                        className: F("absolute content-emphasis flex items-center justify-center", v),
                        "aria-hidden": "true"
                    }, t().createElement("span", null, Math.round(S)), t().createElement("span", null, "%")))
                }));

            function Nr(e) {
                return function(e) {
                    if (Array.isArray(e)) return Lr(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && Symbol.iterator in Object(e)) return Array.from(e)
                }(e) || Ur(e) || function() {
                    throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function Or(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var n = [],
                        r = !0,
                        o = !1,
                        a = void 0;
                    try {
                        for (var i, l = e[Symbol.iterator](); !(r = (i = l.next()).done) && (n.push(i.value), !t || n.length !== t); r = !0);
                    } catch (e) {
                        o = !0, a = e
                    } finally {
                        try {
                            r || null == l.return || l.return()
                        } finally {
                            if (o) throw a
                        }
                    }
                    return n
                }(e, t) || Ur(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function Mr(e, t) {
                var n = Object.keys(e);
                if (Object.getOwnPropertySymbols) {
                    var r = Object.getOwnPropertySymbols(e);
                    t && (r = r.filter((function(t) {
                        return Object.getOwnPropertyDescriptor(e, t).enumerable
                    }))), n.push.apply(n, r)
                }
                return n
            }

            function Rr(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {};
                    t % 2 ? Mr(Object(n), !0).forEach((function(t) {
                        jr(e, t, n[t])
                    })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(n)) : Mr(Object(n)).forEach((function(t) {
                        Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(n, t))
                    }))
                }
                return e
            }

            function jr(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function Fr(e, t, n, r, o, a, i) {
                try {
                    var l = e[a](i),
                        c = l.value
                } catch (e) {
                    return void n(e)
                }
                l.done ? t(c) : Promise.resolve(c).then(r, o)
            }

            function Vr(e) {
                return Vr = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(e) {
                    return typeof e
                } : function(e) {
                    return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e
                }, Vr(e)
            }

            function Ur(e, t) {
                if (e) {
                    if ("string" == typeof e) return Lr(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    return "Object" === n && e.constructor && (n = e.constructor.name), "Map" === n || "Set" === n ? Array.from(e) : "Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n) ? Lr(e, t) : void 0
                }
            }

            function Lr(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = new Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function Wr(e) {
                return "string" == typeof e ? e : void 0
            }

            function Kr(e) {
                if (Array.isArray(e)) {
                    var t, n = [],
                        r = function(e, t) {
                            var n;
                            if ("undefined" == typeof Symbol || null == e[Symbol.iterator]) {
                                if (Array.isArray(e) || (n = Ur(e)) || t && e && "number" == typeof e.length) {
                                    n && (e = n);
                                    var r = 0,
                                        o = function() {};
                                    return {
                                        s: o,
                                        n: function() {
                                            return r >= e.length ? {
                                                done: !0
                                            } : {
                                                done: !1,
                                                value: e[r++]
                                            }
                                        },
                                        e: function(e) {
                                            throw e
                                        },
                                        f: o
                                    }
                                }
                                throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }
                            var a, i = !0,
                                l = !1;
                            return {
                                s: function() {
                                    n = e[Symbol.iterator]()
                                },
                                n: function() {
                                    var e = n.next();
                                    return i = e.done, e
                                },
                                e: function(e) {
                                    l = !0, a = e
                                },
                                f: function() {
                                    try {
                                        i || null == n.return || n.return()
                                    } finally {
                                        if (l) throw a
                                    }
                                }
                            }
                        }(e);
                    try {
                        for (r.s(); !(t = r.n()).done;) {
                            var o = t.value;
                            if ("object" === Vr(o) && null !== o && "label" in o && "outcome" in o) {
                                var a = Wr(o.label),
                                    i = Wr(o.outcome);
                                void 0 !== a && void 0 !== i && n.push({
                                    label: a,
                                    outcome: i
                                })
                            }
                        }
                    } catch (e) {
                        r.e(e)
                    } finally {
                        r.f()
                    }
                    return n.length > 0 ? n : void 0
                }
            }
            Dr.displayName = "ProgressCircle";
            var _r = {
                TextScreen: function(e) {
                    var t, n, r, o = e.props,
                        a = e.report,
                        i = null !== (t = Wr(o.title)) && void 0 !== t ? t : "",
                        l = null !== (n = Wr(o.description)) && void 0 !== n ? n : "",
                        c = Wr(o.imageUrl),
                        s = null !== (r = Kr(o.buttons)) && void 0 !== r ? r : [];
                    return (0, V.jsxs)("div", {
                        className: "gap-medium flex flex-col items-center",
                        children: [c ? (0, V.jsx)("img", {
                            src: c,
                            alt: "",
                            className: "max-w-full"
                        }) : null, (0, V.jsx)("h2", {
                            className: "text-heading-medium content-emphasis text-center",
                            children: i
                        }), (0, V.jsx)("p", {
                            className: "text-body-medium content-default text-center",
                            children: l
                        }), s.map((function(e, t) {
                            return (0, V.jsx)(le, {
                                variant: 0 === t ? "Emphasis" : "Standard",
                                size: "Medium",
                                className: "w-full",
                                onClick: function() {
                                    a(e.outcome)
                                },
                                children: e.label
                            }, e.outcome)
                        }))]
                    })
                }
            };

            function Br() {
                var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : _r;
                return Object.keys(e).sort()
            }

            function zr(e, t, n, r, o) {
                return {
                    target: e,
                    flow: t,
                    surface: n,
                    client: {
                        clientCapabilities: Br(r)
                    },
                    extraProps: o
                }
            }
            var qr = "".concat(r.EnvironmentUrls.apiGatewayUrl, "/amp-v2-wizard-service/v1"),
                Hr = "".concat(qr, "/entrypoint"),
                Gr = "".concat(qr, "/continue");

            function Yr(e, t) {
                return $r.apply(this, arguments)
            }

            function $r() {
                return $r = function(e) {
                    return function() {
                        var t = this,
                            n = arguments;
                        return new Promise((function(r, o) {
                            var a = e.apply(t, n);

                            function i(e) {
                                Fr(a, r, o, i, l, "next", e)
                            }

                            function l(e) {
                                Fr(a, r, o, i, l, "throw", e)
                            }
                            i(void 0)
                        }))
                    }
                }(regeneratorRuntime.mark((function e(t, n) {
                    var r;
                    return regeneratorRuntime.wrap((function(e) {
                        for (;;) switch (e.prev = e.next) {
                            case 0:
                                return e.next = 2, l.httpService.post({
                                    url: t,
                                    withCredentials: !0
                                }, n);
                            case 2:
                                return r = e.sent, e.abrupt("return", r.data);
                            case 4:
                            case "end":
                                return e.stop()
                        }
                    }), e)
                }))), $r.apply(this, arguments)
            }
            var Jr = {
                    entrypoint: function(e) {
                        return Yr(Hr, e)
                    },
                    continue: function(e) {
                        return Yr(Gr, e)
                    }
                },
                Qr = {
                    StartWizard: "AmpV2Wizard.StartWizard"
                };

            function Xr(e) {
                return new Promise((function(t) {
                    var n = Rr(Rr({}, e), {}, {
                        closeCallback: function(e) {
                            t(e)
                        }
                    });
                    window.dispatchEvent(new CustomEvent(Qr.StartWizard, {
                        detail: n
                    }))
                }))
            }
            var Zr = "Goto",
                eo = "Continue",
                to = "ReportOutcome",
                no = "FragmentLoaded",
                ro = "ContinueFailed";

            function oo(e, t, n) {
                return Rr(Rr({}, e), {}, {
                    history: t,
                    isLoading: !1,
                    exited: !0,
                    exitResult: {
                        reason: "Error",
                        flowId: e.flowId,
                        outcome: n
                    }
                })
            }

            function ao(e, t, n, r, o) {
                var a, i, l = "" !== e.entry,
                    c = l && null != e.nodes[e.entry];
                return l ? c || (i = {
                    reason: "Error",
                    flowId: n
                }) : i = {
                    reason: "Completed",
                    flowId: n
                }, {
                    flowId: n,
                    chosenFlow: r,
                    nodes: e.nodes,
                    currentNodeId: c ? e.entry : void 0,
                    history: t,
                    flowInputs: null !== (a = e.flowInputs) && void 0 !== a ? a : o,
                    isLoading: !1,
                    exited: !c,
                    exitResult: i
                }
            }

            function io(e) {
                return ao(e, [], e.flowId, e.chosenFlow)
            }

            function lo(e, t) {
                var n = e.currentNodeId;
                if (null == n) return e;
                var r = e.nodes[n],
                    o = r ? r.transitions[t.outcome] : void 0,
                    a = {
                        flow: e.chosenFlow,
                        node: n,
                        outcome: t.outcome,
                        data: t.data
                    },
                    i = function(e, t) {
                        return [].concat(Nr(e), [t])
                    }(e.history, a);
                if (null == o) return oo(e, i, t.outcome);
                switch (o.kind) {
                    case Zr:
                        var l = o.node;
                        return null == l || null == e.nodes[l] ? oo(e, i, t.outcome) : Rr(Rr({}, e), {}, {
                            currentNodeId: l,
                            history: i,
                            isLoading: !1,
                            exited: !1,
                            exitResult: void 0
                        });
                    case eo:
                        return Rr(Rr({}, e), {}, {
                            history: i,
                            isLoading: !0,
                            exited: !1,
                            exitResult: void 0
                        });
                    default:
                        return Rr(Rr({}, e), {}, {
                            history: i,
                            isLoading: !1,
                            exited: !0,
                            exitResult: {
                                reason: "Completed",
                                flowId: e.flowId,
                                outcome: t.outcome
                            }
                        })
                }
            }

            function co(e, t) {
                switch (t.type) {
                    case to:
                        return lo(e, t);
                    case no:
                        return function(e, t) {
                            var n = "" !== t.flowId ? t.flowId : e.flowId,
                                r = "" !== t.chosenFlow ? t.chosenFlow : e.chosenFlow;
                            return ao(t, e.history, n, r, e.flowInputs)
                        }(e, t.response);
                    case ro:
                        return Rr(Rr({}, e), {}, {
                            isLoading: !1,
                            exited: !0,
                            exitResult: {
                                reason: "Error",
                                flowId: e.flowId
                            }
                        });
                    default:
                        return e
                }
            }

            function so(e) {
                var t = e.children;
                return (0, V.jsx)(Tr, {
                    open: !0,
                    isModal: !0,
                    size: "Medium",
                    type: "Default",
                    hasCloseAffordance: !1,
                    children: (0, V.jsx)(xr, {
                        children: (0, V.jsx)(Ar, {
                            className: "gap-large flex flex-col",
                            children: t
                        })
                    })
                })
            }

            function uo(t) {
                var n, r, o = null !== (n = t.registry) && void 0 !== n ? n : _r,
                    a = null !== (r = t.config) && void 0 !== r ? r : {},
                    i = function(t) {
                        var n = t.api,
                            r = t.target,
                            o = t.rootFlow,
                            a = t.onExit,
                            i = t.onEvent,
                            l = Or((0, e.useReducer)(co, t.initialFragment, io), 2),
                            c = l[0],
                            s = l[1],
                            u = (0, e.useRef)(c);
                        u.current = c;
                        var d = (0, e.useRef)(!1),
                            f = (0, e.useRef)(!1);
                        (0, e.useEffect)((function() {
                            c.exited && !f.current && (f.current = !0, a && c.exitResult && a(c.exitResult))
                        }), [c.exited, c.exitResult, a]);
                        var p = (0, e.useCallback)((function(e, t) {
                            var a = u.current,
                                l = a.currentNodeId;
                            if (!(null == l || a.exited || a.isLoading || d.current)) {
                                var c = a.nodes[l],
                                    f = c ? c.transitions[e] : void 0;
                                if (i && i({
                                        flowId: a.flowId,
                                        node: l,
                                        outcome: e,
                                        transitionKind: f ? f.kind : void 0
                                    }), s({
                                        type: to,
                                        outcome: e,
                                        data: t
                                    }), null != f && f.kind === eo) {
                                    d.current = !0;
                                    var p = [].concat(Nr(a.history), [{
                                        flow: a.chosenFlow,
                                        node: l,
                                        outcome: e,
                                        data: t
                                    }]);
                                    n.continue({
                                        flowId: a.flowId,
                                        target: r,
                                        rootFlow: o,
                                        flowInputs: a.flowInputs,
                                        history: p,
                                        payload: t
                                    }).then((function(e) {
                                        d.current = !1, s({
                                            type: no,
                                            response: e
                                        })
                                    })).catch((function(e) {
                                        d.current = !1, s({
                                            type: ro,
                                            message: String(e)
                                        })
                                    }))
                                }
                            }
                        }), [n, r, o, i]);
                        return {
                            currentNode: c.currentNodeId ? c.nodes[c.currentNodeId] : void 0,
                            currentNodeId: c.currentNodeId,
                            isLoading: c.isLoading,
                            exited: c.exited,
                            report: p
                        }
                    }({
                        initialFragment: t.initialFragment,
                        target: t.target,
                        rootFlow: t.rootFlow,
                        api: t.api,
                        onExit: t.onExit,
                        onEvent: t.onEvent
                    }),
                    l = (0, e.useRef)(!1),
                    c = i.currentNode,
                    s = i.report,
                    u = i.exited,
                    d = i.isLoading,
                    f = c ? function(e, t) {
                        return e[t]
                    }(o, c.type) : void 0;
                if ((0, e.useEffect)((function() {
                        null == c || null != f || u || l.current || (l.current = !0, s("__unrenderable__"))
                    }), [c, f, u, s]), u) return null;
                if (null == c || null == f) return (0, V.jsx)(so, {
                    children: (0, V.jsx)(Dr, {
                        ariaLabel: "Loading",
                        variant: "Indeterminate",
                        size: "Medium"
                    })
                });
                var p = {
                    flowId: t.initialFragment.flowId,
                    surface: t.surface,
                    config: a
                };
                return (0, V.jsx)(so, {
                    children: (0, V.jsxs)("div", {
                        className: "relative",
                        children: [(0, V.jsx)("div", {
                            className: d ? "pointer-events-none opacity-50" : void 0,
                            children: (0, V.jsx)(f, {
                                props: c.details,
                                ctx: p,
                                report: s
                            })
                        }), d ? (0, V.jsx)("div", {
                            className: "absolute inset-0 flex items-center justify-center",
                            "data-testid": "amp-v2-wizard-loading-overlay",
                            children: (0, V.jsx)(Dr, {
                                ariaLabel: "Loading",
                                variant: "Indeterminate",
                                size: "Medium"
                            })
                        }) : null]
                    })
                })
            }

            function fo() {
                var t, n = Or((0, e.useState)(null), 2),
                    r = n[0],
                    o = n[1],
                    a = (0, e.useRef)(!1),
                    i = (0, e.useRef)(null);
                (0, e.useEffect)((function() {
                    var e = function(e) {
                        var t, n = e.detail;
                        a.current ? n.closeCallback({
                            reason: "Error",
                            flowId: ""
                        }) : (a.current = !0, (null !== (t = n.api) && void 0 !== t ? t : Jr).entrypoint(zr(n.target, n.flow, n.surface, n.registry, n.extraProps)).then((function(e) {
                            if ("" === e.entry) return a.current = !1, void n.closeCallback({
                                reason: "Completed",
                                flowId: e.flowId
                            });
                            i.current = n, o({
                                detail: n,
                                fragment: e
                            })
                        })).catch((function() {
                            a.current = !1, n.closeCallback({
                                reason: "Error",
                                flowId: ""
                            })
                        })))
                    };
                    return window.addEventListener(Qr.StartWizard, e),
                        function() {
                            window.removeEventListener(Qr.StartWizard, e)
                        }
                }), []);
                var l = (0, e.useCallback)((function(e) {
                    var t, n = i.current;
                    i.current = null, a.current = !1, o(null), null == n || n.closeCallback(e), null == n || null === (t = n.onComplete) || void 0 === t || t.call(n, e)
                }), []);
                if (null == r) return null;
                var c, s = r.detail,
                    u = r.fragment;
                return (0, V.jsx)(uo, {
                    initialFragment: u,
                    target: s.target,
                    rootFlow: (c = s.flow, null != c && "" !== c.name ? c.name : void 0),
                    surface: s.surface,
                    api: null !== (t = s.api) && void 0 !== t ? t : Jr,
                    config: s.config,
                    registry: s.registry,
                    onExit: l,
                    onEvent: s.onEvent
                })
            }
            var po = ReactStyleGuide;

            function yo(e) {
                for (var t = arguments.length, n = Array(t > 1 ? t - 1 : 0), r = 1; r < t; r++) n[r - 1] = arguments[r];
                throw Error("[Immer] minified error nr: " + e + (n.length ? " " + n.map((function(e) {
                    return "'" + e + "'"
                })).join(",") : "") + ". Find the full error at: https://bit.ly/3cXEKWf")
            }

            function ho(e) {
                return !!e && !!e[ra]
            }

            function mo(e) {
                var t;
                return !!e && (function(e) {
                    if (!e || "object" != typeof e) return !1;
                    var t = Object.getPrototypeOf(e);
                    if (null === t) return !0;
                    var n = Object.hasOwnProperty.call(t, "constructor") && t.constructor;
                    return n === Object || "function" == typeof n && Function.toString.call(n) === oa
                }(e) || Array.isArray(e) || !!e[na] || !!(null === (t = e.constructor) || void 0 === t ? void 0 : t[na]) || Eo(e) || Po(e))
            }

            function vo(e, t, n) {
                void 0 === n && (n = !1), 0 === go(e) ? (n ? Object.keys : aa)(e).forEach((function(r) {
                    n && "symbol" == typeof r || t(r, e[r], e)
                })) : e.forEach((function(n, r) {
                    return t(r, n, e)
                }))
            }

            function go(e) {
                var t = e[ra];
                return t ? t.i > 3 ? t.i - 4 : t.i : Array.isArray(e) ? 1 : Eo(e) ? 2 : Po(e) ? 3 : 0
            }

            function bo(e, t) {
                return 2 === go(e) ? e.has(t) : Object.prototype.hasOwnProperty.call(e, t)
            }

            function Co(e, t) {
                return 2 === go(e) ? e.get(t) : e[t]
            }

            function wo(e, t, n) {
                var r = go(e);
                2 === r ? e.set(t, n) : 3 === r ? e.add(n) : e[t] = n
            }

            function So(e, t) {
                return e === t ? 0 !== e || 1 / e == 1 / t : e != e && t != t
            }

            function Eo(e) {
                return Xo && e instanceof Map
            }

            function Po(e) {
                return Zo && e instanceof Set
            }

            function To(e) {
                return e.o || e.t
            }

            function xo(e) {
                if (Array.isArray(e)) return Array.prototype.slice.call(e);
                var t = ia(e);
                delete t[ra];
                for (var n = aa(t), r = 0; r < n.length; r++) {
                    var o = n[r],
                        a = t[o];
                    !1 === a.writable && (a.writable = !0, a.configurable = !0), (a.get || a.set) && (t[o] = {
                        configurable: !0,
                        writable: !0,
                        enumerable: a.enumerable,
                        value: e[o]
                    })
                }
                return Object.create(Object.getPrototypeOf(e), t)
            }

            function Ao(e, t) {
                return void 0 === t && (t = !1), ko(e) || ho(e) || !mo(e) || (go(e) > 1 && (e.set = e.add = e.clear = e.delete = Io), Object.freeze(e), t && vo(e, (function(e, t) {
                    return Ao(t, !0)
                }), !0)), e
            }

            function Io() {
                yo(2)
            }

            function ko(e) {
                return null == e || "object" != typeof e || Object.isFrozen(e)
            }

            function Do(e) {
                var t = la[e];
                return t || yo(18, e), t
            }

            function No(e, t) {
                la[e] || (la[e] = t)
            }

            function Oo() {
                return Jo
            }

            function Mo(e, t) {
                t && (Do("Patches"), e.u = [], e.s = [], e.v = t)
            }

            function Ro(e) {
                jo(e), e.p.forEach(Vo), e.p = null
            }

            function jo(e) {
                e === Jo && (Jo = e.l)
            }

            function Fo(e) {
                return Jo = {
                    p: [],
                    l: Jo,
                    h: e,
                    m: !0,
                    _: 0
                }
            }

            function Vo(e) {
                var t = e[ra];
                0 === t.i || 1 === t.i ? t.j() : t.g = !0
            }

            function Uo(e, t) {
                t._ = t.p.length;
                var n = t.p[0],
                    r = void 0 !== e && e !== n;
                return t.h.O || Do("ES5").S(t, e, r), r ? (n[ra].P && (Ro(t), yo(4)), mo(e) && (e = Lo(t, e), t.l || Ko(t, e)), t.u && Do("Patches").M(n[ra].t, e, t.u, t.s)) : e = Lo(t, n, []), Ro(t), t.u && t.v(t.u, t.s), e !== ta ? e : void 0
            }

            function Lo(e, t, n) {
                if (ko(t)) return t;
                var r = t[ra];
                if (!r) return vo(t, (function(o, a) {
                    return Wo(e, r, t, o, a, n)
                }), !0), t;
                if (r.A !== e) return t;
                if (!r.P) return Ko(e, r.t, !0), r.t;
                if (!r.I) {
                    r.I = !0, r.A._--;
                    var o = 4 === r.i || 5 === r.i ? r.o = xo(r.k) : r.o,
                        a = o,
                        i = !1;
                    3 === r.i && (a = new Set(o), o.clear(), i = !0), vo(a, (function(t, a) {
                        return Wo(e, r, o, t, a, n, i)
                    })), Ko(e, o, !1), n && e.u && Do("Patches").N(r, n, e.u, e.s)
                }
                return r.o
            }

            function Wo(e, t, n, r, o, a, i) {
                if (ho(o)) {
                    var l = Lo(e, o, a && t && 3 !== t.i && !bo(t.R, r) ? a.concat(r) : void 0);
                    if (wo(n, r, l), !ho(l)) return;
                    e.m = !1
                } else i && n.add(o);
                if (mo(o) && !ko(o)) {
                    if (!e.h.D && e._ < 1) return;
                    Lo(e, o), t && t.A.l || Ko(e, o)
                }
            }

            function Ko(e, t, n) {
                void 0 === n && (n = !1), !e.l && e.h.D && e.m && Ao(t, n)
            }

            function _o(e, t) {
                var n = e[ra];
                return (n ? To(n) : e)[t]
            }

            function Bo(e, t) {
                if (t in e)
                    for (var n = Object.getPrototypeOf(e); n;) {
                        var r = Object.getOwnPropertyDescriptor(n, t);
                        if (r) return r;
                        n = Object.getPrototypeOf(n)
                    }
            }

            function zo(e) {
                e.P || (e.P = !0, e.l && zo(e.l))
            }

            function qo(e) {
                e.o || (e.o = xo(e.t))
            }

            function Ho(e, t, n) {
                var r = Eo(t) ? Do("MapSet").F(t, n) : Po(t) ? Do("MapSet").T(t, n) : e.O ? function(e, t) {
                    var n = Array.isArray(e),
                        r = {
                            i: n ? 1 : 0,
                            A: t ? t.A : Oo(),
                            P: !1,
                            I: !1,
                            R: {},
                            l: t,
                            t: e,
                            k: null,
                            o: null,
                            j: null,
                            C: !1
                        },
                        o = r,
                        a = ca;
                    n && (o = [r], a = sa);
                    var i = Proxy.revocable(o, a),
                        l = i.revoke,
                        c = i.proxy;
                    return r.k = c, r.j = l, c
                }(t, n) : Do("ES5").J(t, n);
                return (n ? n.A : Oo()).p.push(r), r
            }

            function Go(e, t) {
                switch (t) {
                    case 2:
                        return new Map(e);
                    case 3:
                        return Array.from(e)
                }
                return xo(e)
            }

            function Yo() {
                function e(e, t) {
                    var n = o[e];
                    return n ? n.enumerable = t : o[e] = n = {
                        configurable: !0,
                        enumerable: t,
                        get: function() {
                            var t = this[ra];
                            return ca.get(t, e)
                        },
                        set: function(t) {
                            var n = this[ra];
                            ca.set(n, e, t)
                        }
                    }, n
                }

                function t(e) {
                    for (var t = e.length - 1; t >= 0; t--) {
                        var o = e[t][ra];
                        if (!o.P) switch (o.i) {
                            case 5:
                                r(o) && zo(o);
                                break;
                            case 4:
                                n(o) && zo(o)
                        }
                    }
                }

                function n(e) {
                    for (var t = e.t, n = e.k, r = aa(n), o = r.length - 1; o >= 0; o--) {
                        var a = r[o];
                        if (a !== ra) {
                            var i = t[a];
                            if (void 0 === i && !bo(t, a)) return !0;
                            var l = n[a],
                                c = l && l[ra];
                            if (c ? c.t !== i : !So(l, i)) return !0
                        }
                    }
                    var s = !!t[ra];
                    return r.length !== aa(t).length + (s ? 0 : 1)
                }

                function r(e) {
                    var t = e.k;
                    if (t.length !== e.t.length) return !0;
                    var n = Object.getOwnPropertyDescriptor(t, t.length - 1);
                    if (n && !n.get) return !0;
                    for (var r = 0; r < t.length; r++)
                        if (!t.hasOwnProperty(r)) return !0;
                    return !1
                }
                var o = {};
                No("ES5", {
                    J: function(t, n) {
                        var r = Array.isArray(t),
                            o = function(t, n) {
                                if (t) {
                                    for (var r = Array(n.length), o = 0; o < n.length; o++) Object.defineProperty(r, "" + o, e(o, !0));
                                    return r
                                }
                                var a = ia(n);
                                delete a[ra];
                                for (var i = aa(a), l = 0; l < i.length; l++) {
                                    var c = i[l];
                                    a[c] = e(c, t || !!a[c].enumerable)
                                }
                                return Object.create(Object.getPrototypeOf(n), a)
                            }(r, t),
                            a = {
                                i: r ? 5 : 4,
                                A: n ? n.A : Oo(),
                                P: !1,
                                I: !1,
                                R: {},
                                l: n,
                                t: t,
                                k: o,
                                o: null,
                                g: !1,
                                C: !1
                            };
                        return Object.defineProperty(o, ra, {
                            value: a,
                            writable: !0
                        }), o
                    },
                    S: function(e, n, o) {
                        o ? ho(n) && n[ra].A === e && t(e.p) : (e.u && function e(t) {
                            if (t && "object" == typeof t) {
                                var n = t[ra];
                                if (n) {
                                    var o = n.t,
                                        a = n.k,
                                        i = n.R,
                                        l = n.i;
                                    if (4 === l) vo(a, (function(t) {
                                        t !== ra && (void 0 !== o[t] || bo(o, t) ? i[t] || e(a[t]) : (i[t] = !0, zo(n)))
                                    })), vo(o, (function(e) {
                                        void 0 !== a[e] || bo(a, e) || (i[e] = !1, zo(n))
                                    }));
                                    else if (5 === l) {
                                        if (r(n) && (zo(n), i.length = !0), a.length < o.length)
                                            for (var c = a.length; c < o.length; c++) i[c] = !1;
                                        else
                                            for (var s = o.length; s < a.length; s++) i[s] = !0;
                                        for (var u = Math.min(a.length, o.length), d = 0; d < u; d++) a.hasOwnProperty(d) || (i[d] = !0), void 0 === i[d] && e(a[d])
                                    }
                                }
                            }
                        }(e.p[0]), t(e.p))
                    },
                    K: function(e) {
                        return 4 === e.i ? n(e) : r(e)
                    }
                })
            }
            var $o, Jo, Qo = "undefined" != typeof Symbol && "symbol" == typeof Symbol("x"),
                Xo = "undefined" != typeof Map,
                Zo = "undefined" != typeof Set,
                ea = "undefined" != typeof Proxy && void 0 !== Proxy.revocable && "undefined" != typeof Reflect,
                ta = Qo ? Symbol.for("immer-nothing") : (($o = {})["immer-nothing"] = !0, $o),
                na = Qo ? Symbol.for("immer-draftable") : "__$immer_draftable",
                ra = Qo ? Symbol.for("immer-state") : "__$immer_state",
                oa = ("undefined" != typeof Symbol && Symbol.iterator, "" + Object.prototype.constructor),
                aa = "undefined" != typeof Reflect && Reflect.ownKeys ? Reflect.ownKeys : void 0 !== Object.getOwnPropertySymbols ? function(e) {
                    return Object.getOwnPropertyNames(e).concat(Object.getOwnPropertySymbols(e))
                } : Object.getOwnPropertyNames,
                ia = Object.getOwnPropertyDescriptors || function(e) {
                    var t = {};
                    return aa(e).forEach((function(n) {
                        t[n] = Object.getOwnPropertyDescriptor(e, n)
                    })), t
                },
                la = {},
                ca = {
                    get: function(e, t) {
                        if (t === ra) return e;
                        var n = To(e);
                        if (!bo(n, t)) return function(e, t, n) {
                            var r, o = Bo(t, n);
                            return o ? "value" in o ? o.value : null === (r = o.get) || void 0 === r ? void 0 : r.call(e.k) : void 0
                        }(e, n, t);
                        var r = n[t];
                        return e.I || !mo(r) ? r : r === _o(e.t, t) ? (qo(e), e.o[t] = Ho(e.A.h, r, e)) : r
                    },
                    has: function(e, t) {
                        return t in To(e)
                    },
                    ownKeys: function(e) {
                        return Reflect.ownKeys(To(e))
                    },
                    set: function(e, t, n) {
                        var r = Bo(To(e), t);
                        if (null == r ? void 0 : r.set) return r.set.call(e.k, n), !0;
                        if (!e.P) {
                            var o = _o(To(e), t),
                                a = null == o ? void 0 : o[ra];
                            if (a && a.t === n) return e.o[t] = n, e.R[t] = !1, !0;
                            if (So(n, o) && (void 0 !== n || bo(e.t, t))) return !0;
                            qo(e), zo(e)
                        }
                        return e.o[t] === n && (void 0 !== n || t in e.o) || Number.isNaN(n) && Number.isNaN(e.o[t]) || (e.o[t] = n, e.R[t] = !0), !0
                    },
                    deleteProperty: function(e, t) {
                        return void 0 !== _o(e.t, t) || t in e.t ? (e.R[t] = !1, qo(e), zo(e)) : delete e.R[t], e.o && delete e.o[t], !0
                    },
                    getOwnPropertyDescriptor: function(e, t) {
                        var n = To(e),
                            r = Reflect.getOwnPropertyDescriptor(n, t);
                        return r ? {
                            writable: !0,
                            configurable: 1 !== e.i || "length" !== t,
                            enumerable: r.enumerable,
                            value: n[t]
                        } : r
                    },
                    defineProperty: function() {
                        yo(11)
                    },
                    getPrototypeOf: function(e) {
                        return Object.getPrototypeOf(e.t)
                    },
                    setPrototypeOf: function() {
                        yo(12)
                    }
                },
                sa = {};
            vo(ca, (function(e, t) {
                sa[e] = function() {
                    return arguments[0] = arguments[0][0], t.apply(this, arguments)
                }
            })), sa.deleteProperty = function(e, t) {
                return sa.set.call(this, e, t, void 0)
            }, sa.set = function(e, t, n) {
                return ca.set.call(this, e[0], t, n, e[0])
            };
            var ua = function() {
                    function e(e) {
                        var t = this;
                        this.O = ea, this.D = !0, this.produce = function(e, n, r) {
                            if ("function" == typeof e && "function" != typeof n) {
                                var o = n;
                                n = e;
                                var a = t;
                                return function(e) {
                                    var t = this;
                                    void 0 === e && (e = o);
                                    for (var r = arguments.length, i = Array(r > 1 ? r - 1 : 0), l = 1; l < r; l++) i[l - 1] = arguments[l];
                                    return a.produce(e, (function(e) {
                                        var r;
                                        return (r = n).call.apply(r, [t, e].concat(i))
                                    }))
                                }
                            }
                            var i;
                            if ("function" != typeof n && yo(6), void 0 !== r && "function" != typeof r && yo(7), mo(e)) {
                                var l = Fo(t),
                                    c = Ho(t, e, void 0),
                                    s = !0;
                                try {
                                    i = n(c), s = !1
                                } finally {
                                    s ? Ro(l) : jo(l)
                                }
                                return "undefined" != typeof Promise && i instanceof Promise ? i.then((function(e) {
                                    return Mo(l, r), Uo(e, l)
                                }), (function(e) {
                                    throw Ro(l), e
                                })) : (Mo(l, r), Uo(i, l))
                            }
                            if (!e || "object" != typeof e) {
                                if (void 0 === (i = n(e)) && (i = e), i === ta && (i = void 0), t.D && Ao(i, !0), r) {
                                    var u = [],
                                        d = [];
                                    Do("Patches").M(e, i, u, d), r(u, d)
                                }
                                return i
                            }
                            yo(21, e)
                        }, this.produceWithPatches = function(e, n) {
                            if ("function" == typeof e) return function(n) {
                                for (var r = arguments.length, o = Array(r > 1 ? r - 1 : 0), a = 1; a < r; a++) o[a - 1] = arguments[a];
                                return t.produceWithPatches(n, (function(t) {
                                    return e.apply(void 0, [t].concat(o))
                                }))
                            };
                            var r, o, a = t.produce(e, n, (function(e, t) {
                                r = e, o = t
                            }));
                            return "undefined" != typeof Promise && a instanceof Promise ? a.then((function(e) {
                                return [e, r, o]
                            })) : [a, r, o]
                        }, "boolean" == typeof(null == e ? void 0 : e.useProxies) && this.setUseProxies(e.useProxies), "boolean" == typeof(null == e ? void 0 : e.autoFreeze) && this.setAutoFreeze(e.autoFreeze)
                    }
                    var t = e.prototype;
                    return t.createDraft = function(e) {
                        mo(e) || yo(8), ho(e) && (e = function(e) {
                            return ho(e) || yo(22, e),
                                function e(t) {
                                    if (!mo(t)) return t;
                                    var n, r = t[ra],
                                        o = go(t);
                                    if (r) {
                                        if (!r.P && (r.i < 4 || !Do("ES5").K(r))) return r.t;
                                        r.I = !0, n = Go(t, o), r.I = !1
                                    } else n = Go(t, o);
                                    return vo(n, (function(t, o) {
                                        r && Co(r.t, t) === o || wo(n, t, e(o))
                                    })), 3 === o ? new Set(n) : n
                                }(e)
                        }(e));
                        var t = Fo(this),
                            n = Ho(this, e, void 0);
                        return n[ra].C = !0, jo(t), n
                    }, t.finishDraft = function(e, t) {
                        var n = (e && e[ra]).A;
                        return Mo(n, t), Uo(void 0, n)
                    }, t.setAutoFreeze = function(e) {
                        this.D = e
                    }, t.setUseProxies = function(e) {
                        e && !ea && yo(20), this.O = e
                    }, t.applyPatches = function(e, t) {
                        var n;
                        for (n = t.length - 1; n >= 0; n--) {
                            var r = t[n];
                            if (0 === r.path.length && "replace" === r.op) {
                                e = r.value;
                                break
                            }
                        }
                        n > -1 && (t = t.slice(n + 1));
                        var o = Do("Patches").$;
                        return ho(e) ? o(e, t) : this.produce(e, (function(e) {
                            return o(e, t)
                        }))
                    }, e
                }(),
                da = new ua,
                fa = da.produce,
                pa = (da.produceWithPatches.bind(da), da.setAutoFreeze.bind(da), da.setUseProxies.bind(da), da.applyPatches.bind(da), da.createDraft.bind(da), da.finishDraft.bind(da), fa),
                ya = Redux,
                ha = ReduxThunk,
                ma = n.n(ha);

            function va(e) {
                return va = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(e) {
                    return typeof e
                } : function(e) {
                    return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e
                }, va(e)
            }
            var ga, ba = (ga = function(e, t) {
                    return ga = Object.setPrototypeOf || {
                        __proto__: []
                    }
                    instanceof Array && function(e, t) {
                        e.__proto__ = t
                    } || function(e, t) {
                        for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
                    }, ga(e, t)
                }, function(e, t) {
                    if ("function" != typeof t && null !== t) throw new TypeError("Class extends value " + String(t) + " is not a constructor or null");

                    function n() {
                        this.constructor = e
                    }
                    ga(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
                }),
                Ca = function(e, t) {
                    var n, r, o, a, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    };
                    return a = {
                        next: l(0),
                        throw: l(1),
                        return: l(2)
                    }, "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                        return this
                    }), a;

                    function l(a) {
                        return function(l) {
                            return function(a) {
                                if (n) throw new TypeError("Generator is already executing.");
                                for (; i;) try {
                                    if (n = 1, r && (o = 2 & a[0] ? r.return : a[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, a[1])).done) return o;
                                    switch (r = 0, o && (a = [2 & a[0], o.value]), a[0]) {
                                        case 0:
                                        case 1:
                                            o = a;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: a[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, r = a[1], a = [0];
                                            continue;
                                        case 7:
                                            a = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = i.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== a[0] && 2 !== a[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === a[0] && (!o || a[1] > o[0] && a[1] < o[3])) {
                                                i.label = a[1];
                                                break
                                            }
                                            if (6 === a[0] && i.label < o[1]) {
                                                i.label = o[1], o = a;
                                                break
                                            }
                                            if (o && i.label < o[2]) {
                                                i.label = o[2], i.ops.push(a);
                                                break
                                            }
                                            o[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    a = t.call(e, i)
                                } catch (e) {
                                    a = [6, e], r = 0
                                } finally {
                                    n = o = 0
                                }
                                if (5 & a[0]) throw a[1];
                                return {
                                    value: a[0] ? a[1] : void 0,
                                    done: !0
                                }
                            }([a, l])
                        }
                    }
                },
                wa = function(e, t) {
                    for (var n = 0, r = t.length, o = e.length; n < r; n++, o++) e[o] = t[n];
                    return e
                },
                Sa = Object.defineProperty,
                Ea = Object.defineProperties,
                Pa = Object.getOwnPropertyDescriptors,
                Ta = Object.getOwnPropertySymbols,
                xa = Object.prototype.hasOwnProperty,
                Aa = Object.prototype.propertyIsEnumerable,
                Ia = function(e, t, n) {
                    return t in e ? Sa(e, t, {
                        enumerable: !0,
                        configurable: !0,
                        writable: !0,
                        value: n
                    }) : e[t] = n
                },
                ka = function(e, t) {
                    for (var n in t || (t = {})) xa.call(t, n) && Ia(e, n, t[n]);
                    if (Ta)
                        for (var r = 0, o = Ta(t); r < o.length; r++) {
                            n = o[r];
                            Aa.call(t, n) && Ia(e, n, t[n])
                        }
                    return e
                },
                Da = function(e, t) {
                    return Ea(e, Pa(t))
                },
                Na = function(e, t, n) {
                    return new Promise((function(r, o) {
                        var a = function(e) {
                                try {
                                    l(n.next(e))
                                } catch (e) {
                                    o(e)
                                }
                            },
                            i = function(e) {
                                try {
                                    l(n.throw(e))
                                } catch (e) {
                                    o(e)
                                }
                            },
                            l = function(e) {
                                return e.done ? r(e.value) : Promise.resolve(e.value).then(a, i)
                            };
                        l((n = n.apply(e, t)).next())
                    }))
                },
                Oa = "undefined" != typeof window && window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ ? window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ : function() {
                    if (0 !== arguments.length) return "object" === va(arguments[0]) ? ya.compose : ya.compose.apply(null, arguments)
                };
            "undefined" != typeof window && window.__REDUX_DEVTOOLS_EXTENSION__ && window.__REDUX_DEVTOOLS_EXTENSION__;

            function Ma(e) {
                if ("object" !== va(e) || null === e) return !1;
                var t = Object.getPrototypeOf(e);
                if (null === t) return !0;
                for (var n = t; null !== Object.getPrototypeOf(n);) n = Object.getPrototypeOf(n);
                return t === n
            }
            var Ra = function(e) {
                    function t() {
                        for (var n = [], r = 0; r < arguments.length; r++) n[r] = arguments[r];
                        var o = e.apply(this, n) || this;
                        return Object.setPrototypeOf(o, t.prototype), o
                    }
                    return ba(t, e), Object.defineProperty(t, Symbol.species, {
                        get: function() {
                            return t
                        },
                        enumerable: !1,
                        configurable: !0
                    }), t.prototype.concat = function() {
                        for (var t = [], n = 0; n < arguments.length; n++) t[n] = arguments[n];
                        return e.prototype.concat.apply(this, t)
                    }, t.prototype.prepend = function() {
                        for (var e = [], n = 0; n < arguments.length; n++) e[n] = arguments[n];
                        return 1 === e.length && Array.isArray(e[0]) ? new(t.bind.apply(t, wa([void 0], e[0].concat(this)))) : new(t.bind.apply(t, wa([void 0], e.concat(this))))
                    }, t
                }(Array),
                ja = function(e) {
                    function t() {
                        for (var n = [], r = 0; r < arguments.length; r++) n[r] = arguments[r];
                        var o = e.apply(this, n) || this;
                        return Object.setPrototypeOf(o, t.prototype), o
                    }
                    return ba(t, e), Object.defineProperty(t, Symbol.species, {
                        get: function() {
                            return t
                        },
                        enumerable: !1,
                        configurable: !0
                    }), t.prototype.concat = function() {
                        for (var t = [], n = 0; n < arguments.length; n++) t[n] = arguments[n];
                        return e.prototype.concat.apply(this, t)
                    }, t.prototype.prepend = function() {
                        for (var e = [], n = 0; n < arguments.length; n++) e[n] = arguments[n];
                        return 1 === e.length && Array.isArray(e[0]) ? new(t.bind.apply(t, wa([void 0], e[0].concat(this)))) : new(t.bind.apply(t, wa([void 0], e.concat(this))))
                    }, t
                }(Array);

            function Fa(e) {
                return mo(e) ? pa(e, (function() {})) : e
            }

            function Va() {
                return function(e) {
                    return function(e) {
                        void 0 === e && (e = {});
                        var t = e.thunk,
                            n = void 0 === t || t,
                            r = (e.immutableCheck, e.serializableCheck, new Ra);
                        n && (! function(e) {
                            return "boolean" == typeof e
                        }(n) ? r.push(ma().withExtraArgument(n.extraArgument)) : r.push(ma()));
                        0;
                        return r
                    }(e)
                }
            }

            function Ua(e, t) {
                function n() {
                    for (var n = [], r = 0; r < arguments.length; r++) n[r] = arguments[r];
                    if (t) {
                        var o = t.apply(void 0, n);
                        if (!o) throw new Error("prepareAction did not return an object");
                        return ka(ka({
                            type: e,
                            payload: o.payload
                        }, "meta" in o && {
                            meta: o.meta
                        }), "error" in o && {
                            error: o.error
                        })
                    }
                    return {
                        type: e,
                        payload: n[0]
                    }
                }
                return n.toString = function() {
                    return "" + e
                }, n.type = e, n.match = function(t) {
                    return t.type === e
                }, n
            }

            function La(e) {
                var t, n = {},
                    r = [],
                    o = {
                        addCase: function(e, t) {
                            var r = "string" == typeof e ? e : e.type;
                            if (r in n) throw new Error("addCase cannot be called with two reducers for the same action type");
                            return n[r] = t, o
                        },
                        addMatcher: function(e, t) {
                            return r.push({
                                matcher: e,
                                reducer: t
                            }), o
                        },
                        addDefaultCase: function(e) {
                            return t = e, o
                        }
                    };
                return e(o), [n, r, t]
            }

            function Wa(e) {
                var t = e.name;
                if (!t) throw new Error("`name` is a required option for createSlice");
                var n, r = "function" == typeof e.initialState ? e.initialState : Fa(e.initialState),
                    o = e.reducers || {},
                    a = Object.keys(o),
                    i = {},
                    l = {},
                    c = {};

                function s() {
                    var t = "function" == typeof e.extraReducers ? La(e.extraReducers) : [e.extraReducers],
                        n = t[0],
                        o = void 0 === n ? {} : n,
                        a = t[1],
                        i = void 0 === a ? [] : a,
                        c = t[2],
                        s = void 0 === c ? void 0 : c,
                        u = ka(ka({}, o), l);
                    return function(e, t, n, r) {
                        void 0 === n && (n = []);
                        var o, a = "function" == typeof t ? La(t) : [t, n, r],
                            i = a[0],
                            l = a[1],
                            c = a[2];
                        if (function(e) {
                                return "function" == typeof e
                            }(e)) o = function() {
                            return Fa(e())
                        };
                        else {
                            var s = Fa(e);
                            o = function() {
                                return s
                            }
                        }

                        function u(e, t) {
                            void 0 === e && (e = o());
                            var n = wa([i[t.type]], l.filter((function(e) {
                                return (0, e.matcher)(t)
                            })).map((function(e) {
                                return e.reducer
                            })));
                            return 0 === n.filter((function(e) {
                                return !!e
                            })).length && (n = [c]), n.reduce((function(e, n) {
                                if (n) {
                                    var r;
                                    if (ho(e)) return void 0 === (r = n(e, t)) ? e : r;
                                    if (mo(e)) return pa(e, (function(e) {
                                        return n(e, t)
                                    }));
                                    if (void 0 === (r = n(e, t))) {
                                        if (null === e) return e;
                                        throw Error("A case reducer on a non-draftable value must not return undefined")
                                    }
                                    return r
                                }
                                return e
                            }), e)
                        }
                        return u.getInitialState = o, u
                    }(r, (function(e) {
                        for (var t in u) e.addCase(t, u[t]);
                        for (var n = 0, r = i; n < r.length; n++) {
                            var o = r[n];
                            e.addMatcher(o.matcher, o.reducer)
                        }
                        s && e.addDefaultCase(s)
                    }))
                }
                return a.forEach((function(e) {
                    var n, r, a = o[e],
                        s = t + "/" + e;
                    "reducer" in a ? (n = a.reducer, r = a.prepare) : n = a, i[e] = n, l[s] = n, c[e] = r ? Ua(s, r) : Ua(s)
                })), {
                    name: t,
                    reducer: function(e, t) {
                        return n || (n = s()), n(e, t)
                    },
                    actions: c,
                    caseReducers: i,
                    getInitialState: function() {
                        return n || (n = s()), n.getInitialState()
                    }
                }
            }
            var Ka = function(e) {
                    void 0 === e && (e = 21);
                    for (var t = "", n = e; n--;) t += "ModuleSymbhasOwnPr-0123456789ABCDEFGHNRVfgctiUvz_KqYTJkLxpZXIjQW" [64 * Math.random() | 0];
                    return t
                },
                _a = ["name", "message", "stack", "code"],
                Ba = function(e, t) {
                    this.payload = e, this.meta = t
                },
                za = function(e, t) {
                    this.payload = e, this.meta = t
                },
                qa = function(e) {
                    if ("object" === va(e) && null !== e) {
                        for (var t = {}, n = 0, r = _a; n < r.length; n++) {
                            var o = r[n];
                            "string" == typeof e[o] && (t[o] = e[o])
                        }
                        return t
                    }
                    return {
                        message: String(e)
                    }
                },
                Ha = function() {
                    function e(e, t, n) {
                        var r = Ua(e + "/fulfilled", (function(e, t, n, r) {
                                return {
                                    payload: e,
                                    meta: Da(ka({}, r || {}), {
                                        arg: n,
                                        requestId: t,
                                        requestStatus: "fulfilled"
                                    })
                                }
                            })),
                            o = Ua(e + "/pending", (function(e, t, n) {
                                return {
                                    payload: void 0,
                                    meta: Da(ka({}, n || {}), {
                                        arg: t,
                                        requestId: e,
                                        requestStatus: "pending"
                                    })
                                }
                            })),
                            a = Ua(e + "/rejected", (function(e, t, r, o, a) {
                                return {
                                    payload: o,
                                    error: (n && n.serializeError || qa)(e || "Rejected"),
                                    meta: Da(ka({}, a || {}), {
                                        arg: r,
                                        requestId: t,
                                        rejectedWithValue: !!o,
                                        requestStatus: "rejected",
                                        aborted: "AbortError" === (null == e ? void 0 : e.name),
                                        condition: "ConditionError" === (null == e ? void 0 : e.name)
                                    })
                                }
                            })),
                            i = "undefined" != typeof AbortController ? AbortController : function() {
                                function e() {
                                    this.signal = {
                                        aborted: !1,
                                        addEventListener: function() {},
                                        dispatchEvent: function() {
                                            return !1
                                        },
                                        onabort: function() {},
                                        removeEventListener: function() {},
                                        reason: void 0,
                                        throwIfAborted: function() {}
                                    }
                                }
                                return e.prototype.abort = function() {
                                    0
                                }, e
                            }();
                        return Object.assign((function(e) {
                            return function(l, c, s) {
                                var u, d = (null == n ? void 0 : n.idGenerator) ? n.idGenerator(e) : Ka(),
                                    f = new i;

                                function p(e) {
                                    u = e, f.abort()
                                }
                                var y = function() {
                                    return Na(this, null, (function() {
                                        var i, y, h, m, v, g;
                                        return Ca(this, (function(b) {
                                            switch (b.label) {
                                                case 0:
                                                    return b.trys.push([0, 4, , 5]), m = null == (i = null == n ? void 0 : n.condition) ? void 0 : i.call(n, e, {
                                                        getState: c,
                                                        extra: s
                                                    }), null === (C = m) || "object" !== va(C) || "function" != typeof C.then ? [3, 2] : [4, m];
                                                case 1:
                                                    m = b.sent(), b.label = 2;
                                                case 2:
                                                    if (!1 === m || f.signal.aborted) throw {
                                                        name: "ConditionError",
                                                        message: "Aborted due to condition callback returning false."
                                                    };
                                                    return v = new Promise((function(e, t) {
                                                        return f.signal.addEventListener("abort", (function() {
                                                            return t({
                                                                name: "AbortError",
                                                                message: u || "Aborted"
                                                            })
                                                        }))
                                                    })), l(o(d, e, null == (y = null == n ? void 0 : n.getPendingMeta) ? void 0 : y.call(n, {
                                                        requestId: d,
                                                        arg: e
                                                    }, {
                                                        getState: c,
                                                        extra: s
                                                    }))), [4, Promise.race([v, Promise.resolve(t(e, {
                                                        dispatch: l,
                                                        getState: c,
                                                        extra: s,
                                                        requestId: d,
                                                        signal: f.signal,
                                                        abort: p,
                                                        rejectWithValue: function(e, t) {
                                                            return new Ba(e, t)
                                                        },
                                                        fulfillWithValue: function(e, t) {
                                                            return new za(e, t)
                                                        }
                                                    })).then((function(t) {
                                                        if (t instanceof Ba) throw t;
                                                        return t instanceof za ? r(t.payload, d, e, t.meta) : r(t, d, e)
                                                    }))])];
                                                case 3:
                                                    return h = b.sent(), [3, 5];
                                                case 4:
                                                    return g = b.sent(), h = g instanceof Ba ? a(null, d, e, g.payload, g.meta) : a(g, d, e), [3, 5];
                                                case 5:
                                                    return n && !n.dispatchConditionRejection && a.match(h) && h.meta.condition || l(h), [2, h]
                                            }
                                            var C
                                        }))
                                    }))
                                }();
                                return Object.assign(y, {
                                    abort: p,
                                    requestId: d,
                                    arg: e,
                                    unwrap: function() {
                                        return y.then(Ga)
                                    }
                                })
                            }
                        }), {
                            pending: o,
                            rejected: a,
                            fulfilled: r,
                            typePrefix: e
                        })
                    }
                    return e.withTypes = function() {
                        return e
                    }, e
                }();

            function Ga(e) {
                if (e.meta && e.meta.rejectedWithValue) throw e.payload;
                if (e.error) throw e.error;
                return e.payload
            }
            Object.assign;
            var Ya = "listenerMiddleware";
            Ua(Ya + "/add"), Ua(Ya + "/removeAll"), Ua(Ya + "/remove");
            "function" == typeof queueMicrotask && queueMicrotask.bind("undefined" != typeof window ? window : void 0 !== n.g ? n.g : globalThis);
            var $a, Ja, Qa = function(e) {
                return function(t) {
                    setTimeout(t, e)
                }
            };
            "undefined" != typeof window && window.requestAnimationFrame ? window.requestAnimationFrame : Qa(10);
            Yo(),
                function(e) {
                    e.Granted = "Granted", e.Denied = "Denied", e.Actionable = "Actionable"
                }(Ja || (Ja = {}));
            var Xa, Za = Ja;
            ! function(e) {
                e.VerificationStarted = "VERIFICATION_STARTED", e.verificationInProgress = "VERIFICATION_IN_PROGRESS", e.VerificationPending = "VERIFICATION_PENDING", e.VerificationFailed = "VERIFICATION_FAILED", e.VerificationSucceded = "VERIFICATION_SUCCEEDED", e.AMPCheckFailed = "AMP_CHECK_FAILED", e.EmailUpdateFailed = "EMAIL_UPDATE_FAILED"
            }(Xa || (Xa = {}));
            var ei, ti = Xa;
            ! function(e) {
                e.GovernmentId = "GovernmentId", e.Phone = "PHONE", e.Email = "EMAIL", e.AddedEmail = "AddedEmail", e.ParentConsentRequest = "ParentConsent", e.ParentLinkRequest = "ParentLink", e.AgeEstimation = "AgeEstimation", e.UserSettings = "UserSettings"
            }(ei || (ei = {}));
            var ni, ri = ei;
            ! function(e) {
                e.IdvAppeal = "IdvAppeal"
            }(ni || (ni = {}));
            var oi, ai = ni;
            ! function(e) {
                e.Appeals = "appeals"
            }(oi || (oi = {}));
            var ii, li = oi;
            ! function(e) {
                e.Embedded = "EMBEDDED", e.Hosted = "HOSTED"
            }(ii || (ii = {}));
            var ci, si, ui, di, fi, pi = ii;
            ! function(e) {
                e.Prologue = "PROLOGUE", e.Verification = "VERIFICATION", e.Epilogue = "EPILOGUE"
            }(ci || (ci = {})),
            function(e) {
                e[e.VendorLink = 0] = "VendorLink", e[e.Checklist = 1] = "Checklist", e[e.Complete = 2] = "Complete"
            }(si || (si = {})),
            function(e) {
                e[e.Unknown = 0] = "Unknown", e[e.Success = 1] = "Success", e[e.Failure = 2] = "Failure", e[e.RequiresManualReview = 3] = "RequiresManualReview", e[e.RequiresRetry = 4] = "RequiresRetry", e[e.Started = 5] = "Started", e[e.Submitted = 6] = "Submitted", e[e.Stored = 7] = "Stored", e[e.Expired = 8] = "Expired"
            }(ui || (ui = {})),
            function(e) {
                e[e.NoError = 0] = "NoError", e[e.UnknownError = 1] = "UnknownError", e[e.InvalidDocument = 2] = "InvalidDocument", e[e.InvalidSelfie = 3] = "InvalidSelfie", e[e.BelowMinimumAge = 4] = "BelowMinimumAge", e[e.LowQualityMedia = 5] = "LowQualityMedia", e[e.DocumentUnsupported = 6] = "DocumentUnsupported"
            }(di || (di = {})),
            function(e) {
                e[e.LANDING = 0] = "LANDING", e[e.EMAIL = 1] = "EMAIL", e[e.MODAL = 2] = "MODAL", e[e.SUCCESS_GENERIC = 3] = "SUCCESS_GENERIC", e[e.FAILURE = 4] = "FAILURE", e[e.PENDING = 5] = "PENDING", e[e.POLLING = 6] = "POLLING", e[e.EMAIL_CONTINUE = 7] = "EMAIL_CONTINUE", e[e.EXTERNAL_EMAIL = 8] = "EXTERNAL_EMAIL", e[e.ERROR = 9] = "ERROR", e[e.TEMP_BAN = 10] = "TEMP_BAN", e[e.VENDOR_LINK = 11] = "VENDOR_LINK"
            }(fi || (fi = {}));
            var yi, hi, mi, vi = CoreRobloxUtilities,
                gi = function(e, t, n) {
                    vi.eventStreamService.sendEventWithTarget(e, t, n)
                },
                bi = r.EnvironmentUrls.apiGatewayUrl,
                Ci = function(e, t, n, r) {
                    void 0 === t && (t = null), void 0 === n && (n = null), void 0 === r && (r = null);
                    var o = function(e, t, n, r) {
                        return void 0 === t && (t = null), void 0 === n && (n = null), void 0 === r && (r = null), {
                            retryable: !0,
                            withCredentials: !0,
                            url: bi + "/access-management/v1/upsell-feature-access?featureName=" + e + (t ? "&extraParameters=" + t : "") + (n ? "&successfulActions=" + n : "") + (r ? "&namespace=" + encodeURIComponent(r) : "")
                        }
                    }(e, t ? btoa(JSON.stringify(t)) : null, n, r);
                    return new Promise((function(e) {
                        l.httpService.get(o).then((function(t) {
                            var n = t.data;
                            e(n)
                        }), (function(e) {
                            throw e
                        }))
                    }))
                },
                wi = function() {
                    return wi = Object.assign || function(e) {
                        for (var t, n = 1, r = arguments.length; n < r; n++)
                            for (var o in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
                        return e
                    }, wi.apply(this, arguments)
                },
                Si = function(e, t, n, r) {
                    return new(n || (n = Promise))((function(o, a) {
                        function i(e) {
                            try {
                                c(r.next(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function l(e) {
                            try {
                                c(r.throw(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function c(e) {
                            var t;
                            e.done ? o(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                                e(t)
                            }))).then(i, l)
                        }
                        c((r = r.apply(e, t || [])).next())
                    }))
                },
                Ei = function(e, t) {
                    var n, r, o, a, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    };
                    return a = {
                        next: l(0),
                        throw: l(1),
                        return: l(2)
                    }, "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                        return this
                    }), a;

                    function l(a) {
                        return function(l) {
                            return function(a) {
                                if (n) throw new TypeError("Generator is already executing.");
                                for (; i;) try {
                                    if (n = 1, r && (o = 2 & a[0] ? r.return : a[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, a[1])).done) return o;
                                    switch (r = 0, o && (a = [2 & a[0], o.value]), a[0]) {
                                        case 0:
                                        case 1:
                                            o = a;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: a[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, r = a[1], a = [0];
                                            continue;
                                        case 7:
                                            a = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = i.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== a[0] && 2 !== a[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === a[0] && (!o || a[1] > o[0] && a[1] < o[3])) {
                                                i.label = a[1];
                                                break
                                            }
                                            if (6 === a[0] && i.label < o[1]) {
                                                i.label = o[1], o = a;
                                                break
                                            }
                                            if (o && i.label < o[2]) {
                                                i.label = o[2], i.ops.push(a);
                                                break
                                            }
                                            o[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    a = t.call(e, i)
                                } catch (e) {
                                    a = [6, e], r = 0
                                } finally {
                                    n = o = 0
                                }
                                if (5 & a[0]) throw a[1];
                                return {
                                    value: a[0] ? a[1] : void 0,
                                    done: !0
                                }
                            }([a, l])
                        }
                    }
                },
                Pi = {
                    featureName: null,
                    ampFeatureCheckData: void 0,
                    stage: null,
                    verificationStageRecourse: null,
                    featureAccess: {
                        loading: !1,
                        data: null,
                        error: null
                    },
                    showUpsell: !1,
                    redirectLink: null,
                    loading: !1,
                    prologueUsed: !1,
                    namespace: null
                },
                Ti = Ha("accessManagement/fetchFeatureAccess", (function(e, t) {
                    return Si(void 0, void 0, void 0, (function() {
                        var n, r, o, a, i;
                        return Ei(this, (function(l) {
                            switch (l.label) {
                                case 0:
                                    return l.trys.push([0, 2, , 3]), n = e.featureName, r = e.ampFeatureCheckData, o = e.successfulAction, a = e.namespace, [4, Ci(n, r, o, a)];
                                case 1:
                                    return [2, l.sent()];
                                case 2:
                                    return i = l.sent(), gi(ti.AMPCheckFailed, null, {
                                        error: JSON.stringify(i)
                                    }), [2, t.rejectWithValue("Failed to fetch AMP response")];
                                case 3:
                                    return [2]
                            }
                        }))
                    }))
                })),
                xi = Wa({
                    name: "accessManagement",
                    initialState: Pi,
                    reducers: {
                        resetAccessManagementStore: function() {
                            return Pi
                        },
                        setFeatureName: function(e, t) {
                            e.featureName = t.payload
                        },
                        setAmpFeatureCheckData: function(e, t) {
                            e.ampFeatureCheckData = t.payload
                        },
                        showUpsell: function(e, t) {
                            e.showUpsell = t.payload
                        },
                        setFeatureAccess: function(e, t) {
                            e.featureAccess = t.payload
                        },
                        setRedirectLink: function(e, t) {
                            e.redirectLink = t.payload
                        },
                        setStage: function(e, t) {
                            e.stage = t.payload
                        },
                        setVerificationStageRecourse: function(e, t) {
                            e.verificationStageRecourse = t.payload
                        },
                        setPrologueUsed: function(e, t) {
                            e.prologueUsed = t.payload
                        },
                        setLoading: function(e, t) {
                            e.loading = t.payload
                        },
                        setNamespace: function(e, t) {
                            e.namespace = t.payload
                        }
                    },
                    extraReducers: function(e) {
                        e.addCase(Ti.pending, (function(e) {
                            e.featureAccess.loading = !0
                        })).addCase(Ti.fulfilled, (function(e, t) {
                            var n = t.payload;
                            e.featureAccess = wi(wi({}, e.featureAccess), {
                                loading: !1,
                                data: n
                            }), e.featureName = n.featureName, n.access !== Za.Granted && (e.showUpsell = !0), n.access === Za.Actionable && (e.verificationStageRecourse = n.recourses[0])
                        })).addCase(Ti.rejected, (function(e, t) {
                            e.featureAccess = wi(wi({}, e.featureAccess), {
                                loading: !1,
                                error: t.error.message || "Something went wrong"
                            })
                        }))
                    }
                }),
                Ai = (yi = xi.actions).resetAccessManagementStore,
                Ii = (yi.setFeatureAccess, yi.setFeatureName, yi.setAmpFeatureCheckData),
                ki = yi.setRedirectLink,
                Di = yi.setVerificationStageRecourse,
                Ni = (yi.showUpsell, yi.setStage),
                Oi = yi.setPrologueUsed,
                Mi = yi.setNamespace,
                Ri = function(e) {
                    return e.accessManagement
                },
                ji = function(e) {
                    return e.accessManagement.showUpsell
                },
                Fi = function(e) {
                    return e.accessManagement.featureName
                },
                Vi = function(e) {
                    return e.accessManagement.ampFeatureCheckData
                },
                Ui = function(e) {
                    return e.accessManagement.featureAccess
                },
                Li = function(e) {
                    return e.accessManagement.stage
                },
                Wi = function(e) {
                    return e.accessManagement.verificationStageRecourse
                },
                Ki = function(e) {
                    return e.accessManagement.prologueUsed
                },
                _i = function(e) {
                    return e.accessManagement.namespace
                },
                Bi = xi.reducer,
                zi = function() {
                    return zi = Object.assign || function(e) {
                        for (var t, n = 1, r = arguments.length; n < r; n++)
                            for (var o in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
                        return e
                    }, zi.apply(this, arguments)
                },
                qi = function(e, t) {
                    for (var n = 0, r = t.length, o = e.length; n < r; n++, o++) e[o] = t[n];
                    return e
                },
                Hi = [{
                    label: "Label.ConnectingToMobile",
                    statusCode: [ui.Unknown]
                }, {
                    label: "Label.VerifyingYou",
                    statusCode: [ui.Started]
                }, {
                    label: "Label.VerificationWaitingForResults",
                    statusCode: [ui.Submitted]
                }, {
                    label: "Label.UpdatingRoblox",
                    statusCode: [ui.Success, ui.Stored]
                }],
                Gi = function(e, t) {
                    void 0 === t && (t = []);
                    var n = {
                        heading: "Heading.VerificationSuccessful",
                        icon: "success-icon",
                        bodyText: ["Label.DateOfBirthUpdated"],
                        buttonText: "Action.Close",
                        footerText: null
                    };
                    switch (e) {
                        case fi.SUCCESS_GENERIC:
                            break;
                        case fi.FAILURE:
                            n = zi(zi({}, n), {
                                heading: "Heading.VerificationFailed",
                                icon: "failure-icon",
                                bodyText: ["Label.FailedVerification"],
                                buttonText: "Action.Close"
                            });
                            break;
                        case fi.PENDING:
                            n = zi(zi({}, n), {
                                heading: "Heading.VerificationPending",
                                icon: "failure-icon",
                                bodyText: ["Label.PendingVerification"],
                                buttonText: "Action.Close"
                            });
                            break;
                        case fi.ERROR:
                            n = zi(zi({}, n), {
                                heading: "Heading.Error",
                                icon: "failure-icon",
                                bodyText: ["Modal.Failed.Text"]
                            });
                            break;
                        case fi.TEMP_BAN:
                            n = zi(zi({}, n), {
                                heading: "Heading.Error",
                                icon: "failure-icon",
                                bodyText: ["Label.VerificationDeclined"]
                            });
                        case fi.LANDING:
                        case fi.EMAIL:
                        case fi.MODAL:
                        case fi.POLLING:
                        case fi.EMAIL_CONTINUE:
                        case fi.EXTERNAL_EMAIL:
                        case fi.VENDOR_LINK:
                    }
                    return n.bodyText = qi(qi([], n.bodyText), t), n
                },
                Yi = "Heading.CheckAgeOnMobileApp",
                $i = "Action.RestartSession",
                Ji = "Label.PleaseDoNotClose",
                Qi = "Label.VerificationDataSubmitted",
                Xi = "Label.VerifyInBrowser",
                Zi = "Label.AgeCheckBenefit",
                el = "Label.ScanQRCodeToAgeCheck",
                tl = "Label.NotScanning",
                nl = "Label.DownloadAppFallback",
                rl = r.EnvironmentUrls.apiGatewayUrl,
                ol = function() {
                    return ol = Object.assign || function(e) {
                        for (var t, n = 1, r = arguments.length; n < r; n++)
                            for (var o in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
                        return e
                    }, ol.apply(this, arguments)
                },
                al = function(e, t, n) {
                    var r = {
                            retryable: !0,
                            withCredentials: !0,
                            url: rl + "/age-verification-service/v1/persona-id-verification/start-verification"
                        },
                        o = ol({
                            generateLink: !0,
                            ageEstimation: e,
                            parentVerification: t
                        }, n && {
                            template: n
                        });
                    return l.httpService.post(r, o).then((function(e) {
                        return e.data
                    })).catch((function(e) {
                        var t = l.httpService.parseErrorCode(e);
                        throw new Error("Error to start ID verification: " + (t || "unknown"))
                    }))
                },
                il = function(e) {
                    var t = {
                            retryable: !0,
                            withCredentials: !0,
                            url: rl + "/age-verification-service/v1/persona-id-verification/verified-status"
                        },
                        n = {
                            token: e
                        };
                    return l.httpService.get(t, n).then((function(e) {
                        return e.data
                    })).catch((function(e) {
                        var t = l.httpService.parseErrorCode(e);
                        throw new Error("Error to get ID verification status: " + (t || "unknown"))
                    }))
                },
                ll = function() {
                    return ll = Object.assign || function(e) {
                        for (var t, n = 1, r = arguments.length; n < r; n++)
                            for (var o in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
                        return e
                    }, ll.apply(this, arguments)
                },
                cl = function(e, t, n, r) {
                    return new(n || (n = Promise))((function(o, a) {
                        function i(e) {
                            try {
                                c(r.next(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function l(e) {
                            try {
                                c(r.throw(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function c(e) {
                            var t;
                            e.done ? o(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                                e(t)
                            }))).then(i, l)
                        }
                        c((r = r.apply(e, t || [])).next())
                    }))
                },
                sl = function(e, t) {
                    var n, r, o, a, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    };
                    return a = {
                        next: l(0),
                        throw: l(1),
                        return: l(2)
                    }, "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                        return this
                    }), a;

                    function l(a) {
                        return function(l) {
                            return function(a) {
                                if (n) throw new TypeError("Generator is already executing.");
                                for (; i;) try {
                                    if (n = 1, r && (o = 2 & a[0] ? r.return : a[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, a[1])).done) return o;
                                    switch (r = 0, o && (a = [2 & a[0], o.value]), a[0]) {
                                        case 0:
                                        case 1:
                                            o = a;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: a[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, r = a[1], a = [0];
                                            continue;
                                        case 7:
                                            a = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = i.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== a[0] && 2 !== a[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === a[0] && (!o || a[1] > o[0] && a[1] < o[3])) {
                                                i.label = a[1];
                                                break
                                            }
                                            if (6 === a[0] && i.label < o[1]) {
                                                i.label = o[1], o = a;
                                                break
                                            }
                                            if (o && i.label < o[2]) {
                                                i.label = o[2], i.ops.push(a);
                                                break
                                            }
                                            o[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    a = t.call(e, i)
                                } catch (e) {
                                    a = [6, e], r = 0
                                } finally {
                                    n = o = 0
                                }
                                if (5 & a[0]) throw a[1];
                                return {
                                    value: a[0] ? a[1] : void 0,
                                    done: !0
                                }
                            }([a, l])
                        }
                    }
                },
                ul = {
                    verified: null,
                    IDVerificationState: {
                        page: si.VendorLink,
                        vendorVerificationData: {
                            daysUntilNextVerification: 0,
                            sessionIdentifier: null,
                            sessionToken: null,
                            verificationLink: null,
                            qrCode: null,
                            loading: !1
                        },
                        loading: null,
                        status: null,
                        completionPageState: null,
                        error: null,
                        isAgeEstimation: !1
                    },
                    loading: null
                },
                dl = function(e) {
                    return e.verification.IDVerificationState
                },
                fl = function(e) {
                    return e.verification.loading
                },
                pl = Ha("verification/startIDVerification", (function(e, t) {
                    var n = e.ageEstimation,
                        r = e.parentVerification,
                        o = void 0 !== r && r,
                        a = e.template;
                    return cl(void 0, void 0, void 0, (function() {
                        var e, r;
                        return sl(this, (function(i) {
                            switch (i.label) {
                                case 0:
                                    return i.trys.push([0, 2, , 3]), [4, al(n, o, a)];
                                case 1:
                                    return [2, i.sent()];
                                case 2:
                                    return e = i.sent(), r = n ? ri.AgeEstimation : ri.GovernmentId, gi(ti.VerificationFailed, r, {
                                        error: JSON.stringify(e)
                                    }), [2, t.rejectWithValue("Failed to start ID Verification")];
                                case 3:
                                    return [2]
                            }
                        }))
                    }))
                })),
                yl = Ha("verification/fetchIDVerificationStatus", (function(e, t) {
                    return cl(void 0, void 0, void 0, (function() {
                        var n, r, o, a;
                        return sl(this, (function(i) {
                            switch (i.label) {
                                case 0:
                                    return i.trys.push([0, 2, , 3]), [4, il(e)];
                                case 1:
                                    return [2, i.sent()];
                                case 2:
                                    return n = i.sent(), r = t.getState(), o = r.verification.IDVerificationState.isAgeEstimation, a = o ? ri.AgeEstimation : ri.GovernmentId, gi(ti.VerificationFailed, a, {
                                        error: JSON.stringify(n)
                                    }), [2, t.rejectWithValue("Failed to fetch ID Verification status")];
                                case 3:
                                    return [2]
                            }
                        }))
                    }))
                })),
                hl = Wa({
                    name: "verification",
                    initialState: ul,
                    reducers: {
                        resetVerificationStore: function() {
                            return ul
                        },
                        setVerified: function(e, t) {
                            e.verified = t.payload
                        },
                        setIDVerificationState: function(e, t) {
                            e.IDVerificationState = ll({}, t.payload)
                        },
                        setIDVPage: function(e, t) {
                            e.IDVerificationState.page = t.payload
                        },
                        setLoading: function(e, t) {
                            e.loading = t.payload
                        }
                    },
                    extraReducers: function(e) {
                        e.addCase(pl.pending, (function(e, t) {
                            var n = e.IDVerificationState.vendorVerificationData;
                            n.loading = !0, e.IDVerificationState = ll(ll({}, e.IDVerificationState), {
                                vendorVerificationData: n,
                                loading: !0
                            }), e.loading = !0
                        })).addCase(pl.fulfilled, (function(e, t) {
                            var n = t.payload,
                                r = n.daysUntilNextVerification,
                                o = t.meta.arg.ageEstimation,
                                a = null,
                                i = e.IDVerificationState.page,
                                l = null != r && r > 0;
                            n.loading = !1, l && (a = Gi(fi.TEMP_BAN), i = si.Complete, e.loading = !1), e.IDVerificationState = ll(ll({}, e.IDVerificationState), {
                                vendorVerificationData: n,
                                completionPageState: a,
                                page: i,
                                loading: !1,
                                isAgeEstimation: o
                            })
                        })).addCase(pl.rejected, (function(e, t) {
                            var n = e.IDVerificationState.vendorVerificationData;
                            n.loading = !1, e.IDVerificationState = ll(ll({}, e.IDVerificationState), {
                                vendorVerificationData: n,
                                completionPageState: Gi(fi.ERROR),
                                loading: !1,
                                error: t.error.message || "Something went wrong"
                            }), e.loading = !1
                        })).addCase(yl.pending, (function(e) {
                            e.IDVerificationState = ll(ll({}, e.IDVerificationState), {
                                loading: !0
                            })
                        })).addCase(yl.fulfilled, (function(e, t) {
                            if (e.IDVerificationState.isAgeEstimation) {
                                var n = t.payload;
                                e.IDVerificationState = ll(ll({}, e.IDVerificationState), {
                                    loading: !1,
                                    status: n
                                })
                            } else {
                                n = t.payload;
                                var r = void 0,
                                    o = e.IDVerificationState.page;
                                switch (n.sessionStatus) {
                                    case ui.RequiresRetry:
                                    case ui.Failure:
                                        switch (o = si.Complete, n.sessionErrorCode) {
                                            case di.InvalidDocument:
                                            case di.BelowMinimumAge:
                                                r = Gi(fi.FAILURE, ["Label.FailedVerificationInvalidDocument"]);
                                                break;
                                            case di.LowQualityMedia:
                                            case di.InvalidSelfie:
                                                r = Gi(fi.FAILURE, ["Label.FailedVerificationLowQuality"]);
                                                break;
                                            case di.DocumentUnsupported:
                                                r = Gi(fi.FAILURE, ["Label.FailedVerificationUnsupportedDocument"]);
                                                break;
                                            default:
                                                r = Gi(fi.FAILURE)
                                        }
                                        break;
                                    case ui.RequiresManualReview:
                                        o = si.Complete, r = Gi(fi.PENDING);
                                        break;
                                    case ui.Success:
                                    case ui.Stored:
                                        o = si.Complete, r = Gi(fi.SUCCESS_GENERIC);
                                        break;
                                    case ui.Started:
                                        o = si.Checklist, gi(ti.VerificationStarted, ri.GovernmentId, {
                                            session: e.IDVerificationState.vendorVerificationData.sessionIdentifier
                                        });
                                        break;
                                    case ui.Submitted:
                                        gi(ti.verificationInProgress, ri.GovernmentId, {
                                            session: e.IDVerificationState.vendorVerificationData.sessionIdentifier
                                        })
                                }
                                e.IDVerificationState = ll(ll({}, e.IDVerificationState), {
                                    loading: !1,
                                    status: n,
                                    completionPageState: r,
                                    page: o
                                })
                            }
                        })).addCase(yl.rejected, (function(e, t) {
                            e.IDVerificationState = ll(ll({}, e.IDVerificationState), {
                                loading: !1,
                                error: t.error.message || "Something went wrong"
                            })
                        }))
                    }
                }),
                ml = (hi = hl.actions).resetVerificationStore,
                vl = (hi.setVerified, hi.setIDVerificationState, hi.setIDVPage, hi.setLoading),
                gl = hl.reducer,
                bl = (r.EnvironmentUrls.apiGatewayUrl, r.EnvironmentUrls.accountSettingsApi),
                Cl = (r.EnvironmentUrls.voiceApi, function() {
                    return {
                        retryable: !0,
                        withCredentials: !0,
                        url: bl + "/v1/email"
                    }
                }),
                wl = function(e, t, n, r) {
                    return new(n || (n = Promise))((function(o, a) {
                        function i(e) {
                            try {
                                c(r.next(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function l(e) {
                            try {
                                c(r.throw(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function c(e) {
                            var t;
                            e.done ? o(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                                e(t)
                            }))).then(i, l)
                        }
                        c((r = r.apply(e, t || [])).next())
                    }))
                },
                Sl = function(e, t) {
                    var n, r, o, a, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    };
                    return a = {
                        next: l(0),
                        throw: l(1),
                        return: l(2)
                    }, "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                        return this
                    }), a;

                    function l(a) {
                        return function(l) {
                            return function(a) {
                                if (n) throw new TypeError("Generator is already executing.");
                                for (; i;) try {
                                    if (n = 1, r && (o = 2 & a[0] ? r.return : a[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, a[1])).done) return o;
                                    switch (r = 0, o && (a = [2 & a[0], o.value]), a[0]) {
                                        case 0:
                                        case 1:
                                            o = a;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: a[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, r = a[1], a = [0];
                                            continue;
                                        case 7:
                                            a = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = i.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== a[0] && 2 !== a[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === a[0] && (!o || a[1] > o[0] && a[1] < o[3])) {
                                                i.label = a[1];
                                                break
                                            }
                                            if (6 === a[0] && i.label < o[1]) {
                                                i.label = o[1], o = a;
                                                break
                                            }
                                            if (o && i.label < o[2]) {
                                                i.label = o[2], i.ops.push(a);
                                                break
                                            }
                                            o[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    a = t.call(e, i)
                                } catch (e) {
                                    a = [6, e], r = 0
                                } finally {
                                    n = o = 0
                                }
                                if (5 & a[0]) throw a[1];
                                return {
                                    value: a[0] ? a[1] : void 0,
                                    done: !0
                                }
                            }([a, l])
                        }
                    }
                },
                El = {
                    emailAddress: null,
                    isEmailVerified: !1,
                    isEmailAdded: !1,
                    loading: !1,
                    error: !1
                },
                Pl = Ha("emailVerification/updateUserEmail", (function(e, t) {
                    return wl(void 0, void 0, void 0, (function() {
                        var n;
                        return Sl(this, (function(r) {
                            switch (r.label) {
                                case 0:
                                    return r.trys.push([0, 2, , 3]), [4, (o = {
                                        emailAddress: e
                                    }, a = Cl(), l.httpService.post(a, o).then((function() {
                                        return !0
                                    })).catch((function(e) {
                                        throw new Error("Error to update email address: " + JSON.stringify(e))
                                    })))];
                                case 1:
                                    return [2, r.sent()];
                                case 2:
                                    return n = r.sent(), gi(ti.EmailUpdateFailed, ri.AddedEmail, {
                                        error: JSON.stringify(n)
                                    }), [2, t.rejectWithValue("Failed to update email address")];
                                case 3:
                                    return [2]
                            }
                            var o, a
                        }))
                    }))
                })),
                Tl = Ha("emailVerification/getUserEmailStatus", (function(e, t) {
                    return wl(void 0, void 0, void 0, (function() {
                        var e;
                        return Sl(this, (function(n) {
                            switch (n.label) {
                                case 0:
                                    return n.trys.push([0, 2, , 3]), [4, (r = Cl(), l.httpService.get(r).then((function(e) {
                                        return e.data
                                    })).catch((function(e) {
                                        throw new Error("Error to get email address: " + JSON.stringify(e))
                                    })))];
                                case 1:
                                    return [2, n.sent()];
                                case 2:
                                    return e = n.sent(), gi(ti.EmailUpdateFailed, ri.AddedEmail, {
                                        error: JSON.stringify(e)
                                    }), [2, t.rejectWithValue("Failed to fetch email address")];
                                case 3:
                                    return [2]
                            }
                            var r
                        }))
                    }))
                })),
                xl = Wa({
                    name: "emailVerification",
                    initialState: El,
                    reducers: {
                        resetEmailVerificationStore: function() {
                            return El
                        },
                        setUserEmailData: function(e, t) {
                            e.emailAddress = t.payload
                        }
                    },
                    extraReducers: function(e) {
                        e.addCase(Pl.pending, (function(e) {
                            e.loading = !0
                        })).addCase(Pl.fulfilled, (function(e, t) {
                            e.isEmailAdded = !0, e.loading = !1
                        })).addCase(Pl.rejected, (function(e, t) {
                            e.loading = !1, e.error = !0
                        })).addCase(Tl.pending, (function(e) {
                            e.loading = !0
                        })).addCase(Tl.fulfilled, (function(e, t) {
                            var n = t.payload;
                            e.emailAddress = n.emailAddress, e.isEmailVerified = n.isEmailVerified, e.loading = !1
                        })).addCase(Tl.rejected, (function(e) {
                            e.loading = !1
                        }))
                    }
                }),
                Al = (mi = xl.actions).resetEmailVerificationStore,
                Il = (mi.setUserEmailData, function(e) {
                    return e.emailVerification
                }),
                kl = function(e) {
                    var t, n = Va(),
                        r = e || {},
                        o = r.reducer,
                        a = void 0 === o ? void 0 : o,
                        i = r.middleware,
                        l = void 0 === i ? n() : i,
                        c = r.devTools,
                        s = void 0 === c || c,
                        u = r.preloadedState,
                        d = void 0 === u ? void 0 : u,
                        f = r.enhancers,
                        p = void 0 === f ? void 0 : f;
                    if ("function" == typeof a) t = a;
                    else {
                        if (!Ma(a)) throw new Error('"reducer" is a required argument, and must be a function or an object of functions that can be passed to combineReducers');
                        t = (0, ya.combineReducers)(a)
                    }
                    var y = l;
                    "function" == typeof y && (y = y(n));
                    var h = ya.applyMiddleware.apply(void 0, y),
                        m = ya.compose;
                    s && (m = Oa(ka({
                        trace: !1
                    }, "object" === va(s) && s)));
                    var v = new ja(h),
                        g = v;
                    Array.isArray(p) ? g = wa([h], p) : "function" == typeof p && (g = p(v));
                    var b = m.apply(void 0, g);
                    return (0, ya.createStore)(t, d, b)
                }({
                    reducer: {
                        accessManagement: Bi,
                        verification: gl,
                        emailVerification: xl.reducer
                    }
                }),
                Dl = function() {
                    return O()
                },
                Nl = "StartAccessManagementUpsell",
                Ol = "ShowDownloadAppModal",
                Ml = {
                    Continue: "Action.Continue",
                    Cancel: "Action.Cancel",
                    EmailMyParent: "Action.EmailMyParent",
                    VerifyID: "Action.VerifyID",
                    AskNow: "Action.AskNowLowercase"
                },
                Rl = {
                    AskYourParent: "Title.AskYourParent",
                    VerifyYourAge: "Title.VerifyYourAge",
                    CheckYourAge: "Title.CheckYourAge"
                },
                jl = {
                    AddFriendVpc: "Label.AddFriendVPC",
                    Vpc: "Description.PrologueTextVpc",
                    Idv: "Description.PrologueTextIdv",
                    Fae: "Description.PrologueTextFae",
                    IdvConnectingText: "Description.PrologueConnectingTextIdv",
                    IdvAndVpc: "Description.PrologueTextIdvAndVpc",
                    IdvAndVpcAgeCorrection: "Description.PrologueIdvAndVpcAgeCorrection",
                    VpcEnablePurchase: "Description.PrologueEnablePurchase",
                    VpcEnablePurchaseExpT1: "Description.PrologueEnablePurchaseExpT1",
                    VpcUnblockUser: "Description.PrologueUnblockUser",
                    VpcUnblockExperience: "Description.PrologueUnblockExperience",
                    VpcAllowFacialAgeEstimation: "Description.CommsAgeCheck.VPCForFAEModal",
                    VpcContentAgeRestriction: "Description.PrologueJoinExperience",
                    VpcWhisperChatWithMeInExperiences: "Description.CommsAgeCheck.VPCForExperienceDirectChatModal",
                    VpcExperienceChat: "Description.CommsAgeCheck.VPCForExperienceChatModal",
                    VpcStudioCollaboration: "Description.CommsAgeCheck.VPCForStudioCollaborationModal",
                    FaeExperienceChat: "Description.CommsAgeCheck.FaeForExperienceChatModal",
                    FaeExperienceWhisperChat: "Description.CommsAgeCheck.FaeForExperienceWhisperChatModal",
                    FaeStudioCollaboration: "Description.CommsAgeCheck.FaeForStudioCollaborationModal",
                    PrologueFetchParentExperiment: "Description.PrologueFetchParentExperiment"
                },
                Fl = {
                    LearnMore: "Action.LearnMore"
                },
                Vl = {
                    VerifyYourAge: "Title.VerifyYourAge"
                },
                Ul = {
                    VpcNotEligible: "Description.PrologueTextVpcNotEligible"
                },
                Ll = vi.eventStreamService.eventTypes,
                Wl = "ageVerification",
                Kl = {
                    emailRegex: "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$",
                    translationKeys: {
                        addEmailToAccountKeys: {
                            btnText: "Action.Continue",
                            ActionChangeEmail: "Action.ChangeEmail",
                            ActionSent: "Action.Sent",
                            ActionContinue: "Action.Continue",
                            ActionGenericSkip: "Action.GenericSkip",
                            DescriptionAddEmailTextOver13: "Description.IDVerificationAddEmailText",
                            DescriptionAddEmailTextUnder13: "Description.IDVerificationAddEmailText",
                            HeadingAddEmail: "Heading.AddEmail",
                            LabelEmailInputPlaceholderOver13: "Label.EmailInputPlaceholderOver13",
                            LabelEmailInputPlaceholderUnder13: "Label.EmailInputPlaceholderUnder13",
                            MessageInvalidEmailAddress: "Message.InvalidEmailAddress"
                        }
                    },
                    events: {
                        showAddEmailModal: {
                            name: "showAddEmailModal",
                            type: Ll.modalAction,
                            context: Wl,
                            params: {
                                aType: "shown",
                                field: "addEmail"
                            }
                        },
                        useAddEmailField: {
                            name: "useAddEmailField",
                            type: Ll.formInteraction,
                            context: Wl,
                            params: {
                                btn: "emailAddress",
                                field: "addEmail"
                            }
                        },
                        addEmailConfirm: {
                            name: "addEmailConfirm",
                            type: Ll.buttonClick,
                            context: Wl,
                            params: {
                                btn: "continue",
                                field: "addEmail"
                            }
                        }
                    }
                },
                _l = function() {
                    return _l = Object.assign || function(e) {
                        for (var t, n = 1, r = arguments.length; n < r; n++)
                            for (var o in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
                        return e
                    }, _l.apply(this, arguments)
                },
                Bl = Kl.events,
                zl = {
                    useAddEmailToAccountEvent: function(e) {
                        var t = Bl.useAddEmailField;
                        vi.eventStreamService.sendEventWithTarget(t.type, t.context, _l(_l({}, t.params), {
                            origin: e
                        }))
                    },
                    addEmailToAccountEvent: function(e) {
                        var t = Bl.addEmailConfirm;
                        vi.eventStreamService.sendEventWithTarget(t.type, t.context, _l(_l({}, t.params), {
                            origin: e
                        }))
                    }
                },
                ql = function(n, r) {
                    var o = Dl(),
                        a = (0, e.useState)(!1),
                        i = a[0],
                        l = a[1],
                        c = (0, e.useState)(!1),
                        s = c[0],
                        u = (c[1], (0, e.useState)(!0)),
                        d = u[0],
                        f = u[1],
                        p = (0, e.useState)(""),
                        y = p[0],
                        h = p[1],
                        m = (0, e.useState)(""),
                        v = m[0],
                        g = m[1],
                        b = (0, e.useMemo)((function() {
                            return {
                                open: function() {
                                    return l(!0)
                                },
                                close: function() {
                                    o(Al()), l(!1)
                                }
                            }
                        }), []),
                        C = Kl.emailRegex,
                        w = Kl.translationKeys.addEmailToAccountKeys,
                        S = (0, e.useState)(""),
                        E = S[0],
                        P = S[1],
                        T = new RegExp(C),
                        x = function() {
                            o(Al()), l(!1), r()
                        },
                        A = function(e) {
                            h(e), P("");
                            var t, r = (t = e, T.test(t) ? E ? n(E) : "" : n(w.MessageInvalidEmailAddress));
                            g(r), f(s || e.length <= 0 || r.length > 0)
                        },
                        I = t().createElement(t().Fragment, null, t().createElement("div", {
                            className: "email-upsell-image"
                        }), t().createElement("p", {
                            className: "email-upsell-text-body"
                        }, n(w.DescriptionAddEmailTextOver13, {
                            emailAddress: y
                        })), t().createElement("input", {
                            id: "email-upsell-modal-input",
                            type: "email",
                            autoComplete: "email",
                            className: (v ? "input-field-error" : "") + " form-control input-field email-upsell-modal-input",
                            placeholder: n(w.LabelEmailInputPlaceholderOver13),
                            value: y,
                            onFocus: function() {
                                return zl.useAddEmailToAccountEvent("")
                            },
                            onChange: function(e) {
                                return A(e.target.value)
                            }
                        }), v && t().createElement("p", {
                            className: "text-error modal-error-message"
                        }, n(v)));
                    return [t().createElement(po.Modal, {
                        show: i,
                        onHide: x,
                        backdrop: !0,
                        className: "mail-upsell-android-modal",
                        size: "sm",
                        "aria-labelledby": "contained-modal-title-vcenter",
                        scrollable: "true",
                        centered: !0
                    }, t().createElement(po.Modal.Header, {
                        useBaseBootstrapComponent: !0
                    }, t().createElement("div", {
                        className: "email-upsell-title-container"
                    }, t().createElement("button", {
                        type: "button",
                        className: "email-upsell-title-button",
                        onClick: x
                    }, t().createElement("span", {
                        className: "close icon-close"
                    })), t().createElement(po.Modal.Title, {
                        id: "contained-modal-title-vcenter"
                    }, n(w.HeadingAddEmail)))), t().createElement(po.Modal.Body, null, I), t().createElement(po.Modal.Footer, null, t().createElement(po.Button, {
                        className: "modal-button email-upsell-btn",
                        variant: po.Button.variants.cta,
                        size: po.Button.sizes.medium,
                        isDisabled: d,
                        onClick: function() {
                            P(""), o(Pl(y))
                        }
                    }, n(w.btnText)))), b]
                },
                Hl = (0, s.withTranslations)((function(n) {
                    var r = n.translate,
                        o = n.onHide,
                        a = Dl(),
                        i = E(Il),
                        l = E(Fi),
                        c = E(Vi),
                        s = ql(r, o),
                        u = s[0],
                        d = s[1];
                    return (0, e.useEffect)((function() {
                        d.open()
                    }), []), (0, e.useEffect)((function() {
                        i.error && (d.close(), o())
                    }), [d, i]), (0, e.useEffect)((function() {
                        i.isEmailAdded && (d.close(), a(Ti({
                            featureName: l,
                            ampFeatureCheckData: c,
                            successfulAction: "AddedEmail"
                        })))
                    }), [i]), t().createElement("div", null, u)
                }), {
                    common: ["CommonUI.Controls"],
                    feature: "Feature.VerificationUpsell"
                }),
                Gl = n(2373),
                Yl = n.n(Gl);

            function $l(e, t) {
                if (e) {
                    var n = (new r.Intl).getLocale(),
                        o = e;
                    n && (o = e + "&language=" + n), t && (o = o + "&style-variant=" + t), window.location.href = o
                }
            }
            var Jl = function() {
                return t().createElement(po.Loading, null)
            };
            var Ql = function(e) {
                var n = e.translate,
                    r = e.onHide,
                    o = E(dl),
                    a = o.completionPageState,
                    i = o.status,
                    l = o.vendorVerificationData,
                    c = o.error,
                    s = l.daysUntilNextVerification,
                    u = a.heading,
                    d = a.bodyText,
                    f = a.icon,
                    p = a.footerText,
                    y = a.buttonText,
                    h = (null == i ? void 0 : i.sessionStatus) === ui.Failure || c;
                return t().createElement(t().Fragment, null, t().createElement(po.Modal.Header, {
                    useBaseBootstrapComponent: !0
                }, t().createElement("div", {
                    className: "email-upsell-title-container"
                }, t().createElement("button", {
                    type: "button",
                    className: "email-upsell-title-button",
                    onClick: r
                }, t().createElement("span", {
                    className: "close icon-close"
                })), t().createElement(po.Modal.Title, {
                    id: "contained-modal-title-vcenter"
                }, n(u)))), t().createElement(po.Modal.Body, null, f && t().createElement("div", {
                    className: f
                }), t().createElement("ul", {
                    className: h ? "content-list error-text" : "content-list"
                }, d.map((function(e) {
                    return t().createElement("li", null, n(e, {
                        age: 18,
                        days: s
                    }))
                })))), t().createElement(po.Modal.Footer, null, p && t().createElement("p", {
                    className: "small"
                }, t().createElement("b", null, n(p))), t().createElement("span", {
                    key: y
                }, t().createElement(po.Button, {
                    className: "button-stack-button primary-link",
                    variant: po.Button.variants.primary,
                    size: po.Button.sizes.medium,
                    onClick: r
                }, n(y)))))
            };
            var Xl = function(e) {
                    var n = e.translate,
                        r = e.onHide,
                        o = E(dl),
                        a = o.status,
                        i = o.vendorVerificationData,
                        l = a.sessionStatus,
                        c = Hi.findIndex((function(e) {
                            return e.statusCode.includes(l)
                        }));
                    return t().createElement(t().Fragment, null, t().createElement(po.Modal.Header, {
                        useBaseBootstrapComponent: !0
                    }, t().createElement("div", {
                        className: "email-upsell-title-container"
                    }, t().createElement("button", {
                        type: "button",
                        className: "email-upsell-title-button",
                        onClick: r
                    }, t().createElement("span", {
                        className: "close icon-close"
                    })), t().createElement(po.Modal.Title, {
                        id: "contained-modal-title-vcenter"
                    }, n("Heading.IdentityVerification")))), t().createElement(po.Modal.Body, {
                        className: "verification-checklist-page-content"
                    }, t().createElement("div", {
                        className: "cta"
                    }, n(l === ui.Success || l === ui.Stored || l === ui.Submitted ? Qi : Xi)), t().createElement("ul", {
                        className: "checklist-wrapper"
                    }, Hi.map((function(e, r) {
                        return r <= c ? t().createElement("li", {
                            className: "checklist-item"
                        }, t().createElement("span", {
                            className: "check-wrapper"
                        }, t().createElement("span", {
                            className: r === c ? "spinner spinner-sm" : "icon-checkmark"
                        })), t().createElement("span", {
                            className: "checklist-text"
                        }, n(e.label))) : null
                    }))), t().createElement("a", {
                        href: i.verificationLink,
                        target: "_blank",
                        rel: "noreferrer"
                    }, t().createElement(po.Button, {
                        onClick: function() {
                            gi(ti.VerificationStarted, ri.GovernmentId, {
                                session: i.sessionIdentifier
                            })
                        },
                        className: "primary-link",
                        variant: po.Button.variants.primary,
                        size: po.Button.sizes.medium,
                        width: po.Button.widths.full
                    }, n($i))), t().createElement("div", {
                        className: "footer-text"
                    }, n(Ji))))
                },
                Zl = function() {
                    return Zl = Object.assign || function(e) {
                        for (var t, n = 1, r = arguments.length; n < r; n++)
                            for (var o in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
                        return e
                    }, Zl.apply(this, arguments)
                },
                ec = 18e5;
            var tc = function(n) {
                    var o, a = n.translate,
                        i = n.onHidecallback,
                        l = n.ageEstimation,
                        c = n.template,
                        u = n.featureSpecificParams,
                        d = (0, e.useRef)(Number(new Date) + ec),
                        f = "parent" === (null == u ? void 0 : u.source),
                        p = Dl(),
                        y = E(dl),
                        h = E(fl),
                        m = E(Fi),
                        v = E(_i),
                        g = E(Vi),
                        b = E(Ui),
                        C = E(dl).page,
                        w = (0, e.useRef)(C),
                        S = (0, e.useRef)(!1),
                        P = (0, e.useRef)(!1),
                        T = (0, e.useRef)(null),
                        x = (0, e.useRef)(!1),
                        A = (0, e.useRef)(null),
                        I = null !== (o = r.DeviceMeta && (0, r.DeviceMeta)().isInApp) && void 0 !== o && o,
                        k = y.vendorVerificationData,
                        D = y.error,
                        N = y.status,
                        O = k.sessionIdentifier,
                        M = k.sessionToken,
                        R = k.verificationLink,
                        j = c === ai.IdvAppeal,
                        F = (null == N ? void 0 : N.sessionStatus) === ui.Success || (null == N ? void 0 : N.sessionStatus) === ui.Stored,
                        V = (0, s.useTheme)();

                    function U() {
                        p(ml()), clearTimeout(T.current), i()
                    }(0, e.useEffect)((function() {
                        return p(vl(!0)), p(pl({
                                ageEstimation: l,
                                parentVerification: f,
                                template: c
                            })), I && (d.current = Number(new Date) + ec),
                            function() {
                                T.current && clearTimeout(T.current), A.current && (A.current.destroy(), A.current = null)
                            }
                    }), []);
                    var L = null;
                    if (I || C === si.Complete) switch (C) {
                        case si.VendorLink:
                            L = t().createElement(Jl, null);
                            break;
                        case si.Checklist:
                            L = t().createElement(Xl, {
                                translate: a,
                                onHide: U
                            });
                            break;
                        case si.Complete:
                            L = j && F ? t().createElement(Jl, null) : t().createElement(Ql, {
                                translate: a,
                                onHide: U
                            });
                            break;
                        default:
                            L = t().createElement(Jl, null)
                    }
                    return (0, e.useEffect)((function() {
                        I && O && null != R && !P.current && (P.current = !0, $l(R))
                    }), [I, O, R]), (0, e.useEffect)((function() {
                        I && !y.loading && null != k.verificationLink && y.page !== si.Complete && Number(new Date) < d.current && setTimeout((function() {
                            p(yl(k.sessionIdentifier))
                        }), 1e4)
                    }), [y]), (0, e.useEffect)((function() {
                        C === si.Complete && p(Ti({
                            featureName: m,
                            ampFeatureCheckData: g,
                            namespace: v
                        }))
                    }), [C]), (0, e.useEffect)((function() {
                        var e;
                        j && C === si.Complete && (null === (e = null == b ? void 0 : b.data) || void 0 === e ? void 0 : e.access) === Za.Granted && !x.current && (x.current = !0, U())
                    }), [j, C, b]), (0, e.useEffect)((function() {
                        if (!I && O) {
                            var e = (new r.Intl).getLocale();
                            A.current = new(Yl().Client)(Zl(Zl(Zl({
                                inquiryId: O,
                                styleVariant: V || "dark"
                            }, e && {
                                language: e
                            }), M && {
                                sessionToken: M
                            }), {
                                onReady: function() {
                                    var e;
                                    null === (e = A.current) || void 0 === e || e.open(), p(vl(!1))
                                },
                                onComplete: function(e) {
                                    e.inquiryId, e.status, e.fields;
                                    if (!S.current) {
                                        p(vl(!0)), S.current = !0;
                                        var t = setInterval((function() {
                                            w.current !== si.Complete && p(yl(O))
                                        }), 5e3);
                                        T.current = setTimeout((function() {
                                            clearInterval(t), p(vl(!1))
                                        }), 3e4)
                                    }
                                },
                                onCancel: function() {
                                    U()
                                },
                                onError: function(e) {
                                    p(yl(k.sessionIdentifier)), console.error(e)
                                }
                            }))
                        }
                    }), [O]), D && !h ? t().createElement(Ql, {
                        translate: a,
                        onHide: U
                    }) : t().createElement(t().Fragment, null, I || C === si.Complete ? L : h && t().createElement(Jl, null))
                },
                nc = n(5574);

            function rc(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var n = [],
                        r = !0,
                        o = !1,
                        a = void 0;
                    try {
                        for (var i, l = e[Symbol.iterator](); !(r = (i = l.next()).done) && (n.push(i.value), !t || n.length !== t); r = !0);
                    } catch (e) {
                        o = !0, a = e
                    } finally {
                        try {
                            r || null == l.return || l.return()
                        } finally {
                            if (o) throw a
                        }
                    }
                    return n
                }(e, t) || function(e, t) {
                    if (!e) return;
                    if ("string" == typeof e) return oc(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    "Object" === n && e.constructor && (n = e.constructor.name);
                    if ("Map" === n || "Set" === n) return Array.from(e);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return oc(e, t)
                }(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function oc(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = new Array(t); n < t; n++) r[n] = e[n];
                return r
            }
            var ac = function(t) {
                    var n = t.open,
                        r = t.onOpenChange,
                        o = t.deeplink,
                        a = t.title,
                        i = t.description,
                        l = t.footer,
                        c = t.closeAffordance,
                        s = t.hideLogo,
                        u = void 0 !== s && s,
                        d = rc((0, e.useState)(null), 2),
                        f = d[0],
                        p = d[1];
                    if ((0, e.useEffect)((function() {
                            try {
                                p(function(e) {
                                    for (var t = (0, nc.create)(e, {
                                            errorCorrectionLevel: "H"
                                        }), n = t.modules.size, r = "", o = 0; o < n; o += 1)
                                        for (var a = 0; a < n; a += 1) t.modules.get(o, a) && (r += "M".concat(a, " ").concat(o, "h1v1h-1z"));
                                    return {
                                        pathData: r,
                                        moduleCount: n
                                    }
                                }(o))
                            } catch (e) {
                                console.error("Failed to generate QRDeepLinkDialog QR code", e), p(null)
                            }
                        }), [o]), null === f) return null;
                    var y, h, m, v, g, b, C = (y = f.moduleCount, h = Math.round(.25 * y), m = Math.max(7, h % 2 == 0 ? h - 1 : h), v = Math.round(5 * y / 176), g = Math.floor((m - 5) / 2), b = m - 2 * Math.max(1, Math.min(g, v)), {
                        outer: m,
                        inner: b,
                        glyph: b - 2
                    });
                    return (0, V.jsx)(Tr, {
                        open: n,
                        onOpenChange: r,
                        isModal: !0,
                        size: "Medium",
                        type: "Default",
                        hasCloseAffordance: !0,
                        closeLabel: c,
                        children: (0, V.jsx)(xr, {
                            children: (0, V.jsxs)(Ar, {
                                className: "flex flex-col",
                                children: [(0, V.jsx)(Ir, {
                                    className: "text-heading-small padding-bottom-small",
                                    children: a
                                }), (0, V.jsx)("p", {
                                    className: "text-body-medium",
                                    children: i
                                }), (0, V.jsx)("div", {
                                    className: "flex justify-center",
                                    children: (0, V.jsx)("div", {
                                        className: "iv-qr-frame padding-medium margin-y-large",
                                        children: (0, V.jsxs)("svg", {
                                            className: "iv-qr-svg",
                                            viewBox: "0 0 ".concat(f.moduleCount, " ").concat(f.moduleCount),
                                            role: "img",
                                            "aria-label": a,
                                            children: [(0, V.jsx)("path", {
                                                d: f.pathData,
                                                fill: "#000000"
                                            }), !u && (0, V.jsxs)(e.Fragment, {
                                                children: [(0, V.jsx)("rect", {
                                                    x: (f.moduleCount - C.outer) / 2,
                                                    y: (f.moduleCount - C.outer) / 2,
                                                    width: C.outer,
                                                    height: C.outer,
                                                    fill: "#FFFFFF"
                                                }), (0, V.jsx)("rect", {
                                                    className: "iv-qr-logo-backdrop",
                                                    x: (f.moduleCount - C.inner) / 2,
                                                    y: (f.moduleCount - C.inner) / 2,
                                                    width: C.inner,
                                                    height: C.inner,
                                                    fill: "#000000"
                                                }), (0, V.jsx)("g", {
                                                    transform: "translate(".concat((f.moduleCount - C.glyph) / 2, " ").concat((f.moduleCount - C.glyph) / 2, ") scale(").concat(C.glyph / 56, ")"),
                                                    children: (0, V.jsx)("path", {
                                                        d: "M11.6763 0L0 44.1659L43.5771 56L55.2533 11.8341L11.6763 0ZM32.0849 35.827L19.9079 32.5185L23.1723 20.1769L35.3542 23.4855L32.0849 35.827Z",
                                                        fill: "#FFFFFF"
                                                    })
                                                })]
                                            })]
                                        })
                                    })
                                }), (0, V.jsx)("p", {
                                    className: "text-body-medium padding-bottom-small",
                                    children: l
                                })]
                            })
                        })
                    })
                },
                ic = {
                    eventName: {
                        authPageLoad: "authPageload",
                        authButtonClick: "authButtonClick",
                        authFormInteraction: "authFormInteraction",
                        authMsgShown: "authMsgShown",
                        authModalShown: "authModalShown"
                    },
                    state: {
                        sessionId: "sessionId"
                    },
                    field: {
                        webEmbededFaeStart: "webEmbededFaeStart",
                        webEmbededFaeError: "webEmbededFaeError",
                        webEmbededFaeCancel: "webEmbededFaeCancel",
                        webFaeStatus: "webFaeStatus",
                        webHostedFaeStart: "webHostedFaeStart",
                        webQrCodeFaeStart: "webQrCodeFaeStart",
                        webQrCodeFaeComplete: "webQrCodeFaeComplete",
                        webQrCodeFaeTimeout: "webQrCodeFaeTimeout",
                        webQrCodeFaeClose: "webQrCodeFaeClose"
                    },
                    btn: {
                        cancelFae: "cancelFae"
                    },
                    text: {}
                },
                lc = function(e, t, n) {
                    try {
                        vi.eventStreamService.sendEventWithTarget(e, t, n)
                    } catch (e) {}
                },
                cc = function(e, t, n) {
                    lc(ic.eventName.authPageLoad, e, {
                        state: t,
                        origin: n,
                        os_time: Date.now()
                    })
                };
            var sc = function(e) {
                    var n = e.qrDataUrl,
                        r = e.translate,
                        o = e.onHide;
                    return t().createElement(Tr, {
                        open: !0,
                        onOpenChange: function(e) {
                            e || o()
                        },
                        size: "Medium",
                        isModal: !0,
                        hasCloseAffordance: !0,
                        closeLabel: r("Action.Close") || "Close"
                    }, t().createElement(xr, null, t().createElement(Ar, null, t().createElement("div", {
                        className: "fae-qr-code-header"
                    }, t().createElement("h5", {
                        className: "fae-qr-code-heading"
                    }, r(Yi) || "Let's check your age on the mobile app"), t().createElement("p", {
                        className: "fae-qr-code-subheading"
                    }, r(Zi) || "Get an age check to enjoy more content and features.")), t().createElement("div", {
                        className: "fae-qr-code-card"
                    }, t().createElement("img", {
                        src: n,
                        alt: "QR code to verify age on mobile device",
                        className: "fae-qr-code-image"
                    }), t().createElement("div", {
                        className: "fae-qr-code-card-text"
                    }, t().createElement("p", {
                        className: "fae-qr-code-scan-instruction"
                    }, r(el) || "Scan this QR code with your phone or tablet camera to complete an age check"), t().createElement("div", {
                        className: "fae-qr-code-divider"
                    }), t().createElement("p", {
                        className: "fae-qr-code-fallback"
                    }, t().createElement("span", {
                        className: "fae-qr-code-fallback-bold"
                    }, r(tl) || "Not scanning?"), " ", r(nl) || "Download the Roblox app on your mobile device and go to Settings > Account Info"))))))
                },
                uc = function(e, t, n, r) {
                    return new(n || (n = Promise))((function(o, a) {
                        function i(e) {
                            try {
                                c(r.next(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function l(e) {
                            try {
                                c(r.throw(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function c(e) {
                            var t;
                            e.done ? o(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                                e(t)
                            }))).then(i, l)
                        }
                        c((r = r.apply(e, t || [])).next())
                    }))
                },
                dc = function(e, t) {
                    var n, r, o, a, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    };
                    return a = {
                        next: l(0),
                        throw: l(1),
                        return: l(2)
                    }, "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                        return this
                    }), a;

                    function l(a) {
                        return function(l) {
                            return function(a) {
                                if (n) throw new TypeError("Generator is already executing.");
                                for (; i;) try {
                                    if (n = 1, r && (o = 2 & a[0] ? r.return : a[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, a[1])).done) return o;
                                    switch (r = 0, o && (a = [2 & a[0], o.value]), a[0]) {
                                        case 0:
                                        case 1:
                                            o = a;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: a[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, r = a[1], a = [0];
                                            continue;
                                        case 7:
                                            a = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = i.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== a[0] && 2 !== a[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === a[0] && (!o || a[1] > o[0] && a[1] < o[3])) {
                                                i.label = a[1];
                                                break
                                            }
                                            if (6 === a[0] && i.label < o[1]) {
                                                i.label = o[1], o = a;
                                                break
                                            }
                                            if (o && i.label < o[2]) {
                                                i.label = o[2], i.ops.push(a);
                                                break
                                            }
                                            o[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    a = t.call(e, i)
                                } catch (e) {
                                    a = [6, e], r = 0
                                } finally {
                                    n = o = 0
                                }
                                if (5 & a[0]) throw a[1];
                                return {
                                    value: a[0] ? a[1] : void 0,
                                    done: !0
                                }
                            }([a, l])
                        }
                    }
                },
                fc = 18e5,
                pc = "AgeEstimation";
            var yc = function(n) {
                    var r = n.translate,
                        o = n.onHidecallback,
                        a = n.featureSpecificParams,
                        i = Dl(),
                        l = E(Fi),
                        c = E(_i),
                        s = E(Vi),
                        u = E(Ui),
                        d = (0, e.useRef)(u);
                    d.current = u;
                    var f = (0, e.useRef)(null),
                        p = (0, e.useRef)(Date.now() + fc),
                        y = (0, e.useState)(null),
                        h = y[0],
                        m = y[1],
                        v = (0, e.useState)(!1),
                        g = v[0],
                        b = v[1],
                        C = (a || {}).context,
                        w = void 0 === C ? "defaultContext" : C,
                        S = function() {
                            f.current && (clearInterval(f.current), f.current = null)
                        };
                    return (0, e.useEffect)((function() {
                        return function() {
                                uc(this, void 0, void 0, (function() {
                                    var e, t;
                                    return dc(this, (function(n) {
                                        switch (n.label) {
                                            case 0:
                                                return n.trys.push([0, 2, , 3]), [4, (0, nc.toDataURL)("https://ro.blox.com/Ebh5/fae", {
                                                    errorCorrectionLevel: "H",
                                                    margin: 1,
                                                    width: 268
                                                })];
                                            case 1:
                                                return e = n.sent(), m(e), cc(w, "", ic.field.webQrCodeFaeStart), [3, 3];
                                            case 2:
                                                return t = n.sent(), console.error("Failed to generate FAE QR code:", t), b(!0), [3, 3];
                                            case 3:
                                                return [2]
                                        }
                                    }))
                                }))
                            }(),
                            function() {
                                S()
                            }
                    }), []), (0, e.useEffect)((function() {
                        if (h && !f.current) {
                            p.current = Date.now() + fc;
                            var e = function() {
                                i(Ti({
                                    featureName: l,
                                    ampFeatureCheckData: s,
                                    namespace: c,
                                    successfulAction: pc
                                }))
                            };
                            e(), f.current = setInterval((function() {
                                var t, n, r;
                                if (Date.now() >= p.current) return S(), cc(w, "", ic.field.webQrCodeFaeTimeout), void o();
                                var a = d.current,
                                    i = (null === (t = null == a ? void 0 : a.data) || void 0 === t ? void 0 : t.access) === Za.Actionable;
                                (null === (r = null === (n = null == a ? void 0 : a.data) || void 0 === n ? void 0 : n.recourses) || void 0 === r ? void 0 : r.find((function(e) {
                                    return e.action === pc
                                }))) && i ? e() : (S(), cc(w, "", ic.field.webQrCodeFaeComplete), o())
                            }), 5e3)
                        }
                    }), [h]), (0, e.useEffect)((function() {
                        g && o()
                    }), [g]), g ? null : h ? t().createElement(sc, {
                        qrDataUrl: h,
                        translate: r,
                        onHide: function() {
                            S(), cc(w, "", ic.field.webQrCodeFaeClose), o()
                        }
                    }) : t().createElement(Jl, null)
                },
                hc = function(e, t, n, r) {
                    return new(n || (n = Promise))((function(o, a) {
                        function i(e) {
                            try {
                                c(r.next(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function l(e) {
                            try {
                                c(r.throw(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function c(e) {
                            var t;
                            e.done ? o(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                                e(t)
                            }))).then(i, l)
                        }
                        c((r = r.apply(e, t || [])).next())
                    }))
                },
                mc = function(e, t) {
                    var n, r, o, a, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    };
                    return a = {
                        next: l(0),
                        throw: l(1),
                        return: l(2)
                    }, "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                        return this
                    }), a;

                    function l(a) {
                        return function(l) {
                            return function(a) {
                                if (n) throw new TypeError("Generator is already executing.");
                                for (; i;) try {
                                    if (n = 1, r && (o = 2 & a[0] ? r.return : a[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, a[1])).done) return o;
                                    switch (r = 0, o && (a = [2 & a[0], o.value]), a[0]) {
                                        case 0:
                                        case 1:
                                            o = a;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: a[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, r = a[1], a = [0];
                                            continue;
                                        case 7:
                                            a = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = i.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== a[0] && 2 !== a[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === a[0] && (!o || a[1] > o[0] && a[1] < o[3])) {
                                                i.label = a[1];
                                                break
                                            }
                                            if (6 === a[0] && i.label < o[1]) {
                                                i.label = o[1], o = a;
                                                break
                                            }
                                            if (o && i.label < o[2]) {
                                                i.label = o[2], i.ops.push(a);
                                                break
                                            }
                                            o[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    a = t.call(e, i)
                                } catch (e) {
                                    a = [6, e], r = 0
                                } finally {
                                    n = o = 0
                                }
                                if (5 & a[0]) throw a[1];
                                return {
                                    value: a[0] ? a[1] : void 0,
                                    done: !0
                                }
                            }([a, l])
                        }
                    }
                },
                vc = function(t) {
                    var n = (0, e.useState)(null),
                        o = n[0],
                        a = n[1];
                    return (0, e.useEffect)((function() {
                        (function(e) {
                            return hc(void 0, void 0, Promise, (function() {
                                return mc(this, (function(t) {
                                    switch (t.label) {
                                        case 0:
                                            return (null === r.ExperimentationService || void 0 === r.ExperimentationService ? void 0 : r.ExperimentationService.getAllValuesForLayer) ? [4, r.ExperimentationService.getAllValuesForLayer(e)] : [3, 2];
                                        case 1:
                                            return [2, t.sent()];
                                        case 2:
                                            return [2, {}]
                                    }
                                }))
                            }))
                        })(t).then((function(e) {
                            a(e)
                        }), (function() {
                            a({})
                        }))
                    }), [t]), o
                },
                gc = "Safety.Identity.FAEHandOff.V1",
                bc = function() {
                    return bc = Object.assign || function(e) {
                        for (var t, n = 1, r = arguments.length; n < r; n++)
                            for (var o in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
                        return e
                    }, bc.apply(this, arguments)
                },
                Cc = function(e, t, n, r) {
                    return new(n || (n = Promise))((function(o, a) {
                        function i(e) {
                            try {
                                c(r.next(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function l(e) {
                            try {
                                c(r.throw(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function c(e) {
                            var t;
                            e.done ? o(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                                e(t)
                            }))).then(i, l)
                        }
                        c((r = r.apply(e, t || [])).next())
                    }))
                },
                wc = function(e, t) {
                    var n, r, o, a, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    };
                    return a = {
                        next: l(0),
                        throw: l(1),
                        return: l(2)
                    }, "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                        return this
                    }), a;

                    function l(a) {
                        return function(l) {
                            return function(a) {
                                if (n) throw new TypeError("Generator is already executing.");
                                for (; i;) try {
                                    if (n = 1, r && (o = 2 & a[0] ? r.return : a[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, a[1])).done) return o;
                                    switch (r = 0, o && (a = [2 & a[0], o.value]), a[0]) {
                                        case 0:
                                        case 1:
                                            o = a;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: a[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, r = a[1], a = [0];
                                            continue;
                                        case 7:
                                            a = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = i.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== a[0] && 2 !== a[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === a[0] && (!o || a[1] > o[0] && a[1] < o[3])) {
                                                i.label = a[1];
                                                break
                                            }
                                            if (6 === a[0] && i.label < o[1]) {
                                                i.label = o[1], o = a;
                                                break
                                            }
                                            if (o && i.label < o[2]) {
                                                i.label = o[2], i.ops.push(a);
                                                break
                                            }
                                            o[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    a = t.call(e, i)
                                } catch (e) {
                                    a = [6, e], r = 0
                                } finally {
                                    n = o = 0
                                }
                                if (5 & a[0]) throw a[1];
                                return {
                                    value: a[0] ? a[1] : void 0,
                                    done: !0
                                }
                            }([a, l])
                        }
                    }
                },
                Sc = "dark",
                Ec = 18e5,
                Pc = "AgeEstimation";

            function Tc(n) {
                var o, a = n.translate,
                    i = n.onHidecallback,
                    l = n.ageEstimation,
                    c = n.featureSpecificParams,
                    u = Dl(),
                    d = E(dl),
                    f = E(fl),
                    p = E(Fi),
                    y = E(_i),
                    h = E(Vi),
                    m = E(Ui),
                    v = d.vendorVerificationData,
                    g = d.status,
                    b = d.error,
                    C = d.completionPageState,
                    w = (c || {}).context,
                    S = void 0 === w ? "defaultContext" : w,
                    P = "parent" === (null == c ? void 0 : c.source),
                    T = (0, e.useRef)(!1),
                    x = (0, e.useRef)(null),
                    A = (0, e.useRef)(null),
                    I = (0, e.useRef)(null),
                    k = (0, e.useRef)(0),
                    D = (0, e.useRef)(!1),
                    N = (0, e.useRef)(Number(new Date) + Ec),
                    O = (0, e.useRef)(g);
                O.current = g;
                var M = (0, e.useRef)(m);
                M.current = m;
                var R = (0, e.useRef)(null),
                    j = v.sessionIdentifier,
                    F = v.verificationLink,
                    V = (0, s.useTheme)(),
                    U = null !== (o = r.DeviceMeta && (0, r.DeviceMeta)().isInApp) && void 0 !== o && o ? pi.Hosted : pi.Embedded,
                    L = function() {
                        x.current && (clearInterval(x.current), x.current = null)
                    },
                    W = function() {
                        I.current && (clearInterval(I.current), I.current = null)
                    };

                function K(e) {
                    return !!e && (e.sessionStatus === ui.Stored || e.sessionStatus === ui.RequiresRetry || e.sessionStatus === ui.Failure)
                }

                function _() {
                    L(), W(), u(ml()), clearTimeout(A.current)
                }

                function B() {
                    _(), i()
                }

                function z() {
                    if (!D.current) {
                        D.current = !0, k.current = Number(new Date) + 1e4, u(vl(!0)),
                            function(e, t, n, r) {
                                lc(ic.eventName.authMsgShown, e, {
                                    state: t,
                                    field: n,
                                    errorCode: r
                                })
                            }(S, j, ic.field.webFaeStatus, ui[g.sessionStatus]);
                        var e = function() {
                            u(Ti({
                                featureName: p,
                                ampFeatureCheckData: h,
                                namespace: y,
                                successfulAction: Pc
                            }))
                        };
                        e();
                        var t = setInterval((function() {
                            var n, r, o, a = M.current,
                                i = (null === (n = null == a ? void 0 : a.data) || void 0 === n ? void 0 : n.access) === Za.Actionable,
                                l = null === (o = null === (r = null == a ? void 0 : a.data) || void 0 === r ? void 0 : r.recourses) || void 0 === o ? void 0 : o.find((function(e) {
                                    return e.action === Pc
                                })),
                                c = Number(new Date) >= k.current;
                            l ? !i || c ? (clearInterval(t), I.current = null, u(vl(!1)), B()) : e() : (clearInterval(t), I.current = null, u(vl(!1)), _())
                        }), 1e3);
                        I.current = t
                    }
                }

                function q() {
                    var e = (new r.Intl).getLocale();
                    R.current = new(Yl().Client)(bc(bc({
                        inquiryId: j,
                        styleVariant: V || Sc
                    }, e && {
                        language: e
                    }), {
                        onReady: function() {
                            var e;
                            null === (e = R.current) || void 0 === e || e.open(),
                                function(e, t, n) {
                                    lc(ic.eventName.authModalShown, e, {
                                        state: t,
                                        field: n,
                                        os_time: Date.now()
                                    })
                                }(S, j, ic.field.webEmbededFaeStart), u(vl(!1))
                        },
                        onComplete: function(e) {
                            e.inquiryId, e.status, e.fields;
                            if (!T.current) {
                                u(vl(!0)), T.current = !0;
                                var t = setInterval((function() {
                                    K(O.current) ? clearInterval(t) : u(yl(j))
                                }), 200);
                                A.current = setTimeout((function() {
                                    clearInterval(t), u(ml()), B()
                                }), 3e4)
                            }
                        },
                        onCancel: function(e) {
                            var t = e.inquiryId;
                            e.sessionToken;
                            ! function(e, t, n, r) {
                                lc(ic.eventName.authButtonClick, e, {
                                    btn: n,
                                    state: t,
                                    origin: r,
                                    os_time: Date.now()
                                })
                            }(S, t, ic.btn.cancelFae, ic.field.webEmbededFaeCancel), B()
                        },
                        onError: function(e) {
                            u(yl(v.sessionIdentifier)),
                                function(e, t, n) {
                                    lc(ic.eventName.authFormInteraction, e, {
                                        state: t,
                                        field: n
                                    })
                                }(S, j, ic.field.webEmbededFaeError), console.error(e)
                        }
                    }))
                }
                return (0, e.useEffect)((function() {
                    return u(vl(!0)), u(pl({
                            ageEstimation: l,
                            parentVerification: P
                        })), U === pi.Embedded && Yl().Client.preload().catch((function(e) {
                            console.error("Failed to preload Persona client:", e)
                        })), U === pi.Hosted && (N.current = Number(new Date) + Ec),
                        function() {
                            _(), L(), R.current && (R.current.destroy(), R.current = null)
                        }
                }), []), (0, e.useEffect)((function() {
                    var e;
                    U === pi.Embedded && j ? q() : U === pi.Hosted && j && null != F && (e = setInterval((function() {
                        Number(new Date) < N.current ? u(yl(v.sessionIdentifier)) : (clearInterval(e), i())
                    }), 1e4), x.current = e, v.verificationLink && (cc(S, j, ic.field.webHostedFaeStart), $l(v.verificationLink, V || Sc)))
                }), [j, F]), (0, e.useEffect)((function() {
                    K(g) && z()
                }), [g]), (0, e.useEffect)((function() {
                    var e;
                    if (D.current && !(null == m ? void 0 : m.loading)) {
                        var t = null === (e = null == m ? void 0 : m.data) || void 0 === e ? void 0 : e.access;
                        I.current && t && t !== Za.Actionable && (W(), u(vl(!1)), B())
                    }
                }), [m]), t().createElement(t().Fragment, null, v.daysUntilNextVerification > 0 && C || b && !f ? t().createElement(Ql, {
                    translate: a,
                    onHide: B
                }) : f ? t().createElement(Jl, null) : null)
            }
            var xc = function(n) {
                    var o, a = n.translate,
                        i = n.onHidecallback,
                        l = n.ageEstimation,
                        c = n.featureSpecificParams,
                        s = Dl(),
                        u = null !== (o = r.DeviceMeta && (0, r.DeviceMeta)().isInApp) && void 0 !== o && o,
                        d = E(Fi),
                        f = E(_i),
                        p = E(Vi),
                        y = E(Ui),
                        h = vc(gc),
                        m = null !== h,
                        v = Boolean(null == h ? void 0 : h.isFaeQrCodeEnabled),
                        g = "accountInfo" === (null == c ? void 0 : c.source),
                        b = !u && v && g,
                        C = (0, e.useState)(null),
                        w = C[0],
                        S = C[1],
                        P = (c || {}).context,
                        T = void 0 === P ? "defaultContext" : P,
                        x = (0, e.useRef)(y);
                    x.current = y;
                    var A = (0, e.useRef)(null),
                        I = (0, e.useRef)(0),
                        k = function() {
                            A.current && (clearInterval(A.current), A.current = null)
                        };
                    return (0, e.useEffect)((function() {
                        ! function() {
                            var e;
                            Cc(this, void 0, void 0, (function() {
                                var t, n, o, a, l, s, u, p;
                                return wc(this, (function(y) {
                                    switch (y.label) {
                                        case 0:
                                            if ("parent" === (null == c ? void 0 : c.source)) return [2];
                                            y.label = 1;
                                        case 1:
                                            return y.trys.push([1, 5, , 6]), [4, r.Guac.callBehaviour("amp-wizard")];
                                        case 2:
                                            return t = y.sent(), n = null === r.DeviceMeta || void 0 === r.DeviceMeta ? void 0 : (0, r.DeviceMeta)(), o = n && (n.isPhone || n.isTablet), a = n && (n.isDesktop || n.isConsole), l = null !== (e = null == n ? void 0 : n.isAmazonApp) && void 0 !== e && e, o && !l && (null == t ? void 0 : t.faeMobileWebDeeplinkEnabled) ? (u = "roblox://navigation/amp_wizard?feature_name=" + d + (f ? "&namespace=" + f : "") + "&entry_point=web", [4, r.DeepLinkService.navigateToDeepLink(u)]) : [3, 4];
                                        case 3:
                                            return y.sent(), window.dispatchEvent(new Event(Ol)), i(), [2];
                                        case 4:
                                            return (a || l) && (null == t ? void 0 : t.faeDesktopDeeplinkEnabled) && (s = new URLSearchParams({
                                                feature_name: d,
                                                entry_point: "web",
                                                user_id: String(r.CurrentUser.userId)
                                            }), f && s.set("namespace", f), u = "roblox://navigation/amp_wizard?" + s.toString(), p = new URLSearchParams({
                                                pid: "QR_code",
                                                c: "fae_onelink",
                                                is_retargeting: "false",
                                                af_dp: u,
                                                deep_link_value: u
                                            }), S("https://ro.blox.com/Ebh5?" + p.toString())), [3, 6];
                                        case 5:
                                            return y.sent(), [3, 6];
                                        case 6:
                                            return [2]
                                    }
                                }))
                            }))
                        }()
                    }), []), (0, e.useEffect)((function() {
                        m && (null === r.ExperimentationService || void 0 === r.ExperimentationService ? void 0 : r.ExperimentationService.logLayerExposure) && r.ExperimentationService.logLayerExposure(gc)
                    }), [m]), (0, e.useEffect)((function() {
                        if (w && !A.current) {
                            cc(T, "", ic.field.webQrCodeFaeStart), I.current = Date.now() + Ec;
                            var e = function() {
                                s(Ti({
                                    featureName: d,
                                    ampFeatureCheckData: p,
                                    namespace: f,
                                    successfulAction: Pc
                                }))
                            };
                            return e(), A.current = setInterval((function() {
                                    var t, n, r;
                                    if (Date.now() >= I.current) return k(), cc(T, "", ic.field.webQrCodeFaeTimeout), void i();
                                    var o = x.current,
                                        a = (null === (t = null == o ? void 0 : o.data) || void 0 === t ? void 0 : t.access) === Za.Actionable;
                                    (null === (r = null === (n = null == o ? void 0 : o.data) || void 0 === n ? void 0 : n.recourses) || void 0 === r ? void 0 : r.find((function(e) {
                                        return e.action === Pc
                                    }))) && a ? e() : (k(), cc(T, "", ic.field.webQrCodeFaeComplete), i())
                                }), 5e3),
                                function() {
                                    return k()
                                }
                        }
                    }), [w]), w ? t().createElement(ac, {
                        open: !0,
                        onOpenChange: function(e) {
                            e || (k(), cc(T, "", ic.field.webQrCodeFaeClose), i())
                        },
                        deeplink: w,
                        title: a(Yi) || "Let's check your age on the mobile app",
                        description: a(el) || "Scan this QR code with your phone or tablet camera to complete an age check",
                        footer: a(nl) || "Download the Roblox app on your mobile device and go to Settings > Account Info",
                        closeAffordance: a("Action.Close") || "Close"
                    }) : m ? b ? t().createElement(yc, {
                        translate: a,
                        onHidecallback: i,
                        featureSpecificParams: c
                    }) : t().createElement(Tc, {
                        translate: a,
                        onHidecallback: i,
                        ageEstimation: l,
                        featureSpecificParams: c
                    }) : t().createElement(Jl, null)
                },
                Ac = n(9870),
                Ic = n.n(Ac),
                kc = function(n) {
                    var r = n.translate,
                        o = n.title,
                        a = n.body,
                        i = n.actionButtonTranslateKey,
                        l = void 0 === i ? "" : i,
                        c = n.neutralButtonTranslateKey,
                        s = n.footer,
                        u = n.size,
                        d = void 0 === u ? "sm" : u,
                        f = n.onAction,
                        p = n.disableActionButton,
                        y = n.disabledNeutralButton,
                        h = n.dualActionButton,
                        m = void 0 !== h && h,
                        v = n.onHide,
                        g = void 0 === v ? function() {} : v,
                        b = n.onNeutral,
                        C = (0, e.useState)(!1),
                        w = C[0],
                        S = C[1],
                        E = (0, e.useMemo)((function() {
                            return {
                                open: function() {
                                    return S(!0)
                                },
                                close: function() {
                                    return S(!1)
                                }
                            }
                        }), []),
                        P = Ic()({
                            "modal-half-width-button": c,
                            "modal-full-width-button": !c
                        });
                    return [t().createElement(po.Modal, {
                        show: w,
                        onHide: function() {
                            E.close(), g()
                        },
                        backdrop: !0,
                        className: "access-management-upsell-inner-modal",
                        size: d,
                        "aria-labelledby": "access-management-upsell-inner-modal-title",
                        scrollable: !0,
                        centered: !0
                    }, t().createElement(po.Modal.Header, {
                        useBaseBootstrapComponent: !0
                    }, t().createElement("div", {
                        className: "access-management-upsell-inner-modal-title-container"
                    }, t().createElement(po.Modal.Title, {
                        id: "access-management-upsell-inner-modal-title"
                    }, o)), t().createElement("button", {
                        type: "button",
                        className: "close close-button",
                        onClick: function() {
                            E.close(), g()
                        }
                    }, t().createElement("span", {
                        className: "icon-close"
                    }))), t().createElement(po.Modal.Body, null, a), t().createElement(po.Modal.Footer, null, l && t().createElement(po.Button, {
                        className: P,
                        variant: po.Button.variants.primary,
                        size: po.Button.sizes.medium,
                        isDisabled: p,
                        onClick: function() {
                            null == f || f(), E.close()
                        }
                    }, r(l)), c && t().createElement(po.Button, {
                        className: P,
                        variant: m ? po.Button.variants.primary : po.Button.variants.secondary,
                        size: po.Button.sizes.medium,
                        isDisabled: y,
                        onClick: function() {
                            null == b || b(), E.close()
                        }
                    }, r(c))), s && t().createElement("div", {
                        className: "text-footer access-management-upsell-inner-modal-text-footer border-top"
                    }, s)), E]
                },
                Dc = {
                    U13To18: "U13To18",
                    U13To1318: "U13To1318",
                    U13ToU13: "U13ToU13",
                    U13ToU13NotEligible: "U13ToU13NotEligible"
                },
                Nc = {
                    IdvOrVpc: "Verify Your Age/Parent Permission Needed",
                    VPC: "Parent Permission Needed",
                    VpcNotEligible: "Parent Permission Not Eligible",
                    AskYourParent: "Ask Your Parent",
                    VerifyId: "Verify ID",
                    EmailMyParent: "Email My Parent",
                    AskNow: "Ask Now",
                    Cancel: 'X icon or "Cancel"',
                    WeNeedToCheckYourAge: "We need to check your age"
                },
                Oc = {
                    VerifyId: "verifyId",
                    EmailParent: "emailParent",
                    verifyCancel: "verifyCancel",
                    VpcNotEligibleModalClose: "vpcNotEligibleModalClose",
                    VpcNotEligibleLearnMore: "vpcNotEligibleLearnMore",
                    askParent: "askParent",
                    cancel: "cancel"
                },
                Mc = {
                    SettingsAgeChangeVerify: "settingsAgeChangeVerify",
                    SettingsAgeChangeVpcNotEligible: "settingsAgeChangeVpcNotEligible",
                    UpdateSetting: "parentalEntrySettings",
                    vpcPrologue: "vpcPrologue",
                    faePrologue: "faePrologue"
                },
                Rc = {
                    AuthPageload: "authPageload",
                    AuthButtonClick: "authButtonClick"
                },
                jc = function(e, t) {
                    return "" + (e ? e + ", " : "") + (t ? "settingName: " + t + ", " : "")
                };

            function Fc(e, t) {
                "CanCorrectAge" === e && vi.eventStreamService.sendEventWithTarget(Rc.AuthButtonClick, Mc.SettingsAgeChangeVerify, {
                    btn: Oc.VerifyId,
                    state: t ? Dc.U13To18 : Dc.U13To1318,
                    associatedText: Nc.VerifyId
                })
            }

            function Vc(e, t, n, r, o) {
                "CanCorrectAge" === e ? vi.eventStreamService.sendEventWithTarget(Rc.AuthButtonClick, Mc.SettingsAgeChangeVerify, {
                    btn: Oc.EmailParent,
                    state: t ? Dc.U13ToU13 : Dc.U13To1318,
                    associatedText: Nc.EmailMyParent
                }) : "CanChangeSetting" === e ? vi.eventStreamService.sendEventWithTarget(Rc.AuthButtonClick, Mc.UpdateSetting, {
                    btn: Oc.EmailParent,
                    state: jc(void 0, n),
                    associatedText: Nc.EmailMyParent
                }) : "CanRemoveParentManagedUserBlocks" === e ? vi.eventStreamService.sendEventWithTarget(Rc.AuthButtonClick, Mc.UpdateSetting, {
                    btn: Oc.EmailParent,
                    state: "unblockUser " + (null == r ? void 0 : r.friendUserId),
                    associatedText: Nc.AskNow
                }) : "CanRemoveParentManagedExperienceBlocks" === e && vi.eventStreamService.sendEventWithTarget(Rc.AuthButtonClick, Mc.UpdateSetting, {
                    btn: Oc.EmailParent,
                    state: "unblockExperience " + (null == r ? void 0 : r.universeId),
                    associatedText: Nc.AskNow
                }), t && n && vi.eventStreamService.sendEventWithTarget(Rc.AuthButtonClick, Mc.vpcPrologue, {
                    btn: Oc.askParent,
                    state: jc(o, n),
                    associatedText: Nc.AskNow
                })
            }

            function Uc(e) {
                var t;
                switch (e) {
                    case "Idv":
                        t = Dc.U13To18;
                        break;
                    case "Vpc":
                        t = Dc.U13ToU13;
                        break;
                    case "IdvOrVpc":
                        t = Dc.U13To1318;
                        break;
                    case "VpcNotEligible":
                        t = Dc.U13ToU13NotEligible
                }
                return t
            }

            function Lc(e, t, n, r, o) {
                if ("CanCorrectAge" === e) {
                    var a = Uc(t);
                    vi.eventStreamService.sendEventWithTarget(Rc.AuthButtonClick, Mc.SettingsAgeChangeVerify, {
                        btn: Oc.verifyCancel,
                        state: a,
                        associatedText: Nc.Cancel
                    })
                } else "CanChangeSetting" === e ? vi.eventStreamService.sendEventWithTarget(Rc.AuthButtonClick, Mc.UpdateSetting, {
                    btn: Oc.verifyCancel,
                    state: jc(void 0, n),
                    associatedText: Nc.Cancel
                }) : "CanRemoveParentManagedUserBlocks" === e ? vi.eventStreamService.sendEventWithTarget(Rc.AuthButtonClick, Mc.UpdateSetting, {
                    btn: Oc.verifyCancel,
                    state: "unblockUser " + (null == r ? void 0 : r.friendUserId),
                    associatedText: Nc.Cancel
                }) : "CanRemoveParentManagedExperienceBlocks" === e && vi.eventStreamService.sendEventWithTarget(Rc.AuthButtonClick, Mc.UpdateSetting, {
                    btn: Oc.verifyCancel,
                    state: "unblockExperience " + (null == r ? void 0 : r.universeId),
                    associatedText: Nc.Cancel
                });
                if (n) {
                    var i = void 0;
                    switch (t) {
                        case "Vpc":
                            i = Mc.vpcPrologue;
                            break;
                        case "Fae":
                            i = Mc.faePrologue
                    }
                    i && vi.eventStreamService.sendEventWithTarget(Rc.AuthButtonClick, i, {
                        btn: Oc.cancel,
                        state: jc(o, n),
                        associatedText: Nc.Cancel
                    })
                }
            }

            function Wc(e, t, n, r, o) {
                if ("CanCorrectAge" === e) {
                    var a = Uc(t);
                    vi.eventStreamService.sendEventWithTarget(Rc.AuthPageload, Mc.SettingsAgeChangeVerify, {
                        state: a,
                        associatedText: Nc.IdvOrVpc
                    })
                } else "CanChangeSetting" === e ? vi.eventStreamService.sendEventWithTarget(Rc.AuthPageload, Mc.UpdateSetting, {
                    state: jc(void 0, n),
                    associatedText: Nc.VPC
                }) : "CanRemoveParentManagedUserBlocks" === e ? vi.eventStreamService.sendEventWithTarget(Rc.AuthPageload, Mc.UpdateSetting, {
                    state: "unblockUser " + (null == r ? void 0 : r.friendUserId),
                    associatedText: Nc.AskYourParent
                }) : "CanRemoveParentManagedExperienceBlocks" === e && vi.eventStreamService.sendEventWithTarget(Rc.AuthPageload, Mc.UpdateSetting, {
                    state: "unblockExperience " + (null == r ? void 0 : r.experienceId),
                    associatedText: Nc.AskYourParent
                });
                if (n) {
                    var i = void 0,
                        l = void 0;
                    switch (t) {
                        case "Vpc":
                            i = Mc.vpcPrologue, l = Nc.AskYourParent;
                            break;
                        case "Fae":
                            i = Mc.faePrologue, l = Nc.WeNeedToCheckYourAge
                    }
                    i && vi.eventStreamService.sendEventWithTarget(Rc.AuthPageload, i, {
                        state: jc(o, n),
                        associatedText: l
                    })
                }
            }
            var Kc, _c = function(n) {
                    var r = n.translate,
                        o = n.onHide,
                        a = E(Fi),
                        i = r(Vl.VerifyYourAge),
                        l = t().createElement("div", null, t().createElement("div", {
                            className: "text-description"
                        }, r(Ul.VpcNotEligible))),
                        c = kc({
                            translate: r,
                            title: i,
                            body: l,
                            actionButtonTranslateKey: Fl.LearnMore,
                            onAction: function() {
                                ! function(e) {
                                    "CanCorrectAge" === e && vi.eventStreamService.sendEventWithTarget(Rc.AuthButtonClick, Mc.SettingsAgeChangeVpcNotEligible, {
                                        btn: Oc.VpcNotEligibleLearnMore,
                                        state: Dc.U13ToU13,
                                        associatedText: Nc.VpcNotEligible
                                    })
                                }(a), window.open("https://help.roblox.com/hc/articles/30428367965460", "_blank")
                            },
                            size: "sm",
                            onHide: function() {
                                o(),
                                    function(e) {
                                        "CanCorrectAge" === e && vi.eventStreamService.sendEventWithTarget(Rc.AuthButtonClick, Mc.SettingsAgeChangeVpcNotEligible, {
                                            btn: Oc.VpcNotEligibleModalClose,
                                            state: Dc.U13ToU13,
                                            associatedText: Nc.VpcNotEligible
                                        })
                                    }(a), u.close()
                            }
                        }),
                        s = c[0],
                        u = c[1];
                    return (0, e.useEffect)((function() {
                        u.open(), Wc(a, "VpcNotEligible")
                    }), [a, u]), [s, u]
                },
                Bc = function(t) {
                    var n, r, o = t.translate,
                        a = t.onHide,
                        i = [null, null],
                        l = i[0],
                        c = i[1],
                        s = E(Ui);
                    if ("CanCorrectAge" === (null === (r = null == s ? void 0 : s.data) || void 0 === r ? void 0 : r.featureName)) l = (n = _c({
                        translate: o,
                        onHide: a
                    }))[0], c = n[1];
                    return (0, e.useEffect)((function() {
                        c.open()
                    }), [l, c]), l
                },
                zc = r.EnvironmentUrls.apiGatewayUrl + "/child-requests-api/v1/send-request-to-new-parent",
                qc = r.EnvironmentUrls.apiGatewayUrl + "/child-requests-api/v1/send-request-to-all-parents",
                Hc = r.EnvironmentUrls.userSettingsApi + "/v1/account-insights/parent-emails",
                Gc = function() {
                    return Gc = Object.assign || function(e) {
                        for (var t, n = 1, r = arguments.length; n < r; n++)
                            for (var o in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
                        return e
                    }, Gc.apply(this, arguments)
                },
                Yc = function(e, t, n, r) {
                    return new(n || (n = Promise))((function(o, a) {
                        function i(e) {
                            try {
                                c(r.next(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function l(e) {
                            try {
                                c(r.throw(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function c(e) {
                            var t;
                            e.done ? o(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                                e(t)
                            }))).then(i, l)
                        }
                        c((r = r.apply(e, t || [])).next())
                    }))
                },
                $c = function(e, t) {
                    var n, r, o, a, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    };
                    return a = {
                        next: l(0),
                        throw: l(1),
                        return: l(2)
                    }, "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                        return this
                    }), a;

                    function l(a) {
                        return function(l) {
                            return function(a) {
                                if (n) throw new TypeError("Generator is already executing.");
                                for (; i;) try {
                                    if (n = 1, r && (o = 2 & a[0] ? r.return : a[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, a[1])).done) return o;
                                    switch (r = 0, o && (a = [2 & a[0], o.value]), a[0]) {
                                        case 0:
                                        case 1:
                                            o = a;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: a[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, r = a[1], a = [0];
                                            continue;
                                        case 7:
                                            a = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = i.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== a[0] && 2 !== a[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === a[0] && (!o || a[1] > o[0] && a[1] < o[3])) {
                                                i.label = a[1];
                                                break
                                            }
                                            if (6 === a[0] && i.label < o[1]) {
                                                i.label = o[1], o = a;
                                                break
                                            }
                                            if (o && i.label < o[2]) {
                                                i.label = o[2], i.ops.push(a);
                                                break
                                            }
                                            o[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    a = t.call(e, i)
                                } catch (e) {
                                    a = [6, e], r = 0
                                } finally {
                                    n = o = 0
                                }
                                if (5 & a[0]) throw a[1];
                                return {
                                    value: a[0] ? a[1] : void 0,
                                    done: !0
                                }
                            }([a, l])
                        }
                    }
                },
                Jc = function(e, t) {
                    var n = {};
                    for (var r in e) Object.prototype.hasOwnProperty.call(e, r) && t.indexOf(r) < 0 && (n[r] = e[r]);
                    if (null != e && "function" == typeof Object.getOwnPropertySymbols) {
                        var o = 0;
                        for (r = Object.getOwnPropertySymbols(e); o < r.length; o++) t.indexOf(r[o]) < 0 && Object.prototype.propertyIsEnumerable.call(e, r[o]) && (n[r[o]] = e[r[o]])
                    }
                    return n
                },
                Qc = {
                    sendRequestToNewParent: function(e) {
                        return Yc(void 0, void 0, Promise, (function() {
                            var t, n, r, o, a, i;
                            return $c(this, (function(c) {
                                switch (c.label) {
                                    case 0:
                                        return t = e.auditData, n = Jc(e, ["auditData"]), r = Gc({
                                            url: zc,
                                            withCredentials: !0
                                        }, t ? {
                                            headers: {
                                                "rbx-audit-data": t
                                            }
                                        } : {}), o = n.requestDetails, [4, l.httpService.post(r, n)];
                                    case 1:
                                        return a = c.sent(), o && (i = Object.keys(o)[0], vi.localStorageService.setLocalStorage("Roblox.ParentalRequest." + i + "CooldownExpirationTime", a.data.lockedUntil)), [2, a.data]
                                }
                            }))
                        }))
                    },
                    sendRequestToAllParents: function(e) {
                        return Yc(void 0, void 0, Promise, (function() {
                            var t, n, r, o;
                            return $c(this, (function(a) {
                                switch (a.label) {
                                    case 0:
                                        return t = {
                                            url: qc,
                                            withCredentials: !0
                                        }, n = e.requestDetails, [4, l.httpService.post(t, e)];
                                    case 1:
                                        return r = a.sent(), n && (o = Object.keys(n)[0], vi.localStorageService.setLocalStorage("Roblox.ParentalRequest." + o + "CooldownExpirationTime", r.data.lockedUntil)), [2, r.data]
                                }
                            }))
                        }))
                    }
                },
                Xc = Qc,
                Zc = {
                    privacyPolicyUrl: r.EnvironmentUrls.websiteUrl + "/info/privacy",
                    defaultCooldownTimeInMs: 9e5,
                    emailRegex: "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$",
                    isChildSubjectToPCFeatureName: "IsChildSubjectToParentalControls",
                    translationKeys: {
                        gatherParentEmail: {
                            title: "Title.EnterParentEmailV2",
                            bodyWithPC: "Description.EnterParentEmailV5",
                            bodyWithoutPC: "Description.EnterParentEmailWithoutParentalControl",
                            bodyForTeens: "Description.EnterParentEmailWithoutParentalControlV2",
                            footer: "Description.ParentalEmailFooter",
                            unknownError: "Message.SomethingWentWrong",
                            invalidEmailError: "Message.InvalidEmail",
                            btnText: "Action.SendEmail",
                            emailPlaceholder: "Label.EmailCapitalized",
                            parentEmailLabel: "Label.ParentEmail",
                            emailTooManyChildrenError: "Message.EmailIneligible",
                            childTooManyParentsError: "Message.ExistAccountWithEmail",
                            emailTooManyRequest: "Message.TooManyAttempts",
                            senderFlooded: "Message.TooManyAttemptAskParent",
                            alreadyApplied: "Description.AllSet",
                            seeRequestAfterLink: "Message.RequestCreatedEmailNotSent",
                            alreadyLinked: "Message.AlreadyLinked"
                        },
                        emailSentConfirmation: {
                            title: "Title.RequestSent",
                            oneParentBody: "Message.EmailSent",
                            pluralParentBody: "Message.EmailSentPluralParent",
                            emailNotSentBody: "Message.RequestCreatedEmailNotSent",
                            btnText: "Action.OK"
                        },
                        exitWarning: {
                            title: "Title.AreYouSure",
                            body: "Description.ExitEnterEmail",
                            actionBtnText: "Action.EnterEmail",
                            neutralBtnText: "Action.Cancel"
                        }
                    },
                    events: {
                        chargebackContext: {
                            parentalEntry: "parentalEntry",
                            settingsAge: "settingsAgeChargeback",
                            settingsRequestSent: "settingsChargebackRequestSent"
                        },
                        savePaymentMethodsContext: {
                            parentalEntry: "parentalEntryDevsubs",
                            settingsAge: "settingsAgeSavePaymentMethods",
                            settingsRequestSent: "settingsSavePaymentMethodsRequestSent"
                        },
                        changeBirthdayContext: {
                            parentalEntry: "parentalEntryAgeChange",
                            settingsAge: "settingsAgeChangeBirthday",
                            settingsRequestSent: "settingsAgeChangeVerifyRequestSent"
                        },
                        updateUserSettingContext: {
                            parentalEntry: "parentalEntrySettings",
                            settingsAge: "settingsAgeSettings",
                            settingsRequestSent: "settingsRequestSent"
                        },
                        addTrustedFriendVpcContext: {
                            parentalEntry: "parentalEntryAddTrustedFriendVpc",
                            settingsAge: "settingsAgeAddTrustedFriendVpc",
                            settingsRequestSent: "settingsAddTrustedFriendVpcRequestSent"
                        },
                        eventName: {
                            authPageLoad: "authPageload",
                            authButtonClick: "authButtonClick",
                            authFormInteraction: "authFormInteraction",
                            authMsgShown: "authMsgShown",
                            authModalShown: "authModalShown"
                        },
                        state: {
                            sessionId: "sessionId",
                            unknown: "unknown",
                            changeBirthday: {
                                U13To18: "U13To18",
                                U13To1318: "U13To1318",
                                U13ToU13: "U13ToU13"
                            }
                        },
                        field: {
                            email: "email",
                            emailModal: "emailModal",
                            errorMessage: "errorMessage",
                            logoutPopup: "logoutPopup",
                            parentalEmailMismatch: "parentalEmailMismatch"
                        },
                        btn: {
                            verifyCancel: "verifyCancel",
                            continue: "continue",
                            submit: "submit"
                        },
                        text: {
                            enterParentEmail: "Enter Parent's Email",
                            sendEmail: "Send Email",
                            submit: "Submit",
                            ok: "OK",
                            requestSent: "Request Sent"
                        },
                        vpc: "Vpc"
                    },
                    settingName: {
                        enablePurchases: "enablePurchases"
                    }
                };
            ! function(e) {
                e.Unknown = "Unknown", e.InvalidUserID = "InvalidUserID", e.InvalidParameter = "InvalidParameter", e.ServiceUnavailable = "ServiceUnavailable", e.NoLinkedParents = "NoLinkedParents", e.ConsentAlreadyApplied = "ConsentAlreadyApplied", e.SenderFlooded = "SenderFlooded", e.ReceiverFlooded = "ReceiverFlooded", e.SenderFloodedRequestCreated = "SenderFloodedRequestCreated", e.IllegalState = "IllegalState", e.InvalidEmailAddress = "InvalidEmailAddress", e.EmailNotUnique = "EmailNotUnique", e.LinkingIneligible = "LinkingIneligible", e.AlreadyLinked = "AlreadyLinked", e.ChildAtLinkLimit = "ChildAtLinkLimit", e.ParentAtLinkLimit = "ParentAtLinkLimit", e.UpdateUserSettingRequestInvalid = "UpdateUserSettingRequestInvalid", e.ConsentAlreadyRequestedConflictingData = "ConsentAlreadyRequestedConflictingData", e.ReceiverNotWhitelisted = "ReceiverNotWhitelisted", e.InvalidComplianceFeature = "InvalidComplianceFeature", e.ChildTooOld = "ChildTooOld", e.UserForgotten = "UserForgotten"
            }(Kc || (Kc = {}));
            var es, ts = Kc,
                ns = {
                    data: {
                        code: "UnknownError"
                    }
                },
                rs = Zc.translationKeys.gatherParentEmail,
                os = function(e) {
                    switch (e) {
                        case ts.ChildAtLinkLimit:
                            return rs.childTooManyParentsError;
                        case ts.ParentAtLinkLimit:
                            return rs.emailTooManyChildrenError;
                        case ts.SenderFlooded:
                            return rs.senderFlooded;
                        case ts.ReceiverFlooded:
                            return rs.emailTooManyRequest;
                        case ts.ConsentAlreadyApplied:
                            return rs.alreadyApplied;
                        case ts.AlreadyLinked:
                            return rs.alreadyLinked;
                        case ts.InvalidEmailAddress:
                            return rs.invalidEmailError;
                        default:
                            return rs.unknownError
                    }
                };
            ! function(e) {
                e.LiftPunishment = "LiftPunishment", e.SavePaymentMethods = "SavePaymentMethods", e.UpdateUserSetting = "UpdateUserSetting", e.UpdateBirthdate = "UpdateBirthdate", e.LinkToChild = "LinkToChild", e.AddTrustedConnection = "AddTrustedConnection", e.LiftRestriction = "LiftRestriction", e.Unknown = "Unknown"
            }(es || (es = {}));
            var as, is = es;
            ! function(e) {
                e.Chargeback = "Chargeback"
            }(as || (as = {}));
            var ls, cs = as,
                ss = Zc.events,
                us = function(e, t, n, r) {
                    var o = n ? n + ", " : "",
                        a = t ? "sessionId: " + t + ", " : "",
                        i = r ? "settingName: " + Object.keys(r)[0] + ", " : "",
                        l = r ? Object.entries(r).map((function(e) {
                            var t = e[0],
                                n = e[1];
                            return t + ": " + String(n)
                        })).join(", ") : "";
                    return e === is.UpdateUserSetting ? "" + o + i + a : "" + o + l + a
                },
                ds = function(e, t) {
                    var n;
                    switch (e) {
                        case is.LiftPunishment:
                            (null == t ? void 0 : t.punishmentType) === cs.Chargeback && (n = ss.chargebackContext);
                            break;
                        case is.SavePaymentMethods:
                            n = ss.savePaymentMethodsContext;
                            break;
                        case is.UpdateBirthdate:
                            n = ss.changeBirthdayContext;
                            break;
                        case is.UpdateUserSetting:
                            n = ss.updateUserSettingContext;
                            break;
                        case is.AddTrustedConnection:
                            n = ss.addTrustedFriendVpcContext;
                            break;
                        default:
                            n = ss.chargebackContext
                    }
                    return n
                },
                fs = function(e, t, n) {
                    try {
                        vi.eventStreamService.sendEventWithTarget(e, t, n)
                    } catch (e) {}
                },
                ps = function(e) {
                    var t = e.requestType,
                        n = e.sessionId,
                        r = e.extraState,
                        o = e.details,
                        a = ds(t, o);
                    fs(ss.eventName.authButtonClick, a.parentalEntry, {
                        btn: ss.btn.continue,
                        associatedText: ss.text.ok,
                        state: us(t, n, r, o)
                    })
                },
                ys = {
                    dateInUTCToBirthdate: function(e) {
                        var t = e.getUTCFullYear(),
                            n = e.getUTCMonth() + 1;
                        return {
                            birthDay: e.getUTCDate(),
                            birthMonth: n,
                            birthYear: t
                        }
                    },
                    calculateAge: function(e) {
                        if (!e || !e.birthYear || 0 === e.birthYear) return 0;
                        var t = new Date,
                            n = ys.dateInUTCToBirthdate(t);
                        return n.birthDay - e.birthDay < 0 && (n.birthMonth -= 1), n.birthMonth - e.birthMonth < 0 && (n.birthYear -= 1), n.birthYear - e.birthYear
                    },
                    getAgeRange: function(e) {
                        var t = Zc.events.state.changeBirthday,
                            n = ys.dateInUTCToBirthdate(e);
                        return ys.calculateAge(n) < 13 ? t.U13ToU13 : t.U13To1318
                    }
                },
                hs = ys,
                ms = function(e, t, n, r) {
                    return new(n || (n = Promise))((function(o, a) {
                        function i(e) {
                            try {
                                c(r.next(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function l(e) {
                            try {
                                c(r.throw(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function c(e) {
                            var t;
                            e.done ? o(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                                e(t)
                            }))).then(i, l)
                        }
                        c((r = r.apply(e, t || [])).next())
                    }))
                },
                vs = function(e, t) {
                    var n, r, o, a, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    };
                    return a = {
                        next: l(0),
                        throw: l(1),
                        return: l(2)
                    }, "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                        return this
                    }), a;

                    function l(a) {
                        return function(l) {
                            return function(a) {
                                if (n) throw new TypeError("Generator is already executing.");
                                for (; i;) try {
                                    if (n = 1, r && (o = 2 & a[0] ? r.return : a[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, a[1])).done) return o;
                                    switch (r = 0, o && (a = [2 & a[0], o.value]), a[0]) {
                                        case 0:
                                        case 1:
                                            o = a;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: a[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, r = a[1], a = [0];
                                            continue;
                                        case 7:
                                            a = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = i.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== a[0] && 2 !== a[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === a[0] && (!o || a[1] > o[0] && a[1] < o[3])) {
                                                i.label = a[1];
                                                break
                                            }
                                            if (6 === a[0] && i.label < o[1]) {
                                                i.label = o[1], o = a;
                                                break
                                            }
                                            if (o && i.label < o[2]) {
                                                i.label = o[2], i.ops.push(a);
                                                break
                                            }
                                            o[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    a = t.call(e, i)
                                } catch (e) {
                                    a = [6, e], r = 0
                                } finally {
                                    n = o = 0
                                }
                                if (5 & a[0]) throw a[1];
                                return {
                                    value: a[0] ? a[1] : void 0,
                                    done: !0
                                }
                            }([a, l])
                        }
                    }
                },
                gs = function(n) {
                    var r = n.translate,
                        o = n.consentType,
                        a = n.successCallBack,
                        i = n.onHideCallback,
                        l = n.value,
                        c = void 0 === l ? null : l,
                        s = (0, e.useState)(Zc.translationKeys.gatherParentEmail.unknownError),
                        u = s[0],
                        d = s[1],
                        f = Zc.translationKeys.emailSentConfirmation,
                        p = kc({
                            translate: r,
                            title: r(Zc.translationKeys.gatherParentEmail.unknownError),
                            body: t().createElement("p", null, r(u)),
                            actionButtonTranslateKey: f.btnText,
                            onAction: function() {
                                d(""), h.close(), i()
                            },
                            onHide: i
                        }),
                        y = p[0],
                        h = p[1],
                        m = function() {
                            return ms(void 0, void 0, void 0, (function() {
                                var e, t, n, r, i, l, s, u;
                                return vs(this, (function(f) {
                                    switch (f.label) {
                                        case 0:
                                            return f.trys.push([0, 2, , 3]), [4, Xc.sendRequestToAllParents({
                                                requestType: o,
                                                requestDetails: c
                                            })];
                                        case 1:
                                            return e = f.sent(), t = null == c ? void 0 : c.newBirthdate, n = new Date(t), r = o === is.UpdateBirthdate ? hs.getAgeRange(n) : void 0,
                                                function(e) {
                                                    var t = e.requestType,
                                                        n = e.sessionId,
                                                        r = e.extraState,
                                                        o = e.details,
                                                        a = ds(t, o);
                                                    fs(ss.eventName.authPageLoad, a.settingsRequestSent, {
                                                        state: us(t, n, r, o),
                                                        associatedText: ss.text.requestSent
                                                    })
                                                }({
                                                    requestType: o,
                                                    extraState: r,
                                                    sessionId: e.sessionId,
                                                    details: c
                                                }), a(e.sessionId), [3, 3];
                                        case 2:
                                            return i = f.sent(), l = null !== (u = i) && void 0 !== u ? u : ns, (s = os(l.data.code)) === ts.SenderFloodedRequestCreated ? a(l.data.sessionId, void 0, !0) : (d(s), h.open()), [3, 3];
                                        case 3:
                                            return [2]
                                    }
                                }))
                            }))
                        };
                    return (0, e.useEffect)((function() {
                        m()
                    }), []), t().createElement("div", null, y)
                },
                bs = {
                    collectEmailModalSurfaceName: "vpc-upsell-web",
                    vpcRequestDefaultConsentName: "vpcRequestLinkDefault",
                    vpcRequestLinkSubjectToPCConsentName: "vpcRequestLinkSubjectToPC",
                    vpcRequestLinkNotSubjectToPCConsentName: "vpcRequestLinkNotSubjectToPC"
                },
                Cs = function(e, t, n, r) {
                    return new(n || (n = Promise))((function(o, a) {
                        function i(e) {
                            try {
                                c(r.next(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function l(e) {
                            try {
                                c(r.throw(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function c(e) {
                            var t;
                            e.done ? o(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                                e(t)
                            }))).then(i, l)
                        }
                        c((r = r.apply(e, t || [])).next())
                    }))
                },
                ws = function(e, t) {
                    var n, r, o, a, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    };
                    return a = {
                        next: l(0),
                        throw: l(1),
                        return: l(2)
                    }, "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                        return this
                    }), a;

                    function l(a) {
                        return function(l) {
                            return function(a) {
                                if (n) throw new TypeError("Generator is already executing.");
                                for (; i;) try {
                                    if (n = 1, r && (o = 2 & a[0] ? r.return : a[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, a[1])).done) return o;
                                    switch (r = 0, o && (a = [2 & a[0], o.value]), a[0]) {
                                        case 0:
                                        case 1:
                                            o = a;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: a[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, r = a[1], a = [0];
                                            continue;
                                        case 7:
                                            a = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = i.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== a[0] && 2 !== a[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === a[0] && (!o || a[1] > o[0] && a[1] < o[3])) {
                                                i.label = a[1];
                                                break
                                            }
                                            if (6 === a[0] && i.label < o[1]) {
                                                i.label = o[1], o = a;
                                                break
                                            }
                                            if (o && i.label < o[2]) {
                                                i.label = o[2], i.ops.push(a);
                                                break
                                            }
                                            o[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    a = t.call(e, i)
                                } catch (e) {
                                    a = [6, e], r = 0
                                } finally {
                                    n = o = 0
                                }
                                if (5 & a[0]) throw a[1];
                                return {
                                    value: a[0] ? a[1] : void 0,
                                    done: !0
                                }
                            }([a, l])
                        }
                    }
                },
                Ss = function(n, o, a, i, l, c) {
                    var s, u = Zc.emailRegex,
                        d = Zc.translationKeys.gatherParentEmail,
                        f = (0, e.useState)(!1),
                        p = f[0],
                        y = f[1],
                        h = (0, e.useState)(!1),
                        m = h[0],
                        v = h[1],
                        g = (0, e.useState)("pending"),
                        b = g[0],
                        C = g[1],
                        w = (0, e.useState)(!1),
                        S = w[0],
                        E = w[1],
                        P = (0, e.useState)(""),
                        T = P[0],
                        x = P[1],
                        A = (0, e.useMemo)((function() {
                            return {
                                open: function() {
                                    return y(!0)
                                },
                                close: function() {
                                    return y(!1)
                                }
                            }
                        }), []),
                        I = (0, e.useState)(""),
                        k = I[0],
                        D = I[1];
                    (0, e.useEffect)((function() {
                        ! function(e) {
                            var t = e.requestType,
                                n = e.extraState,
                                r = e.details,
                                o = ds(t, r);
                            fs(ss.eventName.authModalShown, o.parentalEntry, {
                                field: ss.field.emailModal,
                                associatedText: ss.text.enterParentEmail,
                                state: us(t, void 0, n, r)
                            })
                        }({
                            requestType: o,
                            details: l,
                            extraState: c
                        })
                    }), []), (0, e.useEffect)((function() {
                        Cs(void 0, void 0, void 0, (function() {
                            var e;
                            return ws(this, (function(t) {
                                switch (t.label) {
                                    case 0:
                                        return t.trys.push([0, 2, , 3]), [4, Ci(Zc.isChildSubjectToPCFeatureName)];
                                    case 1:
                                        return e = t.sent(), v(e.access === Za.Granted), C("success"), [3, 3];
                                    case 2:
                                        return t.sent(), C("failed"), [3, 3];
                                    case 3:
                                        return [2]
                                }
                            }))
                        }))
                    }), []);
                    var N = (0, e.useMemo)((function() {
                            return "success" !== b ? bs.vpcRequestDefaultConsentName : m ? bs.vpcRequestLinkSubjectToPCConsentName : bs.vpcRequestLinkNotSubjectToPCConsentName
                        }), [m, b]),
                        O = r.LegallySensitiveContentService.useLegallySensitiveContentAndActions(N, bs.collectEmailModalSurfaceName),
                        M = O[0],
                        R = O[1],
                        j = null !== (s = null == M ? void 0 : M.wordsOfConsent) && void 0 !== s ? s : {},
                        F = (0, e.useMemo)((function() {
                            var e;
                            return t().createElement("span", {
                                dangerouslySetInnerHTML: {
                                    __html: null !== (e = j.description) && void 0 !== e ? e : ""
                                }
                            })
                        }), [j.description]),
                        V = new RegExp(u),
                        U = function() {
                            return T.length > 0 && !V.test(T) ? n(d.invalidEmailError) : k ? n(k) : ""
                        },
                        L = function() {
                            return Cs(void 0, void 0, void 0, (function() {
                                var e, t, n, r, i;
                                return ws(this, (function(s) {
                                    switch (s.label) {
                                        case 0:
                                            D(""), s.label = 1;
                                        case 1:
                                            return s.trys.push([1, 3, , 4]), [4, Xc.sendRequestToNewParent({
                                                email: T,
                                                requestType: o,
                                                requestDetails: l,
                                                auditData: R.getBase64EncodedAuditHeader()
                                            })];
                                        case 2:
                                            return e = s.sent(),
                                                function(e) {
                                                    var t = e.requestType,
                                                        n = e.extraState,
                                                        r = e.sessionId,
                                                        o = e.details,
                                                        a = ds(t, o);
                                                    fs(ss.eventName.authButtonClick, a.parentalEntry, {
                                                        btn: ss.btn.submit,
                                                        associatedText: ss.text.sendEmail,
                                                        state: us(t, r, n, o)
                                                    })
                                                }({
                                                    requestType: o,
                                                    sessionId: e.sessionId,
                                                    details: l,
                                                    extraState: c
                                                }), E(!1), A.close(), a(e.sessionId, T), [3, 4];
                                        case 3:
                                            return t = s.sent(), x(""), E(!1), n = null !== (i = t) && void 0 !== i ? i : ns, (r = os(n.data.code)) === ts.SenderFloodedRequestCreated && a(n.data.sessionId, void 0, !0), D(r), [3, 4];
                                        case 4:
                                            return [2]
                                    }
                                }))
                            }))
                        },
                        W = t().createElement(t().Fragment, null, t().createElement("div", {
                            className: "parental-consent-modal-body"
                        }, F), t().createElement("form", {
                            className: "form-horizontal",
                            autoComplete: "off"
                        }, t().createElement("div", {
                            id: "parent-email-container",
                            className: "form-group"
                        }, t().createElement("label", {
                            htmlFor: "parent-email-address",
                            className: "form-control-label"
                        }, j.textboxLabel), t().createElement("input", {
                            id: "parent-email-address",
                            type: "email",
                            className: "form-control input-field",
                            placeholder: j.placeholderText,
                            autoComplete: "off",
                            value: T,
                            onChange: function(e) {
                                x(e.target.value), D("")
                            },
                            onFocus: function() {
                                return function(e) {
                                    var t = e.requestType,
                                        n = e.extraState,
                                        r = e.details,
                                        o = ds(t, r);
                                    fs(ss.eventName.authFormInteraction, o.parentalEntry, {
                                        field: ss.field.email,
                                        associatedText: ss.text.enterParentEmail,
                                        state: us(t, void 0, n, r)
                                    })
                                }({
                                    requestType: o,
                                    details: l,
                                    extraState: c
                                })
                            }
                        })), t().createElement("input", {
                            type: "text",
                            className: "hidden",
                            name: "fake-username"
                        }), t().createElement("input", {
                            type: "password",
                            className: "hidden",
                            name: "fake-password",
                            autoComplete: "new-password"
                        })), t().createElement("div", {
                            className: "form-group"
                        }, t().createElement("p", {
                            className: "text-error form-control-label"
                        }, U())), t().createElement("div", {
                            className: "text-footer access-management-upsell-inner-modal-text-footer",
                            dangerouslySetInnerHTML: {
                                __html: j.footer
                            }
                        })),
                        K = t().createElement(po.Modal, {
                            show: p,
                            onHide: function() {
                                A.close(), i()
                            },
                            backdrop: !0,
                            className: "access-management-upsell-inner-modal",
                            size: "sm",
                            "aria-labelledby": "access-management-upsell-inner-modal-title",
                            centered: !0
                        }, t().createElement(po.Modal.Header, {
                            useBaseBootstrapComponent: !0
                        }, t().createElement("div", {
                            className: "access-management-upsell-inner-modal-title-container"
                        }, t().createElement(po.Modal.Title, {
                            id: "access-management-upsell-inner-modal-title"
                        }, j.title)), t().createElement("button", {
                            type: "button",
                            className: "close close-button",
                            onClick: function() {
                                A.close(), i()
                            }
                        }, t().createElement("span", {
                            className: "icon-close"
                        }))), t().createElement(po.Modal.Body, null, W), t().createElement(po.Modal.Footer, null, t().createElement(po.Button, {
                            variant: po.Button.variants.primary,
                            size: po.Button.sizes.medium,
                            width: po.Button.widths.full,
                            isDisabled: "" === T || "" !== U(),
                            isLoading: S,
                            onClick: function() {
                                return Cs(void 0, void 0, void 0, (function() {
                                    return ws(this, (function(e) {
                                        switch (e.label) {
                                            case 0:
                                                return E(!0), [4, L()];
                                            case 1:
                                                return e.sent(), [2]
                                        }
                                    }))
                                }))
                            }
                        }, j.button)));
                    return [K, A]
                },
                Es = function(n) {
                    var r = n.translate,
                        o = n.consentType,
                        a = n.successCallback,
                        i = n.onHidecallback,
                        l = n.isPrologueUsed,
                        c = n.value,
                        s = n.source,
                        u = E(Fi),
                        d = Ss(r, o, a, i, c, s),
                        f = d[0],
                        p = d[1];
                    return (0, e.useEffect)((function() {
                        if (!l) {
                            var e = Object.keys(c)[0];
                            Wc(u, Zc.events.vpc, e, c)
                        }
                        p.open()
                    }), []), t().createElement(t().Fragment, null, f)
                },
                Ps = function(e, t, n, r) {
                    return new(n || (n = Promise))((function(o, a) {
                        function i(e) {
                            try {
                                c(r.next(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function l(e) {
                            try {
                                c(r.throw(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function c(e) {
                            var t;
                            e.done ? o(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                                e(t)
                            }))).then(i, l)
                        }
                        c((r = r.apply(e, t || [])).next())
                    }))
                },
                Ts = function(e, t) {
                    var n, r, o, a, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    };
                    return a = {
                        next: l(0),
                        throw: l(1),
                        return: l(2)
                    }, "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                        return this
                    }), a;

                    function l(a) {
                        return function(l) {
                            return function(a) {
                                if (n) throw new TypeError("Generator is already executing.");
                                for (; i;) try {
                                    if (n = 1, r && (o = 2 & a[0] ? r.return : a[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, a[1])).done) return o;
                                    switch (r = 0, o && (a = [2 & a[0], o.value]), a[0]) {
                                        case 0:
                                        case 1:
                                            o = a;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: a[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, r = a[1], a = [0];
                                            continue;
                                        case 7:
                                            a = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = i.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== a[0] && 2 !== a[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === a[0] && (!o || a[1] > o[0] && a[1] < o[3])) {
                                                i.label = a[1];
                                                break
                                            }
                                            if (6 === a[0] && i.label < o[1]) {
                                                i.label = o[1], o = a;
                                                break
                                            }
                                            if (o && i.label < o[2]) {
                                                i.label = o[2], i.ops.push(a);
                                                break
                                            }
                                            o[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    a = t.call(e, i)
                                } catch (e) {
                                    a = [6, e], r = 0
                                } finally {
                                    n = o = 0
                                }
                                if (5 & a[0]) throw a[1];
                                return {
                                    value: a[0] ? a[1] : void 0,
                                    done: !0
                                }
                            }([a, l])
                        }
                    }
                },
                xs = {
                    getLinkedParentEmails: function() {
                        return Ps(void 0, void 0, Promise, (function() {
                            var e;
                            return Ts(this, (function(t) {
                                switch (t.label) {
                                    case 0:
                                        return e = {
                                            url: Hc,
                                            withCredentials: !0
                                        }, [4, l.httpService.get(e)];
                                    case 1:
                                        return [2, t.sent().data]
                                }
                            }))
                        }))
                    }
                },
                As = xs,
                Is = function(e, t, n, r) {
                    return new(n || (n = Promise))((function(o, a) {
                        function i(e) {
                            try {
                                c(r.next(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function l(e) {
                            try {
                                c(r.throw(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function c(e) {
                            var t;
                            e.done ? o(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                                e(t)
                            }))).then(i, l)
                        }
                        c((r = r.apply(e, t || [])).next())
                    }))
                },
                ks = function(e, t) {
                    var n, r, o, a, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    };
                    return a = {
                        next: l(0),
                        throw: l(1),
                        return: l(2)
                    }, "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                        return this
                    }), a;

                    function l(a) {
                        return function(l) {
                            return function(a) {
                                if (n) throw new TypeError("Generator is already executing.");
                                for (; i;) try {
                                    if (n = 1, r && (o = 2 & a[0] ? r.return : a[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, a[1])).done) return o;
                                    switch (r = 0, o && (a = [2 & a[0], o.value]), a[0]) {
                                        case 0:
                                        case 1:
                                            o = a;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: a[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, r = a[1], a = [0];
                                            continue;
                                        case 7:
                                            a = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = i.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== a[0] && 2 !== a[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === a[0] && (!o || a[1] > o[0] && a[1] < o[3])) {
                                                i.label = a[1];
                                                break
                                            }
                                            if (6 === a[0] && i.label < o[1]) {
                                                i.label = o[1], o = a;
                                                break
                                            }
                                            if (o && i.label < o[2]) {
                                                i.label = o[2], i.ops.push(a);
                                                break
                                            }
                                            o[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    a = t.call(e, i)
                                } catch (e) {
                                    a = [6, e], r = 0
                                } finally {
                                    n = o = 0
                                }
                                if (5 & a[0]) throw a[1];
                                return {
                                    value: a[0] ? a[1] : void 0,
                                    done: !0
                                }
                            }([a, l])
                        }
                    }
                },
                Ds = (0, s.withTranslations)((function(n) {
                    var r = n.translate,
                        o = n.recourse,
                        a = n.onHidecallback,
                        i = n.isPrologueUsed,
                        l = n.value,
                        c = void 0 === l ? null : l,
                        s = n.source,
                        u = Zc.translationKeys.emailSentConfirmation,
                        d = o.action,
                        f = o.parentConsentTypes,
                        p = null == f ? void 0 : f[0],
                        y = (0, e.useState)([]),
                        h = y[0],
                        m = y[1],
                        v = (0, e.useState)(!0),
                        g = v[0],
                        b = v[1],
                        C = t().createElement("p", {
                            dangerouslySetInnerHTML: {
                                __html: r(u.oneParentBody, {
                                    parentEmail: h[0]
                                })
                            }
                        }),
                        w = t().createElement("p", null, r(u.pluralParentBody)),
                        S = t().createElement("p", null, r(u.emailNotSentBody)),
                        E = (0, e.useMemo)((function() {
                            return g ? 1 === h.length ? C : w : S
                        }), [g, h]),
                        P = kc({
                            translate: r,
                            title: r(u.title),
                            body: E,
                            actionButtonTranslateKey: u.btnText,
                            onAction: function() {
                                x.close(), a()
                            },
                            onHide: a
                        }),
                        T = P[0],
                        x = P[1];
                    (0, e.useEffect)((function() {
                        d === ri.ParentConsentRequest && Is(void 0, void 0, void 0, (function() {
                            return ks(this, (function(e) {
                                switch (e.label) {
                                    case 0:
                                        return [4, As.getLinkedParentEmails().then((function(e) {
                                            m(e.parentEmails)
                                        }))];
                                    case 1:
                                        return e.sent(), [2]
                                }
                            }))
                        }))
                    }), [d]);
                    var A = function(e, t, n) {
                        if (t && m([t]), n && b(!1), x.open(), p === is.UpdateBirthdate) {
                            var r = null == c ? void 0 : c.newBirthdate,
                                o = new Date(r),
                                a = hs.getAgeRange(o);
                            ps({
                                requestType: is.UpdateBirthdate,
                                extraState: a,
                                sessionId: e
                            })
                        } else ps({
                            requestType: p,
                            sessionId: e,
                            details: c
                        })
                    };
                    return t().createElement("div", null, d === ri.ParentConsentRequest && t().createElement(gs, {
                        translate: r,
                        consentType: p,
                        successCallBack: A,
                        onHideCallback: a,
                        value: c
                    }), d === ri.ParentLinkRequest && t().createElement(Es, {
                        translate: r,
                        consentType: p,
                        successCallback: A,
                        onHidecallback: a,
                        value: c,
                        isPrologueUsed: i,
                        source: s
                    }), T)
                }), {
                    common: ["CommonUI.Controls", "CommonUI.Features", "Amp.Upsell"],
                    feature: "Feature.Parents"
                });
            ! function(e) {
                e.control = "control", e.askYourParentTitle = "askYourParentTitle", e.permissionNeededTitle = "permissionNeededTitle", e.visualized = "visualized", e.newPrologueNoVisual = "newPrologueNoVisual", e.newPrologueVisual = "newPrologueVisual", e.newOneScreenVisual = "newOneScreenVisual"
            }(ls || (ls = {}));
            var Ns = ls,
                Os = {
                    CanCorrectAge: "CanCorrectAge",
                    TriggerTrustedFriendVPCRecourse: "TriggerTrustedFriendVPCRecourse"
                },
                Ms = {};

            function Rs(e, t, n) {
                var r = function(e) {
                    return Ms[e]
                }(e);
                return n(r || t)
            }

            function js(e, t, n, r, o, a) {
                var i = n(t);
                if (r.includes(ri.GovernmentId) && r.includes(ri.ParentConsentRequest))
                    if (e === Os.CanCorrectAge) i = n(jl.IdvAndVpcAgeCorrection);
                    else i = n(t);
                if (1 === r.length && r.includes(ri.ParentConsentRequest)) {
                    switch (!0) {
                        case e === Os.TriggerTrustedFriendVPCRecourse:
                            i = n(jl.AddFriendVpc);
                            break;
                        case void 0 !== (null == o ? void 0 : o.enablePurchases):
                            i = n(jl.VpcEnablePurchase);
                            break;
                        case "Unblock" === (null == o ? void 0 : o.friendManagementAction):
                            i = n(jl.VpcUnblockUser, {
                                displayName: o.displayName
                            });
                            break;
                        case "Unblock" === (null == o ? void 0 : o.experienceManagementAction):
                            i = n(jl.VpcUnblockExperience, {
                                experienceName: o.experienceName
                            });
                            break;
                        case void 0 !== (null == o ? void 0 : o.allowFacialAgeEstimation):
                            i = n(jl.VpcAllowFacialAgeEstimation);
                            break;
                        case void 0 !== (null == o ? void 0 : o.contentAgeRestriction):
                            i = n(jl.VpcContentAgeRestriction);
                            break;
                        case void 0 !== (null == o ? void 0 : o.whoCanWhisperChatWithMeInExperiences):
                            i = n(jl.VpcWhisperChatWithMeInExperiences);
                            break;
                        case void 0 !== (null == o ? void 0 : o.whoCanChatWithMeInExperiences):
                            i = n(jl.VpcExperienceChat);
                            break;
                        case void 0 !== (null == o ? void 0 : o.allowCrossAgeGroupStudioCollaboration):
                            i = n(jl.VpcStudioCollaboration);
                            break;
                        default:
                            i = n(t)
                    }
                    if (a === Ns.newPrologueNoVisual || a === Ns.newPrologueVisual) return i + "<br /><br />" + n(jl.PrologueFetchParentExperiment)
                }
                if (1 === r.length && r.includes(ri.AgeEstimation)) switch (!0) {
                    case void 0 !== (null == o ? void 0 : o.whoCanChatWithMeInExperiences):
                        i = n(jl.FaeExperienceChat);
                        break;
                    case void 0 !== (null == o ? void 0 : o.whoCanWhisperChatWithMeInExperiences):
                        i = n(jl.FaeExperienceWhisperChat);
                        break;
                    case void 0 !== (null == o ? void 0 : o.allowCrossAgeGroupStudioCollaboration):
                        i = n(jl.FaeStudioCollaboration);
                        break;
                    default:
                        i = n(t)
                }
                return i
            }
            var Fs, Vs = function(n) {
                    var r = n.translate,
                        o = n.onHide,
                        a = n.recourseParameters,
                        i = n.expChildModalType,
                        l = n.source,
                        c = n.onProceed,
                        s = Dl(),
                        u = E(Fi),
                        d = E(Ui).data.recourses,
                        f = a ? Object.keys(a)[0] : void 0,
                        p = jl.Vpc,
                        y = js(u, p, r, [ri.ParentConsentRequest], a, i),
                        h = t().createElement("div", null, i === Ns.newPrologueVisual && t().createElement("div", {
                            className: "ask-your-parent-lock"
                        }), t().createElement("div", {
                            className: "text-description",
                            dangerouslySetInnerHTML: {
                                __html: y
                            }
                        })),
                        m = Rl.AskYourParent,
                        v = Rs(u, m, r),
                        g = Ml.AskNow,
                        b = Ml.Cancel,
                        C = kc({
                            translate: r,
                            title: v,
                            body: h,
                            actionButtonTranslateKey: g,
                            neutralButtonTranslateKey: b,
                            onAction: function() {
                                Vc(u, !0, f, a), c ? (S.close(), c()) : (s(Di(d[0])), s(Ni(ci.Verification)), S.close())
                            },
                            size: "sm",
                            onHide: function() {
                                Lc(u, "Vpc", f, a, l), o()
                            },
                            onNeutral: function() {
                                Lc(u, "Vpc", f, a, l), o()
                            }
                        }),
                        w = C[0],
                        S = C[1];
                    return (0, e.useEffect)((function() {
                        S.open(), Wc(u, "Vpc", f, a, l)
                    }), []), [w, S]
                },
                Us = function(n) {
                    var r = n.translate,
                        o = n.onHide,
                        a = Dl(),
                        i = E(Fi),
                        l = E(Ui).data.recourses,
                        c = jl.IdvAndVpc,
                        s = js(i, c, r, [ri.GovernmentId, ri.ParentConsentRequest]),
                        u = t().createElement("div", null, t().createElement("div", {
                            className: "text-description"
                        }, " ", s, " ")),
                        d = Rl.VerifyYourAge,
                        f = Rs(i, d, r),
                        p = Ml.VerifyID,
                        y = Ml.EmailMyParent,
                        h = kc({
                            translate: r,
                            title: f,
                            body: u,
                            dualActionButton: !0,
                            actionButtonTranslateKey: p,
                            neutralButtonTranslateKey: y,
                            onAction: function() {
                                Fc(i, !1);
                                var e = l.filter((function(e) {
                                    return e.action === ri.GovernmentId
                                }))[0];
                                a(Di(e)), a(Ni(ci.Verification)), v.close()
                            },
                            size: "sm",
                            onHide: function() {
                                Lc(i, "IdvOrVpc"), o()
                            },
                            onNeutral: function() {
                                Vc(i, !1);
                                var e = l.filter((function(e) {
                                    return e.action !== ri.GovernmentId
                                }))[0];
                                a(Di(e)), a(Ni(ci.Verification)), v.close()
                            }
                        }),
                        m = h[0],
                        v = h[1];
                    return (0, e.useEffect)((function() {
                        v.open(), Wc(i, "IdvOrVpc")
                    }), []), [m, v]
                },
                Ls = function(n) {
                    var r = n.translate,
                        o = n.onHide,
                        a = Dl(),
                        i = E(Fi),
                        l = E(Ui).data.recourses,
                        c = jl.Idv,
                        s = js(i, c, r, [ri.GovernmentId]),
                        u = t().createElement("div", null, t().createElement("div", {
                            className: "text-description"
                        }, " ", s, " ")),
                        d = Rl.VerifyYourAge,
                        f = Rs(i, d, r),
                        p = Ml.VerifyID,
                        y = Ml.Cancel,
                        h = kc({
                            translate: r,
                            title: f,
                            body: u,
                            actionButtonTranslateKey: p,
                            neutralButtonTranslateKey: y,
                            onAction: function() {
                                Fc(i, !0), a(Di(l[0])), a(Ni(ci.Verification)), v.close()
                            },
                            size: "sm",
                            onHide: function() {
                                Lc(i, "Idv"), o()
                            },
                            onNeutral: function() {
                                Lc(i, "Idv"), o()
                            }
                        }),
                        m = h[0],
                        v = h[1];
                    return (0, e.useEffect)((function() {
                        v.open(), Wc(i, "Idv")
                    }), []), [m, v]
                },
                Ws = function(n) {
                    var r = n.translate,
                        o = n.onHide,
                        a = n.recourseParameters,
                        i = n.source,
                        l = Dl(),
                        c = E(Fi),
                        s = E(Ui).data.recourses,
                        u = a ? Object.keys(a)[0] : void 0,
                        d = jl.Fae,
                        f = js(c, d, r, [ri.AgeEstimation], a),
                        p = t().createElement("div", {
                            className: "text-description",
                            dangerouslySetInnerHTML: {
                                __html: f
                            }
                        }),
                        y = Rl.CheckYourAge,
                        h = Rs(c, y, r),
                        m = Ml.Continue,
                        v = Ml.Cancel,
                        g = kc({
                            translate: r,
                            title: h,
                            body: p,
                            actionButtonTranslateKey: m,
                            neutralButtonTranslateKey: v,
                            onAction: function() {
                                l(Di(s[0])), l(Ni(ci.Verification)), C.close()
                            },
                            size: "sm",
                            onHide: function() {
                                Lc(c, "Fae", u, a, i), o()
                            },
                            onNeutral: function() {
                                Lc(c, "Fae", u, a, i), o()
                            }
                        }),
                        b = g[0],
                        C = g[1];
                    return (0, e.useEffect)((function() {
                        C.open(), Wc(c, "Fae", u, a, i)
                    }), []), [b, C]
                },
                Ks = function(t) {
                    var n, r, o, a, i = t.translate,
                        l = t.onHide,
                        c = t.recourseParameters,
                        s = t.expChildModalType,
                        u = t.featureSpecificParams,
                        d = Dl(),
                        f = [null, null],
                        p = f[0],
                        y = f[1],
                        h = E(Ui).data.recourses,
                        m = h.map((function(e) {
                            return e.action
                        }));
                    if (1 === m.length) switch (m[0]) {
                        case ri.ParentConsentRequest:
                        case ri.ParentLinkRequest:
                            n = Vs({
                                translate: i,
                                onHide: l,
                                recourseParameters: c,
                                expChildModalType: s,
                                source: null == u ? void 0 : u.source
                            }), p = n[0], y = n[1];
                            break;
                        case ri.GovernmentId:
                            r = Ls({
                                translate: i,
                                onHide: l
                            }), p = r[0], y = r[1];
                            break;
                        case ri.AgeEstimation:
                            o = Ws({
                                translate: i,
                                onHide: l,
                                recourseParameters: c,
                                source: null == u ? void 0 : u.source
                            }), p = o[0], y = o[1]
                    }
                    return 2 === m.length && m.includes(ri.GovernmentId) && (m.includes(ri.ParentConsentRequest) || m.includes(ri.ParentLinkRequest)) && (a = Us({
                        translate: i,
                        onHide: l
                    }), p = a[0], y = a[1]), (0, e.useEffect)((function() {
                        p ? y.open() : d(Ni(ci.Verification))
                    }), [d, p, y, h]), p
                },
                _s = "Action.Close";
            ! function(e) {
                e.Checkbox = "checkbox", e.Toggle = "toggle", e.Notice = "notice"
            }(Fs || (Fs = {}));
            var Bs, zs = Fs,
                qs = function(e) {
                    var n = e.isChecked,
                        r = e.setIsChecked,
                        o = e.wordsOfConsent;
                    return t().createElement("div", {
                        className: "small text"
                    }, t().createElement("input", {
                        id: "consent-checkbox",
                        type: "checkbox",
                        checked: n,
                        onChange: function() {
                            return null == r ? void 0 : r(!n)
                        }
                    }), t().createElement("label", {
                        htmlFor: "consent-checkbox",
                        className: "checkbox-label"
                    }, o))
                };
            qs.displayName = "CheckboxConsentForm";
            var Hs = function() {
                return null
            };
            Hs.displayName = "ToggleConsentForm";
            var Gs = function(e) {
                var n = e.wordsOfConsent;
                return t().createElement(t().Fragment, null, n)
            };
            Gs.displayName = "NoticeConsentForm";
            var Ys, $s = ((Bs = {})[zs.Checkbox] = qs, Bs[zs.Toggle] = Hs, Bs[zs.Notice] = Gs, Bs);
            ! function(e) {
                e.contentAgeRestriction = "contentAgeRestriction", e.phoneNumberDiscoverability = "phoneNumberDiscoverability", e.whoCanChatWithMe = "whoCanChatWithMe", e.whoCanChatWithMeInApp = "whoCanChatWithMeInApp", e.whoCanJoinMeInExperiences = "whoCanJoinMeInExperiences", e.whoCanSeeMyInventory = "whoCanSeeMyInventory", e.whoCanTradeWithMe = "whoCanTradeWithMe", e.themeType = "themeType", e.canUploadContacts = "canUploadContacts", e.updateFriendsAboutMyActivity = "updateFriendsAboutMyActivity", e.privateServerPrivacy = "privateServerPrivacy", e.allowSellShareData = "allowSellShareData", e.allowPersonalizedAdvertising = "allowPersonalizedAdvertising", e.monthlySpendLimit = "monthlySpendLimit", e.monthlySpendLimitCurrencyCode = "monthlySpendLimitCurrencyCode", e.monthlySpendLimitNotificationType = "monthlySpendLimitNotificationType", e.enablePurchases = "enablePurchases", e.whoCanGroupChatWithMeInApp = "whoCanGroupChatWithMeInApp", e.whoCanWhisperChatWithMeInExperiences = "whoCanWhisperChatWithMeInExperiences", e.whoCanChatWithMeInExperiences = "whoCanChatWithMeInExperiences", e.dailyScreenTimeLimit = "dailyScreenTimeLimit", e.whoCanSeeMySocialNetworks = "whoCanSeeMySocialNetworks", e.allowThirdPartyAppPermissions = "allowThirdPartyAppPermissions", e.allowEnablePushNotifications = "allowEnablePushNotifications", e.allowEnableEmailNotifications = "allowEnableEmailNotifications", e.allowEnableGroupNotifications = "allowEnableGroupNotifications", e.allowEnableExperienceNotifications = "allowEnableExperienceNotifications", e.whoCanOneOnOnePartyWithMe = "whoCanOneOnOnePartyWithMe", e.whoCanGroupPartyWithMe = "whoCanGroupPartyWithMe", e.phoneNumberDiscoverabilityV2 = "phoneNumberDiscoverabilityV2", e.whoCanPartyWithMe = "whoCanPartyWithMe", e.whoCanUsePartyChatWithMe = "whoCanUsePartyChatWithMe", e.whoCanUsePartyVoiceWithMe = "whoCanUsePartyVoiceWithMe", e.allowFacialAgeEstimation = "allowFacialAgeEstimation"
            }(Ys || (Ys = {}));
            var Js, Qs = Ys;
            ! function(e) {
                e.phoneNumberDiscoverabilitySetting = "phoneNumberDiscoverabilitySetting", e.phoneNumberDiscoverabilitySettingParentSide = "phoneNumberDiscoverabilitySettingParentSide", e.phoneNumberDiscoverabilityUpsell = "phoneNumberDiscoverabilityUpsell", e.personalizedAdsSetting = "personalizedAdsSetting", e.sellShareDataSetting = "sellShareDataSetting", e.allowMarketingEmailCheckboxEmailVerification = "allowMarketingEmailCheckboxEmailVerification", e.voiceDataConsentSetting = "voiceDataConsentSetting", e.voiceDataConsentSettingParentSide = "voiceDataConsentSettingParentSide", e.whoCanPartyWithMe = "whoCanPartyWithMe", e.whoCanPartyWithMeV2 = "whoCanPartyWithMeV2", e.whoCanPartyWithMeParentSide = "whoCanPartyWithMeParentSide", e.whoCanPartyWithMeParentSideV2 = "whoCanPartyWithMeParentSideV2", e.whoCanUsePartyChatWithMe = "whoCanUsePartyChatWithMe", e.whoCanUsePartyChatWithMeV2 = "whoCanUsePartyChatWithMeV2", e.whoCanUsePartyChatWithMeParentSide = "whoCanUsePartyChatWithMeParentSide", e.whoCanUsePartyChatWithMeParentSideV2 = "whoCanUsePartyChatWithMeParentSideV2", e.whoCanUsePartyVoiceWithMe = "whoCanUsePartyVoiceWithMe", e.whoCanUsePartyVoiceWithMeV2 = "whoCanUsePartyVoiceWithMeV2", e.whoCanUsePartyVoiceWithMeParentSide = "whoCanUsePartyVoiceWithMeParentSide", e.whoCanUsePartyVoiceWithMeParentSideV2 = "whoCanUsePartyVoiceWithMeParentSideV2", e.allowMarketingEmailNotifications = "allowMarketingEmailNotifications", e.receiveRobuxTransferConsentCard = "receiveRobuxTransferConsentCard", e.sendRobuxTransferConsentCard = "sendRobuxTransferConsentCard", e.vpcRequestLinkSubjectToPC = "vpcRequestLinkSubjectToPC", e.vpcRequestLinkNotSubjectToPC = "vpcRequestLinkNotSubjectToPC", e.vpcRequestLinkDefault = "vpcRequestLinkDefault", e.consentCenterAllowAction = "consentCenterAllowAction", e.consentCenterUpdateSettingNoValue = "consentCenterUpdateSettingNoValue", e.consentCenterUpdateSettingWithValue = "consentCenterUpdateSettingWithValue", e.whoCanPartyWithMeTrustedFriends = "whoCanPartyWithMeTrustedFriends", e.whoCanPartyWithMeTrustedFriendsV2 = "whoCanPartyWithMeTrustedFriendsV2", e.whoCanPartyWithMeParentSideRemovedComms = "whoCanPartyWithMeParentSideRemovedComms", e.whoCanPartyWithMeParentSideRemovedCommsV2 = "whoCanPartyWithMeParentSideRemovedCommsV2", e.whoCanUsePartyChatWithMeTrustedFriends = "whoCanUsePartyChatWithMeTrustedFriends", e.whoCanUsePartyChatWithMeTrustedFriendsV2 = "whoCanUsePartyChatWithMeTrustedFriendsV2", e.whoCanUsePartyChatWithMeParentSideTrustedFriends = "whoCanUsePartyChatWithMeParentSideTrustedFriends", e.whoCanUsePartyChatWithMeParentSideTrustedFriendsV2 = "whoCanUsePartyChatWithMeParentSideTrustedFriendsV2", e.whoCanUsePartyVoiceWithMeTrustedFriends = "whoCanUsePartyVoiceWithMeTrustedFriends", e.whoCanUsePartyVoiceWithMeTrustedFriendsV2 = "whoCanUsePartyVoiceWithMeTrustedFriendsV2", e.whoCanUsePartyVoiceWithMeParentSideTrustedFriends = "whoCanUsePartyVoiceWithMeParentSideTrustedFriends", e.whoCanUsePartyVoiceWithMeParentSideTrustedFriendsV2 = "whoCanUsePartyVoiceWithMeParentSideTrustedFriendsV2"
            }(Js || (Js = {}));
            var Xs, Zs = Js,
                eu = {
                    phoneNumberDiscoverabilityV2: Zs.phoneNumberDiscoverabilityUpsell
                };
            ! function(e) {
                e.ModalShown = "ModalShown", e.Confirm = "Confirm", e.Cancel = "Cancel", e.CloseModal = "CloseModal"
            }(Xs || (Xs = {}));
            var tu, nu, ru = "authButtonClick",
                ou = "authModalShown",
                au = function(e) {
                    return {
                        name: ou,
                        context: e,
                        params: {
                            field: "phoneDiscoverability",
                            associatedText: "Turn on friend discovery"
                        }
                    }
                },
                iu = function(e) {
                    return {
                        name: ru,
                        context: e,
                        params: {
                            btn: "phoneDiscoverabilityConfirm",
                            associatedText: "Turn on"
                        }
                    }
                },
                lu = function(e) {
                    return {
                        name: ru,
                        context: e,
                        params: {
                            btn: "phoneDiscoverabilityNotNow",
                            associatedText: "Not now"
                        }
                    }
                },
                cu = function(e) {
                    return {
                        name: ru,
                        context: e,
                        params: {
                            btn: "phoneDiscoverabilityClose",
                            associatedText: "X"
                        }
                    }
                },
                su = function(e) {
                    return function() {
                        for (var t = [], n = 0; n < arguments.length; n++) t[n] = arguments[n];
                        try {
                            e.apply(void 0, t)
                        } catch (e) {}
                    }
                },
                uu = su((function(e) {
                    var t = au(e);
                    vi.eventStreamService.sendEventWithTarget(t.name, t.context, t.params)
                })),
                du = su((function(e) {
                    var t = iu(e);
                    vi.eventStreamService.sendEventWithTarget(t.name, t.context, t.params)
                })),
                fu = su((function(e) {
                    var t = lu(e);
                    vi.eventStreamService.sendEventWithTarget(t.name, t.context, t.params)
                })),
                pu = su((function(e) {
                    var t = cu(e);
                    vi.eventStreamService.sendEventWithTarget(t.name, t.context, t.params)
                })),
                yu = ((tu = {})[Qs.phoneNumberDiscoverabilityV2] = ((nu = {})[Xs.ModalShown] = uu, nu[Xs.Confirm] = du, nu[Xs.Cancel] = fu, nu[Xs.CloseModal] = pu, nu), tu),
                hu = function(e, t, n) {
                    var r = yu[t];
                    return r && r[e] && r[e](n), null
                },
                mu = function(n, o, a) {
                    var i, l = o.title,
                        c = o.body,
                        s = o.actionButtonText,
                        u = o.neutralButtonText,
                        d = o.onAction,
                        f = o.onHide,
                        p = o.onNeutral,
                        y = o.consentFormType,
                        h = o.surface,
                        m = o.context,
                        v = (i = a.settingName, eu[i]),
                        g = r.LegallySensitiveContentService.useLegallySensitiveContentAndActions(v, h),
                        b = g[0],
                        C = g[1],
                        w = (0, e.useState)(!1),
                        S = w[0],
                        E = w[1],
                        P = (0, e.useMemo)((function() {
                            return {
                                open: function() {
                                    return E(!0)
                                },
                                close: function() {
                                    return E(!1)
                                }
                            }
                        }), []),
                        T = (0, e.useState)(!1),
                        x = T[0],
                        A = T[1];
                    (0, e.useEffect)((function() {
                        y === zs.Notice && A(!0)
                    }), [y]);
                    var I, k = t().createElement(po.Modal, {
                        show: S,
                        onHide: function() {
                            P.close(), f()
                        },
                        backdrop: !0,
                        className: "access-management-upsell-inner-modal user-settings-modal",
                        size: "md",
                        "aria-labelledby": "user-settings-modal-title",
                        scrollable: !0,
                        centered: !0
                    }, t().createElement(po.Modal.Header, {
                        useBaseBootstrapComponent: !0
                    }, t().createElement("div", {
                        className: "user-settings-modal-title-container"
                    }, t().createElement(po.Modal.Title, {
                        id: "user-settings-modal-title"
                    }, b.wordsOfConsent.title || l)), t().createElement("button", {
                        type: "button",
                        className: "close close-button",
                        title: n(_s),
                        onClick: function() {
                            ! function(e, t) {
                                hu(Xs.CloseModal, e, t)
                            }(a.settingName, m), P.close(), f()
                        }
                    }, t().createElement("span", {
                        className: "icon-close"
                    }))), t().createElement(po.Modal.Body, null, c, (I = $s[y]) ? t().createElement("div", {
                        className: "consent-form"
                    }, t().createElement(I, {
                        isChecked: x,
                        setIsChecked: A,
                        wordsOfConsent: b.wordsOfConsent.consent
                    })) : t().createElement(t().Fragment, null)), t().createElement(po.Modal.Footer, null, t().createElement(le, {
                        className: "modal-half-width-button",
                        variant: "Standard",
                        size: "Medium",
                        onClick: function() {
                            ! function(e, t) {
                                hu(Xs.Cancel, e, t)
                            }(a.settingName, m), P.close(), null == p || p(), f()
                        }
                    }, b.wordsOfConsent.neutralButtonText || u), t().createElement(le, {
                        className: "modal-half-width-button modal-primary-button",
                        variant: "Emphasis",
                        size: "Medium",
                        isDisabled: !x,
                        onClick: function() {
                            ! function(e, t) {
                                hu(Xs.Confirm, e, t)
                            }(a.settingName, m), P.close(), C.updateSettingWithAuditing(function(e) {
                                return e === Qs.phoneNumberDiscoverabilityV2 ? Qs.phoneNumberDiscoverability : e
                            }(a.settingName), a.settingValue), null == d || d(), f()
                        }
                    }, b.wordsOfConsent.actionButtonText || s)));
                    return [k, P]
                },
                vu = (0, s.withTranslations)((function(n) {
                    var r = n.translate,
                        o = n.recourse,
                        a = n.updateSettingsModalProps,
                        i = mu(r, a, o.userSettings),
                        l = i[0],
                        c = i[1];
                    return (0, e.useEffect)((function() {
                        var e, t;
                        e = o.userSettings.settingName, t = o.userSettings.settingValue, hu(Xs.ModalShown, e, t), c.open()
                    }), []), t().createElement("div", null, l)
                }), {
                    common: ["CommonUI.Controls"],
                    feature: "Feature.LegallySensitiveContent"
                }),
                gu = function() {
                    return gu = Object.assign || function(e) {
                        for (var t, n = 1, r = arguments.length; n < r; n++)
                            for (var o in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
                        return e
                    }, gu.apply(this, arguments)
                };

            function bu(e) {
                var t = e.translate,
                    n = e.onHide,
                    r = e.recourseParameters,
                    o = e.onProceed,
                    a = e.source;
                return Vs({
                    translate: t,
                    onHide: n,
                    recourseParameters: r,
                    onProceed: o,
                    source: a
                })[0]
            }
            var Cu = function(n) {
                    var r = n.translate,
                        o = n.onHidecallback,
                        a = n.value,
                        i = (n.isPrologueUsed, n.source),
                        l = (0, e.useState)(null),
                        c = l[0],
                        s = l[1],
                        u = (0, e.useState)(!1),
                        d = u[0],
                        f = u[1];
                    if ((0, e.useEffect)((function() {
                            As.getLinkedParentEmails().then((function(e) {
                                var t, n = (null === (t = e.parentEmails) || void 0 === t ? void 0 : t.length) > 0 ? ri.ParentConsentRequest : ri.ParentLinkRequest;
                                s({
                                    action: n,
                                    parentConsentTypes: [is.UpdateUserSetting]
                                })
                            })).catch((function() {
                                s({
                                    action: ri.ParentLinkRequest,
                                    parentConsentTypes: [is.UpdateUserSetting]
                                })
                            }))
                        }), []), !c) return t().createElement(Jl, null);
                    var p = gu(gu({}, a || {}), {
                        allowFacialAgeEstimation: "Enabled"
                    });
                    return d ? t().createElement(Ds, {
                        translate: r,
                        recourse: c,
                        onHidecallback: o,
                        value: p,
                        isPrologueUsed: !0,
                        source: i
                    }) : t().createElement(bu, {
                        translate: r,
                        onHide: o,
                        recourseParameters: p,
                        onProceed: function() {
                            return f(!0)
                        },
                        source: i
                    })
                },
                wu = function() {
                    return wu = Object.assign || function(e) {
                        for (var t, n = 1, r = arguments.length; n < r; n++)
                            for (var o in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
                        return e
                    }, wu.apply(this, arguments)
                },
                Su = function(e, t, n, r) {
                    return new(n || (n = Promise))((function(o, a) {
                        function i(e) {
                            try {
                                c(r.next(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function l(e) {
                            try {
                                c(r.throw(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function c(e) {
                            var t;
                            e.done ? o(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                                e(t)
                            }))).then(i, l)
                        }
                        c((r = r.apply(e, t || [])).next())
                    }))
                },
                Eu = function(e, t) {
                    var n, r, o, a, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    };
                    return a = {
                        next: l(0),
                        throw: l(1),
                        return: l(2)
                    }, "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                        return this
                    }), a;

                    function l(a) {
                        return function(l) {
                            return function(a) {
                                if (n) throw new TypeError("Generator is already executing.");
                                for (; i;) try {
                                    if (n = 1, r && (o = 2 & a[0] ? r.return : a[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, a[1])).done) return o;
                                    switch (r = 0, o && (a = [2 & a[0], o.value]), a[0]) {
                                        case 0:
                                        case 1:
                                            o = a;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: a[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, r = a[1], a = [0];
                                            continue;
                                        case 7:
                                            a = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = i.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== a[0] && 2 !== a[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === a[0] && (!o || a[1] > o[0] && a[1] < o[3])) {
                                                i.label = a[1];
                                                break
                                            }
                                            if (6 === a[0] && i.label < o[1]) {
                                                i.label = o[1], o = a;
                                                break
                                            }
                                            if (o && i.label < o[2]) {
                                                i.label = o[2], i.ops.push(a);
                                                break
                                            }
                                            o[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    a = t.call(e, i)
                                } catch (e) {
                                    a = [6, e], r = 0
                                } finally {
                                    n = o = 0
                                }
                                if (5 & a[0]) throw a[1];
                                return {
                                    value: a[0] ? a[1] : void 0,
                                    done: !0
                                }
                            }([a, l])
                        }
                    }
                };
            var Pu = function(n) {
                    var r, o, a, i, l, c, s = n.translate,
                        u = n.vpcV2Handoff,
                        d = Dl(),
                        f = E(Li),
                        p = E(Ui),
                        y = E(ji),
                        h = E(Ki),
                        m = E(Ri).loading,
                        v = E(Wi),
                        g = (0, e.useState)(),
                        b = g[0],
                        C = g[1],
                        w = (0, e.useState)((function(e) {
                            return e
                        })),
                        S = w[0],
                        P = w[1],
                        T = (0, e.useState)({}),
                        x = T[0],
                        A = T[1],
                        I = (0, e.useState)(),
                        k = I[0],
                        D = I[1],
                        N = (0, e.useState)(!1),
                        O = N[0],
                        M = N[1],
                        R = (0, e.useState)(!1),
                        j = R[0],
                        F = R[1],
                        V = (0, e.useState)(void 0),
                        U = V[0],
                        L = V[1],
                        W = (0, e.useRef)(null),
                        K = null !== (o = null === (r = vc("AccountManagement.VerifiedParentalConsent.ChildExperience")) || void 0 === r ? void 0 : r.expNewChildModal) && void 0 !== o ? o : Ns.control;

                    function _(e) {
                        var t;
                        return Su(this, void 0, void 0, (function() {
                            var n, r, o, a, i, l, c, s, u, f, p, y;
                            return Eu(this, (function(h) {
                                switch (h.label) {
                                    case 0:
                                        n = e.detail, r = n.featureName, o = n.redirectLink, a = n.ampFeatureCheckData, i = n.isAsyncCall, l = n.usePrologue, c = n.ampRecourseData, s = n.featureSpecificData, u = n.closeCallback, f = n.namespace, p = n.wizardIntent, P((function() {
                                            return function(e) {
                                                return u(e)
                                            }
                                        })), L(void 0), W.current = {
                                            isAsyncCall: i,
                                            recourseData: null !== (t = c) && void 0 !== t ? t : {},
                                            closeCallback: u
                                        }, h.label = 1;
                                    case 1:
                                        return h.trys.push([1, 3, , 4]), [4, d(Ti({
                                            featureName: r,
                                            ampFeatureCheckData: a,
                                            namespace: f
                                        }))];
                                    case 2:
                                        return h.sent(), [3, 4];
                                    case 3:
                                        return h.sent(), [3, 4];
                                    case 4:
                                        return d(ki(o)), M(i), a && d(Ii(a)), f && d(Mi(f)), c && A(c), s && D(s), p && C(p), y = K === Ns.control || K === Ns.newPrologueNoVisual || K === Ns.newPrologueVisual, l && y ? (d(Oi(!0)), F(!0)) : d(Ni(ci.Verification)), [2]
                                }
                            }))
                        }))
                    }

                    function B() {
                        S(p.data.access), d(Ai())
                    }(0, e.useEffect)((function() {
                        var e = _;
                        return window.addEventListener(Nl, e),
                            function() {
                                return window.removeEventListener(Nl, e)
                            }
                    }), [K]), (0, e.useEffect)((function() {
                        var e, t, n, r, o, a, i, l, c, s, u = [Za.Granted, Za.Denied];
                        (null == p ? void 0 : p.loading) || ((null === (e = null == p ? void 0 : p.data) || void 0 === e ? void 0 : e.access) && u.includes(p.data.access) && "CanCorrectAge" !== (null === (t = null == p ? void 0 : p.data) || void 0 === t ? void 0 : t.featureName) && b !== li.Appeals && S(p.data.access), (null === (r = null === (n = null == p ? void 0 : p.data) || void 0 === n ? void 0 : n.recourses) || void 0 === r ? void 0 : r.length) > 0 && j && (d(Ni(ci.Prologue)), F(!1)), "CanCorrectAge" !== (null === (o = null == p ? void 0 : p.data) || void 0 === o ? void 0 : o.featureName) || p.data.access !== Za.Denied || null !== (null === (a = null == p ? void 0 : p.data) || void 0 === a ? void 0 : a.recourses) && 0 !== (null === (l = null === (i = null == p ? void 0 : p.data) || void 0 === i ? void 0 : i.recourses) || void 0 === l ? void 0 : l.length) ? "CanCorrectAge" === (null === (c = null == p ? void 0 : p.data) || void 0 === c ? void 0 : c.featureName) && (null === (s = null == p ? void 0 : p.data) || void 0 === s ? void 0 : s.access) === Za.Granted && S(p.data.access) : d(Ni(ci.Epilogue)))
                    }), [p, j]);
                    var z = O ? function() {
                            d(Ai()), S(Za.Denied)
                        } : B,
                        q = 1 === (null === (i = null === (a = null == p ? void 0 : p.data) || void 0 === a ? void 0 : a.recourses) || void 0 === i ? void 0 : i.length) && ((null == v ? void 0 : v.action) === ri.ParentConsentRequest || (null == v ? void 0 : v.action) === ri.ParentLinkRequest),
                        H = q && !0 === U,
                        G = q && void 0 === U;

                    function Y() {
                        var e;
                        if (v) switch (v.action) {
                            case ri.AddedEmail:
                                return t().createElement(Hl, {
                                    translate: s,
                                    onHide: B
                                });
                            case ri.AgeEstimation:
                                return t().createElement(xc, {
                                    translate: s,
                                    onHidecallback: z,
                                    featureSpecificParams: k,
                                    ageEstimation: !0
                                });
                            case ri.GovernmentId:
                                return t().createElement(tc, {
                                    translate: s,
                                    onHidecallback: z,
                                    ageEstimation: !1,
                                    featureSpecificParams: k,
                                    template: b === li.Appeals ? ai.IdvAppeal : void 0
                                });
                            case ri.ParentConsentRequest:
                            case ri.ParentLinkRequest:
                                return t().createElement(Ds, {
                                    recourse: v,
                                    translate: s,
                                    onHidecallback: z,
                                    value: x,
                                    isPrologueUsed: h,
                                    source: null == k ? void 0 : k.source
                                });
                            case ri.UserSettings:
                                return (null === (e = v.userSettings) || void 0 === e ? void 0 : e.settingName) === Qs.allowFacialAgeEstimation ? t().createElement(Cu, {
                                    translate: s,
                                    onHidecallback: z,
                                    value: x,
                                    isPrologueUsed: h,
                                    source: null == k ? void 0 : k.source
                                }) : t().createElement(vu, {
                                    translate: s,
                                    recourse: v,
                                    updateSettingsModalProps: wu({
                                        onHide: function() {
                                            var e;
                                            z(), null === (e = k.onHide) || void 0 === e || e.call(k)
                                        }
                                    }, k)
                                });
                            default:
                                return t().createElement(Bc, {
                                    translate: s
                                })
                        }
                        return t().createElement(Bc, {
                            translate: s
                        })
                    }
                    if ((0, e.useEffect)((function() {
                            q && void 0 === U && u.isEnabled().then(L, (function() {
                                return L(!1)
                            }))
                        }), [q, u, U]), (0, e.useEffect)((function() {
                            var e = W.current;
                            if (H && v && e) {
                                var t = e.isAsyncCall ? Za.Denied : p.data.access;
                                u.launch({
                                    recourseAction: v.action,
                                    parentConsentTypes: v.parentConsentTypes,
                                    recourseData: e.recourseData,
                                    onClose: function() {
                                        d(Ai()), e.closeCallback(t)
                                    }
                                })
                            }
                        }), [d, null === (l = p.data) || void 0 === l ? void 0 : l.access, v, H, u]), (0, e.useEffect)((function() {
                            c = Y()
                        }), [v]), H) return null;
                    if (m) c = t().createElement(Jl, null);
                    else switch (f) {
                        case ci.Prologue:
                            null != p.data && (c = t().createElement(Ks, {
                                translate: s,
                                onHide: z,
                                recourseParameters: x,
                                expChildModalType: K,
                                featureSpecificParams: k
                            }));
                            break;
                        case ci.Verification:
                            null != p.data && (c = Y());
                            break;
                        case ci.Epilogue:
                            c = t().createElement(Bc, {
                                translate: s,
                                onHide: z
                            });
                            break;
                        default:
                            c = t().createElement(Jl, null)
                    }
                    return t().createElement(t().Fragment, null, t().createElement(po.Modal, {
                        backdrop: "static",
                        keyboard: !1,
                        show: y && !G,
                        onHide: B,
                        size: "sm",
                        "aria-labelledby": "access-management-modal-title",
                        className: "access-management-upsell-modal",
                        scrollable: "true",
                        centered: "true"
                    }, c))
                },
                Tu = n(3614),
                xu = n.n(Tu),
                Au = n(138),
                Iu = n.n(Au),
                ku = n(377),
                Du = n.n(ku),
                Nu = n(1133),
                Ou = n.n(Nu);
            var Mu, Ru = function(n) {
                    var o = n.translate,
                        a = (0, e.useState)(!1),
                        i = a[0],
                        l = a[1],
                        c = "ja_jp" === (r.Intl ? (new r.Intl).getRobloxLocale() : "en_us") ? {
                            apple: Iu(),
                            google: Ou()
                        } : {
                            apple: xu(),
                            google: Du()
                        };
                    return (0, e.useEffect)((function() {
                        var e = function() {
                            l(!0)
                        };
                        return window.addEventListener(Ol, e),
                            function() {
                                return window.removeEventListener(Ol, e)
                            }
                    }), []), t().createElement(Tr, {
                        open: i,
                        onOpenChange: function(e) {
                            e || l(!1)
                        },
                        size: "Medium",
                        isModal: !0,
                        hasCloseAffordance: !0,
                        closeLabel: o("Action.Dialog.Close")
                    }, t().createElement(xr, null, t().createElement(Ar, {
                        className: "text-body-medium"
                    }, t().createElement(Ir, {
                        className: "text-heading-small"
                    }, o("Heading.CheckAgeOnMobileApp")), t().createElement("div", {
                        className: "flex flex-col gap-medium"
                    }, t().createElement("p", {
                        className: "text-body-medium content-default margin-none"
                    }, o("Label.AgeCheckBenefit")), t().createElement("div", {
                        className: "bg-shift-100 radius-large padding-large flex flex-col gap-medium"
                    }, t().createElement("div", {
                        className: "flex flex-col gap-xsmall"
                    }, t().createElement("h3", {
                        className: "text-title-medium content-emphasis margin-none"
                    }, o("Heading.GetTheApp")), t().createElement("p", {
                        className: "text-body-medium content-muted margin-none"
                    }, o("Label.GetAppOnStore"))), t().createElement("div", {
                        className: "flex wrap gap-small"
                    }, t().createElement("a", {
                        className: "shrink-0",
                        href: r.EnvironmentUrls.appStoreLink,
                        target: "_blank",
                        rel: "noreferrer noopener"
                    }, t().createElement("img", {
                        src: c.apple,
                        alt: o("Label.DownloadOnTheAppStore"),
                        className: "height-1200 width-auto block"
                    })), t().createElement("a", {
                        className: "shrink-0",
                        href: r.EnvironmentUrls.googlePlayStoreLink,
                        target: "_blank",
                        rel: "noreferrer noopener"
                    }, t().createElement("img", {
                        src: c.google,
                        alt: o("Label.GetItOnGooglePlay"),
                        className: "height-1200 width-auto block"
                    }))))))))
                },
                ju = function() {
                    return ju = Object.assign || function(e) {
                        for (var t, n = 1, r = arguments.length; n < r; n++)
                            for (var o in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
                        return e
                    }, ju.apply(this, arguments)
                },
                Fu = {
                    titleTranslationKey: "Title.EnterParentEmailV2",
                    titleSourceContentId: "1400648",
                    parentEmailLabelTranslationKey: "Label.ParentEmail",
                    parentEmailLabelSourceContentId: "2575432",
                    parentEmailPlaceholderTranslationKey: "Label.EmailCapitalized",
                    parentEmailPlaceholderSourceContentId: "1399624",
                    parentEmailFooterTranslationKey: "Description.ParentalEmailFooter",
                    parentEmailFooterSourceContentId: "332360",
                    linkStart: '<a class="text-link" rel="noreferrer" target="_blank" href="https://en.help.roblox.com/hc/articles/115004630823">',
                    linkEnd: "</a>",
                    linkStartParam: "{linkStart}",
                    linkEndParam: "{linkEnd}",
                    buttonTranslationKey: "Action.SendEmail",
                    buttonSourceContentId: "1398857",
                    lineBreak: "<br /><br />",
                    lineBreakParam: "{lineBreak}"
                },
                Vu = ((Mu = {})[Zs.phoneNumberDiscoverabilitySetting] = {
                    titleTranslationKey: "Heading.FriendDiscovery",
                    titleSourceContentId: "4063304",
                    consentTranslationKey: "Description.PhoneNumberDiscoverabilityConsent.FriendsRename",
                    consentSourceContentId: "7216456"
                }, Mu[Zs.phoneNumberDiscoverabilitySettingParentSide] = {
                    titleTranslationKey: "Heading.FriendDiscovery",
                    titleSourceContentId: "4063304",
                    consentTranslationKey: "Description.ParentSide.PhoneNumberDiscoverabilityConsent.TFR",
                    consentSourceContentId: "7237448"
                }, Mu[Zs.phoneNumberDiscoverabilityUpsell] = {
                    titleTranslationKey: "Heading.TurnOnFriendDiscovery",
                    titleSourceContentId: "4123720",
                    consentTranslationKey: "Description.PhoneNumberDiscoverabilityUpsellConsent.FRnm",
                    consentSourceContentId: "7235400",
                    actionButtonTextTranslationKey: "Action.FriendDiscovery.TurnOn",
                    actionButtonTextSourceContentId: "4123208",
                    neutralButtonTextTranslationKey: "Action.FriendDiscovery.NotNow",
                    neutralButtonTextSourceContentId: "4122952"
                }, Mu[Zs.personalizedAdsSetting] = {
                    titleTranslationKey: "Heading.PersonalizeYourAds",
                    titleSourceContentId: "4190024",
                    consentTranslationKey: "Description.PersonalizeAds",
                    consentSourceContentId: "4190536",
                    linkStart: '<a href="https://en.help.roblox.com/hc/articles/28943243301780" class="text-link">',
                    linkEnd: "</a>",
                    linkStartParam: "{linkStart}",
                    linkEndParam: "{linkEnd}"
                }, Mu[Zs.sellShareDataSetting] = {
                    titleTranslationKey: "Heading.DataSellingAndSharing",
                    titleSourceContentId: "4190280",
                    consentTranslationKey: "Description.DataSellingAndSharing",
                    consentSourceContentId: "4190792",
                    linkStart: '<a href="https://en.help.roblox.com/hc/articles/28943243301780" class="text-link">',
                    linkEnd: "</a>",
                    linkStartParam: "{linkStart}",
                    linkEndParam: "{linkEnd}"
                }, Mu[Zs.allowMarketingEmailCheckboxEmailVerification] = {
                    consentTranslationKey: "Description.EmailNotificationsOptIn",
                    consentSourceContentId: "4557640"
                }, Mu[Zs.allowMarketingEmailNotifications] = {
                    pageHeadingTranslationKey: "Label.LSC.NewsAndAnnouncements",
                    pageHeadingSourceContentId: "8125000",
                    pageDescriptionTranslationKey: "Description.LSC.ChooseNotificationTypes",
                    pageDescriptionSourceContentId: "8125256",
                    labelTranslationKey: "Label.LSC.EmailChannelLabel",
                    labelSourceContentId: "8125512",
                    labelDescriptionTranslationKey: "Description.LSC.TurnOnEmail",
                    labelDescriptionSourceContentId: "8125768"
                }, Mu[Zs.voiceDataConsentSetting] = {
                    titleTranslationKey: "Heading.VoiceDataConsent",
                    titleSourceContentId: "4565320",
                    consentTranslationKey: "Description.VoiceDataConsent",
                    consentSourceContentId: "4565576",
                    linkStart: '<a href="https://en.help.roblox.com/hc/articles/5704050147604" class="text-link">',
                    linkEnd: "</a>",
                    linkStartParam: "{linkStart}",
                    linkEndParam: "{linkEnd}"
                }, Mu[Zs.voiceDataConsentSettingParentSide] = {
                    titleTranslationKey: "Heading.VoiceDataConsent",
                    titleSourceContentId: "4565320",
                    consentTranslationKey: "Description.ParentSide.VoiceDataConsent",
                    consentSourceContentId: "4565832",
                    linkStart: '<a href="https://en.help.roblox.com/hc/articles/5704050147604" class="text-link">',
                    linkEnd: "</a>",
                    linkStartParam: "{linkStart}",
                    linkEndParam: "{linkEnd}"
                }, Mu[Zs.whoCanPartyWithMe] = {
                    pageTitleTranslationKey: "Heading.PartyAndPartyChat",
                    pageTitleSourceContentId: "7180360",
                    pageDescriptionTranslationKey: "Description.PartyAndPartyChat",
                    pageDescriptionSourceContentId: "7181640",
                    titleTranslationKey: "Label.Party",
                    titleSourceContentId: "2137161",
                    consentTranslationKey: "Description.PlayGamesTogetherWithYourFriends",
                    consentSourceContentId: "9550152"
                }, Mu[Zs.whoCanPartyWithMeV2] = {
                    pageTitleTranslationKey: "Heading.ChatAndPartyWithFriends",
                    pageTitleSourceContentId: "9225544",
                    pageDescriptionTranslationKey: "Description.ManagePartyAndCommunications",
                    pageDescriptionSourceContentId: "9225800",
                    titleTranslationKey: "Heading.ChatAndPartyWithFriends",
                    titleSourceContentId: "9225544",
                    consentTranslationKey: "Description.JoinGamesAndChatWithFriends",
                    consentSourceContentId: "9447241"
                }, Mu[Zs.whoCanPartyWithMeParentSide] = {
                    pageTitleTranslationKey: "Heading.PartyAndPartyChat",
                    pageTitleSourceContentId: "7180360",
                    pageDescriptionTranslationKey: "Description.PartyAndPartyChatParentSide",
                    pageDescriptionSourceContentId: "7261256",
                    titleTranslationKey: "Label.Party",
                    titleSourceContentId: "2137161",
                    consentTranslationKey: "Description.ParentSide.AllowYourChildToJoinGameWithFriends",
                    consentSourceContentId: "9535560"
                }, Mu[Zs.whoCanPartyWithMeParentSideV2] = {
                    pageTitleTranslationKey: "Heading.ChatAndPartyWithFriends",
                    pageTitleSourceContentId: "9225544",
                    pageDescriptionTranslationKey: "Description.PartyAndPartyChatParentSide",
                    pageDescriptionSourceContentId: "7261256",
                    titleTranslationKey: "Heading.ChatAndPartyWithFriends",
                    titleSourceContentId: "9225544",
                    consentTranslationKey: "Description.ParentSide.AllowYourChildGamesChatWithFriends",
                    consentSourceContentId: "9620552"
                }, Mu[Zs.whoCanUsePartyChatWithMe] = {
                    pageTitleTranslationKey: "Heading.PartyAndPartyChat",
                    pageTitleSourceContentId: "7180360",
                    pageDescriptionTranslationKey: "Description.PartyAndPartyChat",
                    pageDescriptionSourceContentId: "7181640",
                    titleTranslationKey: "Label.PartyChat",
                    titleSourceContentId: "7180616",
                    consentTranslationKey: "Description.PartyChat",
                    consentSourceContentId: "7182152"
                }, Mu[Zs.whoCanUsePartyChatWithMeV2] = {
                    pageTitleTranslationKey: "Heading.ChatAndPartyWithFriends",
                    pageTitleSourceContentId: "9225544",
                    pageDescriptionTranslationKey: "Description.ManagePartyAndCommunications",
                    pageDescriptionSourceContentId: "9225800",
                    titleTranslationKey: "Heading.FriendsChat",
                    titleSourceContentId: "9315144",
                    consentTranslationKey: "Description.FriendsChat",
                    consentSourceContentId: "9315400"
                }, Mu[Zs.whoCanUsePartyChatWithMeParentSide] = {
                    pageTitleTranslationKey: "Heading.PartyAndPartyChat",
                    pageTitleSourceContentId: "7180360",
                    pageDescriptionTranslationKey: "Description.PartyAndPartyChatParentSide",
                    pageDescriptionSourceContentId: "7261256",
                    titleTranslationKey: "Label.PartyChat",
                    titleSourceContentId: "7180616",
                    consentTranslationKey: "Description.PartyChatConsent",
                    consentSourceContentId: "7194184"
                }, Mu[Zs.whoCanUsePartyChatWithMeParentSideV2] = {
                    pageTitleTranslationKey: "Heading.ChatAndPartyWithFriends",
                    pageTitleSourceContentId: "9225544",
                    pageDescriptionTranslationKey: "Description.PartyAndPartyChatParentSide",
                    pageDescriptionSourceContentId: "7261256",
                    titleTranslationKey: "Heading.FriendsChat",
                    titleSourceContentId: "9315144",
                    consentTranslationKey: "Description.ParentSide.FriendsChat",
                    consentSourceContentId: "9620808"
                }, Mu[Zs.whoCanUsePartyVoiceWithMe] = {
                    pageTitleTranslationKey: "Heading.PartyAndPartyChat",
                    pageTitleSourceContentId: "7180360",
                    pageDescriptionTranslationKey: "Description.PartyAndPartyChat",
                    pageDescriptionSourceContentId: "7181640",
                    titleTranslationKey: "Label.PartyVoiceChat",
                    titleSourceContentId: "7181384",
                    consentTranslationKey: "Description.PartyVoiceChat",
                    consentSourceContentId: "7182408"
                }, Mu[Zs.whoCanUsePartyVoiceWithMeV2] = {
                    pageTitleTranslationKey: "Heading.ChatAndPartyWithFriends",
                    pageTitleSourceContentId: "9225544",
                    pageDescriptionTranslationKey: "Description.ManagePartyAndCommunications",
                    pageDescriptionSourceContentId: "9225800",
                    titleTranslationKey: "Heading.VoiceChatWithFriends",
                    titleSourceContentId: "9315656",
                    consentTranslationKey: "Description.VoiceChatWithFriends",
                    consentSourceContentId: "9315912"
                }, Mu[Zs.whoCanUsePartyVoiceWithMeParentSide] = {
                    pageTitleTranslationKey: "Heading.PartyAndPartyChat",
                    pageTitleSourceContentId: "7180360",
                    pageDescriptionTranslationKey: "Description.PartyAndPartyChatParentSide",
                    pageDescriptionSourceContentId: "7261256",
                    titleTranslationKey: "Label.PartyVoiceChat",
                    titleSourceContentId: "7181384",
                    consentTranslationKey: "Description.PartyVoiceChatConsent",
                    consentSourceContentId: "7194440"
                }, Mu[Zs.whoCanUsePartyVoiceWithMeParentSideV2] = {
                    pageTitleTranslationKey: "Heading.ChatAndPartyWithFriends",
                    pageTitleSourceContentId: "9225544",
                    pageDescriptionTranslationKey: "Description.PartyAndPartyChatParentSide",
                    pageDescriptionSourceContentId: "7261256",
                    titleTranslationKey: "Heading.VoiceChatWithFriends",
                    titleSourceContentId: "9315656",
                    consentTranslationKey: "Description.PartyVoiceChatConsent",
                    consentSourceContentId: "7194440"
                }, Mu[Zs.whoCanPartyWithMeTrustedFriends] = {
                    pageTitleTranslationKey: "Heading.PartyAndPartyChat",
                    pageTitleSourceContentId: "7180360",
                    pageDescriptionTranslationKey: "Description.PartySetting.AddToParty",
                    pageDescriptionSourceContentId: "8316488",
                    titleTranslationKey: "Label.Party",
                    titleSourceContentId: "2137161",
                    consentTranslationKey: "Description.PlayGamesTogetherWithYourFriends",
                    consentSourceContentId: "9550152"
                }, Mu[Zs.whoCanPartyWithMeTrustedFriendsV2] = {
                    pageTitleTranslationKey: "Heading.ChatAndPartyWithFriends",
                    pageTitleSourceContentId: "9225544",
                    pageDescriptionTranslationKey: "Description.PartySetting.AddToParty",
                    pageDescriptionSourceContentId: "8316488",
                    titleTranslationKey: "Heading.ChatAndPartyWithFriends",
                    titleSourceContentId: "9225544",
                    consentTranslationKey: "Description.PlayGamesTogetherWithYourFriends",
                    consentSourceContentId: "9550152"
                }, Mu[Zs.whoCanPartyWithMeParentSideRemovedComms] = {
                    pageTitleTranslationKey: "Heading.PartyAndPartyChat",
                    pageTitleSourceContentId: "7180360",
                    pageDescriptionTranslationKey: "Description.PartySettingConsent.AddToParty",
                    pageDescriptionSourceContentId: "8316744",
                    titleTranslationKey: "Label.Party",
                    titleSourceContentId: "2137161",
                    consentTranslationKey: "Description.PartySettingConsent.AddToParty",
                    consentSourceContentId: "8316744"
                }, Mu[Zs.whoCanPartyWithMeParentSideRemovedCommsV2] = {
                    pageTitleTranslationKey: "Heading.ChatAndPartyWithFriends",
                    pageTitleSourceContentId: "9225544",
                    pageDescriptionTranslationKey: "Description.PartySettingConsent.AddToParty",
                    pageDescriptionSourceContentId: "8316744",
                    titleTranslationKey: "Heading.ChatAndPartyWithFriends",
                    titleSourceContentId: "9225544",
                    consentTranslationKey: "Description.PartySettingConsent.AddToParty",
                    consentSourceContentId: "8316744"
                }, Mu[Zs.whoCanUsePartyChatWithMeTrustedFriends] = {
                    pageTitleTranslationKey: "Heading.PartyAndPartyChat",
                    pageTitleSourceContentId: "7180360",
                    pageDescriptionTranslationKey: "Description.PartyAndPartyChat",
                    pageDescriptionSourceContentId: "7181640",
                    titleTranslationKey: "Label.PartyChat",
                    titleSourceContentId: "7180616",
                    consentTranslationKey: "Description.PartyChat.TrustedFriendsOnly",
                    consentSourceContentId: "8313416"
                }, Mu[Zs.whoCanUsePartyChatWithMeTrustedFriendsV2] = {
                    pageTitleTranslationKey: "Heading.ChatAndPartyWithFriends",
                    pageTitleSourceContentId: "9225544",
                    pageDescriptionTranslationKey: "Description.ManagePartyAndCommunications",
                    pageDescriptionSourceContentId: "9225800",
                    titleTranslationKey: "Heading.FriendsChat",
                    titleSourceContentId: "9315144",
                    consentTranslationKey: "Description.PartyChat.TrustedFriendsOnly",
                    consentSourceContentId: "8313416"
                }, Mu[Zs.whoCanUsePartyChatWithMeParentSideTrustedFriends] = {
                    pageTitleTranslationKey: "Heading.PartyAndPartyChat",
                    pageTitleSourceContentId: "7180360",
                    pageDescriptionTranslationKey: "Description.PartyAndPartyChatParentSide",
                    pageDescriptionSourceContentId: "7261256",
                    titleTranslationKey: "Label.PartyChat",
                    titleSourceContentId: "7180616",
                    consentTranslationKey: "Description.PartyChatConsent.TrustedFriends",
                    consentSourceContentId: "8314952"
                }, Mu[Zs.whoCanUsePartyChatWithMeParentSideTrustedFriendsV2] = {
                    pageTitleTranslationKey: "Heading.ChatAndPartyWithFriends",
                    pageTitleSourceContentId: "9225544",
                    pageDescriptionTranslationKey: "Description.PartyAndPartyChatParentSide",
                    pageDescriptionSourceContentId: "7261256",
                    titleTranslationKey: "Heading.FriendsChat",
                    titleSourceContentId: "9315144",
                    consentTranslationKey: "Description.PartyChatConsent.TrustedFriends",
                    consentSourceContentId: "8314952"
                }, Mu[Zs.whoCanUsePartyVoiceWithMeTrustedFriends] = {
                    pageTitleTranslationKey: "Heading.PartyAndPartyChat",
                    pageTitleSourceContentId: "7180360",
                    pageDescriptionTranslationKey: "Description.PartyAndPartyChat",
                    pageDescriptionSourceContentId: "7181640",
                    titleTranslationKey: "Label.PartyVoiceChat",
                    titleSourceContentId: "7181384",
                    consentTranslationKey: "Description.PartyVoiceChat.TrustedFriendsOnly",
                    consentSourceContentId: "8313672"
                }, Mu[Zs.whoCanUsePartyVoiceWithMeTrustedFriendsV2] = {
                    pageTitleTranslationKey: "Heading.ChatAndPartyWithFriends",
                    pageTitleSourceContentId: "9225544",
                    pageDescriptionTranslationKey: "Description.ManagePartyAndCommunications",
                    pageDescriptionSourceContentId: "9225800",
                    titleTranslationKey: "Heading.VoiceChatWithFriends",
                    titleSourceContentId: "9315656",
                    consentTranslationKey: "Description.PartyVoiceChat.TrustedFriendsOnly",
                    consentSourceContentId: "8313672"
                }, Mu[Zs.whoCanUsePartyVoiceWithMeParentSideTrustedFriends] = {
                    pageTitleTranslationKey: "Heading.PartyAndPartyChat",
                    pageTitleSourceContentId: "7180360",
                    pageDescriptionTranslationKey: "Description.PartyAndPartyChatParentSide",
                    pageDescriptionSourceContentId: "7261256",
                    titleTranslationKey: "Label.PartyVoiceChat",
                    titleSourceContentId: "7181384",
                    consentTranslationKey: "Description.PartyVoiceChatConsent",
                    consentSourceContentId: "7194440"
                }, Mu[Zs.whoCanUsePartyVoiceWithMeParentSideTrustedFriendsV2] = {
                    pageTitleTranslationKey: "Heading.ChatAndPartyWithFriends",
                    pageTitleSourceContentId: "9225544",
                    pageDescriptionTranslationKey: "Description.PartyAndPartyChatParentSide",
                    pageDescriptionSourceContentId: "7261256",
                    titleTranslationKey: "Heading.VoiceChatWithFriends",
                    titleSourceContentId: "9315656",
                    consentTranslationKey: "Description.PartyVoiceChatConsent",
                    consentSourceContentId: "7194440"
                }, Mu[Zs.receiveRobuxTransferConsentCard] = {
                    titleTranslationKey: "Heading.ConversationalRequest.ReceiveTransfer.Robux",
                    titleSourceContentId: "7140680",
                    descriptionTranslationKey: "Description.ReceiveRobuxTransfer",
                    descriptionSourceContentId: "7154504",
                    usernameParam: "{username}",
                    amountParam: "{amount}",
                    robuxAmountParam: "{robuxAmount}"
                }, Mu[Zs.sendRobuxTransferConsentCard] = {
                    titleTranslationKey: "Heading.ConversationalRequest.SendTransfer.Robux",
                    titleSourceContentId: "7140424",
                    descriptionTranslationKey: "Description.SendRobuxTransfer",
                    descriptionSourceContentId: "7154760",
                    usernameParam: "{username}",
                    amountParam: "{amount}",
                    robuxAmountParam: "{robuxAmount}"
                }, Mu[Zs.vpcRequestLinkSubjectToPC] = ju(ju({}, Fu), {
                    descriptionTranslationKey: "Description.EnterParentEmailV5",
                    descriptionSourceContentId: "3710792"
                }), Mu[Zs.vpcRequestLinkNotSubjectToPC] = ju(ju({}, Fu), {
                    descriptionTranslationKey: "Description.EnterParentEmailWithoutParentalControlV2",
                    descriptionSourceContentId: "3618888"
                }), Mu[Zs.vpcRequestLinkDefault] = ju(ju({}, Fu), {
                    descriptionTranslationKey: "Description.EnterParentEmailWithoutParentalControl",
                    descriptionSourceContentId: "2540872"
                }), Mu[Zs.consentCenterAllowAction] = {
                    textTranslationKey: "Description.AllowYourChild",
                    textSourceContentId: "1844552",
                    actionNameParam: "{actionName}"
                }, Mu[Zs.consentCenterUpdateSettingNoValue] = {
                    textTranslationKey: "Description.UpdateChildSetting",
                    textSourceContentId: "1566280",
                    settingNameParam: "{settingName}"
                }, Mu[Zs.consentCenterUpdateSettingWithValue] = {
                    textTranslationKey: "Description.UpdateChildSettingFromTo",
                    textSourceContentId: "1566536",
                    settingNameParam: "{settingName}",
                    currentValueParam: "{currentValue}",
                    proposedValueParam: "{proposedValue}"
                }, Mu),
                Uu = r.EnvironmentUrls.userSettingsApi,
                Lu = function() {
                    return {
                        retryable: !0,
                        withCredentials: !0,
                        url: Uu + "/v1/user-settings"
                    }
                },
                Wu = function() {
                    return Wu = Object.assign || function(e) {
                        for (var t, n = 1, r = arguments.length; n < r; n++)
                            for (var o in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
                        return e
                    }, Wu.apply(this, arguments)
                },
                Ku = function(e, t, n, r) {
                    return new(n || (n = Promise))((function(o, a) {
                        function i(e) {
                            try {
                                c(r.next(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function l(e) {
                            try {
                                c(r.throw(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function c(e) {
                            var t;
                            e.done ? o(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                                e(t)
                            }))).then(i, l)
                        }
                        c((r = r.apply(e, t || [])).next())
                    }))
                },
                _u = function(e, t) {
                    var n, r, o, a, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    };
                    return a = {
                        next: l(0),
                        throw: l(1),
                        return: l(2)
                    }, "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                        return this
                    }), a;

                    function l(a) {
                        return function(l) {
                            return function(a) {
                                if (n) throw new TypeError("Generator is already executing.");
                                for (; i;) try {
                                    if (n = 1, r && (o = 2 & a[0] ? r.return : a[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, a[1])).done) return o;
                                    switch (r = 0, o && (a = [2 & a[0], o.value]), a[0]) {
                                        case 0:
                                        case 1:
                                            o = a;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: a[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, r = a[1], a = [0];
                                            continue;
                                        case 7:
                                            a = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = i.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== a[0] && 2 !== a[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === a[0] && (!o || a[1] > o[0] && a[1] < o[3])) {
                                                i.label = a[1];
                                                break
                                            }
                                            if (6 === a[0] && i.label < o[1]) {
                                                i.label = o[1], o = a;
                                                break
                                            }
                                            if (o && i.label < o[2]) {
                                                i.label = o[2], i.ops.push(a);
                                                break
                                            }
                                            o[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    a = t.call(e, i)
                                } catch (e) {
                                    a = [6, e], r = 0
                                } finally {
                                    n = o = 0
                                }
                                if (5 & a[0]) throw a[1];
                                return {
                                    value: a[0] ? a[1] : void 0,
                                    done: !0
                                }
                            }([a, l])
                        }
                    }
                },
                Bu = function(e, t, n) {
                    return Ku(void 0, void 0, Promise, (function() {
                        var r, o;
                        return _u(this, (function(a) {
                            return r = Wu(Wu({}, Lu()), {
                                headers: {
                                    "rbx-audit-data": n
                                }
                            }), [2, l.httpService.post(r, (o = {}, o[e] = t, o))]
                        }))
                    }))
                },
                zu = function() {
                    return zu = Object.assign || function(e) {
                        for (var t, n = 1, r = arguments.length; n < r; n++)
                            for (var o in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
                        return e
                    }, zu.apply(this, arguments)
                },
                qu = function(e, t, n) {
                    var r;
                    switch (e) {
                        case Zs.phoneNumberDiscoverabilitySetting:
                            return [{
                                consentStringTemplate: t(Vu.phoneNumberDiscoverabilitySetting.titleTranslationKey),
                                sourceContentId: Vu.phoneNumberDiscoverabilitySetting.titleSourceContentId
                            }, {
                                consentStringTemplate: t(Vu.phoneNumberDiscoverabilitySetting.consentTranslationKey),
                                sourceContentId: Vu.phoneNumberDiscoverabilitySetting.consentSourceContentId
                            }];
                        case Zs.phoneNumberDiscoverabilitySettingParentSide:
                            return [{
                                consentStringTemplate: t(Vu.phoneNumberDiscoverabilitySettingParentSide.titleTranslationKey),
                                sourceContentId: Vu.phoneNumberDiscoverabilitySettingParentSide.titleSourceContentId
                            }, {
                                consentStringTemplate: t(Vu.phoneNumberDiscoverabilitySettingParentSide.consentTranslationKey),
                                sourceContentId: Vu.phoneNumberDiscoverabilitySettingParentSide.consentSourceContentId
                            }];
                        case Zs.phoneNumberDiscoverabilityUpsell:
                            return [{
                                consentStringTemplate: t(Vu.phoneNumberDiscoverabilityUpsell.titleTranslationKey),
                                sourceContentId: Vu.phoneNumberDiscoverabilityUpsell.titleSourceContentId
                            }, {
                                consentStringTemplate: t(Vu.phoneNumberDiscoverabilityUpsell.consentTranslationKey),
                                sourceContentId: Vu.phoneNumberDiscoverabilityUpsell.consentSourceContentId
                            }, {
                                consentStringTemplate: t(Vu.phoneNumberDiscoverabilityUpsell.actionButtonTextTranslationKey),
                                sourceContentId: Vu.phoneNumberDiscoverabilityUpsell.actionButtonTextSourceContentId
                            }, {
                                consentStringTemplate: t(Vu.phoneNumberDiscoverabilityUpsell.neutralButtonTextTranslationKey),
                                sourceContentId: Vu.phoneNumberDiscoverabilityUpsell.neutralButtonTextSourceContentId
                            }];
                        case Zs.personalizedAdsSetting:
                            return [{
                                consentStringTemplate: t(Vu.personalizedAdsSetting.titleTranslationKey),
                                sourceContentId: Vu.personalizedAdsSetting.titleSourceContentId
                            }, {
                                consentStringTemplate: t(Vu.personalizedAdsSetting.consentTranslationKey, {
                                    linkStart: Vu.personalizedAdsSetting.linkStartParam,
                                    linkEnd: Vu.personalizedAdsSetting.linkEndParam
                                }),
                                sourceContentId: Vu.personalizedAdsSetting.consentSourceContentId,
                                vars: {
                                    linkStart: Vu.personalizedAdsSetting.linkStart,
                                    linkEnd: Vu.personalizedAdsSetting.linkEnd
                                }
                            }];
                        case Zs.sellShareDataSetting:
                            return [{
                                consentStringTemplate: t(Vu.sellShareDataSetting.titleTranslationKey),
                                sourceContentId: Vu.sellShareDataSetting.titleSourceContentId
                            }, {
                                consentStringTemplate: t(Vu.sellShareDataSetting.consentTranslationKey, {
                                    linkStart: Vu.sellShareDataSetting.linkStartParam,
                                    linkEnd: Vu.sellShareDataSetting.linkEndParam
                                }),
                                sourceContentId: Vu.sellShareDataSetting.consentSourceContentId,
                                vars: {
                                    linkStart: Vu.sellShareDataSetting.linkStart,
                                    linkEnd: Vu.sellShareDataSetting.linkEnd
                                }
                            }];
                        case Zs.allowMarketingEmailCheckboxEmailVerification:
                            return [{
                                consentStringTemplate: t(Vu.allowMarketingEmailCheckboxEmailVerification.consentTranslationKey),
                                sourceContentId: Vu.allowMarketingEmailCheckboxEmailVerification.consentSourceContentId
                            }];
                        case Zs.voiceDataConsentSetting:
                            return [{
                                consentStringTemplate: t(Vu.voiceDataConsentSetting.titleTranslationKey),
                                sourceContentId: Vu.voiceDataConsentSetting.titleSourceContentId
                            }, {
                                consentStringTemplate: t(Vu.voiceDataConsentSetting.consentTranslationKey, {
                                    linkStart: Vu.voiceDataConsentSetting.linkStartParam,
                                    linkEnd: Vu.voiceDataConsentSetting.linkEndParam
                                }),
                                sourceContentId: Vu.voiceDataConsentSetting.consentSourceContentId,
                                vars: {
                                    linkStart: Vu.voiceDataConsentSetting.linkStart,
                                    linkEnd: Vu.voiceDataConsentSetting.linkEnd
                                }
                            }];
                        case Zs.voiceDataConsentSettingParentSide:
                            return [{
                                consentStringTemplate: t(Vu.voiceDataConsentSettingParentSide.titleTranslationKey),
                                sourceContentId: Vu.voiceDataConsentSettingParentSide.titleSourceContentId
                            }, {
                                consentStringTemplate: t(Vu.voiceDataConsentSettingParentSide.consentTranslationKey, {
                                    linkStart: Vu.voiceDataConsentSettingParentSide.linkStartParam,
                                    linkEnd: Vu.voiceDataConsentSettingParentSide.linkEndParam
                                }),
                                sourceContentId: Vu.voiceDataConsentSettingParentSide.consentSourceContentId,
                                vars: {
                                    linkStart: Vu.voiceDataConsentSettingParentSide.linkStart,
                                    linkEnd: Vu.voiceDataConsentSettingParentSide.linkEnd
                                }
                            }];
                        case Zs.whoCanPartyWithMe:
                        case Zs.whoCanPartyWithMeV2:
                        case Zs.whoCanPartyWithMeParentSide:
                        case Zs.whoCanPartyWithMeParentSideV2:
                        case Zs.whoCanPartyWithMeTrustedFriends:
                        case Zs.whoCanPartyWithMeTrustedFriendsV2:
                        case Zs.whoCanPartyWithMeParentSideRemovedComms:
                        case Zs.whoCanPartyWithMeParentSideRemovedCommsV2:
                        case Zs.whoCanUsePartyChatWithMe:
                        case Zs.whoCanUsePartyChatWithMeV2:
                        case Zs.whoCanUsePartyChatWithMeParentSide:
                        case Zs.whoCanUsePartyChatWithMeParentSideV2:
                        case Zs.whoCanUsePartyChatWithMeTrustedFriends:
                        case Zs.whoCanUsePartyChatWithMeTrustedFriendsV2:
                        case Zs.whoCanUsePartyChatWithMeParentSideTrustedFriends:
                        case Zs.whoCanUsePartyChatWithMeParentSideTrustedFriendsV2:
                        case Zs.whoCanUsePartyVoiceWithMe:
                        case Zs.whoCanUsePartyVoiceWithMeV2:
                        case Zs.whoCanUsePartyVoiceWithMeParentSide:
                        case Zs.whoCanUsePartyVoiceWithMeParentSideV2:
                        case Zs.whoCanUsePartyVoiceWithMeTrustedFriends:
                        case Zs.whoCanUsePartyVoiceWithMeTrustedFriendsV2:
                        case Zs.whoCanUsePartyVoiceWithMeParentSideTrustedFriends:
                        case Zs.whoCanUsePartyVoiceWithMeParentSideTrustedFriendsV2:
                            var o = Vu[e];
                            return [{
                                consentStringTemplate: t(o.pageTitleTranslationKey),
                                sourceContentId: o.pageTitleSourceContentId
                            }, {
                                consentStringTemplate: t(o.pageDescriptionTranslationKey),
                                sourceContentId: o.pageDescriptionSourceContentId
                            }, {
                                consentStringTemplate: t(o.titleTranslationKey),
                                sourceContentId: o.titleSourceContentId
                            }, {
                                consentStringTemplate: t(o.consentTranslationKey),
                                sourceContentId: o.consentSourceContentId
                            }];
                        case Zs.receiveRobuxTransferConsentCard:
                            return [{
                                consentStringTemplate: t(Vu.receiveRobuxTransferConsentCard.titleTranslationKey, {
                                    username: Vu.receiveRobuxTransferConsentCard.usernameParam,
                                    amount: Vu.receiveRobuxTransferConsentCard.amountParam
                                }),
                                sourceContentId: Vu.receiveRobuxTransferConsentCard.titleSourceContentId,
                                vars: {
                                    username: null == n ? void 0 : n.username,
                                    amount: null == n ? void 0 : n.amount
                                }
                            }, {
                                consentStringTemplate: t(Vu.receiveRobuxTransferConsentCard.descriptionTranslationKey, {
                                    robuxAmount: Vu.receiveRobuxTransferConsentCard.robuxAmountParam
                                }),
                                sourceContentId: Vu.receiveRobuxTransferConsentCard.descriptionSourceContentId,
                                vars: {
                                    robuxAmount: null == n ? void 0 : n.amount
                                }
                            }];
                        case Zs.sendRobuxTransferConsentCard:
                            return [{
                                consentStringTemplate: t(Vu.sendRobuxTransferConsentCard.titleTranslationKey, {
                                    username: Vu.sendRobuxTransferConsentCard.usernameParam,
                                    amount: Vu.sendRobuxTransferConsentCard.amountParam
                                }),
                                sourceContentId: Vu.sendRobuxTransferConsentCard.titleSourceContentId,
                                vars: {
                                    username: null == n ? void 0 : n.username,
                                    amount: null == n ? void 0 : n.amount
                                }
                            }, {
                                consentStringTemplate: t(Vu.sendRobuxTransferConsentCard.descriptionTranslationKey, {
                                    robuxAmount: Vu.sendRobuxTransferConsentCard.robuxAmountParam
                                }),
                                sourceContentId: Vu.sendRobuxTransferConsentCard.descriptionSourceContentId,
                                vars: {
                                    robuxAmount: null == n ? void 0 : n.amount
                                }
                            }];
                        case Zs.vpcRequestLinkSubjectToPC:
                        case Zs.vpcRequestLinkNotSubjectToPC:
                        case Zs.vpcRequestLinkDefault:
                            return r = Vu.vpcRequestLinkDefault, e === Zs.vpcRequestLinkSubjectToPC ? r = Vu.vpcRequestLinkSubjectToPC : e === Zs.vpcRequestLinkNotSubjectToPC && (r = Vu.vpcRequestLinkNotSubjectToPC), [{
                                consentStringTemplate: t(r.titleTranslationKey),
                                sourceContentId: r.titleSourceContentId
                            }, {
                                consentStringTemplate: t(r.descriptionTranslationKey, {
                                    lineBreak: r.lineBreakParam
                                }),
                                sourceContentId: r.descriptionSourceContentId,
                                vars: {
                                    lineBreak: r.lineBreak
                                }
                            }, {
                                consentStringTemplate: t(r.parentEmailLabelTranslationKey),
                                sourceContentId: r.parentEmailLabelSourceContentId
                            }, {
                                consentStringTemplate: t(r.parentEmailPlaceholderTranslationKey),
                                sourceContentId: r.parentEmailPlaceholderSourceContentId
                            }, {
                                consentStringTemplate: t(r.parentEmailFooterTranslationKey, {
                                    linkStart: r.linkStartParam,
                                    linkEnd: r.linkEndParam
                                }),
                                sourceContentId: r.parentEmailFooterSourceContentId,
                                vars: {
                                    linkStart: r.linkStart,
                                    linkEnd: r.linkEnd
                                }
                            }, {
                                consentStringTemplate: t(r.buttonTranslationKey),
                                sourceContentId: r.buttonSourceContentId
                            }];
                        case Zs.consentCenterAllowAction:
                            return [{
                                consentStringTemplate: t((r = Vu.consentCenterAllowAction).textTranslationKey, {
                                    actionName: r.actionNameParam
                                }),
                                sourceContentId: r.textSourceContentId,
                                vars: {
                                    actionName: null == n ? void 0 : n.actionName
                                }
                            }];
                        case Zs.consentCenterUpdateSettingNoValue:
                            return [{
                                consentStringTemplate: t((r = Vu.consentCenterUpdateSettingNoValue).textTranslationKey, {
                                    settingName: r.settingNameParam
                                }),
                                sourceContentId: r.textSourceContentId,
                                vars: {
                                    settingName: null == n ? void 0 : n.settingName
                                }
                            }];
                        case Zs.consentCenterUpdateSettingWithValue:
                            return [{
                                consentStringTemplate: t((r = Vu.consentCenterUpdateSettingWithValue).textTranslationKey, {
                                    settingName: r.settingNameParam,
                                    currentValue: r.currentValueParam,
                                    proposedValue: r.proposedValueParam
                                }),
                                sourceContentId: r.textSourceContentId,
                                vars: {
                                    settingName: null == n ? void 0 : n.settingName,
                                    currentValue: null == n ? void 0 : n.currentValue,
                                    proposedValue: null == n ? void 0 : n.proposedValue
                                }
                            }];
                        case Zs.allowMarketingEmailNotifications:
                            return [{
                                consentStringTemplate: t(Vu.allowMarketingEmailNotifications.pageHeadingTranslationKey),
                                sourceContentId: Vu.allowMarketingEmailNotifications.pageHeadingSourceContentId
                            }, {
                                consentStringTemplate: t(Vu.allowMarketingEmailNotifications.pageDescriptionTranslationKey),
                                sourceContentId: Vu.allowMarketingEmailNotifications.pageDescriptionSourceContentId
                            }, {
                                consentStringTemplate: t(Vu.allowMarketingEmailNotifications.labelTranslationKey),
                                sourceContentId: Vu.allowMarketingEmailNotifications.labelSourceContentId
                            }, {
                                consentStringTemplate: t(Vu.allowMarketingEmailNotifications.labelDescriptionTranslationKey),
                                sourceContentId: Vu.allowMarketingEmailNotifications.labelDescriptionSourceContentId
                            }];
                        default:
                            return []
                    }
                },
                Hu = function(e, t, n) {
                    var r = function(e, t, n) {
                            var r = zu({
                                content: e.reduce((function(e, t) {
                                    var n;
                                    return zu(zu({}, e), ((n = {})[t.sourceContentId] = zu({
                                        hash: vi.cryptoUtil.hashStringWithFnv1a32(t.consentStringTemplate)
                                    }, t.vars), n))
                                }), {}),
                                surface: t
                            }, n);
                            return r
                        }(e, t, n),
                        o = JSON.stringify(r);
                    return vi.cryptoUtil.stringToUrlSafeBase64(o)
                },
                Gu = function(e, t, n, r) {
                    return new(n || (n = Promise))((function(o, a) {
                        function i(e) {
                            try {
                                c(r.next(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function l(e) {
                            try {
                                c(r.throw(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function c(e) {
                            var t;
                            e.done ? o(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                                e(t)
                            }))).then(i, l)
                        }
                        c((r = r.apply(e, t || [])).next())
                    }))
                },
                Yu = function(e, t) {
                    var n, r, o, a, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    };
                    return a = {
                        next: l(0),
                        throw: l(1),
                        return: l(2)
                    }, "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                        return this
                    }), a;

                    function l(a) {
                        return function(l) {
                            return function(a) {
                                if (n) throw new TypeError("Generator is already executing.");
                                for (; i;) try {
                                    if (n = 1, r && (o = 2 & a[0] ? r.return : a[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, a[1])).done) return o;
                                    switch (r = 0, o && (a = [2 & a[0], o.value]), a[0]) {
                                        case 0:
                                        case 1:
                                            o = a;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: a[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, r = a[1], a = [0];
                                            continue;
                                        case 7:
                                            a = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = i.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== a[0] && 2 !== a[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === a[0] && (!o || a[1] > o[0] && a[1] < o[3])) {
                                                i.label = a[1];
                                                break
                                            }
                                            if (6 === a[0] && i.label < o[1]) {
                                                i.label = o[1], o = a;
                                                break
                                            }
                                            if (o && i.label < o[2]) {
                                                i.label = o[2], i.ops.push(a);
                                                break
                                            }
                                            o[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    a = t.call(e, i)
                                } catch (e) {
                                    a = [6, e], r = 0
                                } finally {
                                    n = o = 0
                                }
                                if (5 & a[0]) throw a[1];
                                return {
                                    value: a[0] ? a[1] : void 0,
                                    done: !0
                                }
                            }([a, l])
                        }
                    }
                },
                $u = function(e, t, n, r) {
                    var o = {
                        updateSettingWithAuditing: function(o, a, i) {
                            return Gu(void 0, void 0, void 0, (function() {
                                var l, c;
                                return Yu(this, (function(s) {
                                    switch (s.label) {
                                        case 0:
                                            l = qu(t, e, r), c = Hu(l, n, i), s.label = 1;
                                        case 1:
                                            return s.trys.push([1, 3, , 4]), [4, Bu(o, a, c)];
                                        case 2:
                                            return s.sent(), [3, 4];
                                        case 3:
                                            return s.sent(), [3, 4];
                                        case 4:
                                            return [2]
                                    }
                                }))
                            }))
                        },
                        getBase64EncodedAuditHeader: function(o) {
                            var a = qu(t, e, r);
                            return Hu(a, n, o)
                        }
                    };
                    return [function() {
                        var n;
                        switch (t) {
                            case Zs.phoneNumberDiscoverabilitySetting:
                                return n = Vu.phoneNumberDiscoverabilitySetting, {
                                    wordsOfConsent: {
                                        title: e(n.titleTranslationKey),
                                        consent: e(n.consentTranslationKey)
                                    }
                                };
                            case Zs.phoneNumberDiscoverabilitySettingParentSide:
                                return n = Vu.phoneNumberDiscoverabilitySettingParentSide, {
                                    wordsOfConsent: {
                                        title: e(n.titleTranslationKey),
                                        consent: e(n.consentTranslationKey)
                                    }
                                };
                            case Zs.phoneNumberDiscoverabilityUpsell:
                                return n = Vu.phoneNumberDiscoverabilityUpsell, {
                                    wordsOfConsent: {
                                        title: e(n.titleTranslationKey),
                                        consent: e(n.consentTranslationKey),
                                        actionButtonText: e(n.actionButtonTextTranslationKey),
                                        neutralButtonText: e(n.neutralButtonTextTranslationKey)
                                    }
                                };
                            case Zs.personalizedAdsSetting:
                                return n = Vu.personalizedAdsSetting, {
                                    wordsOfConsent: {
                                        title: e(n.titleTranslationKey),
                                        consent: e(n.consentTranslationKey, {
                                            linkStart: n.linkStart,
                                            linkEnd: n.linkEnd
                                        })
                                    }
                                };
                            case Zs.sellShareDataSetting:
                                return n = Vu.sellShareDataSetting, {
                                    wordsOfConsent: {
                                        title: e(n.titleTranslationKey),
                                        consent: e(n.consentTranslationKey, {
                                            linkStart: n.linkStart,
                                            linkEnd: n.linkEnd
                                        })
                                    }
                                };
                            case Zs.allowMarketingEmailCheckboxEmailVerification:
                                return n = Vu.allowMarketingEmailCheckboxEmailVerification, {
                                    wordsOfConsent: {
                                        consent: e(n.consentTranslationKey)
                                    }
                                };
                            case Zs.voiceDataConsentSetting:
                                return n = Vu.voiceDataConsentSetting, {
                                    wordsOfConsent: {
                                        title: e(n.titleTranslationKey),
                                        consent: e(n.consentTranslationKey, {
                                            linkStart: n.linkStart,
                                            linkEnd: n.linkEnd
                                        })
                                    }
                                };
                            case Zs.voiceDataConsentSettingParentSide:
                                return n = Vu.voiceDataConsentSettingParentSide, {
                                    wordsOfConsent: {
                                        title: e(n.titleTranslationKey),
                                        consent: e(n.consentTranslationKey, {
                                            linkStart: n.linkStart,
                                            linkEnd: n.linkEnd
                                        })
                                    }
                                };
                            case Zs.whoCanPartyWithMe:
                                return n = Vu.whoCanPartyWithMe, {
                                    wordsOfConsent: {
                                        pageTitle: e(n.pageTitleTranslationKey),
                                        pageDescription: e(n.pageDescriptionTranslationKey),
                                        title: e(n.titleTranslationKey),
                                        consent: e(n.consentTranslationKey)
                                    }
                                };
                            case Zs.whoCanPartyWithMeV2:
                                return n = Vu.whoCanPartyWithMeV2, {
                                    wordsOfConsent: {
                                        pageTitle: e(n.pageTitleTranslationKey),
                                        pageDescription: e(n.pageDescriptionTranslationKey),
                                        title: e(n.titleTranslationKey),
                                        consent: e(n.consentTranslationKey)
                                    }
                                };
                            case Zs.whoCanPartyWithMeParentSide:
                                return n = Vu.whoCanPartyWithMeParentSide, {
                                    wordsOfConsent: {
                                        pageTitle: e(n.pageTitleTranslationKey),
                                        pageDescription: e(n.pageDescriptionTranslationKey),
                                        title: e(n.titleTranslationKey),
                                        consent: e(n.consentTranslationKey)
                                    }
                                };
                            case Zs.whoCanPartyWithMeParentSideV2:
                                return n = Vu.whoCanPartyWithMeParentSideV2, {
                                    wordsOfConsent: {
                                        pageTitle: e(n.pageTitleTranslationKey),
                                        pageDescription: e(n.pageDescriptionTranslationKey),
                                        title: e(n.titleTranslationKey),
                                        consent: e(n.consentTranslationKey)
                                    }
                                };
                            case Zs.whoCanUsePartyChatWithMe:
                                return n = Vu.whoCanUsePartyChatWithMe, {
                                    wordsOfConsent: {
                                        pageTitle: e(n.pageTitleTranslationKey),
                                        pageDescription: e(n.pageDescriptionTranslationKey),
                                        title: e(n.titleTranslationKey),
                                        consent: e(n.consentTranslationKey)
                                    }
                                };
                            case Zs.whoCanUsePartyChatWithMeV2:
                                return n = Vu.whoCanUsePartyChatWithMeV2, {
                                    wordsOfConsent: {
                                        pageTitle: e(n.pageTitleTranslationKey),
                                        pageDescription: e(n.pageDescriptionTranslationKey),
                                        title: e(n.titleTranslationKey),
                                        consent: e(n.consentTranslationKey)
                                    }
                                };
                            case Zs.whoCanUsePartyChatWithMeParentSide:
                                return n = Vu.whoCanUsePartyChatWithMeParentSide, {
                                    wordsOfConsent: {
                                        pageTitle: e(n.pageTitleTranslationKey),
                                        pageDescription: e(n.pageDescriptionTranslationKey),
                                        title: e(n.titleTranslationKey),
                                        consent: e(n.consentTranslationKey)
                                    }
                                };
                            case Zs.whoCanUsePartyChatWithMeParentSideV2:
                                return n = Vu.whoCanUsePartyChatWithMeParentSideV2, {
                                    wordsOfConsent: {
                                        pageTitle: e(n.pageTitleTranslationKey),
                                        pageDescription: e(n.pageDescriptionTranslationKey),
                                        title: e(n.titleTranslationKey),
                                        consent: e(n.consentTranslationKey)
                                    }
                                };
                            case Zs.whoCanUsePartyVoiceWithMe:
                                return n = Vu.whoCanUsePartyVoiceWithMe, {
                                    wordsOfConsent: {
                                        pageTitle: e(n.pageTitleTranslationKey),
                                        pageDescription: e(n.pageDescriptionTranslationKey),
                                        title: e(n.titleTranslationKey),
                                        consent: e(n.consentTranslationKey)
                                    }
                                };
                            case Zs.whoCanUsePartyVoiceWithMeV2:
                                return n = Vu.whoCanUsePartyVoiceWithMeV2, {
                                    wordsOfConsent: {
                                        pageTitle: e(n.pageTitleTranslationKey),
                                        pageDescription: e(n.pageDescriptionTranslationKey),
                                        title: e(n.titleTranslationKey),
                                        consent: e(n.consentTranslationKey)
                                    }
                                };
                            case Zs.whoCanUsePartyVoiceWithMeParentSide:
                                return n = Vu.whoCanUsePartyVoiceWithMeParentSide, {
                                    wordsOfConsent: {
                                        pageTitle: e(n.pageTitleTranslationKey),
                                        pageDescription: e(n.pageDescriptionTranslationKey),
                                        title: e(n.titleTranslationKey),
                                        consent: e(n.consentTranslationKey)
                                    }
                                };
                            case Zs.whoCanUsePartyVoiceWithMeParentSideV2:
                                return n = Vu.whoCanUsePartyVoiceWithMeParentSideV2, {
                                    wordsOfConsent: {
                                        pageTitle: e(n.pageTitleTranslationKey),
                                        pageDescription: e(n.pageDescriptionTranslationKey),
                                        title: e(n.titleTranslationKey),
                                        consent: e(n.consentTranslationKey)
                                    }
                                };
                            case Zs.whoCanPartyWithMeTrustedFriends:
                                return n = Vu.whoCanPartyWithMeTrustedFriends, {
                                    wordsOfConsent: {
                                        pageTitle: e(n.pageTitleTranslationKey),
                                        pageDescription: e(n.pageDescriptionTranslationKey),
                                        title: e(n.titleTranslationKey),
                                        consent: e(n.consentTranslationKey)
                                    }
                                };
                            case Zs.whoCanPartyWithMeTrustedFriendsV2:
                                return n = Vu.whoCanPartyWithMeTrustedFriendsV2, {
                                    wordsOfConsent: {
                                        pageTitle: e(n.pageTitleTranslationKey),
                                        pageDescription: e(n.pageDescriptionTranslationKey),
                                        title: e(n.titleTranslationKey),
                                        consent: e(n.consentTranslationKey)
                                    }
                                };
                            case Zs.whoCanPartyWithMeParentSideRemovedComms:
                                return n = Vu.whoCanPartyWithMeParentSideRemovedComms, {
                                    wordsOfConsent: {
                                        pageTitle: e(n.pageTitleTranslationKey),
                                        pageDescription: e(n.pageDescriptionTranslationKey),
                                        title: e(n.titleTranslationKey),
                                        consent: e(n.consentTranslationKey)
                                    }
                                };
                            case Zs.whoCanPartyWithMeParentSideRemovedCommsV2:
                                return n = Vu.whoCanPartyWithMeParentSideRemovedCommsV2, {
                                    wordsOfConsent: {
                                        pageTitle: e(n.pageTitleTranslationKey),
                                        pageDescription: e(n.pageDescriptionTranslationKey),
                                        title: e(n.titleTranslationKey),
                                        consent: e(n.consentTranslationKey)
                                    }
                                };
                            case Zs.whoCanUsePartyChatWithMeTrustedFriends:
                                return n = Vu.whoCanUsePartyChatWithMeTrustedFriends, {
                                    wordsOfConsent: {
                                        pageTitle: e(n.pageTitleTranslationKey),
                                        pageDescription: e(n.pageDescriptionTranslationKey),
                                        title: e(n.titleTranslationKey),
                                        consent: e(n.consentTranslationKey)
                                    }
                                };
                            case Zs.whoCanUsePartyChatWithMeTrustedFriendsV2:
                                return n = Vu.whoCanUsePartyChatWithMeTrustedFriendsV2, {
                                    wordsOfConsent: {
                                        pageTitle: e(n.pageTitleTranslationKey),
                                        pageDescription: e(n.pageDescriptionTranslationKey),
                                        title: e(n.titleTranslationKey),
                                        consent: e(n.consentTranslationKey)
                                    }
                                };
                            case Zs.whoCanUsePartyChatWithMeParentSideTrustedFriends:
                                return n = Vu.whoCanUsePartyChatWithMeParentSideTrustedFriends, {
                                    wordsOfConsent: {
                                        pageTitle: e(n.pageTitleTranslationKey),
                                        pageDescription: e(n.pageDescriptionTranslationKey),
                                        title: e(n.titleTranslationKey),
                                        consent: e(n.consentTranslationKey)
                                    }
                                };
                            case Zs.whoCanUsePartyChatWithMeParentSideTrustedFriendsV2:
                                return n = Vu.whoCanUsePartyChatWithMeParentSideTrustedFriendsV2, {
                                    wordsOfConsent: {
                                        pageTitle: e(n.pageTitleTranslationKey),
                                        pageDescription: e(n.pageDescriptionTranslationKey),
                                        title: e(n.titleTranslationKey),
                                        consent: e(n.consentTranslationKey)
                                    }
                                };
                            case Zs.whoCanUsePartyVoiceWithMeTrustedFriends:
                                return n = Vu.whoCanUsePartyVoiceWithMeTrustedFriends, {
                                    wordsOfConsent: {
                                        pageTitle: e(n.pageTitleTranslationKey),
                                        pageDescription: e(n.pageDescriptionTranslationKey),
                                        title: e(n.titleTranslationKey),
                                        consent: e(n.consentTranslationKey)
                                    }
                                };
                            case Zs.whoCanUsePartyVoiceWithMeTrustedFriendsV2:
                                return n = Vu.whoCanUsePartyVoiceWithMeTrustedFriendsV2, {
                                    wordsOfConsent: {
                                        pageTitle: e(n.pageTitleTranslationKey),
                                        pageDescription: e(n.pageDescriptionTranslationKey),
                                        title: e(n.titleTranslationKey),
                                        consent: e(n.consentTranslationKey)
                                    }
                                };
                            case Zs.whoCanUsePartyVoiceWithMeParentSideTrustedFriends:
                                return n = Vu.whoCanUsePartyVoiceWithMeParentSideTrustedFriends, {
                                    wordsOfConsent: {
                                        pageTitle: e(n.pageTitleTranslationKey),
                                        pageDescription: e(n.pageDescriptionTranslationKey),
                                        title: e(n.titleTranslationKey),
                                        consent: e(n.consentTranslationKey)
                                    }
                                };
                            case Zs.whoCanUsePartyVoiceWithMeParentSideTrustedFriendsV2:
                                return n = Vu.whoCanUsePartyVoiceWithMeParentSideTrustedFriendsV2, {
                                    wordsOfConsent: {
                                        pageTitle: e(n.pageTitleTranslationKey),
                                        pageDescription: e(n.pageDescriptionTranslationKey),
                                        title: e(n.titleTranslationKey),
                                        consent: e(n.consentTranslationKey)
                                    }
                                };
                            case Zs.receiveRobuxTransferConsentCard:
                                return n = Vu.receiveRobuxTransferConsentCard, {
                                    wordsOfConsent: {
                                        title: e(n.titleTranslationKey, {
                                            username: null == r ? void 0 : r.username,
                                            amount: null == r ? void 0 : r.amount
                                        }),
                                        description: e(n.descriptionTranslationKey, {
                                            robuxAmount: null == r ? void 0 : r.amount
                                        })
                                    }
                                };
                            case Zs.sendRobuxTransferConsentCard:
                                return n = Vu.sendRobuxTransferConsentCard, {
                                    wordsOfConsent: {
                                        title: e(n.titleTranslationKey, {
                                            username: null == r ? void 0 : r.username,
                                            amount: null == r ? void 0 : r.amount
                                        }),
                                        description: e(n.descriptionTranslationKey, {
                                            robuxAmount: null == r ? void 0 : r.amount
                                        })
                                    }
                                };
                            case Zs.vpcRequestLinkSubjectToPC:
                            case Zs.vpcRequestLinkNotSubjectToPC:
                            case Zs.vpcRequestLinkDefault:
                                return n = Vu.vpcRequestLinkDefault, t === Zs.vpcRequestLinkSubjectToPC ? n = Vu.vpcRequestLinkSubjectToPC : t === Zs.vpcRequestLinkNotSubjectToPC && (n = Vu.vpcRequestLinkNotSubjectToPC), {
                                    wordsOfConsent: {
                                        title: e(n.titleTranslationKey),
                                        description: e(n.descriptionTranslationKey, {
                                            lineBreak: n.lineBreak
                                        }),
                                        textboxLabel: e(n.parentEmailLabelTranslationKey),
                                        placeholderText: e(n.parentEmailPlaceholderTranslationKey),
                                        footer: e(n.parentEmailFooterTranslationKey, {
                                            linkStart: n.linkStart,
                                            linkEnd: n.linkEnd
                                        }),
                                        button: e(n.buttonTranslationKey)
                                    }
                                };
                            case Zs.consentCenterAllowAction:
                                return n = Vu.consentCenterAllowAction, {
                                    wordsOfConsent: {
                                        text: e(n.textTranslationKey, {
                                            actionName: null == r ? void 0 : r.actionName
                                        })
                                    }
                                };
                            case Zs.consentCenterUpdateSettingNoValue:
                                return n = Vu.consentCenterUpdateSettingNoValue, {
                                    wordsOfConsent: {
                                        text: e(n.textTranslationKey, {
                                            settingName: null == r ? void 0 : r.settingName
                                        })
                                    }
                                };
                            case Zs.consentCenterUpdateSettingWithValue:
                                return n = Vu.consentCenterUpdateSettingWithValue, {
                                    wordsOfConsent: {
                                        text: e(n.textTranslationKey, {
                                            settingName: null == r ? void 0 : r.settingName,
                                            currentValue: null == r ? void 0 : r.currentValue,
                                            proposedValue: null == r ? void 0 : r.proposedValue
                                        })
                                    }
                                };
                            case Zs.allowMarketingEmailNotifications:
                                return n = Vu.allowMarketingEmailNotifications, {
                                    wordsOfConsent: {
                                        pageTitle: e(n.pageHeadingTranslationKey),
                                        pageDescription: e(n.pageDescriptionTranslationKey),
                                        title: e(n.labelTranslationKey),
                                        consent: e(n.labelDescriptionTranslationKey)
                                    }
                                };
                            default:
                                return
                        }
                    }(), o]
                },
                Ju = (0, s.withTranslations)((function(n) {
                    var r = n.translate;
                    return (0, e.useEffect)((function() {
                        o().LegallySensitiveContentService = {
                            useLegallySensitiveContentAndActions: function(e, t, n) {
                                return $u(r, e, t, n)
                            }
                        }
                    }), [r]), t().createElement("div", {
                        id: "legally-sensitive-content-component"
                    })
                }), {
                    common: ["CommonUI.Controls", "Feature.Parents", "Feature.AccountSettings"],
                    feature: "Feature.LegallySensitiveContent"
                }),
                Qu = null;
            var Xu = {
                    isEnabled: function() {
                        return null === Qu && (Qu = r.Guac.callBehaviour("app-policy").then((function(e) {
                            return !0 === (null == e ? void 0 : e.UseAmpV2WizardForVpc)
                        })).catch((function() {
                            return !1
                        }))), Qu
                    },
                    launch: function(e) {
                        var t = e.recourseAction,
                            n = e.parentConsentTypes,
                            r = e.recourseData,
                            o = e.onClose;
                        Xr({
                            flow: {
                                name: "VPC",
                                props: {
                                    recourseAction: t,
                                    consents: n,
                                    recourseData: r
                                }
                            },
                            surface: "AccessManagementUpsell"
                        }).then((function(e) {
                            ! function(e, t) {
                                var n;
                                void 0 !== t.reason && "Completed" !== t.reason && "Cancelled" !== t.reason && gi(ti.VerificationFailed, e, {
                                    error: "amp-v2-wizard VPC flow exited as " + t.reason,
                                    flowId: null !== (n = t.flowId) && void 0 !== n ? n : ""
                                })
                            }(t, e), o()
                        }), o)
                    }
                },
                Zu = Xu;
            var ed = (0, s.withTranslations)((function(e) {
                    var n = e.translate;
                    return t().createElement(A, {
                        store: kl
                    }, t().createElement(Pu, {
                        translate: n,
                        vpcV2Handoff: Zu
                    }), t().createElement(Ru, {
                        translate: n
                    }), t().createElement(Ju, {
                        translate: n
                    }), t().createElement(fo, null))
                }), {
                    common: ["CommonUI.Controls", "CommonUI.Features", "Amp.Upsell", "Amp.FAEUpsell", "Feature.Friends", "Feature.AccountSettings"],
                    feature: "Verification.Identity"
                }),
                td = function(e, t, n, r) {
                    return new(n || (n = Promise))((function(o, a) {
                        function i(e) {
                            try {
                                c(r.next(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function l(e) {
                            try {
                                c(r.throw(e))
                            } catch (e) {
                                a(e)
                            }
                        }

                        function c(e) {
                            var t;
                            e.done ? o(e.value) : (t = e.value, t instanceof n ? t : new n((function(e) {
                                e(t)
                            }))).then(i, l)
                        }
                        c((r = r.apply(e, t || [])).next())
                    }))
                },
                nd = function(e, t) {
                    var n, r, o, a, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    };
                    return a = {
                        next: l(0),
                        throw: l(1),
                        return: l(2)
                    }, "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                        return this
                    }), a;

                    function l(a) {
                        return function(l) {
                            return function(a) {
                                if (n) throw new TypeError("Generator is already executing.");
                                for (; i;) try {
                                    if (n = 1, r && (o = 2 & a[0] ? r.return : a[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, a[1])).done) return o;
                                    switch (r = 0, o && (a = [2 & a[0], o.value]), a[0]) {
                                        case 0:
                                        case 1:
                                            o = a;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: a[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, r = a[1], a = [0];
                                            continue;
                                        case 7:
                                            a = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = i.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== a[0] && 2 !== a[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === a[0] && (!o || a[1] > o[0] && a[1] < o[3])) {
                                                i.label = a[1];
                                                break
                                            }
                                            if (6 === a[0] && i.label < o[1]) {
                                                i.label = o[1], o = a;
                                                break
                                            }
                                            if (o && i.label < o[2]) {
                                                i.label = o[2], i.ops.push(a);
                                                break
                                            }
                                            o[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    a = t.call(e, i)
                                } catch (e) {
                                    a = [6, e], r = 0
                                } finally {
                                    n = o = 0
                                }
                                if (5 & a[0]) throw a[1];
                                return {
                                    value: a[0] ? a[1] : void 0,
                                    done: !0
                                }
                            }([a, l])
                        }
                    }
                },
                rd = function(e) {
                    var t = e.featureName,
                        n = e.redirectLink,
                        r = void 0 === n ? null : n,
                        o = e.ampFeatureCheckData,
                        a = void 0 === o ? [] : o,
                        i = e.isAsyncCall,
                        l = void 0 === i || i,
                        c = e.usePrologue,
                        s = void 0 !== c && c,
                        u = e.ampRecourseData,
                        d = void 0 === u ? null : u,
                        f = e.featureSpecificData,
                        p = void 0 === f ? null : f,
                        y = e.namespace,
                        h = void 0 === y ? null : y,
                        m = e.wizardIntent,
                        v = void 0 === m ? null : m;
                    return td(void 0, void 0, Promise, (function() {
                        return nd(this, (function(e) {
                            return [2, new Promise((function(e) {
                                var n = new CustomEvent(Nl, {
                                    detail: {
                                        featureName: t,
                                        redirectLink: r,
                                        ampFeatureCheckData: a,
                                        isAsyncCall: l,
                                        usePrologue: s,
                                        ampRecourseData: d,
                                        featureSpecificData: p,
                                        namespace: h,
                                        wizardIntent: v,
                                        closeCallback: function(t) {
                                            e(function(e) {
                                                return e === Za.Granted
                                            }(t))
                                        }
                                    }
                                });
                                window.dispatchEvent(n)
                            }))]
                        }))
                    }))
                };

            function od() {
                var e = document.getElementById(c);
                e ? (0, a.render)(t().createElement(ed, null), e) : window.requestAnimationFrame(od)
            }
            o().AccessManagementUpsellV2Service = {
                startAccessManagementUpsell: rd
            }, (0, l.ready)((function() {
                c && od()
            }))
        }()
}();
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/293ccbbf9f9afe4f4e08079ef59e78b6-accessManagementUpsellV2.bundle.min.js.map

/* Bundle detector */
window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("AccessManagementUpsellV2");