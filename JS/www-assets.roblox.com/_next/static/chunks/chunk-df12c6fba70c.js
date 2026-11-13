;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "b79ec0be-7aec-3dee-56b1-c8456687e233")
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
            return g(e) ? e : t(e.right)
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
                    return g(e) ? e : "None" === e.right._tag ? t : c(e.right.value)
                },
                separate: function(e) {
                    return g(e) ? (0, u.separated)(e, e) : g(e.right) ? (0, u.separated)(c(e.right.left), t) : (0, u.separated)(t, c(e.right.right))
                }
            }
        },
        h = function(e) {
            return function(t) {
                return g(t) ? t : c(e(t.right))
            }
        },
        m = {
            URI: p,
            map: l
        };
    (0, r.dual)(2, (0, o.as)(m)), (0, o.asUnit)(m);
    var y = function(e) {
            return function(t) {
                return g(t) ? t : g(e) ? e : c(t.right(e.right))
            }
        },
        b = {
            URI: p,
            fromEither: r.identity
        },
        v = (0, n.fromOption)(b),
        g = i.isLeft,
        w = i.isRight,
        S = function(e, t) {
            return function(n) {
                return g(n) ? e(n.left) : t(n.right)
            }
        };
    t.tap({
        URI: p,
        map: l,
        ap: f,
        chain: s
    }), r.identity, r.identity, b.fromEither;
    var E = S(r.identity, r.identity);
    i.emptyRecord;
    var j = c(i.emptyReadonlyArray),
        O = function(e) {
            return function(t) {
                var n = e(0, i.head(t));
                if (g(n)) return n;
                for (var r = [n.right], o = 1; o < t.length; o++) {
                    var u = e(o, t[o]);
                    if (g(u)) return u;
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
            return g(n) ? a(e(n.left)) : c(t(n.right))
        }
    }, "fromNullable", 0, function(e) {
        return function(t) {
            return null == t ? a(e) : c(t)
        }
    }, "fromOption", 0, v, "getApplicativeValidation", 0, function(e) {
        return {
            URI: p,
            _E: void 0,
            map: l,
            ap: function(t, n) {
                return g(t) ? g(n) ? a(e.concat(t.left, n.left)) : t : g(n) ? n : c(t.right(n.right))
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
                return g(e) || n(e.right) ? e : t
            },
            filterMap: function(e, n) {
                if (g(e)) return e;
                var r = n(e.right);
                return "None" === r._tag ? t : c(r.value)
            },
            partition: function(e, n) {
                return g(e) ? (0, u.separated)(e, e) : n(e.right) ? (0, u.separated)(t, c(e.right)) : (0, u.separated)(c(e.right), t)
            },
            partitionMap: function(e, n) {
                if (g(e)) return (0, u.separated)(e, e);
                var r = n(e.right);
                return g(r) ? (0, u.separated)(c(r.left), t) : (0, u.separated)(t, c(r.right))
            }
        }
    }, "getSemigroup", 0, function(e) {
        return {
            concat: function(t, n) {
                return g(n) ? t : g(t) ? n : c(e.concat(t.right, n.right))
            }
        }
    }, "isLeft", 0, g, "isRight", 0, w, "left", 0, a, "map", 0, h, "mapLeft", 0, function(e) {
        return function(t) {
            return g(t) ? a(e(t.left)) : t
        }
    }, "match", 0, S, "right", 0, c, "swap", 0, function(e) {
        return g(e) ? c(e.left) : a(e.right)
    }, "toUnion", 0, E, "traverseReadonlyNonEmptyArrayWithIndex", 0, O, "tryCatch", 0, function(e, t) {
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
}, 601342, 776325, e => {
    "use strict";
    var t = e.i(737344),
        n = function(e) {
            return {
                _tag: "Left",
                left: e
            }
        },
        r = function(e) {
            return {
                _tag: "Right",
                right: e
            }
        },
        o = {
            _tag: "None"
        },
        i = function(e) {
            return {
                _tag: "Some",
                value: e
            }
        },
        u = function(e) {
            return "Left" === e._tag ? o : i(e.right)
        },
        a = function(e) {
            return "Some" === e._tag
        },
        c = function(e) {
            return "None" === e._tag
        };

    function s(e, t, n, r) {
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

    function l(e, t) {
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
            this.maxEventQueueLength = e, this.eventQueue = Array(this.maxEventQueueLength).fill(o), this.delegatePublisher = t, this.appendEvent = this.appendEvent.bind(this), this.publish = this.publish.bind(this)
        }
        e.prototype.appendEvent = function(e) {
            var t = this.bufferIndex % this.maxEventQueueLength,
                n = this.eventQueue[t];
            return this.eventQueue[t] = i(e), this.bufferIndex %= this.maxEventQueueLength, this.bufferIndex += 1, a(n)
        }, e.prototype.publish = function() {
            this.delegatePublisher.publish(this.eventQueue.filter(a))
        }
    })(), "function" == typeof SuppressedError && SuppressedError;
    var f = "u" > typeof globalThis ? globalThis : "u" > typeof window ? window : e.g,
        p = function(e) {
            return e && e.Math === Math && e
        },
        d = p("object" == typeof globalThis && globalThis) || p("object" == typeof window && window) || p("object" == typeof self && self) || p("object" == typeof f && f) || p("object" == typeof f && f) || function() {
            return this
        }() || Function("return this")(),
        h = {},
        m = function(e) {
            try {
                return !!e()
            } catch (e) {
                return !0
            }
        },
        y = !m(function() {
            return 7 !== Object.defineProperty({}, 1, {
                get: function() {
                    return 7
                }
            })[1]
        }),
        b = !m(function() {
            var e = (function() {}).bind();
            return "function" != typeof e || e.hasOwnProperty("prototype")
        }),
        v = Function.prototype.call,
        g = b ? v.bind(v) : function() {
            return v.apply(v, arguments)
        },
        w = {},
        S = {}.propertyIsEnumerable,
        E = Object.getOwnPropertyDescriptor;
    w.f = E && !S.call({
        1: 2
    }, 1) ? function(e) {
        var t = E(this, e);
        return !!t && t.enumerable
    } : S;
    var j, O, x = function(e, t) {
            return {
                enumerable: !(1 & e),
                configurable: !(2 & e),
                writable: !(4 & e),
                value: t
            }
        },
        T = Function.prototype,
        R = T.call,
        I = b && T.bind.bind(R, R),
        N = b ? I : function(e) {
            return function() {
                return R.apply(e, arguments)
            }
        },
        A = N({}.toString),
        P = N("".slice),
        D = Object,
        k = N("".split),
        U = m(function() {
            return !D("z").propertyIsEnumerable(0)
        }) ? function(e) {
            return "String" === P(A(e), 8, -1) ? k(e, "") : D(e)
        } : D,
        C = function(e) {
            return null == e
        },
        B = TypeError,
        M = function(e) {
            if (C(e)) throw new B("Can't call method on " + e);
            return e
        },
        _ = function(e) {
            return U(M(e))
        },
        L = "object" == typeof document && document.all,
        V = void 0 === L && void 0 !== L ? function(e) {
            return "function" == typeof e || e === L
        } : function(e) {
            return "function" == typeof e
        },
        q = function(e) {
            return "object" == typeof e ? null !== e : V(e)
        },
        $ = function(e, t) {
            var n;
            return arguments.length < 2 ? V(n = d[e]) ? n : void 0 : d[e] && d[e][t]
        },
        z = N({}.isPrototypeOf),
        F = d.navigator,
        K = F && F.userAgent,
        W = K ? String(K) : "",
        H = d.process,
        G = d.Deno,
        Q = H && H.versions || G && G.version,
        J = Q && Q.v8;
    J && (O = (j = J.split("."))[0] > 0 && j[0] < 4 ? 1 : +(j[0] + j[1])), !O && W && (!(j = W.match(/Edge\/(\d+)/)) || j[1] >= 74) && (j = W.match(/Chrome\/(\d+)/)) && (O = +j[1]);
    var X = O,
        Y = d.String,
        Z = !!Object.getOwnPropertySymbols && !m(function() {
            var e = Symbol("symbol detection");
            return !Y(e) || !(Object(e) instanceof Symbol) || !Symbol.sham && X && X < 41
        }),
        ee = Z && !Symbol.sham && "symbol" == typeof Symbol.iterator,
        et = Object,
        en = ee ? function(e) {
            return "symbol" == typeof e
        } : function(e) {
            var t = $("Symbol");
            return V(t) && z(t.prototype, et(e))
        },
        er = String,
        eo = function(e) {
            try {
                return er(e)
            } catch (e) {
                return "Object"
            }
        },
        ei = TypeError,
        eu = function(e) {
            if (V(e)) return e;
            throw new ei(eo(e) + " is not a function")
        },
        ea = TypeError,
        ec = {
            exports: {}
        },
        es = Object.defineProperty,
        el = function(e, t) {
            try {
                es(d, e, {
                    value: t,
                    configurable: !0,
                    writable: !0
                })
            } catch (n) {
                d[e] = t
            }
            return t
        },
        ef = "__core-js_shared__",
        ep = ec.exports = d[ef] || el(ef, {});
    (ep.versions || (ep.versions = [])).push({
        version: "3.43.0",
        mode: "global",
        copyright: "© 2014-2025 Denis Pushkarev (zloirock.ru)",
        license: "https://github.com/zloirock/core-js/blob/v3.43.0/LICENSE",
        source: "https://github.com/zloirock/core-js"
    });
    var ed = ec.exports,
        eh = function(e, t) {
            return ed[e] || (ed[e] = t || {})
        },
        em = Object,
        ey = N({}.hasOwnProperty),
        eb = Object.hasOwn || function(e, t) {
            return ey(em(M(e)), t)
        },
        ev = 0,
        eg = Math.random(),
        ew = N(1.1.toString),
        eS = function(e) {
            return "Symbol(" + (void 0 === e ? "" : e) + ")_" + ew(++ev + eg, 36)
        },
        eE = d.Symbol,
        ej = eh("wks"),
        eO = ee ? eE.for || eE : eE && eE.withoutSetter || eS,
        ex = function(e, t) {
            var n = e[t];
            return C(n) ? void 0 : eu(n)
        },
        eT = function(e, t) {
            var n, r;
            if ("string" === t && V(n = e.toString) && !q(r = g(n, e)) || V(n = e.valueOf) && !q(r = g(n, e)) || "string" !== t && V(n = e.toString) && !q(r = g(n, e))) return r;
            throw new ea("Can't convert object to primitive value")
        },
        eR = TypeError,
        eI = (eb(ej, eZ = "toPrimitive") || (ej[eZ] = Z && eb(eE, eZ) ? eE[eZ] : eO("Symbol." + eZ)), ej[eZ]),
        eN = function(e, t) {
            if (!q(e) || en(e)) return e;
            var n, r = ex(e, eI);
            if (r) {
                if (void 0 === t && (t = "default"), !q(n = g(r, e, t)) || en(n)) return n;
                throw new eR("Can't convert object to primitive value")
            }
            return void 0 === t && (t = "number"), eT(e, t)
        },
        eA = function(e) {
            var t = eN(e, "string");
            return en(t) ? t : t + ""
        },
        eP = d.document,
        eD = q(eP) && q(eP.createElement),
        ek = !y && !m(function() {
            return 7 !== Object.defineProperty(eD ? eP.createElement("div") : {}, "a", {
                get: function() {
                    return 7
                }
            }).a
        }),
        eU = Object.getOwnPropertyDescriptor;
    h.f = y ? eU : function(e, t) {
        if (e = _(e), t = eA(t), ek) try {
            return eU(e, t)
        } catch (e) {}
        if (eb(e, t)) return x(!g(w.f, e, t), e[t])
    };
    var eC = {},
        eB = y && m(function() {
            return 42 !== Object.defineProperty(function() {}, "prototype", {
                value: 42,
                writable: !1
            }).prototype
        }),
        eM = String,
        e_ = TypeError,
        eL = function(e) {
            if (q(e)) return e;
            throw new e_(eM(e) + " is not an object")
        },
        eV = TypeError,
        eq = Object.defineProperty,
        e$ = Object.getOwnPropertyDescriptor,
        ez = "enumerable",
        eF = "configurable",
        eK = "writable";
    eC.f = y ? eB ? function(e, t, n) {
        if (eL(e), t = eA(t), eL(n), "function" == typeof e && "prototype" === t && "value" in n && eK in n && !n[eK]) {
            var r = e$(e, t);
            r && r[eK] && (e[t] = n.value, n = {
                configurable: eF in n ? n[eF] : r[eF],
                enumerable: ez in n ? n[ez] : r[ez],
                writable: !1
            })
        }
        return eq(e, t, n)
    } : eq : function(e, t, n) {
        if (eL(e), t = eA(t), eL(n), ek) try {
            return eq(e, t, n)
        } catch (e) {}
        if ("get" in n || "set" in n) throw new eV("Accessors not supported");
        return "value" in n && (e[t] = n.value), e
    };
    var eW = y ? function(e, t, n) {
            return eC.f(e, t, x(1, n))
        } : function(e, t, n) {
            return e[t] = n, e
        },
        eH = {
            exports: {}
        },
        eG = Function.prototype,
        eQ = y && Object.getOwnPropertyDescriptor,
        eJ = eb(eG, "name"),
        eX = {
            EXISTS: eJ,
            PROPER: eJ && "something" === (function() {}).name,
            CONFIGURABLE: eJ && (!y || y && eQ(eG, "name").configurable)
        },
        eY = N(Function.toString);
    V(ed.inspectSource) || (ed.inspectSource = function(e) {
        return eY(e)
    });
    var eZ, e0, e1, e2, e4 = ed.inspectSource,
        e7 = d.WeakMap,
        e8 = V(e7) && /native code/.test(String(e7)),
        e3 = eh("keys"),
        e6 = {},
        e5 = "Object already initialized",
        e9 = d.TypeError,
        te = d.WeakMap;
    if (e8 || ed.state) {
        var tt = ed.state || (ed.state = new te);
        tt.get = tt.get, tt.has = tt.has, tt.set = tt.set, e0 = function(e, t) {
            if (tt.has(e)) throw new e9(e5);
            return t.facade = e, tt.set(e, t), t
        }, e1 = function(e) {
            return tt.get(e) || {}
        }, e2 = function(e) {
            return tt.has(e)
        }
    } else {
        var tn, tr = e3[tn = "state"] || (e3[tn] = eS(tn));
        e6[tr] = !0, e0 = function(e, t) {
            if (eb(e, tr)) throw new e9(e5);
            return t.facade = e, eW(e, tr, t), t
        }, e1 = function(e) {
            return eb(e, tr) ? e[tr] : {}
        }, e2 = function(e) {
            return eb(e, tr)
        }
    }
    var to = e1,
        ti = eX.CONFIGURABLE,
        tu = String,
        ta = Object.defineProperty,
        tc = N("".slice),
        ts = N("".replace),
        tl = N([].join),
        tf = y && !m(function() {
            return 8 !== ta(function() {}, "length", {
                value: 8
            }).length
        }),
        tp = String(String).split("String"),
        td = eH.exports = function(e, t, n) {
            "Symbol(" === tc(tu(t), 0, 7) && (t = "[" + ts(tu(t), /^Symbol\(([^)]*)\).*$/, "$1") + "]"), n && n.getter && (t = "get " + t), n && n.setter && (t = "set " + t), (!eb(e, "name") || ti && e.name !== t) && (y ? ta(e, "name", {
                value: t,
                configurable: !0
            }) : e.name = t), tf && n && eb(n, "arity") && e.length !== n.arity && ta(e, "length", {
                value: n.arity
            });
            try {
                n && eb(n, "constructor") && n.constructor ? y && ta(e, "prototype", {
                    writable: !1
                }) : e.prototype && (e.prototype = void 0)
            } catch (e) {}
            var r, o = e2(r = e) ? e1(r) : e0(r, {});
            return eb(o, "source") || (o.source = tl(tp, "string" == typeof t ? t : "")), e
        };
    Function.prototype.toString = td(function() {
        return V(this) && to(this).source || e4(this)
    }, "toString");
    var th = eH.exports,
        tm = {},
        ty = Math.ceil,
        tb = Math.floor,
        tv = Math.trunc || function(e) {
            var t = +e;
            return (t > 0 ? tb : ty)(t)
        },
        tg = function(e) {
            var t = +e;
            return t != t || 0 === t ? 0 : tv(t)
        },
        tw = Math.max,
        tS = Math.min,
        tE = Math.min,
        tj = function(e) {
            var t = tg(e);
            return t > 0 ? tE(t, 0x1fffffffffffff) : 0
        },
        tO = function(e, t) {
            var n = tg(e);
            return n < 0 ? tw(n + t, 0) : tS(n, t)
        },
        tx = function(e) {
            return function(t, n, r) {
                var o = _(t),
                    i = tj(o.length);
                if (0 === i) return !e && -1;
                var u, a = tO(r, i);
                if (e && n != n) {
                    for (; i > a;)
                        if ((u = o[a++]) != u) return !0
                } else
                    for (; i > a; a++)
                        if ((e || a in o) && o[a] === n) return e || a || 0;
                return !e && -1
            }
        },
        tT = {
            includes: tx(!0),
            indexOf: tx(!1)
        }.indexOf,
        tR = N([].push),
        tI = function(e, t) {
            var n, r = _(e),
                o = 0,
                i = [];
            for (n in r) !eb(e6, n) && eb(r, n) && tR(i, n);
            for (; t.length > o;) eb(r, n = t[o++]) && (~tT(i, n) || tR(i, n));
            return i
        },
        tN = ["constructor", "hasOwnProperty", "isPrototypeOf", "propertyIsEnumerable", "toLocaleString", "toString", "valueOf"].concat("length", "prototype");
    tm.f = Object.getOwnPropertyNames || function(e) {
        return tI(e, tN)
    };
    var tA = {};
    tA.f = Object.getOwnPropertySymbols;
    var tP = N([].concat),
        tD = $("Reflect", "ownKeys") || function(e) {
            var t = tm.f(eL(e)),
                n = tA.f;
            return n ? tP(t, n(e)) : t
        },
        tk = /#|\.prototype\./,
        tU = function(e, t) {
            var n = tB[tC(e)];
            return n === t_ || n !== tM && (V(t) ? m(t) : !!t)
        },
        tC = tU.normalize = function(e) {
            return String(e).replace(tk, ".").toLowerCase()
        },
        tB = tU.data = {},
        tM = tU.NATIVE = "N",
        t_ = tU.POLYFILL = "P",
        tL = h.f,
        tV = function(e, t, n, r) {
            r || (r = {});
            var o = r.enumerable,
                i = void 0 !== r.name ? r.name : t;
            if (V(n) && th(n, i, r), r.global) o ? e[t] = n : el(t, n);
            else {
                try {
                    r.unsafe ? e[t] && (o = !0) : delete e[t]
                } catch (e) {}
                o ? e[t] = n : eC.f(e, t, {
                    value: n,
                    enumerable: !1,
                    configurable: !r.nonConfigurable,
                    writable: !r.nonWritable
                })
            }
            return e
        },
        tq = function(e, t, n) {
            for (var r = tD(t), o = eC.f, i = h.f, u = 0; u < r.length; u++) {
                var a = r[u];
                eb(e, a) || n && eb(n, a) || o(e, a, i(t, a))
            }
        },
        t$ = {},
        tz = TypeError,
        tF = function(e) {
            var t, n;
            this.promise = new e(function(e, r) {
                if (void 0 !== t || void 0 !== n) throw new tz("Bad Promise constructor");
                t = e, n = r
            }), this.resolve = eu(t), this.reject = eu(n)
        };
    t$.f = function(e) {
        return new tF(e)
    }, ! function(e, t) {
        var n, r, o, i, u, a = e.target,
            c = e.global,
            s = e.stat;
        if (n = c ? d : s ? d[a] || el(a, {}) : d[a] && d[a].prototype)
            for (r in t) {
                if (i = t[r], o = e.dontCallGetSet ? (u = tL(n, r)) && u.value : n[r], !tU(c ? r : a + (s ? "." : "#") + r, e.forced) && void 0 !== o) {
                    if (typeof i == typeof o) continue;
                    tq(i, o)
                }(e.sham || o && o.sham) && eW(i, "sham", !0), tV(n, r, i, e)
            }
    }({
        target: "Promise",
        stat: !0
    }, {
        withResolvers: function() {
            var e = t$.f(this);
            return {
                promise: e.promise,
                resolve: e.resolve,
                reject: e.reject
            }
        }
    });
    var tK = function(e, t) {
            try {
                return r(e())
            } catch (e) {
                return n(t(e))
            }
        },
        tW = {};
    ! function(e) {
        var t = f && f.__spreadArray || function(e, t, n) {
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
    }(tW);
    var tH = function(e, t) {
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
    let tG = /\{[^{}]+\}/g;

    function tQ(e, t, n) {
        if (null == t) return "";
        if ("object" == typeof t) throw Error("Deeply-nested arrays/objects aren’t supported. Provide your own `querySerializer()` to handle these.");
        return `${e}=${!0===n?.allowReserved?t:encodeURIComponent(t)}`
    }

    function tJ(e, t, n) {
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
            r.push(tQ(i, t[o], n))
        }
        let i = r.join(o);
        return "label" === n.style || "matrix" === n.style ? `${o}${i}` : i
    }

    function tX(e, t, n) {
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
        for (let r of t) "simple" === n.style || "label" === n.style ? o.push(!0 === n.allowReserved ? r : encodeURIComponent(r)) : o.push(tQ(e, r, n));
        return "label" === n.style || "matrix" === n.style ? `${r}${o.join(r)}` : o.join(r)
    }

    function tY(e) {
        return function(t) {
            let n = [];
            if (t && "object" == typeof t)
                for (let r in t) {
                    let o = t[r];
                    if (null != o)
                        if (Array.isArray(o)) {
                            if (0 === o.length) continue;
                            n.push(tX(r, o, {
                                style: "form",
                                explode: !0,
                                ...e?.array,
                                allowReserved: e?.allowReserved || !1
                            }))
                        } else "object" != typeof o ? n.push(tQ(r, o, e)) : n.push(tJ(r, o, {
                            style: "deepObject",
                            explode: !0,
                            ...e?.object,
                            allowReserved: e?.allowReserved || !1
                        }))
                }
            return n.join("&")
        }
    }

    function tZ(e, t) {
        return e instanceof FormData ? e : t && "application/x-www-form-urlencoded" === (t.get instanceof Function ? t.get("Content-Type") ?? t.get("content-type") : t["Content-Type"] ?? t["content-type"]) ? new URLSearchParams(e).toString() : JSON.stringify(e)
    }

    function t0() {
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

    function t1(e) {
        return e.endsWith("/") ? e.substring(0, e.length - 1) : e
    }
    var t2, t4, t7, t8, t3, t6, t5 = (null == (t6 = null == (t3 = window.Roblox) ? void 0 : t3.Cookies) ? void 0 : t6.getBrowserTrackerId) || function() {
            return "unknown"
        },
        t9 = function(e, n) {
            var r = function(e) {
                let {
                    baseUrl: n = "",
                    Request: r = globalThis.Request,
                    fetch: o = globalThis.fetch,
                    querySerializer: i,
                    bodySerializer: u,
                    headers: a,
                    requestInitExt: c,
                    ...s
                } = {
                    ...e
                };
                c = "object" == typeof t.default && Number.parseInt(t.default?.versions?.node?.substring(0, 2)) >= 18 && t.default.versions.undici ? c : void 0, n = t1(n);
                let l = [];
                async function f(e, t) {
                    var f;
                    let p, d, {
                            baseUrl: h,
                            fetch: m = o,
                            Request: y = r,
                            headers: b,
                            params: v = {},
                            parseAs: g = "json",
                            querySerializer: w,
                            bodySerializer: S = u ?? tZ,
                            body: E,
                            ...j
                        } = t || {},
                        O = n;
                    h && (O = t1(h) ?? n);
                    let x = "function" == typeof i ? i : tY(i);
                    w && (x = "function" == typeof w ? w : tY({
                        ..."object" == typeof i ? i : {},
                        ...w
                    }));
                    let T = void 0 === E ? void 0 : S(E, t0(a, b, v.header)),
                        R = t0(void 0 === T || T instanceof FormData ? {} : {
                            "Content-Type": "application/json"
                        }, a, b, v.header),
                        I = {
                            redirect: "follow",
                            ...s,
                            ...j,
                            body: T,
                            headers: R
                        },
                        N, A, P, D = new r((f = {
                            baseUrl: O,
                            params: v,
                            querySerializer: x
                        }, p = `${f.baseUrl}${e}`, f.params?.path && (p = function(e, t) {
                            let n = e;
                            for (let r of e.match(tG) ?? []) {
                                let e = r.substring(1, r.length - 1),
                                    o = !1,
                                    i = "simple";
                                if (e.endsWith("*") && (o = !0, e = e.substring(0, e.length - 1)), e.startsWith(".") ? (i = "label", e = e.substring(1)) : e.startsWith(";") && (i = "matrix", e = e.substring(1)), !t || void 0 === t[e] || null === t[e]) continue;
                                let u = t[e];
                                n = Array.isArray(u) ? n.replace(r, tX(e, u, {
                                    style: i,
                                    explode: o
                                })) : "object" != typeof u ? "matrix" !== i ? n.replace(r, "label" === i ? `.${encodeURIComponent(u)}` : encodeURIComponent(u)) : n.replace(r, `;${tQ(e,u)}`) : n.replace(r, tJ(e, u, {
                                    style: i,
                                    explode: o
                                }))
                            }
                            return n
                        }(p, f.params.path)), (d = f.querySerializer(f.params.query ?? {})).startsWith("?") && (d = d.substring(1)), d && (p += `?${d}`), p), I);
                    for (let e in j) e in D || (D[e] = j[e]);
                    if (l.length) {
                        for (let t of (N = Math.random().toString(36).slice(2, 11), A = Object.freeze({
                                baseUrl: O,
                                fetch: m,
                                parseAs: g,
                                querySerializer: x,
                                bodySerializer: S
                            }), l))
                            if (t && "object" == typeof t && "function" == typeof t.onRequest) {
                                let n = await t.onRequest({
                                    request: D,
                                    schemaPath: e,
                                    params: v,
                                    options: A,
                                    id: N
                                });
                                if (n) {
                                    if (!(n instanceof r)) {
                                        if (n instanceof Response) {
                                            P = n;
                                            break
                                        }
                                        throw Error("onRequest: must return new Request() or Response() when modifying the request")
                                    }
                                    D = n
                                }
                            }
                    }
                    if (!P) {
                        try {
                            P = await m(D, c)
                        } catch (n) {
                            let t = n;
                            if (l.length)
                                for (let n = l.length - 1; n >= 0; n--) {
                                    let r = l[n];
                                    if (r && "object" == typeof r && "function" == typeof r.onError) {
                                        let n = await r.onError({
                                            request: D,
                                            error: t,
                                            schemaPath: e,
                                            params: v,
                                            options: A,
                                            id: N
                                        });
                                        if (n) {
                                            if (n instanceof Response) {
                                                t = void 0, P = n;
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
                                        request: D,
                                        response: P,
                                        schemaPath: e,
                                        params: v,
                                        options: A,
                                        id: N
                                    });
                                    if (t) {
                                        if (!(t instanceof Response)) throw Error("onResponse: must return new Response() when modifying the response");
                                        P = t
                                    }
                                }
                            }
                    }
                    if (204 === P.status || "HEAD" === D.method || "0" === P.headers.get("Content-Length")) return P.ok ? {
                        data: void 0,
                        response: P
                    } : {
                        error: void 0,
                        response: P
                    };
                    if (P.ok) return "stream" === g ? {
                        data: P.body,
                        response: P
                    } : {
                        data: await P[g](),
                        response: P
                    };
                    let k = await P.text();
                    try {
                        k = JSON.parse(k)
                    } catch {}
                    return {
                        error: k,
                        response: P
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
            return c(n) || r.use.apply(r, n.value), r
        },
        ne = function() {
            var e, t, n, r = null != (n = null == (t = null == (e = window.Roblox) ? void 0 : e.EnvironmentUrls) ? void 0 : t.apiGatewayUrl) ? n : "NOT_FOUND";
            return "".concat(r, "/account-security-service")
        },
        nt = ne(),
        nn = t9(function() {
            return nt
        }, o),
        nr = function(e) {
            return s(void 0, [e], void 0, function(e) {
                var t = e.name,
                    o = e.labelValues,
                    i = e.identifier,
                    u = e.withTelemetry,
                    a = e.client;
                return l(this, function(e) {
                    var c, f;
                    switch (e.label) {
                        case 0:
                            return u ? [4, (c = function() {
                                return s(void 0, void 0, void 0, function() {
                                    return l(this, function(e) {
                                        return [2, (a || nn).POST("/v1/metrics/record", {
                                            baseUrl: ne(),
                                            body: {
                                                identifier: i || t5(),
                                                name: t || "rbxIndexedDBSmokeTest",
                                                labelValues: o,
                                                value: 1
                                            }
                                        })]
                                    })
                                })
                            }, f = function() {}, function() {
                                var e, t, o, i;
                                return e = void 0, t = void 0, o = void 0, i = function() {
                                    return tH(this, function(e) {
                                        switch (e.label) {
                                            case 0:
                                                return e.trys.push([0, 2, , 3]), [4, c().then(r)];
                                            case 1:
                                                return [2, e.sent()];
                                            case 2:
                                                return [2, n(f(e.sent()))];
                                            case 3:
                                                return [2]
                                        }
                                    })
                                }, new(o || (o = Promise))(function(n, r) {
                                    function u(e) {
                                        try {
                                            c(i.next(e))
                                        } catch (e) {
                                            r(e)
                                        }
                                    }

                                    function a(e) {
                                        try {
                                            c(i.throw(e))
                                        } catch (e) {
                                            r(e)
                                        }
                                    }

                                    function c(e) {
                                        var t;
                                        e.done ? n(e.value) : ((t = e.value) instanceof o ? t : new o(function(e) {
                                            e(t)
                                        })).then(u, a)
                                    }
                                    c((i = i.apply(e, t || [])).next())
                                })
                            })()] : [2];
                        case 1:
                            return e.sent(), [2]
                    }
                })
            })
        },
        no = function(e) {
            var t, o = e.database,
                i = e.oldVersion,
                u = e.objectStoreName,
                a = e.instrumentationName,
                c = e.withTelemetry,
                s = Promise.withResolvers(),
                l = s.promise,
                f = s.resolve,
                p = s.reject;
            switch (i) {
                default:
                    if (o.objectStoreNames.contains(u)) {
                        nr({
                            name: a,
                            labelValues: {
                                success: "true",
                                arm: "transaction-upgrade-objstore-exists"
                            },
                            withTelemetry: null == c || c
                        }), f(null);
                        break
                    }
                    tW.pipe(tK(function() {
                        return o.createObjectStore(u)
                    }, function(e) {
                        var t, r = "unknownerr-create-objstore";
                        return nr({
                            name: a,
                            labelValues: {
                                success: "false",
                                arm: "transaction-upgrade-objstore-creation",
                                error: null != (t = e instanceof Error && (null == e ? void 0 : e.message) || r) ? t : r
                            },
                            withTelemetry: null == c || c
                        }), p(Error("Could not create object store.")), n(e)
                    }), (t = function(e) {
                        return nr({
                            name: a,
                            labelValues: {
                                success: "true",
                                arm: "transaction-upgrade-objstore-creation"
                            },
                            withTelemetry: null == c || c
                        }), f(e)
                    }, function(e) {
                        return "Left" === e._tag ? e : r(t(e.right))
                    }))
            }
            return l
        },
        ni = function(e) {
            var t = e.request,
                n = e.objectStoreName,
                r = e.upgradesHandler,
                u = e.withTelemetry,
                f = e.instrumentationName,
                p = Promise.withResolvers(),
                d = p.promise,
                h = p.resolve,
                m = p.reject;
            return t.onsuccess = function(e) {
                var t = e.target.result;
                nr({
                    name: f,
                    labelValues: {
                        success: "true",
                        arm: "connection"
                    },
                    withTelemetry: null == u || u
                }), h(t)
            }, t.onerror = function(e) {
                var t, n = e.target.error;
                nr({
                    name: f,
                    labelValues: {
                        success: "false",
                        arm: "connection",
                        error: null != (t = null == n ? void 0 : n.message) ? t : "unknown-onerror"
                    },
                    withTelemetry: null == u || u
                }), m(n)
            }, t.onupgradeneeded = function(e) {
                return s(void 0, void 0, void 0, function() {
                    var t, s;
                    return l(this, function(l) {
                        switch (l.label) {
                            case 0:
                                return [4, r({
                                    database: t = e.target.result,
                                    oldVersion: e.oldVersion,
                                    objectStoreName: n,
                                    instrumentationName: f,
                                    withTelemetry: u
                                })];
                            case 1:
                                var p;
                                return s = l.sent(), a(tW.pipe(null == s ? o : i(s), (p = function(e) {
                                    return e.transaction.oncomplete = function() {
                                        nr({
                                            name: f,
                                            labelValues: {
                                                success: "true",
                                                arm: "connection-initial-transaction"
                                            },
                                            withTelemetry: null == u || u
                                        }), h(t)
                                    }, d
                                }, function(e) {
                                    return c(e) ? o : i(p(e.value))
                                }))) || (nr({
                                    name: f,
                                    labelValues: {
                                        success: "true",
                                        arm: "connection-initial-transaction-early"
                                    },
                                    withTelemetry: null == u || u
                                }), h(t)), [2]
                        }
                    })
                })
            }, t.onblocked = function(e) {
                var t = e.target.result;
                nr({
                    name: f,
                    labelValues: {
                        success: "true",
                        arm: "connection-blocked"
                    },
                    withTelemetry: null == u || u
                }), t.close()
            }, d
        },
        nu = (t8 = null != (t7 = null == (t4 = null == (t2 = window.Roblox) ? void 0 : t2.EnvironmentUrls) ? void 0 : t4.apiGatewayUrl) ? t7 : "NOT_FOUND", "".concat(t8, "/rotating-client-service"));
    t9(function() {
        return nu
    }, o), e.s(["getWithDefaultHandlers", 0, function(e) {
        var t = e.database,
            n = e.objectStoreName,
            r = e.key,
            u = e.instrumentationName,
            a = e.withTelemetry;
        if (!t.objectStoreNames.contains(n)) return o;
        var c = Promise.withResolvers(),
            s = c.promise,
            l = c.resolve,
            f = t.transaction(n, "readonly");
        return f.oncomplete = function() {
            nr({
                name: u,
                labelValues: {
                    success: "true",
                    arm: "transaction-get-complete"
                },
                withTelemetry: null == a || a
            })
        }, f.objectStore(n).get(r).onsuccess = function(e) {
            var t = e.target.result;
            nr({
                name: u,
                labelValues: {
                    success: "true",
                    arm: "transaction-get"
                },
                withTelemetry: null == a || a
            }), l(t)
        }, i(s)
    }, "putWithDefaultHandlers", 0, function(e) {
        var t = e.database,
            n = e.objectStoreName,
            r = e.key,
            u = e.value,
            a = e.instrumentationName,
            c = e.withTelemetry;
        if (!t.objectStoreNames.contains(n)) return o;
        var s = Promise.withResolvers(),
            l = s.promise,
            f = s.resolve,
            p = t.transaction(n, "readwrite");
        return p.oncomplete = function() {
            nr({
                name: a,
                labelValues: {
                    success: "true",
                    arm: "transaction-put-complete"
                },
                withTelemetry: null == c || c
            })
        }, p.objectStore(n).put(u, r).onsuccess = function(e) {
            var t = e.target.result;
            nr({
                name: a,
                labelValues: {
                    success: "true",
                    arm: "transaction-put"
                },
                withTelemetry: null == c || c
            }), f(t)
        }, i(l)
    }, "tryGetIndexedDBConnectionWithDefaults", 0, function(e) {
        var t = e.databaseName,
            n = e.objectStoreName,
            r = e.version,
            o = e.instrumentationName,
            i = e.withTelemetry,
            a = indexedDB || window.indexedDB || window.mozIndexedDB || window.webkitIndexedDB || window.msIndexedDB;
        return tW.pipe(tK(function() {
            return nr({
                name: o,
                labelValues: {
                    success: "true",
                    arm: "open-connection"
                },
                withTelemetry: null == i || i
            }), ni({
                request: a.open(t, r),
                objectStoreName: n,
                upgradesHandler: no,
                instrumentationName: o,
                withTelemetry: null == i || i
            })
        }, function(e) {
            var t, n = "unknownerr-open-connection";
            return nr({
                name: o,
                labelValues: {
                    success: "false",
                    arm: "open-connection",
                    error: null != (t = e instanceof Error && (null == e ? void 0 : e.message) || n) ? t : n
                },
                withTelemetry: null == i || i
            }), e
        }), u)
    }], 601342);
    var na = e.i(245837),
        nc = e.i(645020);
    let ns = {
            isSecureAuthenticationIntentEnabled: !0,
            isBoundAuthTokenEnabled: !0,
            boundAuthTokenWhitelist: "",
            boundAuthTokenExemptlist: '{"Exemptlist":[]}',
            hbaIndexedDBVersion: 1,
            batEventSampleRate: 500
        },
        nl = {
            ...ns,
            hbaIndexedDBName: "hbaDB",
            hbaIndexedDBObjStoreName: "hbaObjectStore",
            hbaIndexedDBKeyName: "hba_keys"
        },
        nf = {
            ...ns,
            hbaIndexedDBName: "hbaDb-Test",
            hbaIndexedDBObjStoreName: "hbaObjStore-Test",
            hbaIndexedDBKeyName: "hba-keys"
        };
    e.s(["hbaMeta", 0, () => (() => {
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
            hbaIndexedDBVersion: (0, nc.parseInt)(t.hbaIndexedDbVersion ?? "") ?? 1,
            batEventSampleRate: (0, nc.parseInt)(t.batEventSampleRate ?? "") ?? 0,
            isSecureAuthenticationIntentEnabled: "true" === t.isSecureAuthenticationIntentEnabled
        }
    })() ?? ("roblox.com" === na.default.domain ? nl : nf)], 776325)
}, 302736, 41808, e => {
    "use strict";
    var t = e.i(245837),
        n = e.i(181759);
    let r = null,
        o = (e, o) => {
            (r ??= new n.Tracker(new n.Configuration({
                baseUrl: `https://ecsv2.${t.default.domain}/www`
            }))).sendEventViaImg({
                target: "www",
                localTime: new Date,
                eventType: e,
                context: "hba",
                additionalProperties: o
            })
        };
    e.s(["ONE_MILLION", 0, 1e6, "sendBATMissingEvent", 0, (e, t, n) => {
        1e6 * Math.random() < n && o("batMissing", {
            field: e,
            kind: t.kind,
            messageRaw: t.message
        })
    }, "sendBATSuccessEvent", 0, (e, t) => {
        1e6 * Math.random() < t && o("batCreated", {
            field: e
        })
    }, "sendSAIMissingEvent", 0, e => {
        o("saiMissing", {
            messageRaw: e.message
        })
    }, "sendSAISuccessEvent", 0, () => {
        o("saiCreated", {})
    }], 302736);
    var i = e.i(723941);
    e.s(["getErrorMessage", 0, e => (null != e && "object" == typeof e && "message" in e && "string" == typeof e.message ? e : i.serialize(e).map(e => Error(e)).getOrElse(() => Error(String(e)))).message], 41808)
}, 845990, e => {
    "use strict";
    let t, n, r = async (e, r, o) => {
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
    }, o = async (e, r, o, i) => {
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
    }, i = async (e, r, o) => {
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
    }, u = async function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : t;
        try {
            let t = indexedDB.deleteDatabase(e);
            return new Promise((e, n) => {
                t.onerror = () => {
                    n(t.error)
                }, t.onblocked = () => {
                    n(Error("IndexedDB delete blocked by an open connection"))
                }, t.onsuccess = () => {
                    e()
                }
            })
        } catch (e) {
            return console.warn("delete crypto db error: ", e), {}
        }
    };
    e.s(["deleteCryptoDB", 0, u, "deleteCryptoKeyPair", 0, i, "getCryptoKeyPair", 0, r, "putCryptoKeyPair", 0, o])
}]);

//# debugId=b79ec0be-7aec-3dee-56b1-c8456687e233
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/0lmpev18327h0.js.map