/*! For license information please see groupEvents.bundle.min.js.LICENSE.txt */ ! function() {
    var e = {
            26093: function(e, t, r) {
                "use strict";
                var n = r(39907),
                    o = r(4364);

                function i(e) {
                    return i = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(e) {
                        return typeof e
                    } : function(e) {
                        return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e
                    }, i(e)
                }

                function a(e, t) {
                    for (var r = 0; r < t.length; r++) {
                        var n = t[r];
                        n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, (o = n.key, a = void 0, a = function(e, t) {
                            if ("object" !== i(e) || null === e) return e;
                            var r = e[Symbol.toPrimitive];
                            if (void 0 !== r) {
                                var n = r.call(e, t || "default");
                                if ("object" !== i(n)) return n;
                                throw new TypeError("@@toPrimitive must return a primitive value.")
                            }
                            return ("string" === t ? String : Number)(e)
                        }(o, "string"), "symbol" === i(a) ? a : String(a)), n)
                    }
                    var o, a
                }

                function u(e, t, r) {
                    return t && a(e.prototype, t), r && a(e, r), Object.defineProperty(e, "prototype", {
                        writable: !1
                    }), e
                }
                var c, l, s = r(41342).codes,
                    f = s.ERR_AMBIGUOUS_ARGUMENT,
                    p = s.ERR_INVALID_ARG_TYPE,
                    d = s.ERR_INVALID_ARG_VALUE,
                    y = s.ERR_INVALID_RETURN_VALUE,
                    v = s.ERR_MISSING_ARGS,
                    m = r(49801),
                    h = r(49208).inspect,
                    g = r(49208).types,
                    b = g.isPromise,
                    w = g.isRegExp,
                    S = r(80183)(),
                    A = r(91911)(),
                    x = r(45356)("RegExp.prototype.test");
                new Map;

                function E() {
                    var e = r(5656);
                    c = e.isDeepEqual, l = e.isDeepStrictEqual
                }
                var O = !1,
                    P = e.exports = C,
                    j = {};

                function R(e) {
                    if (e.message instanceof Error) throw e.message;
                    throw new m(e)
                }

                function I(e, t, r, n) {
                    if (!r) {
                        var o = !1;
                        if (0 === t) o = !0, n = "No value argument passed to `assert.ok()`";
                        else if (n instanceof Error) throw n;
                        var i = new m({
                            actual: r,
                            expected: !0,
                            message: n,
                            operator: "==",
                            stackStartFn: e
                        });
                        throw i.generatedMessage = o, i
                    }
                }

                function C() {
                    for (var e = arguments.length, t = new Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    I.apply(void 0, [C, t.length].concat(t))
                }
                P.fail = function e(t, r, i, a, u) {
                    var c, l = arguments.length;
                    if (0 === l) c = "Failed";
                    else if (1 === l) i = t, t = void 0;
                    else {
                        if (!1 === O) O = !0, (n.emitWarning ? n.emitWarning : o.warn.bind(o))("assert.fail() with more than one argument is deprecated. Please use assert.strictEqual() instead or only pass a message.", "DeprecationWarning", "DEP0094");
                        2 === l && (a = "!=")
                    }
                    if (i instanceof Error) throw i;
                    var s = {
                        actual: t,
                        expected: r,
                        operator: void 0 === a ? "fail" : a,
                        stackStartFn: u || e
                    };
                    void 0 !== i && (s.message = i);
                    var f = new m(s);
                    throw c && (f.message = c, f.generatedMessage = !0), f
                }, P.AssertionError = m, P.ok = C, P.equal = function e(t, r, n) {
                    if (arguments.length < 2) throw new v("actual", "expected");
                    t != r && R({
                        actual: t,
                        expected: r,
                        message: n,
                        operator: "==",
                        stackStartFn: e
                    })
                }, P.notEqual = function e(t, r, n) {
                    if (arguments.length < 2) throw new v("actual", "expected");
                    t == r && R({
                        actual: t,
                        expected: r,
                        message: n,
                        operator: "!=",
                        stackStartFn: e
                    })
                }, P.deepEqual = function e(t, r, n) {
                    if (arguments.length < 2) throw new v("actual", "expected");
                    void 0 === c && E(), c(t, r) || R({
                        actual: t,
                        expected: r,
                        message: n,
                        operator: "deepEqual",
                        stackStartFn: e
                    })
                }, P.notDeepEqual = function e(t, r, n) {
                    if (arguments.length < 2) throw new v("actual", "expected");
                    void 0 === c && E(), c(t, r) && R({
                        actual: t,
                        expected: r,
                        message: n,
                        operator: "notDeepEqual",
                        stackStartFn: e
                    })
                }, P.deepStrictEqual = function e(t, r, n) {
                    if (arguments.length < 2) throw new v("actual", "expected");
                    void 0 === c && E(), l(t, r) || R({
                        actual: t,
                        expected: r,
                        message: n,
                        operator: "deepStrictEqual",
                        stackStartFn: e
                    })
                }, P.notDeepStrictEqual = function e(t, r, n) {
                    if (arguments.length < 2) throw new v("actual", "expected");
                    void 0 === c && E();
                    l(t, r) && R({
                        actual: t,
                        expected: r,
                        message: n,
                        operator: "notDeepStrictEqual",
                        stackStartFn: e
                    })
                }, P.strictEqual = function e(t, r, n) {
                    if (arguments.length < 2) throw new v("actual", "expected");
                    A(t, r) || R({
                        actual: t,
                        expected: r,
                        message: n,
                        operator: "strictEqual",
                        stackStartFn: e
                    })
                }, P.notStrictEqual = function e(t, r, n) {
                    if (arguments.length < 2) throw new v("actual", "expected");
                    A(t, r) && R({
                        actual: t,
                        expected: r,
                        message: n,
                        operator: "notStrictEqual",
                        stackStartFn: e
                    })
                };
                var k = u((function e(t, r, n) {
                    var o = this;
                    ! function(e, t) {
                        if (!(e instanceof t)) throw new TypeError("Cannot call a class as a function")
                    }(this, e), r.forEach((function(e) {
                        e in t && (void 0 !== n && "string" == typeof n[e] && w(t[e]) && x(t[e], n[e]) ? o[e] = n[e] : o[e] = t[e])
                    }))
                }));

                function F(e, t, r, n) {
                    if ("function" != typeof t) {
                        if (w(t)) return x(t, e);
                        if (2 === arguments.length) throw new p("expected", ["Function", "RegExp"], t);
                        if ("object" !== i(e) || null === e) {
                            var o = new m({
                                actual: e,
                                expected: t,
                                message: r,
                                operator: "deepStrictEqual",
                                stackStartFn: n
                            });
                            throw o.operator = n.name, o
                        }
                        var a = Object.keys(t);
                        if (t instanceof Error) a.push("name", "message");
                        else if (0 === a.length) throw new d("error", t, "may not be an empty object");
                        return void 0 === c && E(), a.forEach((function(o) {
                            "string" == typeof e[o] && w(t[o]) && x(t[o], e[o]) || function(e, t, r, n, o, i) {
                                if (!(r in e) || !l(e[r], t[r])) {
                                    if (!n) {
                                        var a = new k(e, o),
                                            u = new k(t, o, e),
                                            c = new m({
                                                actual: a,
                                                expected: u,
                                                operator: "deepStrictEqual",
                                                stackStartFn: i
                                            });
                                        throw c.actual = e, c.expected = t, c.operator = i.name, c
                                    }
                                    R({
                                        actual: e,
                                        expected: t,
                                        message: n,
                                        operator: i.name,
                                        stackStartFn: i
                                    })
                                }
                            }(e, t, o, r, a, n)
                        })), !0
                    }
                    return void 0 !== t.prototype && e instanceof t || !Error.isPrototypeOf(t) && !0 === t.call({}, e)
                }

                function N(e) {
                    if ("function" != typeof e) throw new p("fn", "Function", e);
                    try {
                        e()
                    } catch (e) {
                        return e
                    }
                    return j
                }

                function T(e) {
                    return b(e) || null !== e && "object" === i(e) && "function" == typeof e.then && "function" == typeof e.catch
                }

                function _(e) {
                    return Promise.resolve().then((function() {
                        var t;
                        if ("function" == typeof e) {
                            if (!T(t = e())) throw new y("instance of Promise", "promiseFn", t)
                        } else {
                            if (!T(e)) throw new p("promiseFn", ["Function", "Promise"], e);
                            t = e
                        }
                        return Promise.resolve().then((function() {
                            return t
                        })).then((function() {
                            return j
                        })).catch((function(e) {
                            return e
                        }))
                    }))
                }

                function D(e, t, r, n) {
                    if ("string" == typeof r) {
                        if (4 === arguments.length) throw new p("error", ["Object", "Error", "Function", "RegExp"], r);
                        if ("object" === i(t) && null !== t) {
                            if (t.message === r) throw new f("error/message", 'The error message "'.concat(t.message, '" is identical to the message.'))
                        } else if (t === r) throw new f("error/message", 'The error "'.concat(t, '" is identical to the message.'));
                        n = r, r = void 0
                    } else if (null != r && "object" !== i(r) && "function" != typeof r) throw new p("error", ["Object", "Error", "Function", "RegExp"], r);
                    if (t === j) {
                        var o = "";
                        r && r.name && (o += " (".concat(r.name, ")")), o += n ? ": ".concat(n) : ".";
                        var a = "rejects" === e.name ? "rejection" : "exception";
                        R({
                            actual: void 0,
                            expected: r,
                            operator: e.name,
                            message: "Missing expected ".concat(a).concat(o),
                            stackStartFn: e
                        })
                    }
                    if (r && !F(t, r, n, e)) throw t
                }

                function M(e, t, r, n) {
                    if (t !== j) {
                        if ("string" == typeof r && (n = r, r = void 0), !r || F(t, r)) {
                            var o = n ? ": ".concat(n) : ".",
                                i = "doesNotReject" === e.name ? "rejection" : "exception";
                            R({
                                actual: t,
                                expected: r,
                                operator: e.name,
                                message: "Got unwanted ".concat(i).concat(o, "\n") + 'Actual message: "'.concat(t && t.message, '"'),
                                stackStartFn: e
                            })
                        }
                        throw t
                    }
                }

                function U(e, t, r, n, o) {
                    if (!w(t)) throw new p("regexp", "RegExp", t);
                    var a = "match" === o;
                    if ("string" != typeof e || x(t, e) !== a) {
                        if (r instanceof Error) throw r;
                        var u = !r;
                        r = r || ("string" != typeof e ? 'The "string" argument must be of type string. Received type ' + "".concat(i(e), " (").concat(h(e), ")") : (a ? "The input did not match the regular expression " : "The input was expected to not match the regular expression ") + "".concat(h(t), ". Input:\n\n").concat(h(e), "\n"));
                        var c = new m({
                            actual: e,
                            expected: t,
                            message: r,
                            operator: o,
                            stackStartFn: n
                        });
                        throw c.generatedMessage = u, c
                    }
                }

                function B() {
                    for (var e = arguments.length, t = new Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    I.apply(void 0, [B, t.length].concat(t))
                }
                P.throws = function e(t) {
                    for (var r = arguments.length, n = new Array(r > 1 ? r - 1 : 0), o = 1; o < r; o++) n[o - 1] = arguments[o];
                    D.apply(void 0, [e, N(t)].concat(n))
                }, P.rejects = function e(t) {
                    for (var r = arguments.length, n = new Array(r > 1 ? r - 1 : 0), o = 1; o < r; o++) n[o - 1] = arguments[o];
                    return _(t).then((function(t) {
                        return D.apply(void 0, [e, t].concat(n))
                    }))
                }, P.doesNotThrow = function e(t) {
                    for (var r = arguments.length, n = new Array(r > 1 ? r - 1 : 0), o = 1; o < r; o++) n[o - 1] = arguments[o];
                    M.apply(void 0, [e, N(t)].concat(n))
                }, P.doesNotReject = function e(t) {
                    for (var r = arguments.length, n = new Array(r > 1 ? r - 1 : 0), o = 1; o < r; o++) n[o - 1] = arguments[o];
                    return _(t).then((function(t) {
                        return M.apply(void 0, [e, t].concat(n))
                    }))
                }, P.ifError = function e(t) {
                    if (null != t) {
                        var r = "ifError got unwanted exception: ";
                        "object" === i(t) && "string" == typeof t.message ? 0 === t.message.length && t.constructor ? r += t.constructor.name : r += t.message : r += h(t);
                        var n = new m({
                                actual: t,
                                expected: null,
                                operator: "ifError",
                                message: r,
                                stackStartFn: e
                            }),
                            o = t.stack;
                        if ("string" == typeof o) {
                            var a = o.split("\n");
                            a.shift();
                            for (var u = n.stack.split("\n"), c = 0; c < a.length; c++) {
                                var l = u.indexOf(a[c]);
                                if (-1 !== l) {
                                    u = u.slice(0, l);
                                    break
                                }
                            }
                            n.stack = "".concat(u.join("\n"), "\n").concat(a.join("\n"))
                        }
                        throw n
                    }
                }, P.match = function e(t, r, n) {
                    U(t, r, n, e, "match")
                }, P.doesNotMatch = function e(t, r, n) {
                    U(t, r, n, e, "doesNotMatch")
                }, P.strict = S(B, P, {
                    equal: P.strictEqual,
                    deepEqual: P.deepStrictEqual,
                    notEqual: P.notStrictEqual,
                    notDeepEqual: P.notDeepStrictEqual
                }), P.strict.strict = P.strict
            },
            49801: function(e, t, r) {
                "use strict";
                var n = r(39907);

                function o(e, t) {
                    var r = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var n = Object.getOwnPropertySymbols(e);
                        t && (n = n.filter((function(t) {
                            return Object.getOwnPropertyDescriptor(e, t).enumerable
                        }))), r.push.apply(r, n)
                    }
                    return r
                }

                function i(e) {
                    for (var t = 1; t < arguments.length; t++) {
                        var r = null != arguments[t] ? arguments[t] : {};
                        t % 2 ? o(Object(r), !0).forEach((function(t) {
                            a(e, t, r[t])
                        })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(r)) : o(Object(r)).forEach((function(t) {
                            Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(r, t))
                        }))
                    }
                    return e
                }

                function a(e, t, r) {
                    return (t = c(t)) in e ? Object.defineProperty(e, t, {
                        value: r,
                        enumerable: !0,
                        configurable: !0,
                        writable: !0
                    }) : e[t] = r, e
                }

                function u(e, t) {
                    for (var r = 0; r < t.length; r++) {
                        var n = t[r];
                        n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, c(n.key), n)
                    }
                }

                function c(e) {
                    var t = function(e, t) {
                        if ("object" !== m(e) || null === e) return e;
                        var r = e[Symbol.toPrimitive];
                        if (void 0 !== r) {
                            var n = r.call(e, t || "default");
                            if ("object" !== m(n)) return n;
                            throw new TypeError("@@toPrimitive must return a primitive value.")
                        }
                        return ("string" === t ? String : Number)(e)
                    }(e, "string");
                    return "symbol" === m(t) ? t : String(t)
                }

                function l(e, t) {
                    if (t && ("object" === m(t) || "function" == typeof t)) return t;
                    if (void 0 !== t) throw new TypeError("Derived constructors may only return object or undefined");
                    return s(e)
                }

                function s(e) {
                    if (void 0 === e) throw new ReferenceError("this hasn't been initialised - super() hasn't been called");
                    return e
                }

                function f(e) {
                    var t = "function" == typeof Map ? new Map : void 0;
                    return f = function(e) {
                        if (null === e || (r = e, -1 === Function.toString.call(r).indexOf("[native code]"))) return e;
                        var r;
                        if ("function" != typeof e) throw new TypeError("Super expression must either be null or a function");
                        if (void 0 !== t) {
                            if (t.has(e)) return t.get(e);
                            t.set(e, n)
                        }

                        function n() {
                            return p(e, arguments, v(this).constructor)
                        }
                        return n.prototype = Object.create(e.prototype, {
                            constructor: {
                                value: n,
                                enumerable: !1,
                                writable: !0,
                                configurable: !0
                            }
                        }), y(n, e)
                    }, f(e)
                }

                function p(e, t, r) {
                    return p = d() ? Reflect.construct.bind() : function(e, t, r) {
                        var n = [null];
                        n.push.apply(n, t);
                        var o = new(Function.bind.apply(e, n));
                        return r && y(o, r.prototype), o
                    }, p.apply(null, arguments)
                }

                function d() {
                    if ("undefined" == typeof Reflect || !Reflect.construct) return !1;
                    if (Reflect.construct.sham) return !1;
                    if ("function" == typeof Proxy) return !0;
                    try {
                        return Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], (function() {}))), !0
                    } catch (e) {
                        return !1
                    }
                }

                function y(e, t) {
                    return y = Object.setPrototypeOf ? Object.setPrototypeOf.bind() : function(e, t) {
                        return e.__proto__ = t, e
                    }, y(e, t)
                }

                function v(e) {
                    return v = Object.setPrototypeOf ? Object.getPrototypeOf.bind() : function(e) {
                        return e.__proto__ || Object.getPrototypeOf(e)
                    }, v(e)
                }

                function m(e) {
                    return m = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(e) {
                        return typeof e
                    } : function(e) {
                        return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e
                    }, m(e)
                }
                var h = r(49208).inspect,
                    g = r(41342).codes.ERR_INVALID_ARG_TYPE;

                function b(e, t, r) {
                    return (void 0 === r || r > e.length) && (r = e.length), e.substring(r - t.length, r) === t
                }
                var w = "",
                    S = "",
                    A = "",
                    x = "",
                    E = {
                        deepStrictEqual: "Expected values to be strictly deep-equal:",
                        strictEqual: "Expected values to be strictly equal:",
                        strictEqualObject: 'Expected "actual" to be reference-equal to "expected":',
                        deepEqual: "Expected values to be loosely deep-equal:",
                        equal: "Expected values to be loosely equal:",
                        notDeepStrictEqual: 'Expected "actual" not to be strictly deep-equal to:',
                        notStrictEqual: 'Expected "actual" to be strictly unequal to:',
                        notStrictEqualObject: 'Expected "actual" not to be reference-equal to "expected":',
                        notDeepEqual: 'Expected "actual" not to be loosely deep-equal to:',
                        notEqual: 'Expected "actual" to be loosely unequal to:',
                        notIdentical: "Values identical but not reference-equal:"
                    };

                function O(e) {
                    var t = Object.keys(e),
                        r = Object.create(Object.getPrototypeOf(e));
                    return t.forEach((function(t) {
                        r[t] = e[t]
                    })), Object.defineProperty(r, "message", {
                        value: e.message
                    }), r
                }

                function P(e) {
                    return h(e, {
                        compact: !1,
                        customInspect: !1,
                        depth: 1e3,
                        maxArrayLength: 1 / 0,
                        showHidden: !1,
                        breakLength: 1 / 0,
                        showProxy: !1,
                        sorted: !0,
                        getters: !0
                    })
                }

                function j(e, t, r) {
                    var o = "",
                        i = "",
                        a = 0,
                        u = "",
                        c = !1,
                        l = P(e),
                        s = l.split("\n"),
                        f = P(t).split("\n"),
                        p = 0,
                        d = "";
                    if ("strictEqual" === r && "object" === m(e) && "object" === m(t) && null !== e && null !== t && (r = "strictEqualObject"), 1 === s.length && 1 === f.length && s[0] !== f[0]) {
                        var y = s[0].length + f[0].length;
                        if (y <= 10) {
                            if (!("object" === m(e) && null !== e || "object" === m(t) && null !== t || 0 === e && 0 === t)) return "".concat(E[r], "\n\n") + "".concat(s[0], " !== ").concat(f[0], "\n")
                        } else if ("strictEqualObject" !== r) {
                            if (y < (n.stderr && n.stderr.isTTY ? n.stderr.columns : 80)) {
                                for (; s[0][p] === f[0][p];) p++;
                                p > 2 && (d = "\n  ".concat(function(e, t) {
                                    if (t = Math.floor(t), 0 == e.length || 0 == t) return "";
                                    var r = e.length * t;
                                    for (t = Math.floor(Math.log(t) / Math.log(2)); t;) e += e, t--;
                                    return e + e.substring(0, r - e.length)
                                }(" ", p), "^"), p = 0)
                            }
                        }
                    }
                    for (var v = s[s.length - 1], h = f[f.length - 1]; v === h && (p++ < 2 ? u = "\n  ".concat(v).concat(u) : o = v, s.pop(), f.pop(), 0 !== s.length && 0 !== f.length);) v = s[s.length - 1], h = f[f.length - 1];
                    var g = Math.max(s.length, f.length);
                    if (0 === g) {
                        var O = l.split("\n");
                        if (O.length > 30)
                            for (O[26] = "".concat(w, "...").concat(x); O.length > 27;) O.pop();
                        return "".concat(E.notIdentical, "\n\n").concat(O.join("\n"), "\n")
                    }
                    p > 3 && (u = "\n".concat(w, "...").concat(x).concat(u), c = !0), "" !== o && (u = "\n  ".concat(o).concat(u), o = "");
                    var j = 0,
                        R = E[r] + "\n".concat(S, "+ actual").concat(x, " ").concat(A, "- expected").concat(x),
                        I = " ".concat(w, "...").concat(x, " Lines skipped");
                    for (p = 0; p < g; p++) {
                        var C = p - a;
                        if (s.length < p + 1) C > 1 && p > 2 && (C > 4 ? (i += "\n".concat(w, "...").concat(x), c = !0) : C > 3 && (i += "\n  ".concat(f[p - 2]), j++), i += "\n  ".concat(f[p - 1]), j++), a = p, o += "\n".concat(A, "-").concat(x, " ").concat(f[p]), j++;
                        else if (f.length < p + 1) C > 1 && p > 2 && (C > 4 ? (i += "\n".concat(w, "...").concat(x), c = !0) : C > 3 && (i += "\n  ".concat(s[p - 2]), j++), i += "\n  ".concat(s[p - 1]), j++), a = p, i += "\n".concat(S, "+").concat(x, " ").concat(s[p]), j++;
                        else {
                            var k = f[p],
                                F = s[p],
                                N = F !== k && (!b(F, ",") || F.slice(0, -1) !== k);
                            N && b(k, ",") && k.slice(0, -1) === F && (N = !1, F += ","), N ? (C > 1 && p > 2 && (C > 4 ? (i += "\n".concat(w, "...").concat(x), c = !0) : C > 3 && (i += "\n  ".concat(s[p - 2]), j++), i += "\n  ".concat(s[p - 1]), j++), a = p, i += "\n".concat(S, "+").concat(x, " ").concat(F), o += "\n".concat(A, "-").concat(x, " ").concat(k), j += 2) : (i += o, o = "", 1 !== C && 0 !== p || (i += "\n  ".concat(F), j++))
                        }
                        if (j > 20 && p < g - 2) return "".concat(R).concat(I, "\n").concat(i, "\n").concat(w, "...").concat(x).concat(o, "\n") + "".concat(w, "...").concat(x)
                    }
                    return "".concat(R).concat(c ? I : "", "\n").concat(i).concat(o).concat(u).concat(d)
                }
                var R = function(e, t) {
                    ! function(e, t) {
                        if ("function" != typeof t && null !== t) throw new TypeError("Super expression must either be null or a function");
                        e.prototype = Object.create(t && t.prototype, {
                            constructor: {
                                value: e,
                                writable: !0,
                                configurable: !0
                            }
                        }), Object.defineProperty(e, "prototype", {
                            writable: !1
                        }), t && y(e, t)
                    }(b, e);
                    var r, o, a, c, f, p = (r = b, o = d(), function() {
                        var e, t = v(r);
                        if (o) {
                            var n = v(this).constructor;
                            e = Reflect.construct(t, arguments, n)
                        } else e = t.apply(this, arguments);
                        return l(this, e)
                    });

                    function b(e) {
                        var t;
                        if (function(e, t) {
                                if (!(e instanceof t)) throw new TypeError("Cannot call a class as a function")
                            }(this, b), "object" !== m(e) || null === e) throw new g("options", "Object", e);
                        var r = e.message,
                            o = e.operator,
                            i = e.stackStartFn,
                            a = e.actual,
                            u = e.expected,
                            c = Error.stackTraceLimit;
                        if (Error.stackTraceLimit = 0, null != r) t = p.call(this, String(r));
                        else if (n.stderr && n.stderr.isTTY && (n.stderr && n.stderr.getColorDepth && 1 !== n.stderr.getColorDepth() ? (w = "[34m", S = "[32m", x = "[39m", A = "[31m") : (w = "", S = "", x = "", A = "")), "object" === m(a) && null !== a && "object" === m(u) && null !== u && "stack" in a && a instanceof Error && "stack" in u && u instanceof Error && (a = O(a), u = O(u)), "deepStrictEqual" === o || "strictEqual" === o) t = p.call(this, j(a, u, o));
                        else if ("notDeepStrictEqual" === o || "notStrictEqual" === o) {
                            var f = E[o],
                                d = P(a).split("\n");
                            if ("notStrictEqual" === o && "object" === m(a) && null !== a && (f = E.notStrictEqualObject), d.length > 30)
                                for (d[26] = "".concat(w, "...").concat(x); d.length > 27;) d.pop();
                            t = 1 === d.length ? p.call(this, "".concat(f, " ").concat(d[0])) : p.call(this, "".concat(f, "\n\n").concat(d.join("\n"), "\n"))
                        } else {
                            var y = P(a),
                                v = "",
                                h = E[o];
                            "notDeepEqual" === o || "notEqual" === o ? (y = "".concat(E[o], "\n\n").concat(y)).length > 1024 && (y = "".concat(y.slice(0, 1021), "...")) : (v = "".concat(P(u)), y.length > 512 && (y = "".concat(y.slice(0, 509), "...")), v.length > 512 && (v = "".concat(v.slice(0, 509), "...")), "deepEqual" === o || "equal" === o ? y = "".concat(h, "\n\n").concat(y, "\n\nshould equal\n\n") : v = " ".concat(o, " ").concat(v)), t = p.call(this, "".concat(y).concat(v))
                        }
                        return Error.stackTraceLimit = c, t.generatedMessage = !r, Object.defineProperty(s(t), "name", {
                            value: "AssertionError [ERR_ASSERTION]",
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }), t.code = "ERR_ASSERTION", t.actual = a, t.expected = u, t.operator = o, Error.captureStackTrace && Error.captureStackTrace(s(t), i), t.stack, t.name = "AssertionError", l(t)
                    }
                    return a = b, (c = [{
                        key: "toString",
                        value: function() {
                            return "".concat(this.name, " [").concat(this.code, "]: ").concat(this.message)
                        }
                    }, {
                        key: t,
                        value: function(e, t) {
                            return h(this, i(i({}, t), {}, {
                                customInspect: !1,
                                depth: 0
                            }))
                        }
                    }]) && u(a.prototype, c), f && u(a, f), Object.defineProperty(a, "prototype", {
                        writable: !1
                    }), b
                }(f(Error), h.custom);
                e.exports = R
            },
            41342: function(e, t, r) {
                "use strict";

                function n(e) {
                    return n = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(e) {
                        return typeof e
                    } : function(e) {
                        return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e
                    }, n(e)
                }

                function o(e, t) {
                    for (var r = 0; r < t.length; r++) {
                        var o = t[r];
                        o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(e, (i = o.key, a = void 0, a = function(e, t) {
                            if ("object" !== n(e) || null === e) return e;
                            var r = e[Symbol.toPrimitive];
                            if (void 0 !== r) {
                                var o = r.call(e, t || "default");
                                if ("object" !== n(o)) return o;
                                throw new TypeError("@@toPrimitive must return a primitive value.")
                            }
                            return ("string" === t ? String : Number)(e)
                        }(i, "string"), "symbol" === n(a) ? a : String(a)), o)
                    }
                    var i, a
                }

                function i(e, t) {
                    return i = Object.setPrototypeOf ? Object.setPrototypeOf.bind() : function(e, t) {
                        return e.__proto__ = t, e
                    }, i(e, t)
                }

                function a(e) {
                    var t = function() {
                        if ("undefined" == typeof Reflect || !Reflect.construct) return !1;
                        if (Reflect.construct.sham) return !1;
                        if ("function" == typeof Proxy) return !0;
                        try {
                            return Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], (function() {}))), !0
                        } catch (e) {
                            return !1
                        }
                    }();
                    return function() {
                        var r, o = u(e);
                        if (t) {
                            var i = u(this).constructor;
                            r = Reflect.construct(o, arguments, i)
                        } else r = o.apply(this, arguments);
                        return function(e, t) {
                            if (t && ("object" === n(t) || "function" == typeof t)) return t;
                            if (void 0 !== t) throw new TypeError("Derived constructors may only return object or undefined");
                            return function(e) {
                                if (void 0 === e) throw new ReferenceError("this hasn't been initialised - super() hasn't been called");
                                return e
                            }(e)
                        }(this, r)
                    }
                }

                function u(e) {
                    return u = Object.setPrototypeOf ? Object.getPrototypeOf.bind() : function(e) {
                        return e.__proto__ || Object.getPrototypeOf(e)
                    }, u(e)
                }
                var c, l, s = {};

                function f(e, t, r) {
                    r || (r = Error);
                    var n = function(r) {
                        ! function(e, t) {
                            if ("function" != typeof t && null !== t) throw new TypeError("Super expression must either be null or a function");
                            e.prototype = Object.create(t && t.prototype, {
                                constructor: {
                                    value: e,
                                    writable: !0,
                                    configurable: !0
                                }
                            }), Object.defineProperty(e, "prototype", {
                                writable: !1
                            }), t && i(e, t)
                        }(s, r);
                        var n, u, c, l = a(s);

                        function s(r, n, o) {
                            var i;
                            return function(e, t) {
                                if (!(e instanceof t)) throw new TypeError("Cannot call a class as a function")
                            }(this, s), i = l.call(this, function(e, r, n) {
                                return "string" == typeof t ? t : t(e, r, n)
                            }(r, n, o)), i.code = e, i
                        }
                        return n = s, u && o(n.prototype, u), c && o(n, c), Object.defineProperty(n, "prototype", {
                            writable: !1
                        }), n
                    }(r);
                    s[e] = n
                }

                function p(e, t) {
                    if (Array.isArray(e)) {
                        var r = e.length;
                        return e = e.map((function(e) {
                            return String(e)
                        })), r > 2 ? "one of ".concat(t, " ").concat(e.slice(0, r - 1).join(", "), ", or ") + e[r - 1] : 2 === r ? "one of ".concat(t, " ").concat(e[0], " or ").concat(e[1]) : "of ".concat(t, " ").concat(e[0])
                    }
                    return "of ".concat(t, " ").concat(String(e))
                }
                f("ERR_AMBIGUOUS_ARGUMENT", 'The "%s" argument is ambiguous. %s', TypeError), f("ERR_INVALID_ARG_TYPE", (function(e, t, o) {
                    var i, a, u, l;
                    if (void 0 === c && (c = r(26093)), c("string" == typeof e, "'name' must be a string"), "string" == typeof t && (a = "not ", t.substr(!u || u < 0 ? 0 : +u, a.length) === a) ? (i = "must not be", t = t.replace(/^not /, "")) : i = "must be", function(e, t, r) {
                            return (void 0 === r || r > e.length) && (r = e.length), e.substring(r - t.length, r) === t
                        }(e, " argument")) l = "The ".concat(e, " ").concat(i, " ").concat(p(t, "type"));
                    else {
                        var s = function(e, t, r) {
                            return "number" != typeof r && (r = 0), !(r + t.length > e.length) && -1 !== e.indexOf(t, r)
                        }(e, ".") ? "property" : "argument";
                        l = 'The "'.concat(e, '" ').concat(s, " ").concat(i, " ").concat(p(t, "type"))
                    }
                    return l += ". Received type ".concat(n(o))
                }), TypeError), f("ERR_INVALID_ARG_VALUE", (function(e, t) {
                    var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "is invalid";
                    void 0 === l && (l = r(49208));
                    var o = l.inspect(t);
                    return o.length > 128 && (o = "".concat(o.slice(0, 128), "...")), "The argument '".concat(e, "' ").concat(n, ". Received ").concat(o)
                }), TypeError, RangeError), f("ERR_INVALID_RETURN_VALUE", (function(e, t, r) {
                    var o;
                    return o = r && r.constructor && r.constructor.name ? "instance of ".concat(r.constructor.name) : "type ".concat(n(r)), "Expected ".concat(e, ' to be returned from the "').concat(t, '"') + " function but got ".concat(o, ".")
                }), TypeError), f("ERR_MISSING_ARGS", (function() {
                    for (var e = arguments.length, t = new Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                    void 0 === c && (c = r(26093)), c(t.length > 0, "At least one arg needs to be specified");
                    var o = "The ",
                        i = t.length;
                    switch (t = t.map((function(e) {
                            return '"'.concat(e, '"')
                        })), i) {
                        case 1:
                            o += "".concat(t[0], " argument");
                            break;
                        case 2:
                            o += "".concat(t[0], " and ").concat(t[1], " arguments");
                            break;
                        default:
                            o += t.slice(0, i - 1).join(", "), o += ", and ".concat(t[i - 1], " arguments")
                    }
                    return "".concat(o, " must be specified")
                }), TypeError), e.exports.codes = s
            },
            5656: function(e, t, r) {
                "use strict";

                function n(e, t) {
                    return function(e) {
                        if (Array.isArray(e)) return e
                    }(e) || function(e, t) {
                        var r = null == e ? null : "undefined" != typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != r) {
                            var n, o, i, a, u = [],
                                c = !0,
                                l = !1;
                            try {
                                if (i = (r = r.call(e)).next, 0 === t) {
                                    if (Object(r) !== r) return;
                                    c = !1
                                } else
                                    for (; !(c = (n = i.call(r)).done) && (u.push(n.value), u.length !== t); c = !0);
                            } catch (e) {
                                l = !0, o = e
                            } finally {
                                try {
                                    if (!c && null != r.return && (a = r.return(), Object(a) !== a)) return
                                } finally {
                                    if (l) throw o
                                }
                            }
                            return u
                        }
                    }(e, t) || function(e, t) {
                        if (!e) return;
                        if ("string" == typeof e) return o(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        "Object" === r && e.constructor && (r = e.constructor.name);
                        if ("Map" === r || "Set" === r) return Array.from(e);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return o(e, t)
                    }(e, t) || function() {
                        throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }()
                }

                function o(e, t) {
                    (null == t || t > e.length) && (t = e.length);
                    for (var r = 0, n = new Array(t); r < t; r++) n[r] = e[r];
                    return n
                }

                function i(e) {
                    return i = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(e) {
                        return typeof e
                    } : function(e) {
                        return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e
                    }, i(e)
                }
                var a = void 0 !== /a/g.flags,
                    u = function(e) {
                        var t = [];
                        return e.forEach((function(e) {
                            return t.push(e)
                        })), t
                    },
                    c = function(e) {
                        var t = [];
                        return e.forEach((function(e, r) {
                            return t.push([r, e])
                        })), t
                    },
                    l = Object.is ? Object.is : r(28174),
                    s = Object.getOwnPropertySymbols ? Object.getOwnPropertySymbols : function() {
                        return []
                    },
                    f = Number.isNaN ? Number.isNaN : r(7838);

                function p(e) {
                    return e.call.bind(e)
                }
                var d = p(Object.prototype.hasOwnProperty),
                    y = p(Object.prototype.propertyIsEnumerable),
                    v = p(Object.prototype.toString),
                    m = r(49208).types,
                    h = m.isAnyArrayBuffer,
                    g = m.isArrayBufferView,
                    b = m.isDate,
                    w = m.isMap,
                    S = m.isRegExp,
                    A = m.isSet,
                    x = m.isNativeError,
                    E = m.isBoxedPrimitive,
                    O = m.isNumberObject,
                    P = m.isStringObject,
                    j = m.isBooleanObject,
                    R = m.isBigIntObject,
                    I = m.isSymbolObject,
                    C = m.isFloat32Array,
                    k = m.isFloat64Array;

                function F(e) {
                    if (0 === e.length || e.length > 10) return !0;
                    for (var t = 0; t < e.length; t++) {
                        var r = e.charCodeAt(t);
                        if (r < 48 || r > 57) return !0
                    }
                    return 10 === e.length && e >= Math.pow(2, 32)
                }

                function N(e) {
                    return Object.keys(e).filter(F).concat(s(e).filter(Object.prototype.propertyIsEnumerable.bind(e)))
                }

                function T(e, t) {
                    if (e === t) return 0;
                    for (var r = e.length, n = t.length, o = 0, i = Math.min(r, n); o < i; ++o)
                        if (e[o] !== t[o]) {
                            r = e[o], n = t[o];
                            break
                        } return r < n ? -1 : n < r ? 1 : 0
                }

                function _(e, t, r, n) {
                    if (e === t) return 0 !== e || (!r || l(e, t));
                    if (r) {
                        if ("object" !== i(e)) return "number" == typeof e && f(e) && f(t);
                        if ("object" !== i(t) || null === e || null === t) return !1;
                        if (Object.getPrototypeOf(e) !== Object.getPrototypeOf(t)) return !1
                    } else {
                        if (null === e || "object" !== i(e)) return (null === t || "object" !== i(t)) && e == t;
                        if (null === t || "object" !== i(t)) return !1
                    }
                    var o, u, c = v(e);
                    if (c !== v(t)) return !1;
                    if (Array.isArray(e)) {
                        if (e.length !== t.length) return !1;
                        var s = N(e),
                            p = N(t);
                        return s.length === p.length && M(e, t, r, n, 1, s)
                    }
                    if ("[object Object]" === c && (!w(e) && w(t) || !A(e) && A(t))) return !1;
                    if (b(e)) {
                        if (!b(t) || Date.prototype.getTime.call(e) !== Date.prototype.getTime.call(t)) return !1
                    } else if (S(e)) {
                        if (!S(t) || ! function(e, t) {
                                return a ? e.source === t.source && e.flags === t.flags : RegExp.prototype.toString.call(e) === RegExp.prototype.toString.call(t)
                            }(e, t)) return !1
                    } else if (x(e) || e instanceof Error) {
                        if (e.message !== t.message || e.name !== t.name) return !1
                    } else {
                        if (g(e)) {
                            if (r || !C(e) && !k(e)) {
                                if (! function(e, t) {
                                        return e.byteLength === t.byteLength && 0 === T(new Uint8Array(e.buffer, e.byteOffset, e.byteLength), new Uint8Array(t.buffer, t.byteOffset, t.byteLength))
                                    }(e, t)) return !1
                            } else if (! function(e, t) {
                                    if (e.byteLength !== t.byteLength) return !1;
                                    for (var r = 0; r < e.byteLength; r++)
                                        if (e[r] !== t[r]) return !1;
                                    return !0
                                }(e, t)) return !1;
                            var d = N(e),
                                y = N(t);
                            return d.length === y.length && M(e, t, r, n, 0, d)
                        }
                        if (A(e)) return !(!A(t) || e.size !== t.size) && M(e, t, r, n, 2);
                        if (w(e)) return !(!w(t) || e.size !== t.size) && M(e, t, r, n, 3);
                        if (h(e)) {
                            if (u = t, (o = e).byteLength !== u.byteLength || 0 !== T(new Uint8Array(o), new Uint8Array(u))) return !1
                        } else if (E(e) && ! function(e, t) {
                                return O(e) ? O(t) && l(Number.prototype.valueOf.call(e), Number.prototype.valueOf.call(t)) : P(e) ? P(t) && String.prototype.valueOf.call(e) === String.prototype.valueOf.call(t) : j(e) ? j(t) && Boolean.prototype.valueOf.call(e) === Boolean.prototype.valueOf.call(t) : R(e) ? R(t) && BigInt.prototype.valueOf.call(e) === BigInt.prototype.valueOf.call(t) : I(t) && Symbol.prototype.valueOf.call(e) === Symbol.prototype.valueOf.call(t)
                            }(e, t)) return !1
                    }
                    return M(e, t, r, n, 0)
                }

                function D(e, t) {
                    return t.filter((function(t) {
                        return y(e, t)
                    }))
                }

                function M(e, t, r, o, a, l) {
                    if (5 === arguments.length) {
                        l = Object.keys(e);
                        var f = Object.keys(t);
                        if (l.length !== f.length) return !1
                    }
                    for (var p = 0; p < l.length; p++)
                        if (!d(t, l[p])) return !1;
                    if (r && 5 === arguments.length) {
                        var v = s(e);
                        if (0 !== v.length) {
                            var m = 0;
                            for (p = 0; p < v.length; p++) {
                                var h = v[p];
                                if (y(e, h)) {
                                    if (!y(t, h)) return !1;
                                    l.push(h), m++
                                } else if (y(t, h)) return !1
                            }
                            var g = s(t);
                            if (v.length !== g.length && D(t, g).length !== m) return !1
                        } else {
                            var b = s(t);
                            if (0 !== b.length && 0 !== D(t, b).length) return !1
                        }
                    }
                    if (0 === l.length && (0 === a || 1 === a && 0 === e.length || 0 === e.size)) return !0;
                    if (void 0 === o) o = {
                        val1: new Map,
                        val2: new Map,
                        position: 0
                    };
                    else {
                        var w = o.val1.get(e);
                        if (void 0 !== w) {
                            var S = o.val2.get(t);
                            if (void 0 !== S) return w === S
                        }
                        o.position++
                    }
                    o.val1.set(e, o.position), o.val2.set(t, o.position);
                    var A = function(e, t, r, o, a, l) {
                        var s = 0;
                        if (2 === l) {
                            if (! function(e, t, r, n) {
                                    for (var o = null, a = u(e), c = 0; c < a.length; c++) {
                                        var l = a[c];
                                        if ("object" === i(l) && null !== l) null === o && (o = new Set), o.add(l);
                                        else if (!t.has(l)) {
                                            if (r) return !1;
                                            if (!L(e, t, l)) return !1;
                                            null === o && (o = new Set), o.add(l)
                                        }
                                    }
                                    if (null !== o) {
                                        for (var s = u(t), f = 0; f < s.length; f++) {
                                            var p = s[f];
                                            if ("object" === i(p) && null !== p) {
                                                if (!U(o, p, r, n)) return !1
                                            } else if (!r && !e.has(p) && !U(o, p, r, n)) return !1
                                        }
                                        return 0 === o.size
                                    }
                                    return !0
                                }(e, t, r, a)) return !1
                        } else if (3 === l) {
                            if (! function(e, t, r, o) {
                                    for (var a = null, u = c(e), l = 0; l < u.length; l++) {
                                        var s = n(u[l], 2),
                                            f = s[0],
                                            p = s[1];
                                        if ("object" === i(f) && null !== f) null === a && (a = new Set), a.add(f);
                                        else {
                                            var d = t.get(f);
                                            if (void 0 === d && !t.has(f) || !_(p, d, r, o)) {
                                                if (r) return !1;
                                                if (!W(e, t, f, p, o)) return !1;
                                                null === a && (a = new Set), a.add(f)
                                            }
                                        }
                                    }
                                    if (null !== a) {
                                        for (var y = c(t), v = 0; v < y.length; v++) {
                                            var m = n(y[v], 2),
                                                h = m[0],
                                                g = m[1];
                                            if ("object" === i(h) && null !== h) {
                                                if (!G(a, e, h, g, r, o)) return !1
                                            } else if (!(r || e.has(h) && _(e.get(h), g, !1, o) || G(a, e, h, g, !1, o))) return !1
                                        }
                                        return 0 === a.size
                                    }
                                    return !0
                                }(e, t, r, a)) return !1
                        } else if (1 === l)
                            for (; s < e.length; s++) {
                                if (!d(e, s)) {
                                    if (d(t, s)) return !1;
                                    for (var f = Object.keys(e); s < f.length; s++) {
                                        var p = f[s];
                                        if (!d(t, p) || !_(e[p], t[p], r, a)) return !1
                                    }
                                    return f.length === Object.keys(t).length
                                }
                                if (!d(t, s) || !_(e[s], t[s], r, a)) return !1
                            }
                        for (s = 0; s < o.length; s++) {
                            var y = o[s];
                            if (!_(e[y], t[y], r, a)) return !1
                        }
                        return !0
                    }(e, t, r, l, o, a);
                    return o.val1.delete(e), o.val2.delete(t), A
                }

                function U(e, t, r, n) {
                    for (var o = u(e), i = 0; i < o.length; i++) {
                        var a = o[i];
                        if (_(t, a, r, n)) return e.delete(a), !0
                    }
                    return !1
                }

                function B(e) {
                    switch (i(e)) {
                        case "undefined":
                            return null;
                        case "object":
                            return;
                        case "symbol":
                            return !1;
                        case "string":
                            e = +e;
                        case "number":
                            if (f(e)) return !1
                    }
                    return !0
                }

                function L(e, t, r) {
                    var n = B(r);
                    return null != n ? n : t.has(n) && !e.has(n)
                }

                function W(e, t, r, n, o) {
                    var i = B(r);
                    if (null != i) return i;
                    var a = t.get(i);
                    return !(void 0 === a && !t.has(i) || !_(n, a, !1, o)) && (!e.has(i) && _(n, a, !1, o))
                }

                function G(e, t, r, n, o, i) {
                    for (var a = u(e), c = 0; c < a.length; c++) {
                        var l = a[c];
                        if (_(r, l, o, i) && _(n, t.get(l), o, i)) return e.delete(l), !0
                    }
                    return !1
                }
                e.exports = {
                    isDeepEqual: function(e, t) {
                        return _(e, t, false)
                    },
                    isDeepStrictEqual: function(e, t) {
                        return _(e, t, true)
                    }
                }
            },
            45356: function(e, t, r) {
                "use strict";
                var n = r(43218),
                    o = r(55488),
                    i = o(n("String.prototype.indexOf"));
                e.exports = function(e, t) {
                    var r = n(e, !!t);
                    return "function" == typeof r && i(e, ".prototype.") > -1 ? o(r) : r
                }
            },
            55488: function(e, t, r) {
                "use strict";
                var n = r(83208),
                    o = r(43218),
                    i = r(26108),
                    a = r(3468),
                    u = o("%Function.prototype.apply%"),
                    c = o("%Function.prototype.call%"),
                    l = o("%Reflect.apply%", !0) || n.call(c, u),
                    s = r(64940),
                    f = o("%Math.max%");
                e.exports = function(e) {
                    if ("function" != typeof e) throw new a("a function is required");
                    var t = l(n, c, arguments);
                    return i(t, 1 + f(0, e.length - (arguments.length - 1)), !0)
                };
                var p = function() {
                    return l(n, u, arguments)
                };
                s ? s(e.exports, "apply", {
                    value: p
                }) : e.exports.apply = p
            },
            17075: function(e, t, r) {
                "use strict";
                var n = r(49228),
                    o = "function" == typeof Symbol && "symbol" == typeof Symbol("foo"),
                    i = Object.prototype.toString,
                    a = Array.prototype.concat,
                    u = r(70686),
                    c = r(17239)(),
                    l = function(e, t, r, n) {
                        if (t in e)
                            if (!0 === n) {
                                if (e[t] === r) return
                            } else if ("function" != typeof(o = n) || "[object Function]" !== i.call(o) || !n()) return;
                        var o;
                        c ? u(e, t, r, !0) : u(e, t, r)
                    },
                    s = function(e, t) {
                        var r = arguments.length > 2 ? arguments[2] : {},
                            i = n(t);
                        o && (i = a.call(i, Object.getOwnPropertySymbols(t)));
                        for (var u = 0; u < i.length; u += 1) l(e, i[u], t[i[u]], r[i[u]])
                    };
                s.supportsDescriptors = !!c, e.exports = s
            },
            24780: function(e) {
                "use strict";
                var t = Object.prototype.toString,
                    r = Math.max,
                    n = function(e, t) {
                        for (var r = [], n = 0; n < e.length; n += 1) r[n] = e[n];
                        for (var o = 0; o < t.length; o += 1) r[o + e.length] = t[o];
                        return r
                    };
                e.exports = function(e) {
                    var o = this;
                    if ("function" != typeof o || "[object Function]" !== t.apply(o)) throw new TypeError("Function.prototype.bind called on incompatible " + o);
                    for (var i, a = function(e, t) {
                            for (var r = [], n = t || 0, o = 0; n < e.length; n += 1, o += 1) r[o] = e[n];
                            return r
                        }(arguments, 1), u = r(0, o.length - a.length), c = [], l = 0; l < u; l++) c[l] = "$" + l;
                    if (i = Function("binder", "return function (" + function(e, t) {
                            for (var r = "", n = 0; n < e.length; n += 1) r += e[n], n + 1 < e.length && (r += t);
                            return r
                        }(c, ",") + "){ return binder.apply(this,arguments); }")((function() {
                            if (this instanceof i) {
                                var t = o.apply(this, n(a, arguments));
                                return Object(t) === t ? t : this
                            }
                            return o.apply(e, n(a, arguments))
                        })), o.prototype) {
                        var s = function() {};
                        s.prototype = o.prototype, i.prototype = new s, s.prototype = null
                    }
                    return i
                }
            },
            83208: function(e, t, r) {
                "use strict";
                var n = r(24780);
                e.exports = Function.prototype.bind || n
            },
            43218: function(e, t, r) {
                "use strict";
                var n, o = r(29838),
                    i = r(29110),
                    a = r(61155),
                    u = r(94943),
                    c = r(5731),
                    l = r(3468),
                    s = r(32140),
                    f = Function,
                    p = function(e) {
                        try {
                            return f('"use strict"; return (' + e + ").constructor;")()
                        } catch (e) {}
                    },
                    d = Object.getOwnPropertyDescriptor;
                if (d) try {
                    d({}, "")
                } catch (e) {
                    d = null
                }
                var y = function() {
                        throw new l
                    },
                    v = d ? function() {
                        try {
                            return y
                        } catch (e) {
                            try {
                                return d(arguments, "callee").get
                            } catch (e) {
                                return y
                            }
                        }
                    }() : y,
                    m = r(8060)(),
                    h = r(66869)(),
                    g = Object.getPrototypeOf || (h ? function(e) {
                        return e.__proto__
                    } : null),
                    b = {},
                    w = "undefined" != typeof Uint8Array && g ? g(Uint8Array) : n,
                    S = {
                        __proto__: null,
                        "%AggregateError%": "undefined" == typeof AggregateError ? n : AggregateError,
                        "%Array%": Array,
                        "%ArrayBuffer%": "undefined" == typeof ArrayBuffer ? n : ArrayBuffer,
                        "%ArrayIteratorPrototype%": m && g ? g([][Symbol.iterator]()) : n,
                        "%AsyncFromSyncIteratorPrototype%": n,
                        "%AsyncFunction%": b,
                        "%AsyncGenerator%": b,
                        "%AsyncGeneratorFunction%": b,
                        "%AsyncIteratorPrototype%": b,
                        "%Atomics%": "undefined" == typeof Atomics ? n : Atomics,
                        "%BigInt%": "undefined" == typeof BigInt ? n : BigInt,
                        "%BigInt64Array%": "undefined" == typeof BigInt64Array ? n : BigInt64Array,
                        "%BigUint64Array%": "undefined" == typeof BigUint64Array ? n : BigUint64Array,
                        "%Boolean%": Boolean,
                        "%DataView%": "undefined" == typeof DataView ? n : DataView,
                        "%Date%": Date,
                        "%decodeURI%": decodeURI,
                        "%decodeURIComponent%": decodeURIComponent,
                        "%encodeURI%": encodeURI,
                        "%encodeURIComponent%": encodeURIComponent,
                        "%Error%": o,
                        "%eval%": eval,
                        "%EvalError%": i,
                        "%Float32Array%": "undefined" == typeof Float32Array ? n : Float32Array,
                        "%Float64Array%": "undefined" == typeof Float64Array ? n : Float64Array,
                        "%FinalizationRegistry%": "undefined" == typeof FinalizationRegistry ? n : FinalizationRegistry,
                        "%Function%": f,
                        "%GeneratorFunction%": b,
                        "%Int8Array%": "undefined" == typeof Int8Array ? n : Int8Array,
                        "%Int16Array%": "undefined" == typeof Int16Array ? n : Int16Array,
                        "%Int32Array%": "undefined" == typeof Int32Array ? n : Int32Array,
                        "%isFinite%": isFinite,
                        "%isNaN%": isNaN,
                        "%IteratorPrototype%": m && g ? g(g([][Symbol.iterator]())) : n,
                        "%JSON%": "object" == typeof JSON ? JSON : n,
                        "%Map%": "undefined" == typeof Map ? n : Map,
                        "%MapIteratorPrototype%": "undefined" != typeof Map && m && g ? g((new Map)[Symbol.iterator]()) : n,
                        "%Math%": Math,
                        "%Number%": Number,
                        "%Object%": Object,
                        "%parseFloat%": parseFloat,
                        "%parseInt%": parseInt,
                        "%Promise%": "undefined" == typeof Promise ? n : Promise,
                        "%Proxy%": "undefined" == typeof Proxy ? n : Proxy,
                        "%RangeError%": a,
                        "%ReferenceError%": u,
                        "%Reflect%": "undefined" == typeof Reflect ? n : Reflect,
                        "%RegExp%": RegExp,
                        "%Set%": "undefined" == typeof Set ? n : Set,
                        "%SetIteratorPrototype%": "undefined" != typeof Set && m && g ? g((new Set)[Symbol.iterator]()) : n,
                        "%SharedArrayBuffer%": "undefined" == typeof SharedArrayBuffer ? n : SharedArrayBuffer,
                        "%String%": String,
                        "%StringIteratorPrototype%": m && g ? g("" [Symbol.iterator]()) : n,
                        "%Symbol%": m ? Symbol : n,
                        "%SyntaxError%": c,
                        "%ThrowTypeError%": v,
                        "%TypedArray%": w,
                        "%TypeError%": l,
                        "%Uint8Array%": "undefined" == typeof Uint8Array ? n : Uint8Array,
                        "%Uint8ClampedArray%": "undefined" == typeof Uint8ClampedArray ? n : Uint8ClampedArray,
                        "%Uint16Array%": "undefined" == typeof Uint16Array ? n : Uint16Array,
                        "%Uint32Array%": "undefined" == typeof Uint32Array ? n : Uint32Array,
                        "%URIError%": s,
                        "%WeakMap%": "undefined" == typeof WeakMap ? n : WeakMap,
                        "%WeakRef%": "undefined" == typeof WeakRef ? n : WeakRef,
                        "%WeakSet%": "undefined" == typeof WeakSet ? n : WeakSet
                    };
                if (g) try {
                    null.error
                } catch (e) {
                    var A = g(g(e));
                    S["%Error.prototype%"] = A
                }
                var x = function e(t) {
                        var r;
                        if ("%AsyncFunction%" === t) r = p("async function () {}");
                        else if ("%GeneratorFunction%" === t) r = p("function* () {}");
                        else if ("%AsyncGeneratorFunction%" === t) r = p("async function* () {}");
                        else if ("%AsyncGenerator%" === t) {
                            var n = e("%AsyncGeneratorFunction%");
                            n && (r = n.prototype)
                        } else if ("%AsyncIteratorPrototype%" === t) {
                            var o = e("%AsyncGenerator%");
                            o && g && (r = g(o.prototype))
                        }
                        return S[t] = r, r
                    },
                    E = {
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
                    O = r(83208),
                    P = r(78554),
                    j = O.call(Function.call, Array.prototype.concat),
                    R = O.call(Function.apply, Array.prototype.splice),
                    I = O.call(Function.call, String.prototype.replace),
                    C = O.call(Function.call, String.prototype.slice),
                    k = O.call(Function.call, RegExp.prototype.exec),
                    F = /[^%.[\]]+|\[(?:(-?\d+(?:\.\d+)?)|(["'])((?:(?!\2)[^\\]|\\.)*?)\2)\]|(?=(?:\.|\[\])(?:\.|\[\]|%$))/g,
                    N = /\\(\\)?/g,
                    T = function(e, t) {
                        var r, n = e;
                        if (P(E, n) && (n = "%" + (r = E[n])[0] + "%"), P(S, n)) {
                            var o = S[n];
                            if (o === b && (o = x(n)), void 0 === o && !t) throw new l("intrinsic " + e + " exists, but is not available. Please file an issue!");
                            return {
                                alias: r,
                                name: n,
                                value: o
                            }
                        }
                        throw new c("intrinsic " + e + " does not exist!")
                    };
                e.exports = function(e, t) {
                    if ("string" != typeof e || 0 === e.length) throw new l("intrinsic name must be a non-empty string");
                    if (arguments.length > 1 && "boolean" != typeof t) throw new l('"allowMissing" argument must be a boolean');
                    if (null === k(/^%?[^%]*%?$/, e)) throw new c("`%` may not be present anywhere but at the beginning and end of the intrinsic name");
                    var r = function(e) {
                            var t = C(e, 0, 1),
                                r = C(e, -1);
                            if ("%" === t && "%" !== r) throw new c("invalid intrinsic syntax, expected closing `%`");
                            if ("%" === r && "%" !== t) throw new c("invalid intrinsic syntax, expected opening `%`");
                            var n = [];
                            return I(e, F, (function(e, t, r, o) {
                                n[n.length] = r ? I(o, N, "$1") : t || e
                            })), n
                        }(e),
                        n = r.length > 0 ? r[0] : "",
                        o = T("%" + n + "%", t),
                        i = o.name,
                        a = o.value,
                        u = !1,
                        s = o.alias;
                    s && (n = s[0], R(r, j([0, 1], s)));
                    for (var f = 1, p = !0; f < r.length; f += 1) {
                        var y = r[f],
                            v = C(y, 0, 1),
                            m = C(y, -1);
                        if (('"' === v || "'" === v || "`" === v || '"' === m || "'" === m || "`" === m) && v !== m) throw new c("property names with quotes must have matching quotes");
                        if ("constructor" !== y && p || (u = !0), P(S, i = "%" + (n += "." + y) + "%")) a = S[i];
                        else if (null != a) {
                            if (!(y in a)) {
                                if (!t) throw new l("base intrinsic for " + e + " exists, but the property is not available.");
                                return
                            }
                            if (d && f + 1 >= r.length) {
                                var h = d(a, y);
                                a = (p = !!h) && "get" in h && !("originalValue" in h.get) ? h.get : a[y]
                            } else p = P(a, y), a = a[y];
                            p && !u && (S[i] = a)
                        }
                    }
                    return a
                }
            },
            8060: function(e, t, r) {
                "use strict";
                var n = "undefined" != typeof Symbol && Symbol,
                    o = r(85150);
                e.exports = function() {
                    return "function" == typeof n && ("function" == typeof Symbol && ("symbol" == typeof n("foo") && ("symbol" == typeof Symbol("bar") && o())))
                }
            },
            85150: function(e) {
                "use strict";
                e.exports = function() {
                    if ("function" != typeof Symbol || "function" != typeof Object.getOwnPropertySymbols) return !1;
                    if ("symbol" == typeof Symbol.iterator) return !0;
                    var e = {},
                        t = Symbol("test"),
                        r = Object(t);
                    if ("string" == typeof t) return !1;
                    if ("[object Symbol]" !== Object.prototype.toString.call(t)) return !1;
                    if ("[object Symbol]" !== Object.prototype.toString.call(r)) return !1;
                    for (t in e[t] = 42, e) return !1;
                    if ("function" == typeof Object.keys && 0 !== Object.keys(e).length) return !1;
                    if ("function" == typeof Object.getOwnPropertyNames && 0 !== Object.getOwnPropertyNames(e).length) return !1;
                    var n = Object.getOwnPropertySymbols(e);
                    if (1 !== n.length || n[0] !== t) return !1;
                    if (!Object.prototype.propertyIsEnumerable.call(e, t)) return !1;
                    if ("function" == typeof Object.getOwnPropertyDescriptor) {
                        var o = Object.getOwnPropertyDescriptor(e, t);
                        if (42 !== o.value || !0 !== o.enumerable) return !1
                    }
                    return !0
                }
            },
            63590: function(e) {
                "use strict";
                var t = function(e) {
                    return e != e
                };
                e.exports = function(e, r) {
                    return 0 === e && 0 === r ? 1 / e == 1 / r : e === r || !(!t(e) || !t(r))
                }
            },
            28174: function(e, t, r) {
                "use strict";
                var n = r(17075),
                    o = r(55488),
                    i = r(63590),
                    a = r(91911),
                    u = r(17817),
                    c = o(a(), Object);
                n(c, {
                    getPolyfill: a,
                    implementation: i,
                    shim: u
                }), e.exports = c
            },
            91911: function(e, t, r) {
                "use strict";
                var n = r(63590);
                e.exports = function() {
                    return "function" == typeof Object.is ? Object.is : n
                }
            },
            17817: function(e, t, r) {
                "use strict";
                var n = r(91911),
                    o = r(17075);
                e.exports = function() {
                    var e = n();
                    return o(Object, {
                        is: e
                    }, {
                        is: function() {
                            return Object.is !== e
                        }
                    }), e
                }
            },
            59446: function(e, t, r) {
                "use strict";
                var n = r(49228),
                    o = r(85150)(),
                    i = r(45356),
                    a = Object,
                    u = i("Array.prototype.push"),
                    c = i("Object.prototype.propertyIsEnumerable"),
                    l = o ? Object.getOwnPropertySymbols : null;
                e.exports = function(e, t) {
                    if (null == e) throw new TypeError("target must be an object");
                    var r = a(e);
                    if (1 === arguments.length) return r;
                    for (var i = 1; i < arguments.length; ++i) {
                        var s = a(arguments[i]),
                            f = n(s),
                            p = o && (Object.getOwnPropertySymbols || l);
                        if (p)
                            for (var d = p(s), y = 0; y < d.length; ++y) {
                                var v = d[y];
                                c(s, v) && u(f, v)
                            }
                        for (var m = 0; m < f.length; ++m) {
                            var h = f[m];
                            if (c(s, h)) {
                                var g = s[h];
                                r[h] = g
                            }
                        }
                    }
                    return r
                }
            },
            80183: function(e, t, r) {
                "use strict";
                var n = r(59446);
                e.exports = function() {
                    return Object.assign ? function() {
                        if (!Object.assign) return !1;
                        for (var e = "abcdefghijklmnopqrst", t = e.split(""), r = {}, n = 0; n < t.length; ++n) r[t[n]] = t[n];
                        var o = Object.assign({}, r),
                            i = "";
                        for (var a in o) i += a;
                        return e !== i
                    }() || function() {
                        if (!Object.assign || !Object.preventExtensions) return !1;
                        var e = Object.preventExtensions({
                            1: 2
                        });
                        try {
                            Object.assign(e, "xy")
                        } catch (t) {
                            return "y" === e[1]
                        }
                        return !1
                    }() ? n : Object.assign : n
                }
            },
            28498: function(e, t, r) {
                "use strict";
                var n = r(79138),
                    o = r(528),
                    i = o("%Function.prototype.apply%"),
                    a = o("%Function.prototype.call%"),
                    u = o("%Reflect.apply%", !0) || n.call(a, i),
                    c = o("%Object.defineProperty%", !0);
                if (c) try {
                    c({}, "a", {
                        value: 1
                    })
                } catch (e) {
                    c = null
                }
                e.exports = function() {
                    return u(n, a, arguments)
                };
                var l = function() {
                    return u(n, i, arguments)
                };
                c ? c(e.exports, "apply", {
                    value: l
                }) : e.exports.apply = l
            },
            4364: function(e, t, r) {
                var n = r(49208),
                    o = r(26093);

                function i() {
                    return (new Date).getTime()
                }
                var a, u = Array.prototype.slice,
                    c = {};
                a = void 0 !== r.g && r.g.console ? r.g.console : "undefined" != typeof window && window.console ? window.console : {};
                for (var l = [
                        [function() {}, "log"],
                        [function() {
                            a.log.apply(a, arguments)
                        }, "info"],
                        [function() {
                            a.log.apply(a, arguments)
                        }, "warn"],
                        [function() {
                            a.warn.apply(a, arguments)
                        }, "error"],
                        [function(e) {
                            c[e] = i()
                        }, "time"],
                        [function(e) {
                            var t = c[e];
                            if (!t) throw new Error("No such label: " + e);
                            delete c[e];
                            var r = i() - t;
                            a.log(e + ": " + r + "ms")
                        }, "timeEnd"],
                        [function() {
                            var e = new Error;
                            e.name = "Trace", e.message = n.format.apply(null, arguments), a.error(e.stack)
                        }, "trace"],
                        [function(e) {
                            a.log(n.inspect(e) + "\n")
                        }, "dir"],
                        [function(e) {
                            if (!e) {
                                var t = u.call(arguments, 1);
                                o.ok(!1, n.format.apply(null, t))
                            }
                        }, "assert"]
                    ], s = 0; s < l.length; s++) {
                    var f = l[s],
                        p = f[0],
                        d = f[1];
                    a[d] || (a[d] = p)
                }
                e.exports = a
            },
            70686: function(e, t, r) {
                "use strict";
                var n = r(64940),
                    o = r(5731),
                    i = r(3468),
                    a = r(69336);
                e.exports = function(e, t, r) {
                    if (!e || "object" != typeof e && "function" != typeof e) throw new i("`obj` must be an object or a function`");
                    if ("string" != typeof t && "symbol" != typeof t) throw new i("`property` must be a string or a symbol`");
                    if (arguments.length > 3 && "boolean" != typeof arguments[3] && null !== arguments[3]) throw new i("`nonEnumerable`, if provided, must be a boolean or null");
                    if (arguments.length > 4 && "boolean" != typeof arguments[4] && null !== arguments[4]) throw new i("`nonWritable`, if provided, must be a boolean or null");
                    if (arguments.length > 5 && "boolean" != typeof arguments[5] && null !== arguments[5]) throw new i("`nonConfigurable`, if provided, must be a boolean or null");
                    if (arguments.length > 6 && "boolean" != typeof arguments[6]) throw new i("`loose`, if provided, must be a boolean");
                    var u = arguments.length > 3 ? arguments[3] : null,
                        c = arguments.length > 4 ? arguments[4] : null,
                        l = arguments.length > 5 ? arguments[5] : null,
                        s = arguments.length > 6 && arguments[6],
                        f = !!a && a(e, t);
                    if (n) n(e, t, {
                        configurable: null === l && f ? f.configurable : !l,
                        enumerable: null === u && f ? f.enumerable : !u,
                        value: r,
                        writable: null === c && f ? f.writable : !c
                    });
                    else {
                        if (!s && (u || c || l)) throw new o("This environment does not support defining a property as non-configurable, non-writable, or non-enumerable.");
                        e[t] = r
                    }
                }
            },
            41857: function(e, t, r) {
                "use strict";
                var n = r(49228),
                    o = "function" == typeof Symbol && "symbol" == typeof Symbol("foo"),
                    i = Object.prototype.toString,
                    a = Array.prototype.concat,
                    u = Object.defineProperty,
                    c = u && function() {
                        var e = {};
                        try {
                            for (var t in u(e, "x", {
                                    enumerable: !1,
                                    value: e
                                }), e) return !1;
                            return e.x === e
                        } catch (e) {
                            return !1
                        }
                    }(),
                    l = function(e, t, r, n) {
                        var o;
                        (!(t in e) || "function" == typeof(o = n) && "[object Function]" === i.call(o) && n()) && (c ? u(e, t, {
                            configurable: !0,
                            enumerable: !1,
                            value: r,
                            writable: !0
                        }) : e[t] = r)
                    },
                    s = function(e, t) {
                        var r = arguments.length > 2 ? arguments[2] : {},
                            i = n(t);
                        o && (i = a.call(i, Object.getOwnPropertySymbols(t)));
                        for (var u = 0; u < i.length; u += 1) l(e, i[u], t[i[u]], r[i[u]])
                    };
                s.supportsDescriptors = !!c, e.exports = s
            },
            64940: function(e, t, r) {
                "use strict";
                var n = r(5682)("%Object.defineProperty%", !0) || !1;
                if (n) try {
                    n({}, "a", {
                        value: 1
                    })
                } catch (e) {
                    n = !1
                }
                e.exports = n
            },
            15628: function(e) {
                "use strict";
                var t = Object.prototype.toString,
                    r = Math.max,
                    n = function(e, t) {
                        for (var r = [], n = 0; n < e.length; n += 1) r[n] = e[n];
                        for (var o = 0; o < t.length; o += 1) r[o + e.length] = t[o];
                        return r
                    };
                e.exports = function(e) {
                    var o = this;
                    if ("function" != typeof o || "[object Function]" !== t.apply(o)) throw new TypeError("Function.prototype.bind called on incompatible " + o);
                    for (var i, a = function(e, t) {
                            for (var r = [], n = t || 0, o = 0; n < e.length; n += 1, o += 1) r[o] = e[n];
                            return r
                        }(arguments, 1), u = r(0, o.length - a.length), c = [], l = 0; l < u; l++) c[l] = "$" + l;
                    if (i = Function("binder", "return function (" + function(e, t) {
                            for (var r = "", n = 0; n < e.length; n += 1) r += e[n], n + 1 < e.length && (r += t);
                            return r
                        }(c, ",") + "){ return binder.apply(this,arguments); }")((function() {
                            if (this instanceof i) {
                                var t = o.apply(this, n(a, arguments));
                                return Object(t) === t ? t : this
                            }
                            return o.apply(e, n(a, arguments))
                        })), o.prototype) {
                        var s = function() {};
                        s.prototype = o.prototype, i.prototype = new s, s.prototype = null
                    }
                    return i
                }
            },
            97768: function(e, t, r) {
                "use strict";
                var n = r(15628);
                e.exports = Function.prototype.bind || n
            },
            5682: function(e, t, r) {
                "use strict";
                var n, o = r(29838),
                    i = r(29110),
                    a = r(61155),
                    u = r(94943),
                    c = r(5731),
                    l = r(3468),
                    s = r(32140),
                    f = Function,
                    p = function(e) {
                        try {
                            return f('"use strict"; return (' + e + ").constructor;")()
                        } catch (e) {}
                    },
                    d = Object.getOwnPropertyDescriptor;
                if (d) try {
                    d({}, "")
                } catch (e) {
                    d = null
                }
                var y = function() {
                        throw new l
                    },
                    v = d ? function() {
                        try {
                            return y
                        } catch (e) {
                            try {
                                return d(arguments, "callee").get
                            } catch (e) {
                                return y
                            }
                        }
                    }() : y,
                    m = r(66236)(),
                    h = r(66869)(),
                    g = Object.getPrototypeOf || (h ? function(e) {
                        return e.__proto__
                    } : null),
                    b = {},
                    w = "undefined" != typeof Uint8Array && g ? g(Uint8Array) : n,
                    S = {
                        __proto__: null,
                        "%AggregateError%": "undefined" == typeof AggregateError ? n : AggregateError,
                        "%Array%": Array,
                        "%ArrayBuffer%": "undefined" == typeof ArrayBuffer ? n : ArrayBuffer,
                        "%ArrayIteratorPrototype%": m && g ? g([][Symbol.iterator]()) : n,
                        "%AsyncFromSyncIteratorPrototype%": n,
                        "%AsyncFunction%": b,
                        "%AsyncGenerator%": b,
                        "%AsyncGeneratorFunction%": b,
                        "%AsyncIteratorPrototype%": b,
                        "%Atomics%": "undefined" == typeof Atomics ? n : Atomics,
                        "%BigInt%": "undefined" == typeof BigInt ? n : BigInt,
                        "%BigInt64Array%": "undefined" == typeof BigInt64Array ? n : BigInt64Array,
                        "%BigUint64Array%": "undefined" == typeof BigUint64Array ? n : BigUint64Array,
                        "%Boolean%": Boolean,
                        "%DataView%": "undefined" == typeof DataView ? n : DataView,
                        "%Date%": Date,
                        "%decodeURI%": decodeURI,
                        "%decodeURIComponent%": decodeURIComponent,
                        "%encodeURI%": encodeURI,
                        "%encodeURIComponent%": encodeURIComponent,
                        "%Error%": o,
                        "%eval%": eval,
                        "%EvalError%": i,
                        "%Float32Array%": "undefined" == typeof Float32Array ? n : Float32Array,
                        "%Float64Array%": "undefined" == typeof Float64Array ? n : Float64Array,
                        "%FinalizationRegistry%": "undefined" == typeof FinalizationRegistry ? n : FinalizationRegistry,
                        "%Function%": f,
                        "%GeneratorFunction%": b,
                        "%Int8Array%": "undefined" == typeof Int8Array ? n : Int8Array,
                        "%Int16Array%": "undefined" == typeof Int16Array ? n : Int16Array,
                        "%Int32Array%": "undefined" == typeof Int32Array ? n : Int32Array,
                        "%isFinite%": isFinite,
                        "%isNaN%": isNaN,
                        "%IteratorPrototype%": m && g ? g(g([][Symbol.iterator]())) : n,
                        "%JSON%": "object" == typeof JSON ? JSON : n,
                        "%Map%": "undefined" == typeof Map ? n : Map,
                        "%MapIteratorPrototype%": "undefined" != typeof Map && m && g ? g((new Map)[Symbol.iterator]()) : n,
                        "%Math%": Math,
                        "%Number%": Number,
                        "%Object%": Object,
                        "%parseFloat%": parseFloat,
                        "%parseInt%": parseInt,
                        "%Promise%": "undefined" == typeof Promise ? n : Promise,
                        "%Proxy%": "undefined" == typeof Proxy ? n : Proxy,
                        "%RangeError%": a,
                        "%ReferenceError%": u,
                        "%Reflect%": "undefined" == typeof Reflect ? n : Reflect,
                        "%RegExp%": RegExp,
                        "%Set%": "undefined" == typeof Set ? n : Set,
                        "%SetIteratorPrototype%": "undefined" != typeof Set && m && g ? g((new Set)[Symbol.iterator]()) : n,
                        "%SharedArrayBuffer%": "undefined" == typeof SharedArrayBuffer ? n : SharedArrayBuffer,
                        "%String%": String,
                        "%StringIteratorPrototype%": m && g ? g("" [Symbol.iterator]()) : n,
                        "%Symbol%": m ? Symbol : n,
                        "%SyntaxError%": c,
                        "%ThrowTypeError%": v,
                        "%TypedArray%": w,
                        "%TypeError%": l,
                        "%Uint8Array%": "undefined" == typeof Uint8Array ? n : Uint8Array,
                        "%Uint8ClampedArray%": "undefined" == typeof Uint8ClampedArray ? n : Uint8ClampedArray,
                        "%Uint16Array%": "undefined" == typeof Uint16Array ? n : Uint16Array,
                        "%Uint32Array%": "undefined" == typeof Uint32Array ? n : Uint32Array,
                        "%URIError%": s,
                        "%WeakMap%": "undefined" == typeof WeakMap ? n : WeakMap,
                        "%WeakRef%": "undefined" == typeof WeakRef ? n : WeakRef,
                        "%WeakSet%": "undefined" == typeof WeakSet ? n : WeakSet
                    };
                if (g) try {
                    null.error
                } catch (e) {
                    var A = g(g(e));
                    S["%Error.prototype%"] = A
                }
                var x = function e(t) {
                        var r;
                        if ("%AsyncFunction%" === t) r = p("async function () {}");
                        else if ("%GeneratorFunction%" === t) r = p("function* () {}");
                        else if ("%AsyncGeneratorFunction%" === t) r = p("async function* () {}");
                        else if ("%AsyncGenerator%" === t) {
                            var n = e("%AsyncGeneratorFunction%");
                            n && (r = n.prototype)
                        } else if ("%AsyncIteratorPrototype%" === t) {
                            var o = e("%AsyncGenerator%");
                            o && g && (r = g(o.prototype))
                        }
                        return S[t] = r, r
                    },
                    E = {
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
                    O = r(97768),
                    P = r(78554),
                    j = O.call(Function.call, Array.prototype.concat),
                    R = O.call(Function.apply, Array.prototype.splice),
                    I = O.call(Function.call, String.prototype.replace),
                    C = O.call(Function.call, String.prototype.slice),
                    k = O.call(Function.call, RegExp.prototype.exec),
                    F = /[^%.[\]]+|\[(?:(-?\d+(?:\.\d+)?)|(["'])((?:(?!\2)[^\\]|\\.)*?)\2)\]|(?=(?:\.|\[\])(?:\.|\[\]|%$))/g,
                    N = /\\(\\)?/g,
                    T = function(e, t) {
                        var r, n = e;
                        if (P(E, n) && (n = "%" + (r = E[n])[0] + "%"), P(S, n)) {
                            var o = S[n];
                            if (o === b && (o = x(n)), void 0 === o && !t) throw new l("intrinsic " + e + " exists, but is not available. Please file an issue!");
                            return {
                                alias: r,
                                name: n,
                                value: o
                            }
                        }
                        throw new c("intrinsic " + e + " does not exist!")
                    };
                e.exports = function(e, t) {
                    if ("string" != typeof e || 0 === e.length) throw new l("intrinsic name must be a non-empty string");
                    if (arguments.length > 1 && "boolean" != typeof t) throw new l('"allowMissing" argument must be a boolean');
                    if (null === k(/^%?[^%]*%?$/, e)) throw new c("`%` may not be present anywhere but at the beginning and end of the intrinsic name");
                    var r = function(e) {
                            var t = C(e, 0, 1),
                                r = C(e, -1);
                            if ("%" === t && "%" !== r) throw new c("invalid intrinsic syntax, expected closing `%`");
                            if ("%" === r && "%" !== t) throw new c("invalid intrinsic syntax, expected opening `%`");
                            var n = [];
                            return I(e, F, (function(e, t, r, o) {
                                n[n.length] = r ? I(o, N, "$1") : t || e
                            })), n
                        }(e),
                        n = r.length > 0 ? r[0] : "",
                        o = T("%" + n + "%", t),
                        i = o.name,
                        a = o.value,
                        u = !1,
                        s = o.alias;
                    s && (n = s[0], R(r, j([0, 1], s)));
                    for (var f = 1, p = !0; f < r.length; f += 1) {
                        var y = r[f],
                            v = C(y, 0, 1),
                            m = C(y, -1);
                        if (('"' === v || "'" === v || "`" === v || '"' === m || "'" === m || "`" === m) && v !== m) throw new c("property names with quotes must have matching quotes");
                        if ("constructor" !== y && p || (u = !0), P(S, i = "%" + (n += "." + y) + "%")) a = S[i];
                        else if (null != a) {
                            if (!(y in a)) {
                                if (!t) throw new l("base intrinsic for " + e + " exists, but the property is not available.");
                                return
                            }
                            if (d && f + 1 >= r.length) {
                                var h = d(a, y);
                                a = (p = !!h) && "get" in h && !("originalValue" in h.get) ? h.get : a[y]
                            } else p = P(a, y), a = a[y];
                            p && !u && (S[i] = a)
                        }
                    }
                    return a
                }
            },
            66236: function(e, t, r) {
                "use strict";
                var n = "undefined" != typeof Symbol && Symbol,
                    o = r(91646);
                e.exports = function() {
                    return "function" == typeof n && ("function" == typeof Symbol && ("symbol" == typeof n("foo") && ("symbol" == typeof Symbol("bar") && o())))
                }
            },
            91646: function(e) {
                "use strict";
                e.exports = function() {
                    if ("function" != typeof Symbol || "function" != typeof Object.getOwnPropertySymbols) return !1;
                    if ("symbol" == typeof Symbol.iterator) return !0;
                    var e = {},
                        t = Symbol("test"),
                        r = Object(t);
                    if ("string" == typeof t) return !1;
                    if ("[object Symbol]" !== Object.prototype.toString.call(t)) return !1;
                    if ("[object Symbol]" !== Object.prototype.toString.call(r)) return !1;
                    for (t in e[t] = 42, e) return !1;
                    if ("function" == typeof Object.keys && 0 !== Object.keys(e).length) return !1;
                    if ("function" == typeof Object.getOwnPropertyNames && 0 !== Object.getOwnPropertyNames(e).length) return !1;
                    var n = Object.getOwnPropertySymbols(e);
                    if (1 !== n.length || n[0] !== t) return !1;
                    if (!Object.prototype.propertyIsEnumerable.call(e, t)) return !1;
                    if ("function" == typeof Object.getOwnPropertyDescriptor) {
                        var o = Object.getOwnPropertyDescriptor(e, t);
                        if (42 !== o.value || !0 !== o.enumerable) return !1
                    }
                    return !0
                }
            },
            29110: function(e) {
                "use strict";
                e.exports = EvalError
            },
            29838: function(e) {
                "use strict";
                e.exports = Error
            },
            61155: function(e) {
                "use strict";
                e.exports = RangeError
            },
            94943: function(e) {
                "use strict";
                e.exports = ReferenceError
            },
            5731: function(e) {
                "use strict";
                e.exports = SyntaxError
            },
            3468: function(e) {
                "use strict";
                e.exports = TypeError
            },
            32140: function(e) {
                "use strict";
                e.exports = URIError
            },
            80705: function(e, t, r) {
                "use strict";
                var n = r(89617),
                    o = Object.prototype.toString,
                    i = Object.prototype.hasOwnProperty;
                e.exports = function(e, t, r) {
                    if (!n(t)) throw new TypeError("iterator must be a function");
                    var a;
                    arguments.length >= 3 && (a = r), "[object Array]" === o.call(e) ? function(e, t, r) {
                        for (var n = 0, o = e.length; n < o; n++) i.call(e, n) && (null == r ? t(e[n], n, e) : t.call(r, e[n], n, e))
                    }(e, t, a) : "string" == typeof e ? function(e, t, r) {
                        for (var n = 0, o = e.length; n < o; n++) null == r ? t(e.charAt(n), n, e) : t.call(r, e.charAt(n), n, e)
                    }(e, t, a) : function(e, t, r) {
                        for (var n in e) i.call(e, n) && (null == r ? t(e[n], n, e) : t.call(r, e[n], n, e))
                    }(e, t, a)
                }
            },
            28794: function(e) {
                "use strict";
                var t = Array.prototype.slice,
                    r = Object.prototype.toString;
                e.exports = function(e) {
                    var n = this;
                    if ("function" != typeof n || "[object Function]" !== r.call(n)) throw new TypeError("Function.prototype.bind called on incompatible " + n);
                    for (var o, i = t.call(arguments, 1), a = Math.max(0, n.length - i.length), u = [], c = 0; c < a; c++) u.push("$" + c);
                    if (o = Function("binder", "return function (" + u.join(",") + "){ return binder.apply(this,arguments); }")((function() {
                            if (this instanceof o) {
                                var r = n.apply(this, i.concat(t.call(arguments)));
                                return Object(r) === r ? r : this
                            }
                            return n.apply(e, i.concat(t.call(arguments)))
                        })), n.prototype) {
                        var l = function() {};
                        l.prototype = n.prototype, o.prototype = new l, l.prototype = null
                    }
                    return o
                }
            },
            79138: function(e, t, r) {
                "use strict";
                var n = r(28794);
                e.exports = Function.prototype.bind || n
            },
            528: function(e, t, r) {
                "use strict";
                var n, o = SyntaxError,
                    i = Function,
                    a = TypeError,
                    u = function(e) {
                        try {
                            return Function('"use strict"; return (' + e + ").constructor;")()
                        } catch (e) {}
                    },
                    c = Object.getOwnPropertyDescriptor;
                if (c) try {
                    c({}, "")
                } catch (e) {
                    c = null
                }
                var l = function() {
                        throw new a
                    },
                    s = c ? function() {
                        try {
                            return l
                        } catch (e) {
                            try {
                                return c(arguments, "callee").get
                            } catch (e) {
                                return l
                            }
                        }
                    }() : l,
                    f = r(53558)(),
                    p = Object.getPrototypeOf || function(e) {
                        return e.__proto__
                    },
                    d = u("async function* () {}"),
                    y = d ? d.prototype : n,
                    v = y ? y.prototype : n,
                    m = "undefined" == typeof Uint8Array ? n : p(Uint8Array),
                    h = {
                        "%AggregateError%": "undefined" == typeof AggregateError ? n : AggregateError,
                        "%Array%": Array,
                        "%ArrayBuffer%": "undefined" == typeof ArrayBuffer ? n : ArrayBuffer,
                        "%ArrayIteratorPrototype%": f ? p([][Symbol.iterator]()) : n,
                        "%AsyncFromSyncIteratorPrototype%": n,
                        "%AsyncFunction%": u("async function () {}"),
                        "%AsyncGenerator%": y,
                        "%AsyncGeneratorFunction%": d,
                        "%AsyncIteratorPrototype%": v ? p(v) : n,
                        "%Atomics%": "undefined" == typeof Atomics ? n : Atomics,
                        "%BigInt%": "undefined" == typeof BigInt ? n : BigInt,
                        "%Boolean%": Boolean,
                        "%DataView%": "undefined" == typeof DataView ? n : DataView,
                        "%Date%": Date,
                        "%decodeURI%": decodeURI,
                        "%decodeURIComponent%": decodeURIComponent,
                        "%encodeURI%": encodeURI,
                        "%encodeURIComponent%": encodeURIComponent,
                        "%Error%": Error,
                        "%eval%": eval,
                        "%EvalError%": EvalError,
                        "%Float32Array%": "undefined" == typeof Float32Array ? n : Float32Array,
                        "%Float64Array%": "undefined" == typeof Float64Array ? n : Float64Array,
                        "%FinalizationRegistry%": "undefined" == typeof FinalizationRegistry ? n : FinalizationRegistry,
                        "%Function%": i,
                        "%GeneratorFunction%": u("function* () {}"),
                        "%Int8Array%": "undefined" == typeof Int8Array ? n : Int8Array,
                        "%Int16Array%": "undefined" == typeof Int16Array ? n : Int16Array,
                        "%Int32Array%": "undefined" == typeof Int32Array ? n : Int32Array,
                        "%isFinite%": isFinite,
                        "%isNaN%": isNaN,
                        "%IteratorPrototype%": f ? p(p([][Symbol.iterator]())) : n,
                        "%JSON%": "object" == typeof JSON ? JSON : n,
                        "%Map%": "undefined" == typeof Map ? n : Map,
                        "%MapIteratorPrototype%": "undefined" != typeof Map && f ? p((new Map)[Symbol.iterator]()) : n,
                        "%Math%": Math,
                        "%Number%": Number,
                        "%Object%": Object,
                        "%parseFloat%": parseFloat,
                        "%parseInt%": parseInt,
                        "%Promise%": "undefined" == typeof Promise ? n : Promise,
                        "%Proxy%": "undefined" == typeof Proxy ? n : Proxy,
                        "%RangeError%": RangeError,
                        "%ReferenceError%": ReferenceError,
                        "%Reflect%": "undefined" == typeof Reflect ? n : Reflect,
                        "%RegExp%": RegExp,
                        "%Set%": "undefined" == typeof Set ? n : Set,
                        "%SetIteratorPrototype%": "undefined" != typeof Set && f ? p((new Set)[Symbol.iterator]()) : n,
                        "%SharedArrayBuffer%": "undefined" == typeof SharedArrayBuffer ? n : SharedArrayBuffer,
                        "%String%": String,
                        "%StringIteratorPrototype%": f ? p("" [Symbol.iterator]()) : n,
                        "%Symbol%": f ? Symbol : n,
                        "%SyntaxError%": o,
                        "%ThrowTypeError%": s,
                        "%TypedArray%": m,
                        "%TypeError%": a,
                        "%Uint8Array%": "undefined" == typeof Uint8Array ? n : Uint8Array,
                        "%Uint8ClampedArray%": "undefined" == typeof Uint8ClampedArray ? n : Uint8ClampedArray,
                        "%Uint16Array%": "undefined" == typeof Uint16Array ? n : Uint16Array,
                        "%Uint32Array%": "undefined" == typeof Uint32Array ? n : Uint32Array,
                        "%URIError%": URIError,
                        "%WeakMap%": "undefined" == typeof WeakMap ? n : WeakMap,
                        "%WeakRef%": "undefined" == typeof WeakRef ? n : WeakRef,
                        "%WeakSet%": "undefined" == typeof WeakSet ? n : WeakSet
                    },
                    g = {
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
                    b = r(79138),
                    w = r(92571),
                    S = b.call(Function.call, Array.prototype.concat),
                    A = b.call(Function.apply, Array.prototype.splice),
                    x = b.call(Function.call, String.prototype.replace),
                    E = /[^%.[\]]+|\[(?:(-?\d+(?:\.\d+)?)|(["'])((?:(?!\2)[^\\]|\\.)*?)\2)\]|(?=(?:\.|\[\])(?:\.|\[\]|%$))/g,
                    O = /\\(\\)?/g;
                e.exports = function(e, t) {
                    if ("string" != typeof e || 0 === e.length) throw new a("intrinsic name must be a non-empty string");
                    if (arguments.length > 1 && "boolean" != typeof t) throw new a('"allowMissing" argument must be a boolean');
                    var r, n = (r = [], x(e, E, (function(e, t, n, o) {
                            r[r.length] = n ? x(o, O, "$1") : t || e
                        })), r),
                        i = n.length > 0 ? n[0] : "",
                        u = function(e, t) {
                            var r, n = e;
                            if (w(g, n) && (n = "%" + (r = g[n])[0] + "%"), w(h, n)) {
                                var i = h[n];
                                if (void 0 === i && !t) throw new a("intrinsic " + e + " exists, but is not available. Please file an issue!");
                                return {
                                    alias: r,
                                    name: n,
                                    value: i
                                }
                            }
                            throw new o("intrinsic " + e + " does not exist!")
                        }("%" + i + "%", t),
                        l = u.name,
                        s = u.value,
                        f = !1,
                        p = u.alias;
                    p && (i = p[0], A(n, S([0, 1], p)));
                    for (var d = 1, y = !0; d < n.length; d += 1) {
                        var v = n[d];
                        if ("constructor" !== v && y || (f = !0), w(h, l = "%" + (i += "." + v) + "%")) s = h[l];
                        else if (null != s) {
                            if (c && d + 1 >= n.length) {
                                var m = c(s, v);
                                if (y = !!m, !t && !(v in s)) throw new a("base intrinsic for " + e + " exists, but the property is not available.");
                                s = y && "get" in m && !("originalValue" in m.get) ? m.get : s[v]
                            } else y = w(s, v), s = s[v];
                            y && !f && (h[l] = s)
                        }
                    }
                    return s
                }
            },
            69336: function(e, t, r) {
                "use strict";
                var n = r(57718)("%Object.getOwnPropertyDescriptor%", !0);
                if (n) try {
                    n([], "length")
                } catch (e) {
                    n = null
                }
                e.exports = n
            },
            75648: function(e) {
                "use strict";
                var t = Object.prototype.toString,
                    r = Math.max,
                    n = function(e, t) {
                        for (var r = [], n = 0; n < e.length; n += 1) r[n] = e[n];
                        for (var o = 0; o < t.length; o += 1) r[o + e.length] = t[o];
                        return r
                    };
                e.exports = function(e) {
                    var o = this;
                    if ("function" != typeof o || "[object Function]" !== t.apply(o)) throw new TypeError("Function.prototype.bind called on incompatible " + o);
                    for (var i, a = function(e, t) {
                            for (var r = [], n = t || 0, o = 0; n < e.length; n += 1, o += 1) r[o] = e[n];
                            return r
                        }(arguments, 1), u = r(0, o.length - a.length), c = [], l = 0; l < u; l++) c[l] = "$" + l;
                    if (i = Function("binder", "return function (" + function(e, t) {
                            for (var r = "", n = 0; n < e.length; n += 1) r += e[n], n + 1 < e.length && (r += t);
                            return r
                        }(c, ",") + "){ return binder.apply(this,arguments); }")((function() {
                            if (this instanceof i) {
                                var t = o.apply(this, n(a, arguments));
                                return Object(t) === t ? t : this
                            }
                            return o.apply(e, n(a, arguments))
                        })), o.prototype) {
                        var s = function() {};
                        s.prototype = o.prototype, i.prototype = new s, s.prototype = null
                    }
                    return i
                }
            },
            71452: function(e, t, r) {
                "use strict";
                var n = r(75648);
                e.exports = Function.prototype.bind || n
            },
            57718: function(e, t, r) {
                "use strict";
                var n, o = r(29838),
                    i = r(29110),
                    a = r(61155),
                    u = r(94943),
                    c = r(5731),
                    l = r(3468),
                    s = r(32140),
                    f = Function,
                    p = function(e) {
                        try {
                            return f('"use strict"; return (' + e + ").constructor;")()
                        } catch (e) {}
                    },
                    d = Object.getOwnPropertyDescriptor;
                if (d) try {
                    d({}, "")
                } catch (e) {
                    d = null
                }
                var y = function() {
                        throw new l
                    },
                    v = d ? function() {
                        try {
                            return y
                        } catch (e) {
                            try {
                                return d(arguments, "callee").get
                            } catch (e) {
                                return y
                            }
                        }
                    }() : y,
                    m = r(49832)(),
                    h = r(66869)(),
                    g = Object.getPrototypeOf || (h ? function(e) {
                        return e.__proto__
                    } : null),
                    b = {},
                    w = "undefined" != typeof Uint8Array && g ? g(Uint8Array) : n,
                    S = {
                        __proto__: null,
                        "%AggregateError%": "undefined" == typeof AggregateError ? n : AggregateError,
                        "%Array%": Array,
                        "%ArrayBuffer%": "undefined" == typeof ArrayBuffer ? n : ArrayBuffer,
                        "%ArrayIteratorPrototype%": m && g ? g([][Symbol.iterator]()) : n,
                        "%AsyncFromSyncIteratorPrototype%": n,
                        "%AsyncFunction%": b,
                        "%AsyncGenerator%": b,
                        "%AsyncGeneratorFunction%": b,
                        "%AsyncIteratorPrototype%": b,
                        "%Atomics%": "undefined" == typeof Atomics ? n : Atomics,
                        "%BigInt%": "undefined" == typeof BigInt ? n : BigInt,
                        "%BigInt64Array%": "undefined" == typeof BigInt64Array ? n : BigInt64Array,
                        "%BigUint64Array%": "undefined" == typeof BigUint64Array ? n : BigUint64Array,
                        "%Boolean%": Boolean,
                        "%DataView%": "undefined" == typeof DataView ? n : DataView,
                        "%Date%": Date,
                        "%decodeURI%": decodeURI,
                        "%decodeURIComponent%": decodeURIComponent,
                        "%encodeURI%": encodeURI,
                        "%encodeURIComponent%": encodeURIComponent,
                        "%Error%": o,
                        "%eval%": eval,
                        "%EvalError%": i,
                        "%Float32Array%": "undefined" == typeof Float32Array ? n : Float32Array,
                        "%Float64Array%": "undefined" == typeof Float64Array ? n : Float64Array,
                        "%FinalizationRegistry%": "undefined" == typeof FinalizationRegistry ? n : FinalizationRegistry,
                        "%Function%": f,
                        "%GeneratorFunction%": b,
                        "%Int8Array%": "undefined" == typeof Int8Array ? n : Int8Array,
                        "%Int16Array%": "undefined" == typeof Int16Array ? n : Int16Array,
                        "%Int32Array%": "undefined" == typeof Int32Array ? n : Int32Array,
                        "%isFinite%": isFinite,
                        "%isNaN%": isNaN,
                        "%IteratorPrototype%": m && g ? g(g([][Symbol.iterator]())) : n,
                        "%JSON%": "object" == typeof JSON ? JSON : n,
                        "%Map%": "undefined" == typeof Map ? n : Map,
                        "%MapIteratorPrototype%": "undefined" != typeof Map && m && g ? g((new Map)[Symbol.iterator]()) : n,
                        "%Math%": Math,
                        "%Number%": Number,
                        "%Object%": Object,
                        "%parseFloat%": parseFloat,
                        "%parseInt%": parseInt,
                        "%Promise%": "undefined" == typeof Promise ? n : Promise,
                        "%Proxy%": "undefined" == typeof Proxy ? n : Proxy,
                        "%RangeError%": a,
                        "%ReferenceError%": u,
                        "%Reflect%": "undefined" == typeof Reflect ? n : Reflect,
                        "%RegExp%": RegExp,
                        "%Set%": "undefined" == typeof Set ? n : Set,
                        "%SetIteratorPrototype%": "undefined" != typeof Set && m && g ? g((new Set)[Symbol.iterator]()) : n,
                        "%SharedArrayBuffer%": "undefined" == typeof SharedArrayBuffer ? n : SharedArrayBuffer,
                        "%String%": String,
                        "%StringIteratorPrototype%": m && g ? g("" [Symbol.iterator]()) : n,
                        "%Symbol%": m ? Symbol : n,
                        "%SyntaxError%": c,
                        "%ThrowTypeError%": v,
                        "%TypedArray%": w,
                        "%TypeError%": l,
                        "%Uint8Array%": "undefined" == typeof Uint8Array ? n : Uint8Array,
                        "%Uint8ClampedArray%": "undefined" == typeof Uint8ClampedArray ? n : Uint8ClampedArray,
                        "%Uint16Array%": "undefined" == typeof Uint16Array ? n : Uint16Array,
                        "%Uint32Array%": "undefined" == typeof Uint32Array ? n : Uint32Array,
                        "%URIError%": s,
                        "%WeakMap%": "undefined" == typeof WeakMap ? n : WeakMap,
                        "%WeakRef%": "undefined" == typeof WeakRef ? n : WeakRef,
                        "%WeakSet%": "undefined" == typeof WeakSet ? n : WeakSet
                    };
                if (g) try {
                    null.error
                } catch (e) {
                    var A = g(g(e));
                    S["%Error.prototype%"] = A
                }
                var x = function e(t) {
                        var r;
                        if ("%AsyncFunction%" === t) r = p("async function () {}");
                        else if ("%GeneratorFunction%" === t) r = p("function* () {}");
                        else if ("%AsyncGeneratorFunction%" === t) r = p("async function* () {}");
                        else if ("%AsyncGenerator%" === t) {
                            var n = e("%AsyncGeneratorFunction%");
                            n && (r = n.prototype)
                        } else if ("%AsyncIteratorPrototype%" === t) {
                            var o = e("%AsyncGenerator%");
                            o && g && (r = g(o.prototype))
                        }
                        return S[t] = r, r
                    },
                    E = {
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
                    O = r(71452),
                    P = r(78554),
                    j = O.call(Function.call, Array.prototype.concat),
                    R = O.call(Function.apply, Array.prototype.splice),
                    I = O.call(Function.call, String.prototype.replace),
                    C = O.call(Function.call, String.prototype.slice),
                    k = O.call(Function.call, RegExp.prototype.exec),
                    F = /[^%.[\]]+|\[(?:(-?\d+(?:\.\d+)?)|(["'])((?:(?!\2)[^\\]|\\.)*?)\2)\]|(?=(?:\.|\[\])(?:\.|\[\]|%$))/g,
                    N = /\\(\\)?/g,
                    T = function(e, t) {
                        var r, n = e;
                        if (P(E, n) && (n = "%" + (r = E[n])[0] + "%"), P(S, n)) {
                            var o = S[n];
                            if (o === b && (o = x(n)), void 0 === o && !t) throw new l("intrinsic " + e + " exists, but is not available. Please file an issue!");
                            return {
                                alias: r,
                                name: n,
                                value: o
                            }
                        }
                        throw new c("intrinsic " + e + " does not exist!")
                    };
                e.exports = function(e, t) {
                    if ("string" != typeof e || 0 === e.length) throw new l("intrinsic name must be a non-empty string");
                    if (arguments.length > 1 && "boolean" != typeof t) throw new l('"allowMissing" argument must be a boolean');
                    if (null === k(/^%?[^%]*%?$/, e)) throw new c("`%` may not be present anywhere but at the beginning and end of the intrinsic name");
                    var r = function(e) {
                            var t = C(e, 0, 1),
                                r = C(e, -1);
                            if ("%" === t && "%" !== r) throw new c("invalid intrinsic syntax, expected closing `%`");
                            if ("%" === r && "%" !== t) throw new c("invalid intrinsic syntax, expected opening `%`");
                            var n = [];
                            return I(e, F, (function(e, t, r, o) {
                                n[n.length] = r ? I(o, N, "$1") : t || e
                            })), n
                        }(e),
                        n = r.length > 0 ? r[0] : "",
                        o = T("%" + n + "%", t),
                        i = o.name,
                        a = o.value,
                        u = !1,
                        s = o.alias;
                    s && (n = s[0], R(r, j([0, 1], s)));
                    for (var f = 1, p = !0; f < r.length; f += 1) {
                        var y = r[f],
                            v = C(y, 0, 1),
                            m = C(y, -1);
                        if (('"' === v || "'" === v || "`" === v || '"' === m || "'" === m || "`" === m) && v !== m) throw new c("property names with quotes must have matching quotes");
                        if ("constructor" !== y && p || (u = !0), P(S, i = "%" + (n += "." + y) + "%")) a = S[i];
                        else if (null != a) {
                            if (!(y in a)) {
                                if (!t) throw new l("base intrinsic for " + e + " exists, but the property is not available.");
                                return
                            }
                            if (d && f + 1 >= r.length) {
                                var h = d(a, y);
                                a = (p = !!h) && "get" in h && !("originalValue" in h.get) ? h.get : a[y]
                            } else p = P(a, y), a = a[y];
                            p && !u && (S[i] = a)
                        }
                    }
                    return a
                }
            },
            49832: function(e, t, r) {
                "use strict";
                var n = "undefined" != typeof Symbol && Symbol,
                    o = r(46394);
                e.exports = function() {
                    return "function" == typeof n && ("function" == typeof Symbol && ("symbol" == typeof n("foo") && ("symbol" == typeof Symbol("bar") && o())))
                }
            },
            46394: function(e) {
                "use strict";
                e.exports = function() {
                    if ("function" != typeof Symbol || "function" != typeof Object.getOwnPropertySymbols) return !1;
                    if ("symbol" == typeof Symbol.iterator) return !0;
                    var e = {},
                        t = Symbol("test"),
                        r = Object(t);
                    if ("string" == typeof t) return !1;
                    if ("[object Symbol]" !== Object.prototype.toString.call(t)) return !1;
                    if ("[object Symbol]" !== Object.prototype.toString.call(r)) return !1;
                    for (t in e[t] = 42, e) return !1;
                    if ("function" == typeof Object.keys && 0 !== Object.keys(e).length) return !1;
                    if ("function" == typeof Object.getOwnPropertyNames && 0 !== Object.getOwnPropertyNames(e).length) return !1;
                    var n = Object.getOwnPropertySymbols(e);
                    if (1 !== n.length || n[0] !== t) return !1;
                    if (!Object.prototype.propertyIsEnumerable.call(e, t)) return !1;
                    if ("function" == typeof Object.getOwnPropertyDescriptor) {
                        var o = Object.getOwnPropertyDescriptor(e, t);
                        if (42 !== o.value || !0 !== o.enumerable) return !1
                    }
                    return !0
                }
            },
            17239: function(e, t, r) {
                "use strict";
                var n = r(64940),
                    o = function() {
                        return !!n
                    };
                o.hasArrayLengthDefineBug = function() {
                    if (!n) return null;
                    try {
                        return 1 !== n([], "length", {
                            value: 1
                        }).length
                    } catch (e) {
                        return !0
                    }
                }, e.exports = o
            },
            66869: function(e) {
                "use strict";
                var t = {
                        __proto__: null,
                        foo: {}
                    },
                    r = Object;
                e.exports = function() {
                    return {
                        __proto__: t
                    }.foo === t.foo && !(t instanceof r)
                }
            },
            53558: function(e, t, r) {
                "use strict";
                var n = r.g.Symbol,
                    o = r(62908);
                e.exports = function() {
                    return "function" == typeof n && ("function" == typeof Symbol && ("symbol" == typeof n("foo") && ("symbol" == typeof Symbol("bar") && o())))
                }
            },
            62908: function(e) {
                "use strict";
                e.exports = function() {
                    if ("function" != typeof Symbol || "function" != typeof Object.getOwnPropertySymbols) return !1;
                    if ("symbol" == typeof Symbol.iterator) return !0;
                    var e = {},
                        t = Symbol("test"),
                        r = Object(t);
                    if ("string" == typeof t) return !1;
                    if ("[object Symbol]" !== Object.prototype.toString.call(t)) return !1;
                    if ("[object Symbol]" !== Object.prototype.toString.call(r)) return !1;
                    for (t in e[t] = 42, e) return !1;
                    if ("function" == typeof Object.keys && 0 !== Object.keys(e).length) return !1;
                    if ("function" == typeof Object.getOwnPropertyNames && 0 !== Object.getOwnPropertyNames(e).length) return !1;
                    var n = Object.getOwnPropertySymbols(e);
                    if (1 !== n.length || n[0] !== t) return !1;
                    if (!Object.prototype.propertyIsEnumerable.call(e, t)) return !1;
                    if ("function" == typeof Object.getOwnPropertyDescriptor) {
                        var o = Object.getOwnPropertyDescriptor(e, t);
                        if (42 !== o.value || !0 !== o.enumerable) return !1
                    }
                    return !0
                }
            },
            34811: function(e) {
                "use strict";
                e.exports = function() {
                    if ("function" != typeof Symbol || "function" != typeof Object.getOwnPropertySymbols) return !1;
                    if ("symbol" == typeof Symbol.iterator) return !0;
                    var e = {},
                        t = Symbol("test"),
                        r = Object(t);
                    if ("string" == typeof t) return !1;
                    if ("[object Symbol]" !== Object.prototype.toString.call(t)) return !1;
                    if ("[object Symbol]" !== Object.prototype.toString.call(r)) return !1;
                    for (t in e[t] = 42, e) return !1;
                    if ("function" == typeof Object.keys && 0 !== Object.keys(e).length) return !1;
                    if ("function" == typeof Object.getOwnPropertyNames && 0 !== Object.getOwnPropertyNames(e).length) return !1;
                    var n = Object.getOwnPropertySymbols(e);
                    if (1 !== n.length || n[0] !== t) return !1;
                    if (!Object.prototype.propertyIsEnumerable.call(e, t)) return !1;
                    if ("function" == typeof Object.getOwnPropertyDescriptor) {
                        var o = Object.getOwnPropertyDescriptor(e, t);
                        if (42 !== o.value || !0 !== o.enumerable) return !1
                    }
                    return !0
                }
            },
            51913: function(e, t, r) {
                "use strict";
                var n = r(34811);
                e.exports = function() {
                    return n() && !!Symbol.toStringTag
                }
            },
            92571: function(e, t, r) {
                "use strict";
                var n = r(79138);
                e.exports = n.call(Function.call, Object.prototype.hasOwnProperty)
            },
            78554: function(e, t, r) {
                "use strict";
                var n = Function.prototype.call,
                    o = Object.prototype.hasOwnProperty,
                    i = r(72434);
                e.exports = i.call(n, o)
            },
            30442: function(e) {
                "use strict";
                var t = Object.prototype.toString,
                    r = Math.max,
                    n = function(e, t) {
                        for (var r = [], n = 0; n < e.length; n += 1) r[n] = e[n];
                        for (var o = 0; o < t.length; o += 1) r[o + e.length] = t[o];
                        return r
                    };
                e.exports = function(e) {
                    var o = this;
                    if ("function" != typeof o || "[object Function]" !== t.apply(o)) throw new TypeError("Function.prototype.bind called on incompatible " + o);
                    for (var i, a = function(e, t) {
                            for (var r = [], n = t || 0, o = 0; n < e.length; n += 1, o += 1) r[o] = e[n];
                            return r
                        }(arguments, 1), u = r(0, o.length - a.length), c = [], l = 0; l < u; l++) c[l] = "$" + l;
                    if (i = Function("binder", "return function (" + function(e, t) {
                            for (var r = "", n = 0; n < e.length; n += 1) r += e[n], n + 1 < e.length && (r += t);
                            return r
                        }(c, ",") + "){ return binder.apply(this,arguments); }")((function() {
                            if (this instanceof i) {
                                var t = o.apply(this, n(a, arguments));
                                return Object(t) === t ? t : this
                            }
                            return o.apply(e, n(a, arguments))
                        })), o.prototype) {
                        var s = function() {};
                        s.prototype = o.prototype, i.prototype = new s, s.prototype = null
                    }
                    return i
                }
            },
            72434: function(e, t, r) {
                "use strict";
                var n = r(30442);
                e.exports = Function.prototype.bind || n
            },
            35615: function(e) {
                "function" == typeof Object.create ? e.exports = function(e, t) {
                    t && (e.super_ = t, e.prototype = Object.create(t.prototype, {
                        constructor: {
                            value: e,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }))
                } : e.exports = function(e, t) {
                    if (t) {
                        e.super_ = t;
                        var r = function() {};
                        r.prototype = t.prototype, e.prototype = new r, e.prototype.constructor = e
                    }
                }
            },
            55387: function(e, t, r) {
                "use strict";
                var n = r(51913)(),
                    o = r(76409)("Object.prototype.toString"),
                    i = function(e) {
                        return !(n && e && "object" == typeof e && Symbol.toStringTag in e) && "[object Arguments]" === o(e)
                    },
                    a = function(e) {
                        return !!i(e) || null !== e && "object" == typeof e && "number" == typeof e.length && e.length >= 0 && "[object Array]" !== o(e) && "[object Function]" === o(e.callee)
                    },
                    u = function() {
                        return i(arguments)
                    }();
                i.isLegacyArguments = a, e.exports = u ? i : a
            },
            76409: function(e, t, r) {
                "use strict";
                var n = r(41019),
                    o = r(51257),
                    i = o(n("String.prototype.indexOf"));
                e.exports = function(e, t) {
                    var r = n(e, !!t);
                    return "function" == typeof r && i(e, ".prototype.") > -1 ? o(r) : r
                }
            },
            51257: function(e, t, r) {
                "use strict";
                var n = r(44041),
                    o = r(41019),
                    i = r(26108),
                    a = r(3468),
                    u = o("%Function.prototype.apply%"),
                    c = o("%Function.prototype.call%"),
                    l = o("%Reflect.apply%", !0) || n.call(c, u),
                    s = r(64940),
                    f = o("%Math.max%");
                e.exports = function(e) {
                    if ("function" != typeof e) throw new a("a function is required");
                    var t = l(n, c, arguments);
                    return i(t, 1 + f(0, e.length - (arguments.length - 1)), !0)
                };
                var p = function() {
                    return l(n, u, arguments)
                };
                s ? s(e.exports, "apply", {
                    value: p
                }) : e.exports.apply = p
            },
            42751: function(e) {
                "use strict";
                var t = Object.prototype.toString,
                    r = Math.max,
                    n = function(e, t) {
                        for (var r = [], n = 0; n < e.length; n += 1) r[n] = e[n];
                        for (var o = 0; o < t.length; o += 1) r[o + e.length] = t[o];
                        return r
                    };
                e.exports = function(e) {
                    var o = this;
                    if ("function" != typeof o || "[object Function]" !== t.apply(o)) throw new TypeError("Function.prototype.bind called on incompatible " + o);
                    for (var i, a = function(e, t) {
                            for (var r = [], n = t || 0, o = 0; n < e.length; n += 1, o += 1) r[o] = e[n];
                            return r
                        }(arguments, 1), u = r(0, o.length - a.length), c = [], l = 0; l < u; l++) c[l] = "$" + l;
                    if (i = Function("binder", "return function (" + function(e, t) {
                            for (var r = "", n = 0; n < e.length; n += 1) r += e[n], n + 1 < e.length && (r += t);
                            return r
                        }(c, ",") + "){ return binder.apply(this,arguments); }")((function() {
                            if (this instanceof i) {
                                var t = o.apply(this, n(a, arguments));
                                return Object(t) === t ? t : this
                            }
                            return o.apply(e, n(a, arguments))
                        })), o.prototype) {
                        var s = function() {};
                        s.prototype = o.prototype, i.prototype = new s, s.prototype = null
                    }
                    return i
                }
            },
            44041: function(e, t, r) {
                "use strict";
                var n = r(42751);
                e.exports = Function.prototype.bind || n
            },
            41019: function(e, t, r) {
                "use strict";
                var n, o = r(29838),
                    i = r(29110),
                    a = r(61155),
                    u = r(94943),
                    c = r(5731),
                    l = r(3468),
                    s = r(32140),
                    f = Function,
                    p = function(e) {
                        try {
                            return f('"use strict"; return (' + e + ").constructor;")()
                        } catch (e) {}
                    },
                    d = Object.getOwnPropertyDescriptor;
                if (d) try {
                    d({}, "")
                } catch (e) {
                    d = null
                }
                var y = function() {
                        throw new l
                    },
                    v = d ? function() {
                        try {
                            return y
                        } catch (e) {
                            try {
                                return d(arguments, "callee").get
                            } catch (e) {
                                return y
                            }
                        }
                    }() : y,
                    m = r(23833)(),
                    h = r(66869)(),
                    g = Object.getPrototypeOf || (h ? function(e) {
                        return e.__proto__
                    } : null),
                    b = {},
                    w = "undefined" != typeof Uint8Array && g ? g(Uint8Array) : n,
                    S = {
                        __proto__: null,
                        "%AggregateError%": "undefined" == typeof AggregateError ? n : AggregateError,
                        "%Array%": Array,
                        "%ArrayBuffer%": "undefined" == typeof ArrayBuffer ? n : ArrayBuffer,
                        "%ArrayIteratorPrototype%": m && g ? g([][Symbol.iterator]()) : n,
                        "%AsyncFromSyncIteratorPrototype%": n,
                        "%AsyncFunction%": b,
                        "%AsyncGenerator%": b,
                        "%AsyncGeneratorFunction%": b,
                        "%AsyncIteratorPrototype%": b,
                        "%Atomics%": "undefined" == typeof Atomics ? n : Atomics,
                        "%BigInt%": "undefined" == typeof BigInt ? n : BigInt,
                        "%BigInt64Array%": "undefined" == typeof BigInt64Array ? n : BigInt64Array,
                        "%BigUint64Array%": "undefined" == typeof BigUint64Array ? n : BigUint64Array,
                        "%Boolean%": Boolean,
                        "%DataView%": "undefined" == typeof DataView ? n : DataView,
                        "%Date%": Date,
                        "%decodeURI%": decodeURI,
                        "%decodeURIComponent%": decodeURIComponent,
                        "%encodeURI%": encodeURI,
                        "%encodeURIComponent%": encodeURIComponent,
                        "%Error%": o,
                        "%eval%": eval,
                        "%EvalError%": i,
                        "%Float32Array%": "undefined" == typeof Float32Array ? n : Float32Array,
                        "%Float64Array%": "undefined" == typeof Float64Array ? n : Float64Array,
                        "%FinalizationRegistry%": "undefined" == typeof FinalizationRegistry ? n : FinalizationRegistry,
                        "%Function%": f,
                        "%GeneratorFunction%": b,
                        "%Int8Array%": "undefined" == typeof Int8Array ? n : Int8Array,
                        "%Int16Array%": "undefined" == typeof Int16Array ? n : Int16Array,
                        "%Int32Array%": "undefined" == typeof Int32Array ? n : Int32Array,
                        "%isFinite%": isFinite,
                        "%isNaN%": isNaN,
                        "%IteratorPrototype%": m && g ? g(g([][Symbol.iterator]())) : n,
                        "%JSON%": "object" == typeof JSON ? JSON : n,
                        "%Map%": "undefined" == typeof Map ? n : Map,
                        "%MapIteratorPrototype%": "undefined" != typeof Map && m && g ? g((new Map)[Symbol.iterator]()) : n,
                        "%Math%": Math,
                        "%Number%": Number,
                        "%Object%": Object,
                        "%parseFloat%": parseFloat,
                        "%parseInt%": parseInt,
                        "%Promise%": "undefined" == typeof Promise ? n : Promise,
                        "%Proxy%": "undefined" == typeof Proxy ? n : Proxy,
                        "%RangeError%": a,
                        "%ReferenceError%": u,
                        "%Reflect%": "undefined" == typeof Reflect ? n : Reflect,
                        "%RegExp%": RegExp,
                        "%Set%": "undefined" == typeof Set ? n : Set,
                        "%SetIteratorPrototype%": "undefined" != typeof Set && m && g ? g((new Set)[Symbol.iterator]()) : n,
                        "%SharedArrayBuffer%": "undefined" == typeof SharedArrayBuffer ? n : SharedArrayBuffer,
                        "%String%": String,
                        "%StringIteratorPrototype%": m && g ? g("" [Symbol.iterator]()) : n,
                        "%Symbol%": m ? Symbol : n,
                        "%SyntaxError%": c,
                        "%ThrowTypeError%": v,
                        "%TypedArray%": w,
                        "%TypeError%": l,
                        "%Uint8Array%": "undefined" == typeof Uint8Array ? n : Uint8Array,
                        "%Uint8ClampedArray%": "undefined" == typeof Uint8ClampedArray ? n : Uint8ClampedArray,
                        "%Uint16Array%": "undefined" == typeof Uint16Array ? n : Uint16Array,
                        "%Uint32Array%": "undefined" == typeof Uint32Array ? n : Uint32Array,
                        "%URIError%": s,
                        "%WeakMap%": "undefined" == typeof WeakMap ? n : WeakMap,
                        "%WeakRef%": "undefined" == typeof WeakRef ? n : WeakRef,
                        "%WeakSet%": "undefined" == typeof WeakSet ? n : WeakSet
                    };
                if (g) try {
                    null.error
                } catch (e) {
                    var A = g(g(e));
                    S["%Error.prototype%"] = A
                }
                var x = function e(t) {
                        var r;
                        if ("%AsyncFunction%" === t) r = p("async function () {}");
                        else if ("%GeneratorFunction%" === t) r = p("function* () {}");
                        else if ("%AsyncGeneratorFunction%" === t) r = p("async function* () {}");
                        else if ("%AsyncGenerator%" === t) {
                            var n = e("%AsyncGeneratorFunction%");
                            n && (r = n.prototype)
                        } else if ("%AsyncIteratorPrototype%" === t) {
                            var o = e("%AsyncGenerator%");
                            o && g && (r = g(o.prototype))
                        }
                        return S[t] = r, r
                    },
                    E = {
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
                    O = r(44041),
                    P = r(78554),
                    j = O.call(Function.call, Array.prototype.concat),
                    R = O.call(Function.apply, Array.prototype.splice),
                    I = O.call(Function.call, String.prototype.replace),
                    C = O.call(Function.call, String.prototype.slice),
                    k = O.call(Function.call, RegExp.prototype.exec),
                    F = /[^%.[\]]+|\[(?:(-?\d+(?:\.\d+)?)|(["'])((?:(?!\2)[^\\]|\\.)*?)\2)\]|(?=(?:\.|\[\])(?:\.|\[\]|%$))/g,
                    N = /\\(\\)?/g,
                    T = function(e, t) {
                        var r, n = e;
                        if (P(E, n) && (n = "%" + (r = E[n])[0] + "%"), P(S, n)) {
                            var o = S[n];
                            if (o === b && (o = x(n)), void 0 === o && !t) throw new l("intrinsic " + e + " exists, but is not available. Please file an issue!");
                            return {
                                alias: r,
                                name: n,
                                value: o
                            }
                        }
                        throw new c("intrinsic " + e + " does not exist!")
                    };
                e.exports = function(e, t) {
                    if ("string" != typeof e || 0 === e.length) throw new l("intrinsic name must be a non-empty string");
                    if (arguments.length > 1 && "boolean" != typeof t) throw new l('"allowMissing" argument must be a boolean');
                    if (null === k(/^%?[^%]*%?$/, e)) throw new c("`%` may not be present anywhere but at the beginning and end of the intrinsic name");
                    var r = function(e) {
                            var t = C(e, 0, 1),
                                r = C(e, -1);
                            if ("%" === t && "%" !== r) throw new c("invalid intrinsic syntax, expected closing `%`");
                            if ("%" === r && "%" !== t) throw new c("invalid intrinsic syntax, expected opening `%`");
                            var n = [];
                            return I(e, F, (function(e, t, r, o) {
                                n[n.length] = r ? I(o, N, "$1") : t || e
                            })), n
                        }(e),
                        n = r.length > 0 ? r[0] : "",
                        o = T("%" + n + "%", t),
                        i = o.name,
                        a = o.value,
                        u = !1,
                        s = o.alias;
                    s && (n = s[0], R(r, j([0, 1], s)));
                    for (var f = 1, p = !0; f < r.length; f += 1) {
                        var y = r[f],
                            v = C(y, 0, 1),
                            m = C(y, -1);
                        if (('"' === v || "'" === v || "`" === v || '"' === m || "'" === m || "`" === m) && v !== m) throw new c("property names with quotes must have matching quotes");
                        if ("constructor" !== y && p || (u = !0), P(S, i = "%" + (n += "." + y) + "%")) a = S[i];
                        else if (null != a) {
                            if (!(y in a)) {
                                if (!t) throw new l("base intrinsic for " + e + " exists, but the property is not available.");
                                return
                            }
                            if (d && f + 1 >= r.length) {
                                var h = d(a, y);
                                a = (p = !!h) && "get" in h && !("originalValue" in h.get) ? h.get : a[y]
                            } else p = P(a, y), a = a[y];
                            p && !u && (S[i] = a)
                        }
                    }
                    return a
                }
            },
            23833: function(e, t, r) {
                "use strict";
                var n = "undefined" != typeof Symbol && Symbol,
                    o = r(53435);
                e.exports = function() {
                    return "function" == typeof n && ("function" == typeof Symbol && ("symbol" == typeof n("foo") && ("symbol" == typeof Symbol("bar") && o())))
                }
            },
            53435: function(e) {
                "use strict";
                e.exports = function() {
                    if ("function" != typeof Symbol || "function" != typeof Object.getOwnPropertySymbols) return !1;
                    if ("symbol" == typeof Symbol.iterator) return !0;
                    var e = {},
                        t = Symbol("test"),
                        r = Object(t);
                    if ("string" == typeof t) return !1;
                    if ("[object Symbol]" !== Object.prototype.toString.call(t)) return !1;
                    if ("[object Symbol]" !== Object.prototype.toString.call(r)) return !1;
                    for (t in e[t] = 42, e) return !1;
                    if ("function" == typeof Object.keys && 0 !== Object.keys(e).length) return !1;
                    if ("function" == typeof Object.getOwnPropertyNames && 0 !== Object.getOwnPropertyNames(e).length) return !1;
                    var n = Object.getOwnPropertySymbols(e);
                    if (1 !== n.length || n[0] !== t) return !1;
                    if (!Object.prototype.propertyIsEnumerable.call(e, t)) return !1;
                    if ("function" == typeof Object.getOwnPropertyDescriptor) {
                        var o = Object.getOwnPropertyDescriptor(e, t);
                        if (42 !== o.value || !0 !== o.enumerable) return !1
                    }
                    return !0
                }
            },
            89617: function(e) {
                "use strict";
                var t, r, n = Function.prototype.toString,
                    o = "object" == typeof Reflect && null !== Reflect && Reflect.apply;
                if ("function" == typeof o && "function" == typeof Object.defineProperty) try {
                    t = Object.defineProperty({}, "length", {
                        get: function() {
                            throw r
                        }
                    }), r = {}, o((function() {
                        throw 42
                    }), null, t)
                } catch (e) {
                    e !== r && (o = null)
                } else o = null;
                var i = /^\s*class\b/,
                    a = function(e) {
                        try {
                            var t = n.call(e);
                            return i.test(t)
                        } catch (e) {
                            return !1
                        }
                    },
                    u = Object.prototype.toString,
                    c = "function" == typeof Symbol && "symbol" == typeof Symbol.toStringTag;
                e.exports = o ? function(e) {
                    if (!e) return !1;
                    if ("function" != typeof e && "object" != typeof e) return !1;
                    if ("function" == typeof e && !e.prototype) return !0;
                    try {
                        o(e, null, t)
                    } catch (e) {
                        if (e !== r) return !1
                    }
                    return !a(e)
                } : function(e) {
                    if (!e) return !1;
                    if ("function" != typeof e && "object" != typeof e) return !1;
                    if ("function" == typeof e && !e.prototype) return !0;
                    if (c) return function(e) {
                        try {
                            return !a(e) && (n.call(e), !0)
                        } catch (e) {
                            return !1
                        }
                    }(e);
                    if (a(e)) return !1;
                    var t = u.call(e);
                    return "[object Function]" === t || "[object GeneratorFunction]" === t
                }
            },
            2625: function(e, t, r) {
                "use strict";
                var n, o = Object.prototype.toString,
                    i = Function.prototype.toString,
                    a = /^\s*(?:function)?\*/,
                    u = r(51913)(),
                    c = Object.getPrototypeOf;
                e.exports = function(e) {
                    if ("function" != typeof e) return !1;
                    if (a.test(i.call(e))) return !0;
                    if (!u) return "[object GeneratorFunction]" === o.call(e);
                    if (!c) return !1;
                    if (void 0 === n) {
                        var t = function() {
                            if (!u) return !1;
                            try {
                                return Function("return function*() {}")()
                            } catch (e) {}
                        }();
                        n = !!t && c(t)
                    }
                    return c(e) === n
                }
            },
            98006: function(e) {
                "use strict";
                e.exports = function(e) {
                    return e != e
                }
            },
            7838: function(e, t, r) {
                "use strict";
                var n = r(28498),
                    o = r(41857),
                    i = r(98006),
                    a = r(41591),
                    u = r(61641),
                    c = n(a(), Number);
                o(c, {
                    getPolyfill: a,
                    implementation: i,
                    shim: u
                }), e.exports = c
            },
            41591: function(e, t, r) {
                "use strict";
                var n = r(98006);
                e.exports = function() {
                    return Number.isNaN && Number.isNaN(NaN) && !Number.isNaN("a") ? Number.isNaN : n
                }
            },
            61641: function(e, t, r) {
                "use strict";
                var n = r(41857),
                    o = r(41591);
                e.exports = function() {
                    var e = o();
                    return n(Number, {
                        isNaN: e
                    }, {
                        isNaN: function() {
                            return Number.isNaN !== e
                        }
                    }), e
                }
            },
            95943: function(e, t, r) {
                "use strict";
                var n = r(52730);
                e.exports = function(e) {
                    return !!n(e)
                }
            },
            78160: function(e, t, r) {
                "use strict";
                var n;
                if (!Object.keys) {
                    var o = Object.prototype.hasOwnProperty,
                        i = Object.prototype.toString,
                        a = r(50968),
                        u = Object.prototype.propertyIsEnumerable,
                        c = !u.call({
                            toString: null
                        }, "toString"),
                        l = u.call((function() {}), "prototype"),
                        s = ["toString", "toLocaleString", "valueOf", "hasOwnProperty", "isPrototypeOf", "propertyIsEnumerable", "constructor"],
                        f = function(e) {
                            var t = e.constructor;
                            return t && t.prototype === e
                        },
                        p = {
                            $applicationCache: !0,
                            $console: !0,
                            $external: !0,
                            $frame: !0,
                            $frameElement: !0,
                            $frames: !0,
                            $innerHeight: !0,
                            $innerWidth: !0,
                            $onmozfullscreenchange: !0,
                            $onmozfullscreenerror: !0,
                            $outerHeight: !0,
                            $outerWidth: !0,
                            $pageXOffset: !0,
                            $pageYOffset: !0,
                            $parent: !0,
                            $scrollLeft: !0,
                            $scrollTop: !0,
                            $scrollX: !0,
                            $scrollY: !0,
                            $self: !0,
                            $webkitIndexedDB: !0,
                            $webkitStorageInfo: !0,
                            $window: !0
                        },
                        d = function() {
                            if ("undefined" == typeof window) return !1;
                            for (var e in window) try {
                                if (!p["$" + e] && o.call(window, e) && null !== window[e] && "object" == typeof window[e]) try {
                                    f(window[e])
                                } catch (e) {
                                    return !0
                                }
                            } catch (e) {
                                return !0
                            }
                            return !1
                        }();
                    n = function(e) {
                        var t = null !== e && "object" == typeof e,
                            r = "[object Function]" === i.call(e),
                            n = a(e),
                            u = t && "[object String]" === i.call(e),
                            p = [];
                        if (!t && !r && !n) throw new TypeError("Object.keys called on a non-object");
                        var y = l && r;
                        if (u && e.length > 0 && !o.call(e, 0))
                            for (var v = 0; v < e.length; ++v) p.push(String(v));
                        if (n && e.length > 0)
                            for (var m = 0; m < e.length; ++m) p.push(String(m));
                        else
                            for (var h in e) y && "prototype" === h || !o.call(e, h) || p.push(String(h));
                        if (c)
                            for (var g = function(e) {
                                    if ("undefined" == typeof window || !d) return f(e);
                                    try {
                                        return f(e)
                                    } catch (e) {
                                        return !1
                                    }
                                }(e), b = 0; b < s.length; ++b) g && "constructor" === s[b] || !o.call(e, s[b]) || p.push(s[b]);
                        return p
                    }
                }
                e.exports = n
            },
            49228: function(e, t, r) {
                "use strict";
                var n = Array.prototype.slice,
                    o = r(50968),
                    i = Object.keys,
                    a = i ? function(e) {
                        return i(e)
                    } : r(78160),
                    u = Object.keys;
                a.shim = function() {
                    if (Object.keys) {
                        var e = function() {
                            var e = Object.keys(arguments);
                            return e && e.length === arguments.length
                        }(1, 2);
                        e || (Object.keys = function(e) {
                            return o(e) ? u(n.call(e)) : u(e)
                        })
                    } else Object.keys = a;
                    return Object.keys || a
                }, e.exports = a
            },
            50968: function(e) {
                "use strict";
                var t = Object.prototype.toString;
                e.exports = function(e) {
                    var r = t.call(e),
                        n = "[object Arguments]" === r;
                    return n || (n = "[object Array]" !== r && null !== e && "object" == typeof e && "number" == typeof e.length && e.length >= 0 && "[object Function]" === t.call(e.callee)), n
                }
            },
            69501: function(e) {
                "use strict";
                e.exports = ["Float32Array", "Float64Array", "Int8Array", "Int16Array", "Int32Array", "Uint8Array", "Uint8ClampedArray", "Uint16Array", "Uint32Array", "BigInt64Array", "BigUint64Array"]
            },
            39907: function(e) {
                var t, r, n = e.exports = {};

                function o() {
                    throw new Error("setTimeout has not been defined")
                }

                function i() {
                    throw new Error("clearTimeout has not been defined")
                }

                function a(e) {
                    if (t === setTimeout) return setTimeout(e, 0);
                    if ((t === o || !t) && setTimeout) return t = setTimeout, setTimeout(e, 0);
                    try {
                        return t(e, 0)
                    } catch (r) {
                        try {
                            return t.call(null, e, 0)
                        } catch (r) {
                            return t.call(this, e, 0)
                        }
                    }
                }! function() {
                    try {
                        t = "function" == typeof setTimeout ? setTimeout : o
                    } catch (e) {
                        t = o
                    }
                    try {
                        r = "function" == typeof clearTimeout ? clearTimeout : i
                    } catch (e) {
                        r = i
                    }
                }();
                var u, c = [],
                    l = !1,
                    s = -1;

                function f() {
                    l && u && (l = !1, u.length ? c = u.concat(c) : s = -1, c.length && p())
                }

                function p() {
                    if (!l) {
                        var e = a(f);
                        l = !0;
                        for (var t = c.length; t;) {
                            for (u = c, c = []; ++s < t;) u && u[s].run();
                            s = -1, t = c.length
                        }
                        u = null, l = !1,
                            function(e) {
                                if (r === clearTimeout) return clearTimeout(e);
                                if ((r === i || !r) && clearTimeout) return r = clearTimeout, clearTimeout(e);
                                try {
                                    return r(e)
                                } catch (t) {
                                    try {
                                        return r.call(null, e)
                                    } catch (t) {
                                        return r.call(this, e)
                                    }
                                }
                            }(e)
                    }
                }

                function d(e, t) {
                    this.fun = e, this.array = t
                }

                function y() {}
                n.nextTick = function(e) {
                    var t = new Array(arguments.length - 1);
                    if (arguments.length > 1)
                        for (var r = 1; r < arguments.length; r++) t[r - 1] = arguments[r];
                    c.push(new d(e, t)), 1 !== c.length || l || a(p)
                }, d.prototype.run = function() {
                    this.fun.apply(null, this.array)
                }, n.title = "browser", n.browser = !0, n.env = {}, n.argv = [], n.version = "", n.versions = {}, n.on = y, n.addListener = y, n.once = y, n.off = y, n.removeListener = y, n.removeAllListeners = y, n.emit = y, n.prependListener = y, n.prependOnceListener = y, n.listeners = function(e) {
                    return []
                }, n.binding = function(e) {
                    throw new Error("process.binding is not supported")
                }, n.cwd = function() {
                    return "/"
                }, n.chdir = function(e) {
                    throw new Error("process.chdir is not supported")
                }, n.umask = function() {
                    return 0
                }
            },
            26108: function(e, t, r) {
                "use strict";
                var n = r(61154),
                    o = r(70686),
                    i = r(17239)(),
                    a = r(69336),
                    u = r(3468),
                    c = n("%Math.floor%");
                e.exports = function(e, t) {
                    if ("function" != typeof e) throw new u("`fn` is not a function");
                    if ("number" != typeof t || t < 0 || t > 4294967295 || c(t) !== t) throw new u("`length` must be a positive 32-bit integer");
                    var r = arguments.length > 2 && !!arguments[2],
                        n = !0,
                        l = !0;
                    if ("length" in e && a) {
                        var s = a(e, "length");
                        s && !s.configurable && (n = !1), s && !s.writable && (l = !1)
                    }
                    return (n || l || !r) && (i ? o(e, "length", t, !0, !0) : o(e, "length", t)), e
                }
            },
            31196: function(e) {
                "use strict";
                var t = Object.prototype.toString,
                    r = Math.max,
                    n = function(e, t) {
                        for (var r = [], n = 0; n < e.length; n += 1) r[n] = e[n];
                        for (var o = 0; o < t.length; o += 1) r[o + e.length] = t[o];
                        return r
                    };
                e.exports = function(e) {
                    var o = this;
                    if ("function" != typeof o || "[object Function]" !== t.apply(o)) throw new TypeError("Function.prototype.bind called on incompatible " + o);
                    for (var i, a = function(e, t) {
                            for (var r = [], n = t || 0, o = 0; n < e.length; n += 1, o += 1) r[o] = e[n];
                            return r
                        }(arguments, 1), u = r(0, o.length - a.length), c = [], l = 0; l < u; l++) c[l] = "$" + l;
                    if (i = Function("binder", "return function (" + function(e, t) {
                            for (var r = "", n = 0; n < e.length; n += 1) r += e[n], n + 1 < e.length && (r += t);
                            return r
                        }(c, ",") + "){ return binder.apply(this,arguments); }")((function() {
                            if (this instanceof i) {
                                var t = o.apply(this, n(a, arguments));
                                return Object(t) === t ? t : this
                            }
                            return o.apply(e, n(a, arguments))
                        })), o.prototype) {
                        var s = function() {};
                        s.prototype = o.prototype, i.prototype = new s, s.prototype = null
                    }
                    return i
                }
            },
            8280: function(e, t, r) {
                "use strict";
                var n = r(31196);
                e.exports = Function.prototype.bind || n
            },
            61154: function(e, t, r) {
                "use strict";
                var n, o = r(29838),
                    i = r(29110),
                    a = r(61155),
                    u = r(94943),
                    c = r(5731),
                    l = r(3468),
                    s = r(32140),
                    f = Function,
                    p = function(e) {
                        try {
                            return f('"use strict"; return (' + e + ").constructor;")()
                        } catch (e) {}
                    },
                    d = Object.getOwnPropertyDescriptor;
                if (d) try {
                    d({}, "")
                } catch (e) {
                    d = null
                }
                var y = function() {
                        throw new l
                    },
                    v = d ? function() {
                        try {
                            return y
                        } catch (e) {
                            try {
                                return d(arguments, "callee").get
                            } catch (e) {
                                return y
                            }
                        }
                    }() : y,
                    m = r(80780)(),
                    h = r(66869)(),
                    g = Object.getPrototypeOf || (h ? function(e) {
                        return e.__proto__
                    } : null),
                    b = {},
                    w = "undefined" != typeof Uint8Array && g ? g(Uint8Array) : n,
                    S = {
                        __proto__: null,
                        "%AggregateError%": "undefined" == typeof AggregateError ? n : AggregateError,
                        "%Array%": Array,
                        "%ArrayBuffer%": "undefined" == typeof ArrayBuffer ? n : ArrayBuffer,
                        "%ArrayIteratorPrototype%": m && g ? g([][Symbol.iterator]()) : n,
                        "%AsyncFromSyncIteratorPrototype%": n,
                        "%AsyncFunction%": b,
                        "%AsyncGenerator%": b,
                        "%AsyncGeneratorFunction%": b,
                        "%AsyncIteratorPrototype%": b,
                        "%Atomics%": "undefined" == typeof Atomics ? n : Atomics,
                        "%BigInt%": "undefined" == typeof BigInt ? n : BigInt,
                        "%BigInt64Array%": "undefined" == typeof BigInt64Array ? n : BigInt64Array,
                        "%BigUint64Array%": "undefined" == typeof BigUint64Array ? n : BigUint64Array,
                        "%Boolean%": Boolean,
                        "%DataView%": "undefined" == typeof DataView ? n : DataView,
                        "%Date%": Date,
                        "%decodeURI%": decodeURI,
                        "%decodeURIComponent%": decodeURIComponent,
                        "%encodeURI%": encodeURI,
                        "%encodeURIComponent%": encodeURIComponent,
                        "%Error%": o,
                        "%eval%": eval,
                        "%EvalError%": i,
                        "%Float32Array%": "undefined" == typeof Float32Array ? n : Float32Array,
                        "%Float64Array%": "undefined" == typeof Float64Array ? n : Float64Array,
                        "%FinalizationRegistry%": "undefined" == typeof FinalizationRegistry ? n : FinalizationRegistry,
                        "%Function%": f,
                        "%GeneratorFunction%": b,
                        "%Int8Array%": "undefined" == typeof Int8Array ? n : Int8Array,
                        "%Int16Array%": "undefined" == typeof Int16Array ? n : Int16Array,
                        "%Int32Array%": "undefined" == typeof Int32Array ? n : Int32Array,
                        "%isFinite%": isFinite,
                        "%isNaN%": isNaN,
                        "%IteratorPrototype%": m && g ? g(g([][Symbol.iterator]())) : n,
                        "%JSON%": "object" == typeof JSON ? JSON : n,
                        "%Map%": "undefined" == typeof Map ? n : Map,
                        "%MapIteratorPrototype%": "undefined" != typeof Map && m && g ? g((new Map)[Symbol.iterator]()) : n,
                        "%Math%": Math,
                        "%Number%": Number,
                        "%Object%": Object,
                        "%parseFloat%": parseFloat,
                        "%parseInt%": parseInt,
                        "%Promise%": "undefined" == typeof Promise ? n : Promise,
                        "%Proxy%": "undefined" == typeof Proxy ? n : Proxy,
                        "%RangeError%": a,
                        "%ReferenceError%": u,
                        "%Reflect%": "undefined" == typeof Reflect ? n : Reflect,
                        "%RegExp%": RegExp,
                        "%Set%": "undefined" == typeof Set ? n : Set,
                        "%SetIteratorPrototype%": "undefined" != typeof Set && m && g ? g((new Set)[Symbol.iterator]()) : n,
                        "%SharedArrayBuffer%": "undefined" == typeof SharedArrayBuffer ? n : SharedArrayBuffer,
                        "%String%": String,
                        "%StringIteratorPrototype%": m && g ? g("" [Symbol.iterator]()) : n,
                        "%Symbol%": m ? Symbol : n,
                        "%SyntaxError%": c,
                        "%ThrowTypeError%": v,
                        "%TypedArray%": w,
                        "%TypeError%": l,
                        "%Uint8Array%": "undefined" == typeof Uint8Array ? n : Uint8Array,
                        "%Uint8ClampedArray%": "undefined" == typeof Uint8ClampedArray ? n : Uint8ClampedArray,
                        "%Uint16Array%": "undefined" == typeof Uint16Array ? n : Uint16Array,
                        "%Uint32Array%": "undefined" == typeof Uint32Array ? n : Uint32Array,
                        "%URIError%": s,
                        "%WeakMap%": "undefined" == typeof WeakMap ? n : WeakMap,
                        "%WeakRef%": "undefined" == typeof WeakRef ? n : WeakRef,
                        "%WeakSet%": "undefined" == typeof WeakSet ? n : WeakSet
                    };
                if (g) try {
                    null.error
                } catch (e) {
                    var A = g(g(e));
                    S["%Error.prototype%"] = A
                }
                var x = function e(t) {
                        var r;
                        if ("%AsyncFunction%" === t) r = p("async function () {}");
                        else if ("%GeneratorFunction%" === t) r = p("function* () {}");
                        else if ("%AsyncGeneratorFunction%" === t) r = p("async function* () {}");
                        else if ("%AsyncGenerator%" === t) {
                            var n = e("%AsyncGeneratorFunction%");
                            n && (r = n.prototype)
                        } else if ("%AsyncIteratorPrototype%" === t) {
                            var o = e("%AsyncGenerator%");
                            o && g && (r = g(o.prototype))
                        }
                        return S[t] = r, r
                    },
                    E = {
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
                    O = r(8280),
                    P = r(78554),
                    j = O.call(Function.call, Array.prototype.concat),
                    R = O.call(Function.apply, Array.prototype.splice),
                    I = O.call(Function.call, String.prototype.replace),
                    C = O.call(Function.call, String.prototype.slice),
                    k = O.call(Function.call, RegExp.prototype.exec),
                    F = /[^%.[\]]+|\[(?:(-?\d+(?:\.\d+)?)|(["'])((?:(?!\2)[^\\]|\\.)*?)\2)\]|(?=(?:\.|\[\])(?:\.|\[\]|%$))/g,
                    N = /\\(\\)?/g,
                    T = function(e, t) {
                        var r, n = e;
                        if (P(E, n) && (n = "%" + (r = E[n])[0] + "%"), P(S, n)) {
                            var o = S[n];
                            if (o === b && (o = x(n)), void 0 === o && !t) throw new l("intrinsic " + e + " exists, but is not available. Please file an issue!");
                            return {
                                alias: r,
                                name: n,
                                value: o
                            }
                        }
                        throw new c("intrinsic " + e + " does not exist!")
                    };
                e.exports = function(e, t) {
                    if ("string" != typeof e || 0 === e.length) throw new l("intrinsic name must be a non-empty string");
                    if (arguments.length > 1 && "boolean" != typeof t) throw new l('"allowMissing" argument must be a boolean');
                    if (null === k(/^%?[^%]*%?$/, e)) throw new c("`%` may not be present anywhere but at the beginning and end of the intrinsic name");
                    var r = function(e) {
                            var t = C(e, 0, 1),
                                r = C(e, -1);
                            if ("%" === t && "%" !== r) throw new c("invalid intrinsic syntax, expected closing `%`");
                            if ("%" === r && "%" !== t) throw new c("invalid intrinsic syntax, expected opening `%`");
                            var n = [];
                            return I(e, F, (function(e, t, r, o) {
                                n[n.length] = r ? I(o, N, "$1") : t || e
                            })), n
                        }(e),
                        n = r.length > 0 ? r[0] : "",
                        o = T("%" + n + "%", t),
                        i = o.name,
                        a = o.value,
                        u = !1,
                        s = o.alias;
                    s && (n = s[0], R(r, j([0, 1], s)));
                    for (var f = 1, p = !0; f < r.length; f += 1) {
                        var y = r[f],
                            v = C(y, 0, 1),
                            m = C(y, -1);
                        if (('"' === v || "'" === v || "`" === v || '"' === m || "'" === m || "`" === m) && v !== m) throw new c("property names with quotes must have matching quotes");
                        if ("constructor" !== y && p || (u = !0), P(S, i = "%" + (n += "." + y) + "%")) a = S[i];
                        else if (null != a) {
                            if (!(y in a)) {
                                if (!t) throw new l("base intrinsic for " + e + " exists, but the property is not available.");
                                return
                            }
                            if (d && f + 1 >= r.length) {
                                var h = d(a, y);
                                a = (p = !!h) && "get" in h && !("originalValue" in h.get) ? h.get : a[y]
                            } else p = P(a, y), a = a[y];
                            p && !u && (S[i] = a)
                        }
                    }
                    return a
                }
            },
            80780: function(e, t, r) {
                "use strict";
                var n = "undefined" != typeof Symbol && Symbol,
                    o = r(48558);
                e.exports = function() {
                    return "function" == typeof n && ("function" == typeof Symbol && ("symbol" == typeof n("foo") && ("symbol" == typeof Symbol("bar") && o())))
                }
            },
            48558: function(e) {
                "use strict";
                e.exports = function() {
                    if ("function" != typeof Symbol || "function" != typeof Object.getOwnPropertySymbols) return !1;
                    if ("symbol" == typeof Symbol.iterator) return !0;
                    var e = {},
                        t = Symbol("test"),
                        r = Object(t);
                    if ("string" == typeof t) return !1;
                    if ("[object Symbol]" !== Object.prototype.toString.call(t)) return !1;
                    if ("[object Symbol]" !== Object.prototype.toString.call(r)) return !1;
                    for (t in e[t] = 42, e) return !1;
                    if ("function" == typeof Object.keys && 0 !== Object.keys(e).length) return !1;
                    if ("function" == typeof Object.getOwnPropertyNames && 0 !== Object.getOwnPropertyNames(e).length) return !1;
                    var n = Object.getOwnPropertySymbols(e);
                    if (1 !== n.length || n[0] !== t) return !1;
                    if (!Object.prototype.propertyIsEnumerable.call(e, t)) return !1;
                    if ("function" == typeof Object.getOwnPropertyDescriptor) {
                        var o = Object.getOwnPropertyDescriptor(e, t);
                        if (42 !== o.value || !0 !== o.enumerable) return !1
                    }
                    return !0
                }
            },
            95272: function(e) {
                e.exports = function(e) {
                    return e && "object" == typeof e && "function" == typeof e.copy && "function" == typeof e.fill && "function" == typeof e.readUInt8
                }
            },
            51531: function(e, t, r) {
                "use strict";
                var n = r(55387),
                    o = r(2625),
                    i = r(52730),
                    a = r(95943);

                function u(e) {
                    return e.call.bind(e)
                }
                var c = "undefined" != typeof BigInt,
                    l = "undefined" != typeof Symbol,
                    s = u(Object.prototype.toString),
                    f = u(Number.prototype.valueOf),
                    p = u(String.prototype.valueOf),
                    d = u(Boolean.prototype.valueOf);
                if (c) var y = u(BigInt.prototype.valueOf);
                if (l) var v = u(Symbol.prototype.valueOf);

                function m(e, t) {
                    if ("object" != typeof e) return !1;
                    try {
                        return t(e), !0
                    } catch (e) {
                        return !1
                    }
                }

                function h(e) {
                    return "[object Map]" === s(e)
                }

                function g(e) {
                    return "[object Set]" === s(e)
                }

                function b(e) {
                    return "[object WeakMap]" === s(e)
                }

                function w(e) {
                    return "[object WeakSet]" === s(e)
                }

                function S(e) {
                    return "[object ArrayBuffer]" === s(e)
                }

                function A(e) {
                    return "undefined" != typeof ArrayBuffer && (S.working ? S(e) : e instanceof ArrayBuffer)
                }

                function x(e) {
                    return "[object DataView]" === s(e)
                }

                function E(e) {
                    return "undefined" != typeof DataView && (x.working ? x(e) : e instanceof DataView)
                }
                t.isArgumentsObject = n, t.isGeneratorFunction = o, t.isTypedArray = a, t.isPromise = function(e) {
                    return "undefined" != typeof Promise && e instanceof Promise || null !== e && "object" == typeof e && "function" == typeof e.then && "function" == typeof e.catch
                }, t.isArrayBufferView = function(e) {
                    return "undefined" != typeof ArrayBuffer && ArrayBuffer.isView ? ArrayBuffer.isView(e) : a(e) || E(e)
                }, t.isUint8Array = function(e) {
                    return "Uint8Array" === i(e)
                }, t.isUint8ClampedArray = function(e) {
                    return "Uint8ClampedArray" === i(e)
                }, t.isUint16Array = function(e) {
                    return "Uint16Array" === i(e)
                }, t.isUint32Array = function(e) {
                    return "Uint32Array" === i(e)
                }, t.isInt8Array = function(e) {
                    return "Int8Array" === i(e)
                }, t.isInt16Array = function(e) {
                    return "Int16Array" === i(e)
                }, t.isInt32Array = function(e) {
                    return "Int32Array" === i(e)
                }, t.isFloat32Array = function(e) {
                    return "Float32Array" === i(e)
                }, t.isFloat64Array = function(e) {
                    return "Float64Array" === i(e)
                }, t.isBigInt64Array = function(e) {
                    return "BigInt64Array" === i(e)
                }, t.isBigUint64Array = function(e) {
                    return "BigUint64Array" === i(e)
                }, h.working = "undefined" != typeof Map && h(new Map), t.isMap = function(e) {
                    return "undefined" != typeof Map && (h.working ? h(e) : e instanceof Map)
                }, g.working = "undefined" != typeof Set && g(new Set), t.isSet = function(e) {
                    return "undefined" != typeof Set && (g.working ? g(e) : e instanceof Set)
                }, b.working = "undefined" != typeof WeakMap && b(new WeakMap), t.isWeakMap = function(e) {
                    return "undefined" != typeof WeakMap && (b.working ? b(e) : e instanceof WeakMap)
                }, w.working = "undefined" != typeof WeakSet && w(new WeakSet), t.isWeakSet = function(e) {
                    return w(e)
                }, S.working = "undefined" != typeof ArrayBuffer && S(new ArrayBuffer), t.isArrayBuffer = A, x.working = "undefined" != typeof ArrayBuffer && "undefined" != typeof DataView && x(new DataView(new ArrayBuffer(1), 0, 1)), t.isDataView = E;
                var O = "undefined" != typeof SharedArrayBuffer ? SharedArrayBuffer : void 0;

                function P(e) {
                    return "[object SharedArrayBuffer]" === s(e)
                }

                function j(e) {
                    return void 0 !== O && (void 0 === P.working && (P.working = P(new O)), P.working ? P(e) : e instanceof O)
                }

                function R(e) {
                    return m(e, f)
                }

                function I(e) {
                    return m(e, p)
                }

                function C(e) {
                    return m(e, d)
                }

                function k(e) {
                    return c && m(e, y)
                }

                function F(e) {
                    return l && m(e, v)
                }
                t.isSharedArrayBuffer = j, t.isAsyncFunction = function(e) {
                    return "[object AsyncFunction]" === s(e)
                }, t.isMapIterator = function(e) {
                    return "[object Map Iterator]" === s(e)
                }, t.isSetIterator = function(e) {
                    return "[object Set Iterator]" === s(e)
                }, t.isGeneratorObject = function(e) {
                    return "[object Generator]" === s(e)
                }, t.isWebAssemblyCompiledModule = function(e) {
                    return "[object WebAssembly.Module]" === s(e)
                }, t.isNumberObject = R, t.isStringObject = I, t.isBooleanObject = C, t.isBigIntObject = k, t.isSymbolObject = F, t.isBoxedPrimitive = function(e) {
                    return R(e) || I(e) || C(e) || k(e) || F(e)
                }, t.isAnyArrayBuffer = function(e) {
                    return "undefined" != typeof Uint8Array && (A(e) || j(e))
                }, ["isProxy", "isExternal", "isModuleNamespaceObject"].forEach((function(e) {
                    Object.defineProperty(t, e, {
                        enumerable: !1,
                        value: function() {
                            throw new Error(e + " is not supported in userland")
                        }
                    })
                }))
            },
            49208: function(e, t, r) {
                var n = r(39907),
                    o = r(4364),
                    i = Object.getOwnPropertyDescriptors || function(e) {
                        for (var t = Object.keys(e), r = {}, n = 0; n < t.length; n++) r[t[n]] = Object.getOwnPropertyDescriptor(e, t[n]);
                        return r
                    },
                    a = /%[sdj%]/g;
                t.format = function(e) {
                    if (!w(e)) {
                        for (var t = [], r = 0; r < arguments.length; r++) t.push(s(arguments[r]));
                        return t.join(" ")
                    }
                    r = 1;
                    for (var n = arguments, o = n.length, i = String(e).replace(a, (function(e) {
                            if ("%%" === e) return "%";
                            if (r >= o) return e;
                            switch (e) {
                                case "%s":
                                    return String(n[r++]);
                                case "%d":
                                    return Number(n[r++]);
                                case "%j":
                                    try {
                                        return JSON.stringify(n[r++])
                                    } catch (e) {
                                        return "[Circular]"
                                    }
                                default:
                                    return e
                            }
                        })), u = n[r]; r < o; u = n[++r]) g(u) || !x(u) ? i += " " + u : i += " " + s(u);
                    return i
                }, t.deprecate = function(e, r) {
                    if (void 0 !== n && !0 === n.noDeprecation) return e;
                    if (void 0 === n) return function() {
                        return t.deprecate(e, r).apply(this, arguments)
                    };
                    var i = !1;
                    return function() {
                        if (!i) {
                            if (n.throwDeprecation) throw new Error(r);
                            n.traceDeprecation ? o.trace(r) : o.error(r), i = !0
                        }
                        return e.apply(this, arguments)
                    }
                };
                var u = {},
                    c = /^$/;
                if (n.env.NODE_DEBUG) {
                    var l = n.env.NODE_DEBUG;
                    l = l.replace(/[|\\{}()[\]^$+?.]/g, "\\$&").replace(/\*/g, ".*").replace(/,/g, "$|^").toUpperCase(), c = new RegExp("^" + l + "$", "i")
                }

                function s(e, r) {
                    var n = {
                        seen: [],
                        stylize: p
                    };
                    return arguments.length >= 3 && (n.depth = arguments[2]), arguments.length >= 4 && (n.colors = arguments[3]), h(r) ? n.showHidden = r : r && t._extend(n, r), S(n.showHidden) && (n.showHidden = !1), S(n.depth) && (n.depth = 2), S(n.colors) && (n.colors = !1), S(n.customInspect) && (n.customInspect = !0), n.colors && (n.stylize = f), d(n, e, n.depth)
                }

                function f(e, t) {
                    var r = s.styles[t];
                    return r ? "[" + s.colors[r][0] + "m" + e + "[" + s.colors[r][1] + "m" : e
                }

                function p(e, t) {
                    return e
                }

                function d(e, r, n) {
                    if (e.customInspect && r && P(r.inspect) && r.inspect !== t.inspect && (!r.constructor || r.constructor.prototype !== r)) {
                        var o = r.inspect(n, e);
                        return w(o) || (o = d(e, o, n)), o
                    }
                    var i = function(e, t) {
                        if (S(t)) return e.stylize("undefined", "undefined");
                        if (w(t)) {
                            var r = "'" + JSON.stringify(t).replace(/^"|"$/g, "").replace(/'/g, "\\'").replace(/\\"/g, '"') + "'";
                            return e.stylize(r, "string")
                        }
                        if (b(t)) return e.stylize("" + t, "number");
                        if (h(t)) return e.stylize("" + t, "boolean");
                        if (g(t)) return e.stylize("null", "null")
                    }(e, r);
                    if (i) return i;
                    var a = Object.keys(r),
                        u = function(e) {
                            var t = {};
                            return e.forEach((function(e, r) {
                                t[e] = !0
                            })), t
                        }(a);
                    if (e.showHidden && (a = Object.getOwnPropertyNames(r)), O(r) && (a.indexOf("message") >= 0 || a.indexOf("description") >= 0)) return y(r);
                    if (0 === a.length) {
                        if (P(r)) {
                            var c = r.name ? ": " + r.name : "";
                            return e.stylize("[Function" + c + "]", "special")
                        }
                        if (A(r)) return e.stylize(RegExp.prototype.toString.call(r), "regexp");
                        if (E(r)) return e.stylize(Date.prototype.toString.call(r), "date");
                        if (O(r)) return y(r)
                    }
                    var l, s = "",
                        f = !1,
                        p = ["{", "}"];
                    (m(r) && (f = !0, p = ["[", "]"]), P(r)) && (s = " [Function" + (r.name ? ": " + r.name : "") + "]");
                    return A(r) && (s = " " + RegExp.prototype.toString.call(r)), E(r) && (s = " " + Date.prototype.toUTCString.call(r)), O(r) && (s = " " + y(r)), 0 !== a.length || f && 0 != r.length ? n < 0 ? A(r) ? e.stylize(RegExp.prototype.toString.call(r), "regexp") : e.stylize("[Object]", "special") : (e.seen.push(r), l = f ? function(e, t, r, n, o) {
                        for (var i = [], a = 0, u = t.length; a < u; ++a) C(t, String(a)) ? i.push(v(e, t, r, n, String(a), !0)) : i.push("");
                        return o.forEach((function(o) {
                            o.match(/^\d+$/) || i.push(v(e, t, r, n, o, !0))
                        })), i
                    }(e, r, n, u, a) : a.map((function(t) {
                        return v(e, r, n, u, t, f)
                    })), e.seen.pop(), function(e, t, r) {
                        var n = e.reduce((function(e, t) {
                            return t.indexOf("\n") >= 0 && 0, e + t.replace(/\u001b\[\d\d?m/g, "").length + 1
                        }), 0);
                        if (n > 60) return r[0] + ("" === t ? "" : t + "\n ") + " " + e.join(",\n  ") + " " + r[1];
                        return r[0] + t + " " + e.join(", ") + " " + r[1]
                    }(l, s, p)) : p[0] + s + p[1]
                }

                function y(e) {
                    return "[" + Error.prototype.toString.call(e) + "]"
                }

                function v(e, t, r, n, o, i) {
                    var a, u, c;
                    if ((c = Object.getOwnPropertyDescriptor(t, o) || {
                            value: t[o]
                        }).get ? u = c.set ? e.stylize("[Getter/Setter]", "special") : e.stylize("[Getter]", "special") : c.set && (u = e.stylize("[Setter]", "special")), C(n, o) || (a = "[" + o + "]"), u || (e.seen.indexOf(c.value) < 0 ? (u = g(r) ? d(e, c.value, null) : d(e, c.value, r - 1)).indexOf("\n") > -1 && (u = i ? u.split("\n").map((function(e) {
                            return "  " + e
                        })).join("\n").slice(2) : "\n" + u.split("\n").map((function(e) {
                            return "   " + e
                        })).join("\n")) : u = e.stylize("[Circular]", "special")), S(a)) {
                        if (i && o.match(/^\d+$/)) return u;
                        (a = JSON.stringify("" + o)).match(/^"([a-zA-Z_][a-zA-Z_0-9]*)"$/) ? (a = a.slice(1, -1), a = e.stylize(a, "name")) : (a = a.replace(/'/g, "\\'").replace(/\\"/g, '"').replace(/(^"|"$)/g, "'"), a = e.stylize(a, "string"))
                    }
                    return a + ": " + u
                }

                function m(e) {
                    return Array.isArray(e)
                }

                function h(e) {
                    return "boolean" == typeof e
                }

                function g(e) {
                    return null === e
                }

                function b(e) {
                    return "number" == typeof e
                }

                function w(e) {
                    return "string" == typeof e
                }

                function S(e) {
                    return void 0 === e
                }

                function A(e) {
                    return x(e) && "[object RegExp]" === j(e)
                }

                function x(e) {
                    return "object" == typeof e && null !== e
                }

                function E(e) {
                    return x(e) && "[object Date]" === j(e)
                }

                function O(e) {
                    return x(e) && ("[object Error]" === j(e) || e instanceof Error)
                }

                function P(e) {
                    return "function" == typeof e
                }

                function j(e) {
                    return Object.prototype.toString.call(e)
                }

                function R(e) {
                    return e < 10 ? "0" + e.toString(10) : e.toString(10)
                }
                t.debuglog = function(e) {
                    if (e = e.toUpperCase(), !u[e])
                        if (c.test(e)) {
                            var r = n.pid;
                            u[e] = function() {
                                var n = t.format.apply(t, arguments);
                                o.error("%s %d: %s", e, r, n)
                            }
                        } else u[e] = function() {};
                    return u[e]
                }, t.inspect = s, s.colors = {
                    bold: [1, 22],
                    italic: [3, 23],
                    underline: [4, 24],
                    inverse: [7, 27],
                    white: [37, 39],
                    grey: [90, 39],
                    black: [30, 39],
                    blue: [34, 39],
                    cyan: [36, 39],
                    green: [32, 39],
                    magenta: [35, 39],
                    red: [31, 39],
                    yellow: [33, 39]
                }, s.styles = {
                    special: "cyan",
                    number: "yellow",
                    boolean: "yellow",
                    undefined: "grey",
                    null: "bold",
                    string: "green",
                    date: "magenta",
                    regexp: "red"
                }, t.types = r(51531), t.isArray = m, t.isBoolean = h, t.isNull = g, t.isNullOrUndefined = function(e) {
                    return null == e
                }, t.isNumber = b, t.isString = w, t.isSymbol = function(e) {
                    return "symbol" == typeof e
                }, t.isUndefined = S, t.isRegExp = A, t.types.isRegExp = A, t.isObject = x, t.isDate = E, t.types.isDate = E, t.isError = O, t.types.isNativeError = O, t.isFunction = P, t.isPrimitive = function(e) {
                    return null === e || "boolean" == typeof e || "number" == typeof e || "string" == typeof e || "symbol" == typeof e || void 0 === e
                }, t.isBuffer = r(95272);
                var I = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

                function C(e, t) {
                    return Object.prototype.hasOwnProperty.call(e, t)
                }
                t.log = function() {
                    var e, r;
                    o.log("%s - %s", (e = new Date, r = [R(e.getHours()), R(e.getMinutes()), R(e.getSeconds())].join(":"), [e.getDate(), I[e.getMonth()], r].join(" ")), t.format.apply(t, arguments))
                }, t.inherits = r(35615), t._extend = function(e, t) {
                    if (!t || !x(t)) return e;
                    for (var r = Object.keys(t), n = r.length; n--;) e[r[n]] = t[r[n]];
                    return e
                };
                var k = "undefined" != typeof Symbol ? Symbol("util.promisify.custom") : void 0;

                function F(e, t) {
                    if (!e) {
                        var r = new Error("Promise was rejected with a falsy value");
                        r.reason = e, e = r
                    }
                    return t(e)
                }
                t.promisify = function(e) {
                    if ("function" != typeof e) throw new TypeError('The "original" argument must be of type Function');
                    if (k && e[k]) {
                        var t;
                        if ("function" != typeof(t = e[k])) throw new TypeError('The "util.promisify.custom" argument must be of type Function');
                        return Object.defineProperty(t, k, {
                            value: t,
                            enumerable: !1,
                            writable: !1,
                            configurable: !0
                        }), t
                    }

                    function t() {
                        for (var t, r, n = new Promise((function(e, n) {
                                t = e, r = n
                            })), o = [], i = 0; i < arguments.length; i++) o.push(arguments[i]);
                        o.push((function(e, n) {
                            e ? r(e) : t(n)
                        }));
                        try {
                            e.apply(this, o)
                        } catch (e) {
                            r(e)
                        }
                        return n
                    }
                    return Object.setPrototypeOf(t, Object.getPrototypeOf(e)), k && Object.defineProperty(t, k, {
                        value: t,
                        enumerable: !1,
                        writable: !1,
                        configurable: !0
                    }), Object.defineProperties(t, i(e))
                }, t.promisify.custom = k, t.callbackify = function(e) {
                    if ("function" != typeof e) throw new TypeError('The "original" argument must be of type Function');

                    function t() {
                        for (var t = [], r = 0; r < arguments.length; r++) t.push(arguments[r]);
                        var o = t.pop();
                        if ("function" != typeof o) throw new TypeError("The last argument must be of type Function");
                        var i = this,
                            a = function() {
                                return o.apply(i, arguments)
                            };
                        e.apply(this, t).then((function(e) {
                            n.nextTick(a.bind(null, null, e))
                        }), (function(e) {
                            n.nextTick(F.bind(null, e, a))
                        }))
                    }
                    return Object.setPrototypeOf(t, Object.getPrototypeOf(e)), Object.defineProperties(t, i(e)), t
                }
            },
            52730: function(e, t, r) {
                "use strict";
                var n = r(80705),
                    o = r(14834),
                    i = r(26754),
                    a = r(47354),
                    u = r(69336),
                    c = a("Object.prototype.toString"),
                    l = r(51913)(),
                    s = "undefined" == typeof globalThis ? r.g : globalThis,
                    f = o(),
                    p = a("String.prototype.slice"),
                    d = Object.getPrototypeOf,
                    y = a("Array.prototype.indexOf", !0) || function(e, t) {
                        for (var r = 0; r < e.length; r += 1)
                            if (e[r] === t) return r;
                        return -1
                    },
                    v = {
                        __proto__: null
                    };
                n(f, l && u && d ? function(e) {
                    var t = new s[e];
                    if (Symbol.toStringTag in t) {
                        var r = d(t),
                            n = u(r, Symbol.toStringTag);
                        if (!n) {
                            var o = d(r);
                            n = u(o, Symbol.toStringTag)
                        }
                        v["$" + e] = i(n.get)
                    }
                } : function(e) {
                    var t = new s[e],
                        r = t.slice || t.set;
                    r && (v["$" + e] = i(r))
                });
                e.exports = function(e) {
                    if (!e || "object" != typeof e) return !1;
                    if (!l) {
                        var t = p(c(e), 8, -1);
                        return y(f, t) > -1 ? t : "Object" === t && function(e) {
                            var t = !1;
                            return n(v, (function(r, n) {
                                if (!t) try {
                                    r(e), t = p(n, 1)
                                } catch (e) {}
                            })), t
                        }(e)
                    }
                    return u ? function(e) {
                        var t = !1;
                        return n(v, (function(r, n) {
                            if (!t) try {
                                "$" + r(e) === n && (t = p(n, 1))
                            } catch (e) {}
                        })), t
                    }(e) : null
                }
            },
            47354: function(e, t, r) {
                "use strict";
                var n = r(73312),
                    o = r(26754),
                    i = o(n("String.prototype.indexOf"));
                e.exports = function(e, t) {
                    var r = n(e, !!t);
                    return "function" == typeof r && i(e, ".prototype.") > -1 ? o(r) : r
                }
            },
            26754: function(e, t, r) {
                "use strict";
                var n = r(14258),
                    o = r(73312),
                    i = r(26108),
                    a = r(3468),
                    u = o("%Function.prototype.apply%"),
                    c = o("%Function.prototype.call%"),
                    l = o("%Reflect.apply%", !0) || n.call(c, u),
                    s = r(64940),
                    f = o("%Math.max%");
                e.exports = function(e) {
                    if ("function" != typeof e) throw new a("a function is required");
                    var t = l(n, c, arguments);
                    return i(t, 1 + f(0, e.length - (arguments.length - 1)), !0)
                };
                var p = function() {
                    return l(n, u, arguments)
                };
                s ? s(e.exports, "apply", {
                    value: p
                }) : e.exports.apply = p
            },
            38762: function(e) {
                "use strict";
                var t = Object.prototype.toString,
                    r = Math.max,
                    n = function(e, t) {
                        for (var r = [], n = 0; n < e.length; n += 1) r[n] = e[n];
                        for (var o = 0; o < t.length; o += 1) r[o + e.length] = t[o];
                        return r
                    };
                e.exports = function(e) {
                    var o = this;
                    if ("function" != typeof o || "[object Function]" !== t.apply(o)) throw new TypeError("Function.prototype.bind called on incompatible " + o);
                    for (var i, a = function(e, t) {
                            for (var r = [], n = t || 0, o = 0; n < e.length; n += 1, o += 1) r[o] = e[n];
                            return r
                        }(arguments, 1), u = r(0, o.length - a.length), c = [], l = 0; l < u; l++) c[l] = "$" + l;
                    if (i = Function("binder", "return function (" + function(e, t) {
                            for (var r = "", n = 0; n < e.length; n += 1) r += e[n], n + 1 < e.length && (r += t);
                            return r
                        }(c, ",") + "){ return binder.apply(this,arguments); }")((function() {
                            if (this instanceof i) {
                                var t = o.apply(this, n(a, arguments));
                                return Object(t) === t ? t : this
                            }
                            return o.apply(e, n(a, arguments))
                        })), o.prototype) {
                        var s = function() {};
                        s.prototype = o.prototype, i.prototype = new s, s.prototype = null
                    }
                    return i
                }
            },
            14258: function(e, t, r) {
                "use strict";
                var n = r(38762);
                e.exports = Function.prototype.bind || n
            },
            73312: function(e, t, r) {
                "use strict";
                var n, o = r(29838),
                    i = r(29110),
                    a = r(61155),
                    u = r(94943),
                    c = r(5731),
                    l = r(3468),
                    s = r(32140),
                    f = Function,
                    p = function(e) {
                        try {
                            return f('"use strict"; return (' + e + ").constructor;")()
                        } catch (e) {}
                    },
                    d = Object.getOwnPropertyDescriptor;
                if (d) try {
                    d({}, "")
                } catch (e) {
                    d = null
                }
                var y = function() {
                        throw new l
                    },
                    v = d ? function() {
                        try {
                            return y
                        } catch (e) {
                            try {
                                return d(arguments, "callee").get
                            } catch (e) {
                                return y
                            }
                        }
                    }() : y,
                    m = r(32518)(),
                    h = r(66869)(),
                    g = Object.getPrototypeOf || (h ? function(e) {
                        return e.__proto__
                    } : null),
                    b = {},
                    w = "undefined" != typeof Uint8Array && g ? g(Uint8Array) : n,
                    S = {
                        __proto__: null,
                        "%AggregateError%": "undefined" == typeof AggregateError ? n : AggregateError,
                        "%Array%": Array,
                        "%ArrayBuffer%": "undefined" == typeof ArrayBuffer ? n : ArrayBuffer,
                        "%ArrayIteratorPrototype%": m && g ? g([][Symbol.iterator]()) : n,
                        "%AsyncFromSyncIteratorPrototype%": n,
                        "%AsyncFunction%": b,
                        "%AsyncGenerator%": b,
                        "%AsyncGeneratorFunction%": b,
                        "%AsyncIteratorPrototype%": b,
                        "%Atomics%": "undefined" == typeof Atomics ? n : Atomics,
                        "%BigInt%": "undefined" == typeof BigInt ? n : BigInt,
                        "%BigInt64Array%": "undefined" == typeof BigInt64Array ? n : BigInt64Array,
                        "%BigUint64Array%": "undefined" == typeof BigUint64Array ? n : BigUint64Array,
                        "%Boolean%": Boolean,
                        "%DataView%": "undefined" == typeof DataView ? n : DataView,
                        "%Date%": Date,
                        "%decodeURI%": decodeURI,
                        "%decodeURIComponent%": decodeURIComponent,
                        "%encodeURI%": encodeURI,
                        "%encodeURIComponent%": encodeURIComponent,
                        "%Error%": o,
                        "%eval%": eval,
                        "%EvalError%": i,
                        "%Float32Array%": "undefined" == typeof Float32Array ? n : Float32Array,
                        "%Float64Array%": "undefined" == typeof Float64Array ? n : Float64Array,
                        "%FinalizationRegistry%": "undefined" == typeof FinalizationRegistry ? n : FinalizationRegistry,
                        "%Function%": f,
                        "%GeneratorFunction%": b,
                        "%Int8Array%": "undefined" == typeof Int8Array ? n : Int8Array,
                        "%Int16Array%": "undefined" == typeof Int16Array ? n : Int16Array,
                        "%Int32Array%": "undefined" == typeof Int32Array ? n : Int32Array,
                        "%isFinite%": isFinite,
                        "%isNaN%": isNaN,
                        "%IteratorPrototype%": m && g ? g(g([][Symbol.iterator]())) : n,
                        "%JSON%": "object" == typeof JSON ? JSON : n,
                        "%Map%": "undefined" == typeof Map ? n : Map,
                        "%MapIteratorPrototype%": "undefined" != typeof Map && m && g ? g((new Map)[Symbol.iterator]()) : n,
                        "%Math%": Math,
                        "%Number%": Number,
                        "%Object%": Object,
                        "%parseFloat%": parseFloat,
                        "%parseInt%": parseInt,
                        "%Promise%": "undefined" == typeof Promise ? n : Promise,
                        "%Proxy%": "undefined" == typeof Proxy ? n : Proxy,
                        "%RangeError%": a,
                        "%ReferenceError%": u,
                        "%Reflect%": "undefined" == typeof Reflect ? n : Reflect,
                        "%RegExp%": RegExp,
                        "%Set%": "undefined" == typeof Set ? n : Set,
                        "%SetIteratorPrototype%": "undefined" != typeof Set && m && g ? g((new Set)[Symbol.iterator]()) : n,
                        "%SharedArrayBuffer%": "undefined" == typeof SharedArrayBuffer ? n : SharedArrayBuffer,
                        "%String%": String,
                        "%StringIteratorPrototype%": m && g ? g("" [Symbol.iterator]()) : n,
                        "%Symbol%": m ? Symbol : n,
                        "%SyntaxError%": c,
                        "%ThrowTypeError%": v,
                        "%TypedArray%": w,
                        "%TypeError%": l,
                        "%Uint8Array%": "undefined" == typeof Uint8Array ? n : Uint8Array,
                        "%Uint8ClampedArray%": "undefined" == typeof Uint8ClampedArray ? n : Uint8ClampedArray,
                        "%Uint16Array%": "undefined" == typeof Uint16Array ? n : Uint16Array,
                        "%Uint32Array%": "undefined" == typeof Uint32Array ? n : Uint32Array,
                        "%URIError%": s,
                        "%WeakMap%": "undefined" == typeof WeakMap ? n : WeakMap,
                        "%WeakRef%": "undefined" == typeof WeakRef ? n : WeakRef,
                        "%WeakSet%": "undefined" == typeof WeakSet ? n : WeakSet
                    };
                if (g) try {
                    null.error
                } catch (e) {
                    var A = g(g(e));
                    S["%Error.prototype%"] = A
                }
                var x = function e(t) {
                        var r;
                        if ("%AsyncFunction%" === t) r = p("async function () {}");
                        else if ("%GeneratorFunction%" === t) r = p("function* () {}");
                        else if ("%AsyncGeneratorFunction%" === t) r = p("async function* () {}");
                        else if ("%AsyncGenerator%" === t) {
                            var n = e("%AsyncGeneratorFunction%");
                            n && (r = n.prototype)
                        } else if ("%AsyncIteratorPrototype%" === t) {
                            var o = e("%AsyncGenerator%");
                            o && g && (r = g(o.prototype))
                        }
                        return S[t] = r, r
                    },
                    E = {
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
                    O = r(14258),
                    P = r(78554),
                    j = O.call(Function.call, Array.prototype.concat),
                    R = O.call(Function.apply, Array.prototype.splice),
                    I = O.call(Function.call, String.prototype.replace),
                    C = O.call(Function.call, String.prototype.slice),
                    k = O.call(Function.call, RegExp.prototype.exec),
                    F = /[^%.[\]]+|\[(?:(-?\d+(?:\.\d+)?)|(["'])((?:(?!\2)[^\\]|\\.)*?)\2)\]|(?=(?:\.|\[\])(?:\.|\[\]|%$))/g,
                    N = /\\(\\)?/g,
                    T = function(e, t) {
                        var r, n = e;
                        if (P(E, n) && (n = "%" + (r = E[n])[0] + "%"), P(S, n)) {
                            var o = S[n];
                            if (o === b && (o = x(n)), void 0 === o && !t) throw new l("intrinsic " + e + " exists, but is not available. Please file an issue!");
                            return {
                                alias: r,
                                name: n,
                                value: o
                            }
                        }
                        throw new c("intrinsic " + e + " does not exist!")
                    };
                e.exports = function(e, t) {
                    if ("string" != typeof e || 0 === e.length) throw new l("intrinsic name must be a non-empty string");
                    if (arguments.length > 1 && "boolean" != typeof t) throw new l('"allowMissing" argument must be a boolean');
                    if (null === k(/^%?[^%]*%?$/, e)) throw new c("`%` may not be present anywhere but at the beginning and end of the intrinsic name");
                    var r = function(e) {
                            var t = C(e, 0, 1),
                                r = C(e, -1);
                            if ("%" === t && "%" !== r) throw new c("invalid intrinsic syntax, expected closing `%`");
                            if ("%" === r && "%" !== t) throw new c("invalid intrinsic syntax, expected opening `%`");
                            var n = [];
                            return I(e, F, (function(e, t, r, o) {
                                n[n.length] = r ? I(o, N, "$1") : t || e
                            })), n
                        }(e),
                        n = r.length > 0 ? r[0] : "",
                        o = T("%" + n + "%", t),
                        i = o.name,
                        a = o.value,
                        u = !1,
                        s = o.alias;
                    s && (n = s[0], R(r, j([0, 1], s)));
                    for (var f = 1, p = !0; f < r.length; f += 1) {
                        var y = r[f],
                            v = C(y, 0, 1),
                            m = C(y, -1);
                        if (('"' === v || "'" === v || "`" === v || '"' === m || "'" === m || "`" === m) && v !== m) throw new c("property names with quotes must have matching quotes");
                        if ("constructor" !== y && p || (u = !0), P(S, i = "%" + (n += "." + y) + "%")) a = S[i];
                        else if (null != a) {
                            if (!(y in a)) {
                                if (!t) throw new l("base intrinsic for " + e + " exists, but the property is not available.");
                                return
                            }
                            if (d && f + 1 >= r.length) {
                                var h = d(a, y);
                                a = (p = !!h) && "get" in h && !("originalValue" in h.get) ? h.get : a[y]
                            } else p = P(a, y), a = a[y];
                            p && !u && (S[i] = a)
                        }
                    }
                    return a
                }
            },
            32518: function(e, t, r) {
                "use strict";
                var n = "undefined" != typeof Symbol && Symbol,
                    o = r(60716);
                e.exports = function() {
                    return "function" == typeof n && ("function" == typeof Symbol && ("symbol" == typeof n("foo") && ("symbol" == typeof Symbol("bar") && o())))
                }
            },
            60716: function(e) {
                "use strict";
                e.exports = function() {
                    if ("function" != typeof Symbol || "function" != typeof Object.getOwnPropertySymbols) return !1;
                    if ("symbol" == typeof Symbol.iterator) return !0;
                    var e = {},
                        t = Symbol("test"),
                        r = Object(t);
                    if ("string" == typeof t) return !1;
                    if ("[object Symbol]" !== Object.prototype.toString.call(t)) return !1;
                    if ("[object Symbol]" !== Object.prototype.toString.call(r)) return !1;
                    for (t in e[t] = 42, e) return !1;
                    if ("function" == typeof Object.keys && 0 !== Object.keys(e).length) return !1;
                    if ("function" == typeof Object.getOwnPropertyNames && 0 !== Object.getOwnPropertyNames(e).length) return !1;
                    var n = Object.getOwnPropertySymbols(e);
                    if (1 !== n.length || n[0] !== t) return !1;
                    if (!Object.prototype.propertyIsEnumerable.call(e, t)) return !1;
                    if ("function" == typeof Object.getOwnPropertyDescriptor) {
                        var o = Object.getOwnPropertyDescriptor(e, t);
                        if (42 !== o.value || !0 !== o.enumerable) return !1
                    }
                    return !0
                }
            },
            4452: function(e, t) {
                var r;
                ! function() {
                    "use strict";
                    var n = {}.hasOwnProperty;

                    function o() {
                        for (var e = "", t = 0; t < arguments.length; t++) {
                            var r = arguments[t];
                            r && (e = a(e, i(r)))
                        }
                        return e
                    }

                    function i(e) {
                        if ("string" == typeof e || "number" == typeof e) return e;
                        if ("object" != typeof e) return "";
                        if (Array.isArray(e)) return o.apply(null, e);
                        if (e.toString !== Object.prototype.toString && !e.toString.toString().includes("[native code]")) return e.toString();
                        var t = "";
                        for (var r in e) n.call(e, r) && e[r] && (t = a(t, r));
                        return t
                    }

                    function a(e, t) {
                        return t ? e ? e + " " + t : e + t : e
                    }
                    e.exports ? (o.default = o, e.exports = o) : void 0 === (r = function() {
                        return o
                    }.apply(t, [])) || (e.exports = r)
                }()
            },
            14834: function(e, t, r) {
                "use strict";
                var n = r(69501),
                    o = "undefined" == typeof globalThis ? r.g : globalThis;
                e.exports = function() {
                    for (var e = [], t = 0; t < n.length; t++) "function" == typeof o[n[t]] && (e[e.length] = n[t]);
                    return e
                }
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
    r.n = function(e) {
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
        }, r.g = function() {
            if ("object" == typeof globalThis) return globalThis;
            try {
                return this || new Function("return this")()
            } catch (e) {
                if ("object" == typeof window) return window
            }
        }(), r.o = function(e, t) {
            return Object.prototype.hasOwnProperty.call(e, t)
        }, r.nc = void 0,
        function() {
            "use strict";
            var e = Roblox,
                t = r.n(e),
                n = React,
                o = r.n(n),
                i = ReactDOM,
                a = r.n(i),
                u = ReactUtilities,
                c = ReactStyleGuide,
                l = r(4452),
                s = r.n(l),
                f = {
                    common: [],
                    feature: "Feature.VirtualEvents"
                },
                p = {
                    common: [],
                    feature: "Feature.Groups"
                },
                d = CoreUtilities,
                y = e.EnvironmentUrls.apiGatewayUrl,
                v = e.EnvironmentUrls.gamesApi,
                m = e.EnvironmentUrls.groupsApi,
                h = e.EnvironmentUrls.domain,
                g = "".concat(y, "/virtual-events/v1/virtual-events"),
                b = "".concat(v, "/v1/games"),
                w = "".concat(v, "/v2/groups"),
                S = "".concat(m, "/v1/featured-content"),
                A = {
                    getVirtualEventsUrl: function(e, t, r, n, o) {
                        return "".concat(g, "/groups/").concat(e)
                    },
                    getVirtualEventDetailsUrl: function(e, t) {
                        return t ? "".concat(g, "/").concat(e) : "".concat(g, "/public/").concat(e)
                    },
                    getVirtualEventsRsvpEndpoint: function(e) {
                        return "".concat(g, "/").concat(e, "/rsvps")
                    },
                    getGameDetailsForUniverseIdsEndpoint: function() {
                        return "".concat(b)
                    },
                    getGamesForGroupEndpoint: function(e) {
                        return "".concat(w, "/").concat(e, "/gamesV2?accessFilter=Public&sortOrder=Desc")
                    },
                    getGroupFeaturedEventsUrl: function(e) {
                        return "".concat(S, "/event?groupId=").concat(e)
                    },
                    getGroupFeaturedEventUrl: function(e, t) {
                        return "".concat(S, "/event?groupId=").concat(e, "&eventId=").concat(t)
                    },
                    getEventUrl: function(e) {
                        return "https://".concat(h, "/events/").concat(e)
                    },
                    getCreateExperienceUrl: function(e) {
                        return "https://create.".concat(h, "/dashboard/creations?groupId=").concat(e)
                    },
                    getCreateEventForExperienceUrl: function(e) {
                        return "https://create.".concat(h, "/dashboard/creations/experiences/").concat(e, "/events")
                    }
                },
                x = {
                    active: "active"
                },
                E = {
                    going: "going",
                    notGoing: "notGoing"
                },
                O = function(e, t, r, n) {
                    return new(r || (r = Promise))((function(o, i) {
                        function a(e) {
                            try {
                                c(n.next(e))
                            } catch (e) {
                                i(e)
                            }
                        }

                        function u(e) {
                            try {
                                c(n.throw(e))
                            } catch (e) {
                                i(e)
                            }
                        }

                        function c(e) {
                            var t;
                            e.done ? o(e.value) : (t = e.value, t instanceof r ? t : new r((function(e) {
                                e(t)
                            }))).then(a, u)
                        }
                        c((n = n.apply(e, t || [])).next())
                    }))
                },
                P = function(e, t) {
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
                    return a.next = u(0), a.throw = u(1), a.return = u(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                        return this
                    }), a;

                    function u(u) {
                        return function(c) {
                            return function(u) {
                                if (r) throw new TypeError("Generator is already executing.");
                                for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                    if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                    switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                        case 0:
                                        case 1:
                                            o = u;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: u[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, n = u[1], u = [0];
                                            continue;
                                        case 7:
                                            u = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = i.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== u[0] && 2 !== u[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                i.label = u[1];
                                                break
                                            }
                                            if (6 === u[0] && i.label < o[1]) {
                                                i.label = o[1], o = u;
                                                break
                                            }
                                            if (o && i.label < o[2]) {
                                                i.label = o[2], i.ops.push(u);
                                                break
                                            }
                                            o[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    u = t.call(e, i)
                                } catch (e) {
                                    u = [6, e], n = 0
                                } finally {
                                    r = o = 0
                                }
                                if (5 & u[0]) throw u[1];
                                return {
                                    value: u[0] ? u[1] : void 0,
                                    done: !0
                                }
                            }([u, c])
                        }
                    }
                },
                j = function(e, t, r) {
                    if (r || 2 === arguments.length)
                        for (var n, o = 0, i = t.length; o < i; o++) !n && o in t || (n || (n = Array.prototype.slice.call(t, 0, o)), n[o] = t[o]);
                    return e.concat(n || Array.prototype.slice.call(t))
                },
                R = function(e) {
                    for (var t = [], r = 1; r < arguments.length; r++) t[r - 1] = arguments[r];
                    return O(void 0, j([e], t, !0), Promise, (function(e, t, r, n, o) {
                        var i, a, u;
                        return void 0 === t && (t = "upcoming"), void 0 === r && (r = (new Date).toISOString()), void 0 === n && (n = "startUtc"), void 0 === o && (o = "desc"), P(this, (function(c) {
                            switch (c.label) {
                                case 0:
                                    return i = {
                                        url: A.getVirtualEventsUrl(e, t, r, n, o),
                                        withCredentials: !0
                                    }, [4, d.httpService.get(i)];
                                case 1:
                                    return a = c.sent(), [2, null === (u = a.data) || void 0 === u ? void 0 : u.data]
                            }
                        }))
                    }))
                },
                I = function(e) {
                    return O(void 0, void 0, Promise, (function() {
                        var t, r, n, o;
                        return P(this, (function(i) {
                            switch (i.label) {
                                case 0:
                                    return t = null === (o = null === (n = window.Roblox) || void 0 === n ? void 0 : n.CurrentUser) || void 0 === o ? void 0 : o.isAuthenticated, r = {
                                        url: A.getVirtualEventDetailsUrl(e, t),
                                        withCredentials: !0
                                    }, [4, d.httpService.get(r)];
                                case 1:
                                    return [2, i.sent().data]
                            }
                        }))
                    }))
                },
                C = function(e, t) {
                    return O(void 0, void 0, Promise, (function() {
                        var r, n;
                        return P(this, (function(o) {
                            switch (o.label) {
                                case 0:
                                    return r = {
                                        url: A.getVirtualEventsRsvpEndpoint(e),
                                        withCredentials: !0
                                    }, n = {
                                        rsvpStatus: t
                                    }, [4, d.httpService.post(r, n)];
                                case 1:
                                    return o.sent(), [2]
                            }
                        }))
                    }))
                },
                k = function(e) {
                    return O(void 0, void 0, Promise, (function() {
                        var t, r, n, o;
                        return P(this, (function(i) {
                            switch (i.label) {
                                case 0:
                                    return t = {
                                        url: A.getGameDetailsForUniverseIdsEndpoint(),
                                        withCredentials: !0
                                    }, r = {
                                        universeIds: e
                                    }, [4, d.httpService.get(t, r)];
                                case 1:
                                    return n = i.sent(), [2, null === (o = n.data) || void 0 === o ? void 0 : o.data]
                            }
                        }))
                    }))
                },
                F = function(e) {
                    return O(void 0, void 0, Promise, (function() {
                        var t, r, n;
                        return P(this, (function(o) {
                            switch (o.label) {
                                case 0:
                                    return t = {
                                        url: A.getGamesForGroupEndpoint(e),
                                        withCredentials: !0
                                    }, [4, d.httpService.get(t)];
                                case 1:
                                    return r = o.sent(), [2, null === (n = r.data) || void 0 === n ? void 0 : n.data]
                            }
                        }))
                    }))
                },
                N = function(e) {
                    return O(void 0, void 0, Promise, (function() {
                        var t;
                        return P(this, (function(r) {
                            switch (r.label) {
                                case 0:
                                    return t = {
                                        url: A.getGroupFeaturedEventsUrl(e),
                                        withCredentials: !0
                                    }, [4, d.httpService.get(t)];
                                case 1:
                                    return [2, r.sent().data]
                            }
                        }))
                    }))
                },
                T = function(e, t) {
                    return O(void 0, void 0, Promise, (function() {
                        var r;
                        return P(this, (function(n) {
                            switch (n.label) {
                                case 0:
                                    return r = {
                                        url: A.getGroupFeaturedEventUrl(e, t),
                                        withCredentials: !0
                                    }, [4, d.httpService.post(r)];
                                case 1:
                                    return [2, n.sent().data]
                            }
                        }))
                    }))
                },
                _ = function(e, t) {
                    return O(void 0, void 0, Promise, (function() {
                        var r;
                        return P(this, (function(n) {
                            switch (n.label) {
                                case 0:
                                    return r = {
                                        url: A.getGroupFeaturedEventUrl(e, t),
                                        withCredentials: !0
                                    }, [4, d.httpService.delete(r)];
                                case 1:
                                    return n.sent(), [2]
                            }
                        }))
                    }))
                },
                D = function() {
                    return D = Object.assign || function(e) {
                        for (var t, r = 1, n = arguments.length; r < n; r++)
                            for (var o in t = arguments[r]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
                        return e
                    }, D.apply(this, arguments)
                };

            function M(e, t) {
                var r = {};
                for (var n in e) Object.prototype.hasOwnProperty.call(e, n) && t.indexOf(n) < 0 && (r[n] = e[n]);
                if (null != e && "function" == typeof Object.getOwnPropertySymbols) {
                    var o = 0;
                    for (n = Object.getOwnPropertySymbols(e); o < n.length; o++) t.indexOf(n[o]) < 0 && Object.prototype.propertyIsEnumerable.call(e, n[o]) && (r[n[o]] = e[n[o]])
                }
                return r
            }

            function U(e) {
                var t, r, n = "";
                if ("string" == typeof e || "number" == typeof e) n += e;
                else if ("object" == typeof e)
                    if (Array.isArray(e)) {
                        var o = e.length;
                        for (t = 0; t < o; t++) e[t] && (r = U(e[t])) && (n && (n += " "), n += r)
                    } else
                        for (r in e) e[r] && (n && (n += " "), n += r);
                return n
            }
            var B = function() {
                    for (var e, t, r = 0, n = "", o = arguments.length; r < o; r++)(e = arguments[r]) && (t = U(e)) && (n && (n += " "), n += t);
                    return n
                },
                L = ReactJSX,
                W = r(4364),
                G = ["children"],
                z = ["children"],
                V = ["asChild"],
                q = ["disableOutsidePointerEvents", "onEscapeKeyDown", "onPointerDownOutside", "onFocusOutside", "onInteractOutside", "onDismiss"],
                $ = ["children"],
                H = ["children"],
                J = ["asChild"],
                X = ["loop", "trapped", "onMountAutoFocus", "onUnmountAutoFocus"],
                K = ["children"],
                Y = ["children"],
                Z = ["asChild"],
                Q = ["container"];

            function ee(e, t) {
                var r;
                if ("undefined" == typeof Symbol || null == e[Symbol.iterator]) {
                    if (Array.isArray(e) || (r = ne(e)) || t && e && "number" == typeof e.length) {
                        r && (e = r);
                        var n = 0,
                            o = function() {};
                        return {
                            s: o,
                            n: function() {
                                return n >= e.length ? {
                                    done: !0
                                } : {
                                    done: !1,
                                    value: e[n++]
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
                var i, a = !0,
                    u = !1;
                return {
                    s: function() {
                        r = e[Symbol.iterator]()
                    },
                    n: function() {
                        var e = r.next();
                        return a = e.done, e
                    },
                    e: function(e) {
                        u = !0, i = e
                    },
                    f: function() {
                        try {
                            a || null == r.return || r.return()
                        } finally {
                            if (u) throw i
                        }
                    }
                }
            }

            function te(e) {
                return function(e) {
                    if (Array.isArray(e)) return oe(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && Symbol.iterator in Object(e)) return Array.from(e)
                }(e) || ne(e) || function() {
                    throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function re(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var r = [],
                        n = !0,
                        o = !1,
                        i = void 0;
                    try {
                        for (var a, u = e[Symbol.iterator](); !(n = (a = u.next()).done) && (r.push(a.value), !t || r.length !== t); n = !0);
                    } catch (e) {
                        o = !0, i = e
                    } finally {
                        try {
                            n || null == u.return || u.return()
                        } finally {
                            if (o) throw i
                        }
                    }
                    return r
                }(e, t) || ne(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ne(e, t) {
                if (e) {
                    if ("string" == typeof e) return oe(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    return "Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r ? Array.from(e) : "Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r) ? oe(e, t) : void 0
                }
            }

            function oe(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = new Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ie(e, t) {
                var r = Object.keys(e);
                if (Object.getOwnPropertySymbols) {
                    var n = Object.getOwnPropertySymbols(e);
                    t && (n = n.filter((function(t) {
                        return Object.getOwnPropertyDescriptor(e, t).enumerable
                    }))), r.push.apply(r, n)
                }
                return r
            }

            function ae(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {};
                    t % 2 ? ie(Object(r), !0).forEach((function(t) {
                        ue(e, t, r[t])
                    })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(r)) : ie(Object(r)).forEach((function(t) {
                        Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(r, t))
                    }))
                }
                return e
            }

            function ue(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function ce(e, t) {
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
                    for (n = 0; n < i.length; n++) r = i[n], t.indexOf(r) >= 0 || Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r])
                }
                return o
            }

            function le(e, t) {
                var r = (arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {}).checkForDefaultPrevented,
                    n = void 0 === r || r;
                return function(r) {
                    if (null != e && e(r), !1 === n || !r.defaultPrevented) return null == t ? void 0 : t(r)
                }
            }

            function se(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function fe() {
                for (var e = arguments.length, t = new Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return function(e) {
                    var r = !1,
                        n = t.map((function(t) {
                            var n = se(t, e);
                            return r || "function" != typeof n || (r = !0), n
                        }));
                    if (r) return function() {
                        for (var e = 0; e < n.length; e++) {
                            var r = n[e];
                            "function" == typeof r ? r() : se(t[e], null)
                        }
                    }
                }
            }

            function pe() {
                for (var e = arguments.length, t = new Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return n.useCallback(fe.apply(void 0, t), t)
            }
            var de = Symbol("radix.slottable");

            function ye(e) {
                return n.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === de
            }
            var ve = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((function(e, t) {
                var r = function(e) {
                        var t = function(e) {
                                var t = n.forwardRef((function(e, t) {
                                    var r = e.children,
                                        o = ce(e, G);
                                    if (n.isValidElement(r)) {
                                        var i = function(e) {
                                                var t, r, n = null === (t = Object.getOwnPropertyDescriptor(e.props, "ref")) || void 0 === t ? void 0 : t.get,
                                                    o = n && "isReactWarning" in n && n.isReactWarning;
                                                return o ? e.ref : (o = (n = null === (r = Object.getOwnPropertyDescriptor(e, "ref")) || void 0 === r ? void 0 : r.get) && "isReactWarning" in n && n.isReactWarning) ? e.props.ref : e.props.ref || e.ref
                                            }(r),
                                            a = function(e, t) {
                                                var r = ae({}, t),
                                                    n = function(n) {
                                                        var o = e[n],
                                                            i = t[n];
                                                        /^on[A-Z]/.test(n) ? o && i ? r[n] = function() {
                                                            i.apply(void 0, arguments), o.apply(void 0, arguments)
                                                        } : o && (r[n] = o) : "style" === n ? r[n] = ae(ae({}, o), i) : "className" === n && (r[n] = [o, i].filter(Boolean).join(" "))
                                                    };
                                                for (var o in t) n(o);
                                                return ae(ae({}, e), r)
                                            }(o, r.props);
                                        return r.type !== n.Fragment && (a.ref = t ? fe(t, i) : i), n.cloneElement(r, a)
                                    }
                                    return n.Children.count(r) > 1 ? n.Children.only(null) : null
                                }));
                                return t.displayName = "".concat(e, ".SlotClone"), t
                            }(e),
                            r = n.forwardRef((function(e, r) {
                                var o = e.children,
                                    i = ce(e, z),
                                    a = n.Children.toArray(o),
                                    u = a.find(ye);
                                if (u) {
                                    var c = u.props.children,
                                        l = a.map((function(e) {
                                            return e === u ? n.Children.count(c) > 1 ? n.Children.only(null) : n.isValidElement(c) ? c.props.children : null : e
                                        }));
                                    return (0, L.jsx)(t, ae(ae({}, i), {}, {
                                        ref: r,
                                        children: n.isValidElement(c) ? n.cloneElement(c, void 0, l) : null
                                    }))
                                }
                                return (0, L.jsx)(t, ae(ae({}, i), {}, {
                                    ref: r,
                                    children: o
                                }))
                            }));
                        return r.displayName = "".concat(e, ".Slot"), r
                    }("Primitive.".concat(t)),
                    o = n.forwardRef((function(e, n) {
                        var o = e.asChild,
                            i = ce(e, V),
                            a = o ? r : t;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, L.jsx)(a, ae(ae({}, i), {}, {
                            ref: n
                        }))
                    }));
                return o.displayName = "Primitive.".concat(t), ae(ae({}, e), {}, ue({}, t, o))
            }), {});

            function me(e) {
                var t = n.useRef(e);
                return n.useEffect((function() {
                    t.current = e
                })), n.useMemo((function() {
                    return function() {
                        for (var e, r = arguments.length, n = new Array(r), o = 0; o < r; o++) n[o] = arguments[o];
                        return null === (e = t.current) || void 0 === e ? void 0 : e.call.apply(e, [t].concat(n))
                    }
                }), [])
            }
            var he, ge = "dismissableLayer.update",
                be = n.createContext({
                    layers: new Set,
                    layersWithOutsidePointerEventsDisabled: new Set,
                    branches: new Set
                }),
                we = n.forwardRef((function(e, t) {
                    var r, o = e.disableOutsidePointerEvents,
                        i = void 0 !== o && o,
                        a = e.onEscapeKeyDown,
                        u = e.onPointerDownOutside,
                        c = e.onFocusOutside,
                        l = e.onInteractOutside,
                        s = e.onDismiss,
                        f = ce(e, q),
                        p = n.useContext(be),
                        d = re(n.useState(null), 2),
                        y = d[0],
                        v = d[1],
                        m = null !== (r = null == y ? void 0 : y.ownerDocument) && void 0 !== r ? r : null === globalThis || void 0 === globalThis ? void 0 : globalThis.document,
                        h = re(n.useState({}), 2)[1],
                        g = pe(t, (function(e) {
                            return v(e)
                        })),
                        b = Array.from(p.layers),
                        w = re(te(p.layersWithOutsidePointerEventsDisabled).slice(-1), 1)[0],
                        S = b.indexOf(w),
                        A = y ? b.indexOf(y) : -1,
                        x = p.layersWithOutsidePointerEventsDisabled.size > 0,
                        E = A >= S,
                        O = function(e) {
                            var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null === globalThis || void 0 === globalThis ? void 0 : globalThis.document,
                                r = me(e),
                                o = n.useRef(!1),
                                i = n.useRef((function() {}));
                            return n.useEffect((function() {
                                var e = function(e) {
                                        if (e.target && !o.current) {
                                            var n = function() {
                                                    Ae("dismissableLayer.pointerDownOutside", r, a, {
                                                        discrete: !0
                                                    })
                                                },
                                                a = {
                                                    originalEvent: e
                                                };
                                            "touch" === e.pointerType ? (t.removeEventListener("click", i.current), i.current = n, t.addEventListener("click", i.current, {
                                                once: !0
                                            })) : n()
                                        } else t.removeEventListener("click", i.current);
                                        o.current = !1
                                    },
                                    n = window.setTimeout((function() {
                                        t.addEventListener("pointerdown", e)
                                    }), 0);
                                return function() {
                                    window.clearTimeout(n), t.removeEventListener("pointerdown", e), t.removeEventListener("click", i.current)
                                }
                            }), [t, r]), {
                                onPointerDownCapture: function() {
                                    return o.current = !0
                                }
                            }
                        }((function(e) {
                            var t = e.target,
                                r = te(p.branches).some((function(e) {
                                    return e.contains(t)
                                }));
                            E && !r && (null != u && u(e), null != l && l(e), e.defaultPrevented || null == s || s())
                        }), m),
                        P = function(e) {
                            var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null === globalThis || void 0 === globalThis ? void 0 : globalThis.document,
                                r = me(e),
                                o = n.useRef(!1);
                            return n.useEffect((function() {
                                var e = function(e) {
                                    e.target && !o.current && Ae("dismissableLayer.focusOutside", r, {
                                        originalEvent: e
                                    }, {
                                        discrete: !1
                                    })
                                };
                                return t.addEventListener("focusin", e),
                                    function() {
                                        return t.removeEventListener("focusin", e)
                                    }
                            }), [t, r]), {
                                onFocusCapture: function() {
                                    return o.current = !0
                                },
                                onBlurCapture: function() {
                                    return o.current = !1
                                }
                            }
                        }((function(e) {
                            var t = e.target;
                            te(p.branches).some((function(e) {
                                return e.contains(t)
                            })) || (null != c && c(e), null != l && l(e), e.defaultPrevented || null == s || s())
                        }), m);
                    return function(e) {
                        var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null === globalThis || void 0 === globalThis ? void 0 : globalThis.document,
                            r = function(e) {
                                var t = n.useRef(e);
                                return n.useEffect((function() {
                                    t.current = e
                                })), n.useMemo((function() {
                                    return function() {
                                        for (var e, r = arguments.length, n = new Array(r), o = 0; o < r; o++) n[o] = arguments[o];
                                        return null === (e = t.current) || void 0 === e ? void 0 : e.call.apply(e, [t].concat(n))
                                    }
                                }), [])
                            }(e);
                        n.useEffect((function() {
                            var e = function(e) {
                                "Escape" === e.key && r(e)
                            };
                            return t.addEventListener("keydown", e, {
                                    capture: !0
                                }),
                                function() {
                                    return t.removeEventListener("keydown", e, {
                                        capture: !0
                                    })
                                }
                        }), [r, t])
                    }((function(e) {
                        A === p.layers.size - 1 && (null != a && a(e), !e.defaultPrevented && s && (e.preventDefault(), s()))
                    }), m), n.useEffect((function() {
                        if (y) return i && (0 === p.layersWithOutsidePointerEventsDisabled.size && (he = m.body.style.pointerEvents, m.body.style.pointerEvents = "none"), p.layersWithOutsidePointerEventsDisabled.add(y)), p.layers.add(y), Se(),
                            function() {
                                i && 1 === p.layersWithOutsidePointerEventsDisabled.size && (m.body.style.pointerEvents = he)
                            }
                    }), [y, m, i, p]), n.useEffect((function() {
                        return function() {
                            y && (p.layers.delete(y), p.layersWithOutsidePointerEventsDisabled.delete(y), Se())
                        }
                    }), [y, p]), n.useEffect((function() {
                        var e = function() {
                            return h({})
                        };
                        return document.addEventListener(ge, e),
                            function() {
                                return document.removeEventListener(ge, e)
                            }
                    }), []), (0, L.jsx)(ve.div, ae(ae({}, f), {}, {
                        ref: g,
                        style: ae({
                            pointerEvents: x ? E ? "auto" : "none" : void 0
                        }, e.style),
                        onFocusCapture: le(e.onFocusCapture, P.onFocusCapture),
                        onBlurCapture: le(e.onBlurCapture, P.onBlurCapture),
                        onPointerDownCapture: le(e.onPointerDownCapture, O.onPointerDownCapture)
                    }))
                }));

            function Se() {
                var e = new CustomEvent(ge);
                document.dispatchEvent(e)
            }

            function Ae(e, t, r, n) {
                var o = n.discrete,
                    a = r.originalEvent.target,
                    u = new CustomEvent(e, {
                        bubbles: !1,
                        cancelable: !0,
                        detail: r
                    });
                t && a.addEventListener(e, t, {
                    once: !0
                }), o ? function(e, t) {
                    e && i.flushSync((function() {
                        return e.dispatchEvent(t)
                    }))
                }(a, u) : a.dispatchEvent(u)
            }
            we.displayName = "DismissableLayer", n.forwardRef((function(e, t) {
                var r = n.useContext(be),
                    o = n.useRef(null),
                    i = pe(t, o);
                return n.useEffect((function() {
                    var e = o.current;
                    if (e) return r.branches.add(e),
                        function() {
                            r.branches.delete(e)
                        }
                }), [r.branches]), (0, L.jsx)(ve.div, ae(ae({}, e), {}, {
                    ref: i
                }))
            })).displayName = "DismissableLayerBranch";
            var xe = 0;

            function Ee() {
                n.useEffect((function() {
                    var e, t, r = document.querySelectorAll("[data-radix-focus-guard]");
                    return document.body.insertAdjacentElement("afterbegin", null !== (e = r[0]) && void 0 !== e ? e : Oe()), document.body.insertAdjacentElement("beforeend", null !== (t = r[1]) && void 0 !== t ? t : Oe()), xe++,
                        function() {
                            1 === xe && document.querySelectorAll("[data-radix-focus-guard]").forEach((function(e) {
                                return e.remove()
                            })), xe--
                        }
                }), [])
            }

            function Oe() {
                var e = document.createElement("span");
                return e.setAttribute("data-radix-focus-guard", ""), e.tabIndex = 0, e.style.outline = "none", e.style.opacity = "0", e.style.position = "fixed", e.style.pointerEvents = "none", e
            }

            function Pe(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function je() {
                for (var e = arguments.length, t = new Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return function(e) {
                    var r = !1,
                        n = t.map((function(t) {
                            var n = Pe(t, e);
                            return r || "function" != typeof n || (r = !0), n
                        }));
                    if (r) return function() {
                        for (var e = 0; e < n.length; e++) {
                            var r = n[e];
                            "function" == typeof r ? r() : Pe(t[e], null)
                        }
                    }
                }
            }
            var Re = Symbol("radix.slottable");

            function Ie(e) {
                return n.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === Re
            }
            var Ce = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((function(e, t) {
                var r = function(e) {
                        var t = function(e) {
                                var t = n.forwardRef((function(e, t) {
                                    var r = e.children,
                                        o = ce(e, $);
                                    if (n.isValidElement(r)) {
                                        var i = function(e) {
                                                var t, r, n = null === (t = Object.getOwnPropertyDescriptor(e.props, "ref")) || void 0 === t ? void 0 : t.get,
                                                    o = n && "isReactWarning" in n && n.isReactWarning;
                                                return o ? e.ref : (o = (n = null === (r = Object.getOwnPropertyDescriptor(e, "ref")) || void 0 === r ? void 0 : r.get) && "isReactWarning" in n && n.isReactWarning) ? e.props.ref : e.props.ref || e.ref
                                            }(r),
                                            a = function(e, t) {
                                                var r = ae({}, t),
                                                    n = function(n) {
                                                        var o = e[n],
                                                            i = t[n];
                                                        /^on[A-Z]/.test(n) ? o && i ? r[n] = function() {
                                                            i.apply(void 0, arguments), o.apply(void 0, arguments)
                                                        } : o && (r[n] = o) : "style" === n ? r[n] = ae(ae({}, o), i) : "className" === n && (r[n] = [o, i].filter(Boolean).join(" "))
                                                    };
                                                for (var o in t) n(o);
                                                return ae(ae({}, e), r)
                                            }(o, r.props);
                                        return r.type !== n.Fragment && (a.ref = t ? je(t, i) : i), n.cloneElement(r, a)
                                    }
                                    return n.Children.count(r) > 1 ? n.Children.only(null) : null
                                }));
                                return t.displayName = "".concat(e, ".SlotClone"), t
                            }(e),
                            r = n.forwardRef((function(e, r) {
                                var o = e.children,
                                    i = ce(e, H),
                                    a = n.Children.toArray(o),
                                    u = a.find(Ie);
                                if (u) {
                                    var c = u.props.children,
                                        l = a.map((function(e) {
                                            return e === u ? n.Children.count(c) > 1 ? n.Children.only(null) : n.isValidElement(c) ? c.props.children : null : e
                                        }));
                                    return (0, L.jsx)(t, ae(ae({}, i), {}, {
                                        ref: r,
                                        children: n.isValidElement(c) ? n.cloneElement(c, void 0, l) : null
                                    }))
                                }
                                return (0, L.jsx)(t, ae(ae({}, i), {}, {
                                    ref: r,
                                    children: o
                                }))
                            }));
                        return r.displayName = "".concat(e, ".Slot"), r
                    }("Primitive.".concat(t)),
                    o = n.forwardRef((function(e, n) {
                        var o = e.asChild,
                            i = ce(e, J),
                            a = o ? r : t;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, L.jsx)(a, ae(ae({}, i), {}, {
                            ref: n
                        }))
                    }));
                return o.displayName = "Primitive.".concat(t), ae(ae({}, e), {}, ue({}, t, o))
            }), {});

            function ke(e) {
                var t = n.useRef(e);
                return n.useEffect((function() {
                    t.current = e
                })), n.useMemo((function() {
                    return function() {
                        for (var e, r = arguments.length, n = new Array(r), o = 0; o < r; o++) n[o] = arguments[o];
                        return null === (e = t.current) || void 0 === e ? void 0 : e.call.apply(e, [t].concat(n))
                    }
                }), [])
            }
            var Fe = "focusScope.autoFocusOnMount",
                Ne = "focusScope.autoFocusOnUnmount",
                Te = {
                    bubbles: !1,
                    cancelable: !0
                },
                _e = n.forwardRef((function(e, t) {
                    var r = e.loop,
                        o = void 0 !== r && r,
                        i = e.trapped,
                        a = void 0 !== i && i,
                        u = e.onMountAutoFocus,
                        c = e.onUnmountAutoFocus,
                        l = ce(e, X),
                        s = re(n.useState(null), 2),
                        f = s[0],
                        p = s[1],
                        d = ke(u),
                        y = ke(c),
                        v = n.useRef(null),
                        m = function() {
                            for (var e = arguments.length, t = new Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                            return n.useCallback(je.apply(void 0, t), t)
                        }(t, (function(e) {
                            return p(e)
                        })),
                        h = n.useRef({
                            paused: !1,
                            pause: function() {
                                this.paused = !0
                            },
                            resume: function() {
                                this.paused = !1
                            }
                        }).current;
                    n.useEffect((function() {
                        if (a) {
                            var e = function(e) {
                                    if (!h.paused && f) {
                                        var t = e.target;
                                        f.contains(t) ? v.current = t : Be(v.current, {
                                            select: !0
                                        })
                                    }
                                },
                                t = function(e) {
                                    if (!h.paused && f) {
                                        var t = e.relatedTarget;
                                        null !== t && (f.contains(t) || Be(v.current, {
                                            select: !0
                                        }))
                                    }
                                };
                            document.addEventListener("focusin", e), document.addEventListener("focusout", t);
                            var r = new MutationObserver((function(e) {
                                if (document.activeElement === document.body) {
                                    var t, r = ee(e);
                                    try {
                                        for (r.s(); !(t = r.n()).done;) {
                                            t.value.removedNodes.length > 0 && Be(f)
                                        }
                                    } catch (e) {
                                        r.e(e)
                                    } finally {
                                        r.f()
                                    }
                                }
                            }));
                            return f && r.observe(f, {
                                    childList: !0,
                                    subtree: !0
                                }),
                                function() {
                                    document.removeEventListener("focusin", e), document.removeEventListener("focusout", t), r.disconnect()
                                }
                        }
                    }), [a, f, h.paused]), n.useEffect((function() {
                        if (f) {
                            Le.add(h);
                            var e = document.activeElement;
                            if (!f.contains(e)) {
                                var t = new CustomEvent(Fe, Te);
                                f.addEventListener(Fe, d), f.dispatchEvent(t), t.defaultPrevented || (function(e) {
                                    var t, r = (arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}).select,
                                        n = void 0 !== r && r,
                                        o = document.activeElement,
                                        i = ee(e);
                                    try {
                                        for (i.s(); !(t = i.n()).done;) {
                                            if (Be(t.value, {
                                                    select: n
                                                }), document.activeElement !== o) return
                                        }
                                    } catch (e) {
                                        i.e(e)
                                    } finally {
                                        i.f()
                                    }
                                }(De(f).filter((function(e) {
                                    return "A" !== e.tagName
                                })), {
                                    select: !0
                                }), document.activeElement === e && Be(f))
                            }
                            return function() {
                                f.removeEventListener(Fe, d), setTimeout((function() {
                                    var t = new CustomEvent(Ne, Te);
                                    f.addEventListener(Ne, y), f.dispatchEvent(t), t.defaultPrevented || Be(null != e ? e : document.body, {
                                        select: !0
                                    }), f.removeEventListener(Ne, y), Le.remove(h)
                                }), 0)
                            }
                        }
                    }), [f, d, y, h]);
                    var g = n.useCallback((function(e) {
                        if ((o || a) && !h.paused) {
                            var t = "Tab" === e.key && !e.altKey && !e.ctrlKey && !e.metaKey,
                                r = document.activeElement;
                            if (t && r) {
                                var n = e.currentTarget,
                                    i = function(e) {
                                        var t = De(e);
                                        return [Me(t, e), Me(t.reverse(), e)]
                                    }(n),
                                    u = re(i, 2),
                                    c = u[0],
                                    l = u[1];
                                c && l ? e.shiftKey || r !== l ? e.shiftKey && r === c && (e.preventDefault(), o && Be(l, {
                                    select: !0
                                })) : (e.preventDefault(), o && Be(c, {
                                    select: !0
                                })) : r === n && e.preventDefault()
                            }
                        }
                    }), [o, a, h.paused]);
                    return (0, L.jsx)(Ce.div, ae(ae({
                        tabIndex: -1
                    }, l), {}, {
                        ref: m,
                        onKeyDown: g
                    }))
                }));

            function De(e) {
                for (var t = [], r = document.createTreeWalker(e, NodeFilter.SHOW_ELEMENT, {
                        acceptNode: function(e) {
                            var t = "INPUT" === e.tagName && "hidden" === e.type;
                            return e.disabled || e.hidden || t ? NodeFilter.FILTER_SKIP : e.tabIndex >= 0 ? NodeFilter.FILTER_ACCEPT : NodeFilter.FILTER_SKIP
                        }
                    }); r.nextNode();) t.push(r.currentNode);
                return t
            }

            function Me(e, t) {
                var r, n = ee(e);
                try {
                    for (n.s(); !(r = n.n()).done;) {
                        var o = r.value;
                        if (!Ue(o, {
                                upTo: t
                            })) return o
                    }
                } catch (e) {
                    n.e(e)
                } finally {
                    n.f()
                }
            }

            function Ue(e, t) {
                var r = t.upTo;
                if ("hidden" === getComputedStyle(e).visibility) return !0;
                for (; e;) {
                    if (void 0 !== r && e === r) return !1;
                    if ("none" === getComputedStyle(e).display) return !0;
                    e = e.parentElement
                }
                return !1
            }

            function Be(e) {
                var t = (arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}).select,
                    r = void 0 !== t && t;
                if (e && e.focus) {
                    var n = document.activeElement;
                    e.focus({
                        preventScroll: !0
                    }), e !== n && function(e) {
                        return e instanceof HTMLInputElement && "select" in e
                    }(e) && r && e.select()
                }
            }
            _e.displayName = "FocusScope";
            var Le = function() {
                var e = [];
                return {
                    add: function(t) {
                        var r = e[0];
                        t !== r && null != r && r.pause(), (e = We(e, t)).unshift(t)
                    },
                    remove: function(t) {
                        var r;
                        null === (r = (e = We(e, t))[0]) || void 0 === r || r.resume()
                    }
                }
            }();

            function We(e, t) {
                var r = te(e),
                    n = r.indexOf(t);
                return -1 !== n && r.splice(n, 1), r
            }

            function Ge(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }
            var ze = Symbol("radix.slottable");

            function Ve(e) {
                return n.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === ze
            }
            var qe = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((function(e, t) {
                    var r = function(e) {
                            var t = function(e) {
                                    var t = n.forwardRef((function(e, t) {
                                        var r = e.children,
                                            o = ce(e, K);
                                        if (n.isValidElement(r)) {
                                            var i = function(e) {
                                                    var t, r, n = null === (t = Object.getOwnPropertyDescriptor(e.props, "ref")) || void 0 === t ? void 0 : t.get,
                                                        o = n && "isReactWarning" in n && n.isReactWarning;
                                                    return o ? e.ref : (o = (n = null === (r = Object.getOwnPropertyDescriptor(e, "ref")) || void 0 === r ? void 0 : r.get) && "isReactWarning" in n && n.isReactWarning) ? e.props.ref : e.props.ref || e.ref
                                                }(r),
                                                a = function(e, t) {
                                                    var r = ae({}, t),
                                                        n = function(n) {
                                                            var o = e[n],
                                                                i = t[n];
                                                            /^on[A-Z]/.test(n) ? o && i ? r[n] = function() {
                                                                i.apply(void 0, arguments), o.apply(void 0, arguments)
                                                            } : o && (r[n] = o) : "style" === n ? r[n] = ae(ae({}, o), i) : "className" === n && (r[n] = [o, i].filter(Boolean).join(" "))
                                                        };
                                                    for (var o in t) n(o);
                                                    return ae(ae({}, e), r)
                                                }(o, r.props);
                                            return r.type !== n.Fragment && (a.ref = t ? function() {
                                                for (var e = arguments.length, t = new Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                                return function(e) {
                                                    var r = !1,
                                                        n = t.map((function(t) {
                                                            var n = Ge(t, e);
                                                            return r || "function" != typeof n || (r = !0), n
                                                        }));
                                                    if (r) return function() {
                                                        for (var e = 0; e < n.length; e++) {
                                                            var r = n[e];
                                                            "function" == typeof r ? r() : Ge(t[e], null)
                                                        }
                                                    }
                                                }
                                            }(t, i) : i), n.cloneElement(r, a)
                                        }
                                        return n.Children.count(r) > 1 ? n.Children.only(null) : null
                                    }));
                                    return t.displayName = "".concat(e, ".SlotClone"), t
                                }(e),
                                r = n.forwardRef((function(e, r) {
                                    var o = e.children,
                                        i = ce(e, Y),
                                        a = n.Children.toArray(o),
                                        u = a.find(Ve);
                                    if (u) {
                                        var c = u.props.children,
                                            l = a.map((function(e) {
                                                return e === u ? n.Children.count(c) > 1 ? n.Children.only(null) : n.isValidElement(c) ? c.props.children : null : e
                                            }));
                                        return (0, L.jsx)(t, ae(ae({}, i), {}, {
                                            ref: r,
                                            children: n.isValidElement(c) ? n.cloneElement(c, void 0, l) : null
                                        }))
                                    }
                                    return (0, L.jsx)(t, ae(ae({}, i), {}, {
                                        ref: r,
                                        children: o
                                    }))
                                }));
                            return r.displayName = "".concat(e, ".Slot"), r
                        }("Primitive.".concat(t)),
                        o = n.forwardRef((function(e, n) {
                            var o = e.asChild,
                                i = ce(e, Z),
                                a = o ? r : t;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, L.jsx)(a, ae(ae({}, i), {}, {
                                ref: n
                            }))
                        }));
                    return o.displayName = "Primitive.".concat(t), ae(ae({}, e), {}, ue({}, t, o))
                }), {}),
                $e = null !== globalThis && void 0 !== globalThis && globalThis.document ? n.useLayoutEffect : function() {},
                He = n.forwardRef((function(e, t) {
                    var r, o = e.container,
                        i = ce(e, Q),
                        u = re(n.useState(!1), 2),
                        c = u[0],
                        l = u[1];
                    $e((function() {
                        return l(!0)
                    }), []);
                    var s = o || c && (null === globalThis || void 0 === globalThis || null === (r = globalThis.document) || void 0 === r ? void 0 : r.body);
                    return s ? a().createPortal((0, L.jsx)(qe.div, ae(ae({}, i), {}, {
                        ref: t
                    })), s) : null
                }));
            He.displayName = "Portal";
            var Je = new WeakMap,
                Xe = new WeakMap,
                Ke = {},
                Ye = 0,
                Ze = function e(t) {
                    return t && (t.host || e(t.parentNode))
                },
                Qe = function(e, t, r) {
                    void 0 === r && (r = "data-aria-hidden");
                    var n = Array.from(Array.isArray(e) ? e : [e]),
                        o = t || function(e) {
                            return "undefined" == typeof document ? null : (Array.isArray(e) ? e[0] : e).ownerDocument.body
                        }(e);
                    return o ? (n.push.apply(n, Array.from(o.querySelectorAll("[aria-live]"))), function(e, t, r, n) {
                        var o = function(e, t) {
                            return t.map((function(t) {
                                if (e.contains(t)) return t;
                                var r = Ze(t);
                                return r && e.contains(r) ? r : (W.error("aria-hidden", t, "in not contained inside", e, ". Doing nothing"), null)
                            })).filter((function(e) {
                                return Boolean(e)
                            }))
                        }(t, Array.isArray(e) ? e : [e]);
                        Ke[r] || (Ke[r] = new WeakMap);
                        var i = Ke[r],
                            a = [],
                            u = new Set,
                            c = new Set(o);
                        return o.forEach((function e(t) {
                                t && !u.has(t) && (u.add(t), e(t.parentNode))
                            })),
                            function e(t) {
                                t && !c.has(t) && Array.prototype.forEach.call(t.children, (function(t) {
                                    if (u.has(t)) e(t);
                                    else try {
                                        var o = t.getAttribute(n),
                                            c = null !== o && "false" !== o,
                                            l = (Je.get(t) || 0) + 1,
                                            s = (i.get(t) || 0) + 1;
                                        Je.set(t, l), i.set(t, s), a.push(t), 1 === l && c && Xe.set(t, !0), 1 === s && t.setAttribute(r, "true"), c || t.setAttribute(n, "true")
                                    } catch (o) {
                                        W.error("aria-hidden: cannot operate on ", t, o)
                                    }
                                }))
                            }(t), u.clear(), Ye++,
                            function() {
                                a.forEach((function(e) {
                                    var t = Je.get(e) - 1,
                                        o = i.get(e) - 1;
                                    Je.set(e, t), i.set(e, o), t || (Xe.has(e) || e.removeAttribute(n), Xe.delete(e)), o || e.removeAttribute(r)
                                })), --Ye || (Je = new WeakMap, Je = new WeakMap, Xe = new WeakMap, Ke = {})
                            }
                    }(n, o, r, "aria-hidden")) : function() {
                        return null
                    }
                },
                et = "right-scroll-bar-position",
                tt = "width-before-scroll-bar";

            function rt(e, t) {
                return "function" == typeof e ? e(t) : e && (e.current = t), e
            }
            var nt = "undefined" != typeof window ? n.useLayoutEffect : n.useEffect,
                ot = new WeakMap;

            function it(e) {
                return e
            }
            var at = function(e) {
                var t = e.sideCar,
                    r = M(e, ["sideCar"]);
                if (!t) throw new Error("Sidecar: please provide `sideCar` property to import the right car");
                var o = t.read();
                if (!o) throw new Error("Sidecar medium not found");
                return n.createElement(o, D({}, r))
            };
            at.isSideCarExport = !0;
            var ut = function(e) {
                    void 0 === e && (e = {});
                    var t = function(e, t) {
                        void 0 === t && (t = it);
                        var r = [],
                            n = !1;
                        return {
                            read: function() {
                                if (n) throw new Error("Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`.");
                                return r.length ? r[r.length - 1] : null
                            },
                            useMedium: function(e) {
                                var o = t(e, n);
                                return r.push(o),
                                    function() {
                                        r = r.filter((function(e) {
                                            return e !== o
                                        }))
                                    }
                            },
                            assignSyncMedium: function(e) {
                                for (n = !0; r.length;) {
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
                                n = !0;
                                var t = [];
                                if (r.length) {
                                    var o = r;
                                    r = [], o.forEach(e), t = r
                                }
                                var i = function() {
                                        var r = t;
                                        t = [], r.forEach(e)
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
                        }
                    }();
                    return t.options = D({
                        async: !0,
                        ssr: !1
                    }, e), t
                }(),
                ct = function() {},
                lt = n.forwardRef((function(e, t) {
                    var r = n.useRef(null),
                        o = n.useState({
                            onScrollCapture: ct,
                            onWheelCapture: ct,
                            onTouchMoveCapture: ct
                        }),
                        i = o[0],
                        a = o[1],
                        u = e.forwardProps,
                        c = e.children,
                        l = e.className,
                        s = e.removeScrollBar,
                        f = e.enabled,
                        p = e.shards,
                        d = e.sideCar,
                        y = e.noIsolation,
                        v = e.inert,
                        m = e.allowPinchZoom,
                        h = e.as,
                        g = void 0 === h ? "div" : h,
                        b = e.gapMode,
                        w = M(e, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                        S = d,
                        A = function(e, t) {
                            var r, o, i, a = (r = t || null, o = function(t) {
                                return e.forEach((function(e) {
                                    return rt(e, t)
                                }))
                            }, (i = (0, n.useState)((function() {
                                return {
                                    value: r,
                                    callback: o,
                                    facade: {
                                        get current() {
                                            return i.value
                                        },
                                        set current(e) {
                                            var t = i.value;
                                            t !== e && (i.value = e, i.callback(e, t))
                                        }
                                    }
                                }
                            }))[0]).callback = o, i.facade);
                            return nt((function() {
                                var t = ot.get(a);
                                if (t) {
                                    var r = new Set(t),
                                        n = new Set(e),
                                        o = a.current;
                                    r.forEach((function(e) {
                                        n.has(e) || rt(e, null)
                                    })), n.forEach((function(e) {
                                        r.has(e) || rt(e, o)
                                    }))
                                }
                                ot.set(a, e)
                            }), [e]), a
                        }([r, t]),
                        x = D(D({}, w), i);
                    return n.createElement(n.Fragment, null, f && n.createElement(S, {
                        sideCar: ut,
                        removeScrollBar: s,
                        shards: p,
                        noIsolation: y,
                        inert: v,
                        setCallbacks: a,
                        allowPinchZoom: !!m,
                        lockRef: r,
                        gapMode: b
                    }), u ? n.cloneElement(n.Children.only(c), D(D({}, x), {
                        ref: A
                    })) : n.createElement(g, D({}, x, {
                        className: l,
                        ref: A
                    }), c))
                }));
            lt.defaultProps = {
                enabled: !0,
                removeScrollBar: !0,
                inert: !1
            }, lt.classNames = {
                fullWidth: tt,
                zeroRight: et
            };
            var st = function() {
                    var e = 0,
                        t = null;
                    return {
                        add: function(n) {
                            var o, i;
                            0 == e && (t = function() {
                                if (!document) return null;
                                var e = document.createElement("style");
                                e.type = "text/css";
                                var t = r.nc;
                                return t && e.setAttribute("nonce", t), e
                            }()) && (i = n, (o = t).styleSheet ? o.styleSheet.cssText = i : o.appendChild(document.createTextNode(i)), function(e) {
                                (document.head || document.getElementsByTagName("head")[0]).appendChild(e)
                            }(t)), e++
                        },
                        remove: function() {
                            !--e && t && (t.parentNode && t.parentNode.removeChild(t), t = null)
                        }
                    }
                },
                ft = function() {
                    var e, t = (e = st(), function(t, r) {
                        n.useEffect((function() {
                            return e.add(t),
                                function() {
                                    e.remove()
                                }
                        }), [t && r])
                    });
                    return function(e) {
                        var r = e.styles,
                            n = e.dynamic;
                        return t(r, n), null
                    }
                },
                pt = {
                    left: 0,
                    top: 0,
                    right: 0,
                    gap: 0
                },
                dt = function(e) {
                    return parseInt(e || "", 10) || 0
                },
                yt = ft(),
                vt = "data-scroll-locked",
                mt = function(e, t, r, n) {
                    var o = e.left,
                        i = e.top,
                        a = e.right,
                        u = e.gap;
                    return void 0 === r && (r = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(n, ";\n   padding-right: ").concat(u, "px ").concat(n, ";\n  }\n  body[").concat(vt, "] {\n    overflow: hidden ").concat(n, ";\n    overscroll-behavior: contain;\n    ").concat([t && "position: relative ".concat(n, ";"), "margin" === r && "\n    padding-left: ".concat(o, "px;\n    padding-top: ").concat(i, "px;\n    padding-right: ").concat(a, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(u, "px ").concat(n, ";\n    "), "padding" === r && "padding-right: ".concat(u, "px ").concat(n, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(et, " {\n    right: ").concat(u, "px ").concat(n, ";\n  }\n  \n  .").concat(tt, " {\n    margin-right: ").concat(u, "px ").concat(n, ";\n  }\n  \n  .").concat(et, " .").concat(et, " {\n    right: 0 ").concat(n, ";\n  }\n  \n  .").concat(tt, " .").concat(tt, " {\n    margin-right: 0 ").concat(n, ";\n  }\n  \n  body[").concat(vt, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(u, "px;\n  }\n")
                },
                ht = function() {
                    var e = parseInt(document.body.getAttribute(vt) || "0", 10);
                    return isFinite(e) ? e : 0
                },
                gt = function(e) {
                    var t = e.noRelative,
                        r = e.noImportant,
                        o = e.gapMode,
                        i = void 0 === o ? "margin" : o;
                    n.useEffect((function() {
                        return document.body.setAttribute(vt, (ht() + 1).toString()),
                            function() {
                                var e = ht() - 1;
                                e <= 0 ? document.body.removeAttribute(vt) : document.body.setAttribute(vt, e.toString())
                            }
                    }), []);
                    var a = n.useMemo((function() {
                        return function(e) {
                            if (void 0 === e && (e = "margin"), "undefined" == typeof window) return pt;
                            var t = function(e) {
                                    var t = window.getComputedStyle(document.body),
                                        r = t["padding" === e ? "paddingLeft" : "marginLeft"],
                                        n = t["padding" === e ? "paddingTop" : "marginTop"],
                                        o = t["padding" === e ? "paddingRight" : "marginRight"];
                                    return [dt(r), dt(n), dt(o)]
                                }(e),
                                r = document.documentElement.clientWidth,
                                n = window.innerWidth;
                            return {
                                left: t[0],
                                top: t[1],
                                right: t[2],
                                gap: Math.max(0, n - r + t[2] - t[0])
                            }
                        }(i)
                    }), [i]);
                    return n.createElement(yt, {
                        styles: mt(a, !t, i, r ? "" : "!important")
                    })
                },
                bt = !1;
            if ("undefined" != typeof window) try {
                var wt = Object.defineProperty({}, "passive", {
                    get: function() {
                        return bt = !0, !0
                    }
                });
                window.addEventListener("test", wt, wt), window.removeEventListener("test", wt, wt)
            } catch (e) {
                bt = !1
            }
            var St = !!bt && {
                    passive: !1
                },
                At = function(e, t) {
                    if (!(e instanceof Element)) return !1;
                    var r = window.getComputedStyle(e);
                    return "hidden" !== r[t] && !(r.overflowY === r.overflowX && ! function(e) {
                        return "TEXTAREA" === e.tagName
                    }(e) && "visible" === r[t])
                },
                xt = function(e, t) {
                    var r = t.ownerDocument,
                        n = t;
                    do {
                        if ("undefined" != typeof ShadowRoot && n instanceof ShadowRoot && (n = n.host), Et(e, n)) {
                            var o = Ot(e, n);
                            if (o[1] > o[2]) return !0
                        }
                        n = n.parentNode
                    } while (n && n !== r.body);
                    return !1
                },
                Et = function(e, t) {
                    return "v" === e ? function(e) {
                        return At(e, "overflowY")
                    }(t) : function(e) {
                        return At(e, "overflowX")
                    }(t)
                },
                Ot = function(e, t) {
                    return "v" === e ? [(r = t).scrollTop, r.scrollHeight, r.clientHeight] : function(e) {
                        return [e.scrollLeft, e.scrollWidth, e.clientWidth]
                    }(t);
                    var r
                },
                Pt = function(e) {
                    return "changedTouches" in e ? [e.changedTouches[0].clientX, e.changedTouches[0].clientY] : [0, 0]
                },
                jt = function(e) {
                    return [e.deltaX, e.deltaY]
                },
                Rt = function(e) {
                    return e && "current" in e ? e.current : e
                },
                It = function(e) {
                    return "\n  .block-interactivity-".concat(e, " {pointer-events: none;}\n  .allow-interactivity-").concat(e, " {pointer-events: all;}\n")
                },
                Ct = 0,
                kt = [];

            function Ft(e) {
                for (var t = null; null !== e;) e instanceof ShadowRoot && (t = e.host, e = e.host), e = e.parentNode;
                return t
            }
            var Nt, Tt = (Nt = function(e) {
                    var t = n.useRef([]),
                        r = n.useRef([0, 0]),
                        o = n.useRef(),
                        i = n.useState(Ct++)[0],
                        a = n.useState(ft)[0],
                        u = n.useRef(e);
                    n.useEffect((function() {
                        u.current = e
                    }), [e]), n.useEffect((function() {
                        if (e.inert) {
                            document.body.classList.add("block-interactivity-".concat(i));
                            var t = function(e, t, r) {
                                if (r || 2 === arguments.length)
                                    for (var n, o = 0, i = t.length; o < i; o++) !n && o in t || (n || (n = Array.prototype.slice.call(t, 0, o)), n[o] = t[o]);
                                return e.concat(n || Array.prototype.slice.call(t))
                            }([e.lockRef.current], (e.shards || []).map(Rt), !0).filter(Boolean);
                            return t.forEach((function(e) {
                                    return e.classList.add("allow-interactivity-".concat(i))
                                })),
                                function() {
                                    document.body.classList.remove("block-interactivity-".concat(i)), t.forEach((function(e) {
                                        return e.classList.remove("allow-interactivity-".concat(i))
                                    }))
                                }
                        }
                    }), [e.inert, e.lockRef.current, e.shards]);
                    var c = n.useCallback((function(e, t) {
                            if ("touches" in e && 2 === e.touches.length || "wheel" === e.type && e.ctrlKey) return !u.current.allowPinchZoom;
                            var n, i = Pt(e),
                                a = r.current,
                                c = "deltaX" in e ? e.deltaX : a[0] - i[0],
                                l = "deltaY" in e ? e.deltaY : a[1] - i[1],
                                s = e.target,
                                f = Math.abs(c) > Math.abs(l) ? "h" : "v";
                            if ("touches" in e && "h" === f && "range" === s.type) return !1;
                            var p = xt(f, s);
                            if (!p) return !0;
                            if (p ? n = f : (n = "v" === f ? "h" : "v", p = xt(f, s)), !p) return !1;
                            if (!o.current && "changedTouches" in e && (c || l) && (o.current = n), !n) return !0;
                            var d = o.current || n;
                            return function(e, t, r, n, o) {
                                var i = function(e, t) {
                                        return "h" === e && "rtl" === t ? -1 : 1
                                    }(e, window.getComputedStyle(t).direction),
                                    a = i * n,
                                    u = r.target,
                                    c = t.contains(u),
                                    l = !1,
                                    s = a > 0,
                                    f = 0,
                                    p = 0;
                                do {
                                    var d = Ot(e, u),
                                        y = d[0],
                                        v = d[1] - d[2] - i * y;
                                    (y || v) && Et(e, u) && (f += v, p += y), u = u instanceof ShadowRoot ? u.host : u.parentNode
                                } while (!c && u !== document.body || c && (t.contains(u) || t === u));
                                return (s && (o && Math.abs(f) < 1 || !o && a > f) || !s && (o && Math.abs(p) < 1 || !o && -a > p)) && (l = !0), l
                            }(d, t, e, "h" === d ? c : l, !0)
                        }), []),
                        l = n.useCallback((function(e) {
                            var r = e;
                            if (kt.length && kt[kt.length - 1] === a) {
                                var n = "deltaY" in r ? jt(r) : Pt(r),
                                    o = t.current.filter((function(e) {
                                        return e.name === r.type && (e.target === r.target || r.target === e.shadowParent) && function(e, t) {
                                            return e[0] === t[0] && e[1] === t[1]
                                        }(e.delta, n)
                                    }))[0];
                                if (o && o.should) r.cancelable && r.preventDefault();
                                else if (!o) {
                                    var i = (u.current.shards || []).map(Rt).filter(Boolean).filter((function(e) {
                                        return e.contains(r.target)
                                    }));
                                    (i.length > 0 ? c(r, i[0]) : !u.current.noIsolation) && r.cancelable && r.preventDefault()
                                }
                            }
                        }), []),
                        s = n.useCallback((function(e, r, n, o) {
                            var i = {
                                name: e,
                                delta: r,
                                target: n,
                                should: o,
                                shadowParent: Ft(n)
                            };
                            t.current.push(i), setTimeout((function() {
                                t.current = t.current.filter((function(e) {
                                    return e !== i
                                }))
                            }), 1)
                        }), []),
                        f = n.useCallback((function(e) {
                            r.current = Pt(e), o.current = void 0
                        }), []),
                        p = n.useCallback((function(t) {
                            s(t.type, jt(t), t.target, c(t, e.lockRef.current))
                        }), []),
                        d = n.useCallback((function(t) {
                            s(t.type, Pt(t), t.target, c(t, e.lockRef.current))
                        }), []);
                    n.useEffect((function() {
                        return kt.push(a), e.setCallbacks({
                                onScrollCapture: p,
                                onWheelCapture: p,
                                onTouchMoveCapture: d
                            }), document.addEventListener("wheel", l, St), document.addEventListener("touchmove", l, St), document.addEventListener("touchstart", f, St),
                            function() {
                                kt = kt.filter((function(e) {
                                    return e !== a
                                })), document.removeEventListener("wheel", l, St), document.removeEventListener("touchmove", l, St), document.removeEventListener("touchstart", f, St)
                            }
                    }), []);
                    var y = e.removeScrollBar,
                        v = e.inert;
                    return n.createElement(n.Fragment, null, v ? n.createElement(a, {
                        styles: It(i)
                    }) : null, y ? n.createElement(gt, {
                        gapMode: e.gapMode
                    }) : null)
                }, ut.useMedium(Nt), at),
                _t = n.forwardRef((function(e, t) {
                    return n.createElement(lt, D({}, e, {
                        ref: t,
                        sideCar: Tt
                    }))
                }));
            _t.classNames = lt.classNames;
            var Dt = _t;

            function Mt(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var r = [],
                        n = !0,
                        o = !1,
                        i = void 0;
                    try {
                        for (var a, u = e[Symbol.iterator](); !(n = (a = u.next()).done) && (r.push(a.value), !t || r.length !== t); n = !0);
                    } catch (e) {
                        o = !0, i = e
                    } finally {
                        try {
                            n || null == u.return || u.return()
                        } finally {
                            if (o) throw i
                        }
                    }
                    return r
                }(e, t) || function(e, t) {
                    if (!e) return;
                    if ("string" == typeof e) return Ut(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    "Object" === r && e.constructor && (r = e.constructor.name);
                    if ("Map" === r || "Set" === r) return Array.from(e);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return Ut(e, t)
                }(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function Ut(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = new Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var Bt = null !== globalThis && void 0 !== globalThis && globalThis.document ? n.useLayoutEffect : function() {},
                Lt = n[" useId ".trim().toString()] || function() {},
                Wt = 0;

            function Gt(e) {
                var t = Mt(n.useState(Lt()), 2),
                    r = t[0],
                    o = t[1];
                return Bt((function() {
                    e || o((function(e) {
                        return null != e ? e : String(Wt++)
                    }))
                }), [e]), e || (r ? "radix-".concat(r) : "")
            }
            var zt = ["mainAxis", "crossAxis", "limiter"],
                Vt = ["mainAxis", "crossAxis", "fallbackPlacements", "fallbackStrategy", "fallbackAxisSideDirection", "flipAlignment"],
                qt = ["apply"],
                $t = ["strategy"];

            function Ht(e) {
                return Ht = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(e) {
                    return typeof e
                } : function(e) {
                    return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e
                }, Ht(e)
            }

            function Jt(e, t) {
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
                    for (n = 0; n < i.length; n++) r = i[n], t.indexOf(r) >= 0 || Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r])
                }
                return o
            }

            function Xt(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var r = [],
                        n = !0,
                        o = !1,
                        i = void 0;
                    try {
                        for (var a, u = e[Symbol.iterator](); !(n = (a = u.next()).done) && (r.push(a.value), !t || r.length !== t); n = !0);
                    } catch (e) {
                        o = !0, i = e
                    } finally {
                        try {
                            n || null == u.return || u.return()
                        } finally {
                            if (o) throw i
                        }
                    }
                    return r
                }(e, t) || er(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function Kt(e, t) {
                var r = Object.keys(e);
                if (Object.getOwnPropertySymbols) {
                    var n = Object.getOwnPropertySymbols(e);
                    t && (n = n.filter((function(t) {
                        return Object.getOwnPropertyDescriptor(e, t).enumerable
                    }))), r.push.apply(r, n)
                }
                return r
            }

            function Yt(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {};
                    t % 2 ? Kt(Object(r), !0).forEach((function(t) {
                        Zt(e, t, r[t])
                    })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(r)) : Kt(Object(r)).forEach((function(t) {
                        Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(r, t))
                    }))
                }
                return e
            }

            function Zt(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function Qt(e) {
                return function(e) {
                    if (Array.isArray(e)) return tr(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && Symbol.iterator in Object(e)) return Array.from(e)
                }(e) || er(e) || function() {
                    throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function er(e, t) {
                if (e) {
                    if ("string" == typeof e) return tr(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    return "Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r ? Array.from(e) : "Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r) ? tr(e, t) : void 0
                }
            }

            function tr(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = new Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rr(e, t, r, n, o, i, a) {
                try {
                    var u = e[i](a),
                        c = u.value
                } catch (e) {
                    return void r(e)
                }
                u.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function nr(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise((function(n, o) {
                        var i = e.apply(t, r);

                        function a(e) {
                            rr(i, n, o, a, u, "next", e)
                        }

                        function u(e) {
                            rr(i, n, o, a, u, "throw", e)
                        }
                        a(void 0)
                    }))
                }
            }
            var or = ["top", "right", "bottom", "left"],
                ir = Math.min,
                ar = Math.max,
                ur = Math.round,
                cr = Math.floor,
                lr = function(e) {
                    return {
                        x: e,
                        y: e
                    }
                },
                sr = {
                    left: "right",
                    right: "left",
                    bottom: "top",
                    top: "bottom"
                };

            function fr(e, t, r) {
                return ar(e, ir(t, r))
            }

            function pr(e, t) {
                return "function" == typeof e ? e(t) : e
            }

            function dr(e) {
                return e.split("-")[0]
            }

            function yr(e) {
                return e.split("-")[1]
            }

            function vr(e) {
                return "x" === e ? "y" : "x"
            }

            function mr(e) {
                return "y" === e ? "height" : "width"
            }

            function hr(e) {
                var t = e[0];
                return "t" === t || "b" === t ? "y" : "x"
            }

            function gr(e) {
                return vr(hr(e))
            }

            function br(e) {
                return e.includes("start") ? e.replace("start", "end") : e.replace("end", "start")
            }
            var wr = ["left", "right"],
                Sr = ["right", "left"],
                Ar = ["top", "bottom"],
                xr = ["bottom", "top"];

            function Er(e, t, r, n) {
                var o = yr(e),
                    i = function(e, t, r) {
                        switch (e) {
                            case "top":
                            case "bottom":
                                return r ? t ? Sr : wr : t ? wr : Sr;
                            case "left":
                            case "right":
                                return t ? Ar : xr;
                            default:
                                return []
                        }
                    }(dr(e), "start" === r, n);
                return o && (i = i.map((function(e) {
                    return e + "-" + o
                })), t && (i = i.concat(i.map(br)))), i
            }

            function Or(e) {
                var t = dr(e);
                return sr[t] + e.slice(t.length)
            }

            function Pr(e) {
                return "number" != typeof e ? function(e) {
                    var t, r, n, o;
                    return {
                        top: null != (t = e.top) ? t : 0,
                        right: null != (r = e.right) ? r : 0,
                        bottom: null != (n = e.bottom) ? n : 0,
                        left: null != (o = e.left) ? o : 0
                    }
                }(e) : {
                    top: e,
                    right: e,
                    bottom: e,
                    left: e
                }
            }

            function jr(e) {
                var t = e.x,
                    r = e.y,
                    n = e.width,
                    o = e.height;
                return {
                    width: n,
                    height: o,
                    top: r,
                    left: t,
                    right: t + n,
                    bottom: r + o,
                    x: t,
                    y: r
                }
            }

            function Rr(e, t, r) {
                var n, o = e.reference,
                    i = e.floating,
                    a = hr(t),
                    u = gr(t),
                    c = mr(u),
                    l = dr(t),
                    s = "y" === a,
                    f = o.x + o.width / 2 - i.width / 2,
                    p = o.y + o.height / 2 - i.height / 2,
                    d = o[c] / 2 - i[c] / 2;
                switch (l) {
                    case "top":
                        n = {
                            x: f,
                            y: o.y - i.height
                        };
                        break;
                    case "bottom":
                        n = {
                            x: f,
                            y: o.y + o.height
                        };
                        break;
                    case "right":
                        n = {
                            x: o.x + o.width,
                            y: p
                        };
                        break;
                    case "left":
                        n = {
                            x: o.x - i.width,
                            y: p
                        };
                        break;
                    default:
                        n = {
                            x: o.x,
                            y: o.y
                        }
                }
                switch (yr(t)) {
                    case "start":
                        n[u] -= d * (r && s ? -1 : 1);
                        break;
                    case "end":
                        n[u] += d * (r && s ? -1 : 1)
                }
                return n
            }

            function Ir(e, t) {
                return Cr.apply(this, arguments)
            }

            function Cr() {
                return Cr = nr(regeneratorRuntime.mark((function e(t, r) {
                    var n, o, i, a, u, c, l, s, f, p, d, y, v, m, h, g, b, w, S, A, x, E, O, P;
                    return regeneratorRuntime.wrap((function(e) {
                        for (;;) switch (e.prev = e.next) {
                            case 0:
                                return void 0 === r && (r = {}), o = t.x, i = t.y, a = t.platform, u = t.rects, c = t.elements, l = t.strategy, s = pr(r, t), f = s.boundary, p = void 0 === f ? "clippingAncestors" : f, d = s.rootBoundary, y = void 0 === d ? "viewport" : d, v = s.elementContext, m = void 0 === v ? "floating" : v, h = s.altBoundary, g = void 0 !== h && h, b = s.padding, w = Pr(void 0 === b ? 0 : b), S = c[g ? "floating" === m ? "reference" : "floating" : m], e.t0 = jr, e.t1 = a, e.next = 24, null == a.isElement ? void 0 : a.isElement(S);
                            case 24:
                                if (e.t3 = n = e.sent, e.t2 = null == e.t3, e.t2) {
                                    e.next = 28;
                                    break
                                }
                                e.t2 = n;
                            case 28:
                                if (!e.t2) {
                                    e.next = 32;
                                    break
                                }
                                e.t4 = S, e.next = 38;
                                break;
                            case 32:
                                if (e.t5 = S.contextElement, e.t5) {
                                    e.next = 37;
                                    break
                                }
                                return e.next = 36, null == a.getDocumentElement ? void 0 : a.getDocumentElement(c.floating);
                            case 36:
                                e.t5 = e.sent;
                            case 37:
                                e.t4 = e.t5;
                            case 38:
                                return e.t6 = e.t4, e.t7 = p, e.t8 = y, e.t9 = l, e.t10 = {
                                    element: e.t6,
                                    boundary: e.t7,
                                    rootBoundary: e.t8,
                                    strategy: e.t9
                                }, e.next = 45, e.t1.getClippingRect.call(e.t1, e.t10);
                            case 45:
                                return e.t11 = e.sent, A = (0, e.t0)(e.t11), x = "floating" === m ? {
                                    x: o,
                                    y: i,
                                    width: u.floating.width,
                                    height: u.floating.height
                                } : u.reference, e.next = 50, null == a.getOffsetParent ? void 0 : a.getOffsetParent(c.floating);
                            case 50:
                                return E = e.sent, e.next = 53, null == a.isElement ? void 0 : a.isElement(E);
                            case 53:
                                if (e.t13 = e.sent, !e.t13) {
                                    e.next = 58;
                                    break
                                }
                                return e.next = 57, null == a.getScale ? void 0 : a.getScale(E);
                            case 57:
                                e.t13 = e.sent;
                            case 58:
                                if (e.t12 = e.t13, e.t12) {
                                    e.next = 61;
                                    break
                                }
                                e.t12 = {
                                    x: 1,
                                    y: 1
                                };
                            case 61:
                                if (O = e.t12, e.t14 = jr, !a.convertOffsetParentRelativeRectToViewportRelativeRect) {
                                    e.next = 69;
                                    break
                                }
                                return e.next = 66, a.convertOffsetParentRelativeRectToViewportRelativeRect({
                                    elements: c,
                                    rect: x,
                                    offsetParent: E,
                                    strategy: l
                                });
                            case 66:
                                e.t15 = e.sent, e.next = 70;
                                break;
                            case 69:
                                e.t15 = x;
                            case 70:
                                return e.t16 = e.t15, P = (0, e.t14)(e.t16), e.abrupt("return", {
                                    top: (A.top - P.top + w.top) / O.y,
                                    bottom: (P.bottom - A.bottom + w.bottom) / O.y,
                                    left: (A.left - P.left + w.left) / O.x,
                                    right: (P.right - A.right + w.right) / O.x
                                });
                            case 73:
                            case "end":
                                return e.stop()
                        }
                    }), e)
                }))), Cr.apply(this, arguments)
            }

            function kr(e, t) {
                return {
                    top: e.top - t.height,
                    right: e.right - t.width,
                    bottom: e.bottom - t.height,
                    left: e.left - t.width
                }
            }

            function Fr(e) {
                return or.some((function(t) {
                    return e[t] >= 0
                }))
            }
            var Nr = new Set(["left", "top"]);

            function Tr() {
                return "undefined" != typeof window
            }

            function _r(e) {
                return Ur(e) ? (e.nodeName || "").toLowerCase() : "#document"
            }

            function Dr(e) {
                var t;
                return (null == e || null == (t = e.ownerDocument) ? void 0 : t.defaultView) || window
            }

            function Mr(e) {
                var t;
                return null == (t = (Ur(e) ? e.ownerDocument : e.document) || window.document) ? void 0 : t.documentElement
            }

            function Ur(e) {
                return !!Tr() && (e instanceof Node || e instanceof Dr(e).Node)
            }

            function Br(e) {
                return !!Tr() && (e instanceof Element || e instanceof Dr(e).Element)
            }

            function Lr(e) {
                return !!Tr() && (e instanceof HTMLElement || e instanceof Dr(e).HTMLElement)
            }

            function Wr(e) {
                return !(!Tr() || "undefined" == typeof ShadowRoot) && (e instanceof ShadowRoot || e instanceof Dr(e).ShadowRoot)
            }

            function Gr(e) {
                var t = Zr(e),
                    r = t.overflow,
                    n = t.overflowX,
                    o = t.overflowY,
                    i = t.display;
                return /auto|scroll|overlay|hidden|clip/.test(r + o + n) && "inline" !== i && "contents" !== i
            }

            function zr(e) {
                return /^(table|td|th)$/.test(_r(e))
            }

            function Vr(e) {
                try {
                    if (e.matches(":popover-open")) return !0
                } catch (e) {}
                try {
                    return e.matches(":modal")
                } catch (e) {
                    return !1
                }
            }
            var qr, $r = /transform|translate|scale|rotate|perspective|filter/,
                Hr = /paint|layout|strict|content/,
                Jr = function(e) {
                    return !!e && "none" !== e
                };

            function Xr(e) {
                var t = Br(e) ? Zr(e) : e;
                return Jr(t.transform) || Jr(t.translate) || Jr(t.scale) || Jr(t.rotate) || Jr(t.perspective) || !Kr() && (Jr(t.backdropFilter) || Jr(t.filter)) || $r.test(t.willChange || "") || Hr.test(t.contain || "")
            }

            function Kr() {
                return null == qr && (qr = "undefined" != typeof CSS && CSS.supports && CSS.supports("-webkit-backdrop-filter", "none")), qr
            }

            function Yr(e) {
                return /^(html|body|#document)$/.test(_r(e))
            }

            function Zr(e) {
                return Dr(e).getComputedStyle(e)
            }

            function Qr(e) {
                return Br(e) ? {
                    scrollLeft: e.scrollLeft,
                    scrollTop: e.scrollTop
                } : {
                    scrollLeft: e.scrollX,
                    scrollTop: e.scrollY
                }
            }

            function en(e) {
                if ("html" === _r(e)) return e;
                var t = e.assignedSlot || e.parentNode || Wr(e) && e.host || Mr(e);
                return Wr(t) ? t.host : t
            }

            function tn(e) {
                var t = en(e);
                return Yr(t) ? (e.ownerDocument || e).body : Lr(t) && Gr(t) ? t : tn(t)
            }

            function rn(e, t, r) {
                var n;
                void 0 === t && (t = []), void 0 === r && (r = !0);
                var o = tn(e),
                    i = o === (null == (n = e.ownerDocument) ? void 0 : n.body),
                    a = Dr(o);
                if (i) {
                    var u = nn(a);
                    return t.concat(a, a.visualViewport || [], Gr(o) ? o : [], u && r ? rn(u) : [])
                }
                return t.concat(o, rn(o, [], r))
            }

            function nn(e) {
                return e.parent && Object.getPrototypeOf(e.parent) ? e.frameElement : null
            }

            function on(e) {
                var t = Zr(e),
                    r = parseFloat(t.width) || 0,
                    n = parseFloat(t.height) || 0,
                    o = Lr(e),
                    i = o ? e.offsetWidth : r,
                    a = o ? e.offsetHeight : n,
                    u = ur(r) !== i || ur(n) !== a;
                return u && (r = i, n = a), {
                    width: r,
                    height: n,
                    $: u
                }
            }

            function an(e) {
                return Br(e) ? e : e.contextElement
            }

            function un(e) {
                var t = an(e);
                if (!Lr(t)) return lr(1);
                var r = t.getBoundingClientRect(),
                    n = on(t),
                    o = n.width,
                    i = n.height,
                    a = n.$,
                    u = (a ? ur(r.width) : r.width) / o,
                    c = (a ? ur(r.height) : r.height) / i;
                return u && Number.isFinite(u) || (u = 1), c && Number.isFinite(c) || (c = 1), {
                    x: u,
                    y: c
                }
            }
            var cn = lr(0);

            function ln(e) {
                var t = Dr(e);
                return Kr() && t.visualViewport ? {
                    x: t.visualViewport.offsetLeft,
                    y: t.visualViewport.offsetTop
                } : cn
            }

            function sn(e, t, r, n) {
                void 0 === t && (t = !1), void 0 === r && (r = !1);
                var o = e.getBoundingClientRect(),
                    i = an(e),
                    a = lr(1);
                t && (n ? Br(n) && (a = un(n)) : a = un(e));
                var u = function(e, t, r) {
                        return void 0 === t && (t = !1), !(!r || t && r !== Dr(e)) && t
                    }(i, r, n) ? ln(i) : lr(0),
                    c = (o.left + u.x) / a.x,
                    l = (o.top + u.y) / a.y,
                    s = o.width / a.x,
                    f = o.height / a.y;
                if (i)
                    for (var p = Dr(i), d = n && Br(n) ? Dr(n) : n, y = p, v = nn(y); v && n && d !== y;) {
                        var m = un(v),
                            h = v.getBoundingClientRect(),
                            g = Zr(v),
                            b = h.left + (v.clientLeft + parseFloat(g.paddingLeft)) * m.x,
                            w = h.top + (v.clientTop + parseFloat(g.paddingTop)) * m.y;
                        c *= m.x, l *= m.y, s *= m.x, f *= m.y, c += b, l += w, v = nn(y = Dr(v))
                    }
                return jr({
                    width: s,
                    height: f,
                    x: c,
                    y: l
                })
            }

            function fn(e, t) {
                var r = Qr(e).scrollLeft;
                return t ? t.left + r : sn(Mr(e)).left + r
            }

            function pn(e, t, r) {
                void 0 === r && (r = !1);
                var n = e.getBoundingClientRect();
                return {
                    x: n.left + t.scrollLeft - (r ? 0 : fn(e, n)),
                    y: n.top + t.scrollTop
                }
            }
            var dn = new Set(["absolute", "fixed"]);

            function yn(e, t, r) {
                var n;
                if ("viewport" === t) n = function(e, t) {
                    var r = Dr(e),
                        n = Mr(e),
                        o = r.visualViewport,
                        i = n.clientWidth,
                        a = n.clientHeight,
                        u = 0,
                        c = 0;
                    if (o) {
                        i = o.width, a = o.height;
                        var l = Kr();
                        (!l || l && "fixed" === t) && (u = o.offsetLeft, c = o.offsetTop)
                    }
                    return {
                        width: i,
                        height: a,
                        x: u,
                        y: c
                    }
                }(e, r);
                else if ("document" === t) n = function(e) {
                    var t = Mr(e),
                        r = Qr(e),
                        n = e.ownerDocument.body,
                        o = ar(t.scrollWidth, t.clientWidth, n.scrollWidth, n.clientWidth),
                        i = ar(t.scrollHeight, t.clientHeight, n.scrollHeight, n.clientHeight),
                        a = -r.scrollLeft + fn(e),
                        u = -r.scrollTop;
                    return "rtl" === Zr(n).direction && (a += ar(t.clientWidth, n.clientWidth) - o), {
                        width: o,
                        height: i,
                        x: a,
                        y: u
                    }
                }(Mr(e));
                else if (Br(t)) n = function(e, t) {
                    var r = sn(e, !0, "fixed" === t),
                        n = r.top + e.clientTop,
                        o = r.left + e.clientLeft,
                        i = Lr(e) ? un(e) : lr(1);
                    return {
                        width: e.clientWidth * i.x,
                        height: e.clientHeight * i.y,
                        x: o * i.x,
                        y: n * i.y
                    }
                }(t, r);
                else {
                    var o = ln(e);
                    n = {
                        x: t.x - o.x,
                        y: t.y - o.y,
                        width: t.width,
                        height: t.height
                    }
                }
                return jr(n)
            }

            function vn(e, t) {
                var r = en(e);
                return !(r === t || !Br(r) || Yr(r)) && ("fixed" === Zr(r).position || vn(r, t))
            }

            function mn(e, t, r) {
                var n = Lr(t),
                    o = Mr(t),
                    i = "fixed" === r,
                    a = sn(e, !0, i, t),
                    u = {
                        scrollLeft: 0,
                        scrollTop: 0
                    },
                    c = lr(0);

                function l() {
                    c.x = fn(o)
                }
                if (n || !n && !i)
                    if (("body" !== _r(t) || Gr(o)) && (u = Qr(t)), n) {
                        var s = sn(t, !0, i, t);
                        c.x = s.x + t.clientLeft, c.y = s.y + t.clientTop
                    } else o && l();
                i && !n && o && l();
                var f = !o || n || i ? lr(0) : pn(o, u);
                return {
                    x: a.left + u.scrollLeft - c.x - f.x,
                    y: a.top + u.scrollTop - c.y - f.y,
                    width: a.width,
                    height: a.height
                }
            }

            function hn(e) {
                return "static" === Zr(e).position
            }

            function gn(e, t) {
                if (!Lr(e) || "fixed" === Zr(e).position) return null;
                if (t) return t(e);
                var r = e.offsetParent;
                return Mr(e) === r && (r = r.ownerDocument.body), r
            }

            function bn(e, t) {
                var r = Dr(e);
                if (Vr(e)) return r;
                if (!Lr(e)) {
                    for (var n = en(e); n && !Yr(n);) {
                        if (Br(n) && !hn(n)) return n;
                        n = en(n)
                    }
                    return r
                }
                for (var o = gn(e, t); o && zr(o) && hn(o);) o = gn(o, t);
                return o && Yr(o) && hn(o) && !Xr(o) ? r : o || function(e) {
                    for (var t = en(e); Lr(t) && !Yr(t);) {
                        if (Xr(t)) return t;
                        if (Vr(t)) return null;
                        t = en(t)
                    }
                    return null
                }(e) || r
            }
            var wn, Sn = {
                convertOffsetParentRelativeRectToViewportRelativeRect: function(e) {
                    var t = e.elements,
                        r = e.rect,
                        n = e.offsetParent,
                        o = "fixed" === e.strategy,
                        i = Mr(n),
                        a = !!t && Vr(t.floating);
                    if (n === i || a && o) return r;
                    var u = {
                            scrollLeft: 0,
                            scrollTop: 0
                        },
                        c = lr(1),
                        l = lr(0),
                        s = Lr(n);
                    if ((s || !s && !o) && (("body" !== _r(n) || Gr(i)) && (u = Qr(n)), Lr(n))) {
                        var f = sn(n);
                        c = un(n), l.x = f.x + n.clientLeft, l.y = f.y + n.clientTop
                    }
                    var p = !i || s || o ? lr(0) : pn(i, u, !0);
                    return {
                        width: r.width * c.x,
                        height: r.height * c.y,
                        x: r.x * c.x - u.scrollLeft * c.x + l.x + p.x,
                        y: r.y * c.y - u.scrollTop * c.y + l.y + p.y
                    }
                },
                getDocumentElement: Mr,
                getClippingRect: function(e) {
                    var t = e.element,
                        r = e.boundary,
                        n = e.rootBoundary,
                        o = e.strategy,
                        i = [].concat(Qt("clippingAncestors" === r ? Vr(t) ? [] : function(e, t) {
                            var r = t.get(e);
                            if (r) return r;
                            for (var n = rn(e, [], !1).filter((function(e) {
                                    return Br(e) && "body" !== _r(e)
                                })), o = null, i = "fixed" === Zr(e).position, a = i ? en(e) : e; Br(a) && !Yr(a);) {
                                var u = Zr(a),
                                    c = Xr(a);
                                c || "fixed" !== u.position || (o = null), (i ? !c && !o : !c && "static" === u.position && o && dn.has(o.position) || Gr(a) && !c && vn(e, a)) ? n = n.filter((function(e) {
                                    return e !== a
                                })) : o = u, a = en(a)
                            }
                            return t.set(e, n), n
                        }(t, this._c) : [].concat(r)), [n]),
                        a = i[0],
                        u = i.reduce((function(e, r) {
                            var n = yn(t, r, o);
                            return e.top = ar(n.top, e.top), e.right = ir(n.right, e.right), e.bottom = ir(n.bottom, e.bottom), e.left = ar(n.left, e.left), e
                        }), yn(t, a, o));
                    return {
                        width: u.right - u.left,
                        height: u.bottom - u.top,
                        x: u.left,
                        y: u.top
                    }
                },
                getOffsetParent: bn,
                getElementRects: (wn = nr(regeneratorRuntime.mark((function e(t) {
                    var r, n, o;
                    return regeneratorRuntime.wrap((function(e) {
                        for (;;) switch (e.prev = e.next) {
                            case 0:
                                return r = this.getOffsetParent || bn, n = this.getDimensions, e.next = 4, n(t.floating);
                            case 4:
                                return o = e.sent, e.t0 = mn, e.t1 = t.reference, e.next = 9, r(t.floating);
                            case 9:
                                return e.t2 = e.sent, e.t3 = t.strategy, e.t4 = (0, e.t0)(e.t1, e.t2, e.t3), e.t5 = {
                                    x: 0,
                                    y: 0,
                                    width: o.width,
                                    height: o.height
                                }, e.abrupt("return", {
                                    reference: e.t4,
                                    floating: e.t5
                                });
                            case 14:
                            case "end":
                                return e.stop()
                        }
                    }), e, this)
                }))), function(e) {
                    return wn.apply(this, arguments)
                }),
                getClientRects: function(e) {
                    return Array.from(e.getClientRects())
                },
                getDimensions: function(e) {
                    var t = on(e);
                    return {
                        width: t.width,
                        height: t.height
                    }
                },
                getScale: un,
                isElement: Br,
                isRTL: function(e) {
                    return "rtl" === Zr(e).direction
                }
            };

            function An(e, t) {
                return e.x === t.x && e.y === t.y && e.width === t.width && e.height === t.height
            }

            function xn(e, t, r, n) {
                void 0 === n && (n = {});
                var o = n,
                    i = o.ancestorScroll,
                    a = void 0 === i || i,
                    u = o.ancestorResize,
                    c = void 0 === u || u,
                    l = o.elementResize,
                    s = void 0 === l ? "function" == typeof ResizeObserver : l,
                    f = o.layoutShift,
                    p = void 0 === f ? "function" == typeof IntersectionObserver : f,
                    d = o.animationFrame,
                    y = void 0 !== d && d,
                    v = an(e),
                    m = a || c ? [].concat(Qt(v ? rn(v) : []), Qt(rn(t))) : [];
                m.forEach((function(e) {
                    a && e.addEventListener("scroll", r, {
                        passive: !0
                    }), c && e.addEventListener("resize", r)
                }));
                var h, g = v && p ? function(e, t) {
                        var r, n = null,
                            o = Mr(e);

                        function i() {
                            var e;
                            clearTimeout(r), null == (e = n) || e.disconnect(), n = null
                        }
                        return function a(u, c) {
                            void 0 === u && (u = !1), void 0 === c && (c = 1), i();
                            var l = e.getBoundingClientRect(),
                                s = l.left,
                                f = l.top,
                                p = l.width,
                                d = l.height;
                            if (u || t(), p && d) {
                                var y = {
                                        rootMargin: -cr(f) + "px " + -cr(o.clientWidth - (s + p)) + "px " + -cr(o.clientHeight - (f + d)) + "px " + -cr(s) + "px",
                                        threshold: ar(0, ir(1, c)) || 1
                                    },
                                    v = !0;
                                try {
                                    n = new IntersectionObserver(m, Yt(Yt({}, y), {}, {
                                        root: o.ownerDocument
                                    }))
                                } catch (e) {
                                    n = new IntersectionObserver(m, y)
                                }
                                n.observe(e)
                            }

                            function m(t) {
                                var n = t[0].intersectionRatio;
                                if (n !== c) {
                                    if (!v) return a();
                                    n ? a(!1, n) : r = setTimeout((function() {
                                        a(!1, 1e-7)
                                    }), 1e3)
                                }
                                1 !== n || An(l, e.getBoundingClientRect()) || a(), v = !1
                            }
                        }(!0), i
                    }(v, r) : null,
                    b = -1,
                    w = null;
                s && (w = new ResizeObserver((function(e) {
                    var n = Xt(e, 1)[0];
                    n && n.target === v && w && (w.unobserve(t), cancelAnimationFrame(b), b = requestAnimationFrame((function() {
                        var e;
                        null == (e = w) || e.observe(t)
                    }))), r()
                })), v && !y && w.observe(v), w.observe(t));
                var S = y ? sn(e) : null;
                return y && function t() {
                        var n = sn(e);
                        S && !An(S, n) && r(), S = n, h = requestAnimationFrame(t)
                    }(), r(),
                    function() {
                        var e;
                        m.forEach((function(e) {
                            a && e.removeEventListener("scroll", r), c && e.removeEventListener("resize", r)
                        })), null == g || g(), null == (e = w) || e.disconnect(), w = null, y && cancelAnimationFrame(h)
                    }
            }
            var En = function(e) {
                    return {
                        name: "arrow",
                        options: e,
                        fn: function(t) {
                            return nr(regeneratorRuntime.mark((function r() {
                                var n, o, i, a, u, c, l, s, f, p, d, y, v, m, h, g, b, w, S, A, x, E, O, P, j, R, I, C, k, F, N, T, _, D, M, U;
                                return regeneratorRuntime.wrap((function(r) {
                                    for (;;) switch (r.prev = r.next) {
                                        case 0:
                                            if (i = t.x, a = t.y, u = t.placement, c = t.rects, l = t.platform, s = t.elements, f = t.middlewareData, p = pr(e, t) || {}, d = p.element, y = p.padding, v = void 0 === y ? 0 : y, null != d) {
                                                r.next = 3;
                                                break
                                            }
                                            return r.abrupt("return", {});
                                        case 3:
                                            return m = Pr(v), h = {
                                                x: i,
                                                y: a
                                            }, g = gr(u), b = mr(g), r.next = 9, l.getDimensions(d);
                                        case 9:
                                            return w = r.sent, A = (S = "y" === g) ? "top" : "left", x = S ? "bottom" : "right", E = S ? "clientHeight" : "clientWidth", O = c.reference[b] + c.reference[g] - h[g] - c.floating[b], P = h[g] - c.reference[g], r.next = 18, null == l.getOffsetParent ? void 0 : l.getOffsetParent(d);
                                        case 18:
                                            if (j = r.sent, R = j ? j[E] : 0, r.t0 = R, !r.t0) {
                                                r.next = 25;
                                                break
                                            }
                                            return r.next = 24, null == l.isElement ? void 0 : l.isElement(j);
                                        case 24:
                                            r.t0 = r.sent;
                                        case 25:
                                            if (r.t1 = r.t0, r.t1) {
                                                r.next = 28;
                                                break
                                            }
                                            R = s.floating[E] || c.floating[b];
                                        case 28:
                                            return I = O / 2 - P / 2, C = R / 2 - w[b] / 2 - 1, k = ir(m[A], C), F = ir(m[x], C), N = k, T = R - w[b] - F, _ = R / 2 - w[b] / 2 + I, D = fr(N, _, T), M = !f.arrow && null != yr(u) && _ !== D && c.reference[b] / 2 - (_ < N ? k : F) - w[b] / 2 < 0, U = M ? _ < N ? _ - N : _ - T : 0, r.abrupt("return", (Zt(o = {}, g, h[g] + U), Zt(o, "data", Yt((Zt(n = {}, g, D), Zt(n, "centerOffset", _ - D - U), n), M && {
                                                alignmentOffset: U
                                            })), Zt(o, "reset", M), o));
                                        case 30:
                                        case "end":
                                            return r.stop()
                                    }
                                }), r)
                            })))()
                        }
                    }
                },
                On = function(e, t, r) {
                    var n = new Map,
                        o = Yt({
                            platform: Sn
                        }, r),
                        i = Yt(Yt({}, o.platform), {}, {
                            _c: n
                        });
                    return function() {
                        var e = nr(regeneratorRuntime.mark((function e(t, r, n) {
                            var o, i, a, u, c, l, s, f, p, d, y, v, m, h, g, b, w, S, A, x, E, O, P, j, R, I;
                            return regeneratorRuntime.wrap((function(e) {
                                for (;;) switch (e.prev = e.next) {
                                    case 0:
                                        return o = n.placement, i = void 0 === o ? "bottom" : o, a = n.strategy, u = void 0 === a ? "absolute" : a, c = n.middleware, l = void 0 === c ? [] : c, s = n.platform, f = l.filter(Boolean), e.next = 10, null == s.isRTL ? void 0 : s.isRTL(r);
                                    case 10:
                                        return p = e.sent, e.next = 13, s.getElementRects({
                                            reference: t,
                                            floating: r,
                                            strategy: u
                                        });
                                    case 13:
                                        d = e.sent, y = Rr(d, i, p), v = y.x, m = y.y, h = i, g = {}, b = 0, w = 0;
                                    case 21:
                                        if (!(w < f.length)) {
                                            e.next = 56;
                                            break
                                        }
                                        return A = f[w], x = A.name, E = A.fn, e.next = 27, E({
                                            x: v,
                                            y: m,
                                            initialPlacement: i,
                                            placement: h,
                                            strategy: u,
                                            middlewareData: g,
                                            rects: d,
                                            platform: s,
                                            elements: {
                                                reference: t,
                                                floating: r
                                            }
                                        });
                                    case 27:
                                        if (O = e.sent, P = O.x, j = O.y, R = O.data, I = O.reset, v = null != P ? P : v, m = null != j ? j : m, g = Yt(Yt({}, g), {}, Zt({}, x, Yt(Yt({}, g[x]), R))), e.t0 = I && b <= 50, !e.t0) {
                                            e.next = 53;
                                            break
                                        }
                                        if (b++, e.t1 = "object" == Ht(I), !e.t1) {
                                            e.next = 52;
                                            break
                                        }
                                        if (I.placement && (h = I.placement), e.t2 = I.rects, !e.t2) {
                                            e.next = 51;
                                            break
                                        }
                                        if (!0 !== I.rects) {
                                            e.next = 49;
                                            break
                                        }
                                        return e.next = 46, s.getElementRects({
                                            reference: t,
                                            floating: r,
                                            strategy: u
                                        });
                                    case 46:
                                        e.t3 = e.sent, e.next = 50;
                                        break;
                                    case 49:
                                        e.t3 = I.rects;
                                    case 50:
                                        d = e.t3;
                                    case 51:
                                        S = Rr(d, h, p), v = S.x, m = S.y;
                                    case 52:
                                        w = -1;
                                    case 53:
                                        w++, e.next = 21;
                                        break;
                                    case 56:
                                        return e.abrupt("return", {
                                            x: v,
                                            y: m,
                                            placement: h,
                                            strategy: u,
                                            middlewareData: g
                                        });
                                    case 57:
                                    case "end":
                                        return e.stop()
                                }
                            }), e)
                        })));
                        return function(t, r, n) {
                            return e.apply(this, arguments)
                        }
                    }()(e, t, Yt(Yt({}, o), {}, {
                        platform: i
                    }))
                },
                Pn = "undefined" != typeof document ? n.useLayoutEffect : function() {};

            function jn(e, t) {
                if (e === t) return !0;
                if (Ht(e) != Ht(t)) return !1;
                if ("function" == typeof e && e.toString() === t.toString()) return !0;
                var r, n, o;
                if (e && t && "object" == Ht(e)) {
                    if (Array.isArray(e)) {
                        if ((r = e.length) !== t.length) return !1;
                        for (n = r; 0 != n--;)
                            if (!jn(e[n], t[n])) return !1;
                        return !0
                    }
                    if ((r = (o = Object.keys(e)).length) !== Object.keys(t).length) return !1;
                    for (n = r; 0 != n--;)
                        if (!{}.hasOwnProperty.call(t, o[n])) return !1;
                    for (n = r; 0 != n--;) {
                        var i = o[n];
                        if (!("_owner" === i && e.$$typeof || jn(e[i], t[i]))) return !1
                    }
                    return !0
                }
                return e != e && t != t
            }

            function Rn(e) {
                return "undefined" == typeof window ? 1 : (e.ownerDocument.defaultView || window).devicePixelRatio || 1
            }

            function In(e, t) {
                var r = Rn(e);
                return Math.round(t * r) / r
            }

            function Cn(e) {
                var t = n.useRef(e);
                return Pn((function() {
                    t.current = e
                })), t
            }

            function kn(e) {
                void 0 === e && (e = {});
                var t = e,
                    r = t.placement,
                    o = void 0 === r ? "bottom" : r,
                    a = t.strategy,
                    u = void 0 === a ? "absolute" : a,
                    c = t.middleware,
                    l = void 0 === c ? [] : c,
                    s = t.platform,
                    f = t.elements,
                    p = (f = void 0 === f ? {} : f).reference,
                    d = f.floating,
                    y = t.transform,
                    v = void 0 === y || y,
                    m = t.whileElementsMounted,
                    h = t.open,
                    g = Xt(n.useState({
                        x: 0,
                        y: 0,
                        strategy: u,
                        placement: o,
                        middlewareData: {},
                        isPositioned: !1
                    }), 2),
                    b = g[0],
                    w = g[1],
                    S = Xt(n.useState(l), 2),
                    A = S[0],
                    x = S[1];
                jn(A, l) || x(l);
                var E = Xt(n.useState(null), 2),
                    O = E[0],
                    P = E[1],
                    j = Xt(n.useState(null), 2),
                    R = j[0],
                    I = j[1],
                    C = n.useCallback((function(e) {
                        e !== T.current && (T.current = e, P(e))
                    }), []),
                    k = n.useCallback((function(e) {
                        e !== _.current && (_.current = e, I(e))
                    }), []),
                    F = p || O,
                    N = d || R,
                    T = n.useRef(null),
                    _ = n.useRef(null),
                    D = n.useRef(b),
                    M = null != m,
                    U = Cn(m),
                    B = Cn(s),
                    L = Cn(h),
                    W = n.useCallback((function() {
                        if (T.current && _.current) {
                            var e = {
                                placement: o,
                                strategy: u,
                                middleware: A
                            };
                            B.current && (e.platform = B.current), On(T.current, _.current, e).then((function(e) {
                                var t = Yt(Yt({}, e), {}, {
                                    isPositioned: !1 !== L.current
                                });
                                G.current && !jn(D.current, t) && (D.current = t, i.flushSync((function() {
                                    w(t)
                                })))
                            }))
                        }
                    }), [A, o, u, B, L]);
                Pn((function() {
                    !1 === h && D.current.isPositioned && (D.current.isPositioned = !1, w((function(e) {
                        return Yt(Yt({}, e), {}, {
                            isPositioned: !1
                        })
                    })))
                }), [h]);
                var G = n.useRef(!1);
                Pn((function() {
                    return G.current = !0,
                        function() {
                            G.current = !1
                        }
                }), []), Pn((function() {
                    if (F && (T.current = F), N && (_.current = N), F && N) {
                        if (U.current) return U.current(F, N, W);
                        W()
                    }
                }), [F, N, W, U, M]);
                var z = n.useMemo((function() {
                        return {
                            reference: T,
                            floating: _,
                            setReference: C,
                            setFloating: k
                        }
                    }), [C, k]),
                    V = n.useMemo((function() {
                        return {
                            reference: F,
                            floating: N
                        }
                    }), [F, N]),
                    q = n.useMemo((function() {
                        var e = {
                            position: u,
                            left: 0,
                            top: 0
                        };
                        if (!V.floating) return e;
                        var t = In(V.floating, b.x),
                            r = In(V.floating, b.y);
                        return v ? Yt(Yt({}, e), {}, {
                            transform: "translate(" + t + "px, " + r + "px)"
                        }, Rn(V.floating) >= 1.5 && {
                            willChange: "transform"
                        }) : {
                            position: u,
                            left: t,
                            top: r
                        }
                    }), [u, v, V.floating, b.x, b.y]);
                return n.useMemo((function() {
                    return Yt(Yt({}, b), {}, {
                        update: W,
                        refs: z,
                        elements: V,
                        floatingStyles: q
                    })
                }), [b, W, z, V, q])
            }
            var Fn = function(e, t) {
                    return Yt(Yt({}, function(e) {
                        return void 0 === e && (e = 0), {
                            name: "offset",
                            options: e,
                            fn: function(t) {
                                return nr(regeneratorRuntime.mark((function r() {
                                    var n, o, i, a, u, c, l;
                                    return regeneratorRuntime.wrap((function(r) {
                                        for (;;) switch (r.prev = r.next) {
                                            case 0:
                                                return i = t.x, a = t.y, u = t.placement, c = t.middlewareData, r.next = 6,
                                                    function() {
                                                        var e = nr(regeneratorRuntime.mark((function e(t, r) {
                                                            var n, o, i, a, u, c, l, s, f, p, d, y, v, m;
                                                            return regeneratorRuntime.wrap((function(e) {
                                                                for (;;) switch (e.prev = e.next) {
                                                                    case 0:
                                                                        return n = t.placement, o = t.platform, i = t.elements, e.next = 5, null == o.isRTL ? void 0 : o.isRTL(i.floating);
                                                                    case 5:
                                                                        return a = e.sent, u = dr(n), c = yr(n), l = "y" === hr(n), s = Nr.has(u) ? -1 : 1, f = a && l ? -1 : 1, p = pr(r, t), d = "number" == typeof p ? {
                                                                            mainAxis: p,
                                                                            crossAxis: 0,
                                                                            alignmentAxis: null
                                                                        } : {
                                                                            mainAxis: p.mainAxis || 0,
                                                                            crossAxis: p.crossAxis || 0,
                                                                            alignmentAxis: p.alignmentAxis
                                                                        }, y = d.mainAxis, v = d.crossAxis, m = d.alignmentAxis, e.abrupt("return", (c && "number" == typeof m && (v = "end" === c ? -1 * m : m), l ? {
                                                                            x: v * f,
                                                                            y: y * s
                                                                        } : {
                                                                            x: y * s,
                                                                            y: v * f
                                                                        }));
                                                                    case 14:
                                                                    case "end":
                                                                        return e.stop()
                                                                }
                                                            }), e)
                                                        })));
                                                        return function(t, r) {
                                                            return e.apply(this, arguments)
                                                        }
                                                    }()(t, e);
                                            case 6:
                                                return l = r.sent, r.abrupt("return", u === (null == (n = c.offset) ? void 0 : n.placement) && null != (o = c.arrow) && o.alignmentOffset ? {} : {
                                                    x: i + l.x,
                                                    y: a + l.y,
                                                    data: Yt(Yt({}, l), {}, {
                                                        placement: u
                                                    })
                                                });
                                            case 8:
                                            case "end":
                                                return r.stop()
                                        }
                                    }), r)
                                })))()
                            }
                        }
                    }(e)), {}, {
                        options: [e, t]
                    })
                },
                Nn = function(e, t) {
                    return Yt(Yt({}, function(e) {
                        return void 0 === e && (e = {}), {
                            name: "shift",
                            options: e,
                            fn: function(t) {
                                return nr(regeneratorRuntime.mark((function r() {
                                    var n, o, i, a, u, c, l, s, f, p, d, y, v, m, h, g, b, w, S, A, x, E;
                                    return regeneratorRuntime.wrap((function(r) {
                                        for (;;) switch (r.prev = r.next) {
                                            case 0:
                                                return i = t.x, a = t.y, u = t.placement, c = pr(e, t), l = c.mainAxis, s = void 0 === l || l, f = c.crossAxis, p = void 0 !== f && f, d = c.limiter, y = void 0 === d ? {
                                                    fn: function(e) {
                                                        return {
                                                            x: e.x,
                                                            y: e.y
                                                        }
                                                    }
                                                } : d, v = Jt(c, zt), m = {
                                                    x: i,
                                                    y: a
                                                }, r.next = 14, Ir(t, v);
                                            case 14:
                                                return h = r.sent, g = hr(dr(u)), b = vr(g), w = m[b], S = m[g], s && (A = "y" === b ? "bottom" : "right", w = fr(w + h["y" === b ? "top" : "left"], w, w - h[A])), p && (x = "y" === g ? "bottom" : "right", S = fr(S + h["y" === g ? "top" : "left"], S, S - h[x])), E = y.fn(Yt(Yt({}, t), {}, (Zt(n = {}, b, w), Zt(n, g, S), n))), r.abrupt("return", Yt(Yt({}, E), {}, {
                                                    data: {
                                                        x: E.x - i,
                                                        y: E.y - a,
                                                        enabled: (o = {}, Zt(o, b, s), Zt(o, g, p), o)
                                                    }
                                                }));
                                            case 22:
                                            case "end":
                                                return r.stop()
                                        }
                                    }), r)
                                })))()
                            }
                        }
                    }(e)), {}, {
                        options: [e, t]
                    })
                },
                Tn = function(e, t) {
                    return Yt(Yt({}, function(e) {
                        return void 0 === e && (e = {}), {
                            options: e,
                            fn: function(t) {
                                var r, n = t.x,
                                    o = t.y,
                                    i = t.placement,
                                    a = t.rects,
                                    u = t.middlewareData,
                                    c = pr(e, t),
                                    l = c.offset,
                                    s = void 0 === l ? 0 : l,
                                    f = c.mainAxis,
                                    p = void 0 === f || f,
                                    d = c.crossAxis,
                                    y = void 0 === d || d,
                                    v = {
                                        x: n,
                                        y: o
                                    },
                                    m = hr(i),
                                    h = vr(m),
                                    g = v[h],
                                    b = v[m],
                                    w = pr(s, t),
                                    S = "number" == typeof w ? {
                                        mainAxis: w,
                                        crossAxis: 0
                                    } : Yt({
                                        mainAxis: 0,
                                        crossAxis: 0
                                    }, w);
                                if (p) {
                                    var A = "y" === h ? "height" : "width",
                                        x = a.reference[h] - a.floating[A] + S.mainAxis,
                                        E = a.reference[h] + a.reference[A] - S.mainAxis;
                                    g < x ? g = x : g > E && (g = E)
                                }
                                if (y) {
                                    var O, P, j = "y" === h ? "width" : "height",
                                        R = Nr.has(dr(i)),
                                        I = a.reference[m] - a.floating[j] + (R && (null == (O = u.offset) ? void 0 : O[m]) || 0) + (R ? 0 : S.crossAxis),
                                        C = a.reference[m] + a.reference[j] + (R ? 0 : (null == (P = u.offset) ? void 0 : P[m]) || 0) - (R ? S.crossAxis : 0);
                                    b < I ? b = I : b > C && (b = C)
                                }
                                return Zt(r = {}, h, g), Zt(r, m, b), r
                            }
                        }
                    }(e)), {}, {
                        options: [e, t]
                    })
                },
                _n = function(e, t) {
                    return Yt(Yt({}, function(e) {
                        return void 0 === e && (e = {}), {
                            name: "flip",
                            options: e,
                            fn: function(t) {
                                return nr(regeneratorRuntime.mark((function r() {
                                    var n, o, i, a, u, c, l, s, f, p, d, y, v, m, h, g, b, w, S, A, x, E, O, P, j, R, I, C, k, F, N, T, _, D, M, U, B, L, W;
                                    return regeneratorRuntime.wrap((function(r) {
                                        for (;;) switch (r.prev = r.next) {
                                            case 0:
                                                if (i = t.placement, a = t.middlewareData, u = t.rects, c = t.initialPlacement, l = t.platform, s = t.elements, f = pr(e, t), p = f.mainAxis, d = void 0 === p || p, y = f.crossAxis, v = void 0 === y || y, m = f.fallbackPlacements, h = f.fallbackStrategy, g = void 0 === h ? "bestFit" : h, b = f.fallbackAxisSideDirection, w = void 0 === b ? "none" : b, S = f.flipAlignment, A = void 0 === S || S, x = Jt(f, Vt), null == (n = a.arrow) || !n.alignmentOffset) {
                                                    r.next = 3;
                                                    break
                                                }
                                                return r.abrupt("return", {});
                                            case 3:
                                                return E = dr(i), O = hr(c), P = dr(c) === c, r.next = 8, null == l.isRTL ? void 0 : l.isRTL(s.floating);
                                            case 8:
                                                return j = r.sent, R = m || (P || !A ? [Or(c)] : function(e) {
                                                    var t = Or(e);
                                                    return [br(e), t, br(t)]
                                                }(c)), I = "none" !== w, !m && I && R.push.apply(R, Qt(Er(c, A, w, j))), C = [c].concat(Qt(R)), r.next = 15, Ir(t, x);
                                            case 15:
                                                if (k = r.sent, F = [], N = (null == (o = a.flip) ? void 0 : o.overflows) || [], d && F.push(k[E]), v && (T = function(e, t, r) {
                                                        void 0 === r && (r = !1);
                                                        var n = yr(e),
                                                            o = gr(e),
                                                            i = mr(o),
                                                            a = "x" === o ? n === (r ? "end" : "start") ? "right" : "left" : "start" === n ? "bottom" : "top";
                                                        return t.reference[i] > t.floating[i] && (a = Or(a)), [a, Or(a)]
                                                    }(i, u, j), F.push(k[T[0]], k[T[1]])), N = [].concat(Qt(N), [{
                                                        placement: i,
                                                        overflows: F
                                                    }]), F.every((function(e) {
                                                        return e <= 0
                                                    }))) {
                                                    r.next = 35;
                                                    break
                                                }
                                                if (M = ((null == (_ = a.flip) ? void 0 : _.index) || 0) + 1, !(U = C[M])) {
                                                    r.next = 24;
                                                    break
                                                }
                                                if ("alignment" === v && O !== hr(U) && !N.every((function(e) {
                                                        return hr(e.placement) !== O || e.overflows[0] > 0
                                                    }))) {
                                                    r.next = 24;
                                                    break
                                                }
                                                return r.abrupt("return", {
                                                    data: {
                                                        index: M,
                                                        overflows: N
                                                    },
                                                    reset: {
                                                        placement: U
                                                    }
                                                });
                                            case 24:
                                                if (B = null == (D = N.filter((function(e) {
                                                        return e.overflows[0] <= 0
                                                    })).sort((function(e, t) {
                                                        return e.overflows[1] - t.overflows[1]
                                                    }))[0]) ? void 0 : D.placement, B) {
                                                    r.next = 33;
                                                    break
                                                }
                                                r.t0 = g, r.next = "bestFit" === r.t0 ? 29 : "initialPlacement" === r.t0 ? 32 : 33;
                                                break;
                                            case 29:
                                                return W = null == (L = N.filter((function(e) {
                                                    if (I) {
                                                        var t = hr(e.placement);
                                                        return t === O || "y" === t
                                                    }
                                                    return !0
                                                })).map((function(e) {
                                                    return [e.placement, e.overflows.filter((function(e) {
                                                        return e > 0
                                                    })).reduce((function(e, t) {
                                                        return e + t
                                                    }), 0)]
                                                })).sort((function(e, t) {
                                                    return e[1] - t[1]
                                                }))[0]) ? void 0 : L[0], W && (B = W), r.abrupt("break", 33);
                                            case 32:
                                                B = c;
                                            case 33:
                                                if (i === B) {
                                                    r.next = 35;
                                                    break
                                                }
                                                return r.abrupt("return", {
                                                    reset: {
                                                        placement: B
                                                    }
                                                });
                                            case 35:
                                                return r.abrupt("return", {});
                                            case 36:
                                            case "end":
                                                return r.stop()
                                        }
                                    }), r)
                                })))()
                            }
                        }
                    }(e)), {}, {
                        options: [e, t]
                    })
                },
                Dn = function(e, t) {
                    return Yt(Yt({}, function(e) {
                        return void 0 === e && (e = {}), {
                            name: "size",
                            options: e,
                            fn: function(t) {
                                return nr(regeneratorRuntime.mark((function r() {
                                    var n, o, i, a, u, c, l, s, f, p, d, y, v, m, h, g, b, w, S, A, x, E, O, P, j, R, I, C, k, F, N;
                                    return regeneratorRuntime.wrap((function(r) {
                                        for (;;) switch (r.prev = r.next) {
                                            case 0:
                                                return i = t.placement, a = t.rects, u = t.platform, c = t.elements, l = pr(e, t), s = l.apply, f = void 0 === s ? function() {} : s, p = Jt(l, qt), r.next = 10, Ir(t, p);
                                            case 10:
                                                if (d = r.sent, y = dr(i), v = yr(i), m = "y" === hr(i), h = a.floating, g = h.width, b = h.height, "top" !== y && "bottom" !== y) {
                                                    r.next = 36;
                                                    break
                                                }
                                                return w = y, r.t0 = v, r.next = 22, null == u.isRTL ? void 0 : u.isRTL(c.floating);
                                            case 22:
                                                if (!r.sent) {
                                                    r.next = 26;
                                                    break
                                                }
                                                r.t1 = "start", r.next = 27;
                                                break;
                                            case 26:
                                                r.t1 = "end";
                                            case 27:
                                                if (r.t2 = r.t1, r.t0 !== r.t2) {
                                                    r.next = 32;
                                                    break
                                                }
                                                r.t3 = "left", r.next = 33;
                                                break;
                                            case 32:
                                                r.t3 = "right";
                                            case 33:
                                                S = r.t3, r.next = 37;
                                                break;
                                            case 36:
                                                S = y, w = "end" === v ? "top" : "bottom";
                                            case 37:
                                                return A = b - d.top - d.bottom, x = g - d.left - d.right, E = ir(b - d[w], A), O = ir(g - d[S], x), P = !t.middlewareData.shift, j = E, R = O, null != (n = t.middlewareData.shift) && n.enabled.x && (R = x), null != (o = t.middlewareData.shift) && o.enabled.y && (j = A), P && !v && (I = ar(d.left, 0), C = ar(d.right, 0), k = ar(d.top, 0), F = ar(d.bottom, 0), m ? R = g - 2 * (0 !== I || 0 !== C ? I + C : ar(d.left, d.right)) : j = b - 2 * (0 !== k || 0 !== F ? k + F : ar(d.top, d.bottom))), r.next = 42, f(Yt(Yt({}, t), {}, {
                                                    availableWidth: R,
                                                    availableHeight: j
                                                }));
                                            case 42:
                                                return r.next = 44, u.getDimensions(c.floating);
                                            case 44:
                                                return N = r.sent, r.abrupt("return", g !== N.width || b !== N.height ? {
                                                    reset: {
                                                        rects: !0
                                                    }
                                                } : {});
                                            case 46:
                                            case "end":
                                                return r.stop()
                                        }
                                    }), r)
                                })))()
                            }
                        }
                    }(e)), {}, {
                        options: [e, t]
                    })
                },
                Mn = function(e, t) {
                    return Yt(Yt({}, function(e) {
                        return void 0 === e && (e = {}), {
                            name: "hide",
                            options: e,
                            fn: function(t) {
                                return nr(regeneratorRuntime.mark((function r() {
                                    var n, o, i, a, u, c, l;
                                    return regeneratorRuntime.wrap((function(r) {
                                        for (;;) switch (r.prev = r.next) {
                                            case 0:
                                                n = t.rects, o = pr(e, t), i = o.strategy, a = void 0 === i ? "referenceHidden" : i, u = Jt(o, $t), r.t0 = a, r.next = "referenceHidden" === r.t0 ? 4 : "escaped" === r.t0 ? 11 : 18;
                                                break;
                                            case 4:
                                                return r.t1 = kr, r.next = 7, Ir(t, Yt(Yt({}, u), {}, {
                                                    elementContext: "reference"
                                                }));
                                            case 7:
                                                return r.t2 = r.sent, r.t3 = n.reference, c = (0, r.t1)(r.t2, r.t3), r.abrupt("return", {
                                                    data: {
                                                        referenceHiddenOffsets: c,
                                                        referenceHidden: Fr(c)
                                                    }
                                                });
                                            case 11:
                                                return r.t4 = kr, r.next = 14, Ir(t, Yt(Yt({}, u), {}, {
                                                    altBoundary: !0
                                                }));
                                            case 14:
                                                return r.t5 = r.sent, r.t6 = n.floating, l = (0, r.t4)(r.t5, r.t6), r.abrupt("return", {
                                                    data: {
                                                        escapedOffsets: l,
                                                        escaped: Fr(l)
                                                    }
                                                });
                                            case 18:
                                                return r.abrupt("return", {});
                                            case 19:
                                            case "end":
                                                return r.stop()
                                        }
                                    }), r)
                                })))()
                            }
                        }
                    }(e)), {}, {
                        options: [e, t]
                    })
                },
                Un = function(e, t) {
                    return Yt(Yt({}, function(e) {
                        return {
                            name: "arrow",
                            options: e,
                            fn: function(t) {
                                var r, n = "function" == typeof e ? e(t) : e,
                                    o = n.element,
                                    i = n.padding;
                                return o && (r = o, {}.hasOwnProperty.call(r, "current")) ? null != o.current ? En({
                                    element: o.current,
                                    padding: i
                                }).fn(t) : {} : o ? En({
                                    element: o,
                                    padding: i
                                }).fn(t) : {}
                            }
                        }
                    }(e)), {}, {
                        options: [e, t]
                    })
                },
                Bn = ["children"],
                Ln = ["children"],
                Wn = ["asChild"],
                Gn = ["children", "width", "height"],
                zn = ["children"],
                Vn = ["children"],
                qn = ["asChild"],
                $n = ["scope", "children"],
                Hn = ["__scopePopper", "virtualRef"],
                Jn = ["__scopePopper", "side", "sideOffset", "align", "alignOffset", "arrowPadding", "avoidCollisions", "collisionBoundary", "collisionPadding", "sticky", "hideWhenDetached", "updatePositionStrategy", "onPlaced"],
                Xn = ["__scopePopper"];

            function Kn(e) {
                return function(e) {
                    if (Array.isArray(e)) return Qn(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && Symbol.iterator in Object(e)) return Array.from(e)
                }(e) || Zn(e) || function() {
                    throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function Yn(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var r = [],
                        n = !0,
                        o = !1,
                        i = void 0;
                    try {
                        for (var a, u = e[Symbol.iterator](); !(n = (a = u.next()).done) && (r.push(a.value), !t || r.length !== t); n = !0);
                    } catch (e) {
                        o = !0, i = e
                    } finally {
                        try {
                            n || null == u.return || u.return()
                        } finally {
                            if (o) throw i
                        }
                    }
                    return r
                }(e, t) || Zn(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function Zn(e, t) {
                if (e) {
                    if ("string" == typeof e) return Qn(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    return "Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r ? Array.from(e) : "Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r) ? Qn(e, t) : void 0
                }
            }

            function Qn(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = new Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function eo(e, t) {
                var r = Object.keys(e);
                if (Object.getOwnPropertySymbols) {
                    var n = Object.getOwnPropertySymbols(e);
                    t && (n = n.filter((function(t) {
                        return Object.getOwnPropertyDescriptor(e, t).enumerable
                    }))), r.push.apply(r, n)
                }
                return r
            }

            function to(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {};
                    t % 2 ? eo(Object(r), !0).forEach((function(t) {
                        ro(e, t, r[t])
                    })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(r)) : eo(Object(r)).forEach((function(t) {
                        Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(r, t))
                    }))
                }
                return e
            }

            function ro(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function no(e, t) {
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
                    for (n = 0; n < i.length; n++) r = i[n], t.indexOf(r) >= 0 || Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r])
                }
                return o
            }

            function oo(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }
            var io = Symbol("radix.slottable");

            function ao(e) {
                return n.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === io
            }
            var uo = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((function(e, t) {
                    var r = function(e) {
                            var t = function(e) {
                                    var t = n.forwardRef((function(e, t) {
                                        var r = e.children,
                                            o = no(e, Bn);
                                        if (n.isValidElement(r)) {
                                            var i = function(e) {
                                                    var t, r, n = null === (t = Object.getOwnPropertyDescriptor(e.props, "ref")) || void 0 === t ? void 0 : t.get,
                                                        o = n && "isReactWarning" in n && n.isReactWarning;
                                                    return o ? e.ref : (o = (n = null === (r = Object.getOwnPropertyDescriptor(e, "ref")) || void 0 === r ? void 0 : r.get) && "isReactWarning" in n && n.isReactWarning) ? e.props.ref : e.props.ref || e.ref
                                                }(r),
                                                a = function(e, t) {
                                                    var r = to({}, t),
                                                        n = function(n) {
                                                            var o = e[n],
                                                                i = t[n];
                                                            /^on[A-Z]/.test(n) ? o && i ? r[n] = function() {
                                                                i.apply(void 0, arguments), o.apply(void 0, arguments)
                                                            } : o && (r[n] = o) : "style" === n ? r[n] = to(to({}, o), i) : "className" === n && (r[n] = [o, i].filter(Boolean).join(" "))
                                                        };
                                                    for (var o in t) n(o);
                                                    return to(to({}, e), r)
                                                }(o, r.props);
                                            return r.type !== n.Fragment && (a.ref = t ? function() {
                                                for (var e = arguments.length, t = new Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                                return function(e) {
                                                    var r = !1,
                                                        n = t.map((function(t) {
                                                            var n = oo(t, e);
                                                            return r || "function" != typeof n || (r = !0), n
                                                        }));
                                                    if (r) return function() {
                                                        for (var e = 0; e < n.length; e++) {
                                                            var r = n[e];
                                                            "function" == typeof r ? r() : oo(t[e], null)
                                                        }
                                                    }
                                                }
                                            }(t, i) : i), n.cloneElement(r, a)
                                        }
                                        return n.Children.count(r) > 1 ? n.Children.only(null) : null
                                    }));
                                    return t.displayName = "".concat(e, ".SlotClone"), t
                                }(e),
                                r = n.forwardRef((function(e, r) {
                                    var o = e.children,
                                        i = no(e, Ln),
                                        a = n.Children.toArray(o),
                                        u = a.find(ao);
                                    if (u) {
                                        var c = u.props.children,
                                            l = a.map((function(e) {
                                                return e === u ? n.Children.count(c) > 1 ? n.Children.only(null) : n.isValidElement(c) ? c.props.children : null : e
                                            }));
                                        return (0, L.jsx)(t, to(to({}, i), {}, {
                                            ref: r,
                                            children: n.isValidElement(c) ? n.cloneElement(c, void 0, l) : null
                                        }))
                                    }
                                    return (0, L.jsx)(t, to(to({}, i), {}, {
                                        ref: r,
                                        children: o
                                    }))
                                }));
                            return r.displayName = "".concat(e, ".Slot"), r
                        }("Primitive.".concat(t)),
                        o = n.forwardRef((function(e, n) {
                            var o = e.asChild,
                                i = no(e, Wn),
                                a = o ? r : t;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, L.jsx)(a, to(to({}, i), {}, {
                                ref: n
                            }))
                        }));
                    return o.displayName = "Primitive.".concat(t), to(to({}, e), {}, ro({}, t, o))
                }), {}),
                co = n.forwardRef((function(e, t) {
                    var r = e.children,
                        n = e.width,
                        o = void 0 === n ? 10 : n,
                        i = e.height,
                        a = void 0 === i ? 5 : i,
                        u = no(e, Gn);
                    return (0, L.jsx)(uo.svg, to(to({}, u), {}, {
                        ref: t,
                        width: o,
                        height: a,
                        viewBox: "0 0 30 10",
                        preserveAspectRatio: "none",
                        children: e.asChild ? r : (0, L.jsx)("polygon", {
                            points: "0,0 30,0 15,10"
                        })
                    }))
                }));
            co.displayName = "Arrow";
            var lo = co;

            function so(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function fo() {
                for (var e = arguments.length, t = new Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return function(e) {
                    var r = !1,
                        n = t.map((function(t) {
                            var n = so(t, e);
                            return r || "function" != typeof n || (r = !0), n
                        }));
                    if (r) return function() {
                        for (var e = 0; e < n.length; e++) {
                            var r = n[e];
                            "function" == typeof r ? r() : so(t[e], null)
                        }
                    }
                }
            }

            function po() {
                for (var e = arguments.length, t = new Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return n.useCallback(fo.apply(void 0, t), t)
            }

            function yo() {
                for (var e = arguments.length, t = new Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                var o = t[0];
                if (1 === t.length) return o;
                var i = function() {
                    var e = t.map((function(e) {
                        return {
                            useScope: e(),
                            scopeName: e.scopeName
                        }
                    }));
                    return function(t) {
                        var r = e.reduce((function(e, r) {
                            var n = r.useScope,
                                o = r.scopeName;
                            return to(to({}, e), n(t)["__scope".concat(o)])
                        }), {});
                        return n.useMemo((function() {
                            return ro({}, "__scope".concat(o.scopeName), r)
                        }), [r])
                    }
                };
                return i.scopeName = o.scopeName, i
            }
            var vo = Symbol("radix.slottable");

            function mo(e) {
                return n.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === vo
            }
            var ho = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((function(e, t) {
                    var r = function(e) {
                            var t = function(e) {
                                    var t = n.forwardRef((function(e, t) {
                                        var r = e.children,
                                            o = no(e, zn);
                                        if (n.isValidElement(r)) {
                                            var i = function(e) {
                                                    var t, r, n = null === (t = Object.getOwnPropertyDescriptor(e.props, "ref")) || void 0 === t ? void 0 : t.get,
                                                        o = n && "isReactWarning" in n && n.isReactWarning;
                                                    return o ? e.ref : (o = (n = null === (r = Object.getOwnPropertyDescriptor(e, "ref")) || void 0 === r ? void 0 : r.get) && "isReactWarning" in n && n.isReactWarning) ? e.props.ref : e.props.ref || e.ref
                                                }(r),
                                                a = function(e, t) {
                                                    var r = to({}, t),
                                                        n = function(n) {
                                                            var o = e[n],
                                                                i = t[n];
                                                            /^on[A-Z]/.test(n) ? o && i ? r[n] = function() {
                                                                i.apply(void 0, arguments), o.apply(void 0, arguments)
                                                            } : o && (r[n] = o) : "style" === n ? r[n] = to(to({}, o), i) : "className" === n && (r[n] = [o, i].filter(Boolean).join(" "))
                                                        };
                                                    for (var o in t) n(o);
                                                    return to(to({}, e), r)
                                                }(o, r.props);
                                            return r.type !== n.Fragment && (a.ref = t ? fo(t, i) : i), n.cloneElement(r, a)
                                        }
                                        return n.Children.count(r) > 1 ? n.Children.only(null) : null
                                    }));
                                    return t.displayName = "".concat(e, ".SlotClone"), t
                                }(e),
                                r = n.forwardRef((function(e, r) {
                                    var o = e.children,
                                        i = no(e, Vn),
                                        a = n.Children.toArray(o),
                                        u = a.find(mo);
                                    if (u) {
                                        var c = u.props.children,
                                            l = a.map((function(e) {
                                                return e === u ? n.Children.count(c) > 1 ? n.Children.only(null) : n.isValidElement(c) ? c.props.children : null : e
                                            }));
                                        return (0, L.jsx)(t, to(to({}, i), {}, {
                                            ref: r,
                                            children: n.isValidElement(c) ? n.cloneElement(c, void 0, l) : null
                                        }))
                                    }
                                    return (0, L.jsx)(t, to(to({}, i), {}, {
                                        ref: r,
                                        children: o
                                    }))
                                }));
                            return r.displayName = "".concat(e, ".Slot"), r
                        }("Primitive.".concat(t)),
                        o = n.forwardRef((function(e, n) {
                            var o = e.asChild,
                                i = no(e, qn),
                                a = o ? r : t;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, L.jsx)(a, to(to({}, i), {}, {
                                ref: n
                            }))
                        }));
                    return o.displayName = "Primitive.".concat(t), to(to({}, e), {}, ro({}, t, o))
                }), {}),
                go = null !== globalThis && void 0 !== globalThis && globalThis.document ? n.useLayoutEffect : function() {},
                bo = "Popper",
                wo = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        r = [],
                        o = function() {
                            var t = r.map((function(e) {
                                return n.createContext(e)
                            }));
                            return function(r) {
                                var o = (null == r ? void 0 : r[e]) || t;
                                return n.useMemo((function() {
                                    return ro({}, "__scope".concat(e), to(to({}, r), {}, ro({}, e, o)))
                                }), [r, o])
                            }
                        };
                    return o.scopeName = e, [function(t, o) {
                        var i = n.createContext(o),
                            a = r.length;
                        r = [].concat(Kn(r), [o]);
                        var u = function(t) {
                            var r, o = t.scope,
                                u = t.children,
                                c = no(t, $n),
                                l = (null == o || null === (r = o[e]) || void 0 === r ? void 0 : r[a]) || i,
                                s = n.useMemo((function() {
                                    return c
                                }), Object.values(c));
                            return (0, L.jsx)(l.Provider, {
                                value: s,
                                children: u
                            })
                        };
                        return u.displayName = t + "Provider", [u, function(r, u) {
                            var c, l = (null == u || null === (c = u[e]) || void 0 === c ? void 0 : c[a]) || i,
                                s = n.useContext(l);
                            if (s) return s;
                            if (void 0 !== o) return o;
                            throw new Error("`".concat(r, "` must be used within `").concat(t, "`"))
                        }]
                    }, yo.apply(void 0, [o].concat(Kn(t)))]
                }(bo),
                So = Yn(wo, 2),
                Ao = So[0],
                xo = So[1],
                Eo = Yn(Ao(bo), 2),
                Oo = Eo[0],
                Po = Eo[1],
                jo = function(e) {
                    var t = e.__scopePopper,
                        r = e.children,
                        o = Yn(n.useState(null), 2),
                        i = o[0],
                        a = o[1];
                    return (0, L.jsx)(Oo, {
                        scope: t,
                        anchor: i,
                        onAnchorChange: a,
                        children: r
                    })
                };
            jo.displayName = bo;
            var Ro = "PopperAnchor",
                Io = n.forwardRef((function(e, t) {
                    var r = e.__scopePopper,
                        o = e.virtualRef,
                        i = no(e, Hn),
                        a = Po(Ro, r),
                        u = n.useRef(null),
                        c = po(t, u);
                    return n.useEffect((function() {
                        a.onAnchorChange((null == o ? void 0 : o.current) || u.current)
                    })), o ? null : (0, L.jsx)(ho.div, to(to({}, i), {}, {
                        ref: c
                    }))
                }));
            Io.displayName = Ro;
            var Co = "PopperContent",
                ko = Yn(Ao(Co), 2),
                Fo = ko[0],
                No = ko[1],
                To = n.forwardRef((function(e, t) {
                    var r, o, i, a, u, c, l, s, f = e.__scopePopper,
                        p = e.side,
                        d = void 0 === p ? "bottom" : p,
                        y = e.sideOffset,
                        v = void 0 === y ? 0 : y,
                        m = e.align,
                        h = void 0 === m ? "center" : m,
                        g = e.alignOffset,
                        b = void 0 === g ? 0 : g,
                        w = e.arrowPadding,
                        S = void 0 === w ? 0 : w,
                        A = e.avoidCollisions,
                        x = void 0 === A || A,
                        E = e.collisionBoundary,
                        O = void 0 === E ? [] : E,
                        P = e.collisionPadding,
                        j = void 0 === P ? 0 : P,
                        R = e.sticky,
                        I = void 0 === R ? "partial" : R,
                        C = e.hideWhenDetached,
                        k = void 0 !== C && C,
                        F = e.updatePositionStrategy,
                        N = void 0 === F ? "optimized" : F,
                        T = e.onPlaced,
                        _ = no(e, Jn),
                        D = Po(Co, f),
                        M = Yn(n.useState(null), 2),
                        U = M[0],
                        B = M[1],
                        W = po(t, (function(e) {
                            return B(e)
                        })),
                        G = Yn(n.useState(null), 2),
                        z = G[0],
                        V = G[1],
                        q = function(e) {
                            var t = Yn(n.useState(void 0), 2),
                                r = t[0],
                                o = t[1];
                            return go((function() {
                                if (e) {
                                    o({
                                        width: e.offsetWidth,
                                        height: e.offsetHeight
                                    });
                                    var t = new ResizeObserver((function(t) {
                                        if (Array.isArray(t) && t.length) {
                                            var r, n, i = t[0];
                                            if ("borderBoxSize" in i) {
                                                var a = i.borderBoxSize,
                                                    u = Array.isArray(a) ? a[0] : a;
                                                r = u.inlineSize, n = u.blockSize
                                            } else r = e.offsetWidth, n = e.offsetHeight;
                                            o({
                                                width: r,
                                                height: n
                                            })
                                        }
                                    }));
                                    return t.observe(e, {
                                            box: "border-box"
                                        }),
                                        function() {
                                            return t.unobserve(e)
                                        }
                                }
                                o(void 0)
                            }), [e]), r
                        }(z),
                        $ = null !== (r = null == q ? void 0 : q.width) && void 0 !== r ? r : 0,
                        H = null !== (o = null == q ? void 0 : q.height) && void 0 !== o ? o : 0,
                        J = d + ("center" !== h ? "-" + h : ""),
                        X = "number" == typeof j ? j : to({
                            top: 0,
                            right: 0,
                            bottom: 0,
                            left: 0
                        }, j),
                        K = Array.isArray(O) ? O : [O],
                        Y = K.length > 0,
                        Z = {
                            padding: X,
                            boundary: K.filter(Uo),
                            altBoundary: Y
                        },
                        Q = kn({
                            strategy: "fixed",
                            placement: J,
                            whileElementsMounted: function() {
                                for (var e = arguments.length, t = new Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                return xn.apply(void 0, t.concat([{
                                    animationFrame: "always" === N
                                }]))
                            },
                            elements: {
                                reference: D.anchor
                            },
                            middleware: [Fn({
                                mainAxis: v + H,
                                alignmentAxis: b
                            }), x && Nn(to({
                                mainAxis: !0,
                                crossAxis: !1,
                                limiter: "partial" === I ? Tn() : void 0
                            }, Z)), x && _n(to({}, Z)), Dn(to(to({}, Z), {}, {
                                apply: function(e) {
                                    var t = e.elements,
                                        r = e.rects,
                                        n = e.availableWidth,
                                        o = e.availableHeight,
                                        i = r.reference,
                                        a = i.width,
                                        u = i.height,
                                        c = t.floating.style;
                                    c.setProperty("--radix-popper-available-width", "".concat(n, "px")), c.setProperty("--radix-popper-available-height", "".concat(o, "px")), c.setProperty("--radix-popper-anchor-width", "".concat(a, "px")), c.setProperty("--radix-popper-anchor-height", "".concat(u, "px"))
                                }
                            })), z && Un({
                                element: z,
                                padding: S
                            }), Bo({
                                arrowWidth: $,
                                arrowHeight: H
                            }), k && Mn(to({
                                strategy: "referenceHidden"
                            }, Z))]
                        }),
                        ee = Q.refs,
                        te = Q.floatingStyles,
                        re = Q.placement,
                        ne = Q.isPositioned,
                        oe = Q.middlewareData,
                        ie = Yn(Lo(re), 2),
                        ae = ie[0],
                        ue = ie[1],
                        ce = function(e) {
                            var t = n.useRef(e);
                            return n.useEffect((function() {
                                t.current = e
                            })), n.useMemo((function() {
                                return function() {
                                    for (var e, r = arguments.length, n = new Array(r), o = 0; o < r; o++) n[o] = arguments[o];
                                    return null === (e = t.current) || void 0 === e ? void 0 : e.call.apply(e, [t].concat(n))
                                }
                            }), [])
                        }(T);
                    go((function() {
                        ne && (null == ce || ce())
                    }), [ne, ce]);
                    var le = null === (i = oe.arrow) || void 0 === i ? void 0 : i.x,
                        se = null === (a = oe.arrow) || void 0 === a ? void 0 : a.y,
                        fe = 0 !== (null === (u = oe.arrow) || void 0 === u ? void 0 : u.centerOffset),
                        pe = Yn(n.useState(), 2),
                        de = pe[0],
                        ye = pe[1];
                    return go((function() {
                        U && ye(window.getComputedStyle(U).zIndex)
                    }), [U]), (0, L.jsx)("div", {
                        ref: ee.setFloating,
                        "data-radix-popper-content-wrapper": "",
                        style: to(to({}, te), {}, {
                            transform: ne ? te.transform : "translate(0, -200%)",
                            minWidth: "max-content",
                            zIndex: de,
                            "--radix-popper-transform-origin": [null === (c = oe.transformOrigin) || void 0 === c ? void 0 : c.x, null === (l = oe.transformOrigin) || void 0 === l ? void 0 : l.y].join(" ")
                        }, (null === (s = oe.hide) || void 0 === s ? void 0 : s.referenceHidden) && {
                            visibility: "hidden",
                            pointerEvents: "none"
                        }),
                        dir: e.dir,
                        children: (0, L.jsx)(Fo, {
                            scope: f,
                            placedSide: ae,
                            onArrowChange: V,
                            arrowX: le,
                            arrowY: se,
                            shouldHideArrow: fe,
                            children: (0, L.jsx)(ho.div, to(to({
                                "data-side": ae,
                                "data-align": ue
                            }, _), {}, {
                                ref: W,
                                style: to(to({}, _.style), {}, {
                                    animation: ne ? void 0 : "none"
                                })
                            }))
                        })
                    })
                }));
            To.displayName = Co;
            var _o = "PopperArrow",
                Do = {
                    top: "bottom",
                    right: "left",
                    bottom: "top",
                    left: "right"
                },
                Mo = n.forwardRef((function(e, t) {
                    var r, n = e.__scopePopper,
                        o = no(e, Xn),
                        i = No(_o, n),
                        a = Do[i.placedSide];
                    return (0, L.jsx)("span", {
                        ref: i.onArrowChange,
                        style: (r = {
                            position: "absolute",
                            left: i.arrowX,
                            top: i.arrowY
                        }, ro(r, a, 0), ro(r, "transformOrigin", {
                            top: "",
                            right: "0 0",
                            bottom: "center 0",
                            left: "100% 0"
                        } [i.placedSide]), ro(r, "transform", {
                            top: "translateY(100%)",
                            right: "translateY(50%) rotate(90deg) translateX(-50%)",
                            bottom: "rotate(180deg)",
                            left: "translateY(50%) rotate(-90deg) translateX(50%)"
                        } [i.placedSide]), ro(r, "visibility", i.shouldHideArrow ? "hidden" : void 0), r),
                        children: (0, L.jsx)(lo, to(to({}, o), {}, {
                            ref: t,
                            style: to(to({}, o.style), {}, {
                                display: "block"
                            })
                        }))
                    })
                }));

            function Uo(e) {
                return null !== e
            }
            Mo.displayName = _o;
            var Bo = function(e) {
                return {
                    name: "transformOrigin",
                    options: e,
                    fn: function(t) {
                        var r, n, o, i, a, u = t.placement,
                            c = t.rects,
                            l = t.middlewareData,
                            s = 0 !== (null === (r = l.arrow) || void 0 === r ? void 0 : r.centerOffset),
                            f = s ? 0 : e.arrowWidth,
                            p = s ? 0 : e.arrowHeight,
                            d = Yn(Lo(u), 2),
                            y = d[0],
                            v = {
                                start: "0%",
                                center: "50%",
                                end: "100%"
                            } [d[1]],
                            m = (null !== (n = null === (o = l.arrow) || void 0 === o ? void 0 : o.x) && void 0 !== n ? n : 0) + f / 2,
                            h = (null !== (i = null === (a = l.arrow) || void 0 === a ? void 0 : a.y) && void 0 !== i ? i : 0) + p / 2,
                            g = "",
                            b = "";
                        return "bottom" === y ? (g = s ? v : "".concat(m, "px"), b = -p + "px") : "top" === y ? (g = s ? v : "".concat(m, "px"), b = "".concat(c.floating.height + p, "px")) : "right" === y ? (g = -p + "px", b = s ? v : "".concat(h, "px")) : "left" === y && (g = "".concat(c.floating.width + p, "px"), b = s ? v : "".concat(h, "px")), {
                            data: {
                                x: g,
                                y: b
                            }
                        }
                    }
                }
            };

            function Lo(e) {
                var t = Yn(e.split("-"), 2),
                    r = t[0],
                    n = t[1];
                return [r, void 0 === n ? "center" : n]
            }
            var Wo = jo,
                Go = Io,
                zo = To,
                Vo = Mo,
                qo = ["children"],
                $o = ["children"],
                Ho = ["asChild"],
                Jo = ["scope", "children"],
                Xo = ["__scopePopover"],
                Ko = ["__scopePopover"],
                Yo = ["forceMount"],
                Zo = ["__scopePopover", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus", "disableOutsidePointerEvents", "onEscapeKeyDown", "onPointerDownOutside", "onFocusOutside", "onInteractOutside"],
                Qo = ["__scopePopover"],
                ei = ["__scopePopover"];

            function ti(e) {
                return function(e) {
                    if (Array.isArray(e)) return ii(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && Symbol.iterator in Object(e)) return Array.from(e)
                }(e) || oi(e) || function() {
                    throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function ri(e, t) {
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
                    for (n = 0; n < i.length; n++) r = i[n], t.indexOf(r) >= 0 || Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r])
                }
                return o
            }

            function ni(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var r = [],
                        n = !0,
                        o = !1,
                        i = void 0;
                    try {
                        for (var a, u = e[Symbol.iterator](); !(n = (a = u.next()).done) && (r.push(a.value), !t || r.length !== t); n = !0);
                    } catch (e) {
                        o = !0, i = e
                    } finally {
                        try {
                            n || null == u.return || u.return()
                        } finally {
                            if (o) throw i
                        }
                    }
                    return r
                }(e, t) || oi(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function oi(e, t) {
                if (e) {
                    if ("string" == typeof e) return ii(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    return "Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r ? Array.from(e) : "Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r) ? ii(e, t) : void 0
                }
            }

            function ii(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = new Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ai(e, t) {
                var r = Object.keys(e);
                if (Object.getOwnPropertySymbols) {
                    var n = Object.getOwnPropertySymbols(e);
                    t && (n = n.filter((function(t) {
                        return Object.getOwnPropertyDescriptor(e, t).enumerable
                    }))), r.push.apply(r, n)
                }
                return r
            }

            function ui(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {};
                    t % 2 ? ai(Object(r), !0).forEach((function(t) {
                        ci(e, t, r[t])
                    })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(r)) : ai(Object(r)).forEach((function(t) {
                        Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(r, t))
                    }))
                }
                return e
            }

            function ci(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function li(e, t) {
                var r = (arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {}).checkForDefaultPrevented,
                    n = void 0 === r || r;
                return function(r) {
                    if (null != e && e(r), !1 === n || !r.defaultPrevented) return null == t ? void 0 : t(r)
                }
            }

            function si(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function fi() {
                for (var e = arguments.length, t = new Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return function(e) {
                    var r = !1,
                        n = t.map((function(t) {
                            var n = si(t, e);
                            return r || "function" != typeof n || (r = !0), n
                        }));
                    if (r) return function() {
                        for (var e = 0; e < n.length; e++) {
                            var r = n[e];
                            "function" == typeof r ? r() : si(t[e], null)
                        }
                    }
                }
            }

            function pi() {
                for (var e = arguments.length, t = new Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return n.useCallback(fi.apply(void 0, t), t)
            }

            function di() {
                for (var e = arguments.length, t = new Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                var o = t[0];
                if (1 === t.length) return o;
                var i = function() {
                    var e = t.map((function(e) {
                        return {
                            useScope: e(),
                            scopeName: e.scopeName
                        }
                    }));
                    return function(t) {
                        var r = e.reduce((function(e, r) {
                            var n = r.useScope,
                                o = r.scopeName;
                            return ui(ui({}, e), n(t)["__scope".concat(o)])
                        }), {});
                        return n.useMemo((function() {
                            return ci({}, "__scope".concat(o.scopeName), r)
                        }), [r])
                    }
                };
                return i.scopeName = o.scopeName, i
            }
            var yi = null !== globalThis && void 0 !== globalThis && globalThis.document ? n.useLayoutEffect : function() {},
                vi = function(e) {
                    var t = e.present,
                        r = e.children,
                        o = function(e) {
                            var t = ni(n.useState(), 2),
                                r = t[0],
                                o = t[1],
                                i = n.useRef({}),
                                a = n.useRef(e),
                                u = n.useRef("none"),
                                c = function(e, t) {
                                    return n.useReducer((function(e, r) {
                                        var n;
                                        return null !== (n = t[e][r]) && void 0 !== n ? n : e
                                    }), e)
                                }(e ? "mounted" : "unmounted", {
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
                                l = ni(c, 2),
                                s = l[0],
                                f = l[1];
                            return n.useEffect((function() {
                                var e = mi(i.current);
                                u.current = "mounted" === s ? e : "none"
                            }), [s]), yi((function() {
                                var t = i.current,
                                    r = a.current;
                                if (r !== e) {
                                    var n = u.current,
                                        o = mi(t);
                                    e ? f("MOUNT") : "none" === o || "none" === (null == t ? void 0 : t.display) ? f("UNMOUNT") : f(r && n !== o ? "ANIMATION_OUT" : "UNMOUNT"), a.current = e
                                }
                            }), [e, f]), yi((function() {
                                if (r) {
                                    var e, t, n = null !== (e = r.ownerDocument.defaultView) && void 0 !== e ? e : window,
                                        o = function(e) {
                                            var o = mi(i.current).includes(e.animationName);
                                            if (e.target === r && o && (f("ANIMATION_END"), !a.current)) {
                                                var u = r.style.animationFillMode;
                                                r.style.animationFillMode = "forwards", t = n.setTimeout((function() {
                                                    "forwards" === r.style.animationFillMode && (r.style.animationFillMode = u)
                                                }))
                                            }
                                        },
                                        c = function(e) {
                                            e.target === r && (u.current = mi(i.current))
                                        };
                                    return r.addEventListener("animationstart", c), r.addEventListener("animationcancel", o), r.addEventListener("animationend", o),
                                        function() {
                                            n.clearTimeout(t), r.removeEventListener("animationstart", c), r.removeEventListener("animationcancel", o), r.removeEventListener("animationend", o)
                                        }
                                }
                                f("ANIMATION_END")
                            }), [r, f]), {
                                isPresent: ["mounted", "unmountSuspended"].includes(s),
                                ref: n.useCallback((function(e) {
                                    e && (i.current = getComputedStyle(e)), o(e)
                                }), [])
                            }
                        }(t),
                        i = "function" == typeof r ? r({
                            present: o.isPresent
                        }) : n.Children.only(r),
                        a = pi(o.ref, function(e) {
                            var t, r, n = null === (t = Object.getOwnPropertyDescriptor(e.props, "ref")) || void 0 === t ? void 0 : t.get,
                                o = n && "isReactWarning" in n && n.isReactWarning;
                            return o ? e.ref : (o = (n = null === (r = Object.getOwnPropertyDescriptor(e, "ref")) || void 0 === r ? void 0 : r.get) && "isReactWarning" in n && n.isReactWarning) ? e.props.ref : e.props.ref || e.ref
                        }(i));
                    return "function" == typeof r || o.isPresent ? n.cloneElement(i, {
                        ref: a
                    }) : null
                };

            function mi(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }

            function hi(e) {
                var t = function(e) {
                        var t = n.forwardRef((function(e, t) {
                            var r = e.children,
                                o = ri(e, $o);
                            if (n.isValidElement(r)) {
                                var i = function(e) {
                                        var t, r, n = null === (t = Object.getOwnPropertyDescriptor(e.props, "ref")) || void 0 === t ? void 0 : t.get,
                                            o = n && "isReactWarning" in n && n.isReactWarning;
                                        return o ? e.ref : (o = (n = null === (r = Object.getOwnPropertyDescriptor(e, "ref")) || void 0 === r ? void 0 : r.get) && "isReactWarning" in n && n.isReactWarning) ? e.props.ref : e.props.ref || e.ref
                                    }(r),
                                    a = function(e, t) {
                                        var r = ui({}, t),
                                            n = function(n) {
                                                var o = e[n],
                                                    i = t[n];
                                                /^on[A-Z]/.test(n) ? o && i ? r[n] = function() {
                                                    i.apply(void 0, arguments), o.apply(void 0, arguments)
                                                } : o && (r[n] = o) : "style" === n ? r[n] = ui(ui({}, o), i) : "className" === n && (r[n] = [o, i].filter(Boolean).join(" "))
                                            };
                                        for (var o in t) n(o);
                                        return ui(ui({}, e), r)
                                    }(o, r.props);
                                return r.type !== n.Fragment && (a.ref = t ? fi(t, i) : i), n.cloneElement(r, a)
                            }
                            return n.Children.count(r) > 1 ? n.Children.only(null) : null
                        }));
                        return t.displayName = "".concat(e, ".SlotClone"), t
                    }(e),
                    r = n.forwardRef((function(e, r) {
                        var o = e.children,
                            i = ri(e, qo),
                            a = n.Children.toArray(o),
                            u = a.find(bi);
                        if (u) {
                            var c = u.props.children,
                                l = a.map((function(e) {
                                    return e === u ? n.Children.count(c) > 1 ? n.Children.only(null) : n.isValidElement(c) ? c.props.children : null : e
                                }));
                            return (0, L.jsx)(t, ui(ui({}, i), {}, {
                                ref: r,
                                children: n.isValidElement(c) ? n.cloneElement(c, void 0, l) : null
                            }))
                        }
                        return (0, L.jsx)(t, ui(ui({}, i), {}, {
                            ref: r,
                            children: o
                        }))
                    }));
                return r.displayName = "".concat(e, ".Slot"), r
            }
            vi.displayName = "Presence";
            var gi = Symbol("radix.slottable");

            function bi(e) {
                return n.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === gi
            }
            var wi = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((function(e, t) {
                var r = hi("Primitive.".concat(t)),
                    o = n.forwardRef((function(e, n) {
                        var o = e.asChild,
                            i = ri(e, Ho),
                            a = o ? r : t;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, L.jsx)(a, ui(ui({}, i), {}, {
                            ref: n
                        }))
                    }));
                return o.displayName = "Primitive.".concat(t), ui(ui({}, e), {}, ci({}, t, o))
            }), {});

            function Si(e) {
                var t = n.useRef(e);
                return n.useEffect((function() {
                    t.current = e
                })), n.useMemo((function() {
                    return function() {
                        for (var e, r = arguments.length, n = new Array(r), o = 0; o < r; o++) n[o] = arguments[o];
                        return null === (e = t.current) || void 0 === e ? void 0 : e.call.apply(e, [t].concat(n))
                    }
                }), [])
            }
            var Ai = "Popover",
                xi = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        r = [],
                        o = function() {
                            var t = r.map((function(e) {
                                return n.createContext(e)
                            }));
                            return function(r) {
                                var o = (null == r ? void 0 : r[e]) || t;
                                return n.useMemo((function() {
                                    return ci({}, "__scope".concat(e), ui(ui({}, r), {}, ci({}, e, o)))
                                }), [r, o])
                            }
                        };
                    return o.scopeName = e, [function(t, o) {
                        var i = n.createContext(o),
                            a = r.length;
                        r = [].concat(ti(r), [o]);
                        var u = function(t) {
                            var r, o = t.scope,
                                u = t.children,
                                c = ri(t, Jo),
                                l = (null == o || null === (r = o[e]) || void 0 === r ? void 0 : r[a]) || i,
                                s = n.useMemo((function() {
                                    return c
                                }), Object.values(c));
                            return (0, L.jsx)(l.Provider, {
                                value: s,
                                children: u
                            })
                        };
                        return u.displayName = t + "Provider", [u, function(r, u) {
                            var c, l = (null == u || null === (c = u[e]) || void 0 === c ? void 0 : c[a]) || i,
                                s = n.useContext(l);
                            if (s) return s;
                            if (void 0 !== o) return o;
                            throw new Error("`".concat(r, "` must be used within `").concat(t, "`"))
                        }]
                    }, di.apply(void 0, [o].concat(ti(t)))]
                }(Ai, [xo]),
                Ei = ni(xi, 2),
                Oi = Ei[0],
                Pi = (Ei[1], xo()),
                ji = ni(Oi(Ai), 2),
                Ri = ji[0],
                Ii = ji[1],
                Ci = function(e) {
                    var t = e.__scopePopover,
                        r = e.children,
                        o = e.open,
                        i = e.defaultOpen,
                        a = e.onOpenChange,
                        u = e.modal,
                        c = void 0 !== u && u,
                        l = Pi(t),
                        s = n.useRef(null),
                        f = ni(n.useState(!1), 2),
                        p = f[0],
                        d = f[1],
                        y = function(e) {
                            var t = e.prop,
                                r = e.defaultProp,
                                o = e.onChange,
                                i = void 0 === o ? function() {} : o,
                                a = function(e) {
                                    var t = e.defaultProp,
                                        r = e.onChange,
                                        o = n.useState(t),
                                        i = ni(o, 1)[0],
                                        a = n.useRef(i),
                                        u = Si(r);
                                    return n.useEffect((function() {
                                        a.current !== i && (u(i), a.current = i)
                                    }), [i, a, u]), o
                                }({
                                    defaultProp: r,
                                    onChange: i
                                }),
                                u = ni(a, 2),
                                c = u[0],
                                l = u[1],
                                s = void 0 !== t,
                                f = s ? t : c,
                                p = Si(i);
                            return [f, n.useCallback((function(e) {
                                if (s) {
                                    var r = "function" == typeof e ? e(t) : e;
                                    r !== t && p(r)
                                } else l(e)
                            }), [s, t, l, p])]
                        }({
                            prop: o,
                            defaultProp: i,
                            onChange: a
                        }),
                        v = ni(y, 2),
                        m = v[0],
                        h = void 0 !== m && m,
                        g = v[1];
                    return (0, L.jsx)(Wo, ui(ui({}, l), {}, {
                        children: (0, L.jsx)(Ri, {
                            scope: t,
                            contentId: Gt(),
                            triggerRef: s,
                            open: h,
                            onOpenChange: g,
                            onOpenToggle: n.useCallback((function() {
                                return g((function(e) {
                                    return !e
                                }))
                            }), [g]),
                            hasCustomAnchor: p,
                            onCustomAnchorAdd: n.useCallback((function() {
                                return d(!0)
                            }), []),
                            onCustomAnchorRemove: n.useCallback((function() {
                                return d(!1)
                            }), []),
                            modal: c,
                            children: r
                        })
                    }))
                };
            Ci.displayName = Ai;
            var ki = "PopoverAnchor",
                Fi = n.forwardRef((function(e, t) {
                    var r = e.__scopePopover,
                        o = ri(e, Xo),
                        i = Ii(ki, r),
                        a = Pi(r),
                        u = i.onCustomAnchorAdd,
                        c = i.onCustomAnchorRemove;
                    return n.useEffect((function() {
                        return u(),
                            function() {
                                return c()
                            }
                    }), [u, c]), (0, L.jsx)(Go, ui(ui(ui({}, a), o), {}, {
                        ref: t
                    }))
                }));
            Fi.displayName = ki;
            var Ni = "PopoverTrigger",
                Ti = n.forwardRef((function(e, t) {
                    var r = e.__scopePopover,
                        n = ri(e, Ko),
                        o = Ii(Ni, r),
                        i = Pi(r),
                        a = pi(t, o.triggerRef),
                        u = (0, L.jsx)(wi.button, ui(ui({
                            type: "button",
                            "aria-haspopup": "dialog",
                            "aria-expanded": o.open,
                            "aria-controls": o.contentId,
                            "data-state": Xi(o.open)
                        }, n), {}, {
                            ref: a,
                            onClick: li(e.onClick, o.onOpenToggle)
                        }));
                    return o.hasCustomAnchor ? u : (0, L.jsx)(Go, ui(ui({
                        asChild: !0
                    }, i), {}, {
                        children: u
                    }))
                }));
            Ti.displayName = Ni;
            var _i = "PopoverPortal",
                Di = ni(Oi(_i, {
                    forceMount: void 0
                }), 2),
                Mi = Di[0],
                Ui = Di[1],
                Bi = function(e) {
                    var t = e.__scopePopover,
                        r = e.forceMount,
                        n = e.children,
                        o = e.container,
                        i = Ii(_i, t);
                    return (0, L.jsx)(Mi, {
                        scope: t,
                        forceMount: r,
                        children: (0, L.jsx)(vi, {
                            present: r || i.open,
                            children: (0, L.jsx)(He, {
                                asChild: !0,
                                container: o,
                                children: n
                            })
                        })
                    })
                };
            Bi.displayName = _i;
            var Li = "PopoverContent",
                Wi = n.forwardRef((function(e, t) {
                    var r = Ui(Li, e.__scopePopover),
                        n = e.forceMount,
                        o = void 0 === n ? r.forceMount : n,
                        i = ri(e, Yo),
                        a = Ii(Li, e.__scopePopover);
                    return (0, L.jsx)(vi, {
                        present: o || a.open,
                        children: a.modal ? (0, L.jsx)(zi, ui(ui({}, i), {}, {
                            ref: t
                        })) : (0, L.jsx)(Vi, ui(ui({}, i), {}, {
                            ref: t
                        }))
                    })
                }));
            Wi.displayName = Li;
            var Gi = hi("PopoverContent.RemoveScroll"),
                zi = n.forwardRef((function(e, t) {
                    var r = Ii(Li, e.__scopePopover),
                        o = n.useRef(null),
                        i = pi(t, o),
                        a = n.useRef(!1);
                    return n.useEffect((function() {
                        var e = o.current;
                        if (e) return Qe(e)
                    }), []), (0, L.jsx)(Dt, {
                        as: Gi,
                        allowPinchZoom: !0,
                        children: (0, L.jsx)(qi, ui(ui({}, e), {}, {
                            ref: i,
                            trapFocus: r.open,
                            disableOutsidePointerEvents: !0,
                            onCloseAutoFocus: li(e.onCloseAutoFocus, (function(e) {
                                var t;
                                e.preventDefault(), a.current || null === (t = r.triggerRef.current) || void 0 === t || t.focus()
                            })),
                            onPointerDownOutside: li(e.onPointerDownOutside, (function(e) {
                                var t = e.detail.originalEvent,
                                    r = 0 === t.button && !0 === t.ctrlKey,
                                    n = 2 === t.button || r;
                                a.current = n
                            }), {
                                checkForDefaultPrevented: !1
                            }),
                            onFocusOutside: li(e.onFocusOutside, (function(e) {
                                return e.preventDefault()
                            }), {
                                checkForDefaultPrevented: !1
                            })
                        }))
                    })
                })),
                Vi = n.forwardRef((function(e, t) {
                    var r = Ii(Li, e.__scopePopover),
                        o = n.useRef(!1),
                        i = n.useRef(!1);
                    return (0, L.jsx)(qi, ui(ui({}, e), {}, {
                        ref: t,
                        trapFocus: !1,
                        disableOutsidePointerEvents: !1,
                        onCloseAutoFocus: function(t) {
                            var n, a;
                            null !== (n = e.onCloseAutoFocus) && void 0 !== n && n.call(e, t), t.defaultPrevented || (o.current || null !== (a = r.triggerRef.current) && void 0 !== a && a.focus(), t.preventDefault()), o.current = !1, i.current = !1
                        },
                        onInteractOutside: function(t) {
                            var n, a;
                            null !== (n = e.onInteractOutside) && void 0 !== n && n.call(e, t), t.defaultPrevented || (o.current = !0, "pointerdown" === t.detail.originalEvent.type && (i.current = !0));
                            var u = t.target;
                            (null === (a = r.triggerRef.current) || void 0 === a ? void 0 : a.contains(u)) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && i.current && t.preventDefault()
                        }
                    }))
                })),
                qi = n.forwardRef((function(e, t) {
                    var r = e.__scopePopover,
                        n = e.trapFocus,
                        o = e.onOpenAutoFocus,
                        i = e.onCloseAutoFocus,
                        a = e.disableOutsidePointerEvents,
                        u = e.onEscapeKeyDown,
                        c = e.onPointerDownOutside,
                        l = e.onFocusOutside,
                        s = e.onInteractOutside,
                        f = ri(e, Zo),
                        p = Ii(Li, r),
                        d = Pi(r);
                    return Ee(), (0, L.jsx)(_e, {
                        asChild: !0,
                        loop: !0,
                        trapped: n,
                        onMountAutoFocus: o,
                        onUnmountAutoFocus: i,
                        children: (0, L.jsx)(we, {
                            asChild: !0,
                            disableOutsidePointerEvents: a,
                            onInteractOutside: s,
                            onEscapeKeyDown: u,
                            onPointerDownOutside: c,
                            onFocusOutside: l,
                            onDismiss: function() {
                                return p.onOpenChange(!1)
                            },
                            children: (0, L.jsx)(zo, ui(ui(ui({
                                "data-state": Xi(p.open),
                                role: "dialog",
                                id: p.contentId
                            }, d), f), {}, {
                                ref: t,
                                style: ui(ui({}, f.style), {}, {
                                    "--radix-popover-content-transform-origin": "var(--radix-popper-transform-origin)",
                                    "--radix-popover-content-available-width": "var(--radix-popper-available-width)",
                                    "--radix-popover-content-available-height": "var(--radix-popper-available-height)",
                                    "--radix-popover-trigger-width": "var(--radix-popper-anchor-width)",
                                    "--radix-popover-trigger-height": "var(--radix-popper-anchor-height)"
                                })
                            }))
                        })
                    })
                })),
                $i = "PopoverClose",
                Hi = n.forwardRef((function(e, t) {
                    var r = e.__scopePopover,
                        n = ri(e, Qo),
                        o = Ii($i, r);
                    return (0, L.jsx)(wi.button, ui(ui({
                        type: "button"
                    }, n), {}, {
                        ref: t,
                        onClick: li(e.onClick, (function() {
                            return o.onOpenChange(!1)
                        }))
                    }))
                }));
            Hi.displayName = $i;
            var Ji = n.forwardRef((function(e, t) {
                var r = e.__scopePopover,
                    n = ri(e, ei),
                    o = Pi(r);
                return (0, L.jsx)(Vo, ui(ui(ui({}, o), n), {}, {
                    ref: t
                }))
            }));

            function Xi(e) {
                return e ? "open" : "closed"
            }
            Ji.displayName = "PopoverArrow";
            var Ki = Ci,
                Yi = Ti,
                Zi = Bi,
                Qi = Wi;

            function ea(e, t) {
                void 0 === t && (t = {});
                var r = t.insertAt;
                if (e && "undefined" != typeof document) {
                    var n = document.head || document.getElementsByTagName("head")[0],
                        o = document.createElement("style");
                    o.type = "text/css", "top" === r && n.firstChild ? n.insertBefore(o, n.firstChild) : n.appendChild(o), o.styleSheet ? o.styleSheet.cssText = e : o.appendChild(document.createTextNode(e))
                }
            }
            ea(".bg-common-backdrop{background-color:var(--color-common-backdrop)}.shadow-transient-high{box-shadow:var(--size-0) var(--size-50) var(--size-100) -.5px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-250) var(--size-500) -.75px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-400) var(--size-800) -1px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-1200) var(--size-1400) -1.5px var(--alpha-color-shadow-subtle)}.shadow-transient-low{box-shadow:var(--size-0) var(--size-50) var(--size-100) -.5px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-250) var(--size-500) -.75px var(--alpha-color-shadow-subtle)}.foundation-web-portal-zindex{z-index:1050}.fui-future-shadow-affixed-low{box-shadow:0 0 var(--size-100) 0 var(--fui-future-alpha-color-shadow-subtle),0 0 var(--size-500) 0 var(--fui-future-alpha-color-shadow-subtle)}:root{--light-mode-stroke-contrast-alpha:rgba(27,37,75,.5);--dark-mode-stroke-contrast-alpha:rgba(208,217,251,.4);--color-stroke-contrast-alpha:var(--light-mode-stroke-contrast-alpha);--alpha-light-mode-shadow-subtle:rgba(0,0,0,.08);--alpha-dark-mode-shadow-subtle:rgba(4,4,8,.25);--alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--light-mode-system-contrast)}@media (prefers-color-scheme:dark){:root{--color-stroke-contrast-alpha:var(--dark-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}}.light-theme{--color-stroke-contrast-alpha:var(--light-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--light-mode-system-contrast)}.dark-theme{--color-stroke-contrast-alpha:var(--dark-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}.system-theme{--color-stroke-contrast-alpha:var(--light-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--light-mode-system-contrast)}@media (prefers-color-scheme:dark){.system-theme{--color-stroke-contrast-alpha:var(--dark-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}}.stroke-contrast-alpha{border-color:var(--color-stroke-contrast-alpha)}.foundation-web-input.stroke-contrast-alpha:focus,.foundation-web-input.stroke-contrast-alpha:focus-within,.foundation-web-input.stroke-emphasis:focus,.foundation-web-input.stroke-emphasis:focus-within{border-color:var(--color-system-emphasis);box-shadow:inset 0 0 0 1px var(--color-system-emphasis)}.foundation-web-input.stroke-system-alert:focus,.foundation-web-input.stroke-system-alert:focus-within{box-shadow:inset 0 0 0 1px var(--color-system-alert)}");
            var ta = function(e) {
                var t, r, n, o, i = null !== (n = null === (r = null === (t = window.matchMedia) || void 0 === t ? void 0 : t.call(window, "(pointer: coarse)")) || void 0 === r ? void 0 : r.matches) && void 0 !== n && n,
                    a = null === (o = document.activeElement) || void 0 === o ? void 0 : o.matches(":focus-visible");
                if (!i || a) {
                    var u = e.currentTarget,
                        c = null == u ? void 0 : u.querySelector('[role="menuitem"]:not([aria-disabled="true"])');
                    c && (e.preventDefault(), c.focus())
                } else e.preventDefault()
            };

            function ra(e) {
                var t = e.open,
                    r = e.defaultOpen,
                    o = e.onOpenChange,
                    i = e.children;
                return n.createElement(Ki, {
                    open: t,
                    defaultOpen: r,
                    onOpenChange: o
                }, i)
            }

            function na(e) {
                var t = e.asChild,
                    r = e.disabled,
                    o = e.className,
                    i = e.children;
                return n.createElement(Yi, {
                    asChild: t,
                    disabled: r,
                    className: o
                }, i)
            }

            function oa(e) {
                var t = e.side,
                    r = void 0 === t ? "bottom" : t,
                    o = e.align,
                    i = void 0 === o ? "center" : o,
                    a = e.sideOffset,
                    u = void 0 === a ? 4 : a,
                    c = e.className,
                    l = e.children,
                    s = e.ariaLabel,
                    f = e.onOpenAutoFocus,
                    p = M(e, ["side", "align", "sideOffset", "className", "children", "ariaLabel", "onOpenAutoFocus"]);
                return n.createElement(Zi, null, n.createElement(Qi, Object.assign({
                    side: r,
                    align: i,
                    sideOffset: u
                }, p, {
                    "aria-label": null != s ? s : p["aria-label"],
                    onOpenAutoFocus: null != f ? f : ta,
                    className: B("foundation-web-portal-zindex", c)
                }), l))
            }
            var ia = ["children"],
                aa = ["children"];

            function ua(e, t) {
                var r = Object.keys(e);
                if (Object.getOwnPropertySymbols) {
                    var n = Object.getOwnPropertySymbols(e);
                    t && (n = n.filter((function(t) {
                        return Object.getOwnPropertyDescriptor(e, t).enumerable
                    }))), r.push.apply(r, n)
                }
                return r
            }

            function ca(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {};
                    t % 2 ? ua(Object(r), !0).forEach((function(t) {
                        la(e, t, r[t])
                    })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(r)) : ua(Object(r)).forEach((function(t) {
                        Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(r, t))
                    }))
                }
                return e
            }

            function la(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function sa(e, t) {
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
                    for (n = 0; n < i.length; n++) r = i[n], t.indexOf(r) >= 0 || Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r])
                }
                return o
            }

            function fa(e) {
                return fa = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(e) {
                    return typeof e
                } : function(e) {
                    return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e
                }, fa(e)
            }

            function pa(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }
            var da = Symbol.for("react.lazy"),
                ya = n[" use ".trim().toString()];

            function va(e) {
                return null != e && "object" == fa(e) && "$$typeof" in e && e.$$typeof === da && "_payload" in e && "object" == fa(t = e._payload) && null !== t && "then" in t;
                var t
            }
            var ma = function(e) {
                var t = function(e) {
                        var t = n.forwardRef((function(e, t) {
                            var r = e.children,
                                o = sa(e, aa);
                            if (va(r) && "function" == typeof ya && (r = ya(r._payload)), n.isValidElement(r)) {
                                var i = function(e) {
                                        var t, r, n = null === (t = Object.getOwnPropertyDescriptor(e.props, "ref")) || void 0 === t ? void 0 : t.get,
                                            o = n && "isReactWarning" in n && n.isReactWarning;
                                        return o ? e.ref : (o = (n = null === (r = Object.getOwnPropertyDescriptor(e, "ref")) || void 0 === r ? void 0 : r.get) && "isReactWarning" in n && n.isReactWarning) ? e.props.ref : e.props.ref || e.ref
                                    }(r),
                                    a = function(e, t) {
                                        var r = ca({}, t),
                                            n = function(n) {
                                                var o = e[n],
                                                    i = t[n];
                                                /^on[A-Z]/.test(n) ? o && i ? r[n] = function() {
                                                    var e = i.apply(void 0, arguments);
                                                    return o.apply(void 0, arguments), e
                                                } : o && (r[n] = o) : "style" === n ? r[n] = ca(ca({}, o), i) : "className" === n && (r[n] = [o, i].filter(Boolean).join(" "))
                                            };
                                        for (var o in t) n(o);
                                        return ca(ca({}, e), r)
                                    }(o, r.props);
                                return r.type !== n.Fragment && (a.ref = t ? function() {
                                    for (var e = arguments.length, t = new Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                    return function(e) {
                                        var r = !1,
                                            n = t.map((function(t) {
                                                var n = pa(t, e);
                                                return r || "function" != typeof n || (r = !0), n
                                            }));
                                        if (r) return function() {
                                            for (var e = 0; e < n.length; e++) {
                                                var r = n[e];
                                                "function" == typeof r ? r() : pa(t[e], null)
                                            }
                                        }
                                    }
                                }(t, i) : i), n.cloneElement(r, a)
                            }
                            return n.Children.count(r) > 1 ? n.Children.only(null) : null
                        }));
                        return t.displayName = "".concat(e, ".SlotClone"), t
                    }(e),
                    r = n.forwardRef((function(e, r) {
                        var o = e.children,
                            i = sa(e, ia);
                        va(o) && "function" == typeof ya && (o = ya(o._payload));
                        var a = n.Children.toArray(o),
                            u = a.find(ga);
                        if (u) {
                            var c = u.props.children,
                                l = a.map((function(e) {
                                    return e === u ? n.Children.count(c) > 1 ? n.Children.only(null) : n.isValidElement(c) ? c.props.children : null : e
                                }));
                            return (0, L.jsx)(t, ca(ca({}, i), {}, {
                                ref: r,
                                children: n.isValidElement(c) ? n.cloneElement(c, void 0, l) : null
                            }))
                        }
                        return (0, L.jsx)(t, ca(ca({}, i), {}, {
                            ref: r,
                            children: o
                        }))
                    }));
                return r.displayName = "".concat(e, ".Slot"), r
            }("Slot");
            var ha = Symbol("radix.slottable");

            function ga(e) {
                return n.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === ha
            }
            var ba = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                wa = function(e) {
                    var t = e.className;
                    return o().createElement("div", {
                        role: "presentation",
                        className: B("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", t)
                    })
                },
                Sa = "opacity-[0.5]",
                Aa = {
                    Large: "size-1200",
                    Medium: "size-1000",
                    Small: "size-800",
                    XSmall: "size-600"
                },
                xa = {
                    XSmall: "size-400",
                    Small: "size-500",
                    Medium: "size-600",
                    Large: "size-700"
                },
                Ea = {
                    Large: {
                        circular: "radius-circle",
                        square: "radius-medium"
                    },
                    Medium: {
                        circular: "radius-circle",
                        square: "radius-medium"
                    },
                    Small: {
                        circular: "radius-circle",
                        square: "radius-medium"
                    },
                    XSmall: {
                        circular: "radius-circle",
                        square: "radius-small"
                    }
                },
                Oa = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-alert",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                Pa = {
                    Emphasis: "bg-action-standard",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-0"
                },
                ja = {
                    Emphasis: "bg-action-emphasis",
                    Standard: "bg-action-standard",
                    Alert: "bg-action-standard",
                    Utility: "bg-shift-300",
                    OverMedia: "bg-over-media-0"
                },
                Ra = {
                    Default: {
                        Emphasis: "content-action-emphasis",
                        Standard: "content-action-standard",
                        Alert: "content-action-alert",
                        Utility: "content-emphasis",
                        OverMedia: "content-emphasis"
                    },
                    Inverse: {
                        Emphasis: "content-inverse-action-emphasis",
                        Standard: "content-inverse-action-standard",
                        Alert: "content-inverse-action-alert",
                        Utility: "content-inverse-emphasis",
                        OverMedia: "content-inverse-emphasis"
                    }
                },
                Ia = {
                    Default: {
                        Emphasis: "content-action-standard",
                        Standard: "content-action-standard",
                        Alert: "content-action-standard",
                        Utility: "content-emphasis",
                        OverMedia: "content-emphasis"
                    },
                    Inverse: {
                        Emphasis: "content-inverse-action-standard",
                        Standard: "content-inverse-action-standard",
                        Alert: "content-inverse-action-standard",
                        Utility: "content-inverse-emphasis",
                        OverMedia: "content-inverse-emphasis"
                    }
                },
                Ca = (0, n.forwardRef)((function(e, t) {
                    var r, n = e.className,
                        i = e.icon,
                        a = e.ariaLabel,
                        u = e.isDisabled,
                        c = void 0 !== u && u,
                        l = e.isCircular,
                        s = void 0 !== l && l,
                        f = e.isSelected,
                        p = void 0 !== f && f,
                        d = e.size,
                        y = void 0 === d ? "Large" : d,
                        v = e.variant,
                        m = void 0 === v ? "Emphasis" : v,
                        h = e.iconColor,
                        g = void 0 === h ? "Default" : h,
                        b = e.asChild,
                        w = e.children,
                        S = M(e, ["className", "icon", "ariaLabel", "isDisabled", "isCircular", "isSelected", "size", "variant", "iconColor", "asChild", "children"]);
                    r = c ? Pa[m] : p ? ja[m] : Oa[m];
                    var A = B("foundation-web-icon-button", c ? Sa : [ba, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", Aa[y], Ea[y][s ? "circular" : "square"], r, n),
                        x = o().createElement(o().Fragment, null, o().createElement(wa, null), o().createElement("span", {
                            className: B("icon", i, xa[y], c ? Ia[g][m] : Ra[g][m])
                        }));
                    if (b) {
                        var E = M(S, ["as"]),
                            O = o().Children.only(w);
                        return o().createElement(ma, Object.assign({
                            ref: t
                        }, E, {
                            className: A,
                            "aria-label": a,
                            "aria-disabled": c || void 0
                        }), o().cloneElement(O, {}, x))
                    }
                    if ("a" === S.as) {
                        S.as;
                        var P = S.href,
                            j = M(S, ["as", "href"]);
                        return o().createElement("a", Object.assign({
                            ref: t
                        }, j, {
                            "aria-label": a,
                            "aria-disabled": c,
                            href: c ? void 0 : P,
                            className: A
                        }), x)
                    }
                    var R = M(S, ["as"]);
                    return o().createElement("button", Object.assign({
                        ref: t,
                        type: "button"
                    }, R, {
                        "aria-label": a,
                        disabled: c,
                        className: A
                    }), x)
                }));

            function ka(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var r = [],
                        n = !0,
                        o = !1,
                        i = void 0;
                    try {
                        for (var a, u = e[Symbol.iterator](); !(n = (a = u.next()).done) && (r.push(a.value), !t || r.length !== t); n = !0);
                    } catch (e) {
                        o = !0, i = e
                    } finally {
                        try {
                            n || null == u.return || u.return()
                        } finally {
                            if (o) throw i
                        }
                    }
                    return r
                }(e, t) || function(e, t) {
                    if (!e) return;
                    if ("string" == typeof e) return Fa(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    "Object" === r && e.constructor && (r = e.constructor.name);
                    if ("Map" === r || "Set" === r) return Array.from(e);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return Fa(e, t)
                }(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function Fa(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = new Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function Na(e, t) {
                var r = ka(t, 2),
                    n = r[0],
                    o = r[1];
                return Math.min(o, Math.max(n, e))
            }
            var Ta = ["children"],
                _a = ["children"],
                Da = ["scope", "children"],
                Ma = ["scope", "children"];

            function Ua(e) {
                return function(e) {
                    if (Array.isArray(e)) return Wa(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && Symbol.iterator in Object(e)) return Array.from(e)
                }(e) || La(e) || function() {
                    throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function Ba(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var r = [],
                        n = !0,
                        o = !1,
                        i = void 0;
                    try {
                        for (var a, u = e[Symbol.iterator](); !(n = (a = u.next()).done) && (r.push(a.value), !t || r.length !== t); n = !0);
                    } catch (e) {
                        o = !0, i = e
                    } finally {
                        try {
                            n || null == u.return || u.return()
                        } finally {
                            if (o) throw i
                        }
                    }
                    return r
                }(e, t) || La(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function La(e, t) {
                if (e) {
                    if ("string" == typeof e) return Wa(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    return "Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r ? Array.from(e) : "Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r) ? Wa(e, t) : void 0
                }
            }

            function Wa(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = new Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function Ga(e, t) {
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
                    for (n = 0; n < i.length; n++) r = i[n], t.indexOf(r) >= 0 || Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r])
                }
                return o
            }

            function za(e, t) {
                var r = Object.keys(e);
                if (Object.getOwnPropertySymbols) {
                    var n = Object.getOwnPropertySymbols(e);
                    t && (n = n.filter((function(t) {
                        return Object.getOwnPropertyDescriptor(e, t).enumerable
                    }))), r.push.apply(r, n)
                }
                return r
            }

            function Va(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {};
                    t % 2 ? za(Object(r), !0).forEach((function(t) {
                        qa(e, t, r[t])
                    })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(r)) : za(Object(r)).forEach((function(t) {
                        Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(r, t))
                    }))
                }
                return e
            }

            function qa(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function $a() {
                for (var e = arguments.length, t = new Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                var o = t[0];
                if (1 === t.length) return o;
                var i = function() {
                    var e = t.map((function(e) {
                        return {
                            useScope: e(),
                            scopeName: e.scopeName
                        }
                    }));
                    return function(t) {
                        var r = e.reduce((function(e, r) {
                            var n = r.useScope,
                                o = r.scopeName;
                            return Va(Va({}, e), n(t)["__scope".concat(o)])
                        }), {});
                        return n.useMemo((function() {
                            return qa({}, "__scope".concat(o.scopeName), r)
                        }), [r])
                    }
                };
                return i.scopeName = o.scopeName, i
            }

            function Ha(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function Ja() {
                for (var e = arguments.length, t = new Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return function(e) {
                    var r = !1,
                        n = t.map((function(t) {
                            var n = Ha(t, e);
                            return r || "function" != typeof n || (r = !0), n
                        }));
                    if (r) return function() {
                        for (var e = 0; e < n.length; e++) {
                            var r = n[e];
                            "function" == typeof r ? r() : Ha(t[e], null)
                        }
                    }
                }
            }

            function Xa() {
                for (var e = arguments.length, t = new Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return n.useCallback(Ja.apply(void 0, t), t)
            }

            function Ka(e) {
                var t = function(e) {
                        var t = n.forwardRef((function(e, t) {
                            var r = e.children,
                                o = Ga(e, _a);
                            if (n.isValidElement(r)) {
                                var i = function(e) {
                                        var t, r, n = null === (t = Object.getOwnPropertyDescriptor(e.props, "ref")) || void 0 === t ? void 0 : t.get,
                                            o = n && "isReactWarning" in n && n.isReactWarning;
                                        return o ? e.ref : (o = (n = null === (r = Object.getOwnPropertyDescriptor(e, "ref")) || void 0 === r ? void 0 : r.get) && "isReactWarning" in n && n.isReactWarning) ? e.props.ref : e.props.ref || e.ref
                                    }(r),
                                    a = function(e, t) {
                                        var r = Va({}, t),
                                            n = function(n) {
                                                var o = e[n],
                                                    i = t[n];
                                                /^on[A-Z]/.test(n) ? o && i ? r[n] = function() {
                                                    i.apply(void 0, arguments), o.apply(void 0, arguments)
                                                } : o && (r[n] = o) : "style" === n ? r[n] = Va(Va({}, o), i) : "className" === n && (r[n] = [o, i].filter(Boolean).join(" "))
                                            };
                                        for (var o in t) n(o);
                                        return Va(Va({}, e), r)
                                    }(o, r.props);
                                return r.type !== n.Fragment && (a.ref = t ? Ja(t, i) : i), n.cloneElement(r, a)
                            }
                            return n.Children.count(r) > 1 ? n.Children.only(null) : null
                        }));
                        return t.displayName = "".concat(e, ".SlotClone"), t
                    }(e),
                    r = n.forwardRef((function(e, r) {
                        var o = e.children,
                            i = Ga(e, Ta),
                            a = n.Children.toArray(o),
                            u = a.find(Za);
                        if (u) {
                            var c = u.props.children,
                                l = a.map((function(e) {
                                    return e === u ? n.Children.count(c) > 1 ? n.Children.only(null) : n.isValidElement(c) ? c.props.children : null : e
                                }));
                            return (0, L.jsx)(t, Va(Va({}, i), {}, {
                                ref: r,
                                children: n.isValidElement(c) ? n.cloneElement(c, void 0, l) : null
                            }))
                        }
                        return (0, L.jsx)(t, Va(Va({}, i), {}, {
                            ref: r,
                            children: o
                        }))
                    }));
                return r.displayName = "".concat(e, ".Slot"), r
            }
            var Ya = Symbol("radix.slottable");

            function Za(e) {
                return n.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === Ya
            }
            var Qa = n.createContext(void 0);

            function eu(e) {
                var t = n.useContext(Qa);
                return e || t || "ltr"
            }
            var tu = 0,
                ru = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]"
                },
                nu = o().forwardRef((function(e, t) {
                    var r = e.name,
                        n = e.size,
                        i = void 0 === n ? "Medium" : n,
                        a = e.className,
                        u = (e.children, M(e, ["name", "size", "className", "children"]));
                    return o().createElement("span", Object.assign({
                        ref: t,
                        role: "presentation",
                        className: B("grow-0 shrink-0 basis-auto icon", r, ru[i], a)
                    }, u))
                }));
            nu.displayName = "Icon";
            var ou = ["scope", "children"];

            function iu(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var r = [],
                        n = !0,
                        o = !1,
                        i = void 0;
                    try {
                        for (var a, u = e[Symbol.iterator](); !(n = (a = u.next()).done) && (r.push(a.value), !t || r.length !== t); n = !0);
                    } catch (e) {
                        o = !0, i = e
                    } finally {
                        try {
                            n || null == u.return || u.return()
                        } finally {
                            if (o) throw i
                        }
                    }
                    return r
                }(e, t) || cu(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function au(e, t) {
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
                    for (n = 0; n < i.length; n++) r = i[n], t.indexOf(r) >= 0 || Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r])
                }
                return o
            }

            function uu(e) {
                return function(e) {
                    if (Array.isArray(e)) return lu(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && Symbol.iterator in Object(e)) return Array.from(e)
                }(e) || cu(e) || function() {
                    throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function cu(e, t) {
                if (e) {
                    if ("string" == typeof e) return lu(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    return "Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r ? Array.from(e) : "Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r) ? lu(e, t) : void 0
                }
            }

            function lu(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = new Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function su(e, t) {
                var r = Object.keys(e);
                if (Object.getOwnPropertySymbols) {
                    var n = Object.getOwnPropertySymbols(e);
                    t && (n = n.filter((function(t) {
                        return Object.getOwnPropertyDescriptor(e, t).enumerable
                    }))), r.push.apply(r, n)
                }
                return r
            }

            function fu(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {};
                    t % 2 ? su(Object(r), !0).forEach((function(t) {
                        pu(e, t, r[t])
                    })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(r)) : su(Object(r)).forEach((function(t) {
                        Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(r, t))
                    }))
                }
                return e
            }

            function pu(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function du(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function yu() {
                for (var e = arguments.length, t = new Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return function(e) {
                    var r = !1,
                        n = t.map((function(t) {
                            var n = du(t, e);
                            return r || "function" != typeof n || (r = !0), n
                        }));
                    if (r) return function() {
                        for (var e = 0; e < n.length; e++) {
                            var r = n[e];
                            "function" == typeof r ? r() : du(t[e], null)
                        }
                    }
                }
            }

            function vu() {
                for (var e = arguments.length, t = new Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return n.useCallback(yu.apply(void 0, t), t)
            }

            function mu(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                    r = [],
                    o = function() {
                        var t = r.map((function(e) {
                            return n.createContext(e)
                        }));
                        return function(r) {
                            var o = (null == r ? void 0 : r[e]) || t;
                            return n.useMemo((function() {
                                return pu({}, "__scope".concat(e), fu(fu({}, r), {}, pu({}, e, o)))
                            }), [r, o])
                        }
                    };
                return o.scopeName = e, [function(t, o) {
                    var i = n.createContext(o),
                        a = r.length;
                    r = [].concat(uu(r), [o]);
                    var u = function(t) {
                        var r, o = t.scope,
                            u = t.children,
                            c = au(t, ou),
                            l = (null == o || null === (r = o[e]) || void 0 === r ? void 0 : r[a]) || i,
                            s = n.useMemo((function() {
                                return c
                            }), Object.values(c));
                        return (0, L.jsx)(l.Provider, {
                            value: s,
                            children: u
                        })
                    };
                    return u.displayName = t + "Provider", [u, function(r, u) {
                        var c, l = (null == u || null === (c = u[e]) || void 0 === c ? void 0 : c[a]) || i,
                            s = n.useContext(l);
                        if (s) return s;
                        if (void 0 !== o) return o;
                        throw new Error("`".concat(r, "` must be used within `").concat(t, "`"))
                    }]
                }, hu.apply(void 0, [o].concat(uu(t)))]
            }

            function hu() {
                for (var e = arguments.length, t = new Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                var o = t[0];
                if (1 === t.length) return o;
                var i = function() {
                    var e = t.map((function(e) {
                        return {
                            useScope: e(),
                            scopeName: e.scopeName
                        }
                    }));
                    return function(t) {
                        var r = e.reduce((function(e, r) {
                            var n = r.useScope,
                                o = r.scopeName;
                            return fu(fu({}, e), n(t)["__scope".concat(o)])
                        }), {});
                        return n.useMemo((function() {
                            return pu({}, "__scope".concat(o.scopeName), r)
                        }), [r])
                    }
                };
                return i.scopeName = o.scopeName, i
            }

            function gu(e, t) {
                var r = (arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {}).checkForDefaultPrevented,
                    n = void 0 === r || r;
                return function(r) {
                    if (null != e && e(r), !1 === n || !r.defaultPrevented) return null == t ? void 0 : t(r)
                }
            }

            function bu(e) {
                var t = n.useRef(e);
                return n.useEffect((function() {
                    t.current = e
                })), n.useMemo((function() {
                    return function() {
                        for (var e, r = arguments.length, n = new Array(r), o = 0; o < r; o++) n[o] = arguments[o];
                        return null === (e = t.current) || void 0 === e ? void 0 : e.call.apply(e, [t].concat(n))
                    }
                }), [])
            }
            var wu = Boolean(null === globalThis || void 0 === globalThis ? void 0 : globalThis.document) ? n.useLayoutEffect : function() {};
            var Su = function(e) {
                var t = e.present,
                    r = e.children,
                    o = function(e) {
                        var t = iu(n.useState(), 2),
                            r = t[0],
                            o = t[1],
                            i = n.useRef({}),
                            a = n.useRef(e),
                            u = n.useRef("none"),
                            c = function(e, t) {
                                return n.useReducer((function(e, r) {
                                    var n;
                                    return null !== (n = t[e][r]) && void 0 !== n ? n : e
                                }), e)
                            }(e ? "mounted" : "unmounted", {
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
                            l = iu(c, 2),
                            s = l[0],
                            f = l[1];
                        return n.useEffect((function() {
                            var e = Au(i.current);
                            u.current = "mounted" === s ? e : "none"
                        }), [s]), wu((function() {
                            var t = i.current,
                                r = a.current;
                            if (r !== e) {
                                var n = u.current,
                                    o = Au(t);
                                e ? f("MOUNT") : "none" === o || "none" === (null == t ? void 0 : t.display) ? f("UNMOUNT") : f(r && n !== o ? "ANIMATION_OUT" : "UNMOUNT"), a.current = e
                            }
                        }), [e, f]), wu((function() {
                            if (r) {
                                var e, t, n = null !== (e = r.ownerDocument.defaultView) && void 0 !== e ? e : window,
                                    o = function(e) {
                                        var o = Au(i.current).includes(e.animationName);
                                        if (e.target === r && o && (f("ANIMATION_END"), !a.current)) {
                                            var u = r.style.animationFillMode;
                                            r.style.animationFillMode = "forwards", t = n.setTimeout((function() {
                                                "forwards" === r.style.animationFillMode && (r.style.animationFillMode = u)
                                            }))
                                        }
                                    },
                                    c = function(e) {
                                        e.target === r && (u.current = Au(i.current))
                                    };
                                return r.addEventListener("animationstart", c), r.addEventListener("animationcancel", o), r.addEventListener("animationend", o),
                                    function() {
                                        n.clearTimeout(t), r.removeEventListener("animationstart", c), r.removeEventListener("animationcancel", o), r.removeEventListener("animationend", o)
                                    }
                            }
                            f("ANIMATION_END")
                        }), [r, f]), {
                            isPresent: ["mounted", "unmountSuspended"].includes(s),
                            ref: n.useCallback((function(e) {
                                e && (i.current = getComputedStyle(e)), o(e)
                            }), [])
                        }
                    }(t),
                    i = "function" == typeof r ? r({
                        present: o.isPresent
                    }) : n.Children.only(r),
                    a = vu(o.ref, function(e) {
                        var t, r, n = null === (t = Object.getOwnPropertyDescriptor(e.props, "ref")) || void 0 === t ? void 0 : t.get,
                            o = n && "isReactWarning" in n && n.isReactWarning;
                        return o ? e.ref : (o = (n = null === (r = Object.getOwnPropertyDescriptor(e, "ref")) || void 0 === r ? void 0 : r.get) && "isReactWarning" in n && n.isReactWarning) ? e.props.ref : e.props.ref || e.ref
                    }(i));
                return "function" == typeof r || o.isPresent ? n.cloneElement(i, {
                    ref: a
                }) : null
            };

            function Au(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }

            function xu(e) {
                var t = e.className;
                return o().createElement("svg", {
                    xmlns: "http://www.w3.org/2000/svg",
                    width: "13",
                    height: "6",
                    viewBox: "0 0 13 6",
                    fill: "none",
                    className: B("block", t),
                    style: {
                        marginTop: -1
                    }
                }, o().createElement("path", {
                    d: "M0.249999 0.666628L4.83579 5.25241C5.61683 6.03346 6.88316 6.03346 7.66421 5.25241L12.25 0.666626L0.249999 0.666628Z",
                    fill: "currentColor"
                }))
            }
            Su.displayName = "Presence";
            var Eu = ["children"],
                Ou = ["children"],
                Pu = ["asChild"],
                ju = ["disableOutsidePointerEvents", "onEscapeKeyDown", "onPointerDownOutside", "onFocusOutside", "onInteractOutside", "onDismiss"],
                Ru = ["children", "width", "height"],
                Iu = ["__scopePopper", "virtualRef"],
                Cu = ["__scopePopper", "side", "sideOffset", "align", "alignOffset", "arrowPadding", "avoidCollisions", "collisionBoundary", "collisionPadding", "sticky", "hideWhenDetached", "updatePositionStrategy", "onPlaced"],
                ku = ["__scopePopper"],
                Fu = ["container"],
                Nu = ["__scopeTooltip"],
                Tu = ["forceMount", "side"],
                _u = ["__scopeTooltip", "children", "aria-label", "onEscapeKeyDown", "onPointerDownOutside"],
                Du = ["__scopeTooltip"];

            function Mu(e) {
                return function(e) {
                    if (Array.isArray(e)) return Lu(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && Symbol.iterator in Object(e)) return Array.from(e)
                }(e) || Bu(e) || function() {
                    throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function Uu(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var r = [],
                        n = !0,
                        o = !1,
                        i = void 0;
                    try {
                        for (var a, u = e[Symbol.iterator](); !(n = (a = u.next()).done) && (r.push(a.value), !t || r.length !== t); n = !0);
                    } catch (e) {
                        o = !0, i = e
                    } finally {
                        try {
                            n || null == u.return || u.return()
                        } finally {
                            if (o) throw i
                        }
                    }
                    return r
                }(e, t) || Bu(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function Bu(e, t) {
                if (e) {
                    if ("string" == typeof e) return Lu(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    return "Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r ? Array.from(e) : "Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r) ? Lu(e, t) : void 0
                }
            }

            function Lu(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = new Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function Wu(e, t) {
                var r = Object.keys(e);
                if (Object.getOwnPropertySymbols) {
                    var n = Object.getOwnPropertySymbols(e);
                    t && (n = n.filter((function(t) {
                        return Object.getOwnPropertyDescriptor(e, t).enumerable
                    }))), r.push.apply(r, n)
                }
                return r
            }

            function Gu(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {};
                    t % 2 ? Wu(Object(r), !0).forEach((function(t) {
                        zu(e, t, r[t])
                    })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(r)) : Wu(Object(r)).forEach((function(t) {
                        Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(r, t))
                    }))
                }
                return e
            }

            function zu(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function Vu(e, t) {
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
                    for (n = 0; n < i.length; n++) r = i[n], t.indexOf(r) >= 0 || Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r])
                }
                return o
            }
            var qu = n.forwardRef((function(e, t) {
                var r = e.children,
                    o = Vu(e, Eu),
                    i = n.Children.toArray(r),
                    a = i.find(Ju);
                if (a) {
                    var u = a.props.children,
                        c = i.map((function(e) {
                            return e === a ? n.Children.count(u) > 1 ? n.Children.only(null) : n.isValidElement(u) ? u.props.children : null : e
                        }));
                    return (0, L.jsx)($u, Gu(Gu({}, o), {}, {
                        ref: t,
                        children: n.isValidElement(u) ? n.cloneElement(u, void 0, c) : null
                    }))
                }
                return (0, L.jsx)($u, Gu(Gu({}, o), {}, {
                    ref: t,
                    children: r
                }))
            }));
            qu.displayName = "Slot";
            var $u = n.forwardRef((function(e, t) {
                var r = e.children,
                    o = Vu(e, Ou);
                if (n.isValidElement(r)) {
                    var i = function(e) {
                        var t, r, n = null === (t = Object.getOwnPropertyDescriptor(e.props, "ref")) || void 0 === t ? void 0 : t.get,
                            o = n && "isReactWarning" in n && n.isReactWarning;
                        return o ? e.ref : (o = (n = null === (r = Object.getOwnPropertyDescriptor(e, "ref")) || void 0 === r ? void 0 : r.get) && "isReactWarning" in n && n.isReactWarning) ? e.props.ref : e.props.ref || e.ref
                    }(r);
                    return n.cloneElement(r, Gu(Gu({}, function(e, t) {
                        var r = Gu({}, t),
                            n = function(n) {
                                var o = e[n],
                                    i = t[n];
                                /^on[A-Z]/.test(n) ? o && i ? r[n] = function() {
                                    i.apply(void 0, arguments), o.apply(void 0, arguments)
                                } : o && (r[n] = o) : "style" === n ? r[n] = Gu(Gu({}, o), i) : "className" === n && (r[n] = [o, i].filter(Boolean).join(" "))
                            };
                        for (var o in t) n(o);
                        return Gu(Gu({}, e), r)
                    }(o, r.props)), {}, {
                        ref: t ? yu(t, i) : i
                    }))
                }
                return n.Children.count(r) > 1 ? n.Children.only(null) : null
            }));
            $u.displayName = "SlotClone";
            var Hu = function(e) {
                var t = e.children;
                return (0, L.jsx)(L.Fragment, {
                    children: t
                })
            };

            function Ju(e) {
                return n.isValidElement(e) && e.type === Hu
            }
            var Xu, Ku = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((function(e, t) {
                    var r = n.forwardRef((function(e, r) {
                        var n = e.asChild,
                            o = Vu(e, Pu),
                            i = n ? qu : t;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, L.jsx)(i, Gu(Gu({}, o), {}, {
                            ref: r
                        }))
                    }));
                    return r.displayName = "Primitive.".concat(t), Gu(Gu({}, e), {}, zu({}, t, r))
                }), {}),
                Yu = "dismissableLayer.update",
                Zu = n.createContext({
                    layers: new Set,
                    layersWithOutsidePointerEventsDisabled: new Set,
                    branches: new Set
                }),
                Qu = n.forwardRef((function(e, t) {
                    var r, o = e.disableOutsidePointerEvents,
                        i = void 0 !== o && o,
                        a = e.onEscapeKeyDown,
                        u = e.onPointerDownOutside,
                        c = e.onFocusOutside,
                        l = e.onInteractOutside,
                        s = e.onDismiss,
                        f = Vu(e, ju),
                        p = n.useContext(Zu),
                        d = Uu(n.useState(null), 2),
                        y = d[0],
                        v = d[1],
                        m = null !== (r = null == y ? void 0 : y.ownerDocument) && void 0 !== r ? r : null === globalThis || void 0 === globalThis ? void 0 : globalThis.document,
                        h = Uu(n.useState({}), 2)[1],
                        g = vu(t, (function(e) {
                            return v(e)
                        })),
                        b = Array.from(p.layers),
                        w = Uu(Mu(p.layersWithOutsidePointerEventsDisabled).slice(-1), 1)[0],
                        S = b.indexOf(w),
                        A = y ? b.indexOf(y) : -1,
                        x = p.layersWithOutsidePointerEventsDisabled.size > 0,
                        E = A >= S,
                        O = function(e) {
                            var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null === globalThis || void 0 === globalThis ? void 0 : globalThis.document,
                                r = bu(e),
                                o = n.useRef(!1),
                                i = n.useRef((function() {}));
                            return n.useEffect((function() {
                                var e = function(e) {
                                        if (e.target && !o.current) {
                                            var n = function() {
                                                    tc("dismissableLayer.pointerDownOutside", r, a, {
                                                        discrete: !0
                                                    })
                                                },
                                                a = {
                                                    originalEvent: e
                                                };
                                            "touch" === e.pointerType ? (t.removeEventListener("click", i.current), i.current = n, t.addEventListener("click", i.current, {
                                                once: !0
                                            })) : n()
                                        } else t.removeEventListener("click", i.current);
                                        o.current = !1
                                    },
                                    n = window.setTimeout((function() {
                                        t.addEventListener("pointerdown", e)
                                    }), 0);
                                return function() {
                                    window.clearTimeout(n), t.removeEventListener("pointerdown", e), t.removeEventListener("click", i.current)
                                }
                            }), [t, r]), {
                                onPointerDownCapture: function() {
                                    return o.current = !0
                                }
                            }
                        }((function(e) {
                            var t = e.target,
                                r = Mu(p.branches).some((function(e) {
                                    return e.contains(t)
                                }));
                            E && !r && (null != u && u(e), null != l && l(e), e.defaultPrevented || null == s || s())
                        }), m),
                        P = function(e) {
                            var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null === globalThis || void 0 === globalThis ? void 0 : globalThis.document,
                                r = bu(e),
                                o = n.useRef(!1);
                            return n.useEffect((function() {
                                var e = function(e) {
                                    e.target && !o.current && tc("dismissableLayer.focusOutside", r, {
                                        originalEvent: e
                                    }, {
                                        discrete: !1
                                    })
                                };
                                return t.addEventListener("focusin", e),
                                    function() {
                                        return t.removeEventListener("focusin", e)
                                    }
                            }), [t, r]), {
                                onFocusCapture: function() {
                                    return o.current = !0
                                },
                                onBlurCapture: function() {
                                    return o.current = !1
                                }
                            }
                        }((function(e) {
                            var t = e.target;
                            Mu(p.branches).some((function(e) {
                                return e.contains(t)
                            })) || (null != c && c(e), null != l && l(e), e.defaultPrevented || null == s || s())
                        }), m);
                    return function(e) {
                        var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null === globalThis || void 0 === globalThis ? void 0 : globalThis.document,
                            r = bu(e);
                        n.useEffect((function() {
                            var e = function(e) {
                                "Escape" === e.key && r(e)
                            };
                            return t.addEventListener("keydown", e, {
                                    capture: !0
                                }),
                                function() {
                                    return t.removeEventListener("keydown", e, {
                                        capture: !0
                                    })
                                }
                        }), [r, t])
                    }((function(e) {
                        A === p.layers.size - 1 && (null != a && a(e), !e.defaultPrevented && s && (e.preventDefault(), s()))
                    }), m), n.useEffect((function() {
                        if (y) return i && (0 === p.layersWithOutsidePointerEventsDisabled.size && (Xu = m.body.style.pointerEvents, m.body.style.pointerEvents = "none"), p.layersWithOutsidePointerEventsDisabled.add(y)), p.layers.add(y), ec(),
                            function() {
                                i && 1 === p.layersWithOutsidePointerEventsDisabled.size && (m.body.style.pointerEvents = Xu)
                            }
                    }), [y, m, i, p]), n.useEffect((function() {
                        return function() {
                            y && (p.layers.delete(y), p.layersWithOutsidePointerEventsDisabled.delete(y), ec())
                        }
                    }), [y, p]), n.useEffect((function() {
                        var e = function() {
                            return h({})
                        };
                        return document.addEventListener(Yu, e),
                            function() {
                                return document.removeEventListener(Yu, e)
                            }
                    }), []), (0, L.jsx)(Ku.div, Gu(Gu({}, f), {}, {
                        ref: g,
                        style: Gu({
                            pointerEvents: x ? E ? "auto" : "none" : void 0
                        }, e.style),
                        onFocusCapture: gu(e.onFocusCapture, P.onFocusCapture),
                        onBlurCapture: gu(e.onBlurCapture, P.onBlurCapture),
                        onPointerDownCapture: gu(e.onPointerDownCapture, O.onPointerDownCapture)
                    }))
                }));

            function ec() {
                var e = new CustomEvent(Yu);
                document.dispatchEvent(e)
            }

            function tc(e, t, r, n) {
                var o = n.discrete,
                    a = r.originalEvent.target,
                    u = new CustomEvent(e, {
                        bubbles: !1,
                        cancelable: !0,
                        detail: r
                    });
                t && a.addEventListener(e, t, {
                    once: !0
                }), o ? function(e, t) {
                    e && i.flushSync((function() {
                        return e.dispatchEvent(t)
                    }))
                }(a, u) : a.dispatchEvent(u)
            }
            Qu.displayName = "DismissableLayer", n.forwardRef((function(e, t) {
                var r = n.useContext(Zu),
                    o = n.useRef(null),
                    i = vu(t, o);
                return n.useEffect((function() {
                    var e = o.current;
                    if (e) return r.branches.add(e),
                        function() {
                            r.branches.delete(e)
                        }
                }), [r.branches]), (0, L.jsx)(Ku.div, Gu(Gu({}, e), {}, {
                    ref: i
                }))
            })).displayName = "DismissableLayerBranch";
            var rc = n["useId".toString()] || function() {},
                nc = 0,
                oc = n.forwardRef((function(e, t) {
                    var r = e.children,
                        n = e.width,
                        o = void 0 === n ? 10 : n,
                        i = e.height,
                        a = void 0 === i ? 5 : i,
                        u = Vu(e, Ru);
                    return (0, L.jsx)(Ku.svg, Gu(Gu({}, u), {}, {
                        ref: t,
                        width: o,
                        height: a,
                        viewBox: "0 0 30 10",
                        preserveAspectRatio: "none",
                        children: e.asChild ? r : (0, L.jsx)("polygon", {
                            points: "0,0 30,0 15,10"
                        })
                    }))
                }));
            oc.displayName = "Arrow";
            var ic = oc,
                ac = "Popper",
                uc = Uu(mu(ac), 2),
                cc = uc[0],
                lc = uc[1],
                sc = Uu(cc(ac), 2),
                fc = sc[0],
                pc = sc[1],
                dc = function(e) {
                    var t = e.__scopePopper,
                        r = e.children,
                        o = Uu(n.useState(null), 2),
                        i = o[0],
                        a = o[1];
                    return (0, L.jsx)(fc, {
                        scope: t,
                        anchor: i,
                        onAnchorChange: a,
                        children: r
                    })
                };
            dc.displayName = ac;
            var yc = "PopperAnchor",
                vc = n.forwardRef((function(e, t) {
                    var r = e.__scopePopper,
                        o = e.virtualRef,
                        i = Vu(e, Iu),
                        a = pc(yc, r),
                        u = n.useRef(null),
                        c = vu(t, u);
                    return n.useEffect((function() {
                        a.onAnchorChange((null == o ? void 0 : o.current) || u.current)
                    })), o ? null : (0, L.jsx)(Ku.div, Gu(Gu({}, i), {}, {
                        ref: c
                    }))
                }));
            vc.displayName = yc;
            var mc = "PopperContent",
                hc = Uu(cc(mc), 2),
                gc = hc[0],
                bc = hc[1],
                wc = n.forwardRef((function(e, t) {
                    var r, o, i, a, u, c, l, s, f = e.__scopePopper,
                        p = e.side,
                        d = void 0 === p ? "bottom" : p,
                        y = e.sideOffset,
                        v = void 0 === y ? 0 : y,
                        m = e.align,
                        h = void 0 === m ? "center" : m,
                        g = e.alignOffset,
                        b = void 0 === g ? 0 : g,
                        w = e.arrowPadding,
                        S = void 0 === w ? 0 : w,
                        A = e.avoidCollisions,
                        x = void 0 === A || A,
                        E = e.collisionBoundary,
                        O = void 0 === E ? [] : E,
                        P = e.collisionPadding,
                        j = void 0 === P ? 0 : P,
                        R = e.sticky,
                        I = void 0 === R ? "partial" : R,
                        C = e.hideWhenDetached,
                        k = void 0 !== C && C,
                        F = e.updatePositionStrategy,
                        N = void 0 === F ? "optimized" : F,
                        T = e.onPlaced,
                        _ = Vu(e, Cu),
                        D = pc(mc, f),
                        M = Uu(n.useState(null), 2),
                        U = M[0],
                        B = M[1],
                        W = vu(t, (function(e) {
                            return B(e)
                        })),
                        G = Uu(n.useState(null), 2),
                        z = G[0],
                        V = G[1],
                        q = function(e) {
                            var t = iu(n.useState(void 0), 2),
                                r = t[0],
                                o = t[1];
                            return wu((function() {
                                if (e) {
                                    o({
                                        width: e.offsetWidth,
                                        height: e.offsetHeight
                                    });
                                    var t = new ResizeObserver((function(t) {
                                        if (Array.isArray(t) && t.length) {
                                            var r, n, i = t[0];
                                            if ("borderBoxSize" in i) {
                                                var a = i.borderBoxSize,
                                                    u = Array.isArray(a) ? a[0] : a;
                                                r = u.inlineSize, n = u.blockSize
                                            } else r = e.offsetWidth, n = e.offsetHeight;
                                            o({
                                                width: r,
                                                height: n
                                            })
                                        }
                                    }));
                                    return t.observe(e, {
                                            box: "border-box"
                                        }),
                                        function() {
                                            return t.unobserve(e)
                                        }
                                }
                                o(void 0)
                            }), [e]), r
                        }(z),
                        $ = null !== (r = null == q ? void 0 : q.width) && void 0 !== r ? r : 0,
                        H = null !== (o = null == q ? void 0 : q.height) && void 0 !== o ? o : 0,
                        J = d + ("center" !== h ? "-" + h : ""),
                        X = "number" == typeof j ? j : Gu({
                            top: 0,
                            right: 0,
                            bottom: 0,
                            left: 0
                        }, j),
                        K = Array.isArray(O) ? O : [O],
                        Y = K.length > 0,
                        Z = {
                            padding: X,
                            boundary: K.filter(Ec),
                            altBoundary: Y
                        },
                        Q = kn({
                            strategy: "fixed",
                            placement: J,
                            whileElementsMounted: function() {
                                for (var e = arguments.length, t = new Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                return xn.apply(void 0, t.concat([{
                                    animationFrame: "always" === N
                                }]))
                            },
                            elements: {
                                reference: D.anchor
                            },
                            middleware: [Fn({
                                mainAxis: v + H,
                                alignmentAxis: b
                            }), x && Nn(Gu({
                                mainAxis: !0,
                                crossAxis: !1,
                                limiter: "partial" === I ? Tn() : void 0
                            }, Z)), x && _n(Gu({}, Z)), Dn(Gu(Gu({}, Z), {}, {
                                apply: function(e) {
                                    var t = e.elements,
                                        r = e.rects,
                                        n = e.availableWidth,
                                        o = e.availableHeight,
                                        i = r.reference,
                                        a = i.width,
                                        u = i.height,
                                        c = t.floating.style;
                                    c.setProperty("--radix-popper-available-width", "".concat(n, "px")), c.setProperty("--radix-popper-available-height", "".concat(o, "px")), c.setProperty("--radix-popper-anchor-width", "".concat(a, "px")), c.setProperty("--radix-popper-anchor-height", "".concat(u, "px"))
                                }
                            })), z && Un({
                                element: z,
                                padding: S
                            }), Oc({
                                arrowWidth: $,
                                arrowHeight: H
                            }), k && Mn(Gu({
                                strategy: "referenceHidden"
                            }, Z))]
                        }),
                        ee = Q.refs,
                        te = Q.floatingStyles,
                        re = Q.placement,
                        ne = Q.isPositioned,
                        oe = Q.middlewareData,
                        ie = Uu(Pc(re), 2),
                        ae = ie[0],
                        ue = ie[1],
                        ce = bu(T);
                    wu((function() {
                        ne && (null == ce || ce())
                    }), [ne, ce]);
                    var le = null === (i = oe.arrow) || void 0 === i ? void 0 : i.x,
                        se = null === (a = oe.arrow) || void 0 === a ? void 0 : a.y,
                        fe = 0 !== (null === (u = oe.arrow) || void 0 === u ? void 0 : u.centerOffset),
                        pe = Uu(n.useState(), 2),
                        de = pe[0],
                        ye = pe[1];
                    return wu((function() {
                        U && ye(window.getComputedStyle(U).zIndex)
                    }), [U]), (0, L.jsx)("div", {
                        ref: ee.setFloating,
                        "data-radix-popper-content-wrapper": "",
                        style: Gu(Gu({}, te), {}, {
                            transform: ne ? te.transform : "translate(0, -200%)",
                            minWidth: "max-content",
                            zIndex: de,
                            "--radix-popper-transform-origin": [null === (c = oe.transformOrigin) || void 0 === c ? void 0 : c.x, null === (l = oe.transformOrigin) || void 0 === l ? void 0 : l.y].join(" ")
                        }, (null === (s = oe.hide) || void 0 === s ? void 0 : s.referenceHidden) && {
                            visibility: "hidden",
                            pointerEvents: "none"
                        }),
                        dir: e.dir,
                        children: (0, L.jsx)(gc, {
                            scope: f,
                            placedSide: ae,
                            onArrowChange: V,
                            arrowX: le,
                            arrowY: se,
                            shouldHideArrow: fe,
                            children: (0, L.jsx)(Ku.div, Gu(Gu({
                                "data-side": ae,
                                "data-align": ue
                            }, _), {}, {
                                ref: W,
                                style: Gu(Gu({}, _.style), {}, {
                                    animation: ne ? void 0 : "none"
                                })
                            }))
                        })
                    })
                }));
            wc.displayName = mc;
            var Sc = "PopperArrow",
                Ac = {
                    top: "bottom",
                    right: "left",
                    bottom: "top",
                    left: "right"
                },
                xc = n.forwardRef((function(e, t) {
                    var r, n = e.__scopePopper,
                        o = Vu(e, ku),
                        i = bc(Sc, n),
                        a = Ac[i.placedSide];
                    return (0, L.jsx)("span", {
                        ref: i.onArrowChange,
                        style: (r = {
                            position: "absolute",
                            left: i.arrowX,
                            top: i.arrowY
                        }, zu(r, a, 0), zu(r, "transformOrigin", {
                            top: "",
                            right: "0 0",
                            bottom: "center 0",
                            left: "100% 0"
                        } [i.placedSide]), zu(r, "transform", {
                            top: "translateY(100%)",
                            right: "translateY(50%) rotate(90deg) translateX(-50%)",
                            bottom: "rotate(180deg)",
                            left: "translateY(50%) rotate(-90deg) translateX(50%)"
                        } [i.placedSide]), zu(r, "visibility", i.shouldHideArrow ? "hidden" : void 0), r),
                        children: (0, L.jsx)(ic, Gu(Gu({}, o), {}, {
                            ref: t,
                            style: Gu(Gu({}, o.style), {}, {
                                display: "block"
                            })
                        }))
                    })
                }));

            function Ec(e) {
                return null !== e
            }
            xc.displayName = Sc;
            var Oc = function(e) {
                return {
                    name: "transformOrigin",
                    options: e,
                    fn: function(t) {
                        var r, n, o, i, a, u = t.placement,
                            c = t.rects,
                            l = t.middlewareData,
                            s = 0 !== (null === (r = l.arrow) || void 0 === r ? void 0 : r.centerOffset),
                            f = s ? 0 : e.arrowWidth,
                            p = s ? 0 : e.arrowHeight,
                            d = Uu(Pc(u), 2),
                            y = d[0],
                            v = {
                                start: "0%",
                                center: "50%",
                                end: "100%"
                            } [d[1]],
                            m = (null !== (n = null === (o = l.arrow) || void 0 === o ? void 0 : o.x) && void 0 !== n ? n : 0) + f / 2,
                            h = (null !== (i = null === (a = l.arrow) || void 0 === a ? void 0 : a.y) && void 0 !== i ? i : 0) + p / 2,
                            g = "",
                            b = "";
                        return "bottom" === y ? (g = s ? v : "".concat(m, "px"), b = -p + "px") : "top" === y ? (g = s ? v : "".concat(m, "px"), b = "".concat(c.floating.height + p, "px")) : "right" === y ? (g = -p + "px", b = s ? v : "".concat(h, "px")) : "left" === y && (g = "".concat(c.floating.width + p, "px"), b = s ? v : "".concat(h, "px")), {
                            data: {
                                x: g,
                                y: b
                            }
                        }
                    }
                }
            };

            function Pc(e) {
                var t = Uu(e.split("-"), 2),
                    r = t[0],
                    n = t[1];
                return [r, void 0 === n ? "center" : n]
            }
            var jc = dc,
                Rc = vc,
                Ic = wc,
                Cc = xc,
                kc = n.forwardRef((function(e, t) {
                    var r, o = e.container,
                        i = Vu(e, Fu),
                        u = Uu(n.useState(!1), 2),
                        c = u[0],
                        l = u[1];
                    wu((function() {
                        return l(!0)
                    }), []);
                    var s = o || c && (null === globalThis || void 0 === globalThis || null === (r = globalThis.document) || void 0 === r ? void 0 : r.body);
                    return s ? a().createPortal((0, L.jsx)(Ku.div, Gu(Gu({}, i), {}, {
                        ref: t
                    })), s) : null
                }));
            kc.displayName = "Portal";
            var Fc = n.forwardRef((function(e, t) {
                return (0, L.jsx)(Ku.span, Gu(Gu({}, e), {}, {
                    ref: t,
                    style: Gu({
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
                    }, e.style)
                }))
            }));
            Fc.displayName = "VisuallyHidden";
            var Nc = Fc,
                Tc = Uu(mu("Tooltip", [lc]), 2),
                _c = Tc[0],
                Dc = (Tc[1], lc()),
                Mc = "TooltipProvider",
                Uc = "tooltip.open",
                Bc = Uu(_c(Mc), 2),
                Lc = Bc[0],
                Wc = Bc[1],
                Gc = function(e) {
                    var t = e.__scopeTooltip,
                        r = e.delayDuration,
                        o = void 0 === r ? 700 : r,
                        i = e.skipDelayDuration,
                        a = void 0 === i ? 300 : i,
                        u = e.disableHoverableContent,
                        c = void 0 !== u && u,
                        l = e.children,
                        s = Uu(n.useState(!0), 2),
                        f = s[0],
                        p = s[1],
                        d = n.useRef(!1),
                        y = n.useRef(0);
                    return n.useEffect((function() {
                        var e = y.current;
                        return function() {
                            return window.clearTimeout(e)
                        }
                    }), []), (0, L.jsx)(Lc, {
                        scope: t,
                        isOpenDelayed: f,
                        delayDuration: o,
                        onOpen: n.useCallback((function() {
                            window.clearTimeout(y.current), p(!1)
                        }), []),
                        onClose: n.useCallback((function() {
                            window.clearTimeout(y.current), y.current = window.setTimeout((function() {
                                return p(!0)
                            }), a)
                        }), [a]),
                        isPointerInTransitRef: d,
                        onPointerInTransitChange: n.useCallback((function(e) {
                            d.current = e
                        }), []),
                        disableHoverableContent: c,
                        children: l
                    })
                };
            Gc.displayName = Mc;
            var zc = "Tooltip",
                Vc = Uu(_c(zc), 2),
                qc = Vc[0],
                $c = Vc[1],
                Hc = function(e) {
                    var t = e.__scopeTooltip,
                        r = e.children,
                        o = e.open,
                        i = e.defaultOpen,
                        a = void 0 !== i && i,
                        u = e.onOpenChange,
                        c = e.disableHoverableContent,
                        l = e.delayDuration,
                        s = Wc(zc, e.__scopeTooltip),
                        f = Dc(t),
                        p = Uu(n.useState(null), 2),
                        d = p[0],
                        y = p[1],
                        v = function(e) {
                            var t = Uu(n.useState(rc()), 2),
                                r = t[0],
                                o = t[1];
                            return wu((function() {
                                o((function(e) {
                                    return null != e ? e : String(nc++)
                                }))
                            }), [e]), r ? "radix-".concat(r) : ""
                        }(),
                        m = n.useRef(0),
                        h = null != c ? c : s.disableHoverableContent,
                        g = null != l ? l : s.delayDuration,
                        b = n.useRef(!1),
                        w = function(e) {
                            var t = e.prop,
                                r = e.defaultProp,
                                o = e.onChange,
                                i = void 0 === o ? function() {} : o,
                                a = function(e) {
                                    var t = e.defaultProp,
                                        r = e.onChange,
                                        o = n.useState(t),
                                        i = iu(o, 1)[0],
                                        a = n.useRef(i),
                                        u = bu(r);
                                    return n.useEffect((function() {
                                        a.current !== i && (u(i), a.current = i)
                                    }), [i, a, u]), o
                                }({
                                    defaultProp: r,
                                    onChange: i
                                }),
                                u = iu(a, 2),
                                c = u[0],
                                l = u[1],
                                s = void 0 !== t,
                                f = s ? t : c,
                                p = bu(i);
                            return [f, n.useCallback((function(e) {
                                if (s) {
                                    var r = "function" == typeof e ? e(t) : e;
                                    r !== t && p(r)
                                } else l(e)
                            }), [s, t, l, p])]
                        }({
                            prop: o,
                            defaultProp: a,
                            onChange: function(e) {
                                e ? (s.onOpen(), document.dispatchEvent(new CustomEvent(Uc))) : s.onClose(), null == u || u(e)
                            }
                        }),
                        S = Uu(w, 2),
                        A = S[0],
                        x = void 0 !== A && A,
                        E = S[1],
                        O = n.useMemo((function() {
                            return x ? b.current ? "delayed-open" : "instant-open" : "closed"
                        }), [x]),
                        P = n.useCallback((function() {
                            window.clearTimeout(m.current), m.current = 0, b.current = !1, E(!0)
                        }), [E]),
                        j = n.useCallback((function() {
                            window.clearTimeout(m.current), m.current = 0, E(!1)
                        }), [E]),
                        R = n.useCallback((function() {
                            window.clearTimeout(m.current), m.current = window.setTimeout((function() {
                                b.current = !0, E(!0), m.current = 0
                            }), g)
                        }), [g, E]);
                    return n.useEffect((function() {
                        return function() {
                            m.current && (window.clearTimeout(m.current), m.current = 0)
                        }
                    }), []), (0, L.jsx)(jc, Gu(Gu({}, f), {}, {
                        children: (0, L.jsx)(qc, {
                            scope: t,
                            contentId: v,
                            open: x,
                            stateAttribute: O,
                            trigger: d,
                            onTriggerChange: y,
                            onTriggerEnter: n.useCallback((function() {
                                s.isOpenDelayed ? R() : P()
                            }), [s.isOpenDelayed, R, P]),
                            onTriggerLeave: n.useCallback((function() {
                                h ? j() : (window.clearTimeout(m.current), m.current = 0)
                            }), [j, h]),
                            onOpen: P,
                            onClose: j,
                            disableHoverableContent: h,
                            children: r
                        })
                    }))
                };
            Hc.displayName = zc;
            var Jc = "TooltipTrigger",
                Xc = n.forwardRef((function(e, t) {
                    var r = e.__scopeTooltip,
                        o = Vu(e, Nu),
                        i = $c(Jc, r),
                        a = Wc(Jc, r),
                        u = Dc(r),
                        c = vu(t, n.useRef(null), i.onTriggerChange),
                        l = n.useRef(!1),
                        s = n.useRef(!1),
                        f = n.useCallback((function() {
                            return l.current = !1
                        }), []);
                    return n.useEffect((function() {
                        return function() {
                            return document.removeEventListener("pointerup", f)
                        }
                    }), [f]), (0, L.jsx)(Rc, Gu(Gu({
                        asChild: !0
                    }, u), {}, {
                        children: (0, L.jsx)(Ku.button, Gu(Gu({
                            "aria-describedby": i.open ? i.contentId : void 0,
                            "data-state": i.stateAttribute
                        }, o), {}, {
                            ref: c,
                            onPointerMove: gu(e.onPointerMove, (function(e) {
                                "touch" !== e.pointerType && (s.current || a.isPointerInTransitRef.current || (i.onTriggerEnter(), s.current = !0))
                            })),
                            onPointerLeave: gu(e.onPointerLeave, (function() {
                                i.onTriggerLeave(), s.current = !1
                            })),
                            onPointerDown: gu(e.onPointerDown, (function() {
                                l.current = !0, document.addEventListener("pointerup", f, {
                                    once: !0
                                })
                            })),
                            onFocus: gu(e.onFocus, (function() {
                                l.current || i.onOpen()
                            })),
                            onBlur: gu(e.onBlur, i.onClose),
                            onClick: gu(e.onClick, i.onClose)
                        }))
                    }))
                }));
            Xc.displayName = Jc;
            var Kc = "TooltipPortal",
                Yc = Uu(_c(Kc, {
                    forceMount: void 0
                }), 2),
                Zc = Yc[0],
                Qc = Yc[1],
                el = function(e) {
                    var t = e.__scopeTooltip,
                        r = e.forceMount,
                        n = e.children,
                        o = e.container,
                        i = $c(Kc, t);
                    return (0, L.jsx)(Zc, {
                        scope: t,
                        forceMount: r,
                        children: (0, L.jsx)(Su, {
                            present: r || i.open,
                            children: (0, L.jsx)(kc, {
                                asChild: !0,
                                container: o,
                                children: n
                            })
                        })
                    })
                };
            el.displayName = Kc;
            var tl = "TooltipContent",
                rl = n.forwardRef((function(e, t) {
                    var r = Qc(tl, e.__scopeTooltip),
                        n = e.forceMount,
                        o = void 0 === n ? r.forceMount : n,
                        i = e.side,
                        a = void 0 === i ? "top" : i,
                        u = Vu(e, Tu),
                        c = $c(tl, e.__scopeTooltip);
                    return (0, L.jsx)(Su, {
                        present: o || c.open,
                        children: c.disableHoverableContent ? (0, L.jsx)(ul, Gu(Gu({
                            side: a
                        }, u), {}, {
                            ref: t
                        })) : (0, L.jsx)(nl, Gu(Gu({
                            side: a
                        }, u), {}, {
                            ref: t
                        }))
                    })
                })),
                nl = n.forwardRef((function(e, t) {
                    var r = $c(tl, e.__scopeTooltip),
                        o = Wc(tl, e.__scopeTooltip),
                        i = n.useRef(null),
                        a = vu(t, i),
                        u = Uu(n.useState(null), 2),
                        c = u[0],
                        l = u[1],
                        s = r.trigger,
                        f = r.onClose,
                        p = i.current,
                        d = o.onPointerInTransitChange,
                        y = n.useCallback((function() {
                            l(null), d(!1)
                        }), [d]),
                        v = n.useCallback((function(e, t) {
                            var r = e.currentTarget,
                                n = {
                                    x: e.clientX,
                                    y: e.clientY
                                },
                                o = function(e, t) {
                                    var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : 5,
                                        n = [];
                                    switch (t) {
                                        case "top":
                                            n.push({
                                                x: e.x - r,
                                                y: e.y + r
                                            }, {
                                                x: e.x + r,
                                                y: e.y + r
                                            });
                                            break;
                                        case "bottom":
                                            n.push({
                                                x: e.x - r,
                                                y: e.y - r
                                            }, {
                                                x: e.x + r,
                                                y: e.y - r
                                            });
                                            break;
                                        case "left":
                                            n.push({
                                                x: e.x + r,
                                                y: e.y - r
                                            }, {
                                                x: e.x + r,
                                                y: e.y + r
                                            });
                                            break;
                                        case "right":
                                            n.push({
                                                x: e.x - r,
                                                y: e.y - r
                                            }, {
                                                x: e.x - r,
                                                y: e.y + r
                                            })
                                    }
                                    return n
                                }(n, function(e, t) {
                                    var r = Math.abs(t.top - e.y),
                                        n = Math.abs(t.bottom - e.y),
                                        o = Math.abs(t.right - e.x),
                                        i = Math.abs(t.left - e.x);
                                    switch (Math.min(r, n, o, i)) {
                                        case i:
                                            return "left";
                                        case o:
                                            return "right";
                                        case r:
                                            return "top";
                                        case n:
                                            return "bottom";
                                        default:
                                            throw new Error("unreachable")
                                    }
                                }(n, r.getBoundingClientRect())),
                                i = function(e) {
                                    var t = e.slice();
                                    return t.sort((function(e, t) {
                                            return e.x < t.x ? -1 : e.x > t.x ? 1 : e.y < t.y ? -1 : e.y > t.y ? 1 : 0
                                        })),
                                        function(e) {
                                            if (e.length <= 1) return e.slice();
                                            for (var t = [], r = 0; r < e.length; r++) {
                                                for (var n = e[r]; t.length >= 2;) {
                                                    var o = t[t.length - 1],
                                                        i = t[t.length - 2];
                                                    if (!((o.x - i.x) * (n.y - i.y) >= (o.y - i.y) * (n.x - i.x))) break;
                                                    t.pop()
                                                }
                                                t.push(n)
                                            }
                                            t.pop();
                                            for (var a = [], u = e.length - 1; u >= 0; u--) {
                                                for (var c = e[u]; a.length >= 2;) {
                                                    var l = a[a.length - 1],
                                                        s = a[a.length - 2];
                                                    if (!((l.x - s.x) * (c.y - s.y) >= (l.y - s.y) * (c.x - s.x))) break;
                                                    a.pop()
                                                }
                                                a.push(c)
                                            }
                                            return a.pop(), 1 === t.length && 1 === a.length && t[0].x === a[0].x && t[0].y === a[0].y ? t : t.concat(a)
                                        }(t)
                                }([].concat(Mu(o), Mu(function(e) {
                                    var t = e.top,
                                        r = e.right,
                                        n = e.bottom,
                                        o = e.left;
                                    return [{
                                        x: o,
                                        y: t
                                    }, {
                                        x: r,
                                        y: t
                                    }, {
                                        x: r,
                                        y: n
                                    }, {
                                        x: o,
                                        y: n
                                    }]
                                }(t.getBoundingClientRect()))));
                            l(i), d(!0)
                        }), [d]);
                    return n.useEffect((function() {
                        return function() {
                            return y()
                        }
                    }), [y]), n.useEffect((function() {
                        if (s && p) {
                            var e = function(e) {
                                    return v(e, p)
                                },
                                t = function(e) {
                                    return v(e, s)
                                };
                            return s.addEventListener("pointerleave", e), p.addEventListener("pointerleave", t),
                                function() {
                                    s.removeEventListener("pointerleave", e), p.removeEventListener("pointerleave", t)
                                }
                        }
                    }), [s, p, v, y]), n.useEffect((function() {
                        if (c) {
                            var e = function(e) {
                                var t = e.target,
                                    r = {
                                        x: e.clientX,
                                        y: e.clientY
                                    },
                                    n = (null == s ? void 0 : s.contains(t)) || (null == p ? void 0 : p.contains(t)),
                                    o = ! function(e, t) {
                                        for (var r = e.x, n = e.y, o = !1, i = 0, a = t.length - 1; i < t.length; a = i++) {
                                            var u = t[i].x,
                                                c = t[i].y,
                                                l = t[a].x,
                                                s = t[a].y;
                                            c > n != s > n && r < (l - u) * (n - c) / (s - c) + u && (o = !o)
                                        }
                                        return o
                                    }(r, c);
                                n ? y() : o && (y(), f())
                            };
                            return document.addEventListener("pointermove", e),
                                function() {
                                    return document.removeEventListener("pointermove", e)
                                }
                        }
                    }), [s, p, c, f, y]), (0, L.jsx)(ul, Gu(Gu({}, e), {}, {
                        ref: a
                    }))
                })),
                ol = Uu(_c(zc, {
                    isInside: !1
                }), 2),
                il = ol[0],
                al = ol[1],
                ul = n.forwardRef((function(e, t) {
                    var r = e.__scopeTooltip,
                        o = e.children,
                        i = e["aria-label"],
                        a = e.onEscapeKeyDown,
                        u = e.onPointerDownOutside,
                        c = Vu(e, _u),
                        l = $c(tl, r),
                        s = Dc(r),
                        f = l.onClose;
                    return n.useEffect((function() {
                        return document.addEventListener(Uc, f),
                            function() {
                                return document.removeEventListener(Uc, f)
                            }
                    }), [f]), n.useEffect((function() {
                        if (l.trigger) {
                            var e = function(e) {
                                var t;
                                (null === (t = e.target) || void 0 === t ? void 0 : t.contains(l.trigger)) && f()
                            };
                            return window.addEventListener("scroll", e, {
                                    capture: !0
                                }),
                                function() {
                                    return window.removeEventListener("scroll", e, {
                                        capture: !0
                                    })
                                }
                        }
                    }), [l.trigger, f]), (0, L.jsx)(Qu, {
                        asChild: !0,
                        disableOutsidePointerEvents: !1,
                        onEscapeKeyDown: a,
                        onPointerDownOutside: u,
                        onFocusOutside: function(e) {
                            return e.preventDefault()
                        },
                        onDismiss: f,
                        children: (0, L.jsxs)(Ic, Gu(Gu(Gu({
                            "data-state": l.stateAttribute
                        }, s), c), {}, {
                            ref: t,
                            style: Gu(Gu({}, c.style), {}, {
                                "--radix-tooltip-content-transform-origin": "var(--radix-popper-transform-origin)",
                                "--radix-tooltip-content-available-width": "var(--radix-popper-available-width)",
                                "--radix-tooltip-content-available-height": "var(--radix-popper-available-height)",
                                "--radix-tooltip-trigger-width": "var(--radix-popper-anchor-width)",
                                "--radix-tooltip-trigger-height": "var(--radix-popper-anchor-height)"
                            }),
                            children: [(0, L.jsx)(Hu, {
                                children: o
                            }), (0, L.jsx)(il, {
                                scope: r,
                                isInside: !0,
                                children: (0, L.jsx)(Nc, {
                                    id: l.contentId,
                                    role: "tooltip",
                                    children: i || o
                                })
                            })]
                        }))
                    })
                }));
            rl.displayName = tl;
            var cl = "TooltipArrow",
                ll = n.forwardRef((function(e, t) {
                    var r = e.__scopeTooltip,
                        n = Vu(e, Du),
                        o = Dc(r);
                    return al(cl, r).isInside ? null : (0, L.jsx)(Cc, Gu(Gu(Gu({}, o), n), {}, {
                        ref: t
                    }))
                }));
            ll.displayName = cl;
            var sl = Gc,
                fl = Hc,
                pl = Xc,
                dl = el,
                yl = rl,
                vl = ll;

            function ml(e) {
                var t = e.position,
                    r = e.hasBeak,
                    o = void 0 === r || r,
                    i = e.title,
                    a = e.description,
                    u = e.ariaLabel,
                    c = e.delayDurationMs,
                    l = void 0 === c ? 500 : c,
                    s = e.children,
                    f = e.open,
                    p = e.onOpenChange,
                    d = e.contentClassName,
                    y = Uu(t.split("-"), 2),
                    v = y[0],
                    m = y[1],
                    h = null != u ? u : "string" == typeof i && null == a ? i : void 0;
                return n.createElement(sl, {
                    delayDuration: l
                }, n.createElement(fl, {
                    open: f,
                    onOpenChange: p
                }, s, n.createElement(dl, null, n.createElement(yl, {
                    side: v,
                    align: m,
                    "aria-label": h,
                    className: B("foundation-web-portal-zindex bg-inverse-surface-0 padding-y-xsmall padding-x-small radius-small shadow-transient-low", d),
                    sideOffset: 5
                }, o && n.createElement(vl, {
                    asChild: !0
                }, n.createElement(xu, {
                    className: "content-[var(--inverse-surface-0)]"
                })), n.createElement("div", {
                    className: "flex flex-col text-truncate-split"
                }, n.createElement("div", {
                    className: "text-caption-medium content-inverse-default"
                }, i), a && n.createElement("div", {
                    className: "text-body-small padding-top-xsmall content-inverse-default max-width-[calc(var(--size-100)*50)]"
                }, a))))))
            }

            function hl(e) {
                var t = e.children,
                    r = e.asChild,
                    o = e.className;
                return n.createElement(pl, {
                    asChild: r,
                    className: o
                }, t)
            }
            var gl = function(e) {
                    var t = e.title,
                        r = e.description,
                        n = e.position,
                        i = void 0 === n ? "top-center" : n;
                    return o().createElement(ml, {
                        position: i,
                        title: t,
                        description: r
                    }, o().createElement(hl, {
                        asChild: !0
                    }, o().createElement("span", {
                        role: "button",
                        tabIndex: 0,
                        "aria-label": t,
                        className: "flex items-center content-muted",
                        "data-testid": "label-tooltip-trigger"
                    }, o().createElement(nu, {
                        name: "icon-regular-circle-i",
                        size: "Small"
                    }))))
                },
                bl = {
                    Standard: "bg-none",
                    Contrast: "bg-shift-200",
                    Utility: "bg-none"
                },
                wl = {
                    Standard: "stroke-standard",
                    Contrast: "stroke-none",
                    Utility: "stroke-none"
                },
                Sl = ["children"],
                Al = ["children"],
                xl = ["asChild"],
                El = ["scope", "children"],
                Ol = ["__scopeSelect", "disabled"],
                Pl = ["__scopeSelect", "className", "style", "children", "placeholder"],
                jl = ["__scopeSelect", "children"],
                Rl = ["__scopeSelect", "position", "onCloseAutoFocus", "onEscapeKeyDown", "onPointerDownOutside", "side", "sideOffset", "align", "alignOffset", "arrowPadding", "collisionBoundary", "collisionPadding", "sticky", "hideWhenDetached", "avoidCollisions"],
                Il = ["__scopeSelect", "onPlaced"],
                Cl = ["__scopeSelect", "align", "collisionPadding"],
                kl = ["__scopeSelect", "nonce"],
                Fl = ["__scopeSelect"],
                Nl = ["__scopeSelect"],
                Tl = ["__scopeSelect", "value", "disabled", "textValue"],
                _l = ["__scopeSelect", "className", "style"],
                Dl = ["__scopeSelect"],
                Ml = ["__scopeSelect", "onAutoScroll"],
                Ul = ["__scopeSelect"],
                Bl = ["__scopeSelect"],
                Ll = ["value"];

            function Wl(e) {
                return function(e) {
                    if (Array.isArray(e)) return $l(e)
                }(e) || Gl(e) || ql(e) || function() {
                    throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function Gl(e) {
                if ("undefined" != typeof Symbol && Symbol.iterator in Object(e)) return Array.from(e)
            }

            function zl(e, t) {
                return Hl(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var r = [],
                        n = !0,
                        o = !1,
                        i = void 0;
                    try {
                        for (var a, u = e[Symbol.iterator](); !(n = (a = u.next()).done) && (r.push(a.value), !t || r.length !== t); n = !0);
                    } catch (e) {
                        o = !0, i = e
                    } finally {
                        try {
                            n || null == u.return || u.return()
                        } finally {
                            if (o) throw i
                        }
                    }
                    return r
                }(e, t) || ql(e, t) || Vl()
            }

            function Vl() {
                throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function ql(e, t) {
                if (e) {
                    if ("string" == typeof e) return $l(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    return "Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r ? Array.from(e) : "Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r) ? $l(e, t) : void 0
                }
            }

            function $l(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = new Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function Hl(e) {
                if (Array.isArray(e)) return e
            }

            function Jl(e, t) {
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
                    for (n = 0; n < i.length; n++) r = i[n], t.indexOf(r) >= 0 || Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r])
                }
                return o
            }

            function Xl(e, t) {
                var r = Object.keys(e);
                if (Object.getOwnPropertySymbols) {
                    var n = Object.getOwnPropertySymbols(e);
                    t && (n = n.filter((function(t) {
                        return Object.getOwnPropertyDescriptor(e, t).enumerable
                    }))), r.push.apply(r, n)
                }
                return r
            }

            function Kl(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {};
                    t % 2 ? Xl(Object(r), !0).forEach((function(t) {
                        Yl(e, t, r[t])
                    })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(r)) : Xl(Object(r)).forEach((function(t) {
                        Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(r, t))
                    }))
                }
                return e
            }

            function Yl(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function Zl(e, t) {
                var r = (arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {}).checkForDefaultPrevented,
                    n = void 0 === r || r;
                return function(r) {
                    if (null != e && e(r), !1 === n || !r.defaultPrevented) return null == t ? void 0 : t(r)
                }
            }

            function Ql(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function es() {
                for (var e = arguments.length, t = new Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return function(e) {
                    var r = !1,
                        n = t.map((function(t) {
                            var n = Ql(t, e);
                            return r || "function" != typeof n || (r = !0), n
                        }));
                    if (r) return function() {
                        for (var e = 0; e < n.length; e++) {
                            var r = n[e];
                            "function" == typeof r ? r() : Ql(t[e], null)
                        }
                    }
                }
            }

            function ts() {
                for (var e = arguments.length, t = new Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return n.useCallback(es.apply(void 0, t), t)
            }

            function rs() {
                for (var e = arguments.length, t = new Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                var o = t[0];
                if (1 === t.length) return o;
                var i = function() {
                    var e = t.map((function(e) {
                        return {
                            useScope: e(),
                            scopeName: e.scopeName
                        }
                    }));
                    return function(t) {
                        var r = e.reduce((function(e, r) {
                            var n = r.useScope,
                                o = r.scopeName;
                            return Kl(Kl({}, e), n(t)["__scope".concat(o)])
                        }), {});
                        return n.useMemo((function() {
                            return Yl({}, "__scope".concat(o.scopeName), r)
                        }), [r])
                    }
                };
                return i.scopeName = o.scopeName, i
            }

            function ns(e) {
                var t = function(e) {
                        var t = n.forwardRef((function(e, t) {
                            var r = e.children,
                                o = Jl(e, Al);
                            if (n.isValidElement(r)) {
                                var i = function(e) {
                                        var t, r, n = null === (t = Object.getOwnPropertyDescriptor(e.props, "ref")) || void 0 === t ? void 0 : t.get,
                                            o = n && "isReactWarning" in n && n.isReactWarning;
                                        return o ? e.ref : (o = (n = null === (r = Object.getOwnPropertyDescriptor(e, "ref")) || void 0 === r ? void 0 : r.get) && "isReactWarning" in n && n.isReactWarning) ? e.props.ref : e.props.ref || e.ref
                                    }(r),
                                    a = function(e, t) {
                                        var r = Kl({}, t),
                                            n = function(n) {
                                                var o = e[n],
                                                    i = t[n];
                                                /^on[A-Z]/.test(n) ? o && i ? r[n] = function() {
                                                    i.apply(void 0, arguments), o.apply(void 0, arguments)
                                                } : o && (r[n] = o) : "style" === n ? r[n] = Kl(Kl({}, o), i) : "className" === n && (r[n] = [o, i].filter(Boolean).join(" "))
                                            };
                                        for (var o in t) n(o);
                                        return Kl(Kl({}, e), r)
                                    }(o, r.props);
                                return r.type !== n.Fragment && (a.ref = t ? es(t, i) : i), n.cloneElement(r, a)
                            }
                            return n.Children.count(r) > 1 ? n.Children.only(null) : null
                        }));
                        return t.displayName = "".concat(e, ".SlotClone"), t
                    }(e),
                    r = n.forwardRef((function(e, r) {
                        var o = e.children,
                            i = Jl(e, Sl),
                            a = n.Children.toArray(o),
                            u = a.find(is);
                        if (u) {
                            var c = u.props.children,
                                l = a.map((function(e) {
                                    return e === u ? n.Children.count(c) > 1 ? n.Children.only(null) : n.isValidElement(c) ? c.props.children : null : e
                                }));
                            return (0, L.jsx)(t, Kl(Kl({}, i), {}, {
                                ref: r,
                                children: n.isValidElement(c) ? n.cloneElement(c, void 0, l) : null
                            }))
                        }
                        return (0, L.jsx)(t, Kl(Kl({}, i), {}, {
                            ref: r,
                            children: o
                        }))
                    }));
                return r.displayName = "".concat(e, ".Slot"), r
            }
            var os = Symbol("radix.slottable");

            function is(e) {
                return n.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === os
            }
            var as = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((function(e, t) {
                var r = ns("Primitive.".concat(t)),
                    o = n.forwardRef((function(e, n) {
                        var o = e.asChild,
                            i = Jl(e, xl),
                            a = o ? r : t;
                        return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, L.jsx)(a, Kl(Kl({}, i), {}, {
                            ref: n
                        }))
                    }));
                return o.displayName = "Primitive.".concat(t), Kl(Kl({}, e), {}, Yl({}, t, o))
            }), {});

            function us(e) {
                var t = n.useRef(e);
                return n.useEffect((function() {
                    t.current = e
                })), n.useMemo((function() {
                    return function() {
                        for (var e, r = arguments.length, n = new Array(r), o = 0; o < r; o++) n[o] = arguments[o];
                        return null === (e = t.current) || void 0 === e ? void 0 : e.call.apply(e, [t].concat(n))
                    }
                }), [])
            }

            function cs(e) {
                var t = e.prop,
                    r = e.defaultProp,
                    o = e.onChange,
                    i = void 0 === o ? function() {} : o,
                    a = function(e) {
                        var t = e.defaultProp,
                            r = e.onChange,
                            o = n.useState(t),
                            i = zl(o, 1)[0],
                            a = n.useRef(i),
                            u = us(r);
                        return n.useEffect((function() {
                            a.current !== i && (u(i), a.current = i)
                        }), [i, a, u]), o
                    }({
                        defaultProp: r,
                        onChange: i
                    }),
                    u = zl(a, 2),
                    c = u[0],
                    l = u[1],
                    s = void 0 !== t,
                    f = s ? t : c,
                    p = us(i);
                return [f, n.useCallback((function(e) {
                    if (s) {
                        var r = "function" == typeof e ? e(t) : e;
                        r !== t && p(r)
                    } else l(e)
                }), [s, t, l, p])]
            }
            var ls = null !== globalThis && void 0 !== globalThis && globalThis.document ? n.useLayoutEffect : function() {},
                ss = n.forwardRef((function(e, t) {
                    return (0, L.jsx)(as.span, Kl(Kl({}, e), {}, {
                        ref: t,
                        style: Kl({
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
                        }, e.style)
                    }))
                }));
            ss.displayName = "VisuallyHidden";
            var fs = [" ", "Enter", "ArrowUp", "ArrowDown"],
                ps = [" ", "Enter"],
                ds = "Select",
                ys = function(e) {
                    var t = e + "CollectionProvider",
                        r = function(e) {
                            var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                                r = [],
                                o = function() {
                                    var t = r.map((function(e) {
                                        return n.createContext(e)
                                    }));
                                    return function(r) {
                                        var o = (null == r ? void 0 : r[e]) || t;
                                        return n.useMemo((function() {
                                            return qa({}, "__scope".concat(e), Va(Va({}, r), {}, qa({}, e, o)))
                                        }), [r, o])
                                    }
                                };
                            return o.scopeName = e, [function(t, o) {
                                var i = n.createContext(o),
                                    a = r.length;
                                r = [].concat(Ua(r), [o]);
                                var u = function(t) {
                                    var r, o = t.scope,
                                        u = t.children,
                                        c = Ga(t, Da),
                                        l = (null == o || null === (r = o[e]) || void 0 === r ? void 0 : r[a]) || i,
                                        s = n.useMemo((function() {
                                            return c
                                        }), Object.values(c));
                                    return (0, L.jsx)(l.Provider, {
                                        value: s,
                                        children: u
                                    })
                                };
                                return u.displayName = t + "Provider", [u, function(r, u) {
                                    var c, l = (null == u || null === (c = u[e]) || void 0 === c ? void 0 : c[a]) || i,
                                        s = n.useContext(l);
                                    if (s) return s;
                                    if (void 0 !== o) return o;
                                    throw new Error("`".concat(r, "` must be used within `").concat(t, "`"))
                                }]
                            }, $a.apply(void 0, [o].concat(Ua(t)))]
                        }(t),
                        i = Ba(r, 2),
                        a = i[0],
                        u = i[1],
                        c = Ba(a(t, {
                            collectionRef: {
                                current: null
                            },
                            itemMap: new Map
                        }), 2),
                        l = c[0],
                        s = c[1],
                        f = function(e) {
                            var t = e.scope,
                                r = e.children,
                                n = o().useRef(null),
                                i = o().useRef(new Map).current;
                            return (0, L.jsx)(l, {
                                scope: t,
                                itemMap: i,
                                collectionRef: n,
                                children: r
                            })
                        };
                    f.displayName = t;
                    var p = e + "CollectionSlot",
                        d = Ka(p),
                        y = o().forwardRef((function(e, t) {
                            var r = e.scope,
                                n = e.children,
                                o = Xa(t, s(p, r).collectionRef);
                            return (0, L.jsx)(d, {
                                ref: o,
                                children: n
                            })
                        }));
                    y.displayName = p;
                    var v = e + "CollectionItemSlot",
                        m = "data-radix-collection-item",
                        h = Ka(v),
                        g = o().forwardRef((function(e, t) {
                            var r, n = e.scope,
                                i = e.children,
                                a = Ga(e, Ma),
                                u = o().useRef(null),
                                c = Xa(t, u),
                                l = s(v, n);
                            return o().useEffect((function() {
                                return l.itemMap.set(u, Va({
                                        ref: u
                                    }, a)),
                                    function() {
                                        l.itemMap.delete(u)
                                    }
                            })), (0, L.jsx)(h, (qa(r = {}, m, ""), qa(r, "ref", c), qa(r, "children", i), r))
                        }));
                    return g.displayName = v, [{
                        Provider: f,
                        Slot: y,
                        ItemSlot: g
                    }, function(t) {
                        var r = s(e + "CollectionConsumer", t);
                        return o().useCallback((function() {
                            var e = r.collectionRef.current;
                            if (!e) return [];
                            var t = Array.from(e.querySelectorAll("[".concat(m, "]")));
                            return Array.from(r.itemMap.values()).sort((function(e, r) {
                                return t.indexOf(e.ref.current) - t.indexOf(r.ref.current)
                            }))
                        }), [r.collectionRef, r.itemMap])
                    }, u]
                }(ds),
                vs = zl(ys, 3),
                ms = vs[0],
                hs = vs[1],
                gs = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        r = [],
                        o = function() {
                            var t = r.map((function(e) {
                                return n.createContext(e)
                            }));
                            return function(r) {
                                var o = (null == r ? void 0 : r[e]) || t;
                                return n.useMemo((function() {
                                    return Yl({}, "__scope".concat(e), Kl(Kl({}, r), {}, Yl({}, e, o)))
                                }), [r, o])
                            }
                        };
                    return o.scopeName = e, [function(t, o) {
                        var i = n.createContext(o),
                            a = r.length;
                        r = [].concat(Wl(r), [o]);
                        var u = function(t) {
                            var r, o = t.scope,
                                u = t.children,
                                c = Jl(t, El),
                                l = (null == o || null === (r = o[e]) || void 0 === r ? void 0 : r[a]) || i,
                                s = n.useMemo((function() {
                                    return c
                                }), Object.values(c));
                            return (0, L.jsx)(l.Provider, {
                                value: s,
                                children: u
                            })
                        };
                        return u.displayName = t + "Provider", [u, function(r, u) {
                            var c, l = (null == u || null === (c = u[e]) || void 0 === c ? void 0 : c[a]) || i,
                                s = n.useContext(l);
                            if (s) return s;
                            if (void 0 !== o) return o;
                            throw new Error("`".concat(r, "` must be used within `").concat(t, "`"))
                        }]
                    }, rs.apply(void 0, [o].concat(Wl(t)))]
                }(ds, [vs[2], xo]),
                bs = zl(gs, 2),
                ws = bs[0],
                Ss = (bs[1], xo()),
                As = zl(ws(ds), 2),
                xs = As[0],
                Es = As[1],
                Os = zl(ws(ds), 2),
                Ps = Os[0],
                js = Os[1],
                Rs = function(e) {
                    var t = e.__scopeSelect,
                        r = e.children,
                        o = e.open,
                        i = e.defaultOpen,
                        a = e.onOpenChange,
                        u = e.value,
                        c = e.defaultValue,
                        l = e.onValueChange,
                        s = e.dir,
                        f = e.name,
                        p = e.autoComplete,
                        d = e.disabled,
                        y = e.required,
                        v = e.form,
                        m = Ss(t),
                        h = zl(n.useState(null), 2),
                        g = h[0],
                        b = h[1],
                        w = zl(n.useState(null), 2),
                        S = w[0],
                        A = w[1],
                        x = zl(n.useState(!1), 2),
                        E = x[0],
                        O = x[1],
                        P = eu(s),
                        j = zl(cs({
                            prop: o,
                            defaultProp: i,
                            onChange: a
                        }), 2),
                        R = j[0],
                        I = void 0 !== R && R,
                        C = j[1],
                        k = zl(cs({
                            prop: u,
                            defaultProp: c,
                            onChange: l
                        }), 2),
                        F = k[0],
                        N = k[1],
                        T = n.useRef(null),
                        _ = !g || v || !!g.closest("form"),
                        D = zl(n.useState(new Set), 2),
                        M = D[0],
                        U = D[1],
                        B = Array.from(M).map((function(e) {
                            return e.props.value
                        })).join(";");
                    return (0, L.jsx)(Wo, Kl(Kl({}, m), {}, {
                        children: (0, L.jsxs)(xs, {
                            required: y,
                            scope: t,
                            trigger: g,
                            onTriggerChange: b,
                            valueNode: S,
                            onValueNodeChange: A,
                            valueNodeHasChildren: E,
                            onValueNodeHasChildrenChange: O,
                            contentId: Gt(),
                            value: F,
                            onValueChange: N,
                            open: I,
                            onOpenChange: C,
                            dir: P,
                            triggerPointerDownPosRef: T,
                            disabled: d,
                            children: [(0, L.jsx)(ms.Provider, {
                                scope: t,
                                children: (0, L.jsx)(Ps, {
                                    scope: e.__scopeSelect,
                                    onNativeOptionAdd: n.useCallback((function(e) {
                                        U((function(t) {
                                            return new Set(t).add(e)
                                        }))
                                    }), []),
                                    onNativeOptionRemove: n.useCallback((function(e) {
                                        U((function(t) {
                                            var r = new Set(t);
                                            return r.delete(e), r
                                        }))
                                    }), []),
                                    children: r
                                })
                            }), _ ? (0, L.jsxs)(vf, {
                                "aria-hidden": !0,
                                required: y,
                                tabIndex: -1,
                                name: f,
                                autoComplete: p,
                                value: F,
                                onChange: function(e) {
                                    return N(e.target.value)
                                },
                                disabled: d,
                                form: v,
                                children: [void 0 === F ? (0, L.jsx)("option", {
                                    value: ""
                                }) : null, Array.from(M)]
                            }, B) : null]
                        })
                    }))
                };
            Rs.displayName = ds;
            var Is = "SelectTrigger",
                Cs = n.forwardRef((function(e, t) {
                    var r = e.__scopeSelect,
                        o = e.disabled,
                        i = void 0 !== o && o,
                        a = Jl(e, Ol),
                        u = Ss(r),
                        c = Es(Is, r),
                        l = c.disabled || i,
                        s = ts(t, c.onTriggerChange),
                        f = hs(r),
                        p = n.useRef("touch"),
                        d = mf((function(e) {
                            var t = f().filter((function(e) {
                                    return !e.disabled
                                })),
                                r = t.find((function(e) {
                                    return e.value === c.value
                                })),
                                n = hf(t, e, r);
                            void 0 !== n && c.onValueChange(n.value)
                        })),
                        y = zl(d, 3),
                        v = y[0],
                        m = y[1],
                        h = y[2],
                        g = function(e) {
                            l || (c.onOpenChange(!0), h()), e && (c.triggerPointerDownPosRef.current = {
                                x: Math.round(e.pageX),
                                y: Math.round(e.pageY)
                            })
                        };
                    return (0, L.jsx)(Go, Kl(Kl({
                        asChild: !0
                    }, u), {}, {
                        children: (0, L.jsx)(as.button, Kl(Kl({
                            type: "button",
                            role: "combobox",
                            "aria-controls": c.contentId,
                            "aria-expanded": c.open,
                            "aria-required": c.required,
                            "aria-autocomplete": "none",
                            dir: c.dir,
                            "data-state": c.open ? "open" : "closed",
                            disabled: l,
                            "data-disabled": l ? "" : void 0,
                            "data-placeholder": yf(c.value) ? "" : void 0
                        }, a), {}, {
                            ref: s,
                            onClick: Zl(a.onClick, (function(e) {
                                e.currentTarget.focus(), "mouse" !== p.current && g(e)
                            })),
                            onPointerDown: Zl(a.onPointerDown, (function(e) {
                                p.current = e.pointerType;
                                var t = e.target;
                                t.hasPointerCapture(e.pointerId) && t.releasePointerCapture(e.pointerId), 0 === e.button && !1 === e.ctrlKey && "mouse" === e.pointerType && (g(e), e.preventDefault())
                            })),
                            onKeyDown: Zl(a.onKeyDown, (function(e) {
                                var t = "" !== v.current;
                                e.ctrlKey || e.altKey || e.metaKey || 1 !== e.key.length || m(e.key), t && " " === e.key || fs.includes(e.key) && (g(), e.preventDefault())
                            }))
                        }))
                    }))
                }));
            Cs.displayName = Is;
            var ks = "SelectValue",
                Fs = n.forwardRef((function(e, t) {
                    var r = e.__scopeSelect,
                        n = (e.className, e.style, e.children),
                        o = e.placeholder,
                        i = void 0 === o ? "" : o,
                        a = Jl(e, Pl),
                        u = Es(ks, r),
                        c = u.onValueNodeHasChildrenChange,
                        l = void 0 !== n,
                        s = ts(t, u.onValueNodeChange);
                    return ls((function() {
                        c(l)
                    }), [c, l]), (0, L.jsx)(as.span, Kl(Kl({}, a), {}, {
                        ref: s,
                        style: {
                            pointerEvents: "none"
                        },
                        children: yf(u.value) ? (0, L.jsx)(L.Fragment, {
                            children: i
                        }) : n
                    }))
                }));
            Fs.displayName = ks;
            var Ns = n.forwardRef((function(e, t) {
                e.__scopeSelect;
                var r = e.children,
                    n = Jl(e, jl);
                return (0, L.jsx)(as.span, Kl(Kl({
                    "aria-hidden": !0
                }, n), {}, {
                    ref: t,
                    children: r || "▼"
                }))
            }));
            Ns.displayName = "SelectIcon";
            var Ts = function(e) {
                return (0, L.jsx)(He, Kl({
                    asChild: !0
                }, e))
            };
            Ts.displayName = "SelectPortal";
            var _s = "SelectContent",
                Ds = n.forwardRef((function(e, t) {
                    var r = Es(_s, e.__scopeSelect),
                        o = zl(n.useState(), 2),
                        a = o[0],
                        u = o[1];
                    if (ls((function() {
                            u(new DocumentFragment)
                        }), []), !r.open) {
                        var c = a;
                        return c ? i.createPortal((0, L.jsx)(Bs, {
                            scope: e.__scopeSelect,
                            children: (0, L.jsx)(ms.Slot, {
                                scope: e.__scopeSelect,
                                children: (0, L.jsx)("div", {
                                    children: e.children
                                })
                            })
                        }), c) : null
                    }
                    return (0, L.jsx)(Gs, Kl(Kl({}, e), {}, {
                        ref: t
                    }))
                }));
            Ds.displayName = _s;
            var Ms = 10,
                Us = zl(ws(_s), 2),
                Bs = Us[0],
                Ls = Us[1],
                Ws = ns("SelectContent.RemoveScroll"),
                Gs = n.forwardRef((function(e, t) {
                    var r = e.__scopeSelect,
                        o = e.position,
                        i = void 0 === o ? "item-aligned" : o,
                        a = e.onCloseAutoFocus,
                        u = e.onEscapeKeyDown,
                        c = e.onPointerDownOutside,
                        l = e.side,
                        s = e.sideOffset,
                        f = e.align,
                        p = e.alignOffset,
                        d = e.arrowPadding,
                        y = e.collisionBoundary,
                        v = e.collisionPadding,
                        m = e.sticky,
                        h = e.hideWhenDetached,
                        g = e.avoidCollisions,
                        b = Jl(e, Rl),
                        w = Es(_s, r),
                        S = zl(n.useState(null), 2),
                        A = S[0],
                        x = S[1],
                        E = zl(n.useState(null), 2),
                        O = E[0],
                        P = E[1],
                        j = ts(t, (function(e) {
                            return x(e)
                        })),
                        R = zl(n.useState(null), 2),
                        I = R[0],
                        C = R[1],
                        k = zl(n.useState(null), 2),
                        F = k[0],
                        N = k[1],
                        T = hs(r),
                        _ = zl(n.useState(!1), 2),
                        D = _[0],
                        M = _[1],
                        U = n.useRef(!1);
                    n.useEffect((function() {
                        if (A) return Qe(A)
                    }), [A]), Ee();
                    var B = n.useCallback((function(e) {
                            var t, r, n = T().map((function(e) {
                                    return e.ref.current
                                })),
                                o = Hl(t = n) || Gl(t) || ql(t) || Vl(),
                                i = o[0],
                                a = zl($l(o).slice(1).slice(-1), 1)[0],
                                u = document.activeElement,
                                c = function(e, t) {
                                    var r;
                                    if ("undefined" == typeof Symbol || null == e[Symbol.iterator]) {
                                        if (Array.isArray(e) || (r = ql(e)) || t && e && "number" == typeof e.length) {
                                            r && (e = r);
                                            var n = 0,
                                                o = function() {};
                                            return {
                                                s: o,
                                                n: function() {
                                                    return n >= e.length ? {
                                                        done: !0
                                                    } : {
                                                        done: !1,
                                                        value: e[n++]
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
                                    var i, a = !0,
                                        u = !1;
                                    return {
                                        s: function() {
                                            r = e[Symbol.iterator]()
                                        },
                                        n: function() {
                                            var e = r.next();
                                            return a = e.done, e
                                        },
                                        e: function(e) {
                                            u = !0, i = e
                                        },
                                        f: function() {
                                            try {
                                                a || null == r.return || r.return()
                                            } finally {
                                                if (u) throw i
                                            }
                                        }
                                    }
                                }(e);
                            try {
                                for (c.s(); !(r = c.n()).done;) {
                                    var l = r.value;
                                    if (l === u) return;
                                    if (null != l && l.scrollIntoView({
                                            block: "nearest"
                                        }), l === i && O && (O.scrollTop = 0), l === a && O && (O.scrollTop = O.scrollHeight), null != l && l.focus(), document.activeElement !== u) return
                                }
                            } catch (e) {
                                c.e(e)
                            } finally {
                                c.f()
                            }
                        }), [T, O]),
                        W = n.useCallback((function() {
                            return B([I, A])
                        }), [B, I, A]);
                    n.useEffect((function() {
                        D && W()
                    }), [D, W]);
                    var G = w.onOpenChange,
                        z = w.triggerPointerDownPosRef;
                    n.useEffect((function() {
                        if (A) {
                            var e = {
                                    x: 0,
                                    y: 0
                                },
                                t = function(t) {
                                    var r, n, o, i;
                                    e = {
                                        x: Math.abs(Math.round(t.pageX) - (null !== (r = null === (n = z.current) || void 0 === n ? void 0 : n.x) && void 0 !== r ? r : 0)),
                                        y: Math.abs(Math.round(t.pageY) - (null !== (o = null === (i = z.current) || void 0 === i ? void 0 : i.y) && void 0 !== o ? o : 0))
                                    }
                                },
                                r = function(r) {
                                    e.x <= 10 && e.y <= 10 ? r.preventDefault() : A.contains(r.target) || G(!1), document.removeEventListener("pointermove", t), z.current = null
                                };
                            return null !== z.current && (document.addEventListener("pointermove", t), document.addEventListener("pointerup", r, {
                                    capture: !0,
                                    once: !0
                                })),
                                function() {
                                    document.removeEventListener("pointermove", t), document.removeEventListener("pointerup", r, {
                                        capture: !0
                                    })
                                }
                        }
                    }), [A, G, z]), n.useEffect((function() {
                        var e = function() {
                            return G(!1)
                        };
                        return window.addEventListener("blur", e), window.addEventListener("resize", e),
                            function() {
                                window.removeEventListener("blur", e), window.removeEventListener("resize", e)
                            }
                    }), [G]);
                    var V = mf((function(e) {
                            var t = T().filter((function(e) {
                                    return !e.disabled
                                })),
                                r = t.find((function(e) {
                                    return e.ref.current === document.activeElement
                                })),
                                n = hf(t, e, r);
                            n && setTimeout((function() {
                                return n.ref.current.focus()
                            }))
                        })),
                        q = zl(V, 2),
                        $ = q[0],
                        H = q[1],
                        J = n.useCallback((function(e, t, r) {
                            var n = !U.current && !r;
                            (void 0 !== w.value && w.value === t || n) && (C(e), n && (U.current = !0))
                        }), [w.value]),
                        X = n.useCallback((function() {
                            return null == A ? void 0 : A.focus()
                        }), [A]),
                        K = n.useCallback((function(e, t, r) {
                            var n = !U.current && !r;
                            (void 0 !== w.value && w.value === t || n) && N(e)
                        }), [w.value]),
                        Y = "popper" === i ? Vs : zs,
                        Z = Y === Vs ? {
                            side: l,
                            sideOffset: s,
                            align: f,
                            alignOffset: p,
                            arrowPadding: d,
                            collisionBoundary: y,
                            collisionPadding: v,
                            sticky: m,
                            hideWhenDetached: h,
                            avoidCollisions: g
                        } : {};
                    return (0, L.jsx)(Bs, {
                        scope: r,
                        content: A,
                        viewport: O,
                        onViewportChange: P,
                        itemRefCallback: J,
                        selectedItem: I,
                        onItemLeave: X,
                        itemTextRefCallback: K,
                        focusSelectedItem: W,
                        selectedItemText: F,
                        position: i,
                        isPositioned: D,
                        searchRef: $,
                        children: (0, L.jsx)(Dt, {
                            as: Ws,
                            allowPinchZoom: !0,
                            children: (0, L.jsx)(_e, {
                                asChild: !0,
                                trapped: w.open,
                                onMountAutoFocus: function(e) {
                                    e.preventDefault()
                                },
                                onUnmountAutoFocus: Zl(a, (function(e) {
                                    var t;
                                    null !== (t = w.trigger) && void 0 !== t && t.focus({
                                        preventScroll: !0
                                    }), e.preventDefault()
                                })),
                                children: (0, L.jsx)(we, {
                                    asChild: !0,
                                    disableOutsidePointerEvents: !0,
                                    onEscapeKeyDown: u,
                                    onPointerDownOutside: c,
                                    onFocusOutside: function(e) {
                                        return e.preventDefault()
                                    },
                                    onDismiss: function() {
                                        return w.onOpenChange(!1)
                                    },
                                    children: (0, L.jsx)(Y, Kl(Kl(Kl({
                                        role: "listbox",
                                        id: w.contentId,
                                        "data-state": w.open ? "open" : "closed",
                                        dir: w.dir,
                                        onContextMenu: function(e) {
                                            return e.preventDefault()
                                        }
                                    }, b), Z), {}, {
                                        onPlaced: function() {
                                            return M(!0)
                                        },
                                        ref: j,
                                        style: Kl({
                                            display: "flex",
                                            flexDirection: "column",
                                            outline: "none"
                                        }, b.style),
                                        onKeyDown: Zl(b.onKeyDown, (function(e) {
                                            var t = e.ctrlKey || e.altKey || e.metaKey;
                                            if ("Tab" === e.key && e.preventDefault(), t || 1 !== e.key.length || H(e.key), ["ArrowUp", "ArrowDown", "Home", "End"].includes(e.key)) {
                                                var r = T().filter((function(e) {
                                                    return !e.disabled
                                                })).map((function(e) {
                                                    return e.ref.current
                                                }));
                                                if (["ArrowUp", "End"].includes(e.key) && (r = r.slice().reverse()), ["ArrowUp", "ArrowDown"].includes(e.key)) {
                                                    var n = e.target,
                                                        o = r.indexOf(n);
                                                    r = r.slice(o + 1)
                                                }
                                                setTimeout((function() {
                                                    return B(r)
                                                })), e.preventDefault()
                                            }
                                        }))
                                    }))
                                })
                            })
                        })
                    })
                }));
            Gs.displayName = "SelectContentImpl";
            var zs = n.forwardRef((function(e, t) {
                var r = e.__scopeSelect,
                    o = e.onPlaced,
                    i = Jl(e, Il),
                    a = Es(_s, r),
                    u = Ls(_s, r),
                    c = zl(n.useState(null), 2),
                    l = c[0],
                    s = c[1],
                    f = zl(n.useState(null), 2),
                    p = f[0],
                    d = f[1],
                    y = ts(t, (function(e) {
                        return d(e)
                    })),
                    v = hs(r),
                    m = n.useRef(!1),
                    h = n.useRef(!0),
                    g = u.viewport,
                    b = u.selectedItem,
                    w = u.selectedItemText,
                    S = u.focusSelectedItem,
                    A = n.useCallback((function() {
                        if (a.trigger && a.valueNode && l && p && g && b && w) {
                            var e = a.trigger.getBoundingClientRect(),
                                t = p.getBoundingClientRect(),
                                r = a.valueNode.getBoundingClientRect(),
                                n = w.getBoundingClientRect();
                            if ("rtl" !== a.dir) {
                                var i = n.left - t.left,
                                    u = r.left - i,
                                    c = e.left - u,
                                    s = e.width + c,
                                    f = Math.max(s, t.width),
                                    d = window.innerWidth - Ms,
                                    y = Na(u, [Ms, Math.max(Ms, d - f)]);
                                l.style.minWidth = s + "px", l.style.left = y + "px"
                            } else {
                                var h = t.right - n.right,
                                    S = window.innerWidth - r.right - h,
                                    A = window.innerWidth - e.right - S,
                                    x = e.width + A,
                                    E = Math.max(x, t.width),
                                    O = window.innerWidth - Ms,
                                    P = Na(S, [Ms, Math.max(Ms, O - E)]);
                                l.style.minWidth = x + "px", l.style.right = P + "px"
                            }
                            var j = v(),
                                R = window.innerHeight - 20,
                                I = g.scrollHeight,
                                C = window.getComputedStyle(p),
                                k = parseInt(C.borderTopWidth, 10),
                                F = parseInt(C.paddingTop, 10),
                                N = parseInt(C.borderBottomWidth, 10),
                                T = k + F + I + parseInt(C.paddingBottom, 10) + N,
                                _ = Math.min(5 * b.offsetHeight, T),
                                D = window.getComputedStyle(g),
                                M = parseInt(D.paddingTop, 10),
                                U = parseInt(D.paddingBottom, 10),
                                B = e.top + e.height / 2 - Ms,
                                L = R - B,
                                W = b.offsetHeight / 2,
                                G = k + F + (b.offsetTop + W),
                                z = T - G;
                            if (G <= B) {
                                var V = j.length > 0 && b === j[j.length - 1].ref.current;
                                l.style.bottom = "0px";
                                var q = p.clientHeight - g.offsetTop - g.offsetHeight,
                                    $ = G + Math.max(L, W + (V ? U : 0) + q + N);
                                l.style.height = $ + "px"
                            } else {
                                var H = j.length > 0 && b === j[0].ref.current;
                                l.style.top = "0px";
                                var J = Math.max(B, k + g.offsetTop + (H ? M : 0) + W) + z;
                                l.style.height = J + "px", g.scrollTop = G - B + g.offsetTop
                            }
                            l.style.margin = "".concat(Ms, "px 0"), l.style.minHeight = _ + "px", l.style.maxHeight = R + "px", null != o && o(), requestAnimationFrame((function() {
                                return m.current = !0
                            }))
                        }
                    }), [v, a.trigger, a.valueNode, l, p, g, b, w, a.dir, o]);
                ls((function() {
                    return A()
                }), [A]);
                var x = zl(n.useState(), 2),
                    E = x[0],
                    O = x[1];
                ls((function() {
                    p && O(window.getComputedStyle(p).zIndex)
                }), [p]);
                var P = n.useCallback((function(e) {
                    e && !0 === h.current && (A(), null != S && S(), h.current = !1)
                }), [A, S]);
                return (0, L.jsx)($s, {
                    scope: r,
                    contentWrapper: l,
                    shouldExpandOnScrollRef: m,
                    onScrollButtonChange: P,
                    children: (0, L.jsx)("div", {
                        ref: s,
                        style: {
                            display: "flex",
                            flexDirection: "column",
                            position: "fixed",
                            zIndex: E
                        },
                        children: (0, L.jsx)(as.div, Kl(Kl({}, i), {}, {
                            ref: y,
                            style: Kl({
                                boxSizing: "border-box",
                                maxHeight: "100%"
                            }, i.style)
                        }))
                    })
                })
            }));
            zs.displayName = "SelectItemAlignedPosition";
            var Vs = n.forwardRef((function(e, t) {
                var r = e.__scopeSelect,
                    n = e.align,
                    o = void 0 === n ? "start" : n,
                    i = e.collisionPadding,
                    a = void 0 === i ? Ms : i,
                    u = Jl(e, Cl),
                    c = Ss(r);
                return (0, L.jsx)(zo, Kl(Kl(Kl({}, c), u), {}, {
                    ref: t,
                    align: o,
                    collisionPadding: a,
                    style: Kl(Kl({
                        boxSizing: "border-box"
                    }, u.style), {}, {
                        "--radix-select-content-transform-origin": "var(--radix-popper-transform-origin)",
                        "--radix-select-content-available-width": "var(--radix-popper-available-width)",
                        "--radix-select-content-available-height": "var(--radix-popper-available-height)",
                        "--radix-select-trigger-width": "var(--radix-popper-anchor-width)",
                        "--radix-select-trigger-height": "var(--radix-popper-anchor-height)"
                    })
                }))
            }));
            Vs.displayName = "SelectPopperPosition";
            var qs = zl(ws(_s, {}), 2),
                $s = qs[0],
                Hs = qs[1],
                Js = "SelectViewport",
                Xs = n.forwardRef((function(e, t) {
                    var r = e.__scopeSelect,
                        o = e.nonce,
                        i = Jl(e, kl),
                        a = Ls(Js, r),
                        u = Hs(Js, r),
                        c = ts(t, a.onViewportChange),
                        l = n.useRef(0);
                    return (0, L.jsxs)(L.Fragment, {
                        children: [(0, L.jsx)("style", {
                            dangerouslySetInnerHTML: {
                                __html: "[data-radix-select-viewport]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}[data-radix-select-viewport]::-webkit-scrollbar{display:none}"
                            },
                            nonce: o
                        }), (0, L.jsx)(ms.Slot, {
                            scope: r,
                            children: (0, L.jsx)(as.div, Kl(Kl({
                                "data-radix-select-viewport": "",
                                role: "presentation"
                            }, i), {}, {
                                ref: c,
                                style: Kl({
                                    position: "relative",
                                    flex: 1,
                                    overflow: "hidden auto"
                                }, i.style),
                                onScroll: Zl(i.onScroll, (function(e) {
                                    var t = e.currentTarget,
                                        r = u.contentWrapper,
                                        n = u.shouldExpandOnScrollRef;
                                    if (null != n && n.current && r) {
                                        var o = Math.abs(l.current - t.scrollTop);
                                        if (o > 0) {
                                            var i = window.innerHeight - 20,
                                                a = parseFloat(r.style.minHeight),
                                                c = parseFloat(r.style.height),
                                                s = Math.max(a, c);
                                            if (s < i) {
                                                var f = s + o,
                                                    p = Math.min(i, f),
                                                    d = f - p;
                                                r.style.height = p + "px", "0px" === r.style.bottom && (t.scrollTop = d > 0 ? d : 0, r.style.justifyContent = "flex-end")
                                            }
                                        }
                                    }
                                    l.current = t.scrollTop
                                }))
                            }))
                        })]
                    })
                }));
            Xs.displayName = Js;
            var Ks = "SelectGroup",
                Ys = zl(ws(Ks), 2),
                Zs = Ys[0],
                Qs = Ys[1];
            n.forwardRef((function(e, t) {
                var r = e.__scopeSelect,
                    n = Jl(e, Fl),
                    o = Gt();
                return (0, L.jsx)(Zs, {
                    scope: r,
                    id: o,
                    children: (0, L.jsx)(as.div, Kl(Kl({
                        role: "group",
                        "aria-labelledby": o
                    }, n), {}, {
                        ref: t
                    }))
                })
            })).displayName = Ks;
            var ef = "SelectLabel";
            n.forwardRef((function(e, t) {
                var r = e.__scopeSelect,
                    n = Jl(e, Nl),
                    o = Qs(ef, r);
                return (0, L.jsx)(as.div, Kl(Kl({
                    id: o.id
                }, n), {}, {
                    ref: t
                }))
            })).displayName = ef;
            var tf = "SelectItem",
                rf = zl(ws(tf), 2),
                nf = rf[0],
                of = rf[1],
                af = n.forwardRef((function(e, t) {
                    var r = e.__scopeSelect,
                        o = e.value,
                        i = e.disabled,
                        a = void 0 !== i && i,
                        u = e.textValue,
                        c = Jl(e, Tl),
                        l = Es(tf, r),
                        s = Ls(tf, r),
                        f = l.value === o,
                        p = zl(n.useState(null != u ? u : ""), 2),
                        d = p[0],
                        y = p[1],
                        v = zl(n.useState(!1), 2),
                        m = v[0],
                        h = v[1],
                        g = ts(t, (function(e) {
                            var t;
                            return null === (t = s.itemRefCallback) || void 0 === t ? void 0 : t.call(s, e, o, a)
                        })),
                        b = Gt(),
                        w = n.useRef("touch"),
                        S = function() {
                            a || (l.onValueChange(o), l.onOpenChange(!1))
                        };
                    if ("" === o) throw new Error("A <Select.Item /> must have a value prop that is not an empty string. This is because the Select value can be set to an empty string to clear the selection and show the placeholder.");
                    return (0, L.jsx)(nf, {
                        scope: r,
                        value: o,
                        disabled: a,
                        textId: b,
                        isSelected: f,
                        onItemTextChange: n.useCallback((function(e) {
                            y((function(t) {
                                var r;
                                return t || (null !== (r = null == e ? void 0 : e.textContent) && void 0 !== r ? r : "").trim()
                            }))
                        }), []),
                        children: (0, L.jsx)(ms.ItemSlot, {
                            scope: r,
                            value: o,
                            disabled: a,
                            textValue: d,
                            children: (0, L.jsx)(as.div, Kl(Kl({
                                role: "option",
                                "aria-labelledby": b,
                                "data-highlighted": m ? "" : void 0,
                                "aria-selected": f && m,
                                "data-state": f ? "checked" : "unchecked",
                                "aria-disabled": a || void 0,
                                "data-disabled": a ? "" : void 0,
                                tabIndex: a ? void 0 : -1
                            }, c), {}, {
                                ref: g,
                                onFocus: Zl(c.onFocus, (function() {
                                    return h(!0)
                                })),
                                onBlur: Zl(c.onBlur, (function() {
                                    return h(!1)
                                })),
                                onClick: Zl(c.onClick, (function() {
                                    "mouse" !== w.current && S()
                                })),
                                onPointerUp: Zl(c.onPointerUp, (function() {
                                    "mouse" === w.current && S()
                                })),
                                onPointerDown: Zl(c.onPointerDown, (function(e) {
                                    w.current = e.pointerType
                                })),
                                onPointerMove: Zl(c.onPointerMove, (function(e) {
                                    var t;
                                    w.current = e.pointerType, a ? null === (t = s.onItemLeave) || void 0 === t || t.call(s) : "mouse" === w.current && e.currentTarget.focus({
                                        preventScroll: !0
                                    })
                                })),
                                onPointerLeave: Zl(c.onPointerLeave, (function(e) {
                                    var t;
                                    e.currentTarget === document.activeElement && (null === (t = s.onItemLeave) || void 0 === t || t.call(s))
                                })),
                                onKeyDown: Zl(c.onKeyDown, (function(e) {
                                    var t;
                                    "" !== (null === (t = s.searchRef) || void 0 === t ? void 0 : t.current) && " " === e.key || (ps.includes(e.key) && S(), " " === e.key && e.preventDefault())
                                }))
                            }))
                        })
                    })
                }));
            af.displayName = tf;
            var uf = "SelectItemText",
                cf = n.forwardRef((function(e, t) {
                    var r = e.__scopeSelect,
                        o = (e.className, e.style, Jl(e, _l)),
                        a = Es(uf, r),
                        u = Ls(uf, r),
                        c = of(uf, r),
                        l = js(uf, r),
                        s = zl(n.useState(null), 2),
                        f = s[0],
                        p = s[1],
                        d = ts(t, (function(e) {
                            return p(e)
                        }), c.onItemTextChange, (function(e) {
                            var t;
                            return null === (t = u.itemTextRefCallback) || void 0 === t ? void 0 : t.call(u, e, c.value, c.disabled)
                        })),
                        y = null == f ? void 0 : f.textContent,
                        v = n.useMemo((function() {
                            return (0, L.jsx)("option", {
                                value: c.value,
                                disabled: c.disabled,
                                children: y
                            }, c.value)
                        }), [c.disabled, c.value, y]),
                        m = l.onNativeOptionAdd,
                        h = l.onNativeOptionRemove;
                    return ls((function() {
                        return m(v),
                            function() {
                                return h(v)
                            }
                    }), [m, h, v]), (0, L.jsxs)(L.Fragment, {
                        children: [(0, L.jsx)(as.span, Kl(Kl({
                            id: c.textId
                        }, o), {}, {
                            ref: d
                        })), c.isSelected && a.valueNode && !a.valueNodeHasChildren ? i.createPortal(o.children, a.valueNode) : null]
                    })
                }));
            cf.displayName = uf;
            var lf = "SelectItemIndicator";
            n.forwardRef((function(e, t) {
                var r = e.__scopeSelect,
                    n = Jl(e, Dl);
                return of(lf, r).isSelected ? (0, L.jsx)(as.span, Kl(Kl({
                    "aria-hidden": !0
                }, n), {}, {
                    ref: t
                })) : null
            })).displayName = lf;
            var sf = "SelectScrollUpButton";
            n.forwardRef((function(e, t) {
                var r = Ls(sf, e.__scopeSelect),
                    o = Hs(sf, e.__scopeSelect),
                    i = zl(n.useState(!1), 2),
                    a = i[0],
                    u = i[1],
                    c = ts(t, o.onScrollButtonChange);
                return ls((function() {
                    if (r.viewport && r.isPositioned) {
                        var e = function() {
                                var e = t.scrollTop > 0;
                                u(e)
                            },
                            t = r.viewport;
                        return e(), t.addEventListener("scroll", e),
                            function() {
                                return t.removeEventListener("scroll", e)
                            }
                    }
                }), [r.viewport, r.isPositioned]), a ? (0, L.jsx)(pf, Kl(Kl({}, e), {}, {
                    ref: c,
                    onAutoScroll: function() {
                        var e = r.viewport,
                            t = r.selectedItem;
                        e && t && (e.scrollTop = e.scrollTop - t.offsetHeight)
                    }
                })) : null
            })).displayName = sf;
            var ff = "SelectScrollDownButton";
            n.forwardRef((function(e, t) {
                var r = Ls(ff, e.__scopeSelect),
                    o = Hs(ff, e.__scopeSelect),
                    i = zl(n.useState(!1), 2),
                    a = i[0],
                    u = i[1],
                    c = ts(t, o.onScrollButtonChange);
                return ls((function() {
                    if (r.viewport && r.isPositioned) {
                        var e = function() {
                                var e = t.scrollHeight - t.clientHeight,
                                    r = Math.ceil(t.scrollTop) < e;
                                u(r)
                            },
                            t = r.viewport;
                        return e(), t.addEventListener("scroll", e),
                            function() {
                                return t.removeEventListener("scroll", e)
                            }
                    }
                }), [r.viewport, r.isPositioned]), a ? (0, L.jsx)(pf, Kl(Kl({}, e), {}, {
                    ref: c,
                    onAutoScroll: function() {
                        var e = r.viewport,
                            t = r.selectedItem;
                        e && t && (e.scrollTop = e.scrollTop + t.offsetHeight)
                    }
                })) : null
            })).displayName = ff;
            var pf = n.forwardRef((function(e, t) {
                var r = e.__scopeSelect,
                    o = e.onAutoScroll,
                    i = Jl(e, Ml),
                    a = Ls("SelectScrollButton", r),
                    u = n.useRef(null),
                    c = hs(r),
                    l = n.useCallback((function() {
                        null !== u.current && (window.clearInterval(u.current), u.current = null)
                    }), []);
                return n.useEffect((function() {
                    return function() {
                        return l()
                    }
                }), [l]), ls((function() {
                    var e, t;
                    null === (e = c().find((function(e) {
                        return e.ref.current === document.activeElement
                    }))) || void 0 === e || null === (t = e.ref.current) || void 0 === t || t.scrollIntoView({
                        block: "nearest"
                    })
                }), [c]), (0, L.jsx)(as.div, Kl(Kl({
                    "aria-hidden": !0
                }, i), {}, {
                    ref: t,
                    style: Kl({
                        flexShrink: 0
                    }, i.style),
                    onPointerDown: Zl(i.onPointerDown, (function() {
                        null === u.current && (u.current = window.setInterval(o, 50))
                    })),
                    onPointerMove: Zl(i.onPointerMove, (function() {
                        var e;
                        null !== (e = a.onItemLeave) && void 0 !== e && e.call(a), null === u.current && (u.current = window.setInterval(o, 50))
                    })),
                    onPointerLeave: Zl(i.onPointerLeave, (function() {
                        l()
                    }))
                }))
            }));
            n.forwardRef((function(e, t) {
                e.__scopeSelect;
                var r = Jl(e, Ul);
                return (0, L.jsx)(as.div, Kl(Kl({
                    "aria-hidden": !0
                }, r), {}, {
                    ref: t
                }))
            })).displayName = "SelectSeparator";
            var df = "SelectArrow";

            function yf(e) {
                return "" === e || void 0 === e
            }
            n.forwardRef((function(e, t) {
                var r = e.__scopeSelect,
                    n = Jl(e, Bl),
                    o = Ss(r),
                    i = Es(df, r),
                    a = Ls(df, r);
                return i.open && "popper" === a.position ? (0, L.jsx)(Vo, Kl(Kl(Kl({}, o), n), {}, {
                    ref: t
                })) : null
            })).displayName = df;
            var vf = n.forwardRef((function(e, t) {
                var r = e.value,
                    o = Jl(e, Ll),
                    i = n.useRef(null),
                    a = ts(t, i),
                    u = function(e) {
                        var t = n.useRef({
                            value: e,
                            previous: e
                        });
                        return n.useMemo((function() {
                            return t.current.value !== e && (t.current.previous = t.current.value, t.current.value = e), t.current.previous
                        }), [e])
                    }(r);
                return n.useEffect((function() {
                    var e = i.current,
                        t = window.HTMLSelectElement.prototype,
                        n = Object.getOwnPropertyDescriptor(t, "value").set;
                    if (u !== r && n) {
                        var o = new Event("change", {
                            bubbles: !0
                        });
                        n.call(e, r), e.dispatchEvent(o)
                    }
                }), [u, r]), (0, L.jsx)(ss, {
                    asChild: !0,
                    children: (0, L.jsx)("select", Kl(Kl({}, o), {}, {
                        ref: a,
                        defaultValue: r
                    }))
                })
            }));

            function mf(e) {
                var t = us(e),
                    r = n.useRef(""),
                    o = n.useRef(0),
                    i = n.useCallback((function(e) {
                        var n = r.current + e;
                        t(n),
                            function e(t) {
                                r.current = t, window.clearTimeout(o.current), "" !== t && (o.current = window.setTimeout((function() {
                                    return e("")
                                }), 1e3))
                            }(n)
                    }), [t]),
                    a = n.useCallback((function() {
                        r.current = "", window.clearTimeout(o.current)
                    }), []);
                return n.useEffect((function() {
                    return function() {
                        return window.clearTimeout(o.current)
                    }
                }), []), [r, i, a]
            }

            function hf(e, t, r) {
                var n, o, i = t.length > 1 && Array.from(t).every((function(e) {
                        return e === t[0]
                    })) ? t[0] : t,
                    a = r ? e.indexOf(r) : -1,
                    u = (n = e, o = Math.max(a, 0), n.map((function(e, t) {
                        return n[(o + t) % n.length]
                    })));
                1 === i.length && (u = u.filter((function(e) {
                    return e !== r
                })));
                var c = u.find((function(e) {
                    return e.textValue.toLowerCase().startsWith(i.toLowerCase())
                }));
                return c !== r ? c : void 0
            }
            vf.displayName = "BubbleSelect";
            var gf = Rs,
                bf = Cs,
                wf = Fs,
                Sf = Ns,
                Af = Ts,
                xf = Ds,
                Ef = Xs,
                Of = af,
                Pf = cf;
            ea(".foundation-web-menu-separator{border-top:1px solid var(--color-stroke-default)}");
            var jf = (0, n.createContext)(null),
                Rf = {
                    XSmall: "size-300",
                    Small: "size-400",
                    Medium: "size-500",
                    Large: "size-600"
                },
                If = {
                    XSmall: "padding-x-medium",
                    Small: "padding-x-medium",
                    Medium: "padding-x-medium",
                    Large: "padding-x-large"
                },
                Cf = {
                    XSmall: "text-title-small",
                    Small: "text-title-small",
                    Medium: "text-title-medium",
                    Large: "text-title-large"
                },
                kf = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                Ff = {
                    XSmall: "gap-xsmall",
                    Small: "gap-small",
                    Medium: "gap-small",
                    Large: "gap-small"
                },
                Nf = {
                    XSmall: "radius-small",
                    Small: "radius-medium",
                    Medium: "radius-medium",
                    Large: "radius-medium"
                },
                Tf = {
                    XSmall: "height-600",
                    Small: "height-800",
                    Medium: "height-1000",
                    Large: "height-1200"
                },
                _f = (0, n.forwardRef)((function(e, t) {
                    var r = e.label,
                        i = e.labelTooltip,
                        a = e.ariaLabelledBy,
                        u = e.ariaLabel,
                        c = e.className,
                        l = e.size,
                        s = e.variant,
                        f = void 0 === s ? "Standard" : s,
                        p = e.value,
                        d = e.placeholder,
                        y = e.isDisabled,
                        v = e.hasError,
                        m = e.hint,
                        h = e.onValueChange,
                        g = e.onOpenChange,
                        b = e.children,
                        w = function() {
                            var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "«r",
                                t = (0, n.useRef)();
                            return t.current || (tu += 1, t.current = "".concat(e).concat(tu)), t.current
                        }(),
                        S = (0, n.useMemo)((function() {
                            return {
                                size: l
                            }
                        }), [l]),
                        A = r ? o().createElement("span", {
                            id: w,
                            className: B(Cf[l], "content-emphasis")
                        }, r) : null;
                    return o().createElement(jf.Provider, {
                        value: S
                    }, o().createElement("div", {
                        className: B("flex flex-col", y && [Sa, "pointer-events-none"], Ff[l], c)
                    }, A && (i ? o().createElement("div", {
                        className: "flex items-center gap-xsmall"
                    }, A, o().createElement(gl, Object.assign({}, i))) : A), o().createElement(gf, {
                        value: p,
                        disabled: y,
                        onValueChange: h,
                        onOpenChange: g
                    }, o().createElement(bf, {
                        className: B("relative clip group/interactable outline-none", "foundation-web-input flex items-center justify-between width-full cursor-pointer", bl[f], wl[f], Nf[l], Tf[l], If[l], kf[l], v ? "stroke-system-alert" : "stroke-contrast-alpha", void 0 === p ? "content-muted" : "content-default"),
                        ref: t,
                        "aria-labelledby": r ? w : a,
                        "aria-label": u
                    }, o().createElement(wa, null), o().createElement("div", {
                        className: "grow-1 text-truncate-split text-align-x-left"
                    }, o().createElement(wf, {
                        placeholder: d
                    })), o().createElement(Sf, {
                        className: B(Rf[l], "icon icon-regular-chevron-large-down content-default")
                    })), o().createElement(Af, null, o().createElement(xf, {
                        position: "popper",
                        className: "padding-y-small foundation-web-portal-zindex",
                        style: {
                            maxHeight: "var(--radix-select-content-available-height)"
                        }
                    }, b))), m && o().createElement("span", {
                        className: B("text-caption-small", {
                            "content-system-alert": v,
                            "content-default": !v
                        })
                    }, m)))
                }));
            _f.displayName = "Dropdown";
            var Df = r(4364),
                Mf = ["scope", "children"],
                Uf = ["children"],
                Bf = ["children"],
                Lf = ["asChild"],
                Wf = ["scope", "children"],
                Gf = ["__scopeRovingFocusGroup", "orientation", "loop", "dir", "currentTabStopId", "defaultCurrentTabStopId", "onCurrentTabStopIdChange", "onEntryFocus", "preventScrollOnEntryFocus"],
                zf = ["__scopeRovingFocusGroup", "focusable", "active", "tabStopId", "children"];

            function Vf(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var r = [],
                        n = !0,
                        o = !1,
                        i = void 0;
                    try {
                        for (var a, u = e[Symbol.iterator](); !(n = (a = u.next()).done) && (r.push(a.value), !t || r.length !== t); n = !0);
                    } catch (e) {
                        o = !0, i = e
                    } finally {
                        try {
                            n || null == u.return || u.return()
                        } finally {
                            if (o) throw i
                        }
                    }
                    return r
                }(e, t) || Hf(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function qf(e, t) {
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
                    for (n = 0; n < i.length; n++) r = i[n], t.indexOf(r) >= 0 || Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r])
                }
                return o
            }

            function $f(e) {
                return function(e) {
                    if (Array.isArray(e)) return Jf(e)
                }(e) || function(e) {
                    if ("undefined" != typeof Symbol && Symbol.iterator in Object(e)) return Array.from(e)
                }(e) || Hf(e) || function() {
                    throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function Hf(e, t) {
                if (e) {
                    if ("string" == typeof e) return Jf(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    return "Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r ? Array.from(e) : "Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r) ? Jf(e, t) : void 0
                }
            }

            function Jf(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = new Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function Xf(e, t) {
                var r = Object.keys(e);
                if (Object.getOwnPropertySymbols) {
                    var n = Object.getOwnPropertySymbols(e);
                    t && (n = n.filter((function(t) {
                        return Object.getOwnPropertyDescriptor(e, t).enumerable
                    }))), r.push.apply(r, n)
                }
                return r
            }

            function Kf(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {};
                    t % 2 ? Xf(Object(r), !0).forEach((function(t) {
                        Yf(e, t, r[t])
                    })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(r)) : Xf(Object(r)).forEach((function(t) {
                        Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(r, t))
                    }))
                }
                return e
            }

            function Yf(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function Zf(e, t) {
                var r = (arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {}).checkForDefaultPrevented,
                    n = void 0 === r || r;
                return function(r) {
                    if (null != e && e(r), !1 === n || !r.defaultPrevented) return null == t ? void 0 : t(r)
                }
            }

            function Qf(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                    r = [],
                    o = function() {
                        var t = r.map((function(e) {
                            return n.createContext(e)
                        }));
                        return function(r) {
                            var o = (null == r ? void 0 : r[e]) || t;
                            return n.useMemo((function() {
                                return Yf({}, "__scope".concat(e), Kf(Kf({}, r), {}, Yf({}, e, o)))
                            }), [r, o])
                        }
                    };
                return o.scopeName = e, [function(t, o) {
                    var i = n.createContext(o),
                        a = r.length;
                    r = [].concat($f(r), [o]);
                    var u = function(t) {
                        var r, o = t.scope,
                            u = t.children,
                            c = qf(t, Mf),
                            l = (null == o || null === (r = o[e]) || void 0 === r ? void 0 : r[a]) || i,
                            s = n.useMemo((function() {
                                return c
                            }), Object.values(c));
                        return (0, L.jsx)(l.Provider, {
                            value: s,
                            children: u
                        })
                    };
                    return u.displayName = t + "Provider", [u, function(r, u) {
                        var c, l = (null == u || null === (c = u[e]) || void 0 === c ? void 0 : c[a]) || i,
                            s = n.useContext(l);
                        if (s) return s;
                        if (void 0 !== o) return o;
                        throw new Error("`".concat(r, "` must be used within `").concat(t, "`"))
                    }]
                }, ep.apply(void 0, [o].concat($f(t)))]
            }

            function ep() {
                for (var e = arguments.length, t = new Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                var o = t[0];
                if (1 === t.length) return o;
                var i = function() {
                    var e = t.map((function(e) {
                        return {
                            useScope: e(),
                            scopeName: e.scopeName
                        }
                    }));
                    return function(t) {
                        var r = e.reduce((function(e, r) {
                            var n = r.useScope,
                                o = r.scopeName;
                            return Kf(Kf({}, e), n(t)["__scope".concat(o)])
                        }), {});
                        return n.useMemo((function() {
                            return Yf({}, "__scope".concat(o.scopeName), r)
                        }), [r])
                    }
                };
                return i.scopeName = o.scopeName, i
            }

            function tp(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function rp() {
                for (var e = arguments.length, t = new Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return function(e) {
                    var r = !1,
                        n = t.map((function(t) {
                            var n = tp(t, e);
                            return r || "function" != typeof n || (r = !0), n
                        }));
                    if (r) return function() {
                        for (var e = 0; e < n.length; e++) {
                            var r = n[e];
                            "function" == typeof r ? r() : tp(t[e], null)
                        }
                    }
                }
            }

            function np() {
                for (var e = arguments.length, t = new Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return n.useCallback(rp.apply(void 0, t), t)
            }

            function op(e) {
                var t = function(e) {
                        var t = n.forwardRef((function(e, t) {
                            var r = e.children,
                                o = qf(e, Bf);
                            if (n.isValidElement(r)) {
                                var i = function(e) {
                                        var t, r, n = null === (t = Object.getOwnPropertyDescriptor(e.props, "ref")) || void 0 === t ? void 0 : t.get,
                                            o = n && "isReactWarning" in n && n.isReactWarning;
                                        return o ? e.ref : (o = (n = null === (r = Object.getOwnPropertyDescriptor(e, "ref")) || void 0 === r ? void 0 : r.get) && "isReactWarning" in n && n.isReactWarning) ? e.props.ref : e.props.ref || e.ref
                                    }(r),
                                    a = function(e, t) {
                                        var r = Kf({}, t),
                                            n = function(n) {
                                                var o = e[n],
                                                    i = t[n];
                                                /^on[A-Z]/.test(n) ? o && i ? r[n] = function() {
                                                    var e = i.apply(void 0, arguments);
                                                    return o.apply(void 0, arguments), e
                                                } : o && (r[n] = o) : "style" === n ? r[n] = Kf(Kf({}, o), i) : "className" === n && (r[n] = [o, i].filter(Boolean).join(" "))
                                            };
                                        for (var o in t) n(o);
                                        return Kf(Kf({}, e), r)
                                    }(o, r.props);
                                return r.type !== n.Fragment && (a.ref = t ? rp(t, i) : i), n.cloneElement(r, a)
                            }
                            return n.Children.count(r) > 1 ? n.Children.only(null) : null
                        }));
                        return t.displayName = "".concat(e, ".SlotClone"), t
                    }(e),
                    r = n.forwardRef((function(e, r) {
                        var o = e.children,
                            i = qf(e, Uf),
                            a = n.Children.toArray(o),
                            u = a.find(ap);
                        if (u) {
                            var c = u.props.children,
                                l = a.map((function(e) {
                                    return e === u ? n.Children.count(c) > 1 ? n.Children.only(null) : n.isValidElement(c) ? c.props.children : null : e
                                }));
                            return (0, L.jsx)(t, Kf(Kf({}, i), {}, {
                                ref: r,
                                children: n.isValidElement(c) ? n.cloneElement(c, void 0, l) : null
                            }))
                        }
                        return (0, L.jsx)(t, Kf(Kf({}, i), {}, {
                            ref: r,
                            children: o
                        }))
                    }));
                return r.displayName = "".concat(e, ".Slot"), r
            }
            var ip = Symbol("radix.slottable");

            function ap(e) {
                return n.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === ip
            }
            var up = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce((function(e, t) {
                    var r = op("Primitive.".concat(t)),
                        o = n.forwardRef((function(e, n) {
                            var o = e.asChild,
                                i = qf(e, Lf),
                                a = o ? r : t;
                            return "undefined" != typeof window && (window[Symbol.for("radix-ui")] = !0), (0, L.jsx)(a, Kf(Kf({}, i), {}, {
                                ref: n
                            }))
                        }));
                    return o.displayName = "Primitive.".concat(t), Kf(Kf({}, e), {}, Yf({}, t, o))
                }), {}),
                cp = null !== globalThis && void 0 !== globalThis && globalThis.document ? n.useLayoutEffect : function() {},
                lp = n[" useInsertionEffect ".trim().toString()] || cp;
            var sp = "rovingFocusGroup.onEntryFocus",
                fp = {
                    bubbles: !1,
                    cancelable: !0
                },
                pp = "RovingFocusGroup",
                dp = function(e) {
                    var t = e + "CollectionProvider",
                        r = Vf(Qf(t), 2),
                        n = r[0],
                        i = r[1],
                        a = Vf(n(t, {
                            collectionRef: {
                                current: null
                            },
                            itemMap: new Map
                        }), 2),
                        u = a[0],
                        c = a[1],
                        l = function(e) {
                            var t = e.scope,
                                r = e.children,
                                n = o().useRef(null),
                                i = o().useRef(new Map).current;
                            return (0, L.jsx)(u, {
                                scope: t,
                                itemMap: i,
                                collectionRef: n,
                                children: r
                            })
                        };
                    l.displayName = t;
                    var s = e + "CollectionSlot",
                        f = op(s),
                        p = o().forwardRef((function(e, t) {
                            var r = e.scope,
                                n = e.children,
                                o = np(t, c(s, r).collectionRef);
                            return (0, L.jsx)(f, {
                                ref: o,
                                children: n
                            })
                        }));
                    p.displayName = s;
                    var d = e + "CollectionItemSlot",
                        y = "data-radix-collection-item",
                        v = op(d),
                        m = o().forwardRef((function(e, t) {
                            var r, n = e.scope,
                                i = e.children,
                                a = qf(e, Wf),
                                u = o().useRef(null),
                                l = np(t, u),
                                s = c(d, n);
                            return o().useEffect((function() {
                                return s.itemMap.set(u, Kf({
                                        ref: u
                                    }, a)),
                                    function() {
                                        s.itemMap.delete(u)
                                    }
                            })), (0, L.jsx)(v, (Yf(r = {}, y, ""), Yf(r, "ref", l), Yf(r, "children", i), r))
                        }));
                    return m.displayName = d, [{
                        Provider: l,
                        Slot: p,
                        ItemSlot: m
                    }, function(t) {
                        var r = c(e + "CollectionConsumer", t);
                        return o().useCallback((function() {
                            var e = r.collectionRef.current;
                            if (!e) return [];
                            var t = Array.from(e.querySelectorAll("[".concat(y, "]")));
                            return Array.from(r.itemMap.values()).sort((function(e, r) {
                                return t.indexOf(e.ref.current) - t.indexOf(r.ref.current)
                            }))
                        }), [r.collectionRef, r.itemMap])
                    }, i]
                }(pp),
                yp = Vf(dp, 3),
                vp = yp[0],
                mp = yp[1],
                hp = yp[2],
                gp = Vf(Qf(pp, [hp]), 2),
                bp = gp[0],
                wp = (gp[1], Vf(bp(pp), 2)),
                Sp = wp[0],
                Ap = wp[1],
                xp = n.forwardRef((function(e, t) {
                    return (0, L.jsx)(vp.Provider, {
                        scope: e.__scopeRovingFocusGroup,
                        children: (0, L.jsx)(vp.Slot, {
                            scope: e.__scopeRovingFocusGroup,
                            children: (0, L.jsx)(Ep, Kf(Kf({}, e), {}, {
                                ref: t
                            }))
                        })
                    })
                }));
            xp.displayName = pp;
            var Ep = n.forwardRef((function(e, t) {
                    var r = e.__scopeRovingFocusGroup,
                        o = e.orientation,
                        i = e.loop,
                        a = void 0 !== i && i,
                        u = e.dir,
                        c = e.currentTabStopId,
                        l = e.defaultCurrentTabStopId,
                        s = e.onCurrentTabStopIdChange,
                        f = e.onEntryFocus,
                        p = e.preventScrollOnEntryFocus,
                        d = void 0 !== p && p,
                        y = qf(e, Gf),
                        v = n.useRef(null),
                        m = np(t, v),
                        h = eu(u),
                        g = function(e) {
                            var t = e.prop,
                                r = e.defaultProp,
                                o = e.onChange,
                                i = void 0 === o ? function() {} : o,
                                a = e.caller,
                                u = function(e) {
                                    var t = e.defaultProp,
                                        r = e.onChange,
                                        o = Vf(n.useState(t), 2),
                                        i = o[0],
                                        a = o[1],
                                        u = n.useRef(i),
                                        c = n.useRef(r);
                                    return lp((function() {
                                        c.current = r
                                    }), [r]), n.useEffect((function() {
                                        var e;
                                        u.current !== i && (null !== (e = c.current) && void 0 !== e && e.call(c, i), u.current = i)
                                    }), [i, u]), [i, a, c]
                                }({
                                    defaultProp: r,
                                    onChange: i
                                }),
                                c = Vf(u, 3),
                                l = c[0],
                                s = c[1],
                                f = c[2],
                                p = void 0 !== t,
                                d = p ? t : l,
                                y = n.useRef(void 0 !== t);
                            return n.useEffect((function() {
                                var e = y.current;
                                if (e !== p) {
                                    var t = e ? "controlled" : "uncontrolled",
                                        r = p ? "controlled" : "uncontrolled";
                                    Df.warn("".concat(a, " is changing from ").concat(t, " to ").concat(r, ". Components should not switch from controlled to uncontrolled (or vice versa). Decide between using a controlled or uncontrolled value for the lifetime of the component."))
                                }
                                y.current = p
                            }), [p, a]), [d, n.useCallback((function(e) {
                                if (p) {
                                    var r, n = function(e) {
                                        return "function" == typeof e
                                    }(e) ? e(t) : e;
                                    n !== t && (null === (r = f.current) || void 0 === r || r.call(f, n))
                                } else s(e)
                            }), [p, t, s, f])]
                        }({
                            prop: c,
                            defaultProp: null != l ? l : null,
                            onChange: s,
                            caller: pp
                        }),
                        b = Vf(g, 2),
                        w = b[0],
                        S = b[1],
                        A = Vf(n.useState(!1), 2),
                        x = A[0],
                        E = A[1],
                        O = function(e) {
                            var t = n.useRef(e);
                            return n.useEffect((function() {
                                t.current = e
                            })), n.useMemo((function() {
                                return function() {
                                    for (var e, r = arguments.length, n = new Array(r), o = 0; o < r; o++) n[o] = arguments[o];
                                    return null === (e = t.current) || void 0 === e ? void 0 : e.call.apply(e, [t].concat(n))
                                }
                            }), [])
                        }(f),
                        P = mp(r),
                        j = n.useRef(!1),
                        R = Vf(n.useState(0), 2),
                        I = R[0],
                        C = R[1];
                    return n.useEffect((function() {
                        var e = v.current;
                        if (e) return e.addEventListener(sp, O),
                            function() {
                                return e.removeEventListener(sp, O)
                            }
                    }), [O]), (0, L.jsx)(Sp, {
                        scope: r,
                        orientation: o,
                        dir: h,
                        loop: a,
                        currentTabStopId: w,
                        onItemFocus: n.useCallback((function(e) {
                            return S(e)
                        }), [S]),
                        onItemShiftTab: n.useCallback((function() {
                            return E(!0)
                        }), []),
                        onFocusableItemAdd: n.useCallback((function() {
                            return C((function(e) {
                                return e + 1
                            }))
                        }), []),
                        onFocusableItemRemove: n.useCallback((function() {
                            return C((function(e) {
                                return e - 1
                            }))
                        }), []),
                        children: (0, L.jsx)(up.div, Kf(Kf({
                            tabIndex: x || 0 === I ? -1 : 0,
                            "data-orientation": o
                        }, y), {}, {
                            ref: m,
                            style: Kf({
                                outline: "none"
                            }, e.style),
                            onMouseDown: Zf(e.onMouseDown, (function() {
                                j.current = !0
                            })),
                            onFocus: Zf(e.onFocus, (function(e) {
                                var t = !j.current;
                                if (e.target === e.currentTarget && t && !x) {
                                    var r = new CustomEvent(sp, fp);
                                    if (e.currentTarget.dispatchEvent(r), !r.defaultPrevented) {
                                        var n = P().filter((function(e) {
                                            return e.focusable
                                        }));
                                        Rp([n.find((function(e) {
                                            return e.active
                                        })), n.find((function(e) {
                                            return e.id === w
                                        }))].concat($f(n)).filter(Boolean).map((function(e) {
                                            return e.ref.current
                                        })), d)
                                    }
                                }
                                j.current = !1
                            })),
                            onBlur: Zf(e.onBlur, (function() {
                                return E(!1)
                            }))
                        }))
                    })
                })),
                Op = "RovingFocusGroupItem",
                Pp = n.forwardRef((function(e, t) {
                    var r = e.__scopeRovingFocusGroup,
                        o = e.focusable,
                        i = void 0 === o || o,
                        a = e.active,
                        u = void 0 !== a && a,
                        c = e.tabStopId,
                        l = e.children,
                        s = qf(e, zf),
                        f = Gt(),
                        p = c || f,
                        d = Ap(Op, r),
                        y = d.currentTabStopId === p,
                        v = mp(r),
                        m = d.onFocusableItemAdd,
                        h = d.onFocusableItemRemove,
                        g = d.currentTabStopId;
                    return n.useEffect((function() {
                        if (i) return m(),
                            function() {
                                return h()
                            }
                    }), [i, m, h]), (0, L.jsx)(vp.ItemSlot, {
                        scope: r,
                        id: p,
                        focusable: i,
                        active: u,
                        children: (0, L.jsx)(up.span, Kf(Kf({
                            tabIndex: y ? 0 : -1,
                            "data-orientation": d.orientation
                        }, s), {}, {
                            ref: t,
                            onMouseDown: Zf(e.onMouseDown, (function(e) {
                                i ? d.onItemFocus(p) : e.preventDefault()
                            })),
                            onFocus: Zf(e.onFocus, (function() {
                                return d.onItemFocus(p)
                            })),
                            onKeyDown: Zf(e.onKeyDown, (function(e) {
                                if ("Tab" === e.key && e.shiftKey) d.onItemShiftTab();
                                else if (e.target === e.currentTarget) {
                                    var t, r, n = function(e, t, r) {
                                        var n = function(e, t) {
                                            return "rtl" !== t ? e : "ArrowLeft" === e ? "ArrowRight" : "ArrowRight" === e ? "ArrowLeft" : e
                                        }(e.key, r);
                                        return "vertical" === t && ["ArrowLeft", "ArrowRight"].includes(n) || "horizontal" === t && ["ArrowUp", "ArrowDown"].includes(n) ? void 0 : jp[n]
                                    }(e, d.orientation, d.dir);
                                    if (void 0 !== n) {
                                        if (e.metaKey || e.ctrlKey || e.altKey || e.shiftKey) return;
                                        e.preventDefault();
                                        var o = v().filter((function(e) {
                                            return e.focusable
                                        })).map((function(e) {
                                            return e.ref.current
                                        }));
                                        if ("last" === n) o.reverse();
                                        else if ("prev" === n || "next" === n) {
                                            "prev" === n && o.reverse();
                                            var i = o.indexOf(e.currentTarget);
                                            o = d.loop ? (r = i + 1, (t = o).map((function(e, n) {
                                                return t[(r + n) % t.length]
                                            }))) : o.slice(i + 1)
                                        }
                                        setTimeout((function() {
                                            return Rp(o)
                                        }))
                                    }
                                }
                            })),
                            children: "function" == typeof l ? l({
                                isCurrentTabStop: y,
                                hasTabStop: null != g
                            }) : l
                        }))
                    })
                }));
            Pp.displayName = Op;
            var jp = {
                ArrowLeft: "prev",
                ArrowUp: "prev",
                ArrowRight: "next",
                ArrowDown: "next",
                PageUp: "first",
                Home: "first",
                PageDown: "last",
                End: "last"
            };

            function Rp(e) {
                var t, r = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                    n = document.activeElement,
                    o = function(e, t) {
                        var r;
                        if ("undefined" == typeof Symbol || null == e[Symbol.iterator]) {
                            if (Array.isArray(e) || (r = Hf(e)) || t && e && "number" == typeof e.length) {
                                r && (e = r);
                                var n = 0,
                                    o = function() {};
                                return {
                                    s: o,
                                    n: function() {
                                        return n >= e.length ? {
                                            done: !0
                                        } : {
                                            done: !1,
                                            value: e[n++]
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
                        var i, a = !0,
                            u = !1;
                        return {
                            s: function() {
                                r = e[Symbol.iterator]()
                            },
                            n: function() {
                                var e = r.next();
                                return a = e.done, e
                            },
                            e: function(e) {
                                u = !0, i = e
                            },
                            f: function() {
                                try {
                                    a || null == r.return || r.return()
                                } finally {
                                    if (u) throw i
                                }
                            }
                        }
                    }(e);
                try {
                    for (o.s(); !(t = o.n()).done;) {
                        var i = t.value;
                        if (i === n) return;
                        if (i.focus({
                                preventScroll: r
                            }), document.activeElement !== n) return
                    }
                } catch (e) {
                    o.e(e)
                } finally {
                    o.f()
                }
            }
            var Ip = xp,
                Cp = Pp,
                kp = r(4364),
                Fp = {
                    XSmall: "radius-medium",
                    Small: "radius-large",
                    Medium: "radius-large",
                    Large: "radius-large"
                },
                Np = {
                    XSmall: "padding-xsmall",
                    Small: "padding-small",
                    Medium: "padding-small",
                    Large: "padding-small"
                },
                Tp = {
                    XSmall: "padding-x-medium",
                    Small: "padding-x-medium",
                    Medium: "padding-x-medium",
                    Large: "padding-x-large"
                },
                _p = {
                    XSmall: "padding-y-xsmall",
                    Small: "padding-y-small",
                    Medium: "padding-y-small",
                    Large: "padding-y-medium"
                },
                Dp = {
                    XSmall: "gap-x-medium",
                    Small: "gap-x-medium",
                    Medium: "gap-x-medium",
                    Large: "gap-x-large"
                },
                Mp = {
                    XSmall: "gap-y-xxsmall",
                    Small: "gap-y-xxsmall",
                    Medium: "gap-y-xsmall",
                    Large: "gap-y-xsmall"
                },
                Up = {
                    XSmall: "text-body-small",
                    Small: "text-body-small",
                    Medium: "text-body-medium",
                    Large: "text-body-large"
                },
                Bp = {
                    XSmall: "radius-small",
                    Small: "radius-medium",
                    Medium: "radius-medium",
                    Large: "radius-medium"
                },
                Lp = (0, n.createContext)(null),
                Wp = function() {
                    var e = (0, n.useContext)(Lp);
                    if (!e) throw new Error("Menu components must be used within a Menu");
                    return e
                },
                Gp = function(e) {
                    var t, r = e.children,
                        i = e.className,
                        a = e.size,
                        u = (0, n.useContext)(jf),
                        c = u ? "dropdown" : "standalone",
                        l = null !== (t = null != a ? a : null == u ? void 0 : u.size) && void 0 !== t ? t : "Medium",
                        s = (0, n.useMemo)((function() {
                            return {
                                size: l,
                                mode: c
                            }
                        }), [l, c]),
                        f = B("foundation-web-menu bg-surface-100 stroke-standard stroke-default shadow-transient-high", Fp[l], i),
                        p = "standalone" === c ? o().createElement(Ip, {
                            asChild: !0,
                            orientation: "vertical",
                            loop: !0
                        }, o().createElement("div", {
                            role: "menu",
                            tabIndex: -1,
                            className: f
                        }, r)) : o().createElement("div", {
                            className: f
                        }, r);
                    return o().createElement(Lp.Provider, {
                        value: s
                    }, "dropdown" === c ? o().createElement(Ef, {
                        asChild: !0,
                        style: {
                            width: "var(--radix-popper-anchor-width)"
                        }
                    }, p) : p)
                },
                zp = function(e) {
                    var t = e.children,
                        r = e.className,
                        n = Wp().size;
                    return o().createElement("div", {
                        role: "group",
                        className: B(Np[n], r)
                    }, t)
                },
                Vp = function(e) {
                    var t = e.value,
                        r = e.leading,
                        n = e.title,
                        i = e.description,
                        a = e.trailing,
                        u = e.disabled,
                        c = e.className,
                        l = e.onSelect,
                        s = e.asChild,
                        f = e.children,
                        p = M(e, ["value", "leading", "title", "description", "trailing", "disabled", "className", "onSelect", "asChild", "children"]),
                        d = Wp(),
                        y = d.size,
                        v = d.mode,
                        m = B(ba, "foundation-web-menu-item flex items-center content-default text-truncate-split focus-visible:hover:outline-none cursor-pointer stroke-none bg-none text-align-x-left width-full", Up[y], Tp[y], _p[y], Dp[y], Bp[y], u && Sa, u && "pointer-events-none", c),
                        h = o().createElement("span", {
                            className: "foundation-web-menu-item-title text-no-wrap text-truncate-split content-emphasis"
                        }, n);
                    switch (v) {
                        case "dropdown":
                            h = o().createElement(Pf, {
                                asChild: !0
                            }, h);
                            break;
                        case "standalone":
                            break;
                        default:
                            var g = v;
                            kp.error("Invalid menu mode:", g)
                    }
                    var b, w = o().createElement(o().Fragment, null, !u && o().createElement(wa, null), r, o().createElement("div", {
                        className: B("grow-1 text-truncate-split flex flex-col", Mp[y])
                    }, h, i && o().createElement("div", {
                        className: "foundation-web-menu-item-description content-muted"
                    }, i)), a);
                    if (s) {
                        var S = M(p, ["as"]),
                            A = o().Children.only(f),
                            x = void 0 === n && A.props.children;
                        b = o().createElement(ma, Object.assign({}, S, {
                            role: "standalone" === v ? "menuitem" : void 0,
                            "aria-disabled": u || void 0,
                            className: m,
                            style: {
                                outlineOffset: 0
                            },
                            onClick: u ? void 0 : l
                        }), x ? o().cloneElement(A, {}, o().createElement(o().Fragment, null, !u && o().createElement(wa, null), A.props.children)) : o().cloneElement(A, {}, w))
                    } else if ("a" === p.as) {
                        p.as;
                        var E = p.href,
                            O = M(p, ["as", "href"]);
                        b = o().createElement("a", Object.assign({}, O, {
                            role: "standalone" === v ? "menuitem" : void 0,
                            "aria-disabled": u,
                            href: u ? void 0 : E,
                            className: m,
                            style: {
                                outlineOffset: 0,
                                textDecoration: "none"
                            },
                            onClick: u ? void 0 : l
                        }), w)
                    } else {
                        var P = M(p, ["as"]);
                        b = o().createElement("button", Object.assign({
                            type: "button"
                        }, P, {
                            role: "standalone" === v ? "menuitem" : void 0,
                            "aria-disabled": u,
                            className: m,
                            style: {
                                outlineOffset: 0
                            },
                            onClick: u ? void 0 : l
                        }), w)
                    }
                    return "dropdown" === v ? o().createElement(Of, {
                        value: t,
                        disabled: u,
                        asChild: !0
                    }, b) : o().createElement(Cp, {
                        asChild: !0,
                        focusable: !0,
                        tabStopId: t
                    }, b)
                },
                qp = RobloxThumbnails,
                $p = function(e) {
                    var t = e.button,
                        r = e.onToggle,
                        i = t.props.onClick;
                    return o().createElement(na, {
                        asChild: !0
                    }, (0, n.cloneElement)(t, {
                        onClick: function(e) {
                            null == i || i(e), e.preventDefault(), r()
                        }
                    }))
                };
            ea("@keyframes rotation{0%{transform:rotate(0deg)}to{transform:rotate(359deg)}}.foundation-web-loading-spinner{animation:rotation 1s linear infinite normal}");
            var Hp, Jp, Xp, Kp, Yp, Zp, Qp, ed, td = function(e) {
                    var t = e.width,
                        r = e.height;
                    return o().createElement("svg", {
                        className: "foundation-web-loading-spinner",
                        width: t,
                        height: r,
                        viewBox: "0 0 20 20",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg"
                    }, o().createElement("path", {
                        fillRule: "evenodd",
                        clipRule: "evenodd",
                        fill: "currentColor",
                        d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                    }))
                },
                rd = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                nd = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                od = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-alert", "content-action-alert"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                id = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                ad = (0, n.forwardRef)((function(e, t) {
                    var r = e.children,
                        n = e.className,
                        i = e.style,
                        a = e.isDisabled,
                        u = void 0 !== a && a,
                        c = e.isLoading,
                        l = void 0 !== c && c,
                        s = e.icon,
                        f = e.size,
                        p = void 0 === f ? "Large" : f,
                        d = e.variant,
                        y = void 0 === d ? "Emphasis" : d,
                        v = e.asChild,
                        m = M(e, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        h = B("foundation-web-button", u ? Sa : [ba, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", nd[p], u ? id[y] : od[y], n),
                        g = Object.assign({
                            textDecoration: "none"
                        }, i),
                        b = function(e) {
                            return o().createElement(o().Fragment, null, o().createElement(wa, null), l && o().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, o().createElement(td, {
                                width: rd[p],
                                height: rd[p]
                            })), o().createElement("span", {
                                className: B("flex items-center min-width-0", "Large" === p || "Medium" === p ? "gap-small" : "gap-xsmall", l && "invisible")
                            }, s && o().createElement(nu, {
                                name: s,
                                size: p
                            }), o().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, e)))
                        };
                    if (v) {
                        var w = M(m, ["as"]),
                            S = o().Children.only(r);
                        return o().createElement(ma, Object.assign({
                            ref: t
                        }, w, {
                            className: h,
                            style: g,
                            "aria-disabled": u || void 0
                        }), o().cloneElement(S, {}, b(S.props.children)))
                    }
                    if ("a" === m.as) {
                        m.as;
                        var A = m.href,
                            x = M(m, ["as", "href"]);
                        return o().createElement("a", Object.assign({
                            ref: t
                        }, x, {
                            "aria-disabled": u,
                            href: u ? void 0 : A,
                            className: h,
                            style: g
                        }), b(r))
                    }
                    var E = M(m, ["as"]);
                    return o().createElement("button", Object.assign({
                        ref: t,
                        type: "button"
                    }, E, {
                        disabled: u,
                        className: h,
                        style: g
                    }), b(r))
                })),
                ud = "virtualEvents",
                cd = "groupDetailsPage",
                ld = "virtualEventJoined",
                sd = "eventDetailsPageVisit",
                fd = "virtualEventRSVP",
                pd = {
                    sendVirtualEventJoinedEvent: function(e, r, n) {
                        t().EventStream.SendEventWithTarget(ld, ud, {
                            virtualEventId: e,
                            universeId: r,
                            "SD.gamePlayFromEventDetails.ID": n,
                            "SD.gamePlayFromEventDetails.CT": Date.now(),
                            channel: cd
                        }, t().EventStream.TargetTypes.WWW)
                    },
                    sendEventDetailsPageVisitEvent: function(e, r) {
                        t().EventStream.SendEventWithTarget(sd, ud, {
                            virtualEventId: e,
                            universeId: r,
                            channel: cd
                        }, t().EventStream.TargetTypes.WWW)
                    },
                    sendVirtualEventRSVPEvent: function(e, r, n) {
                        t().EventStream.SendEventWithTarget(fd, ud, {
                            virtualEventId: e,
                            universeId: r,
                            channel: cd,
                            status: n
                        }, t().EventStream.TargetTypes.WWW)
                    }
                },
                dd = function(e, t, r, n) {
                    return new(r || (r = Promise))((function(o, i) {
                        function a(e) {
                            try {
                                c(n.next(e))
                            } catch (e) {
                                i(e)
                            }
                        }

                        function u(e) {
                            try {
                                c(n.throw(e))
                            } catch (e) {
                                i(e)
                            }
                        }

                        function c(e) {
                            var t;
                            e.done ? o(e.value) : (t = e.value, t instanceof r ? t : new r((function(e) {
                                e(t)
                            }))).then(a, u)
                        }
                        c((n = n.apply(e, t || [])).next())
                    }))
                },
                yd = function(e, t) {
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
                    return a.next = u(0), a.throw = u(1), a.return = u(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                        return this
                    }), a;

                    function u(u) {
                        return function(c) {
                            return function(u) {
                                if (r) throw new TypeError("Generator is already executing.");
                                for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                    if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                    switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                        case 0:
                                        case 1:
                                            o = u;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: u[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, n = u[1], u = [0];
                                            continue;
                                        case 7:
                                            u = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = i.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== u[0] && 2 !== u[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                i.label = u[1];
                                                break
                                            }
                                            if (6 === u[0] && i.label < o[1]) {
                                                i.label = o[1], o = u;
                                                break
                                            }
                                            if (o && i.label < o[2]) {
                                                i.label = o[2], i.ops.push(u);
                                                break
                                            }
                                            o[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    u = t.call(e, i)
                                } catch (e) {
                                    u = [6, e], n = 0
                                } finally {
                                    r = o = 0
                                }
                                if (5 & u[0]) throw u[1];
                                return {
                                    value: u[0] ? u[1] : void 0,
                                    done: !0
                                }
                            }([u, c])
                        }
                    }
                },
                vd = e.PlayButton.launchGame,
                md = E,
                hd = (0, u.withTranslations)((function(t) {
                    var r = t.event,
                        i = t.gameDetails,
                        a = t.systemFeedbackService,
                        u = t.translate,
                        c = (0, n.useState)(r.userRsvpStatus === md.going),
                        l = c[0],
                        s = c[1],
                        f = (0, n.useCallback)((function(e) {
                            return dd(void 0, void 0, void 0, (function() {
                                return yd(this, (function(t) {
                                    switch (t.label) {
                                        case 0:
                                            e.preventDefault(), e.stopPropagation(), t.label = 1;
                                        case 1:
                                            return t.trys.push([1, 3, , 4]), [4, C(r.id, md.going)];
                                        case 2:
                                            return t.sent(), s(!0), pd.sendVirtualEventRSVPEvent(r.id, r.universeId, md.going), [3, 4];
                                        case 3:
                                            return t.sent(), a.warning(u("NetworkError")), [3, 4];
                                        case 4:
                                            return [2]
                                    }
                                }))
                            }))
                        }), [r.id, r.universeId, s, a, u]),
                        p = (0, n.useCallback)((function(e) {
                            return dd(void 0, void 0, void 0, (function() {
                                return yd(this, (function(t) {
                                    switch (t.label) {
                                        case 0:
                                            e.preventDefault(), e.stopPropagation(), t.label = 1;
                                        case 1:
                                            return t.trys.push([1, 3, , 4]), [4, C(r.id, md.notGoing)];
                                        case 2:
                                            return t.sent(), s(!1), pd.sendVirtualEventRSVPEvent(r.id, r.universeId, md.notGoing), [3, 4];
                                        case 3:
                                            return t.sent(), a.warning(u("NetworkError")), [3, 4];
                                        case 4:
                                            return [2]
                                    }
                                }))
                            }))
                        }), [r.id, r.universeId, s, a, u]),
                        y = (0, n.useCallback)((function(t) {
                            if (t.preventDefault(), t.stopPropagation(), i) {
                                var n = d.uuidService.generateRandomUuid(),
                                    o = r.placeId || i.rootPlaceId.toString();
                                e.DeviceMeta && (0, e.DeviceMeta)().isInApp ? window.location.href = "roblox://experiences/start?placeId=".concat(o) : vd(o, i.rootPlaceId.toString(), "", void 0, {
                                    eventName: "virtualEventJoinGame",
                                    ctx: "virtualEvents",
                                    eventJoinSessionId: n
                                }, {}), pd.sendVirtualEventJoinedEvent(r.id, r.universeId, n)
                            }
                        }), [i, r.id, r.universeId]);
                    return (0, n.useMemo)((function() {
                        return Date.now() > Date.parse(r.eventTime.startUtc)
                    }), [r]) ? o().createElement(ad, {
                        type: "button",
                        variant: "Emphasis",
                        size: "Medium",
                        className: "group-event-join-button",
                        onClick: y
                    }, u("JoinEvent")) : l ? o().createElement(ad, {
                        type: "button",
                        variant: "Standard",
                        size: "Medium",
                        className: "group-event-join-button",
                        onClick: p
                    }, u("UnfollowEvent")) : o().createElement(ad, {
                        type: "button",
                        variant: "Emphasis",
                        size: "Medium",
                        className: "group-event-join-button",
                        onClick: f
                    }, u("NotifyMe"))
                }), f);
            ! function(e) {
                e.GroupPageClickEvent = "groupPageClickEvent", e.GroupPageExposureEvent = "groupPageExposureEvent", e.GroupForumsExposureEvent = "groupForumsExposureEvent", e.GroupForumPostExposureEvent = "groupForumPostExposureEvent", e.CmntyAgeCheckBannerShownEvent = "cmntyAgeCheckBannerShownEvent", e.CmntyAnalyticsExposureEvent = "cmntyAnalyticsExposureEvent", e.CmntyAnalyticsClickEvent = "cmntyAnalyticsClickEvent"
            }(Hp || (Hp = {})),
            function(e) {
                e.GroupHomepage = "groupHomepage", e.GroupForums = "groupForums", e.ConfigureGroup = "configureGroup", e.CommunitiesPage = "communitiesPage", e.CommunitiesSearch = "communitiesSearch"
            }(Jp || (Jp = {})),
            function(e) {
                e.CommunitiesPage = "communitiesPage", e.CommunitiesSearch = "communitiesSearch"
            }(Xp || (Xp = {})),
            function(e) {
                e.SearchResults = "searchResults", e.CategoryBrowse = "categoryBrowse", e.FriendsCommunities = "friendsCommunities"
            }(Kp || (Kp = {})),
            function(e) {
                e.CommunitiesSearch = "communitiesSearch"
            }(Yp || (Yp = {})),
            function(e) {
                e.ForumsTab = "forums"
            }(Zp || (Zp = {})),
            function(e) {
                e.BannerComponent = "Banner", e.IntrusiveModal = "IntrusiveModal", e.CategoryUpsell = "CategoryUpsell"
            }(Qp || (Qp = {})),
            function(e) {
                e.CreatePost = "createPost", e.WriteComment = "writeComment", e.InteractComment = "interactComment", e.AccessRestrictedCategory = "accessRestrictedCategory"
            }(ed || (ed = {}));
            var gd = r(4364),
                bd = !1,
                wd = null,
                Sd = function() {
                    var e, t = null === (e = window.Roblox) || void 0 === e ? void 0 : e.CommunityTelemetry;
                    return t || (bd || (bd = !0, gd.warn('Roblox.CommunityTelemetry is unavailable; community telemetry is disabled for this page. Ensure the "CommunityTelemetry" static content component is in this bundle\'s componentDependencies.')), function() {
                        if (wd) return wd;
                        var e = function() {},
                            t = function() {
                                return ""
                            },
                            r = function() {
                                return {}
                            };
                        return wd = {
                            getImpressionId: t,
                            updateImpressionId: t,
                            getMetricEvent: r,
                            CommunityMetric: new Proxy({}, {
                                get: function() {
                                    return r
                                }
                            }),
                            CommunityEventStream: {
                                sendEvent: e
                            },
                            getCommonParams: function() {
                                return {
                                    pageRoute: "",
                                    locationTab: "",
                                    groupId: 0,
                                    isValid: !1
                                }
                            },
                            getPageRoute: t,
                            getSanitizedReferrer: t,
                            getCommunitySessionEnterFrom: t,
                            mintEntrypointImpressionId: t,
                            mintSearchId: t,
                            useEntrypointImpressionId: t,
                            logGroupPageExposureEvent: e,
                            logGroupPageClickEvent: e,
                            logCmntyEntrypointExposureEvent: e,
                            logCmntyEntrypointClickEvent: e,
                            logCmntySearchConductedEvent: e,
                            logCmntySearchResultsReturnedEvent: e,
                            logGroupForumsClickEvent: e
                        }
                    }())
                },
                Ad = function(e) {
                    return Sd().logGroupPageClickEvent(e)
                },
                xd = function(e, t, r, n) {
                    return new(r || (r = Promise))((function(o, i) {
                        function a(e) {
                            try {
                                c(n.next(e))
                            } catch (e) {
                                i(e)
                            }
                        }

                        function u(e) {
                            try {
                                c(n.throw(e))
                            } catch (e) {
                                i(e)
                            }
                        }

                        function c(e) {
                            var t;
                            e.done ? o(e.value) : (t = e.value, t instanceof r ? t : new r((function(e) {
                                e(t)
                            }))).then(a, u)
                        }
                        c((n = n.apply(e, t || [])).next())
                    }))
                },
                Ed = function(e, t) {
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
                    return a.next = u(0), a.throw = u(1), a.return = u(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                        return this
                    }), a;

                    function u(u) {
                        return function(c) {
                            return function(u) {
                                if (r) throw new TypeError("Generator is already executing.");
                                for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                    if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                    switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                        case 0:
                                        case 1:
                                            o = u;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: u[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, n = u[1], u = [0];
                                            continue;
                                        case 7:
                                            u = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = i.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== u[0] && 2 !== u[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                i.label = u[1];
                                                break
                                            }
                                            if (6 === u[0] && i.label < o[1]) {
                                                i.label = o[1], o = u;
                                                break
                                            }
                                            if (o && i.label < o[2]) {
                                                i.label = o[2], i.ops.push(u);
                                                break
                                            }
                                            o[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    u = t.call(e, i)
                                } catch (e) {
                                    u = [6, e], n = 0
                                } finally {
                                    r = o = 0
                                }
                                if (5 & u[0]) throw u[1];
                                return {
                                    value: u[0] ? u[1] : void 0,
                                    done: !0
                                }
                            }([u, c])
                        }
                    }
                },
                Od = (0, c.createSystemFeedback)(),
                Pd = Od[0],
                jd = Od[1],
                Rd = (new e.Intl).locale,
                Id = "group-event-dropdown-menu",
                Cd = (0, u.withTranslations)((function(e) {
                    var t = e.group,
                        r = e.event,
                        i = e.gameDetails,
                        a = e.featuredEventId,
                        u = e.setFeaturedEventId,
                        l = e.canSetFeaturedEvent,
                        s = e.isFullSized,
                        f = e.translate,
                        p = (0, n.useState)(!1),
                        d = p[0],
                        y = p[1],
                        v = (0, n.useMemo)((function() {
                            return a === r.id
                        }), [a, r.id]),
                        m = (0, n.useCallback)((function() {
                            return xd(void 0, void 0, void 0, (function() {
                                return Ed(this, (function(e) {
                                    switch (e.label) {
                                        case 0:
                                            return e.trys.push([0, 5, , 6]), v ? [4, _(t.id, r.id)] : [3, 2];
                                        case 1:
                                            return e.sent(), u(void 0), jd.success(f("Message.UnfeatureEventSuccess")), [3, 4];
                                        case 2:
                                            return [4, T(t.id, r.id)];
                                        case 3:
                                            e.sent(), u(r.id), jd.success(f("Message.FeatureEventSuccess")), e.label = 4;
                                        case 4:
                                            return Ad({
                                                groupId: t.id,
                                                clickTargetType: v ? "unfeatureEvent" : "featureEvent",
                                                clickTargetId: r.id.toString(),
                                                context: Jp.GroupHomepage
                                            }), [3, 6];
                                        case 5:
                                            return e.sent(), jd.warning(f("NetworkError")), [3, 6];
                                        case 6:
                                            return [2]
                                    }
                                }))
                            }))
                        }), [v, u, t.id, r.id, f]),
                        h = (0, n.useMemo)((function() {
                            var e = new Date(Date.parse(r.eventTime.startUtc)),
                                t = e.toLocaleString(Rd, {
                                    weekday: "short",
                                    month: "short",
                                    day: "numeric"
                                }),
                                n = e.toLocaleString(Rd, {
                                    hour: "numeric",
                                    minute: "numeric",
                                    hour12: !0
                                });
                            return f("Label.EventDate", {
                                dayString: t,
                                timeString: n
                            })
                        }), [r, f]),
                        g = (0, n.useMemo)((function() {
                            var e, t;
                            return (null === (t = null === (e = r.thumbnails) || void 0 === e ? void 0 : e[0]) || void 0 === t ? void 0 : t.mediaId) || r.universeId
                        }), [r]),
                        b = (0, n.useMemo)((function() {
                            var e, t;
                            return (null === (t = null === (e = r.thumbnails) || void 0 === e ? void 0 : e[0]) || void 0 === t ? void 0 : t.mediaId) ? qp.ThumbnailTypes.assetThumbnail : qp.ThumbnailTypes.universeThumbnail
                        }), [r]),
                        w = (0, n.useCallback)((function() {
                            return y((function(e) {
                                return !e
                            }))
                        }), []),
                        S = (0, n.useCallback)((function() {
                            y(!1), m()
                        }), [m]),
                        x = (0, n.useCallback)((function(e) {
                            e.target instanceof Element && e.target.closest(".".concat(Id)) || pd.sendEventDetailsPageVisitEvent(r.id, r.universeId)
                        }), [r.id, r.universeId]);
                    return o().createElement(c.Link, {
                        "aria-label": r.title,
                        onClick: x,
                        url: A.getEventUrl(r.id)
                    }, o().createElement("div", {
                        className: "group-event"
                    }, o().createElement("div", {
                        className: "group-event-thumbnail"
                    }, o().createElement(qp.Thumbnail2d, {
                        type: b,
                        size: qp.ThumbnailUniverseThumbnailSize.width768,
                        targetId: g,
                        containerClass: "group-event-thumbnail-container"
                    })), o().createElement("div", {
                        className: "group-event-content"
                    }, o().createElement("div", {
                        className: "group-event-header"
                    }, o().createElement("h2", null, r.title)), o().createElement("div", {
                        className: "group-event-date text-default font-bold"
                    }, h), s && o().createElement("div", {
                        className: "group-event-description text-description"
                    }, r.description), o().createElement("div", {
                        className: "group-event-follow-button"
                    }, o().createElement(hd, {
                        event: r,
                        gameDetails: i,
                        systemFeedbackService: jd
                    }), l && o().createElement(ra, {
                        open: d,
                        onOpenChange: y
                    }, o().createElement($p, {
                        button: o().createElement(Ca, {
                            className: "group-event-feature-button",
                            icon: "icon-filled-three-dots-horizontal",
                            variant: "Utility",
                            size: "Small",
                            ariaLabel: f("Action.More"),
                            onClick: function(e) {
                                e.preventDefault(), e.stopPropagation()
                            }
                        }),
                        onToggle: w
                    }), o().createElement(oa, {
                        ariaLabel: f("Label.OverflowMenu"),
                        side: "bottom",
                        align: "end"
                    }, o().createElement(Gp, {
                        className: Id,
                        size: "Medium"
                    }, o().createElement(zp, null, o().createElement(Vp, {
                        value: "feature-event",
                        title: f(v ? "Action.UnfeatureEvent" : "Action.FeatureEvent"),
                        onSelect: S
                    })))))))), o().createElement(Pd, null))
                }), p),
                kd = function(e, t, r, n) {
                    return new(r || (r = Promise))((function(o, i) {
                        function a(e) {
                            try {
                                c(n.next(e))
                            } catch (e) {
                                i(e)
                            }
                        }

                        function u(e) {
                            try {
                                c(n.throw(e))
                            } catch (e) {
                                i(e)
                            }
                        }

                        function c(e) {
                            var t;
                            e.done ? o(e.value) : (t = e.value, t instanceof r ? t : new r((function(e) {
                                e(t)
                            }))).then(a, u)
                        }
                        c((n = n.apply(e, t || [])).next())
                    }))
                },
                Fd = function(e, t) {
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
                    return a.next = u(0), a.throw = u(1), a.return = u(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                        return this
                    }), a;

                    function u(u) {
                        return function(c) {
                            return function(u) {
                                if (r) throw new TypeError("Generator is already executing.");
                                for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                    if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                    switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                        case 0:
                                        case 1:
                                            o = u;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: u[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, n = u[1], u = [0];
                                            continue;
                                        case 7:
                                            u = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = i.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== u[0] && 2 !== u[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                i.label = u[1];
                                                break
                                            }
                                            if (6 === u[0] && i.label < o[1]) {
                                                i.label = o[1], o = u;
                                                break
                                            }
                                            if (o && i.label < o[2]) {
                                                i.label = o[2], i.ops.push(u);
                                                break
                                            }
                                            o[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    u = t.call(e, i)
                                } catch (e) {
                                    u = [6, e], n = 0
                                } finally {
                                    r = o = 0
                                }
                                if (5 & u[0]) throw u[1];
                                return {
                                    value: u[0] ? u[1] : void 0,
                                    done: !0
                                }
                            }([u, c])
                        }
                    }
                },
                Nd = (0, u.withTranslations)((function(e) {
                    var t = e.group,
                        r = e.translate,
                        i = (0, n.useState)(null),
                        a = i[0],
                        u = i[1],
                        l = (0, n.useState)(!0),
                        s = l[0],
                        f = l[1],
                        p = (0, n.useCallback)((function() {
                            return kd(void 0, void 0, void 0, (function() {
                                var e, r, n;
                                return Fd(this, (function(o) {
                                    switch (o.label) {
                                        case 0:
                                            if (!(null == t ? void 0 : t.id)) return [2];
                                            o.label = 1;
                                        case 1:
                                            return o.trys.push([1, 3, 4, 5]), [4, F(t.id)];
                                        case 2:
                                            if ((e = o.sent()).length > 0) {
                                                for (r = e[0], n = 1; n < e.length; n++) e[n].placeVisits > r.placeVisits && (r = e[n]);
                                                u(r)
                                            }
                                            return [3, 5];
                                        case 3:
                                            return o.sent(), u(null), [3, 5];
                                        case 4:
                                            return f(!1), [7];
                                        case 5:
                                            return [2]
                                    }
                                }))
                            }))
                        }), [t, u]);
                    (0, n.useEffect)((function() {
                        p()
                    }), [p]);
                    var d = (0, n.useMemo)((function() {
                            return null == a ? A.getCreateExperienceUrl(t.id) : A.getCreateEventForExperienceUrl(a.id)
                        }), [a, t.id]),
                        y = (0, n.useCallback)((function() {
                            Ad({
                                groupId: t.id,
                                clickTargetType: "createEvent",
                                context: Jp.GroupHomepage
                            })
                        }), [t.id]);
                    return s ? o().createElement(c.Loading, null) : o().createElement("div", {
                        className: "section-content-off"
                    }, o().createElement("span", {
                        className: "group-event-calendar-icon"
                    }), o().createElement("h2", null, r("Label.GroupEventsUpsell")), o().createElement("span", null, r("Label.GroupEventsCreatorHubUpsell")), o().createElement(c.Link, {
                        url: d
                    }, o().createElement(ad, {
                        type: "button",
                        variant: "Emphasis",
                        size: "Medium",
                        className: "group-create-event-button",
                        onClick: y
                    }, r("Label.CreateEvent"))))
                }), p),
                Td = function(e, t, r, n) {
                    return new(r || (r = Promise))((function(o, i) {
                        function a(e) {
                            try {
                                c(n.next(e))
                            } catch (e) {
                                i(e)
                            }
                        }

                        function u(e) {
                            try {
                                c(n.throw(e))
                            } catch (e) {
                                i(e)
                            }
                        }

                        function c(e) {
                            var t;
                            e.done ? o(e.value) : (t = e.value, t instanceof r ? t : new r((function(e) {
                                e(t)
                            }))).then(a, u)
                        }
                        c((n = n.apply(e, t || [])).next())
                    }))
                },
                _d = function(e, t) {
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
                    return a.next = u(0), a.throw = u(1), a.return = u(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
                        return this
                    }), a;

                    function u(u) {
                        return function(c) {
                            return function(u) {
                                if (r) throw new TypeError("Generator is already executing.");
                                for (; a && (a = 0, u[0] && (i = 0)), i;) try {
                                    if (r = 1, n && (o = 2 & u[0] ? n.return : u[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, u[1])).done) return o;
                                    switch (n = 0, o && (u = [2 & u[0], o.value]), u[0]) {
                                        case 0:
                                        case 1:
                                            o = u;
                                            break;
                                        case 4:
                                            return i.label++, {
                                                value: u[1],
                                                done: !1
                                            };
                                        case 5:
                                            i.label++, n = u[1], u = [0];
                                            continue;
                                        case 7:
                                            u = i.ops.pop(), i.trys.pop();
                                            continue;
                                        default:
                                            if (!(o = i.trys, (o = o.length > 0 && o[o.length - 1]) || 6 !== u[0] && 2 !== u[0])) {
                                                i = 0;
                                                continue
                                            }
                                            if (3 === u[0] && (!o || u[1] > o[0] && u[1] < o[3])) {
                                                i.label = u[1];
                                                break
                                            }
                                            if (6 === u[0] && i.label < o[1]) {
                                                i.label = o[1], o = u;
                                                break
                                            }
                                            if (o && i.label < o[2]) {
                                                i.label = o[2], i.ops.push(u);
                                                break
                                            }
                                            o[2] && i.ops.pop(), i.trys.pop();
                                            continue
                                    }
                                    u = t.call(e, i)
                                } catch (e) {
                                    u = [6, e], n = 0
                                } finally {
                                    r = o = 0
                                }
                                if (5 & u[0]) throw u[1];
                                return {
                                    value: u[0] ? u[1] : void 0,
                                    done: !0
                                }
                            }([u, c])
                        }
                    }
                },
                Dd = x,
                Md = (0, u.withTranslations)((function(e) {
                    var t = e.onlyShowFeaturedEvent,
                        r = e.group,
                        i = e.canSetFeaturedEvent,
                        a = e.translate,
                        u = (0, n.useState)([]),
                        l = u[0],
                        f = u[1],
                        p = (0, n.useState)([]),
                        d = p[0],
                        y = p[1],
                        v = (0, n.useState)(),
                        m = v[0],
                        h = v[1],
                        g = (0, n.useState)(!0),
                        b = g[0],
                        w = g[1],
                        S = (0, n.useCallback)((function() {
                            return Td(void 0, void 0, void 0, (function() {
                                var e, n, o, i, a, u, c, l;
                                return _d(this, (function(s) {
                                    switch (s.label) {
                                        case 0:
                                            if (!(null == r ? void 0 : r.id)) return [2];
                                            s.label = 1;
                                        case 1:
                                            return s.trys.push([1, 9, 10, 11]), [4, N(r.id)];
                                        case 2:
                                            return e = s.sent(), h(null == e ? void 0 : e.contentId), n = void 0, t ? [4, I(e.contentId)] : [3, 4];
                                        case 3:
                                            return o = s.sent(), n = [o], [3, 7];
                                        case 4:
                                            return [4, R(r.id)];
                                        case 5:
                                            return i = s.sent(), [4, Promise.all(i.map((function(e) {
                                                return Td(void 0, void 0, void 0, (function() {
                                                    return _d(this, (function(t) {
                                                        return [2, I(e.id)]
                                                    }))
                                                }))
                                            })))];
                                        case 6:
                                            a = s.sent(), n = a, s.label = 7;
                                        case 7:
                                            return u = n.filter((function(e) {
                                                return e.eventStatus === Dd.active && Date.now() < Date.parse(e.eventTime.endUtc)
                                            })).sort((function(e, t) {
                                                return Date.parse(e.eventTime.startUtc) - Date.parse(t.eventTime.startUtc)
                                            })), f(u), c = n.map((function(e) {
                                                return e.universeId
                                            })), [4, k(c)];
                                        case 8:
                                            return l = s.sent(), y(l), [3, 11];
                                        case 9:
                                            return s.sent(), h(void 0), f([]), y([]), [3, 11];
                                        case 10:
                                            return w(!1), [7];
                                        case 11:
                                            return [2]
                                    }
                                }))
                            }))
                        }), [r, t]);
                    (0, n.useEffect)((function() {
                        S()
                    }), [S]);
                    var A = (0, n.useMemo)((function() {
                        return b ? o().createElement(c.Loading, null) : l && l.length > 0 ? o().createElement("div", {
                            className: s()("group-events group-section-content-transparent", t && "group-events-full-size")
                        }, l.map((function(e) {
                            return o().createElement(Cd, {
                                key: e.id,
                                group: r,
                                event: e,
                                gameDetails: (n = e.universeId, d.find((function(e) {
                                    return e.id === n
                                }))),
                                featuredEventId: m,
                                setFeaturedEventId: h,
                                canSetFeaturedEvent: i,
                                isFullSized: t
                            });
                            var n
                        }))) : t ? null : i ? o().createElement(Nd, {
                            group: r
                        }) : o().createElement("div", {
                            className: "section-content-off"
                        }, o().createElement("span", {
                            className: "group-event-calendar-icon"
                        }), o().createElement("h2", null, a("Label.NoGroupEvents")), o().createElement("span", null, a("Label.CheckLaterForEvents")))
                    }), [r, b, l, m, h, a, d, t, i]);
                    return !t || (null == l ? void 0 : l.length) && m ? o().createElement("div", {
                        className: "section"
                    }, o().createElement("div", {
                        className: "container-header group-events-header"
                    }, o().createElement("h2", null, a("Heading.Events"))), A) : null
                }), p),
                Ud = function() {
                    return Ud = Object.assign || function(e) {
                        for (var t, r = 1, n = arguments.length; r < n; r++)
                            for (var o in t = arguments[r]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
                        return e
                    }, Ud.apply(this, arguments)
                },
                Bd = {
                    renderGroupEventsSection: function(e, t) {
                        (0, i.unmountComponentAtNode)(e), (0, i.render)(o().createElement(Md, Ud({}, t)), e)
                    }
                };
            Object.assign(t(), {
                GroupEventsService: Bd
            })
        }()
}();
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/9cc7da525a3f239ae8f6b760f2419e16-groupEvents.bundle.min.js.map

/* Bundle detector */
window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("GroupEvents");