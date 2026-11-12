;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "db3bdc7f-c53a-4e19-69f3-c9609d3310ac")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 904875, 432139, 728463, e => {
    "use strict";

    function t(e) {
        return function(t) {
            return {
                concat: function(n, r) {
                    return e.ap(e.map(n, function(e) {
                        return function(n) {
                            return t.concat(e, n)
                        }
                    }), r)
                }
            }
        }
    }
    e.s(["ap", 0, function(e, t) {
        return function(n) {
            return function(r) {
                return e.ap(e.map(r, function(e) {
                    return function(n) {
                        return t.ap(e, n)
                    }
                }), n)
            }
        }
    }, "apFirst", 0, function(e) {
        return function(t) {
            return function(n) {
                return e.ap(e.map(n, function(e) {
                    return function() {
                        return e
                    }
                }), t)
            }
        }
    }, "apS", 0, function(e) {
        return function(t, n) {
            return function(r) {
                return e.ap(e.map(r, function(e) {
                    return function(n) {
                        var r;
                        return Object.assign({}, e, ((r = {})[t] = n, r))
                    }
                }), n)
            }
        }
    }, "apSecond", 0, function(e) {
        return function(t) {
            return function(n) {
                return e.ap(e.map(n, function() {
                    return function(e) {
                        return e
                    }
                }), t)
            }
        }
    }, "getApplySemigroup", 0, t], 432139), e.s(["getApplicativeMonoid", 0, function(e) {
        var n = t(e);
        return function(t) {
            return {
                concat: n(t).concat,
                empty: e.of(t.empty)
            }
        }
    }], 904875), e.s(["bind", 0, function(e) {
        return function(t, n) {
            return function(r) {
                return e.chain(r, function(r) {
                    return e.map(n(r), function(e) {
                        var n;
                        return Object.assign({}, r, ((n = {})[t] = e, n))
                    })
                })
            }
        }
    }, "tap", 0, function(e) {
        return function(t, n) {
            return e.chain(t, function(t) {
                return e.map(n(t), function() {
                    return t
                })
            })
        }
    }], 728463)
}, 760442, e => {
    "use strict";
    e.s(["tailRec", 0, function(e, t) {
        for (var n = t(e);
            "Left" === n._tag;) n = t(n.left);
        return n.right
    }])
}, 407406, e => {
    "use strict";
    var t = function(e, t, n) {
        if (n || 2 == arguments.length)
            for (var r, o = 0, i = t.length; o < i; o++) !r && o in t || (r || (r = Array.prototype.slice.call(t, 0, o)), r[o] = t[o]);
        return e.concat(r || Array.prototype.slice.call(t))
    };

    function n(e) {
        return function() {
            return e
        }
    }
    var r = n(!0),
        o = n(!1),
        i = n(null),
        u = n(void 0);
    e.s(["SK", 0, function(e, t) {
        return t
    }, "constFalse", 0, o, "constNull", 0, i, "constTrue", 0, r, "constUndefined", 0, u, "constant", 0, n, "dual", 0, function(e, n) {
        var r = "number" == typeof e ? function(t) {
            return t.length >= e
        } : e;
        return function() {
            var e = Array.from(arguments);
            return r(arguments) ? n.apply(this, e) : function(r) {
                return n.apply(void 0, t([r], e, !1))
            }
        }
    }, "flow", 0, function(e, t, n, r, o, i, u, a, c) {
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
                    return o(r(n(t(e.apply(this, arguments)))))
                };
            case 6:
                return function() {
                    return i(o(r(n(t(e.apply(this, arguments))))))
                };
            case 7:
                return function() {
                    return u(i(o(r(n(t(e.apply(this, arguments)))))))
                };
            case 8:
                return function() {
                    return a(u(i(o(r(n(t(e.apply(this, arguments))))))))
                };
            case 9:
                return function() {
                    return c(a(u(i(o(r(n(t(e.apply(this, arguments)))))))))
                }
        }
    }, "getSemigroup", 0, function(e) {
        return function() {
            return {
                concat: function(t, n) {
                    return function(r) {
                        return e.concat(t(r), n(r))
                    }
                }
            }
        }
    }, "identity", 0, function(e) {
        return e
    }, "pipe", 0, function(e, t, n, r, o, i, u, a, c) {
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
                return o(r(n(t(e))));
            case 6:
                return i(o(r(n(t(e)))));
            case 7:
                return u(i(o(r(n(t(e))))));
            case 8:
                return a(u(i(o(r(n(t(e)))))));
            case 9:
                return c(a(u(i(o(r(n(t(e))))))));
            default:
                for (var s = arguments[0], l = 1; l < arguments.length; l++) s = arguments[l](s);
                return s
        }
    }])
}, 812268, 613648, e => {
    "use strict";
    var t = e.i(728463),
        n = e.i(407406),
        r = function(e) {
            return "None" === e._tag
        },
        o = function(e) {
            return {
                _tag: "Left",
                left: e
            }
        },
        i = function(e) {
            return {
                _tag: "Right",
                right: e
            }
        },
        u = Object.prototype.hasOwnProperty,
        a = function(e) {
            return function(t, n) {
                return function() {
                    for (var r = [], u = 0; u < arguments.length; u++) r[u] = arguments[u];
                    var a = t.apply(void 0, r);
                    return e.fromEither(null == a ? o(n.apply(void 0, r)) : i(a))
                }
            }
        },
        c = function(e) {
            return function(t, n) {
                return function() {
                    for (var u = [], a = 0; a < arguments.length; a++) u[a] = arguments[a];
                    var c = t.apply(void 0, u);
                    return e.fromEither(r(c) ? o(n.apply(void 0, u)) : i(c.value))
                }
            }
        };

    function s(e) {
        return function(t) {
            return function(n) {
                return e.fromEither(r(n) ? o(t()) : i(n.value))
            }
        }
    }

    function l(e) {
        var t = s(e);
        return function(e) {
            var r = t(e);
            return function(e) {
                return (0, n.flow)(e, r)
            }
        }
    }

    function f(e) {
        return function(t) {
            return (0, n.flow)(t, e.fromEither)
        }
    }
    e.s(["emptyReadonlyArray", 0, [], "emptyRecord", 0, {}, "flatMapEither", 0, function(e, t) {
        return (0, n.dual)(2, function(n, r) {
            return t.flatMap(n, function(t) {
                return e.fromEither(r(t))
            })
        })
    }, "flatMapIO", 0, function(e, t) {
        return (0, n.dual)(2, function(n, r) {
            return t.flatMap(n, function(t) {
                return e.fromIO(r(t))
            })
        })
    }, "flatMapNullable", 0, function(e, t) {
        return (0, n.dual)(3, function(n, r, o) {
            return t.flatMap(n, a(e)(r, o))
        })
    }, "flatMapOption", 0, function(e, t) {
        return (0, n.dual)(3, function(n, r, o) {
            return t.flatMap(n, c(e)(r, o))
        })
    }, "flatMapTask", 0, function(e, t) {
        return (0, n.dual)(2, function(n, r) {
            return t.flatMap(n, function(t) {
                return e.fromTask(r(t))
            })
        })
    }, "has", 0, u, "head", 0, function(e) {
        return e[0]
    }, "isLeft", 0, function(e) {
        return "Left" === e._tag
    }, "isNonEmpty", 0, function(e) {
        return e.length > 0
    }, "isNone", 0, r, "isRight", 0, function(e) {
        return "Right" === e._tag
    }, "isSome", 0, function(e) {
        return "Some" === e._tag
    }, "left", 0, o, "liftNullable", 0, a, "liftOption", 0, c, "none", 0, {
        _tag: "None"
    }, "right", 0, i, "singleton", 0, function(e) {
        return [e]
    }, "some", 0, function(e) {
        return {
            _tag: "Some",
            value: e
        }
    }, "tail", 0, function(e) {
        return e.slice(1)
    }], 613648), e.s(["chainEitherK", 0, function(e, t) {
        var n = f(e);
        return function(e) {
            return function(r) {
                return t.chain(r, n(e))
            }
        }
    }, "chainOptionK", 0, function(e, t) {
        var n = l(e);
        return function(e) {
            var r = n(e);
            return function(e) {
                return function(n) {
                    return t.chain(n, r(e))
                }
            }
        }
    }, "filterOrElse", 0, function(e, t) {
        return function(n, r) {
            return function(u) {
                return t.chain(u, function(t) {
                    return e.fromEither(n(t) ? i(t) : o(r(t)))
                })
            }
        }
    }, "fromEitherK", 0, f, "fromOption", 0, s, "fromOptionK", 0, l, "fromPredicate", 0, function(e) {
        return function(t, n) {
            return function(r) {
                return e.fromEither(t(r) ? i(r) : o(n(r)))
            }
        }
    }, "tapEither", 0, function(e, n) {
        var r = f(e),
            o = (0, t.tap)(n);
        return function(e, t) {
            return o(e, r(t))
        }
    }], 812268)
}, 236778, e => {
    "use strict";

    function t(e) {
        return function(t, n) {
            return e.map(t, function() {
                return n
            })
        }
    }
    e.s(["as", 0, t, "asUnit", 0, function(e) {
        var n = t(e);
        return function(e) {
            return n(e, void 0)
        }
    }, "bindTo", 0, function(e) {
        return function(t) {
            return function(n) {
                return e.map(n, function(e) {
                    var n;
                    return (n = {})[t] = e, n
                })
            }
        }
    }, "flap", 0, function(e) {
        return function(t) {
            return function(n) {
                return e.map(n, function(e) {
                    return e(t)
                })
            }
        }
    }, "let", 0, function(e) {
        return function(t, n) {
            return function(r) {
                return e.map(r, function(e) {
                    var r;
                    return Object.assign({}, e, ((r = {})[t] = n(e), r))
                })
            }
        }
    }, "map", 0, function(e, t) {
        return function(n) {
            return function(r) {
                return e.map(r, function(e) {
                    return t.map(e, n)
                })
            }
        }
    }])
}, 278147, 287701, e => {
    "use strict";
    e.i(407406), e.i(236778);
    var t = function(e, t) {
        return {
            left: e,
            right: t
        }
    };
    e.s(["separated", 0, t], 278147), e.s(["wiltDefault", 0, function(e, t) {
        return function(n) {
            var r = e.traverse(n);
            return function(e, o) {
                return n.map(r(e, o), t.separate)
            }
        }
    }, "witherDefault", 0, function(e, t) {
        return function(n) {
            var r = e.traverse(n);
            return function(e, o) {
                return n.map(r(e, o), t.compact)
            }
        }
    }], 287701)
}, 870051, e => {
    "use strict";
    e.i(904875), e.i(432139);
    var t = e.i(728463);
    e.i(760442);
    var n = e.i(812268),
        r = e.i(407406),
        o = e.i(236778),
        i = e.i(613648),
        u = e.i(278147);
    e.i(287701);
    var a = i.left,
        c = i.right,
        s = (0, r.dual)(2, function(e, t) {
            return v(e) ? e : t(e.right)
        }),
        l = function(e, t) {
            return (0, r.pipe)(e, h(t))
        },
        f = function(e, t) {
            return (0, r.pipe)(e, y(t))
        },
        p = "Either",
        d = function(e) {
            var t = a(e.empty);
            return {
                URI: p,
                _E: void 0,
                compact: function(e) {
                    return v(e) ? e : "None" === e.right._tag ? t : c(e.right.value)
                },
                separate: function(e) {
                    return v(e) ? (0, u.separated)(e, e) : v(e.right) ? (0, u.separated)(c(e.right.left), t) : (0, u.separated)(t, c(e.right.right))
                }
            }
        },
        h = function(e) {
            return function(t) {
                return v(t) ? t : c(e(t.right))
            }
        },
        m = {
            URI: p,
            map: l
        };
    (0, r.dual)(2, (0, o.as)(m)), (0, o.asUnit)(m);
    var y = function(e) {
            return function(t) {
                return v(t) ? t : v(e) ? e : c(t.right(e.right))
            }
        },
        b = {
            URI: p,
            fromEither: r.identity
        },
        g = (0, n.fromOption)(b),
        v = i.isLeft,
        w = i.isRight,
        E = function(e, t) {
            return function(n) {
                return v(n) ? e(n.left) : t(n.right)
            }
        };
    t.tap({
        URI: p,
        map: l,
        ap: f,
        chain: s
    }), r.identity, r.identity, b.fromEither;
    var S = E(r.identity, r.identity);
    i.emptyRecord;
    var j = c(i.emptyReadonlyArray),
        x = function(e) {
            return function(t) {
                var n = e(0, i.head(t));
                if (v(n)) return n;
                for (var r = [n.right], o = 1; o < t.length; o++) {
                    var u = e(o, t[o]);
                    if (v(u)) return u;
                    r.push(u.right)
                }
                return c(r)
            }
        };
    r.identity, e.s(["Apply", 0, {
        URI: p,
        map: l,
        ap: f
    }, "Functor", 0, m, "bimap", 0, function(e, t) {
        return function(n) {
            return v(n) ? a(e(n.left)) : c(t(n.right))
        }
    }, "fromNullable", 0, function(e) {
        return function(t) {
            return null == t ? a(e) : c(t)
        }
    }, "fromOption", 0, g, "getApplicativeValidation", 0, function(e) {
        return {
            URI: p,
            _E: void 0,
            map: l,
            ap: function(t, n) {
                return v(t) ? v(n) ? a(e.concat(t.left, n.left)) : t : v(n) ? n : c(t.right(n.right))
            },
            of: c
        }
    }, "getCompactable", 0, d, "getFilterable", 0, function(e) {
        var t = a(e.empty),
            n = d(e);
        return {
            URI: p,
            _E: void 0,
            map: l,
            compact: n.compact,
            separate: n.separate,
            filter: function(e, n) {
                return v(e) || n(e.right) ? e : t
            },
            filterMap: function(e, n) {
                if (v(e)) return e;
                var r = n(e.right);
                return "None" === r._tag ? t : c(r.value)
            },
            partition: function(e, n) {
                return v(e) ? (0, u.separated)(e, e) : n(e.right) ? (0, u.separated)(t, c(e.right)) : (0, u.separated)(c(e.right), t)
            },
            partitionMap: function(e, n) {
                if (v(e)) return (0, u.separated)(e, e);
                var r = n(e.right);
                return v(r) ? (0, u.separated)(c(r.left), t) : (0, u.separated)(t, c(r.right))
            }
        }
    }, "getSemigroup", 0, function(e) {
        return {
            concat: function(t, n) {
                return v(n) ? t : v(t) ? n : c(e.concat(t.right, n.right))
            }
        }
    }, "isLeft", 0, v, "isRight", 0, w, "left", 0, a, "map", 0, h, "mapLeft", 0, function(e) {
        return function(t) {
            return v(t) ? a(e(t.left)) : t
        }
    }, "match", 0, E, "right", 0, c, "swap", 0, function(e) {
        return v(e) ? c(e.left) : a(e.right)
    }, "toUnion", 0, S, "traverseReadonlyNonEmptyArrayWithIndex", 0, x, "tryCatch", 0, function(e, t) {
        try {
            return c(e())
        } catch (e) {
            return a(t(e))
        }
    }])
}, 581934, 648298, e => {
    "use strict";
    var t = e.i(407406);
    e.s(["not", 0, function(e) {
        return function(t) {
            return !e(t)
        }
    }], 581934), e.i(613648);
    t.constTrue, t.getSemigroup, e.s(["first", 0, function() {
        return {
            concat: t.identity
        }
    }, "last", 0, function() {
        return {
            concat: function(e, t) {
                return t
            }
        }
    }], 648298)
}, 12316, e => {
    "use strict";
    e.i(904875), e.i(432139);
    var t = e.i(728463),
        n = e.i(812268),
        r = e.i(407406),
        o = e.i(236778),
        i = e.i(613648);
    e.i(581934), e.i(648298);
    var u = e.i(278147);
    e.i(287701);
    var a = i.none,
        c = i.some,
        s = function(e) {
            return "Left" === e._tag ? a : c(e.right)
        },
        l = function(e, t) {
            return (0, r.pipe)(e, p(t))
        },
        f = "Option",
        p = function(e) {
            return function(t) {
                return b(t) ? a : c(e(t.value))
            }
        },
        d = {
            URI: f,
            map: l
        };
    (0, r.dual)(2, (0, o.as)(d)), (0, o.asUnit)(d);
    var h = function(e) {
            return function(t) {
                return b(t) || b(e) ? a : c(t.value(e.value))
            }
        },
        m = (0, r.dual)(2, function(e, t) {
            return b(e) ? a : t(e.value)
        }),
        y = {
            URI: f,
            map: l,
            ap: function(e, t) {
                return (0, r.pipe)(e, h(t))
            },
            chain: m
        };
    (0, r.dual)(2, function(e, t) {
        return b(e) ? t() : e
    }), r.identity, i.isSome;
    var b = function(e) {
        return "None" === e._tag
    };
    t.tap(y), (0, n.tapEither)({
        URI: f,
        fromEither: s
    }, y), r.identity, r.constNull, r.identity, r.constUndefined, r.identity, i.emptyRecord;
    i.emptyReadonlyArray;
    r.identity, e.s(["getLeft", 0, function(e) {
        return "Right" === e._tag ? a : c(e.left)
    }, "getRight", 0, s, "isNone", 0, b], 12316)
}, 110584, 601342, 41808, 845990, 49646, e => {
    "use strict";
    let t, n;
    var r, o = e.i(870051),
        i = e.i(12316),
        u = e.i(737344),
        a = function(e) {
            return {
                _tag: "Left",
                left: e
            }
        },
        c = function(e) {
            return {
                _tag: "Right",
                right: e
            }
        },
        s = {
            _tag: "None"
        },
        l = function(e) {
            return {
                _tag: "Some",
                value: e
            }
        },
        f = function(e) {
            return "Left" === e._tag ? s : l(e.right)
        },
        p = function(e) {
            return "Some" === e._tag
        },
        d = function(e) {
            return "None" === e._tag
        };

    function h(e, t, n, r) {
        return new(n || (n = Promise))(function(o, i) {
            function u(e) {
                try {
                    c(r.next(e))
                } catch (e) {
                    i(e)
                }
            }

            function a(e) {
                try {
                    c(r.throw(e))
                } catch (e) {
                    i(e)
                }
            }

            function c(e) {
                var t;
                e.done ? o(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(u, a)
            }
            c((r = r.apply(e, t || [])).next())
        })
    }

    function m(e, t) {
        var n, r, o, i = {
                label: 0,
                sent: function() {
                    if (1 & o[0]) throw o[1];
                    return o[1]
                },
                trys: [],
                ops: []
            },
            u = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return u.next = a(0), u.throw = a(1), u.return = a(2), "function" == typeof Symbol && (u[Symbol.iterator] = function() {
            return this
        }), u;

        function a(a) {
            return function(c) {
                var s = [a, c];
                if (n) throw TypeError("Generator is already executing.");
                for (; u && (u = 0, s[0] && (i = 0)), i;) try {
                    if (n = 1, r && (o = 2 & s[0] ? r.return : s[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, s[1])).done) return o;
                    switch (r = 0, o && (s = [2 & s[0], o.value]), s[0]) {
                        case 0:
                        case 1:
                            o = s;
                            break;
                        case 4:
                            return i.label++, {
                                value: s[1],
                                done: !1
                            };
                        case 5:
                            i.label++, r = s[1], s = [0];
                            continue;
                        case 7:
                            s = i.ops.pop(), i.trys.pop();
                            continue;
                        default:
                            if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                i = 0;
                                continue
                            }
                            if (3 === s[0] && (!o || s[1] > o[0] && s[1] < o[3])) {
                                i.label = s[1];
                                break
                            }
                            if (6 === s[0] && i.label < o[1]) {
                                i.label = o[1], o = s;
                                break
                            }
                            if (o && i.label < o[2]) {
                                i.label = o[2], i.ops.push(s);
                                break
                            }
                            o[2] && i.ops.pop(), i.trys.pop();
                            continue
                    }
                    s = t.call(e, i)
                } catch (e) {
                    s = [6, e], r = 0
                } finally {
                    n = o = 0
                }
                if (5 & s[0]) throw s[1];
                return {
                    value: s[0] ? s[1] : void 0,
                    done: !0
                }
            }
        }
    }(function() {
        function e(e, t) {
            if (this.bufferIndex = 0, e < 1) throw Error("EventPublishers must have size of at least 1!");
            this.maxEventQueueLength = e, this.eventQueue = Array(this.maxEventQueueLength).fill(s), this.delegatePublisher = t, this.appendEvent = this.appendEvent.bind(this), this.publish = this.publish.bind(this)
        }
        e.prototype.appendEvent = function(e) {
            var t = this.bufferIndex % this.maxEventQueueLength,
                n = this.eventQueue[t];
            return this.eventQueue[t] = l(e), this.bufferIndex %= this.maxEventQueueLength, this.bufferIndex += 1, p(n)
        }, e.prototype.publish = function() {
            this.delegatePublisher.publish(this.eventQueue.filter(p))
        }
    })(), "function" == typeof SuppressedError && SuppressedError;
    var y = "u" > typeof globalThis ? globalThis : "u" > typeof window ? window : e.g,
        b = function(e) {
            return e && e.Math === Math && e
        },
        g = b("object" == typeof globalThis && globalThis) || b("object" == typeof window && window) || b("object" == typeof self && self) || b("object" == typeof y && y) || b("object" == typeof y && y) || function() {
            return this
        }() || Function("return this")(),
        v = {},
        w = function(e) {
            try {
                return !!e()
            } catch (e) {
                return !0
            }
        },
        E = !w(function() {
            return 7 !== Object.defineProperty({}, 1, {
                get: function() {
                    return 7
                }
            })[1]
        }),
        S = !w(function() {
            var e = (function() {}).bind();
            return "function" != typeof e || e.hasOwnProperty("prototype")
        }),
        j = Function.prototype.call,
        x = S ? j.bind(j) : function() {
            return j.apply(j, arguments)
        },
        R = {},
        O = {}.propertyIsEnumerable,
        T = Object.getOwnPropertyDescriptor;
    R.f = T && !O.call({
        1: 2
    }, 1) ? function(e) {
        var t = T(this, e);
        return !!t && t.enumerable
    } : O;
    var N, k, P = function(e, t) {
            return {
                enumerable: !(1 & e),
                configurable: !(2 & e),
                writable: !(4 & e),
                value: t
            }
        },
        I = Function.prototype,
        A = I.call,
        D = S && I.bind.bind(A, A),
        U = S ? D : function(e) {
            return function() {
                return A.apply(e, arguments)
            }
        },
        B = U({}.toString),
        C = U("".slice),
        q = Object,
        _ = U("".split),
        M = w(function() {
            return !q("z").propertyIsEnumerable(0)
        }) ? function(e) {
            return "String" === C(B(e), 8, -1) ? _(e, "") : q(e)
        } : q,
        F = function(e) {
            return null == e
        },
        z = TypeError,
        L = function(e) {
            if (F(e)) throw new z("Can't call method on " + e);
            return e
        },
        K = function(e) {
            return M(L(e))
        },
        V = "object" == typeof document && document.all,
        $ = void 0 === V && void 0 !== V ? function(e) {
            return "function" == typeof e || e === V
        } : function(e) {
            return "function" == typeof e
        },
        W = function(e) {
            return "object" == typeof e ? null !== e : $(e)
        },
        H = function(e, t) {
            var n;
            return arguments.length < 2 ? $(n = g[e]) ? n : void 0 : g[e] && g[e][t]
        },
        G = U({}.isPrototypeOf),
        Q = g.navigator,
        J = Q && Q.userAgent,
        X = J ? String(J) : "",
        Y = g.process,
        Z = g.Deno,
        ee = Y && Y.versions || Z && Z.version,
        et = ee && ee.v8;
    et && (k = (N = et.split("."))[0] > 0 && N[0] < 4 ? 1 : +(N[0] + N[1])), !k && X && (!(N = X.match(/Edge\/(\d+)/)) || N[1] >= 74) && (N = X.match(/Chrome\/(\d+)/)) && (k = +N[1]);
    var en = k,
        er = g.String,
        eo = !!Object.getOwnPropertySymbols && !w(function() {
            var e = Symbol("symbol detection");
            return !er(e) || !(Object(e) instanceof Symbol) || !Symbol.sham && en && en < 41
        }),
        ei = eo && !Symbol.sham && "symbol" == typeof Symbol.iterator,
        eu = Object,
        ea = ei ? function(e) {
            return "symbol" == typeof e
        } : function(e) {
            var t = H("Symbol");
            return $(t) && G(t.prototype, eu(e))
        },
        ec = String,
        es = function(e) {
            try {
                return ec(e)
            } catch (e) {
                return "Object"
            }
        },
        el = TypeError,
        ef = function(e) {
            if ($(e)) return e;
            throw new el(es(e) + " is not a function")
        },
        ep = TypeError,
        ed = {
            exports: {}
        },
        eh = Object.defineProperty,
        em = function(e, t) {
            try {
                eh(g, e, {
                    value: t,
                    configurable: !0,
                    writable: !0
                })
            } catch (n) {
                g[e] = t
            }
            return t
        },
        ey = "__core-js_shared__",
        eb = ed.exports = g[ey] || em(ey, {});
    (eb.versions || (eb.versions = [])).push({
        version: "3.43.0",
        mode: "global",
        copyright: "© 2014-2025 Denis Pushkarev (zloirock.ru)",
        license: "https://github.com/zloirock/core-js/blob/v3.43.0/LICENSE",
        source: "https://github.com/zloirock/core-js"
    });
    var eg = ed.exports,
        ev = function(e, t) {
            return eg[e] || (eg[e] = t || {})
        },
        ew = Object,
        eE = U({}.hasOwnProperty),
        eS = Object.hasOwn || function(e, t) {
            return eE(ew(L(e)), t)
        },
        ej = 0,
        ex = Math.random(),
        eR = U(1.1.toString),
        eO = function(e) {
            return "Symbol(" + (void 0 === e ? "" : e) + ")_" + eR(++ej + ex, 36)
        },
        eT = g.Symbol,
        eN = ev("wks"),
        ek = ei ? eT.for || eT : eT && eT.withoutSetter || eO,
        eP = function(e, t) {
            var n = e[t];
            return F(n) ? void 0 : ef(n)
        },
        eI = function(e, t) {
            var n, r;
            if ("string" === t && $(n = e.toString) && !W(r = x(n, e)) || $(n = e.valueOf) && !W(r = x(n, e)) || "string" !== t && $(n = e.toString) && !W(r = x(n, e))) return r;
            throw new ep("Can't convert object to primitive value")
        },
        eA = TypeError,
        eD = (eS(eN, e8 = "toPrimitive") || (eN[e8] = eo && eS(eT, e8) ? eT[e8] : ek("Symbol." + e8)), eN[e8]),
        eU = function(e, t) {
            if (!W(e) || ea(e)) return e;
            var n, r = eP(e, eD);
            if (r) {
                if (void 0 === t && (t = "default"), !W(n = x(r, e, t)) || ea(n)) return n;
                throw new eA("Can't convert object to primitive value")
            }
            return void 0 === t && (t = "number"), eI(e, t)
        },
        eB = function(e) {
            var t = eU(e, "string");
            return ea(t) ? t : t + ""
        },
        eC = g.document,
        eq = W(eC) && W(eC.createElement),
        e_ = !E && !w(function() {
            return 7 !== Object.defineProperty(eq ? eC.createElement("div") : {}, "a", {
                get: function() {
                    return 7
                }
            }).a
        }),
        eM = Object.getOwnPropertyDescriptor;
    v.f = E ? eM : function(e, t) {
        if (e = K(e), t = eB(t), e_) try {
            return eM(e, t)
        } catch (e) {}
        if (eS(e, t)) return P(!x(R.f, e, t), e[t])
    };
    var eF = {},
        ez = E && w(function() {
            return 42 !== Object.defineProperty(function() {}, "prototype", {
                value: 42,
                writable: !1
            }).prototype
        }),
        eL = String,
        eK = TypeError,
        eV = function(e) {
            if (W(e)) return e;
            throw new eK(eL(e) + " is not an object")
        },
        e$ = TypeError,
        eW = Object.defineProperty,
        eH = Object.getOwnPropertyDescriptor,
        eG = "enumerable",
        eQ = "configurable",
        eJ = "writable";
    eF.f = E ? ez ? function(e, t, n) {
        if (eV(e), t = eB(t), eV(n), "function" == typeof e && "prototype" === t && "value" in n && eJ in n && !n[eJ]) {
            var r = eH(e, t);
            r && r[eJ] && (e[t] = n.value, n = {
                configurable: eQ in n ? n[eQ] : r[eQ],
                enumerable: eG in n ? n[eG] : r[eG],
                writable: !1
            })
        }
        return eW(e, t, n)
    } : eW : function(e, t, n) {
        if (eV(e), t = eB(t), eV(n), e_) try {
            return eW(e, t, n)
        } catch (e) {}
        if ("get" in n || "set" in n) throw new e$("Accessors not supported");
        return "value" in n && (e[t] = n.value), e
    };
    var eX = E ? function(e, t, n) {
            return eF.f(e, t, P(1, n))
        } : function(e, t, n) {
            return e[t] = n, e
        },
        eY = {
            exports: {}
        },
        eZ = Function.prototype,
        e0 = E && Object.getOwnPropertyDescriptor,
        e1 = eS(eZ, "name"),
        e2 = {
            EXISTS: e1,
            PROPER: e1 && "something" === (function() {}).name,
            CONFIGURABLE: e1 && (!E || E && e0(eZ, "name").configurable)
        },
        e4 = U(Function.toString);
    $(eg.inspectSource) || (eg.inspectSource = function(e) {
        return e4(e)
    });
    var e8, e7, e6, e3, e5 = eg.inspectSource,
        e9 = g.WeakMap,
        te = $(e9) && /native code/.test(String(e9)),
        tt = ev("keys"),
        tn = {},
        tr = "Object already initialized",
        to = g.TypeError,
        ti = g.WeakMap;
    if (te || eg.state) {
        var tu = eg.state || (eg.state = new ti);
        tu.get = tu.get, tu.has = tu.has, tu.set = tu.set, e7 = function(e, t) {
            if (tu.has(e)) throw new to(tr);
            return t.facade = e, tu.set(e, t), t
        }, e6 = function(e) {
            return tu.get(e) || {}
        }, e3 = function(e) {
            return tu.has(e)
        }
    } else {
        var ta, tc = tt[ta = "state"] || (tt[ta] = eO(ta));
        tn[tc] = !0, e7 = function(e, t) {
            if (eS(e, tc)) throw new to(tr);
            return t.facade = e, eX(e, tc, t), t
        }, e6 = function(e) {
            return eS(e, tc) ? e[tc] : {}
        }, e3 = function(e) {
            return eS(e, tc)
        }
    }
    var ts = e6,
        tl = e2.CONFIGURABLE,
        tf = String,
        tp = Object.defineProperty,
        td = U("".slice),
        th = U("".replace),
        tm = U([].join),
        ty = E && !w(function() {
            return 8 !== tp(function() {}, "length", {
                value: 8
            }).length
        }),
        tb = String(String).split("String"),
        tg = eY.exports = function(e, t, n) {
            "Symbol(" === td(tf(t), 0, 7) && (t = "[" + th(tf(t), /^Symbol\(([^)]*)\).*$/, "$1") + "]"), n && n.getter && (t = "get " + t), n && n.setter && (t = "set " + t), (!eS(e, "name") || tl && e.name !== t) && (E ? tp(e, "name", {
                value: t,
                configurable: !0
            }) : e.name = t), ty && n && eS(n, "arity") && e.length !== n.arity && tp(e, "length", {
                value: n.arity
            });
            try {
                n && eS(n, "constructor") && n.constructor ? E && tp(e, "prototype", {
                    writable: !1
                }) : e.prototype && (e.prototype = void 0)
            } catch (e) {}
            var r, o = e3(r = e) ? e6(r) : e7(r, {});
            return eS(o, "source") || (o.source = tm(tb, "string" == typeof t ? t : "")), e
        };
    Function.prototype.toString = tg(function() {
        return $(this) && ts(this).source || e5(this)
    }, "toString");
    var tv = eY.exports,
        tw = {},
        tE = Math.ceil,
        tS = Math.floor,
        tj = Math.trunc || function(e) {
            var t = +e;
            return (t > 0 ? tS : tE)(t)
        },
        tx = function(e) {
            var t = +e;
            return t != t || 0 === t ? 0 : tj(t)
        },
        tR = Math.max,
        tO = Math.min,
        tT = Math.min,
        tN = function(e) {
            var t = tx(e);
            return t > 0 ? tT(t, 0x1fffffffffffff) : 0
        },
        tk = function(e, t) {
            var n = tx(e);
            return n < 0 ? tR(n + t, 0) : tO(n, t)
        },
        tP = function(e) {
            return function(t, n, r) {
                var o = K(t),
                    i = tN(o.length);
                if (0 === i) return !e && -1;
                var u, a = tk(r, i);
                if (e && n != n) {
                    for (; i > a;)
                        if ((u = o[a++]) != u) return !0
                } else
                    for (; i > a; a++)
                        if ((e || a in o) && o[a] === n) return e || a || 0;
                return !e && -1
            }
        },
        tI = {
            includes: tP(!0),
            indexOf: tP(!1)
        }.indexOf,
        tA = U([].push),
        tD = function(e, t) {
            var n, r = K(e),
                o = 0,
                i = [];
            for (n in r) !eS(tn, n) && eS(r, n) && tA(i, n);
            for (; t.length > o;) eS(r, n = t[o++]) && (~tI(i, n) || tA(i, n));
            return i
        },
        tU = ["constructor", "hasOwnProperty", "isPrototypeOf", "propertyIsEnumerable", "toLocaleString", "toString", "valueOf"].concat("length", "prototype");
    tw.f = Object.getOwnPropertyNames || function(e) {
        return tD(e, tU)
    };
    var tB = {};
    tB.f = Object.getOwnPropertySymbols;
    var tC = U([].concat),
        tq = H("Reflect", "ownKeys") || function(e) {
            var t = tw.f(eV(e)),
                n = tB.f;
            return n ? tC(t, n(e)) : t
        },
        t_ = /#|\.prototype\./,
        tM = function(e, t) {
            var n = tz[tF(e)];
            return n === tK || n !== tL && ($(t) ? w(t) : !!t)
        },
        tF = tM.normalize = function(e) {
            return String(e).replace(t_, ".").toLowerCase()
        },
        tz = tM.data = {},
        tL = tM.NATIVE = "N",
        tK = tM.POLYFILL = "P",
        tV = v.f,
        t$ = function(e, t, n, r) {
            r || (r = {});
            var o = r.enumerable,
                i = void 0 !== r.name ? r.name : t;
            if ($(n) && tv(n, i, r), r.global) o ? e[t] = n : em(t, n);
            else {
                try {
                    r.unsafe ? e[t] && (o = !0) : delete e[t]
                } catch (e) {}
                o ? e[t] = n : eF.f(e, t, {
                    value: n,
                    enumerable: !1,
                    configurable: !r.nonConfigurable,
                    writable: !r.nonWritable
                })
            }
            return e
        },
        tW = function(e, t, n) {
            for (var r = tq(t), o = eF.f, i = v.f, u = 0; u < r.length; u++) {
                var a = r[u];
                eS(e, a) || n && eS(n, a) || o(e, a, i(t, a))
            }
        },
        tH = {},
        tG = TypeError,
        tQ = function(e) {
            var t, n;
            this.promise = new e(function(e, r) {
                if (void 0 !== t || void 0 !== n) throw new tG("Bad Promise constructor");
                t = e, n = r
            }), this.resolve = ef(t), this.reject = ef(n)
        };
    tH.f = function(e) {
        return new tQ(e)
    }, ! function(e, t) {
        var n, r, o, i, u, a = e.target,
            c = e.global,
            s = e.stat;
        if (n = c ? g : s ? g[a] || em(a, {}) : g[a] && g[a].prototype)
            for (r in t) {
                if (i = t[r], o = e.dontCallGetSet ? (u = tV(n, r)) && u.value : n[r], !tM(c ? r : a + (s ? "." : "#") + r, e.forced) && void 0 !== o) {
                    if (typeof i == typeof o) continue;
                    tW(i, o)
                }(e.sham || o && o.sham) && eX(i, "sham", !0), t$(n, r, i, e)
            }
    }({
        target: "Promise",
        stat: !0
    }, {
        withResolvers: function() {
            var e = tH.f(this);
            return {
                promise: e.promise,
                resolve: e.resolve,
                reject: e.reject
            }
        }
    });
    var tJ = function(e, t) {
            try {
                return c(e())
            } catch (e) {
                return a(t(e))
            }
        },
        tX = {};
    ! function(e) {
        var t = y && y.__spreadArray || function(e, t, n) {
            if (n || 2 == arguments.length)
                for (var r, o = 0, i = t.length; o < i; o++) !r && o in t || (r || (r = Array.prototype.slice.call(t, 0, o)), r[o] = t[o]);
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

        function o(e, t, n, r, o, i, u, a, c) {
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
                        return o(r(n(t(e.apply(this, arguments)))))
                    };
                case 6:
                    return function() {
                        return i(o(r(n(t(e.apply(this, arguments))))))
                    };
                case 7:
                    return function() {
                        return u(i(o(r(n(t(e.apply(this, arguments)))))))
                    };
                case 8:
                    return function() {
                        return a(u(i(o(r(n(t(e.apply(this, arguments))))))))
                    };
                case 9:
                    return function() {
                        return c(a(u(i(o(r(n(t(e.apply(this, arguments)))))))))
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
        }, e.flow = o, e.tuple = function() {
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
        }, e.pipe = function(e, t, n, r, o, i, u, a, c) {
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
                    return o(r(n(t(e))));
                case 6:
                    return i(o(r(n(t(e)))));
                case 7:
                    return u(i(o(r(n(t(e))))));
                case 8:
                    return a(u(i(o(r(n(t(e)))))));
                case 9:
                    return c(a(u(i(o(r(n(t(e))))))));
                default:
                    for (var s = arguments[0], l = 1; l < arguments.length; l++) s = arguments[l](s);
                    return s
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
                    return o(e, t)
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
    }(tX);
    var tY = function(e, t) {
        var n, r, o, i, u = {
            label: 0,
            sent: function() {
                if (1 & o[0]) throw o[1];
                return o[1]
            },
            trys: [],
            ops: []
        };
        return i = {
            next: a(0),
            throw: a(1),
            return: a(2)
        }, "function" == typeof Symbol && (i[Symbol.iterator] = function() {
            return this
        }), i;

        function a(a) {
            return function(c) {
                var s = [a, c];
                if (n) throw TypeError("Generator is already executing.");
                for (; i && (i = 0, s[0] && (u = 0)), u;) try {
                    if (n = 1, r && (o = 2 & s[0] ? r.return : s[0] ? r.throw || ((o = r.return) && o.call(r), 0) : r.next) && !(o = o.call(r, s[1])).done) return o;
                    switch (r = 0, o && (s = [2 & s[0], o.value]), s[0]) {
                        case 0:
                        case 1:
                            o = s;
                            break;
                        case 4:
                            return u.label++, {
                                value: s[1],
                                done: !1
                            };
                        case 5:
                            u.label++, r = s[1], s = [0];
                            continue;
                        case 7:
                            s = u.ops.pop(), u.trys.pop();
                            continue;
                        default:
                            if (!(o = (o = u.trys).length > 0 && o[o.length - 1]) && (6 === s[0] || 2 === s[0])) {
                                u = 0;
                                continue
                            }
                            if (3 === s[0] && (!o || s[1] > o[0] && s[1] < o[3])) {
                                u.label = s[1];
                                break
                            }
                            if (6 === s[0] && u.label < o[1]) {
                                u.label = o[1], o = s;
                                break
                            }
                            if (o && u.label < o[2]) {
                                u.label = o[2], u.ops.push(s);
                                break
                            }
                            o[2] && u.ops.pop(), u.trys.pop();
                            continue
                    }
                    s = t.call(e, u)
                } catch (e) {
                    s = [6, e], r = 0
                } finally {
                    n = o = 0
                }
                if (5 & s[0]) throw s[1];
                return {
                    value: s[0] ? s[1] : void 0,
                    done: !0
                }
            }
        }
    };
    let tZ = /\{[^{}]+\}/g;

    function t0(e, t, n) {
        if (null == t) return "";
        if ("object" == typeof t) throw Error("Deeply-nested arrays/objects aren’t supported. Provide your own `querySerializer()` to handle these.");
        return `${e}=${!0===n?.allowReserved?t:encodeURIComponent(t)}`
    }

    function t1(e, t, n) {
        if (!t || "object" != typeof t) return "";
        let r = [],
            o = {
                simple: ",",
                label: ".",
                matrix: ";"
            } [n.style] || "&";
        if ("deepObject" !== n.style && !1 === n.explode) {
            for (let e in t) r.push(e, !0 === n.allowReserved ? t[e] : encodeURIComponent(t[e]));
            let o = r.join(",");
            switch (n.style) {
                case "form":
                    return `${e}=${o}`;
                case "label":
                    return `.${o}`;
                case "matrix":
                    return `;${e}=${o}`;
                default:
                    return o
            }
        }
        for (let o in t) {
            let i = "deepObject" === n.style ? `${e}[${o}]` : o;
            r.push(t0(i, t[o], n))
        }
        let i = r.join(o);
        return "label" === n.style || "matrix" === n.style ? `${o}${i}` : i
    }

    function t2(e, t, n) {
        if (!Array.isArray(t)) return "";
        if (!1 === n.explode) {
            let r = {
                    form: ",",
                    spaceDelimited: "%20",
                    pipeDelimited: "|"
                } [n.style] || ",",
                o = (!0 === n.allowReserved ? t : t.map(e => encodeURIComponent(e))).join(r);
            switch (n.style) {
                case "simple":
                    return o;
                case "label":
                    return `.${o}`;
                case "matrix":
                    return `;${e}=${o}`;
                default:
                    return `${e}=${o}`
            }
        }
        let r = {
                simple: ",",
                label: ".",
                matrix: ";"
            } [n.style] || "&",
            o = [];
        for (let r of t) "simple" === n.style || "label" === n.style ? o.push(!0 === n.allowReserved ? r : encodeURIComponent(r)) : o.push(t0(e, r, n));
        return "label" === n.style || "matrix" === n.style ? `${r}${o.join(r)}` : o.join(r)
    }

    function t4(e) {
        return function(t) {
            let n = [];
            if (t && "object" == typeof t)
                for (let r in t) {
                    let o = t[r];
                    if (null != o)
                        if (Array.isArray(o)) {
                            if (0 === o.length) continue;
                            n.push(t2(r, o, {
                                style: "form",
                                explode: !0,
                                ...e?.array,
                                allowReserved: e?.allowReserved || !1
                            }))
                        } else "object" != typeof o ? n.push(t0(r, o, e)) : n.push(t1(r, o, {
                            style: "deepObject",
                            explode: !0,
                            ...e?.object,
                            allowReserved: e?.allowReserved || !1
                        }))
                }
            return n.join("&")
        }
    }

    function t8(e, t) {
        return e instanceof FormData ? e : t && "application/x-www-form-urlencoded" === (t.get instanceof Function ? t.get("Content-Type") ?? t.get("content-type") : t["Content-Type"] ?? t["content-type"]) ? new URLSearchParams(e).toString() : JSON.stringify(e)
    }

    function t7() {
        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
        let r = new Headers;
        for (let e of t)
            if (e && "object" == typeof e)
                for (let [t, n] of e instanceof Headers ? e.entries() : Object.entries(e))
                    if (null === n) r.delete(t);
                    else if (Array.isArray(n))
            for (let e of n) r.append(t, e);
        else void 0 !== n && r.set(t, n);
        return r
    }

    function t6(e) {
        return e.endsWith("/") ? e.substring(0, e.length - 1) : e
    }
    var t3, t5, t9, ne, nt, nn, nr = (null == (nn = null == (nt = window.Roblox) ? void 0 : nt.Cookies) ? void 0 : nn.getBrowserTrackerId) || function() {
            return "unknown"
        },
        no = function(e, t) {
            var n = function(e) {
                let {
                    baseUrl: t = "",
                    Request: n = globalThis.Request,
                    fetch: r = globalThis.fetch,
                    querySerializer: o,
                    bodySerializer: i,
                    headers: a,
                    requestInitExt: c,
                    ...s
                } = {
                    ...e
                };
                c = "object" == typeof u.default && Number.parseInt(u.default?.versions?.node?.substring(0, 2)) >= 18 && u.default.versions.undici ? c : void 0, t = t6(t);
                let l = [];
                async function f(e, u) {
                    var f;
                    let p, d, {
                            baseUrl: h,
                            fetch: m = r,
                            Request: y = n,
                            headers: b,
                            params: g = {},
                            parseAs: v = "json",
                            querySerializer: w,
                            bodySerializer: E = i ?? t8,
                            body: S,
                            ...j
                        } = u || {},
                        x = t;
                    h && (x = t6(h) ?? t);
                    let R = "function" == typeof o ? o : t4(o);
                    w && (R = "function" == typeof w ? w : t4({
                        ..."object" == typeof o ? o : {},
                        ...w
                    }));
                    let O = void 0 === S ? void 0 : E(S, t7(a, b, g.header)),
                        T = t7(void 0 === O || O instanceof FormData ? {} : {
                            "Content-Type": "application/json"
                        }, a, b, g.header),
                        N = {
                            redirect: "follow",
                            ...s,
                            ...j,
                            body: O,
                            headers: T
                        },
                        k, P, I, A = new n((f = {
                            baseUrl: x,
                            params: g,
                            querySerializer: R
                        }, p = `${f.baseUrl}${e}`, f.params?.path && (p = function(e, t) {
                            let n = e;
                            for (let r of e.match(tZ) ?? []) {
                                let e = r.substring(1, r.length - 1),
                                    o = !1,
                                    i = "simple";
                                if (e.endsWith("*") && (o = !0, e = e.substring(0, e.length - 1)), e.startsWith(".") ? (i = "label", e = e.substring(1)) : e.startsWith(";") && (i = "matrix", e = e.substring(1)), !t || void 0 === t[e] || null === t[e]) continue;
                                let u = t[e];
                                n = Array.isArray(u) ? n.replace(r, t2(e, u, {
                                    style: i,
                                    explode: o
                                })) : "object" != typeof u ? "matrix" !== i ? n.replace(r, "label" === i ? `.${encodeURIComponent(u)}` : encodeURIComponent(u)) : n.replace(r, `;${t0(e,u)}`) : n.replace(r, t1(e, u, {
                                    style: i,
                                    explode: o
                                }))
                            }
                            return n
                        }(p, f.params.path)), (d = f.querySerializer(f.params.query ?? {})).startsWith("?") && (d = d.substring(1)), d && (p += `?${d}`), p), N);
                    for (let e in j) e in A || (A[e] = j[e]);
                    if (l.length) {
                        for (let t of (k = Math.random().toString(36).slice(2, 11), P = Object.freeze({
                                baseUrl: x,
                                fetch: m,
                                parseAs: v,
                                querySerializer: R,
                                bodySerializer: E
                            }), l))
                            if (t && "object" == typeof t && "function" == typeof t.onRequest) {
                                let r = await t.onRequest({
                                    request: A,
                                    schemaPath: e,
                                    params: g,
                                    options: P,
                                    id: k
                                });
                                if (r) {
                                    if (!(r instanceof n)) {
                                        if (r instanceof Response) {
                                            I = r;
                                            break
                                        }
                                        throw Error("onRequest: must return new Request() or Response() when modifying the request")
                                    }
                                    A = r
                                }
                            }
                    }
                    if (!I) {
                        try {
                            I = await m(A, c)
                        } catch (n) {
                            let t = n;
                            if (l.length)
                                for (let n = l.length - 1; n >= 0; n--) {
                                    let r = l[n];
                                    if (r && "object" == typeof r && "function" == typeof r.onError) {
                                        let n = await r.onError({
                                            request: A,
                                            error: t,
                                            schemaPath: e,
                                            params: g,
                                            options: P,
                                            id: k
                                        });
                                        if (n) {
                                            if (n instanceof Response) {
                                                t = void 0, I = n;
                                                break
                                            }
                                            if (n instanceof Error) {
                                                t = n;
                                                continue
                                            }
                                            throw Error("onError: must return new Response() or instance of Error")
                                        }
                                    }
                                }
                            if (t) throw t
                        }
                        if (l.length)
                            for (let t = l.length - 1; t >= 0; t--) {
                                let n = l[t];
                                if (n && "object" == typeof n && "function" == typeof n.onResponse) {
                                    let t = await n.onResponse({
                                        request: A,
                                        response: I,
                                        schemaPath: e,
                                        params: g,
                                        options: P,
                                        id: k
                                    });
                                    if (t) {
                                        if (!(t instanceof Response)) throw Error("onResponse: must return new Response() when modifying the response");
                                        I = t
                                    }
                                }
                            }
                    }
                    if (204 === I.status || "HEAD" === A.method || "0" === I.headers.get("Content-Length")) return I.ok ? {
                        data: void 0,
                        response: I
                    } : {
                        error: void 0,
                        response: I
                    };
                    if (I.ok) return "stream" === v ? {
                        data: I.body,
                        response: I
                    } : {
                        data: await I[v](),
                        response: I
                    };
                    let D = await I.text();
                    try {
                        D = JSON.parse(D)
                    } catch {}
                    return {
                        error: D,
                        response: I
                    }
                }
                return {
                    request: (e, t, n) => f(t, {
                        ...n,
                        method: e.toUpperCase()
                    }),
                    GET: (e, t) => f(e, {
                        ...t,
                        method: "GET"
                    }),
                    PUT: (e, t) => f(e, {
                        ...t,
                        method: "PUT"
                    }),
                    POST: (e, t) => f(e, {
                        ...t,
                        method: "POST"
                    }),
                    DELETE: (e, t) => f(e, {
                        ...t,
                        method: "DELETE"
                    }),
                    OPTIONS: (e, t) => f(e, {
                        ...t,
                        method: "OPTIONS"
                    }),
                    HEAD: (e, t) => f(e, {
                        ...t,
                        method: "HEAD"
                    }),
                    PATCH: (e, t) => f(e, {
                        ...t,
                        method: "PATCH"
                    }),
                    TRACE: (e, t) => f(e, {
                        ...t,
                        method: "TRACE"
                    }),
                    use() {
                        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        for (let e of t)
                            if (e) {
                                if ("object" != typeof e || !("onRequest" in e || "onResponse" in e || "onError" in e)) throw Error("Middleware must be an object with one of `onRequest()`, `onResponse() or `onError()`");
                                l.push(e)
                            }
                    },
                    eject() {
                        for (var e = arguments.length, t = Array(e), n = 0; n < e; n++) t[n] = arguments[n];
                        for (let e of t) {
                            let t = l.indexOf(e); - 1 !== t && l.splice(t, 1)
                        }
                    }
                }
            }({
                baseUrl: e()
            });
            return d(t) || n.use.apply(n, t.value), n
        },
        ni = function() {
            var e, t, n, r = null != (n = null == (t = null == (e = window.Roblox) ? void 0 : e.EnvironmentUrls) ? void 0 : t.apiGatewayUrl) ? n : "NOT_FOUND";
            return "".concat(r, "/account-security-service")
        },
        nu = ni(),
        na = no(function() {
            return nu
        }, s),
        nc = function(e) {
            return h(void 0, [e], void 0, function(e) {
                var t = e.name,
                    n = e.labelValues,
                    r = e.identifier,
                    o = e.withTelemetry,
                    i = e.client;
                return m(this, function(e) {
                    var u, s;
                    switch (e.label) {
                        case 0:
                            return o ? [4, (u = function() {
                                return h(void 0, void 0, void 0, function() {
                                    return m(this, function(e) {
                                        return [2, (i || na).POST("/v1/metrics/record", {
                                            baseUrl: ni(),
                                            body: {
                                                identifier: r || nr(),
                                                name: t || "rbxIndexedDBSmokeTest",
                                                labelValues: n,
                                                value: 1
                                            }
                                        })]
                                    })
                                })
                            }, s = function() {}, function() {
                                var e, t, n, r;
                                return e = void 0, t = void 0, n = void 0, r = function() {
                                    return tY(this, function(e) {
                                        switch (e.label) {
                                            case 0:
                                                return e.trys.push([0, 2, , 3]), [4, u().then(c)];
                                            case 1:
                                                return [2, e.sent()];
                                            case 2:
                                                return [2, a(s(e.sent()))];
                                            case 3:
                                                return [2]
                                        }
                                    })
                                }, new(n || (n = Promise))(function(o, i) {
                                    function u(e) {
                                        try {
                                            c(r.next(e))
                                        } catch (e) {
                                            i(e)
                                        }
                                    }

                                    function a(e) {
                                        try {
                                            c(r.throw(e))
                                        } catch (e) {
                                            i(e)
                                        }
                                    }

                                    function c(e) {
                                        var t;
                                        e.done ? o(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                                            e(t)
                                        })).then(u, a)
                                    }
                                    c((r = r.apply(e, t || [])).next())
                                })
                            })()] : [2];
                        case 1:
                            return e.sent(), [2]
                    }
                })
            })
        },
        ns = function(e) {
            var t, n = e.database,
                r = e.oldVersion,
                o = e.objectStoreName,
                i = e.instrumentationName,
                u = e.withTelemetry,
                s = Promise.withResolvers(),
                l = s.promise,
                f = s.resolve,
                p = s.reject;
            switch (r) {
                default:
                    if (n.objectStoreNames.contains(o)) {
                        nc({
                            name: i,
                            labelValues: {
                                success: "true",
                                arm: "transaction-upgrade-objstore-exists"
                            },
                            withTelemetry: null == u || u
                        }), f(null);
                        break
                    }
                    tX.pipe(tJ(function() {
                        return n.createObjectStore(o)
                    }, function(e) {
                        var t, n = "unknownerr-create-objstore";
                        return nc({
                            name: i,
                            labelValues: {
                                success: "false",
                                arm: "transaction-upgrade-objstore-creation",
                                error: null != (t = e instanceof Error && (null == e ? void 0 : e.message) || n) ? t : n
                            },
                            withTelemetry: null == u || u
                        }), p(Error("Could not create object store.")), a(e)
                    }), (t = function(e) {
                        return nc({
                            name: i,
                            labelValues: {
                                success: "true",
                                arm: "transaction-upgrade-objstore-creation"
                            },
                            withTelemetry: null == u || u
                        }), f(e)
                    }, function(e) {
                        return "Left" === e._tag ? e : c(t(e.right))
                    }))
            }
            return l
        },
        nl = function(e) {
            var t = e.request,
                n = e.objectStoreName,
                r = e.upgradesHandler,
                o = e.withTelemetry,
                i = e.instrumentationName,
                u = Promise.withResolvers(),
                a = u.promise,
                c = u.resolve,
                f = u.reject;
            return t.onsuccess = function(e) {
                var t = e.target.result;
                nc({
                    name: i,
                    labelValues: {
                        success: "true",
                        arm: "connection"
                    },
                    withTelemetry: null == o || o
                }), c(t)
            }, t.onerror = function(e) {
                var t, n = e.target.error;
                nc({
                    name: i,
                    labelValues: {
                        success: "false",
                        arm: "connection",
                        error: null != (t = null == n ? void 0 : n.message) ? t : "unknown-onerror"
                    },
                    withTelemetry: null == o || o
                }), f(n)
            }, t.onupgradeneeded = function(e) {
                return h(void 0, void 0, void 0, function() {
                    var t, u;
                    return m(this, function(f) {
                        switch (f.label) {
                            case 0:
                                return [4, r({
                                    database: t = e.target.result,
                                    oldVersion: e.oldVersion,
                                    objectStoreName: n,
                                    instrumentationName: i,
                                    withTelemetry: o
                                })];
                            case 1:
                                var h;
                                return u = f.sent(), p(tX.pipe(null == u ? s : l(u), (h = function(e) {
                                    return e.transaction.oncomplete = function() {
                                        nc({
                                            name: i,
                                            labelValues: {
                                                success: "true",
                                                arm: "connection-initial-transaction"
                                            },
                                            withTelemetry: null == o || o
                                        }), c(t)
                                    }, a
                                }, function(e) {
                                    return d(e) ? s : l(h(e.value))
                                }))) || (nc({
                                    name: i,
                                    labelValues: {
                                        success: "true",
                                        arm: "connection-initial-transaction-early"
                                    },
                                    withTelemetry: null == o || o
                                }), c(t)), [2]
                        }
                    })
                })
            }, t.onblocked = function(e) {
                var t = e.target.result;
                nc({
                    name: i,
                    labelValues: {
                        success: "true",
                        arm: "connection-blocked"
                    },
                    withTelemetry: null == o || o
                }), t.close()
            }, a
        },
        nf = function(e) {
            var t = e.databaseName,
                n = e.objectStoreName,
                r = e.version,
                o = e.instrumentationName,
                i = e.withTelemetry,
                u = indexedDB || window.indexedDB || window.mozIndexedDB || window.webkitIndexedDB || window.msIndexedDB;
            return tX.pipe(tJ(function() {
                return nc({
                    name: o,
                    labelValues: {
                        success: "true",
                        arm: "open-connection"
                    },
                    withTelemetry: null == i || i
                }), nl({
                    request: u.open(t, r),
                    objectStoreName: n,
                    upgradesHandler: ns,
                    instrumentationName: o,
                    withTelemetry: null == i || i
                })
            }, function(e) {
                var t, n = "unknownerr-open-connection";
                return nc({
                    name: o,
                    labelValues: {
                        success: "false",
                        arm: "open-connection",
                        error: null != (t = e instanceof Error && (null == e ? void 0 : e.message) || n) ? t : n
                    },
                    withTelemetry: null == i || i
                }), e
            }), f)
        },
        np = function(e) {
            var t = e.database,
                n = e.objectStoreName,
                r = e.key,
                o = e.instrumentationName,
                i = e.withTelemetry;
            if (!t.objectStoreNames.contains(n)) return s;
            var u = Promise.withResolvers(),
                a = u.promise,
                c = u.resolve,
                f = t.transaction(n, "readonly");
            return f.oncomplete = function() {
                nc({
                    name: o,
                    labelValues: {
                        success: "true",
                        arm: "transaction-get-complete"
                    },
                    withTelemetry: null == i || i
                })
            }, f.objectStore(n).get(r).onsuccess = function(e) {
                var t = e.target.result;
                nc({
                    name: o,
                    labelValues: {
                        success: "true",
                        arm: "transaction-get"
                    },
                    withTelemetry: null == i || i
                }), c(t)
            }, l(a)
        },
        nd = (ne = null != (t9 = null == (t5 = null == (t3 = window.Roblox) ? void 0 : t3.EnvironmentUrls) ? void 0 : t5.apiGatewayUrl) ? t9 : "NOT_FOUND", "".concat(ne, "/rotating-client-service"));
    no(function() {
        return nd
    }, s), e.s(["getWithDefaultHandlers", 0, np, "putWithDefaultHandlers", 0, function(e) {
        var t = e.database,
            n = e.objectStoreName,
            r = e.key,
            o = e.value,
            i = e.instrumentationName,
            u = e.withTelemetry;
        if (!t.objectStoreNames.contains(n)) return s;
        var a = Promise.withResolvers(),
            c = a.promise,
            f = a.resolve,
            p = t.transaction(n, "readwrite");
        return p.oncomplete = function() {
            nc({
                name: i,
                labelValues: {
                    success: "true",
                    arm: "transaction-put-complete"
                },
                withTelemetry: null == u || u
            })
        }, p.objectStore(n).put(o, r).onsuccess = function(e) {
            var t = e.target.result;
            nc({
                name: i,
                labelValues: {
                    success: "true",
                    arm: "transaction-put"
                },
                withTelemetry: null == u || u
            }), f(t)
        }, l(c)
    }, "tryGetIndexedDBConnectionWithDefaults", 0, nf], 601342);
    var nh = e.i(723941),
        nm = e.i(586588),
        ny = e.i(587541),
        nb = e.i(245837),
        ng = e.i(645020);
    let nv = {
            isSecureAuthenticationIntentEnabled: !0,
            isBoundAuthTokenEnabled: !0,
            boundAuthTokenWhitelist: "",
            boundAuthTokenExemptlist: '{"Exemptlist":[]}',
            hbaIndexedDBVersion: 1,
            batEventSampleRate: 500
        },
        nw = {
            ...nv,
            hbaIndexedDBName: "hbaDB",
            hbaIndexedDBObjStoreName: "hbaObjectStore",
            hbaIndexedDBKeyName: "hba_keys"
        },
        nE = {
            ...nv,
            hbaIndexedDBName: "hbaDb-Test",
            hbaIndexedDBObjStoreName: "hbaObjStore-Test",
            hbaIndexedDBKeyName: "hba-keys"
        };
    var nS = ((r = {}).RequestExempt = "RequestExempt", r.RequestExemptError = "RequestExemptError", r.GetKeyPairFailed = "GetKeyPairFailed", r.UpdateKeyPairFailed = "UpdateKeyPairFailed", r.NoKeyPairFound = "NoKeyPairFound", r.RequestBodyHashFailed = "RequestBodyHashFailed", r.SignatureFailed = "SignatureFailed", r.Unknown = "Unknown", r),
        nj = e.i(44170),
        nx = e.i(181759);
    let nR = null,
        nO = (e, t) => {
            (nR ??= new nx.Tracker(new nx.Configuration({
                baseUrl: `https://ecsv2.${nb.default.domain}/www`
            }))).sendEventViaImg({
                target: "www",
                localTime: new Date,
                eventType: e,
                context: "hba",
                additionalProperties: t
            })
        },
        nT = (e, t, n) => {
            1e6 * Math.random() < n && nO("batMissing", {
                field: e,
                kind: t.kind,
                messageRaw: t.message
            })
        },
        nN = e => (null != e && "object" == typeof e && "message" in e && "string" == typeof e.message ? e : nh.serialize(e).map(e => Error(e)).getOrElse(() => Error(String(e)))).message;
    e.s(["getErrorMessage", 0, nN], 41808);
    let nk = async (e, r, o) => {
        try {
            return new Promise((i, u) => {
                t = e, n = r;
                let a = indexedDB.open(t, 1);
                a.onsuccess = e => {
                    let t = e.target.result;
                    try {
                        let r = t.transaction(n, "readonly"),
                            a = r.objectStore(n).get(o);
                        a.onsuccess = e => {
                            let t = e.target.result;
                            i(t)
                        }, a.onerror = () => {
                            u(e.target.error)
                        }, r.oncomplete = () => {
                            t.close()
                        }
                    } catch (e) {
                        u(e)
                    }
                }, a.onerror = e => {
                    u(e.target.error)
                }, a.onupgradeneeded = () => {
                    let e = a.result;
                    e.objectStoreNames.contains(n) || e.createObjectStore(n)
                }
            })
        } catch (e) {
            return console.warn("get value from indexedDB error: ", e), {}
        }
    }, nP = async (e, r, o, i) => {
        try {
            t = e, n = r;
            let u = indexedDB.open(t, 1);
            return new Promise((e, t) => {
                u.onerror = () => {
                    console.error("indexeddb request error"), t()
                }, u.onupgradeneeded = () => {
                    let e = u.result;
                    e.objectStoreNames.contains(n) || e.createObjectStore(n)
                }, u.onsuccess = r => {
                    try {
                        r.target.result.transaction(n, "readwrite").objectStore(n).put(i, o).onsuccess = () => {
                            e()
                        }
                    } catch {
                        console.error("indexeddb transaction error"), t()
                    }
                }
            })
        } catch (e) {
            console.warn("updating indexedDB error: ", e)
        }
    }, nI = async (e, r, o) => {
        try {
            return new Promise((i, u) => {
                t = e, n = r;
                let a = indexedDB.open(t, 1);
                a.onsuccess = e => {
                    let t = e.target.result;
                    if (t.objectStoreNames.contains(n)) {
                        let r = t.transaction(n, "readwrite"),
                            a = r.objectStore(n).delete(o);
                        a.onsuccess = () => {
                            t.close(), i()
                        }, a.onerror = () => {
                            u(e.target.error)
                        }, r.oncomplete = () => {
                            t.close()
                        }
                    } else t.close(), i()
                }, a.onerror = e => {
                    u(e.target.error)
                }
            })
        } catch (e) {
            return console.warn("delete crypto record error: ", e), {}
        }
    }, nA = async () => {
        try {
            let e = indexedDB.deleteDatabase(t);
            return new Promise((t, n) => {
                e.onerror = () => {
                    n(e.error)
                }, e.onsuccess = () => {
                    t()
                }
            })
        } catch (e) {
            return console.warn("delete crypto db error: ", e), {}
        }
    };
    e.s(["deleteCryptoDB", 0, nA, "deleteCryptoKeyPair", 0, nI, "getCryptoKeyPair", 0, nk, "putCryptoKeyPair", 0, nP], 845990);
    let nD = [".roblox.com", ".robloxlabs.com", ".roblox.qq.com"],
        nU = null,
        nB = () => nU ??= (() => {
            if ("u" < typeof document) return null;
            let e = document.querySelector('meta[name="hardware-backed-authentication-data"]');
            if (null == e) return null;
            let t = e.dataset;
            return {
                isBoundAuthTokenEnabled: "true" === t.isBoundAuthTokenEnabled,
                boundAuthTokenWhitelist: t.boundAuthTokenWhitelist ?? "",
                boundAuthTokenExemptlist: t.boundAuthTokenExemptlist ?? "",
                hbaIndexedDBName: t.hbaIndexedDbName ?? "",
                hbaIndexedDBObjStoreName: t.hbaIndexedDbObjStoreName ?? "",
                hbaIndexedDBKeyName: t.hbaIndexedDbKeyName ?? "",
                hbaIndexedDBVersion: (0, ng.parseInt)(t.hbaIndexedDbVersion ?? "") ?? 1,
                batEventSampleRate: (0, ng.parseInt)(t.batEventSampleRate ?? "") ?? 0,
                isSecureAuthenticationIntentEnabled: "true" === t.isSecureAuthenticationIntentEnabled
            }
        })() ?? ("roblox.com" === nb.default.domain ? nw : nE),
        nC = "batIndexedDb",
        nq = () => 1e6 * Math.random() < nB().batEventSampleRate,
        n_ = null,
        nM = (e, t, n) => {
            let {
                isBoundAuthTokenEnabled: r,
                hbaIndexedDBName: i,
                hbaIndexedDBObjStoreName: u,
                hbaIndexedDBKeyName: a
            } = t;
            try {
                if (!n) return o.left({
                    kind: nS.RequestExempt,
                    message: "CurrentUserNotAuthenticated"
                });
                if (!ny.Url.parseWithOptions(e.url, {
                        domainAllowlist: nD
                    }).isOk()) return o.left({
                    kind: nS.RequestExempt,
                    message: "UrlNotFromAllowedHost"
                });
                if (!i) return o.left({
                    kind: nS.RequestExempt,
                    message: "EmptyIndexedDbName"
                });
                if (!u) return o.left({
                    kind: nS.RequestExempt,
                    message: "EmptyIndexedDbObjectStoreName"
                });
                if (!a) return o.left({
                    kind: nS.RequestExempt,
                    message: "EmptyIndexedDbKeyName"
                });
                if (!r) return o.left({
                    kind: nS.RequestExempt,
                    message: "BoundAuthTokenNotEnabled"
                });
                return o.right(!0)
            } catch (e) {
                return o.left({
                    kind: nS.RequestExemptError,
                    message: nN(e)
                })
            }
        },
        nF = async (e, t, n, r, o) => {
            if (!o) return null;
            let u = nf({
                databaseName: e,
                objectStoreName: t,
                version: n,
                instrumentationName: nC,
                withTelemetry: nq()
            });
            if (i.isNone(u)) return null;
            let a = await u.value,
                c = np({
                    database: a,
                    objectStoreName: t,
                    key: r,
                    instrumentationName: nC,
                    withTelemetry: nq()
                });
            return i.isNone(c) ? (a.close(), null) : (a.close(), c.value)
        }, nz = async function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : nB();
            try {
                let n, {
                    hbaIndexedDBName: r,
                    hbaIndexedDBObjStoreName: i,
                    hbaIndexedDBKeyName: u,
                    hbaIndexedDBVersion: a
                } = t;
                if (null === n_) n_ = await nF(r, i, a, u, !0);
                else try {
                    await nP(r, i, u, n_)
                } catch (e) {
                    return o.left({
                        message: nN(e),
                        kind: nS.UpdateKeyPairFailed
                    })
                }
                if (!n_) return o.left({
                    message: "",
                    kind: nS.NoKeyPairFound
                });
                let c = Math.floor(Date.now() / 1e3).toString();
                "object" == typeof e.data ? n = nh.serialize(e.data).getOrThrow() : "string" == typeof e.data && (n = e.data);
                let s = "";
                try {
                    s = await (0, nj.hashStringWithSha256)(n)
                } catch (e) {
                    return o.left({
                        message: nN(e),
                        kind: nS.RequestBodyHashFailed
                    })
                }
                let l = e.url,
                    f = (e.method ?? "").toUpperCase(),
                    p = nm.AnyUrl.parse(e.url).getOrThrow().path,
                    d = [s, c, l, f].join("|"),
                    h = ["", c, p, f].join("|"),
                    m = "",
                    y = "";
                try {
                    [m, y] = await Promise.all([(0, nj.sign)(n_.privateKey, d), (0, nj.sign)(n_.privateKey, h)])
                } catch (e) {
                    return o.left({
                        message: nN(e),
                        kind: nS.SignatureFailed
                    })
                }
                return o.right(["v1", s, c, m, y].join("|"))
            } catch (e) {
                return console.warn("BAT generation error:", e), o.left({
                    message: nN(e),
                    kind: nS.Unknown
                })
            }
        }, nL = async function(e, t) {
            let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : nB(),
                r = nM(e, n, t);
            if (o.isLeft(r)) return nT(e.url, r.left, n.batEventSampleRate), e;
            let i = await nz(e, n),
                u = {
                    ...e
                };
            if (o.isRight(i)) {
                var a;
                u.headers = {
                    ...u.headers,
                    "x-bound-auth-token": i.right
                }, a = e.url, 1e6 * Math.random() < n.batEventSampleRate && nO("batCreated", {
                    field: a
                })
            } else nT(e.url, i.left, n.batEventSampleRate);
            return u
        };
    e.s(["buildConfigBoundAuthToken", 0, nL, "generateBoundAuthToken", 0, nz, "getWithDisasterRecovery", 0, nF, "shouldRequestWithBoundAuthToken", 0, nM], 110584), e.i(350223);
    var nK = e.i(874296),
        nV = e.i(849735);
    let n$ = nK.object({
        errors: nK.array(nK.object({
            code: nK.optional(nK.number()),
            subcode: nK.optional(nK.number())
        }))
    });
    e.s(["hbaUnauthorizedErrorCode", 0, 9002, "hbaUnauthorizedErrorSubcode", 0, 2, "hbaUnauthorizedEventName", 0, "rbx:hba-unauthorized", "isHbaUnauthorizedError", 0, e => {
        if (!(e instanceof nV.HttpError) || 401 !== e.response.status) return !1;
        let {
            body: t
        } = e.response;
        if (null == t) return !1;
        let n = nh.deserialize(n$, t).getOrNull()?.errors[0];
        return n?.code === 9002 && 2 === n.subcode
    }], 49646)
}]);

//# debugId=db3bdc7f-c53a-4e19-69f3-c9609d3310ac
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/12-oj-bzg~w~h.js.map