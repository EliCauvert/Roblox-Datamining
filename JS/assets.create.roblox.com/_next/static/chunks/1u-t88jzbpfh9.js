;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "89ff7ad5-6618-4910-ae3a-edf5eaecf50e")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 656350, t => {
    "use strict";
    let n;
    var r, i, a, s, o, u, l, c, d, h, f = t.i(2226),
        p = t.i(221628);
    let v = function(t) {
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
        },
        m = function(t) {
            return new this(function(n, r) {
                if (!(t && void 0 !== t.length)) return r(TypeError(typeof t + " " + t + " is not iterable(cannot read property Symbol(Symbol.iterator))"));
                var i = Array.prototype.slice.call(t);
                if (0 === i.length) return n([]);
                for (var a = i.length, s = 0; s < i.length; s++) ! function t(r, s) {
                    if (s && ("object" == typeof s || "function" == typeof s)) {
                        var o = s.then;
                        if ("function" == typeof o) return void o.call(s, function(n) {
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
                        value: s
                    }, 0 == --a && n(i)
                }(s, i[s])
            })
        };

    function y(t, n) {
        this.name = "AggregateError", this.errors = t, this.message = n || ""
    }
    y.prototype = Error.prototype;
    let g = function(t) {
        var n = this;
        return new n(function(r, i) {
            if (!(t && void 0 !== t.length)) return i(TypeError("Promise.any accepts an array"));
            var a = Array.prototype.slice.call(t);
            if (0 === a.length) return i();
            for (var s = [], o = 0; o < a.length; o++) try {
                n.resolve(a[o]).then(r).catch(function(t) {
                    s.push(t), s.length === a.length && i(new y(s, "All promises were rejected"))
                })
            } catch (t) {
                i(t)
            }
        })
    };
    var w = setTimeout;

    function b(t) {
        return !!(t && void 0 !== t.length)
    }

    function _() {}

    function x(t) {
        if (!(this instanceof x)) throw TypeError("Promises must be constructed via new");
        if ("function" != typeof t) throw TypeError("not a function");
        this._state = 0, this._handled = !1, this._value = void 0, this._deferreds = [], q(t, this)
    }

    function P(t, n) {
        for (; 3 === t._state;) t = t._value;
        0 === t._state ? t._deferreds.push(n) : (t._handled = !0, x._immediateFn(function() {
            var r, i = 1 === t._state ? n.onFulfilled : n.onRejected;
            if (null === i) return void(1 === t._state ? S : T)(n.promise, t._value);
            try {
                r = i(t._value)
            } catch (t) {
                T(n.promise, t);
                return
            }
            S(n.promise, r)
        }))
    }

    function S(t, n) {
        try {
            if (n === t) throw TypeError("A promise cannot be resolved with itself.");
            if (n && ("object" == typeof n || "function" == typeof n)) {
                var r = n.then;
                if (n instanceof x) {
                    t._state = 3, t._value = n, R(t);
                    return
                }
                if ("function" == typeof r) return void q(function() {
                    r.apply(n, arguments)
                }, t)
            }
            t._state = 1, t._value = n, R(t)
        } catch (n) {
            T(t, n)
        }
    }

    function T(t, n) {
        t._state = 2, t._value = n, R(t)
    }

    function R(t) {
        2 === t._state && 0 === t._deferreds.length && x._immediateFn(function() {
            t._handled || x._unhandledRejectionFn(t._value)
        });
        for (var n = 0, r = t._deferreds.length; n < r; n++) P(t, t._deferreds[n]);
        t._deferreds = null
    }

    function E(t, n, r) {
        this.onFulfilled = "function" == typeof t ? t : null, this.onRejected = "function" == typeof n ? n : null, this.promise = r
    }

    function q(t, n) {
        var r = !1;
        try {
            t(function(t) {
                r || (r = !0, S(n, t))
            }, function(t) {
                r || (r = !0, T(n, t))
            })
        } catch (t) {
            if (r) return;
            r = !0, T(n, t)
        }
    }
    x.prototype.catch = function(t) {
        return this.then(null, t)
    }, x.prototype.then = function(t, n) {
        var r = new this.constructor(_);
        return P(this, new E(t, n, r)), r
    }, x.prototype.finally = v, x.all = function(t) {
        return new x(function(n, r) {
            if (!b(t)) return r(TypeError("Promise.all accepts an array"));
            var i = Array.prototype.slice.call(t);
            if (0 === i.length) return n([]);
            for (var a = i.length, s = 0; s < i.length; s++) ! function t(s, o) {
                try {
                    if (o && ("object" == typeof o || "function" == typeof o)) {
                        var u = o.then;
                        if ("function" == typeof u) return void u.call(o, function(n) {
                            t(s, n)
                        }, r)
                    }
                    i[s] = o, 0 == --a && n(i)
                } catch (t) {
                    r(t)
                }
            }(s, i[s])
        })
    }, x.any = g, x.allSettled = m, x.resolve = function(t) {
        return t && "object" == typeof t && t.constructor === x ? t : new x(function(n) {
            n(t)
        })
    }, x.reject = function(t) {
        return new x(function(n, r) {
            r(t)
        })
    }, x.race = function(t) {
        return new x(function(n, r) {
            if (!b(t)) return r(TypeError("Promise.race accepts an array"));
            for (var i = 0, a = t.length; i < a; i++) x.resolve(t[i]).then(n, r)
        })
    }, x._immediateFn = "function" == typeof setImmediate && function(t) {
        setImmediate(t)
    } || function(t) {
        w(t, 0)
    }, x._unhandledRejectionFn = function(t) {
        "u" > typeof console && console && console.warn("Possible Unhandled Promise Rejection:", t)
    };
    var C = "u" > typeof self ? self : window;
    "function" != typeof C.Promise ? C.Promise = x : (C.Promise.prototype.finally || (C.Promise.prototype.finally = v), C.Promise.allSettled || (C.Promise.allSettled = m), C.Promise.any || (C.Promise.any = g)), t.i(248486);
    var A = t.i(416340),
        D = t.i(237401),
        k = t.i(68794),
        I = t.i(230242),
        L = t.i(600496),
        N = t.i(80768),
        M = t.i(127229);
    let O = "u" < typeof __SENTRY_DEBUG__ || __SENTRY_DEBUG__;
    var j = t.i(489427);
    t.i(728441), t.i(823979), t.i(350941);
    let F = j.GLOBAL_OBJ;

    function B() {
        let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
            n = F.document,
            r = (null == n ? void 0 : n.head) || (null == n ? void 0 : n.body);
        if (!r) {
            O && L.debug.error("[showReportDialog] Global document not defined");
            return
        }
        let i = (0, I.getCurrentScope)(),
            a = (0, I.getClient)(),
            s = null == a ? void 0 : a.getDsn();
        if (!s) {
            O && L.debug.error("[showReportDialog] DSN not configured");
            return
        }
        let o = {
                ...t,
                user: {
                    ...i.getUser(),
                    ...t.user
                },
                eventId: t.eventId || (0, N.lastEventId)()
            },
            u = F.document.createElement("script");
        u.async = !0, u.crossOrigin = "anonymous", u.src = function(t, n) {
            let r, i, a = (0, M.makeDsn)(t);
            if (!a) return "";
            let s = "".concat((r = a.protocol ? "".concat(a.protocol, ":") : "", i = a.port ? ":".concat(a.port) : "", "".concat(r, "//").concat(a.host).concat(i).concat(a.path ? "/".concat(a.path) : "", "/api/")), "embed/error-page/"),
                o = "dsn=".concat((0, M.dsnToString)(a));
            for (let t in n)
                if ("dsn" !== t && "onClose" !== t)
                    if ("user" === t) {
                        let t = n.user;
                        if (!t) continue;
                        t.name && (o += "&name=".concat(encodeURIComponent(t.name))), t.email && (o += "&email=".concat(encodeURIComponent(t.email)))
                    } else o += "&".concat(encodeURIComponent(t), "=").concat(encodeURIComponent(n[t]));
            return "".concat(s, "?").concat(o)
        }(s, o);
        let {
            onLoad: l,
            onClose: c
        } = o;
        if (l && (u.onload = l), c) {
            let t = n => {
                if ("__sentry_reportdialog_closed__" === n.data) try {
                    c()
                } finally {
                    F.removeEventListener("message", t)
                }
            };
            F.addEventListener("message", t)
        }
        r.appendChild(u)
    }
    var U = A;
    let G = "u" < typeof __SENTRY_DEBUG__ || __SENTRY_DEBUG__;
    var V = t.i(379705);
    let H = Symbol.for("react.forward_ref"),
        K = Symbol.for("react.memo"),
        z = {};
    z[H] = {
        $$typeof: !0,
        render: !0,
        defaultProps: !0,
        displayName: !0,
        propTypes: !0
    }, z[K] = {
        $$typeof: !0,
        compare: !0,
        defaultProps: !0,
        displayName: !0,
        propTypes: !0,
        type: !0
    }, Object.defineProperty.bind(Object), Object.getOwnPropertyNames.bind(Object), null == (ex = Object.getOwnPropertySymbols) || ex.bind(Object), Object.getOwnPropertyDescriptor.bind(Object), Object.getPrototypeOf.bind(Object);
    let W = {
        componentStack: null,
        error: null,
        eventId: null
    };
    class J extends U.Component {
        componentDidCatch(t, n) {
            let {
                componentStack: r
            } = n, {
                beforeCapture: i,
                onError: a,
                showDialog: s,
                dialogOptions: o
            } = this.props;
            (0, I.withScope)(u => {
                i && i(u, t, r);
                let l = function(t, n, r) {
                    let i, {
                        componentStack: a
                    } = n;
                    if (null !== (i = A.version.match(/^([^.]+)/)) && parseInt(i[0]) >= 17 && (0, V.isError)(t) && a) {
                        let n, r = Error(t.message);
                        r.name = "React ErrorBoundary ".concat(t.name), r.stack = a, n = new WeakSet,
                            function t(r, i) {
                                if (!n.has(r)) {
                                    if (r.cause) return n.add(r), t(r.cause, i);
                                    r.cause = i
                                }
                            }(t, r)
                    }
                    return (0, I.withScope)(n => (n.setContext("react", {
                        componentStack: a
                    }), (0, N.captureException)(t, r)))
                }(t, n, {
                    mechanism: {
                        handled: null != this.props.handled ? this.props.handled : !!this.props.fallback,
                        type: "auto.function.react.error_boundary"
                    }
                });
                a && a(t, r, l), s && (this._lastEventId = l, this._openFallbackReportDialog && B({
                    ...o,
                    eventId: l
                })), this.setState({
                    error: t,
                    componentStack: r,
                    eventId: l
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
            i && (this.state === W ? i(null, null, null) : i(t, n, r)), this._cleanupHook && (this._cleanupHook(), this._cleanupHook = void 0)
        }
        resetErrorBoundary() {
            let {
                onReset: t
            } = this.props, {
                error: n,
                componentStack: r,
                eventId: i
            } = this.state;
            t && t(n, r, i), this.setState(W)
        }
        render() {
            let {
                fallback: t,
                children: n
            } = this.props, r = this.state;
            if (null === r.componentStack) return "function" == typeof n ? n() : n;
            let i = "function" == typeof t ? U.createElement(t, {
                error: r.error,
                componentStack: r.componentStack,
                resetError: () => this.resetErrorBoundary(),
                eventId: r.eventId
            }) : t;
            return U.isValidElement(i) ? i : (t && G && L.debug.warn("fallback did not produce a valid ReactElement"), null)
        }
        constructor(t) {
            super(t), this.state = W, this._openFallbackReportDialog = !0;
            const n = (0, I.getClient)();
            n && t.showDialog && (this._openFallbackReportDialog = !1, this._cleanupHook = n.on("afterSendEvent", n => {
                !n.type && this._lastEventId && n.event_id === this._lastEventId && B({
                    ...t.dialogOptions,
                    eventId: this._lastEventId
                })
            }))
        }
    }
    var Z = t.i(387125),
        Y = t.i(795621),
        Q = t.i(458451),
        X = t.i(260241),
        $ = t.i(429884),
        ee = t.i(602635),
        et = t.i(79187),
        en = t.i(540513),
        er = t.i(352421);
    t.i(865800);
    var ei = t.i(780247),
        ea = t.i(571957),
        es = t.i(33106),
        eo = t.i(379666),
        eu = t.i(178417),
        el = t.i(52301),
        ec = t.i(941603),
        ed = t.i(947287),
        eh = t.i(51760),
        ef = {},
        ep = ea.default;

    function ev(t, n, r) {
        t = t || function(t) {
            this.queue(t)
        }, n = n || function() {
            this.queue(null)
        };
        var i = !1,
            a = !1,
            s = [],
            o = !1,
            u = new ep;

        function l() {
            for (; s.length && !u.paused;) {
                var t = s.shift();
                if (null === t) return u.emit("end");
                u.emit("data", t)
            }
        }
        return u.readable = u.writable = !0, u.paused = !1, u.autoDestroy = !(r && !1 === r.autoDestroy), u.write = function(n) {
            return t.call(this, n), !u.paused
        }, u.queue = u.push = function(t) {
            return o || (null === t && (o = !0), s.push(t), l()), u
        }, u.on("end", function() {
            u.readable = !1, !u.writable && u.autoDestroy && f.default.nextTick(function() {
                u.destroy()
            })
        }), u.end = function(t) {
            if (!i) return i = !0, arguments.length && u.write(t), u.writable = !1, n.call(u), !u.readable && u.autoDestroy && u.destroy(), u
        }, u.destroy = function() {
            if (!a) return a = !0, i = !0, s.length = 0, u.writable = u.readable = !1, u.emit("close"), u
        }, u.pause = function() {
            if (!u.paused) return u.paused = !0, u
        }, u.resume = function() {
            return u.paused && (u.paused = !1, u.emit("resume")), l(), u.paused || u.emit("drain"), u
        }, u
    }({
        get exports() {
            return ef
        },
        set exports(e) {
            ef = e
        }
    }).exports = ev, ev.through = ev;
    var em = Object.prototype.toString,
        ey = "function" == typeof er.Buffer.alloc && "function" == typeof er.Buffer.allocUnsafe && "function" == typeof er.Buffer.from,
        eg = {},
        ew = Array.isArray || function(t) {
            return "[object Array]" == Object.prototype.toString.call(t)
        },
        eb = {};

    function e_(t) {
        return Object.prototype.toString.call(t)
    }
    eb.isArray = function(t) {
        return Array.isArray ? Array.isArray(t) : "[object Array]" === e_(t)
    }, eb.isBoolean = function(t) {
        return "boolean" == typeof t
    }, eb.isNull = function(t) {
        return null === t
    }, eb.isNullOrUndefined = function(t) {
        return null == t
    }, eb.isNumber = function(t) {
        return "number" == typeof t
    }, eb.isString = function(t) {
        return "string" == typeof t
    }, eb.isSymbol = function(t) {
        return "symbol" == typeof t
    }, eb.isUndefined = function(t) {
        return void 0 === t
    }, eb.isRegExp = function(t) {
        return "[object RegExp]" === e_(t)
    }, eb.isObject = function(t) {
        return "object" == typeof t && null !== t
    }, eb.isDate = function(t) {
        return "[object Date]" === e_(t)
    }, eb.isError = function(t) {
        return "[object Error]" === e_(t) || t instanceof Error
    }, eb.isFunction = function(t) {
        return "function" == typeof t
    }, eb.isPrimitive = function(t) {
        return null === t || "boolean" == typeof t || "number" == typeof t || "string" == typeof t || "symbol" == typeof t || void 0 === t
    }, eb.isBuffer = es.default.Buffer.isBuffer;
    var ex, eP, eS = {},
        eT = {},
        eR = {
            get exports() {
                return eT
            },
            set exports(e) {
                eT = e
            }
        },
        eE = {
            get exports() {
                return eS
            },
            set exports(e) {
                eS = e
            }
        };
    try {
        var eq = t.r(52301);
        if ("function" != typeof eq.inherits) throw "";
        eE.exports = eq.inherits
    } catch (t) {
        eP || (eP = 1, "function" == typeof Object.create ? eR.exports = function(t, n) {
            n && (t.super_ = n, t.prototype = Object.create(n.prototype, {
                constructor: {
                    value: t,
                    enumerable: !1,
                    writable: !0,
                    configurable: !0
                }
            }))
        } : eR.exports = function(t, n) {
            if (n) {
                t.super_ = n;
                var r = function() {};
                r.prototype = n.prototype, t.prototype = new r, t.prototype.constructor = t
            }
        }), eE.exports = eT
    }
    var eC, eA = {};

    function eD() {
        if (eC) return eA;
        eC = 1;
        var t = es.default.Buffer,
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
            r = eA.StringDecoder = function(r) {
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
                        this.surrogateSize = 3, this.detectIncompleteChar = s;
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

        function s(t) {
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
                var s = this.surrogateSize;
                return this.charLength += s, this.charReceived += s, this.charBuffer.copy(this.charBuffer, s, 0, s), t.copy(this.charBuffer, 0, 0, s), r.substring(0, a)
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
        }, eA
    }
    var ek = es.default.Buffer;
    eO.ReadableState = eM;
    var eI = eo.default.EventEmitter;
    eI.listenerCount || (eI.listenerCount = function(t, n) {
        return t.listeners(n).length
    });
    var eL, eN = ea.default;

    function eM(t, n) {
        var r = (t = t || {}).highWaterMark;
        this.highWaterMark = r || 0 === r ? r : 16384, this.highWaterMark = ~~this.highWaterMark, this.buffer = [], this.length = 0, this.pipes = null, this.pipesCount = 0, this.flowing = !1, this.ended = !1, this.endEmitted = !1, this.reading = !1, this.calledRead = !1, this.sync = !0, this.needReadable = !1, this.emittedReadable = !1, this.readableListening = !1, this.objectMode = !!t.objectMode, this.defaultEncoding = t.defaultEncoding || "utf8", this.ranOut = !1, this.awaitDrain = 0, this.readingMore = !1, this.decoder = null, this.encoding = null, t.encoding && (eL || (eL = eD().StringDecoder), this.decoder = new eL(t.encoding), this.encoding = t.encoding)
    }

    function eO(t) {
        if (!(this instanceof eO)) return new eO(t);
        this._readableState = new eM(t), this.readable = !0, eN.call(this)
    }

    function ej(t, n, r, i, a) {
        var s, o, u = (s = r, o = null, ek.isBuffer(s) || "string" == typeof s || null == s || n.objectMode || (o = TypeError("Invalid non-string/buffer chunk")), o);
        if (u) t.emit("error", u);
        else if (null == r) n.reading = !1, n.ended || function(t, n) {
            if (n.decoder && !n.ended) {
                var r = n.decoder.end();
                r && r.length && (n.buffer.push(r), n.length += n.objectMode ? 1 : r.length)
            }
            n.ended = !0, n.length > 0 ? eB(t) : ez(t)
        }(t, n);
        else if (n.objectMode || r && r.length > 0)
            if (n.ended && !a) {
                var l = Error("stream.push() after EOF");
                t.emit("error", l)
            } else n.endEmitted && a ? (l = Error("stream.unshift() after end event"), t.emit("error", l)) : (!n.decoder || a || i || (r = n.decoder.write(r)), n.length += n.objectMode ? 1 : r.length, a ? n.buffer.unshift(r) : (n.reading = !1, n.buffer.push(r)), n.needReadable && eB(t), n.readingMore || (n.readingMore = !0, f.default.nextTick(function() {
                for (var r = n.length; !n.reading && !n.flowing && !n.ended && n.length < n.highWaterMark && (t.read(0), r !== n.length);) r = n.length;
                n.readingMore = !1
            })));
        else a || (n.reading = !1);
        return !n.ended && (n.needReadable || n.length < n.highWaterMark || 0 === n.length)
    }

    function eF(t, n) {
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

    function eB(t) {
        var n = t._readableState;
        n.needReadable = !1, n.emittedReadable || (n.emittedReadable = !0, n.sync ? f.default.nextTick(function() {
            eU(t)
        }) : eU(t))
    }

    function eU(t) {
        t.emit("readable")
    }

    function eG(t) {
        var n, r = t._readableState;

        function i(t, i, a) {
            !1 === t.write(n) && r.awaitDrain++
        }
        for (r.awaitDrain = 0; r.pipesCount && null !== (n = t.read());)
            if (1 === r.pipesCount ? i(r.pipes) : eW(r.pipes, i), t.emit("data", n), r.awaitDrain > 0) return;
        0 === r.pipesCount ? (r.flowing = !1, eI.listenerCount(t, "data") > 0 && eH(t)) : r.ranOut = !0
    }

    function eV() {
        this._readableState.ranOut && (this._readableState.ranOut = !1, eG(this))
    }

    function eH(t, n) {
        if (t._readableState.flowing) throw Error("Cannot switch to old mode now.");
        var r = n || !1,
            i = !1;
        t.readable = !0, t.pipe = eN.prototype.pipe, t.on = t.addListener = eN.prototype.on, t.on("readable", function() {
            var n;
            for (i = !0; !r && null !== (n = t.read());) t.emit("data", n);
            null === n && (i = !1, t._readableState.needReadable = !0)
        }), t.pause = function() {
            r = !0, this.emit("pause")
        }, t.resume = function() {
            r = !1, i ? f.default.nextTick(function() {
                t.emit("readable")
            }) : this.read(0), this.emit("resume")
        }, t.emit("readable")
    }

    function eK(t, n) {
        var r, i = n.buffer,
            a = n.length,
            s = !!n.decoder,
            o = !!n.objectMode;
        if (0 === i.length) return null;
        if (0 === a) r = null;
        else if (o) r = i.shift();
        else if (!t || t >= a) r = s ? i.join("") : ek.concat(i, a), i.length = 0;
        else if (t < i[0].length) r = (d = i[0]).slice(0, t), i[0] = d.slice(t);
        else if (t === i[0].length) r = i.shift();
        else {
            r = s ? "" : new ek(t);
            for (var u = 0, l = 0, c = i.length; l < c && u < t; l++) {
                var d = i[0],
                    h = Math.min(t - u, d.length);
                s ? r += d.slice(0, h) : d.copy(r, u, 0, h), h < d.length ? i[0] = d.slice(h) : i.shift(), u += h
            }
        }
        return r
    }

    function ez(t) {
        var n = t._readableState;
        if (n.length > 0) throw Error("endReadable called on non-empty stream");
        !n.endEmitted && n.calledRead && (n.ended = !0, f.default.nextTick(function() {
            n.endEmitted || 0 !== n.length || (n.endEmitted = !0, t.readable = !1, t.emit("end"))
        }))
    }

    function eW(t, n) {
        for (var r = 0, i = t.length; r < i; r++) n(t[r], r)
    }

    function eJ() {
        if (e9) return e6;
        e9 = 1, e6 = r;
        var t = Object.keys || function(t) {
            var n = [];
            for (var r in t) n.push(r);
            return n
        };
        eb.inherits = eS;
        var n = eZ();

        function r(t) {
            if (!(this instanceof r)) return new r(t);
            eO.call(this, t), n.call(this, t), t && !1 === t.readable && (this.readable = !1), t && !1 === t.writable && (this.writable = !1), this.allowHalfOpen = !0, t && !1 === t.allowHalfOpen && (this.allowHalfOpen = !1), this.once("end", i)
        }

        function i() {
            this.allowHalfOpen || this._writableState.ended || f.default.nextTick(this.end.bind(this))
        }
        return eb.inherits(r, eO),
            function(t, n) {
                for (var r = 0, i = t.length; r < i; r++) n(t[r], r)
            }(t(n.prototype), function(t) {
                r.prototype[t] || (r.prototype[t] = n.prototype[t])
            }), e6
    }

    function eZ() {
        if (tt) return te;
        tt = 1, te = a;
        var t = es.default.Buffer;
        a.WritableState = i, eb.inherits = eS;
        var n = ea.default;

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
                    if (r.writing = !1, r.writecb = null, r.length -= r.writelen, r.writelen = 0, n) i ? f.default.nextTick(function() {
                        a(n)
                    }) : a(n), t._writableState.errorEmitted = !0, t.emit("error", n);
                    else {
                        var l = u(t, r);
                        l || r.bufferProcessing || !r.buffer.length || function(t, n) {
                            n.bufferProcessing = !0;
                            for (var r = 0; r < n.buffer.length; r++) {
                                var i = n.buffer[r],
                                    a = i.chunk,
                                    o = i.encoding,
                                    u = i.callback;
                                if (s(t, n, n.objectMode ? 1 : a.length, a, o, u), n.writing) {
                                    r++;
                                    break
                                }
                            }
                            n.bufferProcessing = !1, r < n.buffer.length ? n.buffer = n.buffer.slice(r) : n.buffer.length = 0
                        }(t, r), i ? f.default.nextTick(function() {
                            o(t, r, l, a)
                        }) : o(t, r, l, a)
                    }
                }(n, t)
            }, this.writecb = null, this.writelen = 0, this.buffer = [], this.errorEmitted = !1
        }

        function a(t) {
            var r = eJ();
            if (!(this instanceof a || this instanceof r)) return new a(t);
            this._writableState = new i(t, this), this.writable = !0, n.call(this)
        }

        function s(t, n, r, i, a, s) {
            n.writelen = r, n.writecb = s, n.writing = !0, n.sync = !0, t._write(i, a, n.onwrite), n.sync = !1
        }

        function o(t, n, r, i) {
            r || 0 === n.length && n.needDrain && (n.needDrain = !1, t.emit("drain")), i(), r && l(t, n)
        }

        function u(t, n) {
            return n.ending && 0 === n.length && !n.finished && !n.writing
        }

        function l(t, n) {
            var r = u(0, n);
            return r && (n.finished = !0, t.emit("finish")), r
        }
        return eb.inherits(a, n), a.prototype.pipe = function() {
            this.emit("error", Error("Cannot pipe. Not readable."))
        }, a.prototype.write = function(n, i, a) {
            var o, u, l, c, d, h, p, v, m, y = this._writableState,
                g = !1;
            return "function" == typeof i && (a = i, i = null), t.isBuffer(n) ? i = "buffer" : i || (i = y.defaultEncoding), "function" != typeof a && (a = function() {}), y.ended ? (o = a, u = Error("write after end"), this.emit("error", u), f.default.nextTick(function() {
                o(u)
            })) : function(n, r, i, a) {
                var s = !0;
                if (!t.isBuffer(i) && "string" != typeof i && null != i && !r.objectMode) {
                    var o = TypeError("Invalid non-string/buffer chunk");
                    n.emit("error", o), f.default.nextTick(function() {
                        a(o)
                    }), s = !1
                }
                return s
            }(this, y, n, a) && (l = n, c = i, d = a, h = l, p = c, y.objectMode || !1 === y.decodeStrings || "string" != typeof h || (h = new t(h, p)), l = h, t.isBuffer(l) && (c = "buffer"), v = y.objectMode ? 1 : l.length, y.length += v, (m = y.length < y.highWaterMark) || (y.needDrain = !0), y.writing ? y.buffer.push(new r(l, c, d)) : s(this, y, v, l, c, d), g = m), g
        }, a.prototype._write = function(t, n, r) {
            r(Error("not implemented"))
        }, a.prototype.end = function(t, n, r) {
            var i, a = this._writableState;
            "function" == typeof t ? (r = t, t = null, n = null) : "function" == typeof n && (r = n, n = null), null != t && this.write(t, n), a.ending || a.finished || (i = r, a.ending = !0, l(this, a), i && (a.finished ? f.default.nextTick(i) : this.once("finish", i)), a.ended = !0)
        }, te
    }
    eb.inherits = eS, eb.inherits(eO, eN), eO.prototype.push = function(t, n) {
        var r = this._readableState;
        return "string" != typeof t || r.objectMode || (n = n || r.defaultEncoding) !== r.encoding && (t = new ek(t, n), n = ""), ej(this, r, t, n, !1)
    }, eO.prototype.unshift = function(t) {
        return ej(this, this._readableState, t, "", !0)
    }, eO.prototype.setEncoding = function(t) {
        eL || (eL = eD().StringDecoder), this._readableState.decoder = new eL(t), this._readableState.encoding = t
    }, eO.prototype.read = function(t) {
        var n = this._readableState;
        n.calledRead = !0;
        var r, i = t;
        if (("number" != typeof t || t > 0) && (n.emittedReadable = !1), 0 === t && n.needReadable && (n.length >= n.highWaterMark || n.ended)) return eB(this), null;
        if (0 === (t = eF(t, n)) && n.ended) return r = null, n.length > 0 && n.decoder && (r = eK(t, n), n.length -= r.length), 0 === n.length && ez(this), r;
        var a = n.needReadable;
        return n.length - t <= n.highWaterMark && (a = !0), (n.ended || n.reading) && (a = !1), a && (n.reading = !0, n.sync = !0, 0 === n.length && (n.needReadable = !0), this._read(n.highWaterMark), n.sync = !1), a && !n.reading && (t = eF(i, n)), null === (r = t > 0 ? eK(t, n) : null) && (n.needReadable = !0, t = 0), n.length -= t, 0 !== n.length || n.ended || (n.needReadable = !0), n.ended && !n.endEmitted && 0 === n.length && ez(this), r
    }, eO.prototype._read = function(t) {
        this.emit("error", Error("not implemented"))
    }, eO.prototype.pipe = function(t, n) {
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
        var a = n && !1 === n.end || t === f.default.stdout || t === f.default.stderr ? l : o;

        function s(t) {
            t === r && l()
        }

        function o() {
            t.end()
        }
        i.endEmitted ? f.default.nextTick(a) : r.once("end", a), t.on("unpipe", s);
        var u = function() {
            var t = r._readableState;
            t.awaitDrain--, 0 === t.awaitDrain && eG(r)
        };

        function l() {
            t.removeListener("close", d), t.removeListener("finish", h), t.removeListener("drain", u), t.removeListener("error", c), t.removeListener("unpipe", s), r.removeListener("end", o), r.removeListener("end", l), t._writableState && !t._writableState.needDrain || u()
        }

        function c(n) {
            p(), t.removeListener("error", c), 0 === eI.listenerCount(t, "error") && t.emit("error", n)
        }

        function d() {
            t.removeListener("finish", h), p()
        }

        function h() {
            t.removeListener("close", d), p()
        }

        function p() {
            r.unpipe(t)
        }
        return t.on("drain", u), t._events && t._events.error ? ew(t._events.error) ? t._events.error.unshift(c) : t._events.error = [c, t._events.error] : t.on("error", c), t.once("close", d), t.once("finish", h), t.emit("pipe", r), i.flowing || (this.on("readable", eV), i.flowing = !0, f.default.nextTick(function() {
            eG(r)
        })), t
    }, eO.prototype.unpipe = function(t) {
        var n = this._readableState;
        if (0 === n.pipesCount) return this;
        if (1 === n.pipesCount) return t && t !== n.pipes || (t || (t = n.pipes), n.pipes = null, n.pipesCount = 0, this.removeListener("readable", eV), n.flowing = !1, t && t.emit("unpipe", this)), this;
        if (!t) {
            var r = n.pipes,
                i = n.pipesCount;
            n.pipes = null, n.pipesCount = 0, this.removeListener("readable", eV), n.flowing = !1;
            for (var a = 0; a < i; a++) r[a].emit("unpipe", this);
            return this
        }
        return -1 === (a = function(t, n) {
            for (var r = 0, i = t.length; r < i; r++)
                if (t[r] === n) return r;
            return -1
        }(n.pipes, t)) || (n.pipes.splice(a, 1), n.pipesCount -= 1, 1 === n.pipesCount && (n.pipes = n.pipes[0]), t.emit("unpipe", this)), this
    }, eO.prototype.on = function(t, n) {
        var r = eN.prototype.on.call(this, t, n);
        if ("data" !== t || this._readableState.flowing || eH(this), "readable" === t && this.readable) {
            var i = this._readableState;
            i.readableListening || (i.readableListening = !0, i.emittedReadable = !1, i.needReadable = !0, i.reading ? i.length && eB(this) : this.read(0))
        }
        return r
    }, eO.prototype.addListener = eO.prototype.on, eO.prototype.resume = function() {
        eH(this), this.read(0), this.emit("resume")
    }, eO.prototype.pause = function() {
        eH(this, !0), this.emit("pause")
    }, eO.prototype.wrap = function(t) {
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
        return eW(["error", "close", "destroy", "pause", "resume"], function(n) {
            t.on(n, i.emit.bind(i, n))
        }), i._read = function(n) {
            r && (r = !1, t.resume())
        }, i
    }, eO._fromList = eK;
    var eY = eJ();

    function eQ(t, n) {
        this.afterTransform = function(t, r) {
            var i = n._transformState;
            i.transforming = !1;
            var a = i.writecb;
            if (!a) return n.emit("error", Error("no writecb in Transform class"));
            i.writechunk = null, i.writecb = null, null != r && n.push(r), a && a(t);
            var s = n._readableState;
            s.reading = !1, (s.needReadable || s.length < s.highWaterMark) && n._read(s.highWaterMark)
        }, this.needTransform = !1, this.transforming = !1, this.writecb = null, this.writechunk = null
    }

    function eX(t) {
        if (!(this instanceof eX)) return new eX(t);
        eY.call(this, t), this._transformState = new eQ(t, this);
        var n = this;
        this._readableState.needReadable = !0, this._readableState.sync = !1, this.once("finish", function() {
            "function" == typeof this._flush ? this._flush(function(t) {
                e$(n, t)
            }) : e$(n)
        })
    }

    function e$(t, n) {
        if (n) return t.emit("error", n);
        var r = t._writableState;
        t._readableState;
        var i = t._transformState;
        if (r.length) throw Error("calling transform done when ws.length != 0");
        if (i.transforming) throw Error("calling transform done when still transforming");
        return t.push(null)
    }

    function e0(t) {
        if (!(this instanceof e0)) return new e0(t);
        eX.call(this, t)
    }
    eb.inherits = eS, eb.inherits(eX, eY), eX.prototype.push = function(t, n) {
        return this._transformState.needTransform = !1, eY.prototype.push.call(this, t, n)
    }, eX.prototype._transform = function(t, n, r) {
        throw Error("not implemented")
    }, eX.prototype._write = function(t, n, r) {
        var i = this._transformState;
        if (i.writecb = r, i.writechunk = t, i.writeencoding = n, !i.transforming) {
            var a = this._readableState;
            (i.needTransform || a.needReadable || a.length < a.highWaterMark) && this._read(a.highWaterMark)
        }
    }, eX.prototype._read = function(t) {
        var n = this._transformState;
        null !== n.writechunk && n.writecb && !n.transforming ? (n.transforming = !0, this._transform(n.writechunk, n.writeencoding, n.afterTransform)) : n.needTransform = !0
    }, eb.inherits = eS, eb.inherits(e0, eX), e0.prototype._transform = function(t, n, r) {
        r(null, t)
    }, tn = eg, tr = ea.default, (tn = ({
        get exports() {
            return eg
        },
        set exports(e) {
            eg = e
        }
    }).exports = eO).Stream = tr, tn.Readable = tn, tn.Writable = eZ(), tn.Duplex = eJ(), tn.Transform = eX, tn.PassThrough = e0;
    var e1 = function(t, n, r) {
            if ("number" == typeof t) throw TypeError('"value" argument must not be a number');
            return "ArrayBuffer" === em.call(t).slice(8, -1) ? function(t, n, r) {
                n >>>= 0;
                var i = t.byteLength - n;
                if (i < 0) throw RangeError("'offset' is out of bounds");
                if (void 0 === r) r = i;
                else if ((r >>>= 0) > i) throw RangeError("'length' is out of bounds");
                return ey ? er.Buffer.from(t.slice(n, n + r)) : new er.Buffer(new Uint8Array(t.slice(n, n + r)))
            }(t, n, r) : "string" == typeof t ? function(t, n) {
                if ("string" == typeof n && "" !== n || (n = "utf8"), !er.Buffer.isEncoding(n)) throw TypeError('"encoding" must be a valid string encoding');
                return ey ? er.Buffer.from(t, n) : new er.Buffer(t, n)
            }(t, n) : ey ? er.Buffer.from(t) : new er.Buffer(t)
        },
        e2 = eg.Transform;
    eS(e3, e2);
    var e4 = {
        endScript: e1("</script"),
        endStyle: e1("</style"),
        endTitle: e1("</title"),
        comment: e1("<!--"),
        endComment: e1("-->"),
        cdata: e1("<![CDATA["),
        endCdata: e1("]]>")
    };

    function e3() {
        if (!(this instanceof e3)) return new e3;
        e2.call(this), this._readableState.objectMode = !0, this.state = "text", this.tagState = null, this.quoteState = null, this.raw = null, this.buffers = [], this._last = []
    }

    function e5(t, n) {
        if (t.length < n.length) return !1;
        for (var r = t.length - 1, i = n.length - 1; r >= 0 && i >= 0; r--, i--)
            if (e7(t[r]) !== e7(n[i])) return !1;
        return !0
    }

    function e7(t) {
        return t >= 65 && t <= 90 ? t + 32 : t
    }

    function e8(t) {
        return 32 === t || 9 === t || 10 === t || 12 === t || 13 === t
    }
    e3.prototype._transform = function(t, n, r) {
        var i = 0,
            a = 0;
        for (this._prev && (t = er.Buffer.concat([this._prev, t]), i = this._prev.length - 1, a = this._offset, this._prev = null, this._offset = 0); i < t.length; i++) {
            var s = t[i];
            if (this._last.push(s), this._last.length > 9 && this._last.shift(), this.raw) {
                var o = this._testRaw(t, a, i);
                o && (this.push(["text", o[0]]), this.raw === e4.endComment || this.raw === e4.endCdata ? (this.state = "text", this.buffers = [], this.push(["close", o[1]])) : (this.state = "open", this.buffers = [o[1]]), this.raw = null, a = i + 1)
            } else {
                if ("text" === this.state && 60 === s && i === t.length - 1) return this._prev = t, this._offset = a, r();
                if ("text" !== this.state || 60 !== s || e8(t[i + 1]))
                    if (1 === this.tagState && e8(s)) this.tagState = 2;
                    else if (2 === this.tagState && 61 === s) this.tagState = 3;
                else if (3 === this.tagState && e8(s));
                else if (3 === this.tagState && 62 !== s) this.tagState = 4, this.quoteState = 34 === s ? "double" : 39 === s ? "single" : null;
                else if (4 === this.tagState && !this.quoteState && e8(s)) this.tagState = 2;
                else if (4 === this.tagState && "double" === this.quoteState && 34 === s) this.quoteState = null, this.tagState = 2;
                else if (4 === this.tagState && "single" === this.quoteState && 39 === s) this.quoteState = null, this.tagState = 2;
                else if ("open" !== this.state || 62 !== s || this.quoteState) "open" === this.state && e5(this._last, e4.comment) ? (this.buffers.push(t.slice(a, i + 1)), a = i + 1, this.state = "text", this.raw = e4.endComment, this._pushState("open")) : "open" === this.state && e5(this._last, e4.cdata) && (this.buffers.push(t.slice(a, i + 1)), a = i + 1, this.state = "text", this.raw = e4.endCdata, this._pushState("open"));
                else if (this.buffers.push(t.slice(a, i + 1)), a = i + 1, this.state = "text", this.tagState = null, 47 === this._getChar(1)) this._pushState("close");
                else {
                    var u = this._getTag();
                    "script" === u && (this.raw = e4.endScript), "style" === u && (this.raw = e4.endStyle), "title" === u && (this.raw = e4.endTitle), this._pushState("open")
                } else i > 0 && i - a > 0 && this.buffers.push(t.slice(a, i)), a = i, this.state = "open", this.tagState = 1, this._pushState("text")
            }
        }
        a < t.length && this.buffers.push(t.slice(a)), r()
    }, e3.prototype._flush = function(t) {
        "text" === this.state && this._pushState("text"), this.push(null), t()
    }, e3.prototype._pushState = function(t) {
        if (0 !== this.buffers.length) {
            var n = er.Buffer.concat(this.buffers);
            this.buffers = [], this.push([t, n])
        }
    }, e3.prototype._getChar = function(t) {
        for (var n = 0, r = 0; r < this.buffers.length; r++) {
            var i = this.buffers[r];
            if (n + i.length > t) return i[t - n];
            n += i
        }
    }, e3.prototype._getTag = function() {
        for (var t = 0, n = "", r = 0; r < this.buffers.length; r++) {
            for (var i = this.buffers[r], a = 0; a < i.length; a++)
                if (0 !== t || 0 !== a) {
                    var s = String.fromCharCode(i[a]);
                    if (/[^\w-!\[\]]/.test(s)) return n.toLowerCase();
                    n += s
                } t += i.length
        }
    }, e3.prototype._testRaw = function(t, n, r) {
        var i = this.raw;
        if (e5(this._last, i)) {
            this.buffers.push(t.slice(n, r + 1));
            var a = (t = er.Buffer.concat(this.buffers)).length - i.length;
            return [t.slice(0, a), t.slice(a)]
        }
    };
    var e6, e9, te, tt, tn, tr, ti, ta, ts, to = {},
        tu = {},
        tl = {},
        tc = {
            get exports() {
                return tl
            },
            set exports(e) {
                tl = e
            }
        };

    function td() {
        return ti || (ti = 1, void 0 !== f.default && f.default.version && 0 !== f.default.version.indexOf("v0.") && (0 !== f.default.version.indexOf("v1.") || 0 === f.default.version.indexOf("v1.8.")) ? tc.exports = f.default : tc.exports = {
            nextTick: function(t, n, r, i) {
                if ("function" != typeof t) throw TypeError('"callback" argument must be a function');
                var a, s, o = arguments.length;
                switch (o) {
                    case 0:
                    case 1:
                        return f.default.nextTick(t);
                    case 2:
                        return f.default.nextTick(function() {
                            t.call(null, n)
                        });
                    case 3:
                        return f.default.nextTick(function() {
                            t.call(null, n, r)
                        });
                    case 4:
                        return f.default.nextTick(function() {
                            t.call(null, n, r, i)
                        });
                    default:
                        for (a = Array(o - 1), s = 0; s < a.length;) a[s++] = arguments[s];
                        return f.default.nextTick(function() {
                            t.apply(null, a)
                        })
                }
            }
        }), tl
    }
    var th, tf = {},
        tp = {
            get exports() {
                return tf
            },
            set exports(e) {
                tf = e
            }
        };

    function tv() {
        return th || (th = 1, tp.exports = ea.default), tf
    }
    var tm, ty = {},
        tg = {
            get exports() {
                return ty
            },
            set exports(e) {
                ty = e
            }
        };

    function tw() {
        return tm || (tm = 1, function(t, n) {
            var r = es.default,
                i = r.Buffer;

            function a(t, n) {
                for (var r in t) n[r] = t[r]
            }

            function s(t, n, r) {
                return i(t, n, r)
            }
            i.from && i.alloc && i.allocUnsafe && i.allocUnsafeSlow ? t.exports = r : (a(r, n), n.Buffer = s), a(i, s), s.from = function(t, n, r) {
                if ("number" == typeof t) throw TypeError("Argument must not be a number");
                return i(t, n, r)
            }, s.alloc = function(t, n, r) {
                if ("number" != typeof t) throw TypeError("Argument must be a number");
                var a = i(t);
                return void 0 !== n ? "string" == typeof r ? a.fill(n, r) : a.fill(n) : a.fill(0), a
            }, s.allocUnsafe = function(t) {
                if ("number" != typeof t) throw TypeError("Argument must be a number");
                return i(t)
            }, s.allocUnsafeSlow = function(t) {
                if ("number" != typeof t) throw TypeError("Argument must be a number");
                return r.SlowBuffer(t)
            }
        }(tg, ty)), ty
    }
    var tb, t_, tx, tP, tS, tT, tR, tE, tq, tC = {},
        tA = {
            get exports() {
                return tC
            },
            set exports(e) {
                tC = e
            }
        };

    function tD() {
        if (tx) return t_;
        tx = 1;
        var t = td();

        function n(t, n) {
            t.emit("error", n)
        }
        return t_ = {
            destroy: function(r, i) {
                var a = this,
                    s = this._readableState && this._readableState.destroyed,
                    o = this._writableState && this._writableState.destroyed;
                return s || o ? i ? i(r) : !r || this._writableState && this._writableState.errorEmitted || t.nextTick(n, this, r) : (this._readableState && (this._readableState.destroyed = !0), this._writableState && (this._writableState.destroyed = !0), this._destroy(r || null, function(r) {
                    !i && r ? (t.nextTick(n, a, r), a._writableState && (a._writableState.errorEmitted = !0)) : i && i(r)
                })), this
            },
            undestroy: function() {
                this._readableState && (this._readableState.destroyed = !1, this._readableState.reading = !1, this._readableState.ended = !1, this._readableState.endEmitted = !1), this._writableState && (this._writableState.destroyed = !1, this._writableState.ended = !1, this._writableState.ending = !1, this._writableState.finished = !1, this._writableState.errorEmitted = !1)
            }
        }
    }

    function tk() {
        if (tR) return tT;
        tR = 1;
        var t = td();

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
        tT = p;
        var r, i = t.nextTick;
        p.WritableState = f;
        var a = Object.create(eb);
        a.inherits = eS;
        var s, o = {
                deprecate: tS ? tP : (tS = 1, tP = el.default.deprecate)
            },
            u = tv(),
            l = tw().Buffer,
            c = eu.c.Uint8Array || function() {},
            d = tD();

        function h() {}

        function f(a, s) {
            r = r || tI(), a = a || {};
            var o = s instanceof r;
            this.objectMode = !!a.objectMode, o && (this.objectMode = this.objectMode || !!a.writableObjectMode);
            var u = a.highWaterMark,
                l = a.writableHighWaterMark,
                c = this.objectMode ? 16 : 16384;
            this.highWaterMark = u || 0 === u ? u : o && (l || 0 === l) ? l : c, this.highWaterMark = Math.floor(this.highWaterMark), this.finalCalled = !1, this.needDrain = !1, this.ending = !1, this.ended = !1, this.finished = !1, this.destroyed = !1;
            var d = !1 === a.decodeStrings;
            this.decodeStrings = !d, this.defaultEncoding = a.defaultEncoding || "utf8", this.length = 0, this.writing = !1, this.corked = 0, this.sync = !0, this.bufferProcessing = !1, this.onwrite = function(n) {
                ! function(n, r) {
                    var a = n._writableState,
                        s = a.sync,
                        o = a.writecb;
                    if (a.writing = !1, a.writecb = null, a.length -= a.writelen, a.writelen = 0, r) --a.pendingcb, s ? (t.nextTick(o, r), t.nextTick(b, n, a), n._writableState.errorEmitted = !0, n.emit("error", r)) : (o(r), n._writableState.errorEmitted = !0, n.emit("error", r), b(n, a));
                    else {
                        var u = g(a);
                        u || a.corked || a.bufferProcessing || !a.bufferedRequest || y(n, a), s ? i(m, n, a, u, o) : m(n, a, u, o)
                    }
                }(s, n)
            }, this.writecb = null, this.writelen = 0, this.bufferedRequest = null, this.lastBufferedRequest = null, this.pendingcb = 0, this.prefinished = !1, this.errorEmitted = !1, this.bufferedRequestCount = 0, this.corkedRequestsFree = new n(this)
        }

        function p(t) {
            if (r = r || tI(), !(s.call(p, this) || this instanceof r)) return new p(t);
            this._writableState = new f(t, this), this.writable = !0, t && ("function" == typeof t.write && (this._write = t.write), "function" == typeof t.writev && (this._writev = t.writev), "function" == typeof t.destroy && (this._destroy = t.destroy), "function" == typeof t.final && (this._final = t.final)), u.call(this)
        }

        function v(t, n, r, i, a, s, o) {
            n.writelen = i, n.writecb = o, n.writing = !0, n.sync = !0, r ? t._writev(a, n.onwrite) : t._write(a, s, n.onwrite), n.sync = !1
        }

        function m(t, n, r, i) {
            r || 0 === n.length && n.needDrain && (n.needDrain = !1, t.emit("drain")), n.pendingcb--, i(), b(t, n)
        }

        function y(t, r) {
            r.bufferProcessing = !0;
            var i = r.bufferedRequest;
            if (t._writev && i && i.next) {
                var a = Array(r.bufferedRequestCount),
                    s = r.corkedRequestsFree;
                s.entry = i;
                for (var o = 0, u = !0; i;) a[o] = i, i.isBuf || (u = !1), i = i.next, o += 1;
                a.allBuffers = u, v(t, r, !0, r.length, a, "", s.finish), r.pendingcb++, r.lastBufferedRequest = null, s.next ? (r.corkedRequestsFree = s.next, s.next = null) : r.corkedRequestsFree = new n(r), r.bufferedRequestCount = 0
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

        function w(t, n) {
            t._final(function(r) {
                n.pendingcb--, r && t.emit("error", r), n.prefinished = !0, t.emit("prefinish"), b(t, n)
            })
        }

        function b(n, r) {
            var i = g(r);
            return i && (r.prefinished || r.finalCalled || ("function" == typeof n._final ? (r.pendingcb++, r.finalCalled = !0, t.nextTick(w, n, r)) : (r.prefinished = !0, n.emit("prefinish"))), 0 === r.pendingcb && (r.finished = !0, n.emit("finish"))), i
        }
        return a.inherits(p, u), f.prototype.getBuffer = function() {
                for (var t = this.bufferedRequest, n = []; t;) n.push(t), t = t.next;
                return n
            },
            function() {
                try {
                    Object.defineProperty(f.prototype, "buffer", {
                        get: o.deprecate(function() {
                            return this.getBuffer()
                        }, "_writableState.buffer is deprecated. Use _writableState.getBuffer instead.", "DEP0003")
                    })
                } catch (t) {}
            }(), "function" == typeof Symbol && Symbol.hasInstance && "function" == typeof Function.prototype[Symbol.hasInstance] ? (s = Function.prototype[Symbol.hasInstance], Object.defineProperty(p, Symbol.hasInstance, {
                value: function(t) {
                    return !!s.call(this, t) || this === p && t && t._writableState instanceof f
                }
            })) : s = function(t) {
                return t instanceof this
            }, p.prototype.pipe = function() {
                this.emit("error", Error("Cannot pipe, not readable"))
            }, p.prototype.write = function(n, r, i) {
                var a, s, o, u, d, f, p, m, y = this._writableState,
                    g = !1,
                    w = !y.objectMode && (m = n, l.isBuffer(m) || m instanceof c);
                return w && !l.isBuffer(n) && (a = n, n = l.from(a)), "function" == typeof r && (i = r, r = null), w ? r = "buffer" : r || (r = y.defaultEncoding), "function" != typeof i && (i = h), y.ended ? (s = i, o = Error("write after end"), this.emit("error", o), t.nextTick(s, o)) : (w || (u = n, d = i, f = !0, p = !1, null === u ? p = TypeError("May not write null values to stream") : "string" == typeof u || void 0 === u || y.objectMode || (p = TypeError("Invalid non-string/buffer chunk")), p && (this.emit("error", p), t.nextTick(d, p), f = !1), f)) && (y.pendingcb++, g = function(t, n, r, i, a, s) {
                    if (!r) {
                        var o, u, c = (o = i, u = a, n.objectMode || !1 === n.decodeStrings || "string" != typeof o || (o = l.from(o, u)), o);
                        i !== c && (r = !0, a = "buffer", i = c)
                    }
                    var d = n.objectMode ? 1 : i.length;
                    n.length += d;
                    var h = n.length < n.highWaterMark;
                    if (h || (n.needDrain = !0), n.writing || n.corked) {
                        var f = n.lastBufferedRequest;
                        n.lastBufferedRequest = {
                            chunk: i,
                            encoding: a,
                            isBuf: r,
                            callback: s,
                            next: null
                        }, f ? f.next = n.lastBufferedRequest : n.bufferedRequest = n.lastBufferedRequest, n.bufferedRequestCount += 1
                    } else v(t, n, !1, d, i, a, s);
                    return h
                }(this, y, w, n, r, i)), g
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
                var a, s = this._writableState;
                "function" == typeof n ? (i = n, n = null, r = null) : "function" == typeof r && (i = r, r = null), null != n && this.write(n, r), s.corked && (s.corked = 1, this.uncork()), s.ending || s.finished || (a = i, s.ending = !0, b(this, s), a && (s.finished ? t.nextTick(a) : this.once("finish", a)), s.ended = !0, this.writable = !1)
            }, Object.defineProperty(p.prototype, "destroyed", {
                get: function() {
                    return void 0 !== this._writableState && this._writableState.destroyed
                },
                set: function(t) {
                    this._writableState && (this._writableState.destroyed = t)
                }
            }), p.prototype.destroy = d.destroy, p.prototype._undestroy = d.undestroy, p.prototype._destroy = function(t, n) {
                this.end(), n(t)
            }, tT
    }

    function tI() {
        if (tq) return tE;
        tq = 1;
        var t = td(),
            n = Object.keys || function(t) {
                var n = [];
                for (var r in t) n.push(r);
                return n
            };
        tE = l;
        var r = Object.create(eb);
        r.inherits = eS;
        var i = tV(),
            a = tk();
        r.inherits(l, i);
        for (var s = n(a.prototype), o = 0; o < s.length; o++) {
            var u = s[o];
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
        }, tE
    }
    var tL, tN, tM, tO, tj, tF, tB, tU = {};

    function tG() {
        if (tL) return tU;
        tL = 1;
        var t = tw().Buffer,
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
                    this.text = s, this.end = o, i = 4;
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

        function s(t, n) {
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

        function o(t) {
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
        return tU.StringDecoder = r, r.prototype.write = function(t) {
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
                var s = i(n[a]);
                return s >= 0 ? (s > 0 && (t.lastNeed = s - 1), s) : --a < r || -2 === s ? 0 : (s = i(n[a])) >= 0 ? (s > 0 && (t.lastNeed = s - 2), s) : --a < r || -2 === s ? 0 : (s = i(n[a])) >= 0 ? (s > 0 && (2 === s ? s = 0 : t.lastNeed = s - 3), s) : 0
            }(this, t, n);
            if (!this.lastNeed) return t.toString("utf8", n);
            this.lastTotal = r;
            var a = t.length - (r - this.lastNeed);
            return t.copy(this.lastChar, 0, a), t.toString("utf8", n, a)
        }, r.prototype.fillLast = function(t) {
            if (this.lastNeed <= t.length) return t.copy(this.lastChar, this.lastTotal - this.lastNeed, 0, this.lastNeed), this.lastChar.toString(this.encoding, 0, this.lastTotal);
            t.copy(this.lastChar, this.lastTotal - this.lastNeed, 0, t.length), this.lastNeed -= t.length
        }, tU
    }

    function tV() {
        if (tM) return tN;
        tM = 1;
        var t = td();
        tN = w;
        var n, r = function() {
            if (ts) return ta;
            ts = 1;
            var t = {}.toString;
            return ta = Array.isArray || function(n) {
                return "[object Array]" == t.call(n)
            }
        }();
        w.ReadableState = g, eo.default.EventEmitter;
        var i = function(t, n) {
                return t.listeners(n).length
            },
            a = tv(),
            s = tw().Buffer,
            o = eu.c.Uint8Array || function() {},
            u = Object.create(eb);
        u.inherits = eS;
        var l = el.default,
            c = void 0;
        c = l && l.debuglog ? l.debuglog("stream") : function() {};
        var d, h, p, v = (tb || (tb = 1, d = tw().Buffer, h = el.default, tA.exports = function() {
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
                    for (var n, r, i = d.allocUnsafe(t >>> 0), a = this.head, s = 0; a;) n = a.data, r = s, n.copy(i, r), s += a.data.length, a = a.next;
                    return i
                }, t
            }(), h && h.inspect && h.inspect.custom && (tA.exports.prototype[h.inspect.custom] = function() {
                var t = h.inspect({
                    length: this.length
                });
                return this.constructor.name + " " + t
            })), tC),
            m = tD();
        u.inherits(w, a);
        var y = ["error", "close", "destroy", "pause", "resume"];

        function g(t, r) {
            t = t || {};
            var i = r instanceof(n = n || tI());
            this.objectMode = !!t.objectMode, i && (this.objectMode = this.objectMode || !!t.readableObjectMode);
            var a = t.highWaterMark,
                s = t.readableHighWaterMark,
                o = this.objectMode ? 16 : 16384;
            this.highWaterMark = a || 0 === a ? a : i && (s || 0 === s) ? s : o, this.highWaterMark = Math.floor(this.highWaterMark), this.buffer = new v, this.length = 0, this.pipes = null, this.pipesCount = 0, this.flowing = null, this.ended = !1, this.endEmitted = !1, this.reading = !1, this.sync = !0, this.needReadable = !1, this.emittedReadable = !1, this.readableListening = !1, this.resumeScheduled = !1, this.destroyed = !1, this.defaultEncoding = t.defaultEncoding || "utf8", this.awaitDrain = 0, this.readingMore = !1, this.decoder = null, this.encoding = null, t.encoding && (p || (p = tG().StringDecoder), this.decoder = new p(t.encoding), this.encoding = t.encoding)
        }

        function w(t) {
            if (n = n || tI(), !(this instanceof w)) return new w(t);
            this._readableState = new g(t, this), this.readable = !0, t && ("function" == typeof t.read && (this._read = t.read), "function" == typeof t.destroy && (this._destroy = t.destroy)), a.call(this)
        }

        function b(t, n, r, i, a) {
            var u, l, c, d, h, f = t._readableState;
            return null === n ? (f.reading = !1, function(t, n) {
                if (!n.ended) {
                    if (n.decoder) {
                        var r = n.decoder.end();
                        r && r.length && (n.buffer.push(r), n.length += n.objectMode ? 1 : r.length)
                    }
                    n.ended = !0, P(t)
                }
            }(t, f)) : (a || (u = f, l = n, s.isBuffer(l) || l instanceof o || "string" == typeof l || void 0 === l || u.objectMode || (c = TypeError("Invalid non-string/buffer chunk")), h = c), h ? t.emit("error", h) : f.objectMode || n && n.length > 0 ? ("string" == typeof n || f.objectMode || Object.getPrototypeOf(n) === s.prototype || (d = n, n = s.from(d)), i ? f.endEmitted ? t.emit("error", Error("stream.unshift() after end event")) : _(t, f, n, !0) : f.ended ? t.emit("error", Error("stream.push() after EOF")) : (f.reading = !1, f.decoder && !r ? (n = f.decoder.write(n), f.objectMode || 0 !== n.length ? _(t, f, n, !1) : T(t, f)) : _(t, f, n, !1))) : i || (f.reading = !1)), !f.ended && (f.needReadable || f.length < f.highWaterMark || 0 === f.length)
        }

        function _(t, n, r, i) {
            n.flowing && 0 === n.length && !n.sync ? (t.emit("data", r), t.read(0)) : (n.length += n.objectMode ? 1 : r.length, i ? n.buffer.unshift(r) : n.buffer.push(r), n.needReadable && P(t)), T(t, n)
        }

        function x(t, n) {
            var r;
            return t <= 0 || 0 === n.length && n.ended ? 0 : n.objectMode ? 1 : t != t ? n.flowing && n.length ? n.buffer.head.data.length : n.length : (t > n.highWaterMark && ((r = t) >= 8388608 ? r = 8388608 : (r--, r |= r >>> 1, r |= r >>> 2, r |= r >>> 4, r |= r >>> 8, r |= r >>> 16, r++), n.highWaterMark = r), t <= n.length ? t : n.ended ? n.length : (n.needReadable = !0, 0))
        }

        function P(n) {
            var r = n._readableState;
            r.needReadable = !1, r.emittedReadable || (c("emitReadable", r.flowing), r.emittedReadable = !0, r.sync ? t.nextTick(S, n) : S(n))
        }

        function S(t) {
            c("emit readable"), t.emit("readable"), C(t)
        }

        function T(n, r) {
            r.readingMore || (r.readingMore = !0, t.nextTick(R, n, r))
        }

        function R(t, n) {
            for (var r = n.length; !n.reading && !n.flowing && !n.ended && n.length < n.highWaterMark && (c("maybeReadMore read 0"), t.read(0), r !== n.length);) r = n.length;
            n.readingMore = !1
        }

        function E(t) {
            c("readable nexttick read 0"), t.read(0)
        }

        function q(t, n) {
            n.reading || (c("resume read 0"), t.read(0)), n.resumeScheduled = !1, n.awaitDrain = 0, t.emit("resume"), C(t), n.flowing && !n.reading && t.read(0)
        }

        function C(t) {
            var n = t._readableState;
            for (c("flow", n.flowing); n.flowing && null !== t.read(););
        }

        function A(t, n) {
            var r, i, a, o;
            return 0 === n.length ? null : (n.objectMode ? r = n.buffer.shift() : !t || t >= n.length ? (r = n.decoder ? n.buffer.join("") : 1 === n.buffer.length ? n.buffer.head.data : n.buffer.concat(n.length), n.buffer.clear()) : (i = n.buffer, a = n.decoder, t < i.head.data.length ? (o = i.head.data.slice(0, t), i.head.data = i.head.data.slice(t)) : o = t === i.head.data.length ? i.shift() : a ? function(t, n) {
                var r = n.head,
                    i = 1,
                    a = r.data;
                for (t -= a.length; r = r.next;) {
                    var s = r.data,
                        o = t > s.length ? s.length : t;
                    if (o === s.length ? a += s : a += s.slice(0, t), 0 == (t -= o)) {
                        o === s.length ? (++i, r.next ? n.head = r.next : n.head = n.tail = null) : (n.head = r, r.data = s.slice(o));
                        break
                    }++i
                }
                return n.length -= i, a
            }(t, i) : function(t, n) {
                var r = s.allocUnsafe(t),
                    i = n.head,
                    a = 1;
                for (i.data.copy(r), t -= i.data.length; i = i.next;) {
                    var o = i.data,
                        u = t > o.length ? o.length : t;
                    if (o.copy(r, r.length - t, 0, u), 0 == (t -= u)) {
                        u === o.length ? (++a, i.next ? n.head = i.next : n.head = n.tail = null) : (n.head = i, i.data = o.slice(u));
                        break
                    }++a
                }
                return n.length -= a, r
            }(t, i), r = o), r)
        }

        function D(n) {
            var r = n._readableState;
            if (r.length > 0) throw Error('"endReadable()" called on non-empty stream');
            r.endEmitted || (r.ended = !0, t.nextTick(k, r, n))
        }

        function k(t, n) {
            t.endEmitted || 0 !== t.length || (t.endEmitted = !0, n.readable = !1, n.emit("end"))
        }

        function I(t, n) {
            for (var r = 0, i = t.length; r < i; r++)
                if (t[r] === n) return r;
            return -1
        }
        return Object.defineProperty(w.prototype, "destroyed", {
            get: function() {
                return void 0 !== this._readableState && this._readableState.destroyed
            },
            set: function(t) {
                this._readableState && (this._readableState.destroyed = t)
            }
        }), w.prototype.destroy = m.destroy, w.prototype._undestroy = m.undestroy, w.prototype._destroy = function(t, n) {
            this.push(null), n(t)
        }, w.prototype.push = function(t, n) {
            var r, i = this._readableState;
            return i.objectMode ? r = !0 : "string" == typeof t && ((n = n || i.defaultEncoding) !== i.encoding && (t = s.from(t, n), n = ""), r = !0), b(this, t, n, !1, r)
        }, w.prototype.unshift = function(t) {
            return b(this, t, null, !0, !1)
        }, w.prototype.isPaused = function() {
            return !1 === this._readableState.flowing
        }, w.prototype.setEncoding = function(t) {
            return p || (p = tG().StringDecoder), this._readableState.decoder = new p(t), this._readableState.encoding = t, this
        }, w.prototype.read = function(t) {
            c("read", t), t = parseInt(t, 10);
            var n = this._readableState,
                r = t;
            if (0 !== t && (n.emittedReadable = !1), 0 === t && n.needReadable && (n.length >= n.highWaterMark || n.ended)) return c("read: emitReadable", n.length, n.ended), 0 === n.length && n.ended ? D(this) : P(this), null;
            if (0 === (t = x(t, n)) && n.ended) return 0 === n.length && D(this), null;
            var i, a = n.needReadable;
            return c("need readable", a), (0 === n.length || n.length - t < n.highWaterMark) && c("length less than watermark", a = !0), n.ended || n.reading ? c("reading or ended", a = !1) : a && (c("do read"), n.reading = !0, n.sync = !0, 0 === n.length && (n.needReadable = !0), this._read(n.highWaterMark), n.sync = !1, n.reading || (t = x(r, n))), null === (i = t > 0 ? A(t, n) : null) ? (n.needReadable = !0, t = 0) : n.length -= t, 0 === n.length && (n.ended || (n.needReadable = !0), r !== t && n.ended && D(this)), null !== i && this.emit("data", i), i
        }, w.prototype._read = function(t) {
            this.emit("error", Error("_read() is not implemented"))
        }, w.prototype.pipe = function(n, a) {
            var s = this,
                o = this._readableState;
            switch (o.pipesCount) {
                case 0:
                    o.pipes = n;
                    break;
                case 1:
                    o.pipes = [o.pipes, n];
                    break;
                default:
                    o.pipes.push(n)
            }
            o.pipesCount += 1, c("pipe count=%d opts=%j", o.pipesCount, a);
            var u = a && !1 === a.end || n === f.default.stdout || n === f.default.stderr ? w : l;

            function l() {
                c("onend"), n.end()
            }
            o.endEmitted ? t.nextTick(u) : s.once("end", u), n.on("unpipe", function t(r, i) {
                c("onunpipe"), r === s && i && !1 === i.hasUnpiped && (i.hasUnpiped = !0, c("cleanup"), n.removeListener("close", y), n.removeListener("finish", g), n.removeListener("drain", d), n.removeListener("error", m), n.removeListener("unpipe", t), s.removeListener("end", l), s.removeListener("end", w), s.removeListener("data", v), h = !0, o.awaitDrain && (!n._writableState || n._writableState.needDrain) && d())
            });
            var d = function() {
                var t = s._readableState;
                c("pipeOnDrain", t.awaitDrain), t.awaitDrain && t.awaitDrain--, 0 === t.awaitDrain && i(s, "data") && (t.flowing = !0, C(s))
            };
            n.on("drain", d);
            var h = !1,
                p = !1;

            function v(t) {
                c("ondata"), p = !1, !1 !== n.write(t) || p || ((1 === o.pipesCount && o.pipes === n || o.pipesCount > 1 && -1 !== I(o.pipes, n)) && !h && (c("false write response, pause", s._readableState.awaitDrain), s._readableState.awaitDrain++, p = !0), s.pause())
            }

            function m(t) {
                c("onerror", t), w(), n.removeListener("error", m), 0 === i(n, "error") && n.emit("error", t)
            }

            function y() {
                n.removeListener("finish", g), w()
            }

            function g() {
                c("onfinish"), n.removeListener("close", y), w()
            }

            function w() {
                c("unpipe"), s.unpipe(n)
            }
            return s.on("data", v),
                function(t, n, i) {
                    if ("function" == typeof t.prependListener) return t.prependListener(n, i);
                    t._events && t._events[n] ? r(t._events[n]) ? t._events[n].unshift(i) : t._events[n] = [i, t._events[n]] : t.on(n, i)
                }(n, "error", m), n.once("close", y), n.once("finish", g), n.emit("pipe", s), o.flowing || (c("pipe resume"), s.resume()), n
        }, w.prototype.unpipe = function(t) {
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
                for (var s = 0; s < a; s++) i[s].emit("unpipe", this, r);
                return this
            }
            var o = I(n.pipes, t);
            return -1 === o || (n.pipes.splice(o, 1), n.pipesCount -= 1, 1 === n.pipesCount && (n.pipes = n.pipes[0]), t.emit("unpipe", this, r)), this
        }, w.prototype.on = function(n, r) {
            var i = a.prototype.on.call(this, n, r);
            if ("data" === n) !1 !== this._readableState.flowing && this.resume();
            else if ("readable" === n) {
                var s = this._readableState;
                s.endEmitted || s.readableListening || (s.readableListening = s.needReadable = !0, s.emittedReadable = !1, s.reading ? s.length && P(this) : t.nextTick(E, this))
            }
            return i
        }, w.prototype.addListener = w.prototype.on, w.prototype.resume = function() {
            var n = this._readableState;
            return n.flowing || (c("resume"), n.flowing = !0, n.resumeScheduled || (n.resumeScheduled = !0, t.nextTick(q, this, n))), this
        }, w.prototype.pause = function() {
            return c("call pause flowing=%j", this._readableState.flowing), !1 !== this._readableState.flowing && (c("pause"), this._readableState.flowing = !1, this.emit("pause")), this
        }, w.prototype.wrap = function(t) {
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
            for (var s = 0; s < y.length; s++) t.on(y[s], this.emit.bind(this, y[s]));
            return this._read = function(n) {
                c("wrapped _read", n), i && (i = !1, t.resume())
            }, this
        }, Object.defineProperty(w.prototype, "readableHighWaterMark", {
            enumerable: !1,
            get: function() {
                return this._readableState.highWaterMark
            }
        }), w._fromList = A, tN
    }

    function tH() {
        if (tj) return tO;
        tj = 1, tO = i;
        var t = tI(),
            n = Object.create(eb);

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
                s(t, n, r)
            }) : s(this, null, null)
        }

        function s(t, n, r) {
            if (n) return t.emit("error", n);
            if (null != r && t.push(r), t._writableState.length) throw Error("Calling transform done when ws.length != 0");
            if (t._transformState.transforming) throw Error("Calling transform done when still transforming");
            return t.push(null)
        }
        return n.inherits = eS, n.inherits(i, t), i.prototype.push = function(n, r) {
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
        }, tO
    }
    tW = {
        get exports() {
            return tu
        },
        set exports(e) {
            tu = e
        }
    }, tJ = tu, tZ = ea.default, "disable" === f.default.env.READABLE_STREAM && tZ ? (tW.exports = tZ, (tJ = tW.exports = tZ.Readable).Readable = tZ.Readable, tJ.Writable = tZ.Writable, tJ.Duplex = tZ.Duplex, tJ.Transform = tZ.Transform, tJ.PassThrough = tZ.PassThrough, tJ.Stream = tZ) : ((tJ = tW.exports = tV()).Stream = tZ || tJ, tJ.Readable = tJ, tJ.Writable = tk(), tJ.Duplex = tI(), tJ.Transform = tH(), tJ.PassThrough = function() {
        if (tB) return tF;
        tB = 1, tF = r;
        var t = tH(),
            n = Object.create(eb);

        function r(n) {
            if (!(this instanceof r)) return new r(n);
            t.call(this, n)
        }
        return n.inherits = eS, n.inherits(r, t), r.prototype._transform = function(t, n, r) {
            r(null, t)
        }, tF
    }());
    var tK = tu;

    function tz(t, n, r) {
        void 0 === r && (r = n, n = t, t = null), tK.Duplex.call(this, t), "function" != typeof r.read && (r = new tK.Readable(t).wrap(r)), this._writable = n, this._readable = r, this._waiting = !1;
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
    tz.prototype = Object.create(tK.Duplex.prototype, {
        constructor: {
            value: tz
        }
    }), tz.prototype._write = function(t, n, r) {
        this._writable.write(t, n, r)
    }, tz.prototype._read = function() {
        for (var t, n = 0; null !== (t = this._readable.read());) this.push(t), n++;
        0 === n && (this._waiting = !0)
    }, ({
        get exports() {
            return to
        },
        set exports(e) {
            to = e
        }
    }).exports = function(t, n, r) {
        return new tz(t, n, r)
    }, to.DuplexWrapper = tz, ea.default.PassThrough, ea.default.PassThrough, ec.o, [].slice;
    var tW, tJ, tZ, tY, tQ, tX, t$, t0 = "web-blox-css-mui",
        t1 = "web-blox-css-tss",
        t2 = "u" > typeof window && void 0 !== window.document,
        t4 = function() {
            var t = document.querySelector('meta[name="'.concat("emotion-insertion-point-ssr", '"]')),
                n = !1;
            document.head.childNodes.forEach(function(r) {
                var i, a;
                r === t ? n = !0 : n && r.nodeType === Node.ELEMENT_NODE && ((null == (i = r.getAttribute("data-emotion")) ? void 0 : i.includes("".concat(t0, "-global"))) || (null == (a = r.getAttribute("data-emotion")) ? void 0 : a.includes("".concat(t1, "-global")))) && r.remove()
            })
        },
        t3 = function(t) {
            var n = t.cache,
                r = t.children,
                i = n.muiCache,
                a = n.tssCache;
            return A.default.createElement(ed.CacheProvider, {
                value: i
            }, A.default.createElement(eh.T, {
                value: a
            }, r))
        },
        t5 = t.i(766324),
        t7 = t.i(592171),
        t8 = -1,
        t6 = function(t) {
            "hidden" === document.visibilityState && t8 > -1 && (t8 = "visibilitychange" === t.type ? t.timeStamp : 0, t9())
        },
        t9 = function() {
            removeEventListener("visibilitychange", t6, !0), removeEventListener("prerenderingchange", t6, !0)
        },
        ne = {
            passive: !0,
            capture: !0
        },
        nt = new Date,
        nn = function(t, n) {
            tY || (tY = n, tQ = t, tX = new Date, na(removeEventListener), nr())
        },
        nr = function() {
            if (tQ >= 0 && tQ < tX - nt) {
                var t = {
                    entryType: "first-input",
                    name: tY.type,
                    target: tY.target,
                    cancelable: tY.cancelable,
                    startTime: tY.timeStamp,
                    processingStart: tY.timeStamp + tQ
                };
                t$.forEach(function(n) {
                    n(t)
                }), t$ = []
            }
        },
        ni = function(t) {
            if (t.cancelable) {
                var n, r, i, a = (t.timeStamp > 1e12 ? new Date : performance.now()) - t.timeStamp;
                "pointerdown" == t.type ? (n = function() {
                    nn(a, t), i()
                }, r = function() {
                    i()
                }, i = function() {
                    removeEventListener("pointerup", n, ne), removeEventListener("pointercancel", r, ne)
                }, addEventListener("pointerup", n, ne), addEventListener("pointercancel", r, ne)) : nn(a, t)
            }
        },
        na = function(t) {
            ["mousedown", "keydown", "touchstart", "pointerdown"].forEach(function(n) {
                return t(n, ni, ne)
            })
        };
    let ns = null;
    var no = t.i(906791),
        nu = t.i(968439),
        nl = t.i(721281),
        nc = t.i(677753),
        nd = function(t, n) {
            return (nd = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(t, n) {
                t.__proto__ = n
            } || function(t, n) {
                for (var r in n) Object.prototype.hasOwnProperty.call(n, r) && (t[r] = n[r])
            })(t, n)
        };

    function nh(t, n) {
        if ("function" != typeof n && null !== n) throw TypeError("Class extends value " + String(n) + " is not a constructor or null");

        function r() {
            this.constructor = t
        }
        nd(t, n), t.prototype = null === n ? Object.create(n) : (r.prototype = n.prototype, new r)
    }

    function nf(t, n, r, i) {
        return new(r || (r = Promise))(function(a, s) {
            function o(t) {
                try {
                    l(i.next(t))
                } catch (t) {
                    s(t)
                }
            }

            function u(t) {
                try {
                    l(i.throw(t))
                } catch (t) {
                    s(t)
                }
            }

            function l(t) {
                var n;
                t.done ? a(t.value) : ((n = t.value) instanceof r ? n : new r(function(t) {
                    t(n)
                })).then(o, u)
            }
            l((i = i.apply(t, n || [])).next())
        })
    }

    function np(t, n) {
        var r, i, a, s = {
                label: 0,
                sent: function() {
                    if (1 & a[0]) throw a[1];
                    return a[1]
                },
                trys: [],
                ops: []
            },
            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return o.next = u(0), o.throw = u(1), o.return = u(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
            return this
        }), o;

        function u(u) {
            return function(l) {
                var c = [u, l];
                if (r) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, c[0] && (s = 0)), s;) try {
                    if (r = 1, i && (a = 2 & c[0] ? i.return : c[0] ? i.throw || ((a = i.return) && a.call(i), 0) : i.next) && !(a = a.call(i, c[1])).done) return a;
                    switch (i = 0, a && (c = [2 & c[0], a.value]), c[0]) {
                        case 0:
                        case 1:
                            a = c;
                            break;
                        case 4:
                            return s.label++, {
                                value: c[1],
                                done: !1
                            };
                        case 5:
                            s.label++, i = c[1], c = [0];
                            continue;
                        case 7:
                            c = s.ops.pop(), s.trys.pop();
                            continue;
                        default:
                            if (!(a = (a = s.trys).length > 0 && a[a.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                s = 0;
                                continue
                            }
                            if (3 === c[0] && (!a || c[1] > a[0] && c[1] < a[3])) {
                                s.label = c[1];
                                break
                            }
                            if (6 === c[0] && s.label < a[1]) {
                                s.label = a[1], a = c;
                                break
                            }
                            if (a && s.label < a[2]) {
                                s.label = a[2], s.ops.push(c);
                                break
                            }
                            a[2] && s.ops.pop(), s.trys.pop();
                            continue
                    }
                    c = n.call(t, s)
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

    function nv(t) {
        if (void 0 !== t) return null === t ? null : {
            LinkingPlatform: t.linkingPlatform
        }
    }

    function nm(t) {
        if (void 0 !== t) return null === t ? null : {
            pin: t.pin,
            reauthenticationToken: t.reauthenticationToken
        }
    }

    function ny(t) {
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

    function ng(t) {
        var n;
        return null == (n = t) ? n : {
            code: (0, nc.exists)(n, "Code") ? n.Code : void 0,
            message: (0, nc.exists)(n, "Message") ? n.Message : void 0
        }
    }

    function nw(t) {
        var n;
        return null == (n = t) ? n : {
            errors: (0, nc.exists)(n, "errors") ? n.errors.map(ng) : void 0,
            usernamePrefix: (0, nc.exists)(n, "usernamePrefix") ? n.usernamePrefix : void 0,
            username: (0, nc.exists)(n, "username") ? n.username : void 0,
            userId: (0, nc.exists)(n, "userId") ? n.userId : void 0,
            password: (0, nc.exists)(n, "password") ? n.password : void 0
        }
    }

    function nb(t) {
        var n;
        return null == (n = t) ? n : {
            userId: (0, nc.exists)(n, "userId") ? n.userId : void 0,
            userKey: (0, nc.exists)(n, "userKey") ? n.userKey : void 0,
            name: (0, nc.exists)(n, "name") ? n.name : void 0,
            displayName: (0, nc.exists)(n, "displayName") ? n.displayName : void 0,
            createdTime: (0, nc.exists)(n, "createdTime") ? new Date(n.createdTime) : void 0,
            updatedTime: (0, nc.exists)(n, "updatedTime") ? new Date(n.updatedTime) : void 0,
            accountCountry: (0, nc.exists)(n, "accountCountry") ? n.accountCountry : void 0
        }
    }

    function n_(t) {
        var n;
        return null == (n = t) ? n : {
            method: (0, nc.exists)(n, "method") ? n.method : void 0,
            priority: (0, nc.exists)(n, "priority") ? n.priority : void 0
        }
    }

    function nx(t) {
        if (void 0 !== t) return null === t ? null : {
            clientPublicKey: t.clientPublicKey,
            clientEpochTimestamp: t.clientEpochTimestamp,
            saiSignature: t.saiSignature,
            serverNonce: t.serverNonce
        }
    }

    function nP(t) {
        if (void 0 !== t) return null === t ? null : {
            ctype: t.ctype,
            cvalue: t.cvalue,
            password: t.password,
            userId: t.userId,
            securityQuestionSessionId: t.securityQuestionSessionId,
            securityQuestionRedemptionToken: t.securityQuestionRedemptionToken,
            secureAuthenticationIntent: nx(t.secureAuthenticationIntent),
            accountBlob: t.accountBlob,
            accountLinkParameters: nv(t.accountLinkParameters),
            captchaId: t.captchaId,
            captchaToken: t.captchaToken,
            captchaProvider: t.captchaProvider,
            challengeId: t.challengeId
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function nS(t, n) {
        var r, i;
        return null == t ? t : {
            user: (0, nc.exists)(t, "user") ? null == (r = t.user) ? r : {
                id: (0, nc.exists)(r, "id") ? r.id : void 0,
                name: (0, nc.exists)(r, "name") ? r.name : void 0,
                displayName: (0, nc.exists)(r, "displayName") ? r.displayName : void 0
            } : void 0,
            twoStepVerificationData: (0, nc.exists)(t, "twoStepVerificationData") ? null == (i = t.twoStepVerificationData) ? i : {
                mediaType: (0, nc.exists)(i, "mediaType") ? i.mediaType : void 0,
                ticket: (0, nc.exists)(i, "ticket") ? i.ticket : void 0
            } : void 0,
            identityVerificationLoginTicket: (0, nc.exists)(t, "identityVerificationLoginTicket") ? t.identityVerificationLoginTicket : void 0,
            isBanned: (0, nc.exists)(t, "isBanned") ? t.isBanned : void 0,
            accountBlob: (0, nc.exists)(t, "accountBlob") ? t.accountBlob : void 0,
            shouldUpdateEmail: (0, nc.exists)(t, "shouldUpdateEmail") ? t.shouldUpdateEmail : void 0,
            recoveryEmail: (0, nc.exists)(t, "recoveryEmail") ? t.recoveryEmail : void 0,
            passkeyRegistrationSucceeded: (0, nc.exists)(t, "passkeyRegistrationSucceeded") ? t.passkeyRegistrationSucceeded : void 0,
            shouldAutoLoginFromRecovery: (0, nc.exists)(t, "shouldAutoLoginFromRecovery") ? t.shouldAutoLoginFromRecovery : void 0,
            shouldPrompt2svRemoval: (0, nc.exists)(t, "shouldPrompt2svRemoval") ? t.shouldPrompt2svRemoval : void 0,
            shouldPromptPasskeyAddition: (0, nc.exists)(t, "shouldPromptPasskeyAddition") ? t.shouldPromptPasskeyAddition : void 0
        }
    }

    function nT(t, n) {
        return null == t ? t : {
            code: (0, nc.exists)(t, "code") ? t.code : void 0,
            message: (0, nc.exists)(t, "message") ? t.message : void 0
        }
    }

    function nR(t) {
        if (void 0 !== t) return null === t ? null : {
            translationKey: t.translationKey,
            translationNamespace: t.translationNamespace,
            translatedSourceString: t.translatedSourceString,
            parameters: t.parameters
        }
    }

    function nE(t) {
        if (void 0 !== t) return null === t ? null : {
            capturedAuditContent: void 0 === t.capturedAuditContent ? void 0 : (0, nc.mapValues)(t.capturedAuditContent, nR),
            additionalAuditContent: t.additionalAuditContent
        }
    }

    function nq(t) {
        var n;
        return null == (n = t) ? n : {
            provider: (0, nc.exists)(n, "provider") ? n.provider : void 0,
            identifier: (0, nc.exists)(n, "identifier") ? n.identifier : void 0
        }
    }

    function nC(t, n) {
        return null == t ? t : {
            didGenerateNewUsername: (0, nc.exists)(t, "didGenerateNewUsername") ? t.didGenerateNewUsername : void 0,
            suggestedUsernames: (0, nc.exists)(t, "suggestedUsernames") ? t.suggestedUsernames : void 0
        }
    }

    function nA(t) {
        var n;
        return null == (n = t) ? n : {
            nickname: (0, nc.exists)(n, "nickname") ? n.nickname : void 0
        }
    }

    function nD(t) {
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
            secureAuthenticationIntent: nx(t.secureAuthenticationIntent),
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
            accountLinkParameters: nv(t.accountLinkParameters),
            auditSystemContent: nE(t.auditSystemContent),
            captchaId: t.captchaId,
            captchaToken: t.captchaToken,
            captchaProvider: t.captchaProvider,
            challengeId: t.challengeId
        }
    }

    function nk(t, n) {
        return null == t ? t : {
            userId: (0, nc.exists)(t, "userId") ? t.userId : void 0,
            starterPlaceId: (0, nc.exists)(t, "starterPlaceId") ? t.starterPlaceId : void 0,
            returnUrl: (0, nc.exists)(t, "returnUrl") ? t.returnUrl : void 0,
            accountBlob: (0, nc.exists)(t, "accountBlob") ? t.accountBlob : void 0
        }
    }

    function nI(t, n) {
        return null == t ? t : {
            voucher: (0, nc.exists)(t, "voucher") ? t.voucher : void 0,
            gender: (0, nc.exists)(t, "gender") ? t.gender : void 0,
            userId: (0, nc.exists)(t, "userId") ? t.userId : void 0,
            displayName: (0, nc.exists)(t, "displayName") ? t.displayName : void 0,
            openId: (0, nc.exists)(t, "openId") ? t.openId : void 0
        }
    }

    function nL(t) {
        if (void 0 !== t) return null === t ? null : {
            voucher: t.voucher,
            username: t.username,
            password: t.password
        }
    }

    function nN(t, n) {
        return null == t ? t : {
            loginPage: (0, nc.exists)(t, "loginPage") ? t.loginPage : void 0,
            realNameVerificationUrl: (0, nc.exists)(t, "realNameVerificationUrl") ? t.realNameVerificationUrl : void 0,
            isLinkingEnabled: (0, nc.exists)(t, "isLinkingEnabled") ? t.isLinkingEnabled : void 0
        }
    }

    function nM(t) {
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

    function nO(t) {
        if (void 0 !== t) return null === t ? null : {
            code: t.code,
            state: t.state,
            appType: t.appType,
            channelId: t.channelId
        }
    }

    function nj(t) {
        if (void 0 !== t) return null === t ? null : {
            voucher: t.voucher,
            username: t.username,
            ticket: t.ticket,
            code: t.code
        }
    }

    function nF(t, n) {
        return null == t ? t : {
            code: (0, nc.exists)(t, "code") ? t.code : void 0,
            message: (0, nc.exists)(t, "message") ? t.message : void 0
        }
    }

    function nB(t) {
        var n;
        return null == (n = t) ? n : {
            id: (0, nc.exists)(n, "Id") ? n.Id : void 0,
            userId: (0, nc.exists)(n, "UserId") ? n.UserId : void 0,
            username: (0, nc.exists)(n, "Username") ? n.Username : void 0
        }
    }

    function nU(t, n) {
        return null == t ? t : {
            success: (0, nc.exists)(t, "success") ? t.success : void 0
        }
    }(function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        nh(n, t), n.prototype.v1AccountCreationMetadataGetRaw = function(t) {
            return nf(this, void 0, void 0, function() {
                var n, r, i;
                return np(this, function(a) {
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
                            return i = a.sent(), [2, new nc.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    isEligibleForALSignup: (0, nc.exists)(t, "isEligibleForALSignup") ? t.isEligibleForALSignup : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1AccountCreationMetadataGet = function(t) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(n) {
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
    })(nc.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        nh(n, t), n.prototype.v1AccountPinDeleteRaw = function(t, n) {
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/account/pin",
                                schemaPath: "/v1/account/pin",
                                method: "DELETE",
                                headers: i,
                                query: r,
                                body: nm(t.requestBody)
                            }, n)];
                        case 1:
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return nU(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1AccountPinDelete = function() {
            return nf(this, arguments, void 0, function(t, n) {
                return void 0 === t && (t = {}), np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var n, r, i;
                return np(this, function(a) {
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
                            return i = a.sent(), [2, new nc.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    isEnabled: (0, nc.exists)(t, "isEnabled") ? t.isEnabled : void 0,
                                    unlockedUntil: (0, nc.exists)(t, "unlockedUntil") ? t.unlockedUntil : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1AccountPinGet = function(t) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(n) {
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
            return nf(this, void 0, void 0, function() {
                var n, r, i;
                return np(this, function(a) {
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
                            return i = a.sent(), [2, new nc.JSONApiResponse(i, function(t) {
                                return nU(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1AccountPinLockPost = function(t) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(n) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.requestBody || void 0 === t.requestBody) throw new nc.RequiredError("requestBody", "Required parameter requestParameters.requestBody was null or undefined when calling v1AccountPinPatch.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/account/pin",
                                schemaPath: "/v1/account/pin",
                                method: "PATCH",
                                headers: i,
                                query: r,
                                body: nm(t.requestBody)
                            }, n)];
                        case 1:
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return nU(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1AccountPinPatch = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.requestBody || void 0 === t.requestBody) throw new nc.RequiredError("requestBody", "Required parameter requestParameters.requestBody was null or undefined when calling v1AccountPinPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/account/pin",
                                schemaPath: "/v1/account/pin",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: nm(t.requestBody)
                            }, n)];
                        case 1:
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return nU(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1AccountPinPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.requestBody || void 0 === t.requestBody) throw new nc.RequiredError("requestBody", "Required parameter requestParameters.requestBody was null or undefined when calling v1AccountPinUnlockPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/account/pin/unlock",
                                schemaPath: "/v1/account/pin/unlock",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: nm(t.requestBody)
                            }, n)];
                        case 1:
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    unlockedUntil: (0, nc.exists)(t, "unlockedUntil") ? t.unlockedUntil : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1AccountPinUnlockPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
    }(nc.BaseAPI);
    var nG = function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        return nh(n, t), n.prototype.v1AuthMetadataGetRaw = function(t) {
            return nf(this, void 0, void 0, function() {
                var n, r, i;
                return np(this, function(a) {
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
                            return i = a.sent(), [2, new nc.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    cookieLawNoticeTimeout: (0, nc.exists)(t, "cookieLawNoticeTimeout") ? t.cookieLawNoticeTimeout : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1AuthMetadataGet = function(t) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(n) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1LoginLinkedPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/login/linked",
                                schemaPath: "/v1/login/linked",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: nP(t.request)
                            }, n)];
                        case 1:
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return nS(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1LoginLinkedPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1LoginPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/login",
                                schemaPath: "/v1/login",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: nP(t.request)
                            }, n)];
                        case 1:
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return nS(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1LoginPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var n, r, i;
                return np(this, function(a) {
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
                            return i = a.sent(), [2, new nc.JSONApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1LogoutPost = function(t) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(n) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1LogoutfromallsessionsandreauthenticatePost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/logoutfromallsessionsandreauthenticate",
                                schemaPath: "/v1/logoutfromallsessionsandreauthenticate",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        SecureAuthenticationIntent: nx(t.secureAuthenticationIntent)
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = s.sent(), [2, new nc.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1LogoutfromallsessionsandreauthenticatePost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var n, r, i;
                return np(this, function(a) {
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
                            return i = a.sent(), [2, new nc.JSONApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1SessionRefreshPost = function(t) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(n) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.userId || void 0 === t.userId) throw new nc.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling v1UsersUserIdImpersonatePost.");
                            return r = {}, i = {}, [4, this.request({
                                path: "/v1/users/{userId}/impersonate".replace("{".concat("userId", "}"), encodeURIComponent(String(t.userId))),
                                schemaPath: "/v1/users/{userId}/impersonate",
                                method: "POST",
                                headers: i,
                                query: r
                            }, n)];
                        case 1:
                            return a = s.sent(), [2, new nc.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1UsersUserIdImpersonatePost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
    }(nc.BaseAPI);
    (function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        nh(n, t), n.prototype.v1AuthenticationTicketPostRaw = function(t, n) {
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1AuthenticationTicketPost.");
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
                            return a = s.sent(), [2, new nc.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1AuthenticationTicketPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.rBXAuthenticationNegotiation || void 0 === t.rBXAuthenticationNegotiation) throw new nc.RequiredError("rBXAuthenticationNegotiation", "Required parameter requestParameters.rBXAuthenticationNegotiation was null or undefined when calling v1AuthenticationTicketRedeemPost.");
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1AuthenticationTicketRedeemPost.");
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
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    accountBlob: (0, nc.exists)(t, "accountBlob") ? t.accountBlob : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1AuthenticationTicketRedeemPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1AuthenticationTicketRetrieveUserPost.");
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
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    userId: (0, nc.exists)(t, "UserId") ? t.UserId : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1AuthenticationTicketRetrieveUserPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var n, r, i;
                return np(this, function(a) {
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
                            return i = a.sent(), [2, new nc.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    clientAssertion: (0, nc.exists)(t, "clientAssertion") ? t.clientAssertion : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1ClientAssertionGet = function(t) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(n) {
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
    })(nc.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        nh(n, t), n.prototype.v1ExternalAccessPostRaw = function(t, n) {
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1ExternalAccessPost.");
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
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    placeId: (0, nc.exists)(t, "placeId") ? t.placeId : void 0,
                                    isolationContext: (0, nc.exists)(t, "isolationContext") ? t.isolationContext : void 0,
                                    launchData: (0, nc.exists)(t, "launchData") ? t.launchData : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1ExternalAccessPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.identityProviderId || void 0 === t.identityProviderId) throw new nc.RequiredError("identityProviderId", "Required parameter requestParameters.identityProviderId was null or undefined when calling v1ExternalIdentityProviderIdSsoOauthCallbackGet.");
                            if (null === t.code || void 0 === t.code) throw new nc.RequiredError("code", "Required parameter requestParameters.code was null or undefined when calling v1ExternalIdentityProviderIdSsoOauthCallbackGet.");
                            if (null === t.state || void 0 === t.state) throw new nc.RequiredError("state", "Required parameter requestParameters.state was null or undefined when calling v1ExternalIdentityProviderIdSsoOauthCallbackGet.");
                            return r = {}, void 0 !== t.code && (r.code = t.code), void 0 !== t.state && (r.state = t.state), i = {}, [4, this.request({
                                path: "/v1/external/{identityProviderId}/sso/oauth/callback".replace("{".concat("identityProviderId", "}"), encodeURIComponent(String(t.identityProviderId))),
                                schemaPath: "/v1/external/{identityProviderId}/sso/oauth/callback",
                                method: "GET",
                                headers: i,
                                query: r
                            }, n)];
                        case 1:
                            return a = s.sent(), [2, new nc.VoidApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1ExternalIdentityProviderIdSsoOauthCallbackGet = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1ExternalIdentityProviderIdSsoOauthCallbackGetRaw(t, n)];
                        case 1:
                            return r.sent(), [2]
                    }
                })
            })
        }, n.prototype.v1ExternalIdentityProviderIdSsoOauthInitGetRaw = function(t, n) {
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.identityProviderId || void 0 === t.identityProviderId) throw new nc.RequiredError("identityProviderId", "Required parameter requestParameters.identityProviderId was null or undefined when calling v1ExternalIdentityProviderIdSsoOauthInitGet.");
                            return r = {}, i = {}, [4, this.request({
                                path: "/v1/external/{identityProviderId}/sso/oauth/init".replace("{".concat("identityProviderId", "}"), encodeURIComponent(String(t.identityProviderId))),
                                schemaPath: "/v1/external/{identityProviderId}/sso/oauth/init",
                                method: "GET",
                                headers: i,
                                query: r
                            }, n)];
                        case 1:
                            return a = s.sent(), [2, new nc.VoidApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1ExternalIdentityProviderIdSsoOauthInitGet = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1ExternalIdentityProviderIdSsoOauthInitGetRaw(t, n)];
                        case 1:
                            return r.sent(), [2]
                    }
                })
            })
        }, n.prototype.v1ExternalIdentityProviderIdSsoSamlAssertionConsumerServicePostRaw = function(t, n) {
            return nf(this, void 0, void 0, function() {
                var r, i, a, s;
                return np(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === t.identityProviderId || void 0 === t.identityProviderId) throw new nc.RequiredError("identityProviderId", "Required parameter requestParameters.identityProviderId was null or undefined when calling v1ExternalIdentityProviderIdSsoSamlAssertionConsumerServicePost.");
                            return r = {}, i = {}, (0, nc.canConsumeForm)([{
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
                            return s = o.sent(), [2, new nc.VoidApiResponse(s)]
                    }
                })
            })
        }, n.prototype.v1ExternalIdentityProviderIdSsoSamlAssertionConsumerServicePost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1ExternalIdentityProviderIdSsoSamlAssertionConsumerServicePostRaw(t, n)];
                        case 1:
                            return r.sent(), [2]
                    }
                })
            })
        }, n.prototype.v1ExternalLoginAndLinkPostRaw = function(t, n) {
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1ExternalLoginAndLinkPost.");
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
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return nS(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1ExternalLoginAndLinkPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1ExternalLoginPost.");
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
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    success: (0, nc.exists)(t, "success") ? t.success : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1ExternalLoginPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1ExternalSignupPost.");
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
                            return a = s.sent(), [2, new nc.VoidApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1ExternalSignupPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1ExternalSignupPostRaw(t, n)];
                        case 1:
                            return r.sent(), [2]
                    }
                })
            })
        }, n.prototype.v1ExternalUnlinkPostRaw = function(t, n) {
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1ExternalUnlinkPost.");
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
                            return a = s.sent(), [2, new nc.VoidApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1ExternalUnlinkPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1ExternalUnlinkPostRaw(t, n)];
                        case 1:
                            return r.sent(), [2]
                    }
                })
            })
        }
    }(nc.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        nh(n, t), n.prototype.v1IdentityInitializeLoginPostRaw = function(t, n) {
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.initializeLoginRequest || void 0 === t.initializeLoginRequest) throw new nc.RequiredError("initializeLoginRequest", "Required parameter requestParameters.initializeLoginRequest was null or undefined when calling v1IdentityInitializeLoginPost.");
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
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    loginMethods: (0, nc.exists)(t, "loginMethods") ? t.loginMethods.map(n_) : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1IdentityInitializeLoginPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
    }(nc.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        nh(n, t), n.prototype.v1IdentityVerificationLoginPostRaw = function(t, n) {
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1IdentityVerificationLoginPost.");
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
                            return a = s.sent(), [2, new nc.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1IdentityVerificationLoginPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
    }(nc.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        nh(n, t), n.prototype.v1MetadataGetRaw = function(t) {
            return nf(this, void 0, void 0, function() {
                var n, r, i;
                return np(this, function(a) {
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
                            return i = a.sent(), [2, new nc.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    isUpdateUsernameEnabled: (0, nc.exists)(t, "isUpdateUsernameEnabled") ? t.isUpdateUsernameEnabled : void 0,
                                    ftuxAvatarAssetMap: (0, nc.exists)(t, "ftuxAvatarAssetMap") ? t.ftuxAvatarAssetMap : void 0,
                                    isEmailUpsellAtLogoutEnabled: (0, nc.exists)(t, "IsEmailUpsellAtLogoutEnabled") ? t.IsEmailUpsellAtLogoutEnabled : void 0,
                                    shouldFetchEmailUpsellIXPValuesAtLogout: (0, nc.exists)(t, "ShouldFetchEmailUpsellIXPValuesAtLogout") ? t.ShouldFetchEmailUpsellIXPValuesAtLogout : void 0,
                                    isAccountRecoveryPromptEnabled: (0, nc.exists)(t, "IsAccountRecoveryPromptEnabled") ? t.IsAccountRecoveryPromptEnabled : void 0,
                                    isContactMethodRequiredAtSignup: (0, nc.exists)(t, "IsContactMethodRequiredAtSignup") ? t.IsContactMethodRequiredAtSignup : void 0,
                                    isUserAgreementsSignupIntegrationEnabled: (0, nc.exists)(t, "IsUserAgreementsSignupIntegrationEnabled") ? t.IsUserAgreementsSignupIntegrationEnabled : void 0,
                                    isPasswordRequiredForUsernameChange: (0, nc.exists)(t, "IsPasswordRequiredForUsernameChange") ? t.IsPasswordRequiredForUsernameChange : void 0,
                                    isPasskeyFeatureEnabled: (0, nc.exists)(t, "IsPasskeyFeatureEnabled") ? t.IsPasskeyFeatureEnabled : void 0,
                                    isAltBrowserTracker: (0, nc.exists)(t, "IsAltBrowserTracker") ? t.IsAltBrowserTracker : void 0,
                                    isLoginRedirectPageEnabled: (0, nc.exists)(t, "IsLoginRedirectPageEnabled") ? t.IsLoginRedirectPageEnabled : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1MetadataGet = function(t) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(n) {
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
    }(nc.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        nh(n, t), n.prototype.v1PalisadesLiveConnectPostRaw = function(t, n) {
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PalisadesLiveConnectPost.");
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
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return nS(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1PalisadesLiveConnectPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var n, r, i;
                return np(this, function(a) {
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
                            return i = a.sent(), [2, new nc.JSONApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1PalisadesLiveDisconnectPost = function(t) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(n) {
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
            return nf(this, void 0, void 0, function() {
                var n, r, i;
                return np(this, function(a) {
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
                            return i = a.sent(), this.isJsonMime(i.headers.get("content-type")) ? [2, new nc.JSONApiResponse(i)] : [2, new nc.TextApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1PalisadesLiveIsLiveGet = function(t) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(n) {
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
            return nf(this, void 0, void 0, function() {
                var n, r, i;
                return np(this, function(a) {
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
                            return i = a.sent(), this.isJsonMime(i.headers.get("content-type")) ? [2, new nc.JSONApiResponse(i)] : [2, new nc.TextApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1PalisadesLiveLoginPost = function(t) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(n) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PalisadesLiveSignupPost.");
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
                                        auditSystemContent: nE(t.auditSystemContent)
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = s.sent(), this.isJsonMime(a.headers.get("content-type")) ? [2, new nc.JSONApiResponse(a)] : [2, new nc.TextApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1PalisadesLiveSignupPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
    }(nc.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        nh(n, t), n.prototype.v1PasskeyDeleteCredentialBatchPostRaw = function(t, n) {
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PasskeyDeleteCredentialBatchPost.");
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
                            return a = s.sent(), [2, new nc.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1PasskeyDeleteCredentialBatchPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PasskeyFinishArPreauthRegistrationPost.");
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
                            return a = s.sent(), [2, new nc.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1PasskeyFinishArPreauthRegistrationPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PasskeyFinishPreauthRegistrationPost.");
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
                            return a = s.sent(), [2, new nc.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1PasskeyFinishPreauthRegistrationPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PasskeyFinishRegistrationPost.");
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
                            return a = s.sent(), [2, new nc.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1PasskeyFinishRegistrationPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PasskeyListCredentialsPost.");
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
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    credentials: (0, nc.exists)(t, "credentials") ? t.credentials.map(nA) : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1PasskeyListCredentialsPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PasskeyStartAuthenticationByUserPost.");
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
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    authenticationOptions: (0, nc.exists)(t, "authenticationOptions") ? t.authenticationOptions : void 0,
                                    sessionId: (0, nc.exists)(t, "sessionId") ? t.sessionId : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1PasskeyStartAuthenticationByUserPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var n, r, i;
                return np(this, function(a) {
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
                            return i = a.sent(), [2, new nc.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    authenticationOptions: (0, nc.exists)(t, "authenticationOptions") ? t.authenticationOptions : void 0,
                                    sessionId: (0, nc.exists)(t, "sessionId") ? t.sessionId : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1PasskeyStartAuthenticationPost = function(t) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(n) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PasskeyStartPreauthRegistrationPost.");
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
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    creationOptions: (0, nc.exists)(t, "creationOptions") ? t.creationOptions : void 0,
                                    sessionId: (0, nc.exists)(t, "sessionId") ? t.sessionId : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1PasskeyStartPreauthRegistrationPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PasskeyStartRegistrationPost.");
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
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    creationOptions: (0, nc.exists)(t, "creationOptions") ? t.creationOptions : void 0,
                                    sessionId: (0, nc.exists)(t, "sessionId") ? t.sessionId : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1PasskeyStartRegistrationPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var n, r, i;
                return np(this, function(a) {
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
                            return i = a.sent(), [2, new nc.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    suEligibility: (0, nc.exists)(t, "suEligibility") ? t.suEligibility : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1PasskeySuEligibilityGet = function(t) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(n) {
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
    }(nc.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        nh(n, t), n.prototype.v1UserPasswordsChangePostRaw = function(t, n) {
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1UserPasswordsChangePost.");
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
                                        secureAuthenticationIntent: nx(t.secureAuthenticationIntent)
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = s.sent(), [2, new nc.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1UserPasswordsChangePost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
    }(nc.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        nh(n, t), n.prototype.v1PasswordsValidateGetRaw = function(t, n) {
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.username || void 0 === t.username) throw new nc.RequiredError("username", "Required parameter requestParameters.username was null or undefined when calling v1PasswordsValidateGet.");
                            if (null === t.password || void 0 === t.password) throw new nc.RequiredError("password", "Required parameter requestParameters.password was null or undefined when calling v1PasswordsValidateGet.");
                            return r = {}, void 0 !== t.username && (r.Username = t.username), void 0 !== t.password && (r.Password = t.password), i = {}, [4, this.request({
                                path: "/v1/passwords/validate",
                                schemaPath: "/v1/passwords/validate",
                                method: "GET",
                                headers: i,
                                query: r
                            }, n)];
                        case 1:
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return nT(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1PasswordsValidateGet = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1PasswordsValidatePost.");
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
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return nT(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1PasswordsValidatePost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
    }(nc.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        nh(n, t), n.prototype.v1QqCallbackPostRaw = function(t, n) {
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1QqCallbackPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/qq/callback",
                                schemaPath: "/v1/qq/callback",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: nO(t.request)
                            }, n)];
                        case 1:
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return nI(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1QqCallbackPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1QqConnectPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/qq/connect",
                                schemaPath: "/v1/qq/connect",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: nL(t.request)
                            }, n)];
                        case 1:
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return nS(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1QqConnectPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return r = {}, void 0 !== t.apiKey && (r.apiKey = t.apiKey), void 0 !== t.getIdentifier && (r.getIdentifier = t.getIdentifier), void 0 !== t.appType && (r.appType = t.appType), i = {}, [4, this.request({
                                path: "/v1/qq/metadata",
                                schemaPath: "/v1/qq/metadata",
                                method: "GET",
                                headers: i,
                                query: r
                            }, n)];
                        case 1:
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return nN(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1QqMetadataGet = function() {
            return nf(this, arguments, void 0, function(t, n) {
                return void 0 === t && (t = {}), np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1QqSignupwithoutpasswordPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/qq/signupwithoutpassword",
                                schemaPath: "/v1/qq/signupwithoutpassword",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: nM(t.request)
                            }, n)];
                        case 1:
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return nk(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1QqSignupwithoutpasswordPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1QqTokenAuthenticationPost.");
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
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return nI(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1QqTokenAuthenticationPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1QqVerifyConnectPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/qq/verify-connect",
                                schemaPath: "/v1/qq/verify-connect",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: nj(t.request)
                            }, n)];
                        case 1:
                            return a = s.sent(), [2, new nc.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1QqVerifyConnectPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
    }(nc.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        nh(n, t), n.prototype.v1RecoveryMetadataGetRaw = function(t) {
            return nf(this, void 0, void 0, function() {
                var n, r, i;
                return np(this, function(a) {
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
                            return i = a.sent(), [2, new nc.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    isOnPhone: (0, nc.exists)(t, "isOnPhone") ? t.isOnPhone : void 0,
                                    codeLength: (0, nc.exists)(t, "codeLength") ? t.codeLength : void 0,
                                    isPhoneFeatureEnabledForUsername: (0, nc.exists)(t, "isPhoneFeatureEnabledForUsername") ? t.isPhoneFeatureEnabledForUsername : void 0,
                                    isPhoneFeatureEnabledForPassword: (0, nc.exists)(t, "isPhoneFeatureEnabledForPassword") ? t.isPhoneFeatureEnabledForPassword : void 0,
                                    isBedev2CaptchaEnabledForPasswordReset: (0, nc.exists)(t, "isBedev2CaptchaEnabledForPasswordReset") ? t.isBedev2CaptchaEnabledForPasswordReset : void 0,
                                    isUsernameRecoveryDeprecated: (0, nc.exists)(t, "isUsernameRecoveryDeprecated") ? t.isUsernameRecoveryDeprecated : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1RecoveryMetadataGet = function(t) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(n) {
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
    }(nc.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        nh(n, t), n.prototype.v1RevertAccountGetRaw = function(t, n) {
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.ticket || void 0 === t.ticket) throw new nc.RequiredError("ticket", "Required parameter requestParameters.ticket was null or undefined when calling v1RevertAccountGet.");
                            return r = {}, void 0 !== t.ticket && (r.ticket = t.ticket), i = {}, [4, this.request({
                                path: "/v1/revert/account",
                                schemaPath: "/v1/revert/account",
                                method: "GET",
                                headers: i,
                                query: r
                            }, n)];
                        case 1:
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    isTwoStepVerificationEnabled: (0, nc.exists)(t, "isTwoStepVerificationEnabled") ? t.isTwoStepVerificationEnabled : void 0,
                                    isEmailVerified: (0, nc.exists)(t, "isEmailVerified") ? t.isEmailVerified : void 0,
                                    isEmailChanged: (0, nc.exists)(t, "isEmailChanged") ? t.isEmailChanged : void 0,
                                    isPhoneVerified: (0, nc.exists)(t, "isPhoneVerified") ? t.isPhoneVerified : void 0,
                                    userId: (0, nc.exists)(t, "userId") ? t.userId : void 0,
                                    username: (0, nc.exists)(t, "username") ? t.username : void 0,
                                    ticket: (0, nc.exists)(t, "ticket") ? t.ticket : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1RevertAccountGet = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1RevertAccountPost.");
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
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return nS(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1RevertAccountPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var n, r, i;
                return np(this, function(a) {
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
                            return i = a.sent(), [2, new nc.JSONApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1RevertInvalidateTicketsPost = function(t) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(n) {
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
    }(nc.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        nh(n, t), n.prototype.v1SignupLinkedPostRaw = function(t, n) {
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1SignupLinkedPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/signup/linked",
                                schemaPath: "/v1/signup/linked",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: nD(t.request)
                            }, n)];
                        case 1:
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return nk(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1SignupLinkedPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1SignupPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/signup",
                                schemaPath: "/v1/signup",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: nD(t.request)
                            }, n)];
                        case 1:
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return nk(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1SignupPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
    }(nc.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        nh(n, t), n.prototype.v1SocialConnectedProvidersGetRaw = function(t) {
            return nf(this, void 0, void 0, function() {
                var n, r, i;
                return np(this, function(a) {
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
                            return i = a.sent(), [2, new nc.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    providers: (0, nc.exists)(t, "providers") ? t.providers.map(nq) : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1SocialConnectedProvidersGet = function(t) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(n) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.provider || void 0 === t.provider) throw new nc.RequiredError("provider", "Required parameter requestParameters.provider was null or undefined when calling v1SocialProviderDisconnectPost.");
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1SocialProviderDisconnectPost.");
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
                            return a = s.sent(), [2, new nc.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1SocialProviderDisconnectPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
    }(nc.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        nh(n, t), n.prototype.v1TestUserAuthenticateApiKeyPostRaw = function(t, n) {
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1TestUserAuthenticateApiKeyPost.");
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
                            return a = s.sent(), [2, new nc.VoidApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1TestUserAuthenticateApiKeyPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.v1TestUserAuthenticateApiKeyPostRaw(t, n)];
                        case 1:
                            return r.sent(), [2]
                    }
                })
            })
        }, n.prototype.v1TestUserCreateBatchPostRaw = function(t, n) {
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1TestUserCreateBatchPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/test-user/create-batch",
                                schemaPath: "/v1/test-user/create-batch",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(t) {
                                    if (void 0 !== t) return null === t ? null : {
                                        createTestUserRequests: void 0 === t.createTestUserRequests ? void 0 : t.createTestUserRequests.map(ny)
                                    }
                                }(t.request)
                            }, n)];
                        case 1:
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    createTestUserResponses: (0, nc.exists)(t, "createTestUserResponses") ? t.createTestUserResponses.map(nw) : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1TestUserCreateBatchPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1TestUserExemptionAddPost.");
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
                            return a = s.sent(), [2, new nc.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1TestUserExemptionAddPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.testUserId || void 0 === t.testUserId) throw new nc.RequiredError("testUserId", "Required parameter requestParameters.testUserId was null or undefined when calling v1TestUserExemptionListGet.");
                            return r = {}, void 0 !== t.testUserId && (r.testUserId = t.testUserId), i = {}, [4, this.request({
                                path: "/v1/test-user/exemption/list",
                                schemaPath: "/v1/test-user/exemption/list",
                                method: "GET",
                                headers: i,
                                query: r
                            }, n)];
                        case 1:
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    exemptions: (0, nc.exists)(t, "exemptions") ? t.exemptions : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1TestUserExemptionListGet = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1TestUserExemptionRemovePost.");
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
                            return a = s.sent(), [2, new nc.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1TestUserExemptionRemovePost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var n, r, i;
                return np(this, function(a) {
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
                            return i = a.sent(), [2, new nc.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    testUsers: (0, nc.exists)(t, "testUsers") ? t.testUsers.map(nb) : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1TestUserListGet = function(t) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(n) {
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
            return nf(this, void 0, void 0, function() {
                var n, r, i;
                return np(this, function(a) {
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
                            return i = a.sent(), [2, new nc.JSONApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1TestUserLogoutManagerPost = function(t) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(n) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1TestUserValidateManagerPost.");
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
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    managerExternalIdentifier: (0, nc.exists)(t, "managerExternalIdentifier") ? t.managerExternalIdentifier : void 0,
                                    sessionExpirationDate: (0, nc.exists)(t, "sessionExpirationDate") ? new Date(t.sessionExpirationDate) : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1TestUserValidateManagerPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
    }(nc.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        nh(n, t), n.prototype.v1UsernameChangePriceGetRaw = function(t) {
            return nf(this, void 0, void 0, function() {
                var n, r, i;
                return np(this, function(a) {
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
                            return i = a.sent(), [2, new nc.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    priceInRobux: (0, nc.exists)(t, "priceInRobux") ? t.priceInRobux : void 0,
                                    basePriceInRobux: (0, nc.exists)(t, "basePriceInRobux") ? t.basePriceInRobux : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1UsernameChangePriceGet = function(t) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(n) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1UsernamePost.");
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
                            return a = s.sent(), [2, new nc.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1UsernamePost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
    }(nc.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        nh(n, t), n.prototype.v1UsernamesGetRaw = function(t, n) {
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.username || void 0 === t.username) throw new nc.RequiredError("username", "Required parameter requestParameters.username was null or undefined when calling v1UsernamesGet.");
                            return r = {}, void 0 !== t.username && (r.username = t.username), i = {}, [4, this.request({
                                path: "/v1/usernames",
                                schemaPath: "/v1/usernames",
                                method: "GET",
                                headers: i,
                                query: r
                            }, n)];
                        case 1:
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    usernames: (0, nc.exists)(t, "usernames") ? t.usernames : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1UsernamesGet = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1UsernamesRecoverPost.");
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
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    transmissionType: (0, nc.exists)(t, "transmissionType") ? t.transmissionType : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1UsernamesRecoverPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.username || void 0 === t.username) throw new nc.RequiredError("username", "Required parameter requestParameters.username was null or undefined when calling v1UsernamesValidateGet.");
                            if (null === t.birthday || void 0 === t.birthday) throw new nc.RequiredError("birthday", "Required parameter requestParameters.birthday was null or undefined when calling v1UsernamesValidateGet.");
                            if (null === t.context || void 0 === t.context) throw new nc.RequiredError("context", "Required parameter requestParameters.context was null or undefined when calling v1UsernamesValidateGet.");
                            return r = {}, void 0 !== t.username && (r.Username = t.username), void 0 !== t.birthday && (r.Birthday = t.birthday.toISOString()), void 0 !== t.context && (r.Context = t.context), i = {}, [4, this.request({
                                path: "/v1/usernames/validate",
                                schemaPath: "/v1/usernames/validate",
                                method: "GET",
                                headers: i,
                                query: r
                            }, n)];
                        case 1:
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return nF(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1UsernamesValidateGet = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1UsernamesValidatePost.");
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
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return nF(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1UsernamesValidatePost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
    }(nc.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        nh(n, t), n.prototype.v1ValidatorsEmailGetRaw = function(t, n) {
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.email || void 0 === t.email) throw new nc.RequiredError("email", "Required parameter requestParameters.email was null or undefined when calling v1ValidatorsEmailGet.");
                            return r = {}, void 0 !== t.email && (r.Email = t.email), i = {}, [4, this.request({
                                path: "/v1/validators/email",
                                schemaPath: "/v1/validators/email",
                                method: "GET",
                                headers: i,
                                query: r
                            }, n)];
                        case 1:
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    isEmailValid: (0, nc.exists)(t, "isEmailValid") ? t.isEmailValid : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1ValidatorsEmailGet = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.displayName || void 0 === t.displayName) throw new nc.RequiredError("displayName", "Required parameter requestParameters.displayName was null or undefined when calling v1ValidatorsRecommendedUsernameFromDisplayNameGet.");
                            if (null === t.birthDay || void 0 === t.birthDay) throw new nc.RequiredError("birthDay", "Required parameter requestParameters.birthDay was null or undefined when calling v1ValidatorsRecommendedUsernameFromDisplayNameGet.");
                            return r = {}, void 0 !== t.displayName && (r.DisplayName = t.displayName), void 0 !== t.birthDay && (r.BirthDay = t.birthDay.toISOString()), i = {}, [4, this.request({
                                path: "/v1/validators/recommendedUsernameFromDisplayName",
                                schemaPath: "/v1/validators/recommendedUsernameFromDisplayName",
                                method: "GET",
                                headers: i,
                                query: r
                            }, n)];
                        case 1:
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return nC(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1ValidatorsRecommendedUsernameFromDisplayNameGet = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.requestBody || void 0 === t.requestBody) throw new nc.RequiredError("requestBody", "Required parameter requestParameters.requestBody was null or undefined when calling v1ValidatorsRecommendedUsernameFromDisplayNamePost.");
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
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return nC(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1ValidatorsRecommendedUsernameFromDisplayNamePost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.username || void 0 === t.username) throw new nc.RequiredError("username", "Required parameter requestParameters.username was null or undefined when calling v1ValidatorsUsernameGet.");
                            if (null === t.birthDay || void 0 === t.birthDay) throw new nc.RequiredError("birthDay", "Required parameter requestParameters.birthDay was null or undefined when calling v1ValidatorsUsernameGet.");
                            return r = {}, void 0 !== t.username && (r.Username = t.username), void 0 !== t.birthDay && (r.BirthDay = t.birthDay.toISOString()), i = {}, [4, this.request({
                                path: "/v1/validators/username",
                                schemaPath: "/v1/validators/username",
                                method: "GET",
                                headers: i,
                                query: r
                            }, n)];
                        case 1:
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return nC(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1ValidatorsUsernameGet = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.requestBody || void 0 === t.requestBody) throw new nc.RequiredError("requestBody", "Required parameter requestParameters.requestBody was null or undefined when calling v1ValidatorsUsernamePost.");
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
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return nC(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1ValidatorsUsernamePost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
    }(nc.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        nh(n, t), n.prototype.v1WechatCallbackPostRaw = function(t, n) {
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1WechatCallbackPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/wechat/callback",
                                schemaPath: "/v1/wechat/callback",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: nO(t.request)
                            }, n)];
                        case 1:
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return nI(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1WechatCallbackPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1WechatConnectPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/wechat/connect",
                                schemaPath: "/v1/wechat/connect",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: nL(t.request)
                            }, n)];
                        case 1:
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return nS(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1WechatConnectPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            return r = {}, void 0 !== t.apiKey && (r.apiKey = t.apiKey), void 0 !== t.getIdentifier && (r.getIdentifier = t.getIdentifier), void 0 !== t.appType && (r.appType = t.appType), i = {}, [4, this.request({
                                path: "/v1/wechat/metadata",
                                schemaPath: "/v1/wechat/metadata",
                                method: "GET",
                                headers: i,
                                query: r
                            }, n)];
                        case 1:
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return nN(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1WechatMetadataGet = function() {
            return nf(this, arguments, void 0, function(t, n) {
                return void 0 === t && (t = {}), np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1WechatMigrateLuobuRnvMappingPost.");
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
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    unionId: (0, nc.exists)(t, "unionId") ? t.unionId : void 0,
                                    username: (0, nc.exists)(t, "username") ? t.username : void 0,
                                    isSuccess: (0, nc.exists)(t, "isSuccess") ? t.isSuccess : void 0,
                                    reason: (0, nc.exists)(t, "reason") ? t.reason : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1WechatMigrateLuobuRnvMappingPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1WechatRobloxAccountCreatePost.");
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
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    userId: (0, nc.exists)(t, "userId") ? t.userId : void 0,
                                    isSuccess: (0, nc.exists)(t, "isSuccess") ? t.isSuccess : void 0,
                                    reason: (0, nc.exists)(t, "reason") ? t.reason : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1WechatRobloxAccountCreatePost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1WechatSignupwithoutpasswordPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/wechat/signupwithoutpassword",
                                schemaPath: "/v1/wechat/signupwithoutpassword",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: nM(t.request)
                            }, n)];
                        case 1:
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return nk(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1WechatSignupwithoutpasswordPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var n, r, i;
                return np(this, function(a) {
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
                            return i = a.sent(), [2, new nc.JSONApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1WechatTencentIdGet = function(t) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(n) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1WechatTokenAuthenticationPost.");
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
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return nI(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1WechatTokenAuthenticationPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1WechatVerifyConnectPost.");
                            return r = {}, (i = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/wechat/verify-connect",
                                schemaPath: "/v1/wechat/verify-connect",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: nj(t.request)
                            }, n)];
                        case 1:
                            return a = s.sent(), [2, new nc.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1WechatVerifyConnectPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
    }(nc.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        nh(n, t), n.prototype.v1XboxConnectionGetRaw = function(t) {
            return nf(this, void 0, void 0, function() {
                var n, r, i;
                return np(this, function(a) {
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
                            return i = a.sent(), [2, new nc.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    hasConnectedXboxAccount: (0, nc.exists)(t, "hasConnectedXboxAccount") ? t.hasConnectedXboxAccount : void 0,
                                    gamertag: (0, nc.exists)(t, "gamertag") ? t.gamertag : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1XboxConnectionGet = function(t) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(n) {
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
            return nf(this, void 0, void 0, function() {
                var n, r, i;
                return np(this, function(a) {
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
                            return i = a.sent(), [2, new nc.JSONApiResponse(i, function(t) {
                                return nU(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1XboxDisconnectPost = function(t) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(n) {
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
            return nf(this, void 0, void 0, function() {
                var n, r, i;
                return np(this, function(a) {
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
                            return i = a.sent(), [2, new nc.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    count: (0, nc.exists)(t, "count") ? t.count : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1XboxGetLoginConsecutiveDaysGet = function(t) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(n) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.xboxTranslateRequest || void 0 === t.xboxTranslateRequest) throw new nc.RequiredError("xboxTranslateRequest", "Required parameter requestParameters.xboxTranslateRequest was null or undefined when calling v1XboxTranslatePost.");
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
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    users: (0, nc.exists)(t, "Users") ? t.Users.map(nB) : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1XboxTranslatePost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
    }(nc.BaseAPI),
    function(t) {
        function n() {
            return null !== t && t.apply(this, arguments) || this
        }
        nh(n, t), n.prototype.v1XboxLiveAccountGetRaw = function(t) {
            return nf(this, void 0, void 0, function() {
                var n, r, i;
                return np(this, function(a) {
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
                            return i = a.sent(), [2, new nc.JSONApiResponse(i, function(t) {
                                return null == t ? t : {
                                    userId: (0, nc.exists)(t, "userId") ? t.userId : void 0,
                                    username: (0, nc.exists)(t, "username") ? t.username : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1XboxLiveAccountGet = function(t) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(n) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1XboxLiveConnectPost.");
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
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return nS(t)
                            })]
                    }
                })
            })
        }, n.prototype.v1XboxLiveConnectPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.request || void 0 === t.request) throw new nc.RequiredError("request", "Required parameter requestParameters.request was null or undefined when calling v1XboxLiveConnectVerifyPost.");
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
                            return a = s.sent(), [2, new nc.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1XboxLiveConnectVerifyPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var n, r, i;
                return np(this, function(a) {
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
                            return i = a.sent(), [2, new nc.JSONApiResponse(i)]
                    }
                })
            })
        }, n.prototype.v1XboxLiveDisconnectPost = function(t) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(n) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.xboxLoginRequest || void 0 === t.xboxLoginRequest) throw new nc.RequiredError("xboxLoginRequest", "Required parameter requestParameters.xboxLoginRequest was null or undefined when calling v1XboxLiveLoginPost.");
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
                            return a = s.sent(), [2, new nc.JSONApiResponse(a, function(t) {
                                return null == t ? t : {
                                    newDailyLogin: (0, nc.exists)(t, "newDailyLogin") ? t.newDailyLogin : void 0
                                }
                            })]
                    }
                })
            })
        }, n.prototype.v1XboxLiveLoginPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
            return nf(this, void 0, void 0, function() {
                var r, i, a;
                return np(this, function(s) {
                    switch (s.label) {
                        case 0:
                            if (null === t.signupRequest || void 0 === t.signupRequest) throw new nc.RequiredError("signupRequest", "Required parameter requestParameters.signupRequest was null or undefined when calling v1XboxLiveSignupPost.");
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
                                        auditSystemContent: nE(t.auditSystemContent)
                                    }
                                }(t.signupRequest)
                            }, n)];
                        case 1:
                            return a = s.sent(), [2, new nc.JSONApiResponse(a)]
                    }
                })
            })
        }, n.prototype.v1XboxLiveSignupPost = function(t, n) {
            return nf(this, void 0, void 0, function() {
                return np(this, function(r) {
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
    }(nc.BaseAPI);
    var nV = t.i(272593);
    new class {
        async logout() {
            await this.authenticationAPI.v1LogoutPost()
        }
        constructor() {
            (0, nl._)(this, "authenticationAPI", void 0), this.authenticationAPI = new nG((0, nV.createClientConfiguration)("auth", "bedev1"))
        }
    };
    let nH = new nG((0, nV.createClientConfiguration)("auth", "bedev1"));
    var nK = t.i(790806),
        nz = t.i(650502),
        nW = t.i(220311);
    let nJ = [nW.default.Home, nW.default.RoadMap, nW.default.AvatarAnalytics, nW.default.ShareLinkAnalytics, nW.default.StoreAnalytics, nW.default.Community, nW.default.Notifications, nW.default.Settings, nW.default.SendrNotificationPreferences, nW.default.Preferences, nW.default.Advanced, nW.default.DataCollectionSettings, nW.default.MarketplaceOnboarding, nW.default.FiatPaidAccess, nW.default.PublicPublish, nW.default.DevEx, nW.default.GameTranslation, nW.default.GameStringTranslation],
        nZ = t => {
            let {
                provider: n
            } = t, {
                locale: r
            } = (0, et.useLocalization)();
            return (0, A.useEffect)(() => {
                null != r && n.loadTranslationResources([...nJ], r)
            }, [r, n]), null
        };
    var nY = t.i(921394),
        nQ = t.i(814975);
    let nX = t => {
        let {
            children: n
        } = t, {
            user: r
        } = (0, nQ.useAuthentication)();
        return (0, p.jsx)(nY.ThemeModeProvider, {
            bedev2BaseUrl: "https://apis.roblox.com",
            currentUser: r,
            children: n
        })
    };
    var n$ = t.i(354088),
        n0 = t.i(135174);
    let n1 = t => {
        let {
            themeElement: n,
            children: r
        } = t, {
            themeMode: i
        } = (0, nY.useThemeMode)();
        return (0, A.useEffect)(() => {
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
        }, [i, n]), (0, p.jsx)(n0.UIThemeProvider, {
            theme: i,
            children: r
        })
    };
    var n2 = t.i(709337),
        n4 = t.i(512229),
        n3 = t.i(215955),
        n5 = t.i(614505),
        n7 = t.i(118413),
        n8 = t.i(479236),
        n6 = t.i(964956),
        n9 = t.i(109182),
        re = t.i(157700),
        rt = t.i(239328),
        rn = t.i(954119),
        rr = t.i(134731),
        ri = t.i(165136),
        ra = t.i(779433),
        rs = t.i(428993),
        ro = t.i(9436),
        ru = t.i(846130),
        rl = t.i(360894),
        rc = t.i(704211),
        rd = t.i(92174),
        rh = t.i(926415),
        rf = t.i(242002);
    let rp = (0, re.defineFlag)({
        namespace: "groups",
        name: "isUnifiedUiEnabled",
        defaultValue: !1
    });
    var rv = t.i(967230),
        rm = t.i(82899),
        ry = t.i(477797),
        rg = t.i(100022);
    let rw = [{
        flag: rt.freeAvatarModuleStorePageLink,
        metadata: {
            namespace: "avatar-marketplace",
            name: "freeAvatarModuleStorePageLink",
            defaultValue: "#",
            valueType: "string",
            contextType: "static"
        }
    }, {
        flag: rt.freeAvatarModuleDocsPageLink,
        metadata: {
            namespace: "avatar-marketplace",
            name: "freeAvatarModuleDocsPageLink",
            defaultValue: "#",
            valueType: "string",
            contextType: "static"
        }
    }, {
        flag: rt.enableUgcFolders,
        metadata: {
            namespace: "avatar-marketplace",
            name: "enableUGCFolders",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: rt.enableTaxonomyBasedCreatorDashboard,
        metadata: {
            namespace: "avatar-marketplace",
            name: "enableTaxonomyBasedCreatorDashboard",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: rt.enableCreatorShowcases,
        metadata: {
            namespace: "avatar-marketplace",
            name: "enableCreatorShowcases",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: rt.isAutoPublishPreferencesEnabled,
        metadata: {
            namespace: "avatar-marketplace",
            name: "isAutoPublishPreferencesEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: rn.creatorAnalytics,
        metadata: {
            namespace: "communities",
            name: "CreatorAnalytics",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "group"
        }
    }, {
        flag: rr.isAssetPrivacyOptOutSurveyEnabled,
        metadata: {
            namespace: "content-access-and-inventory",
            name: "isAssetPrivacyOptOutSurveyEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: rr.isAssetAccessRequestsEnabled,
        metadata: {
            namespace: "content-access-and-inventory",
            name: "isAssetAccessRequestsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: rr.isModelCustomThumbnailUploadEnabled,
        metadata: {
            namespace: "content-access-and-inventory",
            name: "isModelCustomThumbnailUploadEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: rr.isAssetDependenciesViewerEnabled,
        metadata: {
            namespace: "content-access-and-inventory",
            name: "isAssetDependenciesViewerEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: rr.isCreatorStoreVideoMultipartUploadEnabled,
        metadata: {
            namespace: "content-access-and-inventory",
            name: "isCreatorStoreVideoMultipartUploadEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: rr.isPricingEligibilityV2Enabled,
        metadata: {
            namespace: "content-access-and-inventory",
            name: "isPricingEligibilityV2Enabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: ri.isExperiencePreviewEnabled,
        metadata: {
            namespace: "content-licensing",
            name: "isExperiencePreviewEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: ri.enableIpPlatformLicenseRecommendations,
        metadata: {
            namespace: "content-licensing",
            name: "enableIpPlatformLicenseRecommendations",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: ri.isIpLicensingEarningsEnabled,
        metadata: {
            namespace: "content-licensing",
            name: "isIpLicensingEarningsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: ri.isImageAttachmentEnabledInLicenseApplication,
        metadata: {
            namespace: "content-licensing",
            name: "isImageAttachmentEnabledInLicenseApplication",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: ri.isShowcaseExperiencesEnabled,
        metadata: {
            namespace: "content-licensing",
            name: "isShowcaseExperiencesEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: ri.isIgnoreMatchEnabled,
        metadata: {
            namespace: "content-licensing",
            name: "isIgnoreMatchEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: ra.questionnaireV2Allowlist,
        metadata: {
            namespace: "content-suitability",
            name: "questionnaireV2Allowlist",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: ra.questionnaireV2Q1Release,
        metadata: {
            namespace: "content-suitability",
            name: "questionnaireV2Q1Release",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: n7.analyticsChartLoadEventstreamEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "analyticsChartLoadEventstreamEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: n7.isLimitedAnalyticsAdminMonitoringNavigationEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isLimitedAnalyticsAdminMonitoringNavigationEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: n7.visibleAssetIdInPersonalizationEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "visibleAssetIdInPersonalizationEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: n7.isExperienceAlertsEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isExperienceAlertsEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: n7.isOwnershipWatermarkEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isOwnershipWatermarkEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: n7.isExperimentationTemplatesEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isExperimentationTemplatesEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: n7.isExperimentTargetingEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isExperimentTargetingEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: n7.isErrorReportV2Enabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isErrorReportV2Enabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: n7.isErrorReportNewPlaceVersionLiveBannerEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isErrorReportNewPlaceVersionLiveBannerEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: n7.isErrorReportSuggestedRulesEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isErrorReportSuggestedRulesEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: n7.isFirstSeenColumnEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isFirstSeenColumnEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: n7.acquisitionMigrationMetricsEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "acquisitionMigrationMetricsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: n7.isTargetingConfigsEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isTargetingConfigsEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: n7.isExperimentNullControlValueEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isExperimentNullControlValueEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: n7.isExperimentRolloutEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isExperimentRolloutEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: n7.isGeneralBreakGlassBannerEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "IsGeneralBreakGlassBannerEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: n7.isMonetizationBreakGlassBannerEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "IsMonetizationBreakGlassBannerEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: n7.isPlayerFeedbackExampleCommentsEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isPlayerFeedbackExampleCommentsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: n7.isAnalyticsAssistantChatEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isAnalyticsAssistantChatEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: n7.isAnalyticsAssistantIssueBannerEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isAnalyticsAssistantIssueBannerEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: n7.showCreatorRewardsReportingDisclaimer,
        metadata: {
            namespace: "creator-analytics",
            name: "showCreatorRewardsReportingDisclaimer",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: n7.isRotraceMetricEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isRotraceMetricEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: n7.isTelemetryMigrationEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isTelemetryMigrationEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: n7.showVideoServiceDashboard,
        metadata: {
            namespace: "creator-analytics",
            name: "showVideoServiceDashboard",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: n7.isTreemapColorBySiblingProportionEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isTreemapColorBySiblingProportionEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: n7.isAssistantChartOverflowMenuEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isAssistantChartOverflowMenuEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: n7.isAnalyticsMetricAwareYAxisFormatterEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isAnalyticsMetricAwareYAxisFormatterEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: n7.isCustomDashboardsEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isCustomDashboardsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: n7.isCustomDashboardsLocalStorageEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isCustomDashboardsLocalStorageEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: n7.isCustomDashboardsApiBackendEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isCustomDashboardsApiBackendEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: n7.isFunnelCohortCompletionRateEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isFunnelCohortCompletionRateEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: n7.isJourneyEventsEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isJourneyEventsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: n7.isClientSessionsEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isClientSessionsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: n7.isEhdResultsEnabled,
        metadata: {
            namespace: "creator-analytics",
            name: "isEhdResultsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: n7.isEhdResultsAlwaysFetched,
        metadata: {
            namespace: "creator-analytics",
            name: "isEhdResultsAlwaysFetched",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: rs.isRevenueShareAgreementsEnabled,
        metadata: {
            namespace: "creator-business",
            name: "isRevenueShareAgreementsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: rs.enableVirtualTransactionsTab,
        metadata: {
            namespace: "creator-business",
            name: "enableVirtualTransactionsTab",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: ro.isBadgeDefaultIconEnabled,
        metadata: {
            namespace: "creator-creations",
            name: "isBadgeDefaultIconEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: ro.isMomentsUploadEnabled,
        metadata: {
            namespace: "creator-creations",
            name: "isMomentsUploadEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: ro.isMomentsSitetestUrlParsingEnabled,
        metadata: {
            namespace: "creator-creations",
            name: "isMomentsSitetestUrlParsingEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: ro.isMomentsUploadLanguageSelectEnabled,
        metadata: {
            namespace: "creator-creations",
            name: "isMomentsUploadLanguageSelectEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: ro.isMomentsFeedIdEnabled,
        metadata: {
            namespace: "creator-creations",
            name: "isMomentsFeedIdEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: ru.enablePlayerSupport,
        metadata: {
            namespace: "creator-gameops",
            name: "enablePlayerSupport",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: ru.enableExpeditedReview,
        metadata: {
            namespace: "creator-gameops",
            name: "enableExpeditedReview",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: ru.enablePlayerHostedEvents,
        metadata: {
            namespace: "creator-gameops",
            name: "enablePlayerHostedEvents",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: ru.enablePlayerSupportCreatorTicketReroute,
        metadata: {
            namespace: "creator-gameops",
            name: "enablePlayerSupportCreatorTicketReroute",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: rl.creatorRoadmapEnabled,
        metadata: {
            namespace: "creator-roadmap",
            name: "creatorRoadmapEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: rc.isCsmExtendedMetricsEnabled,
        metadata: {
            namespace: "creator-services-insights",
            name: "isCsmExtendedMetricsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: rd.shouldUseWatermarkFiatCalculation,
        metadata: {
            namespace: "devex",
            name: "shouldUseWatermarkFiatCalculation",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: rd.isTaxDocumentationEnabled,
        metadata: {
            namespace: "devex",
            name: "isTaxDocumentationEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: rh.isBandwidthNetworkTabEnabled,
        metadata: {
            namespace: "engine-networking",
            name: "isBandwidthNetworkTabEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: rf.isHomeAcquisitionSignalsEnabled,
        metadata: {
            namespace: "game-discovery-serving",
            name: "isHomeAcquisitionSignalsEnabled",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "universe"
        }
    }, {
        flag: rp,
        metadata: {
            namespace: "groups",
            name: "isUnifiedUiEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: rv.isAdsPageRedesignEnabled,
        metadata: {
            namespace: "immersive-ads",
            name: "isAdsPageRedesignEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: rm.isLeaderboardConfigsEnabled,
        metadata: {
            namespace: "leaderboards",
            name: "isLeaderboardConfigsEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: ry.mockManagedPricingSummary,
        metadata: {
            namespace: "monetization",
            name: "mockManagedPricingSummary",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: ry.mockManagedPricingEvents,
        metadata: {
            namespace: "monetization",
            name: "mockManagedPricingEvents",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: ry.mockHardCodedPrices,
        metadata: {
            namespace: "monetization",
            name: "mockHardCodedPrices",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: ry.mockManagedPricingProductWrites,
        metadata: {
            namespace: "monetization",
            name: "mockManagedPricingProductWrites",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: ry.isProductArchiveEnabled,
        metadata: {
            namespace: "monetization",
            name: "isProductArchiveEnabled",
            defaultValue: !1,
            valueType: "boolean",
            contextType: "static"
        }
    }, {
        flag: rg.enablePayoutWatermarkContributions,
        metadata: {
            namespace: "payouts",
            name: "enablePayoutWatermarkContributions",
            defaultValue: !0,
            valueType: "boolean",
            contextType: "group"
        }
    }];
    var rb = t.i(745873);
    let r_ = null,
        rx = (0, n9.default)(() => t.A(73576).then(t => {
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
        rP = () => {
            let t = (0, D.useRouter)(),
                n = (0, rb.useCurrentGroup)(),
                [r, i] = (0, A.useState)(!1);
            (0, A.useEffect)(() => {
                let t = !0;
                return async function() {
                    try {
                        null != r_ || (r_ = (0, re.initFlags)({
                            applicationId: "creator-dashboard",
                            baseUrl: "https://apis.roblox.com"
                        }).enableOverrides({
                            mode: "authorized-only",
                            useDefault: !0
                        }));
                        let n = await r_;
                        t && i(n)
                    } catch (n) {
                        t && i(!1)
                    }
                }(), () => {
                    t = !1
                }
            }, []);
            let a = (0, A.useMemo)(() => {
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
            return r ? (0, p.jsx)(rx, {
                flags: rw,
                contexts: a
            }) : null
        };
    var rS = t.i(911502);
    let rT = t => {
        let {
            providers: n,
            children: r
        } = t, i = r;
        for (let t = n.length - 1; t >= 0; t -= 1) i = A.default.cloneElement(n[t], {}, i);
        return (0, p.jsx)(p.Fragment, {
            children: i
        })
    };
    var rR = t.i(893949),
        rE = t.i(413019),
        rq = t.i(758835),
        rC = t.i(823062);
    let rA = t => {
        let {
            children: n,
            unifiedLogger: r,
            pageLoggerConfig: i
        } = t, a = null != r ? r : n3.default, {
            pathname: s
        } = (0, D.useRouter)(), o = (0, A.useMemo)(() => {
            if (s) return "".concat(window.location.origin).concat(s)
        }, [s]);
        return (0, p.jsx)(rC.UnifiedLoggerProvider, {
            unifiedLogger: a,
            pageLoggerConfig: i,
            path: o,
            children: n
        })
    };
    var rD = t.i(681559),
        rk = t.i(272749),
        rI = t.i(252842);
    let rL = ["https://vitals.vercel-insights.com/v1/vitals"];
    var rN = t.i(120654);
    let rM = t => {
        let {
            children: n
        } = t, {
            user: r
        } = (0, nQ.useAuthentication)(), i = (0, A.useRef)(window.aegis);
        (0, A.useEffect)(() => {
            i.current && i.current.setConfig({
                beforeReport: t => !(t.msg && rL.some(n => t.msg.includes(n))),
                api: {
                    retCodeHandler(t, n, r) {
                        let i = !(r.status === rI.StatusCodes.FORBIDDEN && r.headers.has("x-csrf-token") || r.status === rI.StatusCodes.OK || r.status === rI.StatusCodes.ACCEPTED),
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
        let a = (0, A.useMemo)(() => ({
            info: () => {},
            error: () => {},
            captureError: () => {},
            reportEvent: () => {}
        }), [i]);
        return (0, p.jsx)(rN.default.Provider, {
            value: a,
            children: n
        })
    };
    var rO = t.i(37819),
        rj = t.i(431346),
        rF = t.i(881670);
    let rB = "".concat("".concat("https://assets.create.roblox.com/ff33a9d50eb06f7f0f22271bdee030d668440521/assets", "/opengraph"), "/global_og_image.png"),
        rU = (0, et.withTranslation)(t => {
            let {
                openGraphMetadata: {
                    title: n,
                    description: r,
                    defaultLocale: i
                }
            } = t, {
                translate: a
            } = (0, et.useTranslation)(), s = new URL(rB, "https://create.roblox.com").href, o = (0, rj.useTheme)();
            return (0, p.jsxs)(rO.HubMeta, {
                seoTitle: a("Label.CreatorDashboard"),
                ogTitle: n,
                description: r,
                ogImage: s,
                children: [(0, p.jsx)("link", {
                    rel: "icon",
                    type: "image/svg+xml",
                    href: "https://cdn.foundation.".concat("roblox.com", "/current/roblox-tilt/favicon.svg")
                }), (0, p.jsx)("link", {
                    rel: "icon",
                    href: "https://cdn.foundation.".concat("roblox.com", "/current/roblox-tilt/favicon.ico"),
                    sizes: "48x48"
                }), (0, p.jsx)("link", {
                    rel: "apple-touch-icon",
                    sizes: "180x180",
                    href: "https://cdn.foundation.".concat("roblox.com", "/current/roblox-tilt/apple-touch-icon.png")
                }), (0, p.jsx)("meta", {
                    name: "theme-color",
                    content: o.palette.surface[0]
                }, "theme-color"), (0, p.jsx)("meta", {
                    name: "viewport",
                    content: "minimum-scale=1, initial-scale=1, width=device-width"
                }), (0, p.jsx)("meta", {
                    name: "zd-site-verification",
                    content: "8ou4bshfpgbc1pk5x0qqt"
                }), (0, p.jsx)("meta", {
                    property: "og:url",
                    content: "https://create.roblox.com"
                }, "og:url"), (0, p.jsx)("meta", {
                    property: "og:type",
                    content: "website"
                }, "og:type"), (0, p.jsx)("meta", {
                    property: "og:locale",
                    content: i
                }, "og:locale")]
            })
        }, [rF.TranslationNamespace.Features]);
    var rG = t.i(427650),
        rV = t.i(157310),
        rH = t.i(278705),
        rK = t.i(182012),
        rz = t.i(977690),
        rW = t.i(110273),
        rJ = t.i(660882),
        rZ = t.i(634851),
        rY = t.i(642729),
        rQ = t.i(734341),
        rX = t.i(685104),
        rX = rX,
        r$ = t.i(722380),
        r0 = t.i(286840),
        r1 = t.i(583555);
    t.i(427542), t.i(937793);
    var r2 = t.i(133017);
    let r4 = rQ.$constructor("ZodMiniType", (t, n) => {
            if (!t._zod) throw Error("Uninitialized schema in ZodMiniType.");
            r$.$ZodType.init(t, n), t.def = n, t.type = n.type, t.parse = (n, r) => r2.parse(t, n, r, {
                callee: t.parse
            }), t.safeParse = (n, r) => r2.safeParse(t, n, r), t.parseAsync = async (n, r) => r2.parseAsync(t, n, r, {
                callee: t.parseAsync
            }), t.safeParseAsync = async (n, r) => r2.safeParseAsync(t, n, r), t.check = function() {
                for (var r, i = arguments.length, a = Array(i), s = 0; s < i; s++) a[s] = arguments[s];
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
            }, t.with = t.check, t.clone = (n, r) => r0.clone(t, n, r), t.brand = () => t, t.register = (n, r) => (n.add(t, r), t), t.apply = n => n(t)
        }),
        r3 = rQ.$constructor("ZodMiniString", (t, n) => {
            r$.$ZodString.init(t, n), r4.init(t, n)
        });

    function r5(t) {
        return r1._string(r3, t)
    }(t, n) => {
        r$.$ZodStringFormat.init(t, n), r3.init(t, n)
    }, (t, n) => {
        r$.$ZodBigInt.init(t, n), r4.init(t, n)
    };
    let r7 = rQ.$constructor("ZodMiniUnknown", (t, n) => {
            r$.$ZodUnknown.init(t, n), r4.init(t, n)
        }),
        r8 = rQ.$constructor("ZodMiniArray", (t, n) => {
            r$.$ZodArray.init(t, n), r4.init(t, n)
        });

    function r6(t, n) {
        return new r8({
            type: "array",
            element: t,
            ...r0.normalizeParams(n)
        })
    }
    let r9 = rQ.$constructor("ZodMiniObject", (t, n) => {
        r$.$ZodObject.init(t, n), r4.init(t, n), r0.defineLazy(t, "shape", () => n.shape)
    });

    function ie(t, n) {
        return new r9({
            type: "object",
            shape: null != t ? t : {},
            ...r0.normalizeParams(n)
        })
    }
    let it = rQ.$constructor("ZodMiniUnion", (t, n) => {
            r$.$ZodUnion.init(t, n), r4.init(t, n)
        }),
        ir = rQ.$constructor("ZodMiniRecord", (t, n) => {
            r$.$ZodRecord.init(t, n), r4.init(t, n)
        }),
        ii = rQ.$constructor("ZodMiniLiteral", (t, n) => {
            r$.$ZodLiteral.init(t, n), r4.init(t, n)
        });

    function ia(t, n) {
        return new ii({
            type: "literal",
            values: Array.isArray(t) ? t : [t],
            ...r0.normalizeParams(n)
        })
    }
    let is = rQ.$constructor("ZodMiniOptional", (t, n) => {
        r$.$ZodOptional.init(t, n), r4.init(t, n)
    });

    function io(t) {
        return new is({
            type: "optional",
            innerType: t
        })
    }(t, n) => {
        r$.$ZodPipe.init(t, n), r4.init(t, n)
    };
    let iu = rQ.$constructor("ZodMiniCustom", (t, n) => {
        r$.$ZodCustom.init(t, n), r4.init(t, n)
    });

    function il(t) {
        let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
        return r1._refine(iu, t, n)
    }
    r1.describe, r1.meta;
    var ic = t.i(694257),
        id = t.i(514961),
        ih = t.i(532491),
        ip = t.i(222563),
        iv = (0, A.createContext)(void 0),
        im = t => {
            let {
                config: n,
                children: r
            } = t;
            return (0, p.jsx)(iv.Provider, {
                value: n,
                children: r
            })
        },
        iy = () => {
            let t = (0, A.useContext)(iv);
            if (!t) throw Error("useNotApprovedUIConfig must be used within a NotApprovedUIProvider");
            return t
        },
        ig = ((r = ig || {}).AccountReactivationPageRendered = "accountReactivationPageRendered", r.PageRendered = "pageRendered", r.UnmappedViolationKey = "unmappedViolationKey", r.CheckboxChecked = "checkboxChecked", r.LogoutClicked = "logoutClicked", r.ReactivateClicked = "reactivateClicked", r.ParentVerificationClicked = "parentVerificationClicked", r.EmailVerificationClicked = "emailVerificationClicked", r.TermsOfUseClicked = "termsOfUseClicked", r.AppealsProcessClicked = "appealsProcessClicked", r.CommunityGuidelineClicked = "communityGuidelineClicked", r.UGCGuidelinesClicked = "ugcGuidelinesClicked", r.AppealsPortalClicked = "appealsPortalClicked", r.ContinueClicked = "continueClicked", r.BackClicked = "backClicked", r.SecondChanceReactivateClicked = "secondChanceReactivateClicked", r.MissingTranslation = "missingTranslation", r.Error = "error", r.VerificationRedirectRendered = "verificationRedirectRendered", r.AccountReactivationRedirectRendered = "accountReactivationRedirectRendered", r),
        iw = ((i = iw || {}).NotApprovedPage = "NotApprovedPageV2", i);

    function ib() {
        let {
            sendAnalyticsEvent: t,
            platform: n,
            readOnly: r
        } = iy();
        return (0, A.useCallback)((i, a) => {
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
    var i_ = "UserSafety.NotApprovedPage.UserID",
        ix = ((a = ix || {}).Warn = "Warn", a.Delete = "Delete", a.Hour1 = "Ban 1 Hour", a.Hour6 = "Ban 6 Hours", a.Day1 = "Ban 1 Day", a.Day3 = "Ban 3 Days", a.Day7 = "Ban 7 Days", a.Day14 = "Ban 14 Days", a.Day30 = "Ban 30 Days", a.Day60 = "Ban 60 Days", a.Month6 = "Ban 6 Months", a.Year1 = "Ban 1 Year", a),
        iP = {
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
        iS = {
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
        iT = "Email";

    function iR(t, n, r) {
        if (r === iT || "VPC" === r) return !0;
        let i = new Date(n) < new Date;
        return "Warn" === t || "Delete" !== t && i
    }
    var iE = (0, A.createContext)(void 0),
        iq = t => {
            var n, r;
            let {
                pages: i,
                unmappedViolationKeys: a,
                hasEducationalPages: s,
                commutationEligibility: o,
                children: u
            } = t, [l, c] = (0, A.useState)(0), [d, h] = (0, A.useState)(!1), f = null != (n = null == (r = i[l]) ? void 0 : r.pageName) ? n : "unknown", v = i.length, m = 0 === l, y = l === v - 1, g = (0, A.useMemo)(() => {
                var t;
                return null != (t = null == o ? void 0 : o.educational_pass_eligible) && t
            }, [o]), w = (0, A.useCallback)(() => {
                l < v - 1 && (h(!0), c(t => t + 1))
            }, [l, v]), b = (0, A.useCallback)(() => {
                l > 0 && c(t => t - 1)
            }, [l]), _ = (0, A.useCallback)(() => {
                if (v <= 1 || "second-chance-intro" === f || "intro" === f) return 0;
                let t = v - 1,
                    n = l;
                return (t -= !!g, n -= !!g, t <= 0) ? 0 : Math.round(n / t * 100)
            }, [l, v, f, g]), x = (0, A.useMemo)(() => {
                var t, n, r;
                return {
                    currentPage: l,
                    currentPageName: f,
                    totalPages: v,
                    goToNextPage: w,
                    goToPreviousPage: b,
                    isFirstPage: m,
                    isLastPage: y,
                    getProgress: _,
                    hasEducationalPages: s,
                    currentPageConfigs: null != (t = null == (n = i[l]) ? void 0 : n.pageItems) ? t : [],
                    CurrentCtaComponent: null == (r = i[l]) ? void 0 : r.CtaComponent,
                    unmappedViolationKeys: a,
                    hasNavigatedForward: d
                }
            }, [l, f, v, w, b, m, y, _, i, s, a, d]);
            return (0, p.jsx)(iE.Provider, {
                value: x,
                children: u
            })
        },
        iC = () => {
            let t = (0, A.useContext)(iE);
            if (!t) throw Error("usePageNavigation must be used within PageNavigationProvider");
            return t
        },
        iA = t => {
            let {
                punishmentData: n,
                commutationEligibility: r
            } = t, {
                isFirstPage: i,
                currentPageConfigs: a,
                currentPageName: s
            } = iC(), o = a.map(t => {
                if (!t.getIsVisible(n, s, r)) return null;
                let i = t.renderComponent;
                return (0, p.jsx)("div", {
                    children: (0, p.jsx)(i, {
                        punishmentData: n
                    })
                }, t.configName)
            }).filter(Boolean);
            return (0, p.jsx)("div", {
                className: "flex flex-col ".concat(i ? "gap-xlarge" : "gap-[36px]"),
                children: o
            })
        },
        iD = () => {
            let t = iy().translate,
                {
                    onLogout: n
                } = iy(),
                r = ib(),
                [i, a] = (0, A.useState)(!1),
                s = (0, rK.useMutation)({
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
            return (0, p.jsxs)(rz.Popover, {
                children: [(0, p.jsx)(rz.PopoverTrigger, {
                    asChild: !0,
                    children: (0, p.jsx)(rZ.IconButton, {
                        icon: "icon-filled-three-dots-vertical",
                        ariaLabel: t("Label.OpenMenu"),
                        variant: "Utility",
                        size: "Medium"
                    })
                }), (0, p.jsx)(rz.PopoverContent, {
                    side: "bottom",
                    align: "end",
                    ariaLabel: t("Label.MenuContent"),
                    children: (0, p.jsx)(rW.Menu, {
                        size: "Medium",
                        children: (0, p.jsx)(rW.MenuItem, {
                            value: "one",
                            title: t("Action.LogOut"),
                            onSelect: () => {
                                s.mutate()
                            },
                            disabled: i,
                            trailing: i ? (0, p.jsx)(rJ.ProgressCircle, {
                                size: "Small",
                                ariaLabel: t("Label.LogoutProgress"),
                                variant: "Indeterminate"
                            }) : void 0
                        })
                    })
                })]
            })
        },
        ik = () => {
            let t = iy().translate,
                {
                    getProgress: n
                } = iC(),
                r = n();
            return (0, p.jsx)(rY.ProgressBar, {
                value: r,
                ariaLabel: t("Label.PageProgress"),
                style: {
                    visibility: 0 === r ? "hidden" : "visible"
                }
            })
        },
        iI = () => {
            let t = iy().translate,
                {
                    goToPreviousPage: n
                } = iC();
            return (0, p.jsx)(rZ.IconButton, {
                size: "Medium",
                variant: "Utility",
                icon: "icon-filled-chevron-large-left",
                onClick: n,
                "data-testid": "back-button",
                className: "margin-left-[-12px]",
                ariaLabel: t("Action.Back")
            })
        },
        iL = t => {
            var n;
            let {
                punishmentData: r
            } = t, {
                isFirstPage: i,
                totalPages: a
            } = iC(), {
                readOnly: s
            } = iy(), o = iy().translate, {
                punishmentTypeDescription: u,
                verificationCategory: l
            } = r, c = l ? o("Heading.Suspended") : o(null != (n = iP[u]) ? n : "") || o("Heading.Suspended");
            return i ? (0, p.jsx)("div", {
                "data-testid": "not-approved-dialog-header",
                children: (0, p.jsxs)("div", {
                    className: "flex justify-between items-center gap-medium",
                    children: [(0, p.jsxs)("div", {
                        className: "flex gap-small items-center padding-y-medium",
                        children: [(0, p.jsx)(rH.Icon, {
                            name: "Delete" === u ? "icon-regular-circle-slash" : "icon-regular-triangle-exclamation",
                            size: "Large",
                            className: "Warn" !== u || l ? "content-system-alert" : "content-system-warning"
                        }), (0, p.jsx)("span", {
                            className: "text-heading-small",
                            children: c
                        })]
                    }), !s && (0, p.jsx)(iD, {})]
                })
            }) : (0, p.jsx)("div", {
                "data-testid": "not-approved-dialog-header",
                children: (0, p.jsxs)("div", {
                    className: "flex flex-col gap-large items-start",
                    children: [(0, p.jsx)(iI, {}), a > 2 && (0, p.jsx)(ik, {})]
                })
            })
        },
        iN = t => {
            let {
                punishmentData: n,
                setIsDialogOpen: r
            } = t, {
                CurrentCtaComponent: i,
                currentPageName: a
            } = iC();
            return i ? (0, p.jsx)("div", {
                className: "flex flex-col gap-large justify-between medium:items-end",
                children: (0, p.jsx)(i, {
                    punishmentData: n,
                    setIsDialogOpen: r
                }, a)
            }) : null
        },
        iM = t => {
            let {
                readOnly: n
            } = t;
            return (0, p.jsxs)("div", {
                className: "shrink-0 flex flex-row justify-between items-center gap-medium",
                children: [(0, p.jsx)("div", {
                    className: "bg-shift-100 height-[45px] width-[300px] max-width-[85%] radius-medium"
                }), !n && (0, p.jsx)("div", {
                    className: "bg-shift-100 height-[35px] width-[35px] radius-medium shrink-0"
                })]
            })
        },
        iO = () => (0, p.jsxs)("div", {
            className: "flex flex-col gap-large",
            "data-testid": "loading-skeleton-content",
            children: [(0, p.jsx)("div", {
                className: "bg-shift-100 height-[20px] width-full max-width-[450px] radius-medium"
            }), (0, p.jsxs)("div", {
                className: "flex flex-col gap-medium",
                children: [(0, p.jsx)("div", {
                    className: "bg-shift-100 height-[30px] width-[125px] radius-medium"
                }), (0, p.jsx)("div", {
                    className: "bg-shift-100 height-[120px] width-full radius-medium"
                })]
            }), (0, p.jsxs)("div", {
                className: "flex flex-col gap-medium",
                children: [(0, p.jsx)("div", {
                    className: "bg-shift-100 height-[30px] width-[200px] radius-medium"
                }), (0, p.jsx)("div", {
                    className: "bg-shift-100 height-[160px] width-full radius-medium"
                })]
            })]
        }),
        ij = () => (0, p.jsx)("div", {
            className: "shrink-0 flex width-full justify-end medium:flex-row",
            children: (0, p.jsx)("div", {
                className: "bg-shift-100 height-[40px] width-full medium:width-[90px] radius-medium"
            })
        }),
        iF = () => {
            let {
                readOnly: t
            } = iy();
            return t ? null : (0, p.jsx)("div", {
                className: "shrink-0 flex justify-end items-center",
                children: (0, p.jsx)(iD, {})
            })
        },
        iB = t => {
            let {
                error: n
            } = t, r = iy().translate;
            return n && console.error(n), (0, p.jsx)("div", {
                className: "flex flex-col height-full min-height-0",
                children: (0, p.jsxs)("div", {
                    className: "grow-1 flex flex-col items-center justify-center gap-medium padding-xxlarge radius-medium bg-surface-100 width-full min-height-[225px]",
                    children: [(0, p.jsx)(rH.Icon, {
                        name: "icon-regular-triangle-exclamation",
                        size: "XLarge"
                    }), (0, p.jsx)("span", {
                        className: "text-body-large content-emphasis margin-none",
                        children: r("Heading.Error")
                    })]
                })
            })
        };
    rQ.config(rX.en());
    var iU = ie({
            type: ia("platform"),
            displayMeta: io(ie({
                lowercaseKey: r5().check(ic.minLength(1)),
                capitalizedKey: r5().check(ic.minLength(1)),
                icon: r5()
            })),
            elements: io(r6(r1._unknown(r7)))
        }),
        iG = new it({
            type: "union",
            options: [ie({
                type: ia("text"),
                labelKey: r5(),
                text: io(r5()),
                textKey: io(r5()),
                textKeyParameters: io((s = r5(), new ir((o = r5()) && o._zod ? {
                    type: "record",
                    keyType: s,
                    valueType: o,
                    ...r0.normalizeParams(void 0)
                } : {
                    type: "record",
                    keyType: r5(),
                    valueType: s,
                    ...r0.normalizeParams(o)
                })))
            }).check(il(t => void 0 !== t.text || void 0 !== t.textKey, {
                message: "Either 'text' or 'textKey' must be provided"
            }), il(t => !t.textKeyParameters || void 0 !== t.textKey, {
                message: "'textKeyParameters' requires 'textKey' to be provided"
            })), ie({
                type: ia("image"),
                labelKey: r5(),
                url: r5(),
                altLabelKey: io(r5())
            })],
            ...r0.normalizeParams(void 0)
        }),
        iV = t => {
            let n = iG.safeParse(t);
            return !!n.success || (console.warn("Failed to parse platform element: ", n.error), !1)
        },
        iH = ie({
            ...iU.shape,
            elements: io(r6(iG))
        }),
        iK = t => {
            let n = t.violation;
            if (!n) return !1;
            let {
                evidence: r
            } = n;
            if (!r || !(t => {
                    if ("platform" !== t.type) return !1;
                    let n = iU.safeParse(t);
                    return !!n.success || (console.warn("Failed to parse platform evidence: ", n.error), !1)
                })(r)) return !1;
            let i = null == (a = r.elements) ? void 0 : a.filter(t => iV(t));
            if (!i || 0 === i.length) return !1;
            var a, s = {
                ...r,
                elements: i
            };
            if ("platform" !== s.type) return !1;
            let o = iH.safeParse(s);
            return !!o.success || (console.warn("Failed to parse platform evidence fully typed: ", o.error), !1)
        },
        iz = (0, A.createContext)(void 0),
        iW = t => {
            let {
                enableIxp: n = !1,
                children: r
            } = t, i = iy().translate, {
                data: a,
                isLoading: s,
                error: o
            } = (() => {
                let {
                    httpGet: t,
                    userModerationApiUrl: n
                } = iy();
                return (0, rV.useQuery)({
                    queryKey: ["not-approved-data"],
                    queryFn: () => t("".concat(n, "/v1/not-approved")),
                    staleTime: 1 / 0
                })
            })(), {
                data: u,
                isLoading: l,
                isFetching: c
            } = (t => {
                let {
                    enabled: n
                } = t, {
                    ixp: r
                } = iy();
                return (0, rV.useQuery)({
                    queryKey: ["ixp/".concat(i_)],
                    queryFn: async () => {
                        if (!r) return {};
                        try {
                            return await r.fetchLayer(i_)
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
                isLoading: h
            } = (() => {
                let {
                    httpGet: t,
                    apiGatewayUrl: n
                } = iy();
                return (0, rV.useQuery)({
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
            })(), f = (null == a ? void 0 : a.punishedUserId) ? a : void 0, v = (0, A.useMemo)(() => {
                let t = new Set,
                    n = new Set;
                if ((null == f ? void 0 : f.violation) && iK(f)) f.violation.abuseTypeTranslationKeys.forEach(r => {
                    t.add(i(r)), n.add(r)
                });
                else {
                    var r;
                    null == f || null == (r = f.badUtterances) || r.forEach(r => {
                        t.add(i(r.labelTranslationKey)), n.add(r.labelTranslationKey)
                    })
                }
                return {
                    translatedReasons: [...t].filter(Boolean),
                    untranslatedReasons: [...n].filter(Boolean)
                }
            }, [f, i]), m = s || n && l && c || h, y = (0, A.useMemo)(() => ({
                isLoading: m,
                error: o,
                punishmentData: f,
                violationReasons: v,
                ixpData: u,
                commutationEligibility: d
            }), [m, o, f, v, u, d]);
            return (0, p.jsx)(iz.Provider, {
                value: y,
                children: r
            })
        },
        iJ = () => {
            let t = (0, A.useContext)(iz);
            if (!t) throw Error("useNotApprovedPagePunishment must be used within a NotApprovedPagePunishmentProvider");
            return t
        },
        iZ = (0, A.createContext)(void 0),
        iY = t => {
            let {
                children: n
            } = t, {
                currentPage: r,
                currentPageName: i,
                unmappedViolationKeys: a
            } = iC(), s = ib(), o = (0, A.useRef)(Date.now()), u = (0, A.useRef)(r), l = (0, A.useRef)(i), c = (0, A.useRef)(!0), d = () => Date.now() - o.current;
            (0, A.useEffect)(() => {
                a.forEach(t => {
                    s("unmappedViolationKey", {
                        unmappedViolationKey: t
                    })
                })
            }, [a]), (0, A.useEffect)(() => {
                if (c.current) {
                    c.current = !1;
                    return
                }
                let t = d();
                s(r > u.current ? "continueClicked" : "backClicked", {
                    pageName: l.current,
                    timeOnPageMs: t
                }), o.current = Date.now(), u.current = r, l.current = i
            }, [r, i]);
            let h = (0, A.useCallback)((t, n) => {
                    let r = d();
                    s(t, {
                        ...n,
                        pageName: i,
                        timeOnPageMs: r
                    })
                }, [i, s]),
                f = (0, A.useMemo)(() => ({
                    sendPageEvent: h
                }), [h]);
            return (0, p.jsx)(iZ.Provider, {
                value: f,
                children: n
            })
        },
        iQ = () => {
            let t = (0, A.useContext)(iZ);
            if (!t) throw Error("usePageAnalytics must be used within PageAnalyticsProvider");
            return t
        },
        iX = {
            ruleTitle: "Heading.RuleExplanation.Dating",
            ruleSubtitle: "SubHeading.RuleExplanation.Dating",
            ruleDescription: "Description.RuleExplanation.Dating",
            importanceTitle: "Heading.RuleImportance",
            importanceDescription: "Description.RuleImportance.Dating",
            policyKey: "dating"
        },
        i$ = {
            ruleTitle: "Heading.RuleExplanation.BullyingHarassmentDiscrimination",
            ruleSubtitle: "SubHeading.RuleExplanation.BullyingHarassmentDiscrimination",
            ruleDescription: "Description.RuleExplanation.BullyingHarassmentDiscrimination",
            importanceTitle: "Heading.RuleImportance",
            importanceDescription: "Description.RuleImportance.BullyingHarassmentDiscrimination",
            policyKey: "bullying-harassment-discrimination"
        },
        i0 = {
            ruleTitle: "Heading.RuleExplanation.MisusingRobloxSystems",
            ruleSubtitle: "SubHeading.RuleExplanation.MisusingRobloxSystems",
            ruleDescription: "Description.RuleExplanation.MisusingRobloxSystems",
            ruleDescriptionBullets: "Description.RuleExplanation.Bullets.MisusingRobloxSystems",
            importanceTitle: "Heading.RuleImportance",
            importanceDescription: "Description.RuleImportance.MisusingRobloxSystems",
            policyKey: "misusing-roblox-systems"
        },
        i1 = {
            ruleTitle: "Heading.RuleExplanation.PII",
            ruleSubtitle: "SubHeading.RuleExplanation.PII",
            ruleDescription: "Description.RuleExplanation.PII",
            ruleDescriptionBullets: "Description.RuleExplanation.Bullets.PII",
            importanceTitle: "Heading.RuleImportance",
            importanceDescription: "Description.RuleImportance.PII",
            policyKey: "pii"
        },
        i2 = {
            ruleTitle: "Heading.RuleExplanation.SSHAndIllegalRegulatedActivities",
            ruleSubtitle: "SubHeading.RuleExplanation.SSHAndIllegalRegulatedActivities",
            ruleDescription: "Description.RuleExplanation.SSHAndIllegalRegulatedActivities",
            ruleDescriptionBullets: "Description.RuleExplanation.Bullets.SSHAndIllegalRegAct",
            importanceTitle: "Heading.RuleImportance",
            importanceDescription: "Description.RuleImportance.SSHAndIllegalRegulatedActivities",
            policyKey: "ssh-and-illegal-regulated-activities"
        },
        i4 = {
            "Label.AbuseType.CheatandExploits": i0,
            "Label.AbuseType.ContestsandSweepstakes": i2,
            "Label.AbuseType.Dating": iX,
            "Label.AbuseType.DirectingUsersOffPlatform": {
                ruleTitle: "Heading.RuleExplanation.DirectingUsersOffPlatform",
                ruleSubtitle: "SubHeading.RuleExplanation.DirectingUsersOffPlatform",
                ruleDescription: "Description.RuleExplanation.DirectingUsersOffPlatform",
                importanceTitle: "Heading.RuleImportance",
                importanceDescription: "Description.RuleImportance.DirectingUsersOffPlatform",
                policyKey: "directing-users-off-platform"
            },
            "Label.AbuseType.DiscriminatoryContent": i$,
            "Label.AbuseType.DisruptiveAudio": i0,
            "Label.AbuseType.EncouragingDangerousBehavior": i2,
            "Label.AbuseType.ExtortionandBlackmail": i$,
            "Label.AbuseType.Harassment": i$,
            "Label.AbuseType.IllegalandRegulatedContent": i2,
            "Label.AbuseType.Impersonation": i$,
            "Label.AbuseType.IrlDangerousActivities": i2,
            "Label.AbuseType.MisusingRobloxSystems": i0,
            "Label.AbuseType.OffPlatformSpeechandBehavior": i$,
            "Label.AbuseType.PrivacyAskingforPII": i1,
            "Label.AbuseType.PrivacyGivingPII": i1,
            "Label.AbuseType.RealLifeThreats": i$,
            "Label.AbuseType.Scamming": i0,
            "Label.AbuseType.SexualContent": iX,
            "Label.AbuseType.Spam": {
                ruleTitle: "Heading.RuleExplanation.Spam",
                ruleSubtitle: "SubHeading.RuleExplanation.Spam",
                ruleDescription: "Description.RuleExplanation.Spam",
                importanceTitle: "Heading.RuleImportance",
                importanceDescription: "Description.RuleImportance.Spam",
                policyKey: "spam"
            },
            "Label.AbuseType.SuicideSelfHarm": i2,
            "Label.AbuseType.Swearing": {
                ruleTitle: "Heading.RuleExplanation.Swearing",
                ruleSubtitle: "SubHeading.RuleExplanation.Swearing",
                ruleDescription: "Description.RuleExplanation.Swearing",
                importanceTitle: "Heading.RuleImportance",
                importanceDescription: "Description.RuleImportance.Swearing",
                policyKey: "swearing"
            },
            "Label.AbuseType.ThreatsOrAbuseOfRobloxEmployeesOrAffiliates": i$,
            "Label.AbuseType.ViolentContentAndGore": {
                ruleTitle: "Heading.RuleExplanation.ViolentContentAndGore",
                ruleSubtitle: "SubHeading.RuleExplanation.ViolentContentAndGore",
                ruleDescription: "Description.RuleExplanation.ViolentContentAndGore",
                importanceTitle: "Heading.RuleImportance",
                importanceDescription: "Description.RuleImportance.ViolentContentAndGore",
                policyKey: "violent-content-and-gore"
            },
            "Label.AbuseType.VirtualCasino": i2,
            "Label.Sublabel.RealLifeEvents": {
                ruleTitle: "Heading.RuleExplanation.RealLifeEvents",
                ruleSubtitle: "SubHeading.RuleExplanation.RealLifeEvents",
                ruleDescription: "Description.RuleExplanation.RealLifeEvents",
                ruleDescriptionBullets: "Description.RuleExplanation.Bullets.RealLifeEvents",
                importanceTitle: "Heading.RuleImportance",
                importanceDescription: "Description.RuleImportance.RealLifeEvents",
                policyKey: "real-life-events"
            },
            "Label.Sublabel.RomanceOrSex": iX
        },
        i3 = "{startLink}",
        i5 = "{endLink}",
        i7 = (t, n) => (r, i, a, s) => {
            var o;
            let [u, l] = t(r, {
                startLink: i3,
                endLink: i5,
                ...a
            }).split(i3, 2), [c, d] = null != (o = null == l ? void 0 : l.split(i5, 2)) ? o : [];
            return (0, p.jsxs)("p", {
                className: "text-body-large",
                children: [u, (0, p.jsx)("a", {
                    href: i,
                    className: "content-link",
                    rel: "noreferrer",
                    onClick: () => {
                        null != s && n && n(s)
                    },
                    children: c
                }), d]
            })
        },
        i8 = {
            getIsVisible: t => [iT, "VPC"].includes(t.verificationCategory),
            renderComponent: t => {
                let {
                    punishmentData: n
                } = t, r = iy().translate, {
                    websiteUrl: i
                } = iy(), a = i7(r), {
                    verificationCategory: s
                } = n, o = "".concat(i, "/"), u = a("VPC" === s ? "Label.ParentReactivationNotice" : "Label.EmailReactivationNotice", o);
                return (0, p.jsxs)("div", {
                    className: "flex flex-col gap-medium",
                    children: [(0, p.jsx)("span", {
                        className: "text-heading-medium",
                        children: r("Label.ChargebackNextSteps")
                    }), u]
                })
            },
            configName: "chargeback-steps"
        },
        i6 = {
            getIsVisible: t => "Delete" !== t.punishmentTypeDescription,
            renderComponent: t => {
                let {
                    punishmentData: n
                } = t, r = iy().translate, i = ib(), {
                    hasEducationalPages: a
                } = iC(), {
                    showUGCAvatarGuidelinesLink: s,
                    context: o
                } = n, u = null == o ? void 0 : o.IS_ALT_INFORMED;
                return (0, p.jsxs)("div", {
                    className: "flex flex-col gap-medium",
                    children: [(0, p.jsx)("span", {
                        className: "text-heading-medium",
                        children: r("Label.RuleBreakingAddsUp")
                    }), (0, p.jsxs)("div", {
                        className: "flex flex-col gap-medium",
                        children: [(0, p.jsx)("p", {
                            className: "text-body-large",
                            children: r("Description.Foreshadow")
                        }), u && (0, p.jsx)("p", {
                            className: "text-body-large",
                            children: r("Description.LinkedAccounts")
                        }), (!!s || !a) && (0, p.jsx)(id.Button, {
                            as: "a",
                            href: s ? "https://create.roblox.com/docs/marketplace/marketplace-policy#general-creation-guidelines" : "https://en.help.roblox.com/hc/en-us/articles/203313410-Roblox-Community-Standards",
                            target: "_blank",
                            rel: "noreferrer noopener",
                            variant: "Standard",
                            size: "Small",
                            onClick: () => {
                                i(s ? "ugcGuidelinesClicked" : "communityGuidelineClicked")
                            },
                            children: r(s ? "Action.ViewRulesUGCAvatarGuidelines" : "Action.ViewRules")
                        })]
                    })]
                })
            },
            configName: "prevention-steps"
        },
        i9 = function(t, n, r, i) {
            if ("Delete" === r) return i("Description.BrokeRulesBanned");
            let a = iS[null != n ? n : ""],
                s = a ? i(a) : "";
            return t.length > 0 ? s ? i("Description.BrokeRulesTypePolicy.V2", {
                type: s,
                policy: t.join(", ").toLowerCase()
            }) : i("Description.BrokeRulesPolicy.V2", {
                policy: t.join(", ").toLowerCase()
            }) : s ? i("Description.BrokeRulesType", {
                type: s
            }) : i("Description.BrokeRulesGeneric")
        },
        ae = {
            getIsVisible: () => !0,
            renderComponent: t => {
                var n, r, i;
                let {
                    punishmentData: a
                } = t, s = iy().translate, {
                    violationReasons: o
                } = iJ(), {
                    violation: u,
                    punishmentTypeDescription: l
                } = a, c = null == u || null == (i = u.evidence) || null == (r = i.displayMeta) ? void 0 : r.capitalizedKey, d = i9(null != (n = null == o ? void 0 : o.translatedReasons) ? n : [], c, l, s);
                return (0, p.jsx)("span", {
                    className: "text-body-medium",
                    children: d
                })
            },
            configName: "punishment-description"
        },
        at = () => {
            let {
                websiteUrl: t,
                platform: n,
                onAppealsRedirect: r
            } = iy(), {
                ixpData: i
            } = iJ(), a = ib();
            return {
                handleAppealsClick: (0, A.useCallback)(() => {
                    (a("appealsPortalClicked"), r) ? r(): i && "FFlagEnableSafetyDashboard" in i && !0 === i.FFlagEnableSafetyDashboard ? window.open("".concat(t, "/safety-dashboard?t_source=").concat(encodeURIComponent(n)), "_blank", "noopener,noreferrer") : window.open("".concat(t, "/report-appeals?t_source=nap-web"), "_blank", "noopener,noreferrer")
                }, [a, r, i, t, n])
            }
        },
        an = {
            getIsVisible: (t, n, r) => {
                var i;
                return !(null != (i = null == r ? void 0 : r.educational_pass_eligible) && i) || "second-chance-intro" === n
            },
            renderComponent: () => {
                let t = iy().translate,
                    {
                        handleAppealsClick: n
                    } = at();
                return (0, p.jsxs)("div", {
                    className: "flex flex-col gap-medium",
                    children: [(0, p.jsx)("p", {
                        className: "text-body-large",
                        children: t("Description.Mistake.V3")
                    }), (0, p.jsx)(id.Button, {
                        variant: "Standard",
                        size: "Small",
                        onClick: n,
                        children: t("Action.SendAppeal")
                    })]
                })
            },
            configName: "report-mistake"
        },
        ar = t => {
            let {
                url: n,
                altLabelKey: r
            } = t, i = iy().translate, [a, s] = (0, A.useState)(!0);
            return (0, p.jsxs)("div", {
                className: "flex aspect-1-1 justify-center items-center bg-shift-200 radius-medium",
                children: [(0, p.jsx)("img", {
                    style: {
                        objectFit: "contain"
                    },
                    className: "size-full ".concat(a ? "hidden" : ""),
                    src: n,
                    alt: r && i(r),
                    onLoad: () => {
                        s(!1)
                    },
                    onError: () => {
                        s(!1)
                    }
                }), (0, p.jsx)("div", {
                    "data-testid": "spinner-container",
                    className: a ? void 0 : "hidden",
                    children: (0, p.jsx)(rJ.ProgressCircle, {
                        ariaLabel: i("Label.LoadingImage"),
                        size: "Medium",
                        variant: "Indeterminate"
                    })
                })]
            })
        },
        ai = t => new Date(t).toLocaleString(void 0, {
            month: "long",
            day: "numeric",
            year: "numeric",
            hour: "numeric",
            minute: "numeric"
        });

    function aa() {
        let {
            formatFullDate: t
        } = iy();
        return null != t ? t : ai
    }
    var as = t => {
            let {
                fieldLabel: n,
                fieldValue: r,
                preline: i = !1
            } = t;
            return (0, p.jsxs)("div", {
                className: "flex flex-col",
                children: [(0, p.jsx)("span", {
                    className: "text-title-medium",
                    children: "".concat(n, ":")
                }), (0, p.jsx)("p", {
                    className: "text-body-medium",
                    style: {
                        wordBreak: "break-word",
                        whiteSpace: i ? "pre-line" : "normal"
                    },
                    children: r
                })]
            })
        },
        ao = () => {
            let t = iy().translate,
                {
                    handleAppealsClick: n
                } = at(),
                {
                    readOnly: r
                } = iy();
            return r ? null : (0, p.jsx)(id.Button, {
                onClick: n,
                variant: "Standard",
                size: "Small",
                children: t("Action.ViewMore")
            })
        },
        au = {
            getIsVisible: iK,
            renderComponent: t => {
                var n, r;
                let {
                    punishmentData: i
                } = t, {
                    violation: a,
                    consequenceTransparencyMessage: s
                } = i, o = iy().translate, u = aa(), l = ib(), c = null == a || null == (r = a.evidence) ? void 0 : r.elements, d = null != (n = null == c ? void 0 : c.filter(t => iV(t))) ? n : [], h = [], f = [];
                d.forEach(t => {
                    var n;
                    "image" === t.type ? h.push((0, p.jsx)(ar, {
                        url: t.url,
                        altLabelKey: t.labelKey
                    }, t.url)) : f.push((0, p.jsx)(as, {
                        fieldLabel: o(t.labelKey),
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
                        })(o, t.textKey, t.textKeyParameters, l) : null != (n = t.text) ? n : ""
                    }, t.labelKey))
                });
                let v = h.length > 0;
                return (0, p.jsxs)("div", {
                    "data-testid": "violation-grid",
                    className: "flex flex-col gap-medium medium:flex-row medium:gap-large",
                    children: [v && (0, p.jsx)("div", {
                        className: "shrink-0 width-[50%] medium:width-full medium:basis-[40%]",
                        children: h[0]
                    }), (0, p.jsxs)("div", {
                        className: "flex flex-col gap-small width-full",
                        children: [f, (0, p.jsx)(as, {
                            fieldLabel: o("Label.ReviewDate"),
                            fieldValue: u(i.beginDate)
                        }), s && (0, p.jsx)(as, {
                            fieldLabel: o("Label.DecisionMethod"),
                            fieldValue: s
                        }), (0, p.jsx)(ao, {})]
                    })]
                })
            },
            configName: "violation-evidence"
        },
        al = t => {
            let {
                badUtterances: n
            } = t, [r, i] = (0, A.useState)(!1), a = iy().translate;
            return (0, p.jsxs)("div", {
                className: "flex flex-col gap-small",
                children: [(0, p.jsxs)("div", {
                    className: "flex flex-col",
                    children: [(0, p.jsxs)("span", {
                        className: "text-title-medium",
                        children: [a("Label.OffensiveItem.V2"), ":"]
                    }), (0, p.jsxs)("div", {
                        className: "flex flex-col items-start",
                        children: [n.slice(0, 4).map(t => (0, p.jsx)("p", {
                            className: "text-body-medium",
                            style: {
                                wordBreak: "break-word"
                            },
                            children: t.utteranceText
                        }, t.utteranceText)), n.slice(4).map(t => (0, p.jsx)("p", {
                            className: "text-body-medium ".concat(r ? "" : "hidden"),
                            style: {
                                wordBreak: "break-word"
                            },
                            children: t.utteranceText
                        }, t.utteranceText))]
                    })]
                }), n.length > 4 && (0, p.jsx)(id.Button, {
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
        ac = {
            getIsVisible: t => {
                var n, r;
                return !iK(t) && (null != (n = null == (r = t.badUtterances) ? void 0 : r.length) ? n : 0) > 0
            },
            renderComponent: t => {
                let {
                    punishmentData: n
                } = t, r = iy().translate, i = aa(), {
                    badUtterances: a,
                    consequenceTransparencyMessage: s
                } = n;
                return (0, p.jsxs)("div", {
                    className: "flex flex-col gap-small",
                    "data-testid": "bad-utterances",
                    children: [(0, p.jsx)(al, {
                        badUtterances: null != a ? a : []
                    }), (0, p.jsx)(ih.Divider, {}), (0, p.jsx)(as, {
                        fieldLabel: r("Label.ReviewDate"),
                        fieldValue: i(n.beginDate)
                    }), s && (0, p.jsx)(as, {
                        fieldLabel: r("Label.DecisionMethod"),
                        fieldValue: s
                    }), (0, p.jsx)(ao, {})]
                })
            },
            configName: "bad-utterances"
        },
        ad = {
            getIsVisible: t => {
                var n, r;
                return !iK(t) && (null != (n = null == (r = t.badUtterances) ? void 0 : r.length) ? n : 0) === 0
            },
            renderComponent: t => {
                let n = iy().translate,
                    r = aa(),
                    {
                        punishmentData: i
                    } = t,
                    {
                        beginDate: a,
                        consequenceTransparencyMessage: s
                    } = i;
                return (0, p.jsxs)("div", {
                    className: "flex flex-col gap-small",
                    "data-testid": "simple-evidence",
                    children: [(0, p.jsx)(as, {
                        fieldLabel: n("Label.ReviewDate"),
                        fieldValue: r(a)
                    }), s && (0, p.jsx)(as, {
                        fieldLabel: n("Label.DecisionMethod"),
                        fieldValue: s
                    }), (0, p.jsx)(ao, {})]
                })
            },
            configName: "simple-evidence"
        },
        ah = {
            getIsVisible: () => !0,
            renderComponent: t => {
                let {
                    punishmentData: n
                } = t, r = iy().translate, i = [au, ac, ad].map(t => t.getIsVisible(n) ? (0, p.jsx)("div", {
                    children: t.renderComponent({
                        punishmentData: n
                    })
                }, t.configName) : null).filter(Boolean);
                return (0, p.jsxs)("div", {
                    className: "flex flex-col gap-medium",
                    "data-testid": "reviewed-evidence-container",
                    children: [(0, p.jsx)("span", {
                        className: "text-title-large",
                        children: r("Label.LatestActivity")
                    }), (0, p.jsxs)("div", {
                        className: "flex flex-col gap-xsmall",
                        children: [(0, p.jsx)("div", {
                            className: "padding-large bg-shift-100 radius-medium",
                            children: i
                        }), (0, p.jsx)("span", {
                            className: "text-caption-medium content-muted",
                            children: n.interventionId
                        })]
                    })]
                })
            },
            configName: "rewiewed-evidence"
        },
        af = {
            getIsVisible: () => !0,
            renderComponent: () => {
                let t = iy().translate;
                return (0, p.jsxs)("div", {
                    className: "flex flex-col gap-medium",
                    children: [(0, p.jsx)("span", {
                        className: "text-heading-medium",
                        children: t("Heading.SecondChance.Details")
                    }), (0, p.jsx)("p", {
                        className: "text-body-large",
                        children: t("Description.SecondChance.Details")
                    })]
                })
            },
            configName: "second-chance-conclusion"
        },
        ap = {
            getIsVisible: () => !0,
            renderComponent: () => {
                let t = iy().translate;
                return (0, p.jsxs)("div", {
                    className: "flex flex-col gap-large",
                    children: [(0, p.jsx)("span", {
                        className: "text-heading-medium",
                        children: t("Heading.SecondChance")
                    }), (0, p.jsx)("p", {
                        className: "text-body-large",
                        children: t("Description.SecondChance.Second")
                    })]
                })
            },
            configName: "second-chance-intro"
        },
        av = {
            getIsVisible: () => !0,
            renderComponent: t => {
                var n;
                let r = iy().translate,
                    {
                        violationReasons: i
                    } = iJ(),
                    {
                        punishmentData: a
                    } = t,
                    {
                        messageToUser: s
                    } = a;
                return (0, p.jsxs)("div", {
                    className: "flex flex-col gap-medium",
                    "data-testid": "what-happened",
                    children: [(0, p.jsx)("span", {
                        className: "text-title-large",
                        children: r("Label.WhatHappened")
                    }), (0, p.jsxs)("div", {
                        className: "padding-large bg-shift-100 radius-medium flex flex-col gap-small",
                        children: [(0, p.jsx)(as, {
                            fieldLabel: r("Label.Reason"),
                            fieldValue: (null != (n = null == i ? void 0 : i.translatedReasons) ? n : []).join(", ") || r("Label.AbuseType.Other")
                        }), (0, p.jsx)(as, {
                            fieldLabel: r("Label.ModeratorNote"),
                            fieldValue: s || r("Description.Violation", {
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
        am = t => t.split("\n").map(t => t.trim()).filter(Boolean),
        ay = t => ({
            getIsVisible: () => !0,
            renderComponent: () => {
                let n = iy().translate,
                    r = am(n(t.description)),
                    i = t.descriptionBullets ? n(t.descriptionBullets) : void 0,
                    a = i ? am(i) : [];
                return (0, p.jsxs)("div", {
                    className: "flex flex-col gap-medium",
                    "data-testid": t.policyKey,
                    children: [(0, p.jsx)("span", {
                        className: "text-heading-medium",
                        children: n(t.title)
                    }), t.subtitle && (0, p.jsx)("span", {
                        className: "text-title-large",
                        children: n(t.subtitle)
                    }), (0, p.jsxs)("div", {
                        className: "flex flex-col gap-small",
                        children: [r.length > 0 && (0, p.jsx)("div", {
                            className: "flex flex-col gap-medium",
                            children: r.map(t => (0, p.jsx)("p", {
                                className: "text-body-large",
                                children: t
                            }, t))
                        }), a.length > 0 && (0, p.jsx)("div", {
                            className: "flex flex-col gap-xsmall padding-left-small",
                            children: a.map(t => (0, p.jsxs)("div", {
                                className: "flex flex-row gap-small",
                                children: [(0, p.jsx)("p", {
                                    className: "text-body-large",
                                    children: "•"
                                }), (0, p.jsx)("p", {
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
        ag = t => {
            let {
                isDisabled: n = !1
            } = t, r = iy().translate, {
                goToNextPage: i
            } = iC();
            return (0, p.jsx)(id.Button, {
                variant: "Emphasis",
                size: "Medium",
                onClick: i,
                "data-testid": "continue-button",
                isDisabled: n,
                children: r("Action.Continue")
            })
        },
        aw = t => {
            let {
                setIsDialogOpen: n
            } = t, r = iy().translate;
            return (0, p.jsx)(id.Button, {
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
        ab = ((u = ab || {})[u.Reactivate = 0] = "Reactivate", u[u.Paused = 1] = "Paused", u[u.VerifyEmail = 2] = "VerifyEmail", u[u.VerifyVPC = 3] = "VerifyVPC", u),
        a_ = t => {
            let {
                onClose: n
            } = t, r = iy().translate;
            return (0, p.jsxs)("div", {
                className: "width-full flex gap-large items-center justify-between radius-medium padding-medium stroke-system-alert stroke-standard maf-error-alert",
                style: {
                    backgroundColor: "rgba(255, 0, 0, 0.1)"
                },
                "data-testid": "error-alert",
                children: [(0, p.jsxs)("div", {
                    className: "flex gap-small items-center",
                    children: [(0, p.jsx)(rH.Icon, {
                        name: "icon-filled-circle-x",
                        className: "content-system-alert"
                    }), (0, p.jsx)("span", {
                        className: "text-body-medium",
                        children: r("Heading.Error")
                    })]
                }), (0, p.jsx)(rZ.IconButton, {
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
        ax = t => {
            let n, {
                    proceedAction: r,
                    setIsDialogOpen: i,
                    isAgreed: a,
                    isDisabled: s = !1
                } = t,
                o = iy().translate,
                {
                    sendPageEvent: u
                } = iQ(),
                {
                    userModerationApiUrl: l,
                    httpPost: c,
                    onVerifyEmail: d,
                    onVerifyParent: h,
                    onAccountReactivated: f
                } = iy(),
                [v, m] = (0, A.useState)(!1),
                y = (0, rK.useMutation)({
                    mutationFn: () => c("".concat(l, "/v1/not-approved/reactivate")),
                    onSuccess: async () => {
                        await new Promise(t => {
                            setTimeout(t, 2e3)
                        }), f()
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
                    n = o("Action.Continue");
                    break;
                case 2:
                    n = o("Label.EmailVerificationButtonText");
                    break;
                case 3:
                    n = o("Label.ParentVerificationButtonText");
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
                        i(!1), u("parentVerificationClicked"), await (null == h ? void 0 : h({
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
            return (0, p.jsxs)(A.Fragment, {
                children: [y.isError && (0, p.jsx)(a_, {
                    onClose: () => {
                        y.reset()
                    }
                }), (0, p.jsx)(id.Button, {
                    onClick: () => {
                        g().catch(t => {
                            console.warn("NotApprovedProceedButton onClick error", t instanceof Error ? t.message : "unknown")
                        })
                    },
                    isDisabled: s || v || !a,
                    isLoading: v,
                    variant: "Emphasis",
                    size: "Medium",
                    "data-testid": "proceed-button",
                    children: n
                })]
            })
        },
        aP = function(t) {
            let {
                punishmentTypeDescription: n,
                endDate: r,
                verificationCategory: i
            } = t;
            switch (i) {
                case iT:
                    return 2;
                case "VPC":
                    return 3;
                default:
                    return +!iR(n, r, i)
            }
        },
        aS = t => {
            let {
                endDate: n
            } = t, r = iy().translate, i = ((t, n) => {
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
                let s = Math.floor(a / 36e5),
                    o = Math.floor(a % 36e5 / 6e4);
                return a > 0 && a < 6e4 && (o = 1), n("Label.Hours", {
                    hours: s.toString().padStart(2, "0"),
                    minutes: o.toString().padStart(2, "0")
                })
            })(n, r);
            return (0, p.jsxs)("div", {
                "data-testid": "suspension-duration-alert",
                className: "flex flex-wrap gap-small bg-shift-100 padding-x-medium padding-y-small stroke-standard stroke-default items-center radius-medium",
                children: [(0, p.jsx)(rH.Icon, {
                    name: "icon-filled-triangle-exclamation",
                    className: "content-system-warning"
                }), (0, p.jsx)("span", {
                    className: "text-title-medium",
                    children: r("Label.Suspension")
                }), (0, p.jsx)("p", {
                    className: "text-body-medium",
                    children: i
                })]
            })
        },
        aT = t => {
            let {
                punishmentData: n,
                setIsDialogOpen: r
            } = t, i = iy().translate, a = ib(), {
                endDate: s,
                punishmentTypeDescription: o
            } = n, u = aP(n), [l, c] = (0, A.useState)(!1), [d, h] = (0, A.useState)(!1);
            return (0, A.useEffect)(() => {
                let t;
                return Object.values(ix).includes(o) && o.startsWith("Ban") && (t = setTimeout(() => {
                    h(t => !t)
                }, 6e4)), () => {
                    clearTimeout(t)
                }
            }, [d, o]), 1 === u ? (0, p.jsxs)("div", {
                className: "flex flex-col gap-large medium:flex-row",
                children: [(0, p.jsx)(aS, {
                    endDate: s
                }), (0, p.jsx)(ax, {
                    proceedAction: u,
                    setIsDialogOpen: r,
                    isAgreed: l,
                    isDisabled: !0
                })]
            }) : (0, p.jsxs)(A.Fragment, {
                children: [(0, p.jsx)(ip.Checkbox, {
                    label: i("Label.RuleAcknowledgment"),
                    placement: "Start",
                    size: "Small",
                    isChecked: l,
                    onCheckedChange: t => {
                        c(!0 === t), a("checkboxChecked")
                    },
                    className: "self-start",
                    "data-testid": "rule-confirmation-checkbox"
                }), (0, p.jsx)(ax, {
                    proceedAction: u,
                    setIsDialogOpen: r,
                    isAgreed: l,
                    isDisabled: !l
                })]
            })
        },
        aR = () => {
            let t = iy().translate,
                {
                    handleAppealsClick: n
                } = at();
            return (0, p.jsx)(id.Button, {
                variant: "SoftEmphasis",
                size: "Medium",
                onClick: n,
                "data-testid": "appeals-button",
                children: t("Action.ReportMistake")
            })
        },
        aE = async (t, n) => n("".concat(t, "/moderation-appeal-service/v2/consequence-commutation"), {
            type: "EDUCATIONAL_PASS"
        }), aq = () => {
            let t = iy().translate,
                {
                    sendPageEvent: n
                } = iQ(),
                {
                    httpPost: r,
                    apiGatewayUrl: i,
                    onAccountReactivated: a
                } = iy(),
                {
                    handleAppealsClick: s
                } = at(),
                [o, u] = (0, A.useState)(!1),
                l = (0, rK.useMutation)({
                    mutationFn: () => aE(i, r),
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
            return (0, p.jsxs)(A.Fragment, {
                children: [l.isError && (0, p.jsx)(a_, {
                    onClose: () => {
                        l.reset()
                    }
                }), (0, p.jsxs)("div", {
                    className: "flex flex-col gap-small medium:flex-row-reverse",
                    children: [(0, p.jsx)(id.Button, {
                        onClick: () => {
                            l.mutate()
                        },
                        variant: "Emphasis",
                        size: "Medium",
                        className: "min-width-2600",
                        "data-testid": "second-chance-reactivate-button",
                        isLoading: o,
                        isDisabled: o,
                        children: t("Action.OK")
                    }), (0, p.jsx)(id.Button, {
                        onClick: s,
                        variant: "Standard",
                        size: "Medium",
                        "data-testid": "second-chance-send-appeal-button",
                        children: t("Action.SendAppeal")
                    })]
                })]
            })
        }, aC = () => {
            let t = iy().translate,
                [n, r] = (0, A.useState)(!1);
            return (0, p.jsxs)(A.Fragment, {
                children: [(0, p.jsx)(ip.Checkbox, {
                    label: t("Label.RuleAcknowledgment"),
                    placement: "Start",
                    size: "Small",
                    isChecked: n,
                    onCheckedChange: t => {
                        r(!0 === t)
                    },
                    className: "self-start",
                    "data-testid": "understand-continue-checkbox"
                }), (0, p.jsx)(ag, {
                    isDisabled: !n
                })]
            })
        }, aA = t => {
            let {
                onOpenChange: n,
                children: r
            } = t, {
                readOnly: i
            } = iy(), {
                punishmentData: a,
                violationReasons: s,
                isLoading: o,
                error: u,
                commutationEligibility: l
            } = iJ(), c = null == s ? void 0 : s.untranslatedReasons, d = (0, A.useMemo)(() => (null != c ? c : []).some(t => t in i4), [c]), {
                pages: h,
                unmappedViolationKeys: f
            } = (0, A.useMemo)(() => a ? ((t, n, r, i) => {
                var a;
                let s, o, u, l = [],
                    c = "Delete" === t.punishmentTypeDescription,
                    d = null != (a = null == r ? void 0 : r.educational_pass_eligible) && a;
                if (l.push({
                        pageName: "intro",
                        pageItems: [ae, av, ah],
                        CtaComponent: c ? aR : ag
                    }), c) return {
                    pages: l,
                    unmappedViolationKeys: []
                };
                d && !i && l.push({
                    pageName: "second-chance-intro",
                    pageItems: [ap, an],
                    CtaComponent: ag
                });
                let {
                    educationalPages: h,
                    unmappedViolationKeys: f
                } = (s = [], o = new Set, u = new Set, n.forEach(t => {
                    let n = i4[t];
                    if (!n) return void o.add(t);
                    if (u.has(n.policyKey)) return;
                    u.add(n.policyKey);
                    let r = d && !i ? aC : ag;
                    s.push({
                        pageName: "policy-rule-".concat(n.policyKey),
                        pageItems: [ay({
                            title: n.ruleTitle,
                            subtitle: n.ruleSubtitle,
                            description: n.ruleDescription,
                            descriptionBullets: n.ruleDescriptionBullets,
                            policyKey: n.policyKey
                        })],
                        CtaComponent: r
                    }), s.push({
                        pageName: "policy-importance-".concat(n.policyKey),
                        pageItems: [ay({
                            title: n.importanceTitle,
                            description: n.importanceDescription,
                            policyKey: n.policyKey
                        })],
                        CtaComponent: r
                    })
                }), {
                    educationalPages: s,
                    unmappedViolationKeys: [...o]
                });
                return l.push(...h), l.push({
                    pageName: "resolution",
                    pageItems: [i6, i8, an],
                    CtaComponent: i ? aw : d ? aC : aT
                }), d && !i && l.push({
                    pageName: "second-chance-conclusion",
                    pageItems: [af],
                    CtaComponent: aq
                }), {
                    pages: l,
                    unmappedViolationKeys: f
                }
            })(a, null != c ? c : [], l, i) : {
                pages: [],
                unmappedViolationKeys: []
            }, [a, c, l, i]);
            return o ? r({
                header: (0, p.jsx)(iM, {
                    readOnly: !!i
                }),
                body: (0, p.jsx)(iO, {}),
                ctas: (0, p.jsx)(ij, {})
            }) : u || !a ? r({
                header: (0, p.jsx)(iF, {}),
                body: (0, p.jsx)(iB, {
                    error: u
                })
            }) : (0, p.jsx)(iq, {
                pages: h,
                unmappedViolationKeys: f,
                hasEducationalPages: d,
                commutationEligibility: l,
                children: (0, p.jsx)(iY, {
                    children: r({
                        header: (0, p.jsx)(iL, {
                            punishmentData: a
                        }),
                        body: (0, p.jsx)(iA, {
                            punishmentData: a,
                            commutationEligibility: l
                        }),
                        ctas: (0, p.jsx)(iN, {
                            punishmentData: a,
                            setIsDialogOpen: n
                        })
                    })
                })
            })
        }, aD = t => {
            let {
                impressionEvent: n
            } = t, {
                translate: r,
                websiteUrl: i,
                onLogout: a
            } = iy(), s = ib(), o = i7(r, s), [u, l] = (0, A.useState)(!1);
            (0, A.useEffect)(() => {
                s(n)
            }, [s, n]);
            let c = (0, rK.useMutation)({
                mutationFn: async () => {
                    await a()
                },
                onMutate: () => {
                    l(!0), s("logoutClicked")
                },
                onError: t => {
                    let r = t instanceof Error ? t.message : "Unknown error";
                    s("error", {
                        additionalInfo: "".concat(n, ": Error logging out - ").concat(r)
                    }), l(!1)
                },
                retry: 0
            });
            return (0, p.jsx)(rG.Dialog, {
                open: !0,
                isModal: !0,
                size: "Medium",
                hasCloseAffordance: !1,
                children: (0, p.jsxs)(rG.DialogContent, {
                    className: "[&_p]:margin-none [&_h2]:margin-none",
                    children: [(0, p.jsxs)(rG.DialogBody, {
                        className: "gap-large flex flex-col",
                        children: [(0, p.jsx)(rG.DialogTitle, {
                            className: "text-heading-large margin-none",
                            children: r("Heading.AccountIssue")
                        }), o("Description.ResolveIssue", i)]
                    }), (0, p.jsxs)(rG.DialogFooter, {
                        className: "flex justify-end gap-small flex-col-reverse medium:flex-row",
                        children: [(0, p.jsx)(id.Button, {
                            variant: "Standard",
                            size: "Medium",
                            isLoading: u,
                            isDisabled: u,
                            onClick: () => {
                                c.mutate()
                            },
                            children: r("Action.Logout")
                        }), (0, p.jsx)(id.Button, {
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
        }, ak = t => {
            var n;
            let {
                open: r,
                onClose: i
            } = t, [a, s] = (0, A.useState)(!0), o = void 0 !== r, u = t => {
                o && !t ? null == i || i() : s(t)
            }, {
                translate: l,
                renderSelfServiceDeactivated: c,
                shouldShowGenericFallback: d,
                ixp: h,
                readOnly: f
            } = iy(), v = ib(), {
                punishmentData: m,
                isLoading: y,
                error: g,
                ixpData: w
            } = iJ(), b = w && "FFlagEnableSafetyDashboard" in w, _ = !y && !g && void 0 !== m, x = !y && !g && !m;
            if ((0, A.useEffect)(() => {
                    if (m) {
                        var t;
                        v((null == (t = m.context) ? void 0 : t.SelfServiceDeactivated) ? "accountReactivationPageRendered" : "pageRendered", {
                            interventionId: m.interventionId,
                            punishedUserId: m.punishedUserId,
                            isReactivationEligible: iR(m.punishmentTypeDescription, m.endDate, m.verificationCategory),
                            verificationCategory: m.verificationCategory
                        })
                    }
                }, [m]), (0, A.useEffect)(() => {
                    b && !f && m && (null == h || h.logExposure(i_))
                }, [b, f, m, h]), x && !f) return null;
            if (_ && (null == (n = m.context) ? void 0 : n.SelfServiceDeactivated)) return c ? (0, p.jsx)(A.Fragment, {
                children: c()
            }) : (0, p.jsx)(aD, {
                impressionEvent: "accountReactivationRedirectRendered"
            });
            let P = _ && (null == d ? void 0 : d(m));
            return P ? (0, p.jsx)(aD, {
                impressionEvent: P
            }) : (0, p.jsx)(rG.Dialog, {
                open: null != r ? r : a,
                size: "Large",
                hasCloseAffordance: !!f,
                closeLabel: l("Action.Close"),
                isModal: !0,
                onOpenChange: f ? t => {
                    t || u(!1)
                } : void 0,
                children: (0, p.jsx)(rG.DialogContent, {
                    className: "width-full [&_p]:margin-none [&_h2]:margin-none",
                    onOpenAutoFocus: t => {
                        t.preventDefault()
                    },
                    children: (0, p.jsx)(rG.DialogBody, {
                        className: "flex flex-col height-[85vh] max-height-[800px]",
                        children: (0, p.jsx)(aA, {
                            onOpenChange: u,
                            children: t => {
                                let {
                                    header: n,
                                    body: r,
                                    ctas: i
                                } = t;
                                return (0, p.jsxs)("div", {
                                    className: "flex flex-col gap-large height-full min-height-0",
                                    children: [(0, p.jsx)(rG.DialogTitle, {
                                        className: "padding-none",
                                        children: n
                                    }), (0, p.jsxs)("div", {
                                        className: "grow-1 scroll-y min-height-0",
                                        children: [r, (0, p.jsx)("div", {
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
                                    }), (0, p.jsx)("div", {
                                        className: "shrink-0",
                                        children: i
                                    })]
                                })
                            }
                        })
                    })
                })
            })
        }, aI = new Z.QueryClient({
            defaultOptions: {
                queries: {
                    refetchOnWindowFocus: !1,
                    retry: !1,
                    refetchOnMount: !1,
                    staleTime: 6e4
                }
            }
        }), aL = function(t) {
            let {
                open: n,
                onClose: r
            } = t;
            return (0, p.jsx)(Y.QueryClientProvider, {
                client: aI,
                children: (0, p.jsx)(iW, {
                    enableIxp: !0,
                    children: (0, p.jsx)(ak, {
                        open: n,
                        onClose: r
                    })
                })
            })
        }, aN = t.i(894244), aM = t.i(839165);
    let aO = function() {
            let {
                translate: t
            } = (0, et.useTranslation)(), n = (0, nQ.useAuthentication)(), r = (0, D.useRouter)(), i = "https://usermoderation.".concat("roblox.com"), a = "https://apis.roblox.com", s = "https://".concat("roblox.com"), o = "CreatorHub", u = (0, A.useCallback)(t => {
                n3.default.logHostRoutedEvent({
                    eventType: t.eventName,
                    context: t.context,
                    properties: t.properties
                })
            }, []), l = (0, A.useCallback)(t => !!t.verificationCategory && ig.VerificationRedirectRendered, []), c = (0, A.useCallback)(async () => {
                let t = await (0, aN.getAuthorizationEndpoint)({
                    redirectUri: "https://create.roblox.com"
                });
                await n.logout(), await r.push(t)
            }, [r, n]), d = (0, A.useCallback)(() => {
                r.reload()
            }, [r]);
            return (0, A.useMemo)(() => ({
                translate: t,
                httpGet: aM.authenticatedHttpGet,
                httpPost: aM.authenticatedHttpPost,
                userModerationApiUrl: i,
                apiGatewayUrl: a,
                websiteUrl: s,
                sendAnalyticsEvent: u,
                platform: o,
                shouldShowGenericFallback: l,
                onLogout: c,
                onAccountReactivated: d
            }), [t, i, a, s, u, o, l, c, d])
        },
        aj = () => {
            let t = aO();
            return (0, p.jsx)(im, {
                config: t,
                children: (0, p.jsx)(aL, {})
            })
        },
        aF = (0, et.withTranslation)(() => {
            let {
                themeMode: t
            } = (0, nY.useThemeMode)();
            return (0, p.jsx)(n0.UIThemeProvider, {
                theme: t,
                children: (0, p.jsx)(aj, {})
            })
        }, [rF.TranslationNamespace.NotApproved, rF.TranslationNamespace.Moderation, rF.TranslationNamespace.AppealsPortal, rF.TranslationNamespace.CommonUIControls, rF.TranslationNamespace.Error, rF.TranslationNamespace.DashboardModeration]),
        aB = () => {
            let {
                status: t
            } = (0, nQ.useAuthentication)();
            return "moderated" === t ? (0, p.jsx)(aF, {}) : null
        };
    var aU = t.i(720808);
    let aG = (0, n9.default)(() => t.A(14667), {
            loadableGenerated: {
                modules: [573249]
            },
            ssr: !1
        }),
        aV = t => {
            let {
                children: n
            } = t;
            return (0, p.jsx)(aU.UniversalFeatureRestrictionsProvider, {
                Surface: aG,
                children: n
            })
        };
    var aH = t.i(336964);

    function aK(t) {
        return "object" == typeof t && null !== t && "Component" in t
    }

    function az(t) {
        var n;
        let {
            store: r
        } = t, i = null != r ? r : aH.dialogStore, {
            render: a,
            options: s,
            isOpen: o
        } = (0, A.useSyncExternalStore)(i.subscribe, i.getSnapshot, i.getSnapshot);
        if ((0, A.useEffect)(() => {
                if (o || null === s || !s.shouldUnmountOnClose) return;
                let t = setTimeout(() => i.clearContent(), 150);
                return () => clearTimeout(t)
            }, [o, s, i]), null === a) return null;
        if ((null == s ? void 0 : s.mode) === "standalone" && aK(a)) return (0, A.createElement)(a.Component, {
            ...a.props,
            open: o,
            onOpenChange: t => {
                t || i.close()
            }
        });
        let u = null != s ? s : aH.DEFAULT_RESOLVED_CONTENT_OPTIONS,
            l = aK(a) ? (0, A.createElement)(a.Component, a.props) : a;
        return (0, p.jsx)(rG.Dialog, {
            open: o,
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
    var aW = t.i(465698),
        aJ = t.i(209534);

    function aZ() {
        let {
            current: t
        } = (0, A.useSyncExternalStore)(aJ.snackbarStore.subscribe, aJ.snackbarStore.getSnapshot, aJ.snackbarStore.getSnapshot);
        return null === t ? null : (0, p.jsx)(aW.Snackbar, {
            ...t.props,
            onClose: () => aJ.snackbarStore.dismiss()
        }, t.id)
    }
    var aY = t.i(943758);
    let aQ = (0, A.createContext)({
        primarySidebarExpanded: !1,
        setPrimarySidebarExpanded: () => {
            throw Error("Function not implemented. You may be trying to use this context outside of a provider.")
        }
    });
    aQ.displayName = "LeftNavigationStateContext";
    let aX = t => {
        let {
            children: n
        } = t, [r, i] = (0, A.useState)(!0), a = (0, A.useMemo)(() => ({
            primarySidebarExpanded: r,
            setPrimarySidebarExpanded: i
        }), [r]);
        return (0, p.jsx)(aQ.Provider, {
            value: a,
            children: n
        })
    };
    var a$ = t.i(729904),
        a0 = t.i(486736),
        a1 = t.i(47033),
        a2 = t.i(199834),
        a4 = t.i(291037),
        a3 = t.i(649319),
        a5 = t.i(982234),
        a7 = t.i(196990),
        a8 = t.i(533968),
        a6 = t.i(210205);
    let a9 = {
            [a1.AgreementType.ChildrenPrivacyPolicy]: "Label.ChildrenPrivacyPolicy",
            [a1.AgreementType.ConsentFlow]: "Label.ConsentFlow",
            [a1.AgreementType.LuobuThirdPartyDataUse]: "Label.LuobuThirdPartyDataUse",
            [a1.AgreementType.PersonalInformationPolicy]: "Label.PersonalInformationPolicy",
            [a1.AgreementType.PrivacyPolicy]: "Label.PrivacyPolicy",
            [a1.AgreementType.RefundTerms]: "Label.RefundTerms",
            [a1.AgreementType.RiderTerms]: "Label.RiderTerms",
            [a1.AgreementType.TermsOfService]: "Label.TermsOfService"
        },
        se = ["/v1-studio-login"],
        st = (0, et.withTranslation)(() => {
            let t = (0, D.useRouter)(),
                {
                    translate: n
                } = (0, et.useTranslation)(),
                {
                    user: r,
                    logout: i
                } = (0, nQ.useAuthentication)(),
                a = (0, A.useRef)(!1),
                {
                    captureError: s,
                    error: o,
                    info: u
                } = (0, a6.useMetricsMonitoring)(),
                [l, c] = (0, A.useState)(!1),
                [d, h] = (0, A.useState)(!1),
                [f, v] = (0, A.useState)([]),
                m = (0, A.useCallback)(async t => {
                    async function n(t, r) {
                        if (r <= 0) return void o("User Agreement accept failed after retried ".concat(3, " times"));
                        try {
                            var i;
                            let a = null == (i = (await a7.userAgreementsClient.acceptUserAgreements(t)).results) ? void 0 : i.reduce((t, n) => 0 !== n.errorCode ? [...t, n.agreementId] : t, []);
                            a && a.length > 0 && await n(a, r - 1)
                        } catch (a) {
                            let i = (0, a8.getResponseFromError)(a);
                            (null == i ? void 0 : i.status) === rI.StatusCodes.UNAUTHORIZED ? (u("User Agreement accept failed with 401 from backend"), await D.default.push("/login")) : (o("User Agreement accept failed with status code ".concat(null == i ? void 0 : i.status)), await n(t, r - 1))
                        }
                    }
                    await n(t, 3)
                }, [o, u]),
                y = (0, A.useCallback)(async () => {
                    try {
                        await i()
                    } catch (t) {
                        t instanceof Error && s(t), o("Logout after user reject update agreements failed")
                    } finally {
                        c(!1)
                    }
                }, [s, o, i]),
                g = (0, A.useCallback)(async () => {
                    let t = f.map(t => t.id);
                    h(!0), await m(t), h(!1), c(!1)
                }, [m, f]),
                w = (0, A.useCallback)(async () => {
                    try {
                        let t = a7.userAgreementsClient.getUserAgreements({
                                clientType: a1.ClientType.Studio
                            }),
                            n = await t;
                        n.length > 0 && (v([...n]), c(!0))
                    } catch (t) {
                        o("Fetch update user-agreements failed"), t instanceof Error && s(t)
                    }
                }, [s, o]);
            return (0, A.useEffect)(() => {
                (null == r ? void 0 : r.id) === void 0 || a.current || !t.isReady || se.some(n => t.pathname.startsWith(n)) || (w(), a.current = !0)
            }, [r, w, t.isReady, t.pathname]), (0, p.jsx)(a4.Dialog, {
                open: l,
                children: (0, p.jsx)(a3.DialogTemplate, {
                    onConfirm: g,
                    onCancel: y,
                    title: n("Heading.AgreementsUpdate"),
                    content: (0, p.jsxs)(p.Fragment, {
                        children: [(0, p.jsx)(a2.Typography, {
                            component: "p",
                            variant: "body1",
                            children: n("Description.AgreementsUpdate")
                        }), (0, p.jsx)("ul", {
                            children: f.map(t => {
                                var r;
                                let i;
                                return (0, p.jsx)("li", {
                                    children: (0, p.jsx)(a5.Link, {
                                        href: t.displayUrl,
                                        target: "__blank",
                                        children: (r = t.agreementType, void 0 === (i = a9[r]) ? n(i) : r)
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
        }, [rF.TranslationNamespace.AgreementsUpdate]),
        {
            authenticationApi: sn
        } = {
            authenticationApi: nH
        },
        {
            discoveryApi: sr
        } = nu.ApplicationAuthorizationsClient,
        {
            usersApi: si
        } = nK.UsersClient,
        sa = (n = n3.default, t => {
            var r, i, a, s, o, u, l, c, d;
            let h, f;
            return n.logWebVitalsEvent({
                eventName: "webVitals",
                parameters: {
                    metricName: t.name,
                    metricStartTime: String(t.startTime),
                    metricValue: String(t.value),
                    metricLabel: t.label,
                    ...ns || (ns = {
                        staticAsset: void 0 === (h = null == (o = performance) || null == (s = o.getEntriesByType) || null == (a = s.call(o, "resource")) || null == (i = a.find) || null == (r = i.call(a, t => {
                            let {
                                initiatorType: n,
                                name: r
                            } = t;
                            return "script" === n && r.includes("_next/static/chunks/")
                        })) ? void 0 : r.transferSize) ? "unknown" : 0 === h ? "cached" : "network",
                        serviceWorker: (null == (u = navigator) ? void 0 : u.serviceWorker) ? navigator.serviceWorker.controller ? "controlled" : "uncontrolled" : "unsupported",
                        pageLoad: void 0 === (f = null == (d = performance) || null == (c = d.getEntriesByType) || null == (l = c.call(d, "navigation")[0]) ? void 0 : l.transferSize) ? "unknown" : 0 === f ? "cached" : "network"
                    })
                }
            })
        }),
        ss = (t2 && (d = null != (l = document.querySelector('meta[name="'.concat("emotion-insertion-point-mui", '"]'))) ? l : void 0, h = null != (c = document.querySelector('meta[name="'.concat("emotion-insertion-point-tss", '"]'))) ? c : void 0), {
            muiCache: (0, ei.c)({
                key: t0,
                prepend: !0,
                insertionPoint: d
            }),
            tssCache: (0, ei.c)({
                key: t1,
                insertionPoint: h
            })
        });
    (0, en.createThumbnailsClient)((0, nz.getBEDEV1ServiceBasePath)("thumbnails"));
    let so = {
            locale: rk.defaultLocale,
            nativeName: rk.defaultNativeName
        },
        su = new rD.TranslationResourceProvider(so, rk.fallbackLocale),
        sl = t => {
            let {
                children: n,
                universeId: r
            } = t;
            return ! function(t) {
                let n = (0, n8.useCustomDashboardService)(),
                    r = (0, Y.useQueryClient)(),
                    {
                        ready: i,
                        value: a
                    } = (0, n5.useFlag)(n7.isCustomDashboardsEnabled, {
                        universeId: t
                    });
                (0, A.useEffect)(() => {
                    if (i && a) return n.subscribe(t => {
                        if ("external" === t.eventType) return void r.invalidateQueries({
                            queryKey: n6.customDashboardQueryKeys.universe(t.universeId)
                        });
                        if ("pin" === t.eventType || "unpin" === t.eventType) {
                            r.invalidateQueries({
                                queryKey: n6.customDashboardQueryKeys.list(t.universeId),
                                refetchType: "none"
                            }), r.invalidateQueries({
                                queryKey: n6.customDashboardQueryKeys.detail(t.universeId, t.dashboardId)
                            });
                            return
                        }
                        r.invalidateQueries({
                            queryKey: n6.customDashboardQueryKeys.list(t.universeId)
                        }), r.invalidateQueries({
                            queryKey: n6.customDashboardQueryKeys.suggestedName(t.universeId)
                        }), r.invalidateQueries({
                            queryKey: n6.customDashboardQueryKeys.detail(t.universeId, t.dashboardId)
                        })
                    })
                }, [a, i, n, r])
            }(r), (0, p.jsx)(p.Fragment, {
                children: n
            })
        },
        sc = {
            defaultLocale: rk.defaultLocale,
            title: rk.defaultMetadataJson["OpenGraph.Title"],
            description: rk.defaultMetadataJson["OpenGraph.Description"]
        },
        sd = t => t,
        sh = () => ((() => {
            let {
                trackerClient: t
            } = (0, n2.useEventTrackerProvider)(), n = (0, A.useCallback)(() => {
                let n = (0, rE.loadPageEventModel)();
                t.sendEvent(n)
            }, [t]);
            (0, rq.default)(void 0, n), (0, A.useEffect)(() => n(), [n]), (0, A.useEffect)(() => {
                n3.default.trackPageLoad()
            }, [])
        })(), (0, k.useReportWebVitals)(sa), null),
        sf = t => {
            let {
                children: n
            } = t, {
                settings: r,
                isFetched: i
            } = (0, a0.useSettings)();
            return (0, p.jsx)(ee.NavigationConfigsProvider, {
                currentProduct: "CreatorDashboard",
                environment: (0, a$.default)(),
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
        sp = new Z.QueryClient({
            defaultOptions: {
                queries: {
                    refetchOnWindowFocus: !1,
                    retry: !1
                }
            }
        }),
        sv = (0, Q.initializeAuthStore)(),
        sm = t => {
            var n;
            let {
                Component: r,
                pageProps: i,
                cache: a
            } = t, {
                query: s
            } = (0, D.useRouter)(), o = "string" == typeof s.id ? Number(s.id) : 0, u = null != (n = r.getPageLayout) ? n : sd, l = (0, A.useMemo)(() => ({
                ...sc,
                ...r.pageMetadata
            }), [r.pageMetadata]);
            return (0, $.useMaintenanceObserver)("https://create.roblox.com"), (0, A.useEffect)(() => {
                t4()
            }, []), n4.default.setUnifiedLoggerClient(n3.default), (0, p.jsx)(J, {
                children: (0, p.jsx)(t3, {
                    cache: null != a ? a : ss,
                    children: (0, p.jsxs)(rT, {
                        providers: [(0, p.jsx)(aY.BreadcrumbItemNameProvider, {}), (0, p.jsx)(Y.QueryClientProvider, {
                            client: sp
                        }), (0, p.jsx)(n8.CustomDashboardServiceProvider, {}), (0, p.jsx)(n8.UniverseFlaggedCustomDashboardProvider, {}), (0, p.jsx)(sl, {
                            universeId: o
                        }), (0, p.jsx)(rA, {
                            pageLoggerConfig: r.loggerConfig
                        }), (0, p.jsx)(n2.EventTrackerProvider, {
                            trackerClient: n4.default
                        }), (0, p.jsx)(Q.RobloxAuthenticationProvider, {
                            clientId: "4273917941353191905",
                            authenticationClient: sn,
                            discoveryClient: sr,
                            usersClient: si,
                            store: sv
                        }), (0, p.jsx)(rb.GroupsProvider, {}), (0, p.jsx)(nX, {}), (0, p.jsx)(n1, {
                            themeElement: "u" > typeof document ? document.documentElement : void 0
                        }), (0, p.jsx)(et.LocalizationProvider, {
                            provider: su
                        }), (0, p.jsx)(t5.SnackbarProvider, {}), (0, p.jsx)(t7.DialogProvider, {}), (0, p.jsx)(n$.default, {}), (0, p.jsx)(en.ThumbnailsProvider, {
                            baseUrl: n4.eventStreamBaseUrl
                        }), (0, p.jsx)(a0.SettingsProvider, {}), (0, p.jsx)(sf, {}), (0, p.jsx)(rR.ThemeAwareStudioResourcesProvider, {}), (0, p.jsx)(rM, {}), (0, p.jsx)(rS.default, {}), (0, p.jsx)(aX, {}), (0, p.jsx)(X.CookieConsentProvider, {
                            robloxSiteDomain: "roblox.com"
                        }), (0, p.jsx)(no.AgeVerificationUpsellProvider, {}), (0, p.jsx)(aV, {})],
                        children: [(0, p.jsx)(sh, {}), (0, p.jsx)(nZ, {
                            provider: su
                        }), (0, p.jsx)(aZ, {}), (0, p.jsx)(az, {}), (0, p.jsx)(aB, {}), (0, p.jsx)(st, {}), (0, p.jsx)(rP, {}), (0, p.jsx)(rU, {
                            openGraphMetadata: l
                        }), u((0, p.jsx)(r, {
                            ...i
                        }), {
                            query: s
                        })]
                    })
                })
            })
        };
    t.s(["CustomApp", 0, sm, "default", 0, sm, "reportWebVitals", 0, sa], 656350)
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
                return q
            },
            FCPThresholds: function() {
                return R
            },
            FIDThresholds: function() {
                return et
            },
            INPThresholds: function() {
                return U
            },
            LCPThresholds: function() {
                return V
            },
            TTFBThresholds: function() {
                return z
            },
            onCLS: function() {
                return C
            },
            onFCP: function() {
                return E
            },
            onFID: function() {
                return en
            },
            onINP: function() {
                return G
            },
            onLCP: function() {
                return K
            },
            onTTFB: function() {
                return J
            }
        });
        var i, a, s, o, u, l = -1,
            c = function(t) {
                addEventListener("pageshow", function(n) {
                    n.persisted && (l = n.timeStamp, t(n))
                }, !0)
            },
            d = function() {
                var t = self.performance && performance.getEntriesByType && performance.getEntriesByType("navigation")[0];
                if (t && t.responseStart > 0 && t.responseStart < performance.now()) return t
            },
            h = function() {
                var t = d();
                return t && t.activationStart || 0
            },
            f = function(t, n) {
                var r = d(),
                    i = "navigate";
                return l >= 0 ? i = "back-forward-cache" : r && (document.prerendering || h() > 0 ? i = "prerender" : document.wasDiscarded ? i = "restore" : r.type && (i = r.type.replace(/_/g, "-"))), {
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
                var a, s;
                return function(o) {
                    var u;
                    n.value >= 0 && (o || i) && ((s = n.value - (a || 0)) || void 0 === a) && (a = n.value, n.delta = s, u = n.value, n.rating = u > r[1] ? "poor" : u > r[0] ? "needs-improvement" : "good", t(n))
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
            w = -1,
            b = function() {
                return "hidden" !== document.visibilityState || document.prerendering ? 1 / 0 : 0
            },
            _ = function(t) {
                "hidden" === document.visibilityState && w > -1 && (w = "visibilitychange" === t.type ? t.timeStamp : 0, P())
            },
            x = function() {
                addEventListener("visibilitychange", _, !0), addEventListener("prerenderingchange", _, !0)
            },
            P = function() {
                removeEventListener("visibilitychange", _, !0), removeEventListener("prerenderingchange", _, !0)
            },
            S = function() {
                return w < 0 && (w = b(), x(), c(function() {
                    setTimeout(function() {
                        w = b(), x()
                    }, 0)
                })), {
                    get firstHiddenTime() {
                        return w
                    }
                }
            },
            T = function(t) {
                document.prerendering ? addEventListener("prerenderingchange", function() {
                    return t()
                }, !0) : t()
            },
            R = [1800, 3e3],
            E = function(t, n) {
                n = n || {}, T(function() {
                    var r, i = S(),
                        a = f("FCP"),
                        s = p("paint", function(t) {
                            t.forEach(function(t) {
                                "first-contentful-paint" === t.name && (s.disconnect(), t.startTime < i.firstHiddenTime && (a.value = Math.max(t.startTime - h(), 0), a.entries.push(t), r(!0)))
                            })
                        });
                    s && (r = v(t, a, R, n.reportAllChanges), c(function(i) {
                        r = v(t, a = f("FCP"), R, n.reportAllChanges), m(function() {
                            a.value = performance.now() - i.timeStamp, r(!0)
                        })
                    }))
                })
            },
            q = [.1, .25],
            C = function(t, n) {
                n = n || {}, E(g(function() {
                    var r, i = f("CLS", 0),
                        a = 0,
                        s = [],
                        o = function(t) {
                            t.forEach(function(t) {
                                if (!t.hadRecentInput) {
                                    var n = s[0],
                                        r = s[s.length - 1];
                                    a && t.startTime - r.startTime < 1e3 && t.startTime - n.startTime < 5e3 ? (a += t.value, s.push(t)) : (a = t.value, s = [t])
                                }
                            }), a > i.value && (i.value = a, i.entries = s, r())
                        },
                        u = p("layout-shift", o);
                    u && (r = v(t, i, q, n.reportAllChanges), y(function() {
                        o(u.takeRecords()), r(!0)
                    }), c(function() {
                        a = 0, r = v(t, i = f("CLS", 0), q, n.reportAllChanges), m(function() {
                            return r()
                        })
                    }), setTimeout(r, 0))
                }))
            },
            A = 0,
            D = 1 / 0,
            k = 0,
            I = function(t) {
                t.forEach(function(t) {
                    t.interactionId && (D = Math.min(D, t.interactionId), A = (k = Math.max(k, t.interactionId)) ? (k - D) / 7 + 1 : 0)
                })
            },
            L = function() {
                "interactionCount" in performance || i || (i = p("event", I, {
                    type: "event",
                    buffered: !0,
                    durationThreshold: 0
                }))
            },
            N = [],
            M = new Map,
            O = 0,
            j = [],
            F = function(t) {
                if (j.forEach(function(n) {
                        return n(t)
                    }), t.interactionId || "first-input" === t.entryType) {
                    var n = N[N.length - 1],
                        r = M.get(t.interactionId);
                    if (r || N.length < 10 || t.duration > n.latency) {
                        if (r) t.duration > r.latency ? (r.entries = [t], r.latency = t.duration) : t.duration === r.latency && t.startTime === r.entries[0].startTime && r.entries.push(t);
                        else {
                            var i = {
                                id: t.interactionId,
                                latency: t.duration,
                                entries: [t]
                            };
                            M.set(i.id, i), N.push(i)
                        }
                        N.sort(function(t, n) {
                            return n.latency - t.latency
                        }), N.length > 10 && N.splice(10).forEach(function(t) {
                            return M.delete(t.id)
                        })
                    }
                }
            },
            B = function(t) {
                var n = self.requestIdleCallback || self.setTimeout,
                    r = -1;
                return t = g(t), "hidden" === document.visibilityState ? t() : (r = n(t), y(t)), r
            },
            U = [200, 500],
            G = function(t, n) {
                "PerformanceEventTiming" in self && "interactionId" in PerformanceEventTiming.prototype && (n = n || {}, T(function() {
                    L();
                    var r, a, s = f("INP"),
                        o = function(t) {
                            B(function() {
                                t.forEach(F);
                                var n, r = (n = Math.min(N.length - 1, Math.floor(((i ? A : performance.interactionCount || 0) - O) / 50)), N[n]);
                                r && r.latency !== s.value && (s.value = r.latency, s.entries = r.entries, a())
                            })
                        },
                        u = p("event", o, {
                            durationThreshold: null != (r = n.durationThreshold) ? r : 40
                        });
                    a = v(t, s, U, n.reportAllChanges), u && (u.observe({
                        type: "first-input",
                        buffered: !0
                    }), y(function() {
                        o(u.takeRecords()), a(!0)
                    }), c(function() {
                        O = 0, N.length = 0, M.clear(), a = v(t, s = f("INP"), U, n.reportAllChanges)
                    }))
                }))
            },
            V = [2500, 4e3],
            H = {},
            K = function(t, n) {
                n = n || {}, T(function() {
                    var r, i = S(),
                        a = f("LCP"),
                        s = function(t) {
                            n.reportAllChanges || (t = t.slice(-1)), t.forEach(function(t) {
                                t.startTime < i.firstHiddenTime && (a.value = Math.max(t.startTime - h(), 0), a.entries = [t], r())
                            })
                        },
                        o = p("largest-contentful-paint", s);
                    if (o) {
                        r = v(t, a, V, n.reportAllChanges);
                        var u = g(function() {
                            H[a.id] || (s(o.takeRecords()), o.disconnect(), H[a.id] = !0, r(!0))
                        });
                        ["keydown", "click"].forEach(function(t) {
                            addEventListener(t, function() {
                                return B(u)
                            }, !0)
                        }), y(u), c(function(i) {
                            r = v(t, a = f("LCP"), V, n.reportAllChanges), m(function() {
                                a.value = performance.now() - i.timeStamp, H[a.id] = !0, r(!0)
                            })
                        })
                    }
                })
            },
            z = [800, 1800],
            W = function t(n) {
                document.prerendering ? T(function() {
                    return t(n)
                }) : "complete" !== document.readyState ? addEventListener("load", function() {
                    return t(n)
                }, !0) : setTimeout(n, 0)
            },
            J = function(t, n) {
                n = n || {};
                var r = f("TTFB"),
                    i = v(t, r, z, n.reportAllChanges);
                W(function() {
                    var a = d();
                    a && (r.value = Math.max(a.responseStart - h(), 0), r.entries = [a], i(!0), c(function() {
                        (i = v(t, r = f("TTFB", 0), z, n.reportAllChanges))(!0)
                    }))
                })
            },
            Z = {
                passive: !0,
                capture: !0
            },
            Y = new Date,
            Q = function(t, n) {
                a || (a = n, s = t, o = new Date, ee(removeEventListener), X())
            },
            X = function() {
                if (s >= 0 && s < o - Y) {
                    var t = {
                        entryType: "first-input",
                        name: a.type,
                        target: a.target,
                        cancelable: a.cancelable,
                        startTime: a.timeStamp,
                        processingStart: a.timeStamp + s
                    };
                    u.forEach(function(n) {
                        n(t)
                    }), u = []
                }
            },
            $ = function(t) {
                if (t.cancelable) {
                    var n, r, i, a = (t.timeStamp > 1e12 ? new Date : performance.now()) - t.timeStamp;
                    "pointerdown" == t.type ? (n = function() {
                        Q(a, t), i()
                    }, r = function() {
                        i()
                    }, i = function() {
                        removeEventListener("pointerup", n, Z), removeEventListener("pointercancel", r, Z)
                    }, addEventListener("pointerup", n, Z), addEventListener("pointercancel", r, Z)) : Q(a, t)
                }
            },
            ee = function(t) {
                ["mousedown", "keydown", "touchstart", "pointerdown"].forEach(function(n) {
                    return t(n, $, Z)
                })
            },
            et = [100, 300],
            en = function(t, n) {
                n = n || {}, T(function() {
                    var r, i = S(),
                        o = f("FID"),
                        l = function(t) {
                            t.startTime < i.firstHiddenTime && (o.value = t.processingStart - t.startTime, o.entries.push(t), r(!0))
                        },
                        d = function(t) {
                            t.forEach(l)
                        },
                        h = p("first-input", d);
                    r = v(t, o, et, n.reportAllChanges), h && (y(g(function() {
                        d(h.takeRecords()), h.disconnect()
                    })), c(function() {
                        r = v(t, o = f("FID"), et, n.reportAllChanges), u = [], s = -1, a = null, ee(addEventListener), u.push(l), X()
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
            return s
        }
    });
    let i = t.r(416340),
        a = t.r(482711);

    function s(t) {
        (0, i.useEffect)(() => {
            (0, a.onCLS)(t), (0, a.onFID)(t), (0, a.onLCP)(t), (0, a.onINP)(t), (0, a.onFCP)(t), (0, a.onTTFB)(t)
        }, [t])
    }("function" == typeof r.default || "object" == typeof r.default && null !== r.default) && void 0 === r.default.__esModule && (Object.defineProperty(r.default, "__esModule", {
        value: !0
    }), Object.assign(r.default, r), n.exports = r.default)
}, 68794, (t, n, r) => {
    n.exports = t.r(959610)
}, 274466, t => {
    "use strict";
    var n = function(t, r) {
        return (n = Object.setPrototypeOf || ({
            __proto__: []
        }) instanceof Array && function(t, n) {
            t.__proto__ = n
        } || function(t, n) {
            for (var r in n) Object.prototype.hasOwnProperty.call(n, r) && (t[r] = n[r])
        })(t, r)
    };

    function r(t, r) {
        if ("function" != typeof r && null !== r) throw TypeError("Class extends value " + String(r) + " is not a constructor or null");

        function i() {
            this.constructor = t
        }
        n(t, r), t.prototype = null === r ? Object.create(r) : (i.prototype = r.prototype, new i)
    }
    var i = function() {
        return (i = Object.assign || function(t) {
            for (var n, r = 1, i = arguments.length; r < i; r++)
                for (var a in n = arguments[r]) Object.prototype.hasOwnProperty.call(n, a) && (t[a] = n[a]);
            return t
        }).apply(this, arguments)
    };

    function a(t, n) {
        var r = {};
        for (var i in t) Object.prototype.hasOwnProperty.call(t, i) && 0 > n.indexOf(i) && (r[i] = t[i]);
        if (null != t && "function" == typeof Object.getOwnPropertySymbols)
            for (var a = 0, i = Object.getOwnPropertySymbols(t); a < i.length; a++) 0 > n.indexOf(i[a]) && Object.prototype.propertyIsEnumerable.call(t, i[a]) && (r[i[a]] = t[i[a]]);
        return r
    }

    function s(t, n, r, i) {
        var a, s = arguments.length,
            o = s < 3 ? n : null === i ? i = Object.getOwnPropertyDescriptor(n, r) : i;
        if ("object" == typeof Reflect && "function" == typeof Reflect.decorate) o = Reflect.decorate(t, n, r, i);
        else
            for (var u = t.length - 1; u >= 0; u--)(a = t[u]) && (o = (s < 3 ? a(o) : s > 3 ? a(n, r, o) : a(n, r)) || o);
        return s > 3 && o && Object.defineProperty(n, r, o), o
    }

    function o(t, n) {
        return function(r, i) {
            n(r, i, t)
        }
    }

    function u(t, n, r, i, a, s) {
        function o(t) {
            if (void 0 !== t && "function" != typeof t) throw TypeError("Function expected");
            return t
        }
        for (var u, l = i.kind, c = "getter" === l ? "get" : "setter" === l ? "set" : "value", d = !n && t ? i.static ? t : t.prototype : null, h = n || (d ? Object.getOwnPropertyDescriptor(d, i.name) : {}), f = !1, p = r.length - 1; p >= 0; p--) {
            var v = {};
            for (var m in i) v[m] = "access" === m ? {} : i[m];
            for (var m in i.access) v.access[m] = i.access[m];
            v.addInitializer = function(t) {
                if (f) throw TypeError("Cannot add initializers after decoration has completed");
                s.push(o(t || null))
            };
            var y = (0, r[p])("accessor" === l ? {
                get: h.get,
                set: h.set
            } : h[c], v);
            if ("accessor" === l) {
                if (void 0 === y) continue;
                if (null === y || "object" != typeof y) throw TypeError("Object expected");
                (u = o(y.get)) && (h.get = u), (u = o(y.set)) && (h.set = u), (u = o(y.init)) && a.unshift(u)
            } else(u = o(y)) && ("field" === l ? a.unshift(u) : h[c] = u)
        }
        d && Object.defineProperty(d, i.name, h), f = !0
    }

    function l(t, n, r) {
        for (var i = arguments.length > 2, a = 0; a < n.length; a++) r = i ? n[a].call(t, r) : n[a].call(t);
        return i ? r : void 0
    }

    function c(t) {
        return "symbol" == typeof t ? t : "".concat(t)
    }

    function d(t, n, r) {
        return "symbol" == typeof n && (n = n.description ? "[".concat(n.description, "]") : ""), Object.defineProperty(t, "name", {
            configurable: !0,
            value: r ? "".concat(r, " ", n) : n
        })
    }

    function h(t, n) {
        if ("object" == typeof Reflect && "function" == typeof Reflect.metadata) return Reflect.metadata(t, n)
    }

    function f(t, n, r, i) {
        return new(r || (r = Promise))(function(a, s) {
            function o(t) {
                try {
                    l(i.next(t))
                } catch (t) {
                    s(t)
                }
            }

            function u(t) {
                try {
                    l(i.throw(t))
                } catch (t) {
                    s(t)
                }
            }

            function l(t) {
                var n;
                t.done ? a(t.value) : ((n = t.value) instanceof r ? n : new r(function(t) {
                    t(n)
                })).then(o, u)
            }
            l((i = i.apply(t, n || [])).next())
        })
    }

    function p(t, n) {
        var r, i, a, s = {
                label: 0,
                sent: function() {
                    if (1 & a[0]) throw a[1];
                    return a[1]
                },
                trys: [],
                ops: []
            },
            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return o.next = u(0), o.throw = u(1), o.return = u(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
            return this
        }), o;

        function u(u) {
            return function(l) {
                var c = [u, l];
                if (r) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, c[0] && (s = 0)), s;) try {
                    if (r = 1, i && (a = 2 & c[0] ? i.return : c[0] ? i.throw || ((a = i.return) && a.call(i), 0) : i.next) && !(a = a.call(i, c[1])).done) return a;
                    switch (i = 0, a && (c = [2 & c[0], a.value]), c[0]) {
                        case 0:
                        case 1:
                            a = c;
                            break;
                        case 4:
                            return s.label++, {
                                value: c[1],
                                done: !1
                            };
                        case 5:
                            s.label++, i = c[1], c = [0];
                            continue;
                        case 7:
                            c = s.ops.pop(), s.trys.pop();
                            continue;
                        default:
                            if (!(a = (a = s.trys).length > 0 && a[a.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                s = 0;
                                continue
                            }
                            if (3 === c[0] && (!a || c[1] > a[0] && c[1] < a[3])) {
                                s.label = c[1];
                                break
                            }
                            if (6 === c[0] && s.label < a[1]) {
                                s.label = a[1], a = c;
                                break
                            }
                            if (a && s.label < a[2]) {
                                s.label = a[2], s.ops.push(c);
                                break
                            }
                            a[2] && s.ops.pop(), s.trys.pop();
                            continue
                    }
                    c = n.call(t, s)
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
    var v = Object.create ? function(t, n, r, i) {
        void 0 === i && (i = r);
        var a = Object.getOwnPropertyDescriptor(n, r);
        (!a || ("get" in a ? !n.__esModule : a.writable || a.configurable)) && (a = {
            enumerable: !0,
            get: function() {
                return n[r]
            }
        }), Object.defineProperty(t, i, a)
    } : function(t, n, r, i) {
        void 0 === i && (i = r), t[i] = n[r]
    };

    function m(t, n) {
        for (var r in t) "default" === r || Object.prototype.hasOwnProperty.call(n, r) || v(n, t, r)
    }

    function y(t) {
        var n = "function" == typeof Symbol && Symbol.iterator,
            r = n && t[n],
            i = 0;
        if (r) return r.call(t);
        if (t && "number" == typeof t.length) return {
            next: function() {
                return t && i >= t.length && (t = void 0), {
                    value: t && t[i++],
                    done: !t
                }
            }
        };
        throw TypeError(n ? "Object is not iterable." : "Symbol.iterator is not defined.")
    }

    function g(t, n) {
        var r = "function" == typeof Symbol && t[Symbol.iterator];
        if (!r) return t;
        var i, a, s = r.call(t),
            o = [];
        try {
            for (;
                (void 0 === n || n-- > 0) && !(i = s.next()).done;) o.push(i.value)
        } catch (t) {
            a = {
                error: t
            }
        } finally {
            try {
                i && !i.done && (r = s.return) && r.call(s)
            } finally {
                if (a) throw a.error
            }
        }
        return o
    }

    function w() {
        for (var t = [], n = 0; n < arguments.length; n++) t = t.concat(g(arguments[n]));
        return t
    }

    function b() {
        for (var t = 0, n = 0, r = arguments.length; n < r; n++) t += arguments[n].length;
        for (var i = Array(t), a = 0, n = 0; n < r; n++)
            for (var s = arguments[n], o = 0, u = s.length; o < u; o++, a++) i[a] = s[o];
        return i
    }

    function _(t, n, r) {
        if (r || 2 == arguments.length)
            for (var i, a = 0, s = n.length; a < s; a++) !i && a in n || (i || (i = Array.prototype.slice.call(n, 0, a)), i[a] = n[a]);
        return t.concat(i || Array.prototype.slice.call(n))
    }

    function x(t) {
        return this instanceof x ? (this.v = t, this) : new x(t)
    }

    function P(t, n, r) {
        if (!Symbol.asyncIterator) throw TypeError("Symbol.asyncIterator is not defined.");
        var i, a = r.apply(t, n || []),
            s = [];
        return i = Object.create(("function" == typeof AsyncIterator ? AsyncIterator : Object).prototype), o("next"), o("throw"), o("return", function(t) {
            return function(n) {
                return Promise.resolve(n).then(t, c)
            }
        }), i[Symbol.asyncIterator] = function() {
            return this
        }, i;

        function o(t, n) {
            a[t] && (i[t] = function(n) {
                return new Promise(function(r, i) {
                    s.push([t, n, r, i]) > 1 || u(t, n)
                })
            }, n && (i[t] = n(i[t])))
        }

        function u(t, n) {
            try {
                var r;
                (r = a[t](n)).value instanceof x ? Promise.resolve(r.value.v).then(l, c) : d(s[0][2], r)
            } catch (t) {
                d(s[0][3], t)
            }
        }

        function l(t) {
            u("next", t)
        }

        function c(t) {
            u("throw", t)
        }

        function d(t, n) {
            t(n), s.shift(), s.length && u(s[0][0], s[0][1])
        }
    }

    function S(t) {
        var n, r;
        return n = {}, i("next"), i("throw", function(t) {
            throw t
        }), i("return"), n[Symbol.iterator] = function() {
            return this
        }, n;

        function i(i, a) {
            n[i] = t[i] ? function(n) {
                return (r = !r) ? {
                    value: x(t[i](n)),
                    done: !1
                } : a ? a(n) : n
            } : a
        }
    }

    function T(t) {
        if (!Symbol.asyncIterator) throw TypeError("Symbol.asyncIterator is not defined.");
        var n, r = t[Symbol.asyncIterator];
        return r ? r.call(t) : (t = y(t), n = {}, i("next"), i("throw"), i("return"), n[Symbol.asyncIterator] = function() {
            return this
        }, n);

        function i(r) {
            n[r] = t[r] && function(n) {
                return new Promise(function(i, a) {
                    var s, o, u;
                    s = i, o = a, u = (n = t[r](n)).done, Promise.resolve(n.value).then(function(t) {
                        s({
                            value: t,
                            done: u
                        })
                    }, o)
                })
            }
        }
    }

    function R(t, n) {
        return Object.defineProperty ? Object.defineProperty(t, "raw", {
            value: n
        }) : t.raw = n, t
    }
    var E = Object.create ? function(t, n) {
            Object.defineProperty(t, "default", {
                enumerable: !0,
                value: n
            })
        } : function(t, n) {
            t.default = n
        },
        q = function(t) {
            return (q = Object.getOwnPropertyNames || function(t) {
                var n = [];
                for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (n[n.length] = r);
                return n
            })(t)
        };

    function C(t) {
        if (t && t.__esModule) return t;
        var n = {};
        if (null != t)
            for (var r = q(t), i = 0; i < r.length; i++) "default" !== r[i] && v(n, t, r[i]);
        return E(n, t), n
    }

    function A(t) {
        return t && t.__esModule ? t : {
            default: t
        }
    }

    function D(t, n, r, i) {
        if ("a" === r && !i) throw TypeError("Private accessor was defined without a getter");
        if ("function" == typeof n ? t !== n || !i : !n.has(t)) throw TypeError("Cannot read private member from an object whose class did not declare it");
        return "m" === r ? i : "a" === r ? i.call(t) : i ? i.value : n.get(t)
    }

    function k(t, n, r, i, a) {
        if ("m" === i) throw TypeError("Private method is not writable");
        if ("a" === i && !a) throw TypeError("Private accessor was defined without a setter");
        if ("function" == typeof n ? t !== n || !a : !n.has(t)) throw TypeError("Cannot write private member to an object whose class did not declare it");
        return "a" === i ? a.call(t, r) : a ? a.value = r : n.set(t, r), r
    }

    function I(t, n) {
        if (null === n || "object" != typeof n && "function" != typeof n) throw TypeError("Cannot use 'in' operator on non-object");
        return "function" == typeof t ? n === t : t.has(n)
    }

    function L(t, n, r) {
        if (null != n) {
            var i, a;
            if ("object" != typeof n && "function" != typeof n) throw TypeError("Object expected.");
            if (r) {
                if (!Symbol.asyncDispose) throw TypeError("Symbol.asyncDispose is not defined.");
                i = n[Symbol.asyncDispose]
            }
            if (void 0 === i) {
                if (!Symbol.dispose) throw TypeError("Symbol.dispose is not defined.");
                i = n[Symbol.dispose], r && (a = i)
            }
            if ("function" != typeof i) throw TypeError("Object not disposable.");
            a && (i = function() {
                try {
                    a.call(this)
                } catch (t) {
                    return Promise.reject(t)
                }
            }), t.stack.push({
                value: n,
                dispose: i,
                async: r
            })
        } else r && t.stack.push({
            async: !0
        });
        return n
    }
    var N = "function" == typeof SuppressedError ? SuppressedError : function(t, n, r) {
        var i = Error(r);
        return i.name = "SuppressedError", i.error = t, i.suppressed = n, i
    };

    function M(t) {
        function n(n) {
            t.error = t.hasError ? new N(n, t.error, "An error was suppressed during disposal.") : n, t.hasError = !0
        }
        var r, i = 0;
        return function a() {
            for (; r = t.stack.pop();) try {
                if (!r.async && 1 === i) return i = 0, t.stack.push(r), Promise.resolve().then(a);
                if (r.dispose) {
                    var s = r.dispose.call(r.value);
                    if (r.async) return i |= 2, Promise.resolve(s).then(a, function(t) {
                        return n(t), a()
                    })
                } else i |= 1
            } catch (t) {
                n(t)
            }
            if (1 === i) return t.hasError ? Promise.reject(t.error) : Promise.resolve();
            if (t.hasError) throw t.error
        }()
    }

    function O(t, n) {
        return "string" == typeof t && /^\.\.?\//.test(t) ? t.replace(/\.(tsx)$|((?:\.d)?)((?:\.[^./]+?)?)\.([cm]?)ts$/i, function(t, r, i, a, s) {
            return r ? n ? ".jsx" : ".js" : !i || a && s ? i + a + "." + s.toLowerCase() + "js" : t
        }) : t
    }
    let j = {
        __extends: r,
        __assign: i,
        __rest: a,
        __decorate: s,
        __param: o,
        __esDecorate: u,
        __runInitializers: l,
        __propKey: c,
        __setFunctionName: d,
        __metadata: h,
        __awaiter: f,
        __generator: p,
        __createBinding: v,
        __exportStar: m,
        __values: y,
        __read: g,
        __spread: w,
        __spreadArrays: b,
        __spreadArray: _,
        __await: x,
        __asyncGenerator: P,
        __asyncDelegator: S,
        __asyncValues: T,
        __makeTemplateObject: R,
        __importStar: C,
        __importDefault: A,
        __classPrivateFieldGet: D,
        __classPrivateFieldSet: k,
        __classPrivateFieldIn: I,
        __addDisposableResource: L,
        __disposeResources: M,
        __rewriteRelativeImportExtension: O
    };
    t.s(["__addDisposableResource", 0, L, "__assign", () => i, "__asyncDelegator", 0, S, "__asyncGenerator", 0, P, "__asyncValues", 0, T, "__await", 0, x, "__awaiter", 0, f, "__classPrivateFieldGet", 0, D, "__classPrivateFieldIn", 0, I, "__classPrivateFieldSet", 0, k, "__createBinding", 0, v, "__decorate", 0, s, "__disposeResources", 0, M, "__esDecorate", 0, u, "__exportStar", 0, m, "__extends", 0, r, "__generator", 0, p, "__importDefault", 0, A, "__importStar", 0, C, "__makeTemplateObject", 0, R, "__metadata", 0, h, "__param", 0, o, "__propKey", 0, c, "__read", 0, g, "__rest", 0, a, "__rewriteRelativeImportExtension", 0, O, "__runInitializers", 0, l, "__setFunctionName", 0, d, "__spread", 0, w, "__spreadArray", 0, _, "__spreadArrays", 0, b, "__values", 0, y, "default", 0, j])
}, 107473, 53688, t => {
    "use strict";
    var n, r = t.i(274466),
        i = {
            "written-new": [{
                paradigmLocales: {
                    _locales: "en en_GB es es_419 pt_BR pt_PT"
                }
            }, {
                $enUS: {
                    _value: "AS+CA+GU+MH+MP+PH+PR+UM+US+VI"
                }
            }, {
                $cnsar: {
                    _value: "HK+MO"
                }
            }, {
                $americas: {
                    _value: "019"
                }
            }, {
                $maghreb: {
                    _value: "MA+DZ+TN+LY+MR+EH"
                }
            }, {
                no: {
                    _desired: "nb",
                    _distance: "1"
                }
            }, {
                bs: {
                    _desired: "hr",
                    _distance: "4"
                }
            }, {
                bs: {
                    _desired: "sh",
                    _distance: "4"
                }
            }, {
                hr: {
                    _desired: "sh",
                    _distance: "4"
                }
            }, {
                sr: {
                    _desired: "sh",
                    _distance: "4"
                }
            }, {
                aa: {
                    _desired: "ssy",
                    _distance: "4"
                }
            }, {
                de: {
                    _desired: "gsw",
                    _distance: "4",
                    _oneway: "true"
                }
            }, {
                de: {
                    _desired: "lb",
                    _distance: "4",
                    _oneway: "true"
                }
            }, {
                no: {
                    _desired: "da",
                    _distance: "8"
                }
            }, {
                nb: {
                    _desired: "da",
                    _distance: "8"
                }
            }, {
                ru: {
                    _desired: "ab",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "ach",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                nl: {
                    _desired: "af",
                    _distance: "20",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "ak",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "am",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                es: {
                    _desired: "ay",
                    _distance: "20",
                    _oneway: "true"
                }
            }, {
                ru: {
                    _desired: "az",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                ur: {
                    _desired: "bal",
                    _distance: "20",
                    _oneway: "true"
                }
            }, {
                ru: {
                    _desired: "be",
                    _distance: "20",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "bem",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                hi: {
                    _desired: "bh",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "bn",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                zh: {
                    _desired: "bo",
                    _distance: "20",
                    _oneway: "true"
                }
            }, {
                fr: {
                    _desired: "br",
                    _distance: "20",
                    _oneway: "true"
                }
            }, {
                es: {
                    _desired: "ca",
                    _distance: "20",
                    _oneway: "true"
                }
            }, {
                fil: {
                    _desired: "ceb",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "chr",
                    _distance: "20",
                    _oneway: "true"
                }
            }, {
                ar: {
                    _desired: "ckb",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                fr: {
                    _desired: "co",
                    _distance: "20",
                    _oneway: "true"
                }
            }, {
                fr: {
                    _desired: "crs",
                    _distance: "20",
                    _oneway: "true"
                }
            }, {
                sk: {
                    _desired: "cs",
                    _distance: "20"
                }
            }, {
                en: {
                    _desired: "cy",
                    _distance: "20",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "ee",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "eo",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                es: {
                    _desired: "eu",
                    _distance: "20",
                    _oneway: "true"
                }
            }, {
                da: {
                    _desired: "fo",
                    _distance: "20",
                    _oneway: "true"
                }
            }, {
                nl: {
                    _desired: "fy",
                    _distance: "20",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "ga",
                    _distance: "20",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "gaa",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "gd",
                    _distance: "20",
                    _oneway: "true"
                }
            }, {
                es: {
                    _desired: "gl",
                    _distance: "20",
                    _oneway: "true"
                }
            }, {
                es: {
                    _desired: "gn",
                    _distance: "20",
                    _oneway: "true"
                }
            }, {
                hi: {
                    _desired: "gu",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "ha",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "haw",
                    _distance: "20",
                    _oneway: "true"
                }
            }, {
                fr: {
                    _desired: "ht",
                    _distance: "20",
                    _oneway: "true"
                }
            }, {
                ru: {
                    _desired: "hy",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "ia",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "ig",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "is",
                    _distance: "20",
                    _oneway: "true"
                }
            }, {
                id: {
                    _desired: "jv",
                    _distance: "20",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "ka",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                fr: {
                    _desired: "kg",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                ru: {
                    _desired: "kk",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "km",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "kn",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "kri",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                tr: {
                    _desired: "ku",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                ru: {
                    _desired: "ky",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                it: {
                    _desired: "la",
                    _distance: "20",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "lg",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                fr: {
                    _desired: "ln",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "lo",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "loz",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                fr: {
                    _desired: "lua",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                hi: {
                    _desired: "mai",
                    _distance: "20",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "mfe",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                fr: {
                    _desired: "mg",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "mi",
                    _distance: "20",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "ml",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                ru: {
                    _desired: "mn",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                hi: {
                    _desired: "mr",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                id: {
                    _desired: "ms",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "mt",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "my",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "ne",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                nb: {
                    _desired: "nn",
                    _distance: "20"
                }
            }, {
                no: {
                    _desired: "nn",
                    _distance: "20"
                }
            }, {
                en: {
                    _desired: "nso",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "ny",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "nyn",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                fr: {
                    _desired: "oc",
                    _distance: "20",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "om",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "or",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "pa",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "pcm",
                    _distance: "20",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "ps",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                es: {
                    _desired: "qu",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                de: {
                    _desired: "rm",
                    _distance: "20",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "rn",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                fr: {
                    _desired: "rw",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                hi: {
                    _desired: "sa",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "sd",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "si",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "sn",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "so",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "sq",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "st",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                id: {
                    _desired: "su",
                    _distance: "20",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "sw",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "ta",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "te",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                ru: {
                    _desired: "tg",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "ti",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                ru: {
                    _desired: "tk",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "tlh",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "tn",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "to",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                ru: {
                    _desired: "tt",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "tum",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                zh: {
                    _desired: "ug",
                    _distance: "20",
                    _oneway: "true"
                }
            }, {
                ru: {
                    _desired: "uk",
                    _distance: "20",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "ur",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                ru: {
                    _desired: "uz",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                fr: {
                    _desired: "wo",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "xh",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "yi",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "yo",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                zh: {
                    _desired: "za",
                    _distance: "20",
                    _oneway: "true"
                }
            }, {
                en: {
                    _desired: "zu",
                    _distance: "30",
                    _oneway: "true"
                }
            }, {
                ar: {
                    _desired: "aao",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ar: {
                    _desired: "abh",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ar: {
                    _desired: "abv",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ar: {
                    _desired: "acm",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ar: {
                    _desired: "acq",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ar: {
                    _desired: "acw",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ar: {
                    _desired: "acx",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ar: {
                    _desired: "acy",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ar: {
                    _desired: "adf",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ar: {
                    _desired: "aeb",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ar: {
                    _desired: "aec",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ar: {
                    _desired: "afb",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ar: {
                    _desired: "ajp",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ar: {
                    _desired: "apc",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ar: {
                    _desired: "apd",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ar: {
                    _desired: "arq",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ar: {
                    _desired: "ars",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ar: {
                    _desired: "ary",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ar: {
                    _desired: "arz",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ar: {
                    _desired: "auz",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ar: {
                    _desired: "avl",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ar: {
                    _desired: "ayh",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ar: {
                    _desired: "ayl",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ar: {
                    _desired: "ayn",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ar: {
                    _desired: "ayp",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ar: {
                    _desired: "bbz",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ar: {
                    _desired: "pga",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ar: {
                    _desired: "shu",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ar: {
                    _desired: "ssh",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                az: {
                    _desired: "azb",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                et: {
                    _desired: "vro",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ff: {
                    _desired: "ffm",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ff: {
                    _desired: "fub",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ff: {
                    _desired: "fue",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ff: {
                    _desired: "fuf",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ff: {
                    _desired: "fuh",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ff: {
                    _desired: "fui",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ff: {
                    _desired: "fuq",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ff: {
                    _desired: "fuv",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                gn: {
                    _desired: "gnw",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                gn: {
                    _desired: "gui",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                gn: {
                    _desired: "gun",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                gn: {
                    _desired: "nhd",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                iu: {
                    _desired: "ikt",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                kln: {
                    _desired: "enb",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                kln: {
                    _desired: "eyo",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                kln: {
                    _desired: "niq",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                kln: {
                    _desired: "oki",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                kln: {
                    _desired: "pko",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                kln: {
                    _desired: "sgc",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                kln: {
                    _desired: "tec",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                kln: {
                    _desired: "tuy",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                kok: {
                    _desired: "gom",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                kpe: {
                    _desired: "gkp",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                luy: {
                    _desired: "ida",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                luy: {
                    _desired: "lkb",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                luy: {
                    _desired: "lko",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                luy: {
                    _desired: "lks",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                luy: {
                    _desired: "lri",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                luy: {
                    _desired: "lrm",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                luy: {
                    _desired: "lsm",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                luy: {
                    _desired: "lto",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                luy: {
                    _desired: "lts",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                luy: {
                    _desired: "lwg",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                luy: {
                    _desired: "nle",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                luy: {
                    _desired: "nyd",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                luy: {
                    _desired: "rag",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                lv: {
                    _desired: "ltg",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                mg: {
                    _desired: "bhr",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                mg: {
                    _desired: "bjq",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                mg: {
                    _desired: "bmm",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                mg: {
                    _desired: "bzc",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                mg: {
                    _desired: "msh",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                mg: {
                    _desired: "skg",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                mg: {
                    _desired: "tdx",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                mg: {
                    _desired: "tkg",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                mg: {
                    _desired: "txy",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                mg: {
                    _desired: "xmv",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                mg: {
                    _desired: "xmw",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                mn: {
                    _desired: "mvf",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ms: {
                    _desired: "bjn",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ms: {
                    _desired: "btj",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ms: {
                    _desired: "bve",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ms: {
                    _desired: "bvu",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ms: {
                    _desired: "coa",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ms: {
                    _desired: "dup",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ms: {
                    _desired: "hji",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ms: {
                    _desired: "id",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ms: {
                    _desired: "jak",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ms: {
                    _desired: "jax",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ms: {
                    _desired: "kvb",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ms: {
                    _desired: "kvr",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ms: {
                    _desired: "kxd",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ms: {
                    _desired: "lce",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ms: {
                    _desired: "lcf",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ms: {
                    _desired: "liw",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ms: {
                    _desired: "max",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ms: {
                    _desired: "meo",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ms: {
                    _desired: "mfa",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ms: {
                    _desired: "mfb",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ms: {
                    _desired: "min",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ms: {
                    _desired: "mqg",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ms: {
                    _desired: "msi",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ms: {
                    _desired: "mui",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ms: {
                    _desired: "orn",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ms: {
                    _desired: "ors",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ms: {
                    _desired: "pel",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ms: {
                    _desired: "pse",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ms: {
                    _desired: "tmw",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ms: {
                    _desired: "urk",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ms: {
                    _desired: "vkk",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ms: {
                    _desired: "vkt",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ms: {
                    _desired: "xmm",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ms: {
                    _desired: "zlm",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ms: {
                    _desired: "zmi",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ne: {
                    _desired: "dty",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                om: {
                    _desired: "gax",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                om: {
                    _desired: "hae",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                om: {
                    _desired: "orc",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                or: {
                    _desired: "spv",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ps: {
                    _desired: "pbt",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                ps: {
                    _desired: "pst",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                qu: {
                    _desired: "qub",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                qu: {
                    _desired: "qud",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                qu: {
                    _desired: "quf",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                qu: {
                    _desired: "qug",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                qu: {
                    _desired: "quh",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                qu: {
                    _desired: "quk",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                qu: {
                    _desired: "qul",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                qu: {
                    _desired: "qup",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                qu: {
                    _desired: "qur",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                qu: {
                    _desired: "qus",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                qu: {
                    _desired: "quw",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                qu: {
                    _desired: "qux",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                qu: {
                    _desired: "quy",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                qu: {
                    _desired: "qva",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                qu: {
                    _desired: "qvc",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                qu: {
                    _desired: "qve",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                qu: {
                    _desired: "qvh",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                qu: {
                    _desired: "qvi",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                qu: {
                    _desired: "qvj",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                qu: {
                    _desired: "qvl",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                qu: {
                    _desired: "qvm",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                qu: {
                    _desired: "qvn",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                qu: {
                    _desired: "qvo",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                qu: {
                    _desired: "qvp",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                qu: {
                    _desired: "qvs",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                qu: {
                    _desired: "qvw",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                qu: {
                    _desired: "qvz",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                qu: {
                    _desired: "qwa",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                qu: {
                    _desired: "qwc",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                qu: {
                    _desired: "qwh",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                qu: {
                    _desired: "qws",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                qu: {
                    _desired: "qxa",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                qu: {
                    _desired: "qxc",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                qu: {
                    _desired: "qxh",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                qu: {
                    _desired: "qxl",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                qu: {
                    _desired: "qxn",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                qu: {
                    _desired: "qxo",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                qu: {
                    _desired: "qxp",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                qu: {
                    _desired: "qxr",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                qu: {
                    _desired: "qxt",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                qu: {
                    _desired: "qxu",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                qu: {
                    _desired: "qxw",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                sc: {
                    _desired: "sdc",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                sc: {
                    _desired: "sdn",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                sc: {
                    _desired: "sro",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                sq: {
                    _desired: "aae",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                sq: {
                    _desired: "aat",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                sq: {
                    _desired: "aln",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                syr: {
                    _desired: "aii",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                uz: {
                    _desired: "uzs",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                yi: {
                    _desired: "yih",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                zh: {
                    _desired: "cdo",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                zh: {
                    _desired: "cjy",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                zh: {
                    _desired: "cpx",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                zh: {
                    _desired: "czh",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                zh: {
                    _desired: "czo",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                zh: {
                    _desired: "gan",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                zh: {
                    _desired: "hak",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                zh: {
                    _desired: "hsn",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                zh: {
                    _desired: "lzh",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                zh: {
                    _desired: "mnp",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                zh: {
                    _desired: "nan",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                zh: {
                    _desired: "wuu",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                zh: {
                    _desired: "yue",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                "*": {
                    _desired: "*",
                    _distance: "80"
                }
            }, {
                "en-Latn": {
                    _desired: "am-Ethi",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                "ru-Cyrl": {
                    _desired: "az-Latn",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                "en-Latn": {
                    _desired: "bn-Beng",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                "zh-Hans": {
                    _desired: "bo-Tibt",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                "ru-Cyrl": {
                    _desired: "hy-Armn",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                "en-Latn": {
                    _desired: "ka-Geor",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                "en-Latn": {
                    _desired: "km-Khmr",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                "en-Latn": {
                    _desired: "kn-Knda",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                "en-Latn": {
                    _desired: "lo-Laoo",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                "en-Latn": {
                    _desired: "ml-Mlym",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                "en-Latn": {
                    _desired: "my-Mymr",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                "en-Latn": {
                    _desired: "ne-Deva",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                "en-Latn": {
                    _desired: "or-Orya",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                "en-Latn": {
                    _desired: "pa-Guru",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                "en-Latn": {
                    _desired: "ps-Arab",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                "en-Latn": {
                    _desired: "sd-Arab",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                "en-Latn": {
                    _desired: "si-Sinh",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                "en-Latn": {
                    _desired: "ta-Taml",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                "en-Latn": {
                    _desired: "te-Telu",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                "en-Latn": {
                    _desired: "ti-Ethi",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                "ru-Cyrl": {
                    _desired: "tk-Latn",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                "en-Latn": {
                    _desired: "ur-Arab",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                "ru-Cyrl": {
                    _desired: "uz-Latn",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                "en-Latn": {
                    _desired: "yi-Hebr",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                "sr-Cyrl": {
                    _desired: "sr-Latn",
                    _distance: "5"
                }
            }, {
                "zh-Hans": {
                    _desired: "za-Latn",
                    _distance: "10",
                    _oneway: "true"
                }
            }, {
                "zh-Hans": {
                    _desired: "zh-Hani",
                    _distance: "20",
                    _oneway: "true"
                }
            }, {
                "zh-Hant": {
                    _desired: "zh-Hani",
                    _distance: "20",
                    _oneway: "true"
                }
            }, {
                "ar-Arab": {
                    _desired: "ar-Latn",
                    _distance: "20",
                    _oneway: "true"
                }
            }, {
                "bn-Beng": {
                    _desired: "bn-Latn",
                    _distance: "20",
                    _oneway: "true"
                }
            }, {
                "gu-Gujr": {
                    _desired: "gu-Latn",
                    _distance: "20",
                    _oneway: "true"
                }
            }, {
                "hi-Deva": {
                    _desired: "hi-Latn",
                    _distance: "20",
                    _oneway: "true"
                }
            }, {
                "kn-Knda": {
                    _desired: "kn-Latn",
                    _distance: "20",
                    _oneway: "true"
                }
            }, {
                "ml-Mlym": {
                    _desired: "ml-Latn",
                    _distance: "20",
                    _oneway: "true"
                }
            }, {
                "mr-Deva": {
                    _desired: "mr-Latn",
                    _distance: "20",
                    _oneway: "true"
                }
            }, {
                "ta-Taml": {
                    _desired: "ta-Latn",
                    _distance: "20",
                    _oneway: "true"
                }
            }, {
                "te-Telu": {
                    _desired: "te-Latn",
                    _distance: "20",
                    _oneway: "true"
                }
            }, {
                "zh-Hans": {
                    _desired: "zh-Latn",
                    _distance: "20",
                    _oneway: "true"
                }
            }, {
                "ja-Jpan": {
                    _desired: "ja-Latn",
                    _distance: "5",
                    _oneway: "true"
                }
            }, {
                "ja-Jpan": {
                    _desired: "ja-Hani",
                    _distance: "5",
                    _oneway: "true"
                }
            }, {
                "ja-Jpan": {
                    _desired: "ja-Hira",
                    _distance: "5",
                    _oneway: "true"
                }
            }, {
                "ja-Jpan": {
                    _desired: "ja-Kana",
                    _distance: "5",
                    _oneway: "true"
                }
            }, {
                "ja-Jpan": {
                    _desired: "ja-Hrkt",
                    _distance: "5",
                    _oneway: "true"
                }
            }, {
                "ja-Hrkt": {
                    _desired: "ja-Hira",
                    _distance: "5",
                    _oneway: "true"
                }
            }, {
                "ja-Hrkt": {
                    _desired: "ja-Kana",
                    _distance: "5",
                    _oneway: "true"
                }
            }, {
                "ko-Kore": {
                    _desired: "ko-Hani",
                    _distance: "5",
                    _oneway: "true"
                }
            }, {
                "ko-Kore": {
                    _desired: "ko-Hang",
                    _distance: "5",
                    _oneway: "true"
                }
            }, {
                "ko-Kore": {
                    _desired: "ko-Jamo",
                    _distance: "5",
                    _oneway: "true"
                }
            }, {
                "ko-Hang": {
                    _desired: "ko-Jamo",
                    _distance: "5",
                    _oneway: "true"
                }
            }, {
                "*-*": {
                    _desired: "*-*",
                    _distance: "50"
                }
            }, {
                "ar-*-$maghreb": {
                    _desired: "ar-*-$maghreb",
                    _distance: "4"
                }
            }, {
                "ar-*-$!maghreb": {
                    _desired: "ar-*-$!maghreb",
                    _distance: "4"
                }
            }, {
                "ar-*-*": {
                    _desired: "ar-*-*",
                    _distance: "5"
                }
            }, {
                "en-*-$enUS": {
                    _desired: "en-*-$enUS",
                    _distance: "4"
                }
            }, {
                "en-*-GB": {
                    _desired: "en-*-$!enUS",
                    _distance: "3"
                }
            }, {
                "en-*-$!enUS": {
                    _desired: "en-*-$!enUS",
                    _distance: "4"
                }
            }, {
                "en-*-*": {
                    _desired: "en-*-*",
                    _distance: "5"
                }
            }, {
                "es-*-$americas": {
                    _desired: "es-*-$americas",
                    _distance: "4"
                }
            }, {
                "es-*-$!americas": {
                    _desired: "es-*-$!americas",
                    _distance: "4"
                }
            }, {
                "es-*-*": {
                    _desired: "es-*-*",
                    _distance: "5"
                }
            }, {
                "pt-*-$americas": {
                    _desired: "pt-*-$americas",
                    _distance: "4"
                }
            }, {
                "pt-*-$!americas": {
                    _desired: "pt-*-$!americas",
                    _distance: "4"
                }
            }, {
                "pt-*-*": {
                    _desired: "pt-*-*",
                    _distance: "5"
                }
            }, {
                "zh-Hant-$cnsar": {
                    _desired: "zh-Hant-$cnsar",
                    _distance: "4"
                }
            }, {
                "zh-Hant-$!cnsar": {
                    _desired: "zh-Hant-$!cnsar",
                    _distance: "4"
                }
            }, {
                "zh-Hant-*": {
                    _desired: "zh-Hant-*",
                    _distance: "5"
                }
            }, {
                "*-*-*": {
                    _desired: "*-*-*",
                    _distance: "4"
                }
            }]
        },
        a = {
            "001": ["001", "001-status-grouping", "002", "005", "009", "011", "013", "014", "015", "017", "018", "019", "021", "029", "030", "034", "035", "039", "053", "054", "057", "061", "142", "143", "145", "150", "151", "154", "155", "AC", "AD", "AE", "AF", "AG", "AI", "AL", "AM", "AO", "AQ", "AR", "AS", "AT", "AU", "AW", "AX", "AZ", "BA", "BB", "BD", "BE", "BF", "BG", "BH", "BI", "BJ", "BL", "BM", "BN", "BO", "BQ", "BR", "BS", "BT", "BV", "BW", "BY", "BZ", "CA", "CC", "CD", "CF", "CG", "CH", "CI", "CK", "CL", "CM", "CN", "CO", "CP", "CQ", "CR", "CU", "CV", "CW", "CX", "CY", "CZ", "DE", "DG", "DJ", "DK", "DM", "DO", "DZ", "EA", "EC", "EE", "EG", "EH", "ER", "ES", "ET", "EU", "EZ", "FI", "FJ", "FK", "FM", "FO", "FR", "GA", "GB", "GD", "GE", "GF", "GG", "GH", "GI", "GL", "GM", "GN", "GP", "GQ", "GR", "GS", "GT", "GU", "GW", "GY", "HK", "HM", "HN", "HR", "HT", "HU", "IC", "ID", "IE", "IL", "IM", "IN", "IO", "IQ", "IR", "IS", "IT", "JE", "JM", "JO", "JP", "KE", "KG", "KH", "KI", "KM", "KN", "KP", "KR", "KW", "KY", "KZ", "LA", "LB", "LC", "LI", "LK", "LR", "LS", "LT", "LU", "LV", "LY", "MA", "MC", "MD", "ME", "MF", "MG", "MH", "MK", "ML", "MM", "MN", "MO", "MP", "MQ", "MR", "MS", "MT", "MU", "MV", "MW", "MX", "MY", "MZ", "NA", "NC", "NE", "NF", "NG", "NI", "NL", "NO", "NP", "NR", "NU", "NZ", "OM", "PA", "PE", "PF", "PG", "PH", "PK", "PL", "PM", "PN", "PR", "PS", "PT", "PW", "PY", "QA", "QO", "RE", "RO", "RS", "RU", "RW", "SA", "SB", "SC", "SD", "SE", "SG", "SH", "SI", "SJ", "SK", "SL", "SM", "SN", "SO", "SR", "SS", "ST", "SV", "SX", "SY", "SZ", "TA", "TC", "TD", "TF", "TG", "TH", "TJ", "TK", "TL", "TM", "TN", "TO", "TR", "TT", "TV", "TW", "TZ", "UA", "UG", "UM", "UN", "US", "UY", "UZ", "VA", "VC", "VE", "VG", "VI", "VN", "VU", "WF", "WS", "XK", "YE", "YT", "ZA", "ZM", "ZW"],
            "002": ["002", "002-status-grouping", "011", "014", "015", "017", "018", "202", "AO", "BF", "BI", "BJ", "BW", "CD", "CF", "CG", "CI", "CM", "CV", "DJ", "DZ", "EA", "EG", "EH", "ER", "ET", "GA", "GH", "GM", "GN", "GQ", "GW", "IC", "IO", "KE", "KM", "LR", "LS", "LY", "MA", "MG", "ML", "MR", "MU", "MW", "MZ", "NA", "NE", "NG", "RE", "RW", "SC", "SD", "SH", "SL", "SN", "SO", "SS", "ST", "SZ", "TD", "TF", "TG", "TN", "TZ", "UG", "YT", "ZA", "ZM", "ZW"],
            "003": ["003", "013", "021", "029", "AG", "AI", "AW", "BB", "BL", "BM", "BQ", "BS", "BZ", "CA", "CR", "CU", "CW", "DM", "DO", "GD", "GL", "GP", "GT", "HN", "HT", "JM", "KN", "KY", "LC", "MF", "MQ", "MS", "MX", "NI", "PA", "PM", "PR", "SV", "SX", "TC", "TT", "US", "VC", "VG", "VI"],
            "005": ["005", "AR", "BO", "BR", "BV", "CL", "CO", "EC", "FK", "GF", "GS", "GY", "PE", "PY", "SR", "UY", "VE"],
            "009": ["009", "053", "054", "057", "061", "AC", "AQ", "AS", "AU", "CC", "CK", "CP", "CX", "DG", "FJ", "FM", "GU", "HM", "KI", "MH", "MP", "NC", "NF", "NR", "NU", "NZ", "PF", "PG", "PN", "PW", "QO", "SB", "TA", "TK", "TO", "TV", "UM", "VU", "WF", "WS"],
            "011": ["011", "BF", "BJ", "CI", "CV", "GH", "GM", "GN", "GW", "LR", "ML", "MR", "NE", "NG", "SH", "SL", "SN", "TG"],
            "013": ["013", "BZ", "CR", "GT", "HN", "MX", "NI", "PA", "SV"],
            "014": ["014", "BI", "DJ", "ER", "ET", "IO", "KE", "KM", "MG", "MU", "MW", "MZ", "RE", "RW", "SC", "SO", "SS", "TF", "TZ", "UG", "YT", "ZM", "ZW"],
            "015": ["015", "DZ", "EA", "EG", "EH", "IC", "LY", "MA", "SD", "TN"],
            "017": ["017", "AO", "CD", "CF", "CG", "CM", "GA", "GQ", "ST", "TD"],
            "018": ["018", "BW", "LS", "NA", "SZ", "ZA"],
            "019": ["003", "005", "013", "019", "019-status-grouping", "021", "029", "419", "AG", "AI", "AR", "AW", "BB", "BL", "BM", "BO", "BQ", "BR", "BS", "BV", "BZ", "CA", "CL", "CO", "CR", "CU", "CW", "DM", "DO", "EC", "FK", "GD", "GF", "GL", "GP", "GS", "GT", "GY", "HN", "HT", "JM", "KN", "KY", "LC", "MF", "MQ", "MS", "MX", "NI", "PA", "PE", "PM", "PR", "PY", "SR", "SV", "SX", "TC", "TT", "US", "UY", "VC", "VE", "VG", "VI"],
            "021": ["021", "BM", "CA", "GL", "PM", "US"],
            "029": ["029", "AG", "AI", "AW", "BB", "BL", "BQ", "BS", "CU", "CW", "DM", "DO", "GD", "GP", "HT", "JM", "KN", "KY", "LC", "MF", "MQ", "MS", "PR", "SX", "TC", "TT", "VC", "VG", "VI"],
            "030": ["030", "CN", "HK", "JP", "KP", "KR", "MN", "MO", "TW"],
            "034": ["034", "AF", "BD", "BT", "IN", "IR", "LK", "MV", "NP", "PK"],
            "035": ["035", "BN", "ID", "KH", "LA", "MM", "MY", "PH", "SG", "TH", "TL", "VN"],
            "039": ["039", "AD", "AL", "BA", "ES", "GI", "GR", "HR", "IT", "ME", "MK", "MT", "PT", "RS", "SI", "SM", "VA", "XK"],
            "053": ["053", "AU", "CC", "CX", "HM", "NF", "NZ"],
            "054": ["054", "FJ", "NC", "PG", "SB", "VU"],
            "057": ["057", "FM", "GU", "KI", "MH", "MP", "NR", "PW", "UM"],
            "061": ["061", "AS", "CK", "NU", "PF", "PN", "TK", "TO", "TV", "WF", "WS"],
            142: ["030", "034", "035", "142", "143", "145", "AE", "AF", "AM", "AZ", "BD", "BH", "BN", "BT", "CN", "CY", "GE", "HK", "ID", "IL", "IN", "IQ", "IR", "JO", "JP", "KG", "KH", "KP", "KR", "KW", "KZ", "LA", "LB", "LK", "MM", "MN", "MO", "MV", "MY", "NP", "OM", "PH", "PK", "PS", "QA", "SA", "SG", "SY", "TH", "TJ", "TL", "TM", "TR", "TW", "UZ", "VN", "YE"],
            143: ["143", "KG", "KZ", "TJ", "TM", "UZ"],
            145: ["145", "AE", "AM", "AZ", "BH", "CY", "GE", "IL", "IQ", "JO", "KW", "LB", "OM", "PS", "QA", "SA", "SY", "TR", "YE"],
            150: ["039", "150", "151", "154", "155", "AD", "AL", "AT", "AX", "BA", "BE", "BG", "BY", "CH", "CQ", "CZ", "DE", "DK", "EE", "ES", "FI", "FO", "FR", "GB", "GG", "GI", "GR", "HR", "HU", "IE", "IM", "IS", "IT", "JE", "LI", "LT", "LU", "LV", "MC", "MD", "ME", "MK", "MT", "NL", "NO", "PL", "PT", "RO", "RS", "RU", "SE", "SI", "SJ", "SK", "SM", "UA", "VA", "XK"],
            151: ["151", "BG", "BY", "CZ", "HU", "MD", "PL", "RO", "RU", "SK", "UA"],
            154: ["154", "AX", "CQ", "DK", "EE", "FI", "FO", "GB", "GG", "IE", "IM", "IS", "JE", "LT", "LV", "NO", "SE", "SJ"],
            155: ["155", "AT", "BE", "CH", "DE", "FR", "LI", "LU", "MC", "NL"],
            202: ["011", "014", "017", "018", "202", "AO", "BF", "BI", "BJ", "BW", "CD", "CF", "CG", "CI", "CM", "CV", "DJ", "ER", "ET", "GA", "GH", "GM", "GN", "GQ", "GW", "IO", "KE", "KM", "LR", "LS", "MG", "ML", "MR", "MU", "MW", "MZ", "NA", "NE", "NG", "RE", "RW", "SC", "SH", "SL", "SN", "SO", "SS", "ST", "SZ", "TD", "TF", "TG", "TZ", "UG", "YT", "ZA", "ZM", "ZW"],
            419: ["005", "013", "029", "419", "AG", "AI", "AR", "AW", "BB", "BL", "BO", "BQ", "BR", "BS", "BV", "BZ", "CL", "CO", "CR", "CU", "CW", "DM", "DO", "EC", "FK", "GD", "GF", "GP", "GS", "GT", "GY", "HN", "HT", "JM", "KN", "KY", "LC", "MF", "MQ", "MS", "MX", "NI", "PA", "PE", "PR", "PY", "SR", "SV", "SX", "TC", "TT", "UY", "VC", "VE", "VG", "VI"],
            EU: ["AT", "BE", "BG", "CY", "CZ", "DE", "DK", "EE", "ES", "EU", "FI", "FR", "GR", "HR", "HU", "IE", "IT", "LT", "LU", "LV", "MT", "NL", "PL", "PT", "RO", "SE", "SI", "SK"],
            EZ: ["AT", "BE", "CY", "DE", "EE", "ES", "EZ", "FI", "FR", "GR", "IE", "IT", "LT", "LU", "LV", "MT", "NL", "PT", "SI", "SK"],
            QO: ["AC", "AQ", "CP", "DG", "QO", "TA"],
            UN: ["AD", "AE", "AF", "AG", "AL", "AM", "AO", "AR", "AT", "AU", "AZ", "BA", "BB", "BD", "BE", "BF", "BG", "BH", "BI", "BJ", "BN", "BO", "BR", "BS", "BT", "BW", "BY", "BZ", "CA", "CD", "CF", "CG", "CH", "CI", "CL", "CM", "CN", "CO", "CR", "CU", "CV", "CY", "CZ", "DE", "DJ", "DK", "DM", "DO", "DZ", "EC", "EE", "EG", "ER", "ES", "ET", "FI", "FJ", "FM", "FR", "GA", "GB", "GD", "GE", "GH", "GM", "GN", "GQ", "GR", "GT", "GW", "GY", "HN", "HR", "HT", "HU", "ID", "IE", "IL", "IN", "IQ", "IR", "IS", "IT", "JM", "JO", "JP", "KE", "KG", "KH", "KI", "KM", "KN", "KP", "KR", "KW", "KZ", "LA", "LB", "LC", "LI", "LK", "LR", "LS", "LT", "LU", "LV", "LY", "MA", "MC", "MD", "ME", "MG", "MH", "MK", "ML", "MM", "MN", "MR", "MT", "MU", "MV", "MW", "MX", "MY", "MZ", "NA", "NE", "NG", "NI", "NL", "NO", "NP", "NR", "NZ", "OM", "PA", "PE", "PG", "PH", "PK", "PL", "PT", "PW", "PY", "QA", "RO", "RS", "RU", "RW", "SA", "SB", "SC", "SD", "SE", "SG", "SI", "SK", "SL", "SM", "SN", "SO", "SR", "SS", "ST", "SV", "SY", "SZ", "TD", "TG", "TH", "TJ", "TL", "TM", "TN", "TO", "TR", "TT", "TV", "TZ", "UA", "UG", "UN", "US", "UY", "UZ", "VC", "VE", "VN", "VU", "WS", "YE", "ZA", "ZM", "ZW"]
        },
        s = /-u(?:-[0-9a-z]{2,8})+/gi;

    function o(t, n, r) {
        if (void 0 === r && (r = Error), !t) throw new r(n)
    }

    function u(t, n, i) {
        var s = n.split("-"),
            o = s[0],
            u = s[1],
            l = s[2],
            c = !0;
        if (l && "$" === l[0]) {
            var d = "!" !== l[1],
                h = (d ? i[l.slice(1)] : i[l.slice(2)]).map(function(t) {
                    return a[t] || [t]
                }).reduce(function(t, n) {
                    return (0, r.__spreadArray)((0, r.__spreadArray)([], t, !0), n, !0)
                }, []);
            c && (c = h.indexOf(t.region || "") > -1 == d)
        } else c && (c = !t.region || "*" === l || l === t.region);
        return c && (c = !t.script || "*" === u || u === t.script), c && (c = !t.language || "*" === o || o === t.language), c
    }

    function l(t) {
        return [t.language, t.script, t.region].filter(Boolean).join("-")
    }

    function c(t, n, r) {
        for (var i = 0, a = r.matches; i < a.length; i++) {
            var s = a[i],
                o = u(t, s.desired, r.matchVariables) && u(n, s.supported, r.matchVariables);
            if (s.oneway || o || (o = u(t, s.supported, r.matchVariables) && u(n, s.desired, r.matchVariables)), o) {
                var c = 10 * s.distance;
                if (r.paradigmLocales.indexOf(l(t)) > -1 != r.paradigmLocales.indexOf(l(n)) > -1) return c - 1;
                return c
            }
        }
        throw Error("No matching distance found")
    }

    function d(t) {
        return Intl.getCanonicalLocales(t)[0]
    }

    function h(t, n) {
        for (var r = n;;) {
            if (t.indexOf(r) > -1) return r;
            var i = r.lastIndexOf("-");
            if (!~i) return;
            i >= 2 && "-" === r[i - 2] && (i -= 2), r = r.slice(0, i)
        }
    }
    t.s(["ResolveLocale", 0, function(t, a, u, l, f, p) {
        "lookup" === u.localeMatcher ? m = function(t, n, r) {
            for (var i = {
                    locale: ""
                }, a = 0; a < n.length; a++) {
                var o = n[a],
                    u = o.replace(s, ""),
                    l = h(t, u);
                if (l) return i.locale = l, o !== u && (i.extension = o.slice(u.length, o.length)), i
            }
            return i.locale = r(), i
        }(Array.from(t), a, p) : (g = Array.from(t), _ = [], x = a.reduce(function(t, n) {
            var r = n.replace(s, "");
            return _.push(r), t[r] = n, t
        }, {}), (void 0 === P && (P = 838), S = 1 / 0, T = {
            matchedDesiredLocale: "",
            distances: {}
        }, _.forEach(function(t, a) {
            T.distances[t] || (T.distances[t] = {}), g.forEach(function(s) {
                var o, u, l, d, h, f, p = (o = new Intl.Locale(t).maximize(), u = new Intl.Locale(s).maximize(), l = {
                    language: o.language,
                    script: o.script || "",
                    region: o.region || ""
                }, d = {
                    language: u.language,
                    script: u.script || "",
                    region: u.region || ""
                }, h = 0, f = function() {
                    var t, a;
                    if (!n) {
                        var s = null == (a = null == (t = i["written-new"][0]) ? void 0 : t.paradigmLocales) ? void 0 : a._locales.split(" "),
                            o = i["written-new"].slice(1, 5);
                        n = {
                            matches: i["written-new"].slice(5).map(function(t) {
                                var n = Object.keys(t)[0],
                                    r = t[n];
                                return {
                                    supported: n,
                                    desired: r._desired,
                                    distance: +r._distance,
                                    oneway: "true" === r.oneway
                                }
                            }, {}),
                            matchVariables: o.reduce(function(t, n) {
                                var r = Object.keys(n)[0],
                                    i = n[r];
                                return t[r.slice(1)] = i._value.split("+"), t
                            }, {}),
                            paradigmLocales: (0, r.__spreadArray)((0, r.__spreadArray)([], s, !0), s.map(function(t) {
                                return new Intl.Locale(t.replace(/_/g, "-")).maximize().toString()
                            }), !0)
                        }
                    }
                    return n
                }(), l.language !== d.language && (h += c({
                    language: o.language,
                    script: "",
                    region: ""
                }, {
                    language: u.language,
                    script: "",
                    region: ""
                }, f)), l.script !== d.script && (h += c({
                    language: o.language,
                    script: l.script,
                    region: ""
                }, {
                    language: u.language,
                    script: d.script,
                    region: ""
                }, f)), l.region !== d.region && (h += c(l, d, f)), h + 0 + 40 * a);
                T.distances[t][s] = p, p < S && (S = p, T.matchedDesiredLocale = t, T.matchedSupportedLocale = s)
            })
        }), S >= P && (T.matchedDesiredLocale = void 0, T.matchedSupportedLocale = void 0), R = T).matchedSupportedLocale && R.matchedDesiredLocale && (w = R.matchedSupportedLocale, b = x[R.matchedDesiredLocale].slice(R.matchedDesiredLocale.length) || void 0), m = w ? {
            locale: w,
            extension: b
        } : {
            locale: p()
        }), null == m && (m = {
            locale: p(),
            extension: ""
        });
        var v, m, y, g, w, b, _, x, P, S, T, R, E = m.locale,
            q = f[E],
            C = {
                locale: "en",
                dataLocale: E
            };
        y = m.extension ? function(t) {
            o(t === t.toLowerCase(), "Expected extension to be lowercase"), o("-u-" === t.slice(0, 3), "Expected extension to be a Unicode locale extension");
            for (var n, r = [], i = [], a = t.length, s = 3; s < a;) {
                var u = t.indexOf("-", s),
                    l = void 0;
                l = -1 === u ? a - s : u - s;
                var c = t.slice(s, s + l);
                o(l >= 2, "Expected a subtag to have at least 2 characters"), void 0 === n && 2 != l ? -1 === r.indexOf(c) && r.push(c) : 2 === l ? (n = {
                    key: c,
                    value: ""
                }, void 0 === i.find(function(t) {
                    return t.key === (null == n ? void 0 : n.key)
                }) && i.push(n)) : (null == n ? void 0 : n.value) === "" ? n.value = c : (o(void 0 !== n, "Expected keyword to be defined"), n.value += "-" + c), s += l + 1
            }
            return {
                attributes: r,
                keywords: i
            }
        }(m.extension).keywords : [];
        for (var A = [], D = function(t) {
                var n, r, i = null != (v = null == q ? void 0 : q[t]) ? v : [];
                o(Array.isArray(i), "keyLocaleData for ".concat(t, " must be an array"));
                var a = i[0];
                o(void 0 === a || "string" == typeof a, "value must be a string or undefined");
                var s = void 0,
                    l = y.find(function(n) {
                        return n.key === t
                    });
                if (l) {
                    var c = l.value;
                    "" !== c ? i.indexOf(c) > -1 && (s = {
                        key: t,
                        value: a = c
                    }) : i.indexOf("true") > -1 && (s = {
                        key: t,
                        value: a = "true"
                    })
                }
                var d = u[t];
                o(null == d || "string" == typeof d, "optionsValue must be a string or undefined"), "string" == typeof d && (n = t.toLowerCase(), r = d.toLowerCase(), o(void 0 !== n, "ukey must be defined"), "" === (d = r) && (d = "true")), d !== a && i.indexOf(d) > -1 && (a = d, s = void 0), s && A.push(s), C[t] = a
            }, k = 0; k < l.length; k++) D(l[k]);
        return A.length > 0 && (E = function(t, n, r) {
            o(-1 === t.indexOf("-u-"), "Expected locale to not have a Unicode locale extension");
            for (var i, a = "-u", s = 0; s < n.length; s++) {
                var u = n[s];
                a += "-".concat(u)
            }
            for (var l = 0; l < r.length; l++) {
                var c = r[l],
                    h = c.key,
                    f = c.value;
                a += "-".concat(h), "" !== f && (a += "-".concat(f))
            }
            if ("-u" === a) return d(t);
            var p = t.indexOf("-x-");
            return d(-1 === p ? t + a : t.slice(0, p) + a + t.slice(p))
        }(E, [], A)), C.locale = E, C
    }], 107473), t.s(["LookupSupportedLocales", 0, function(t, n) {
        for (var r = [], i = 0; i < n.length; i++) {
            var a = h(t, n[i].replace(s, ""));
            a && r.push(a)
        }
        return r
    }], 53688)
}, 14910, t => {
    "use strict";

    function n(t) {
        return Intl.getCanonicalLocales(t)
    }

    function r(t, n) {
        var r = n.zoneNames,
            i = n.uppercaseLinks,
            a = t.toUpperCase(),
            s = r.reduce(function(t, n) {
                return t[n.toUpperCase()] = n, t
            }, {}),
            o = i[a] || s[a];
        return "Etc/UTC" === o || "Etc/GMT" === o ? "UTC" : o
    }
    t.s([], 819247), t.i(819247), t.s(["CanonicalizeLocaleList", 0, n], 52010), t.i(52010), t.s(["CanonicalizeTimeZoneName", 0, r], 440918), t.i(440918);
    var i, a, s, o, u, l = "0123456789abcdef",
        c = "2.3025850929940456840179914546843642076011014886287729760333279009675726096773524802359972050895982983419677840422862486334095254650828067566662873690987816894829072083255546808437998948262331985283935053089653777326288461633662222876982198867465436674744042432743651550489343149393914796194044002221051017141748003688084012647080685567743216228355220114804663715659121373450747856947683463616792101806445070648000277502684916746550586856935673420670581136429224554405758925724208241314695689016758940256776311356919292033376587141660230105703089634572075440370847469940168269282808481184289314848524948644871927809676271275775397027668605952496716674183485704422507197965004714951050492214776567636938662976979522110718264549734772662425709429322582798502585509785265383207606726317164309505995087807523710333101197857547331541421808427543863591778117054309827482385045648019095610299291824318237525357709750539565187697510374970888692180205189339507238539205144634197265287286965110862571492198849978748873771345686209167058",
        d = "3.1415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679821480865132823066470938446095505822317253594081284811174502841027019385211055596446229489549303819644288109756659334461284756482337867831652712019091456485669234603486104543266482133936072602491412737245870066063155881748815209209628292540917153643678925903600113305305488204665213841469519415116094330572703657595919530921861173819326117931051185480744623799627495673518857527248912279381830119491298336733624406566430860213949463952247371907021798609437027705392171762931767523846748184676694051320005681271452635608277857713427577896091736371787214684409012249534301465495853710507922796892589235420199561121290219608640344181598136297747713099605187072113499999983729780499510597317328160963185950244594553469083026425223082533446850352619311881710100031378387528865875332083814206171776691473035982534904287554687311595628638823537875937519577818577805321712268066130019278766111959092164201989380952572010654858632789",
        h = {
            precision: 20,
            rounding: 4,
            modulo: 1,
            toExpNeg: -7,
            toExpPos: 21,
            minE: -9e15,
            maxE: 9e15,
            crypto: !1
        },
        f = !0,
        p = "[DecimalError] ",
        v = p + "Invalid argument: ",
        m = p + "Precision limit exceeded",
        y = p + "crypto unavailable",
        g = "[object Decimal]",
        w = Math.floor,
        b = Math.pow,
        _ = /^0b([01]+(\.[01]*)?|\.[01]+)(p[+-]?\d+)?$/i,
        x = /^0x([0-9a-f]+(\.[0-9a-f]*)?|\.[0-9a-f]+)(p[+-]?\d+)?$/i,
        P = /^0o([0-7]+(\.[0-7]*)?|\.[0-7]+)(p[+-]?\d+)?$/i,
        S = /^(\d+(\.\d*)?|\.\d+)(e[+-]?\d+)?$/i,
        T = c.length - 1,
        R = d.length - 1,
        E = {
            toStringTag: g
        };

    function q(t) {
        var n, r, i, a = t.length - 1,
            s = "",
            o = t[0];
        if (a > 0) {
            for (s += o, n = 1; n < a; n++)(r = 7 - (i = t[n] + "").length) && (s += F(r)), s += i;
            (r = 7 - (i = (o = t[n]) + "").length) && (s += F(r))
        } else if (0 === o) return "0";
        for (; o % 10 == 0;) o /= 10;
        return s + o
    }

    function C(t, n, r) {
        if (t !== ~~t || t < n || t > r) throw Error(v + t)
    }

    function A(t, n, r, i) {
        var a, s, o, u;
        for (s = t[0]; s >= 10; s /= 10) --n;
        return --n < 0 ? (n += 7, a = 0) : (a = Math.ceil((n + 1) / 7), n %= 7), s = b(10, 7 - n), u = t[a] % s | 0, null == i ? n < 3 ? (0 == n ? u = u / 100 | 0 : 1 == n && (u = u / 10 | 0), o = r < 4 && 99999 == u || r > 3 && 49999 == u || 5e4 == u || 0 == u) : o = (r < 4 && u + 1 == s || r > 3 && u + 1 == s / 2) && (t[a + 1] / s / 100 | 0) == b(10, n - 2) - 1 || (u == s / 2 || 0 == u) && (t[a + 1] / s / 100 | 0) == 0 : n < 4 ? (0 == n ? u = u / 1e3 | 0 : 1 == n ? u = u / 100 | 0 : 2 == n && (u = u / 10 | 0), o = (i || r < 4) && 9999 == u || !i && r > 3 && 4999 == u) : o = ((i || r < 4) && u + 1 == s || !i && r > 3 && u + 1 == s / 2) && (t[a + 1] / s / 1e3 | 0) == b(10, n - 3) - 1, o
    }

    function D(t, n, r) {
        for (var i, a, s = [0], o = 0, u = t.length; o < u;) {
            for (a = s.length; a--;) s[a] *= n;
            for (s[0] += l.indexOf(t.charAt(o++)), i = 0; i < s.length; i++) s[i] > r - 1 && (void 0 === s[i + 1] && (s[i + 1] = 0), s[i + 1] += s[i] / r | 0, s[i] %= r)
        }
        return s.reverse()
    }
    E.absoluteValue = E.abs = function() {
        var t = new this.constructor(this);
        return t.s < 0 && (t.s = 1), I(t)
    }, E.ceil = function() {
        return I(new this.constructor(this), this.e + 1, 2)
    }, E.clampedTo = E.clamp = function(t, n) {
        var r = this.constructor;
        if (t = new r(t), n = new r(n), !t.s || !n.s) return new r(NaN);
        if (t.gt(n)) throw Error(v + n);
        return 0 > this.cmp(t) ? t : this.cmp(n) > 0 ? n : new r(this)
    }, E.comparedTo = E.cmp = function(t) {
        var n, r, i, a, s = this.d,
            o = (t = new this.constructor(t)).d,
            u = this.s,
            l = t.s;
        if (!s || !o) return u && l ? u !== l ? u : s === o ? 0 : !s ^ u < 0 ? 1 : -1 : NaN;
        if (!s[0] || !o[0]) return s[0] ? u : o[0] ? -l : 0;
        if (u !== l) return u;
        if (this.e !== t.e) return this.e > t.e ^ u < 0 ? 1 : -1;
        for (i = s.length, n = 0, r = i < (a = o.length) ? i : a; n < r; ++n)
            if (s[n] !== o[n]) return s[n] > o[n] ^ u < 0 ? 1 : -1;
        return i === a ? 0 : i > a ^ u < 0 ? 1 : -1
    }, E.cosine = E.cos = function() {
        var t, n, r = this,
            i = r.constructor;
        return r.d ? r.d[0] ? (t = i.precision, n = i.rounding, i.precision = t + Math.max(r.e, r.sd()) + 7, i.rounding = 1, r = function(t, n) {
            var r, i, a;
            if (n.isZero()) return n;
            (i = n.d.length) < 32 ? a = (1 / J(4, r = Math.ceil(i / 3))).toString() : (r = 16, a = "2.3283064365386962890625e-10"), t.precision += r, n = W(t, 1, n.times(a), new t(1));
            for (var s = r; s--;) {
                var o = n.times(n);
                n = o.times(o).minus(o).times(8).plus(1)
            }
            return t.precision -= r, n
        }(i, Z(i, r)), i.precision = t, i.rounding = n, I(2 == u || 3 == u ? r.neg() : r, t, n, !0)) : new i(1) : new i(NaN)
    }, E.cubeRoot = E.cbrt = function() {
        var t, n, r, i, a, s, o, u, l, c, d = this.constructor;
        if (!this.isFinite() || this.isZero()) return new d(this);
        for (f = !1, (s = this.s * b(this.s * this, 1 / 3)) && Math.abs(s) != 1 / 0 ? i = new d(s.toString()) : (r = q(this.d), (s = ((t = this.e) - r.length + 1) % 3) && (r += 1 == s || -2 == s ? "0" : "00"), s = b(r, 1 / 3), t = w((t + 1) / 3) - (t % 3 == (t < 0 ? -1 : 2)), (i = new d(r = s == 1 / 0 ? "5e" + t : (r = s.toExponential()).slice(0, r.indexOf("e") + 1) + t)).s = this.s), o = (t = d.precision) + 3;;)
            if (i = k((c = (l = (u = i).times(u).times(u)).plus(this)).plus(this).times(u), c.plus(l), o + 2, 1), q(u.d).slice(0, o) === (r = q(i.d)).slice(0, o)) {
                if ("9999" != (r = r.slice(o - 3, o + 1)) && (a || "4999" != r)) {
                    +r && (+r.slice(1) || "5" != r.charAt(0)) || (I(i, t + 1, 1), n = !i.times(i).times(i).eq(this));
                    break
                }
                if (!a && (I(u, t + 1, 0), u.times(u).times(u).eq(this))) {
                    i = u;
                    break
                }
                o += 4, a = 1
            } return f = !0, I(i, t, d.rounding, n)
    }, E.decimalPlaces = E.dp = function() {
        var t, n = this.d,
            r = NaN;
        if (n) {
            if (r = ((t = n.length - 1) - w(this.e / 7)) * 7, t = n[t])
                for (; t % 10 == 0; t /= 10) r--;
            r < 0 && (r = 0)
        }
        return r
    }, E.dividedBy = E.div = function(t) {
        return k(this, new this.constructor(t))
    }, E.dividedToIntegerBy = E.divToInt = function(t) {
        var n = this.constructor;
        return I(k(this, new n(t), 0, 1, 1), n.precision, n.rounding)
    }, E.equals = E.eq = function(t) {
        return 0 === this.cmp(t)
    }, E.floor = function() {
        return I(new this.constructor(this), this.e + 1, 3)
    }, E.greaterThan = E.gt = function(t) {
        return this.cmp(t) > 0
    }, E.greaterThanOrEqualTo = E.gte = function(t) {
        var n = this.cmp(t);
        return 1 == n || 0 === n
    }, E.hyperbolicCosine = E.cosh = function() {
        var t, n, r, i, a, s = this,
            o = s.constructor,
            u = new o(1);
        if (!s.isFinite()) return new o(s.s ? 1 / 0 : NaN);
        if (s.isZero()) return u;
        r = o.precision, i = o.rounding, o.precision = r + Math.max(s.e, s.sd()) + 4, o.rounding = 1, (a = s.d.length) < 32 ? n = (1 / J(4, t = Math.ceil(a / 3))).toString() : (t = 16, n = "2.3283064365386962890625e-10"), s = W(o, 1, s.times(n), new o(1), !0);
        for (var l, c = t, d = new o(8); c--;) l = s.times(s), s = u.minus(l.times(d.minus(l.times(d))));
        return I(s, o.precision = r, o.rounding = i, !0)
    }, E.hyperbolicSine = E.sinh = function() {
        var t, n, r, i, a = this,
            s = a.constructor;
        if (!a.isFinite() || a.isZero()) return new s(a);
        if (n = s.precision, r = s.rounding, s.precision = n + Math.max(a.e, a.sd()) + 4, s.rounding = 1, (i = a.d.length) < 3) a = W(s, 2, a, a, !0);
        else {
            t = (t = 1.4 * Math.sqrt(i)) > 16 ? 16 : 0 | t, a = W(s, 2, a = a.times(1 / J(5, t)), a, !0);
            for (var o, u = new s(5), l = new s(16), c = new s(20); t--;) o = a.times(a), a = a.times(u.plus(o.times(l.times(o).plus(c))))
        }
        return s.precision = n, s.rounding = r, I(a, n, r, !0)
    }, E.hyperbolicTangent = E.tanh = function() {
        var t, n, r = this.constructor;
        return this.isFinite() ? this.isZero() ? new r(this) : (t = r.precision, n = r.rounding, r.precision = t + 7, r.rounding = 1, k(this.sinh(), this.cosh(), r.precision = t, r.rounding = n)) : new r(this.s)
    }, E.inverseCosine = E.acos = function() {
        var t = this,
            n = t.constructor,
            r = t.abs().cmp(1),
            i = n.precision,
            a = n.rounding;
        return -1 !== r ? 0 === r ? t.isNeg() ? O(n, i, a) : new n(0) : new n(NaN) : t.isZero() ? O(n, i + 4, a).times(.5) : (n.precision = i + 6, n.rounding = 1, t = new n(1).minus(t).div(t.plus(1)).sqrt().atan(), n.precision = i, n.rounding = a, t.times(2))
    }, E.inverseHyperbolicCosine = E.acosh = function() {
        var t, n, r = this,
            i = r.constructor;
        return r.lte(1) ? new i(r.eq(1) ? 0 : NaN) : r.isFinite() ? (t = i.precision, n = i.rounding, i.precision = t + Math.max(Math.abs(r.e), r.sd()) + 4, i.rounding = 1, f = !1, r = r.times(r).minus(1).sqrt().plus(r), f = !0, i.precision = t, i.rounding = n, r.ln()) : new i(r)
    }, E.inverseHyperbolicSine = E.asinh = function() {
        var t, n, r = this,
            i = r.constructor;
        return !r.isFinite() || r.isZero() ? new i(r) : (t = i.precision, n = i.rounding, i.precision = t + 2 * Math.max(Math.abs(r.e), r.sd()) + 6, i.rounding = 1, f = !1, r = r.times(r).plus(1).sqrt().plus(r), f = !0, i.precision = t, i.rounding = n, r.ln())
    }, E.inverseHyperbolicTangent = E.atanh = function() {
        var t, n, r, i, a = this,
            s = a.constructor;
        return a.isFinite() ? a.e >= 0 ? new s(a.abs().eq(1) ? a.s / 0 : a.isZero() ? a : NaN) : (t = s.precision, n = s.rounding, Math.max(i = a.sd(), t) < -(2 * a.e) - 1) ? I(new s(a), t, n, !0) : (s.precision = r = i - a.e, a = k(a.plus(1), new s(1).minus(a), r + t, 1), s.precision = t + 4, s.rounding = 1, a = a.ln(), s.precision = t, s.rounding = n, a.times(.5)) : new s(NaN)
    }, E.inverseSine = E.asin = function() {
        var t, n, r, i, a = this,
            s = a.constructor;
        return a.isZero() ? new s(a) : (n = a.abs().cmp(1), r = s.precision, i = s.rounding, -1 !== n) ? 0 === n ? ((t = O(s, r + 4, i).times(.5)).s = a.s, t) : new s(NaN) : (s.precision = r + 6, s.rounding = 1, a = a.div(new s(1).minus(a.times(a)).sqrt().plus(1)).atan(), s.precision = r, s.rounding = i, a.times(2))
    }, E.inverseTangent = E.atan = function() {
        var t, n, r, i, a, s, o, u, l, c = this,
            d = c.constructor,
            h = d.precision,
            p = d.rounding;
        if (c.isFinite()) {
            if (c.isZero()) return new d(c);
            else if (c.abs().eq(1) && h + 4 <= R) return (o = O(d, h + 4, p).times(.25)).s = c.s, o
        } else {
            if (!c.s) return new d(NaN);
            if (h + 4 <= R) return (o = O(d, h + 4, p).times(.5)).s = c.s, o
        }
        for (d.precision = u = h + 10, d.rounding = 1, t = r = Math.min(28, u / 7 + 2 | 0); t; --t) c = c.div(c.times(c).plus(1).sqrt().plus(1));
        for (f = !1, n = Math.ceil(u / 7), i = 1, l = c.times(c), o = new d(c), a = c; - 1 !== t;)
            if (a = a.times(l), s = o.minus(a.div(i += 2)), a = a.times(l), void 0 !== (o = s.plus(a.div(i += 2))).d[n])
                for (t = n; o.d[t] === s.d[t] && t--;);
        return r && (o = o.times(2 << r - 1)), f = !0, I(o, d.precision = h, d.rounding = p, !0)
    }, E.isFinite = function() {
        return !!this.d
    }, E.isInteger = E.isInt = function() {
        return !!this.d && w(this.e / 7) > this.d.length - 2
    }, E.isNaN = function() {
        return !this.s
    }, E.isNegative = E.isNeg = function() {
        return this.s < 0
    }, E.isPositive = E.isPos = function() {
        return this.s > 0
    }, E.isZero = function() {
        return !!this.d && 0 === this.d[0]
    }, E.lessThan = E.lt = function(t) {
        return 0 > this.cmp(t)
    }, E.lessThanOrEqualTo = E.lte = function(t) {
        return 1 > this.cmp(t)
    }, E.logarithm = E.log = function(t) {
        var n, r, i, a, s, o, u, l = this.constructor,
            c = l.precision,
            d = l.rounding;
        if (null == t) t = new l(10), n = !0;
        else {
            if (r = (t = new l(t)).d, t.s < 0 || !r || !r[0] || t.eq(1)) return new l(NaN);
            n = t.eq(10)
        }
        if (r = this.d, this.s < 0 || !r || !r[0] || this.eq(1)) return new l(r && !r[0] ? -1 / 0 : 1 != this.s ? NaN : r ? 0 : 1 / 0);
        if (n)
            if (r.length > 1) a = !0;
            else {
                for (i = r[0]; i % 10 == 0;) i /= 10;
                a = 1 !== i
            } if (f = !1, A((u = k(s = H(this, o = c + 5), n ? M(l, o + 10) : H(t, o), o, 1)).d, i = c, d))
            do
                if (o += 10, u = k(s = H(this, o), n ? M(l, o + 10) : H(t, o), o, 1), !a) {
                    +q(u.d).slice(i + 1, i + 15) + 1 == 1e14 && (u = I(u, c + 1, 0));
                    break
                } while (A(u.d, i += 10, d)) return f = !0, I(u, c, d)
    }, E.minus = E.sub = function(t) {
        var n, r, i, a, s, o, u, l, c, d, h, p, v = this.constructor;
        if (t = new v(t), !this.d || !t.d) return this.s && t.s ? this.d ? t.s = -t.s : t = new v(t.d || this.s !== t.s ? this : NaN) : t = new v(NaN), t;
        if (this.s != t.s) return t.s = -t.s, this.plus(t);
        if (c = this.d, p = t.d, u = v.precision, l = v.rounding, !c[0] || !p[0]) {
            if (p[0]) t.s = -t.s;
            else {
                if (!c[0]) return new v(3 === l ? -0 : 0);
                t = new v(this)
            }
            return f ? I(t, u, l) : t
        }
        if (r = w(t.e / 7), d = w(this.e / 7), c = c.slice(), s = d - r) {
            for ((h = s < 0) ? (n = c, s = -s, o = p.length) : (n = p, r = d, o = c.length), s > (i = Math.max(Math.ceil(u / 7), o) + 2) && (s = i, n.length = 1), n.reverse(), i = s; i--;) n.push(0);
            n.reverse()
        } else {
            for ((h = (i = c.length) < (o = p.length)) && (o = i), i = 0; i < o; i++)
                if (c[i] != p[i]) {
                    h = c[i] < p[i];
                    break
                } s = 0
        }
        for (h && (n = c, c = p, p = n, t.s = -t.s), o = c.length, i = p.length - o; i > 0; --i) c[o++] = 0;
        for (i = p.length; i > s;) {
            if (c[--i] < p[i]) {
                for (a = i; a && 0 === c[--a];) c[a] = 1e7 - 1;
                --c[a], c[i] += 1e7
            }
            c[i] -= p[i]
        }
        for (; 0 === c[--o];) c.pop();
        for (; 0 === c[0]; c.shift()) --r;
        return c[0] ? (t.d = c, t.e = N(c, r), f ? I(t, u, l) : t) : new v(3 === l ? -0 : 0)
    }, E.modulo = E.mod = function(t) {
        var n, r = this.constructor;
        return (t = new r(t), this.d && t.s && (!t.d || t.d[0])) ? t.d && (!this.d || this.d[0]) ? (f = !1, 9 == r.modulo ? (n = k(this, t.abs(), 0, 3, 1), n.s *= t.s) : n = k(this, t, 0, r.modulo, 1), n = n.times(t), f = !0, this.minus(n)) : I(new r(this), r.precision, r.rounding) : new r(NaN)
    }, E.naturalExponential = E.exp = function() {
        return V(this)
    }, E.naturalLogarithm = E.ln = function() {
        return H(this)
    }, E.negated = E.neg = function() {
        var t = new this.constructor(this);
        return t.s = -t.s, I(t)
    }, E.plus = E.add = function(t) {
        var n, r, i, a, s, o, u, l, c, d, h = this.constructor;
        if (t = new h(t), !this.d || !t.d) return this.s && t.s ? this.d || (t = new h(t.d || this.s === t.s ? this : NaN)) : t = new h(NaN), t;
        if (this.s != t.s) return t.s = -t.s, this.minus(t);
        if (c = this.d, d = t.d, u = h.precision, l = h.rounding, !c[0] || !d[0]) return d[0] || (t = new h(this)), f ? I(t, u, l) : t;
        if (s = w(this.e / 7), i = w(t.e / 7), c = c.slice(), a = s - i) {
            for (a < 0 ? (r = c, a = -a, o = d.length) : (r = d, i = s, o = c.length), a > (o = (s = Math.ceil(u / 7)) > o ? s + 1 : o + 1) && (a = o, r.length = 1), r.reverse(); a--;) r.push(0);
            r.reverse()
        }
        for ((o = c.length) - (a = d.length) < 0 && (a = o, r = d, d = c, c = r), n = 0; a;) n = (c[--a] = c[a] + d[a] + n) / 1e7 | 0, c[a] %= 1e7;
        for (n && (c.unshift(n), ++i), o = c.length; 0 == c[--o];) c.pop();
        return t.d = c, t.e = N(c, i), f ? I(t, u, l) : t
    }, E.precision = E.sd = function(t) {
        var n;
        if (void 0 !== t && !!t !== t && 1 !== t && 0 !== t) throw Error(v + t);
        return this.d ? (n = j(this.d), t && this.e + 1 > n && (n = this.e + 1)) : n = NaN, n
    }, E.round = function() {
        var t = this.constructor;
        return I(new t(this), this.e + 1, t.rounding)
    }, E.sine = E.sin = function() {
        var t, n, r = this,
            i = r.constructor;
        return r.isFinite() ? r.isZero() ? new i(r) : (t = i.precision, n = i.rounding, i.precision = t + Math.max(r.e, r.sd()) + 7, i.rounding = 1, r = function(t, n) {
            var r, i = n.d.length;
            if (i < 3) return n.isZero() ? n : W(t, 2, n, n);
            r = (r = 1.4 * Math.sqrt(i)) > 16 ? 16 : 0 | r, n = W(t, 2, n = n.times(1 / J(5, r)), n);
            for (var a, s = new t(5), o = new t(16), u = new t(20); r--;) a = n.times(n), n = n.times(s.plus(a.times(o.times(a).minus(u))));
            return n
        }(i, Z(i, r)), i.precision = t, i.rounding = n, I(u > 2 ? r.neg() : r, t, n, !0)) : new i(NaN)
    }, E.squareRoot = E.sqrt = function() {
        var t, n, r, i, a, s, o = this.d,
            u = this.e,
            l = this.s,
            c = this.constructor;
        if (1 !== l || !o || !o[0]) return new c(!l || l < 0 && (!o || o[0]) ? NaN : o ? this : 1 / 0);
        for (f = !1, 0 == (l = Math.sqrt(+this)) || l == 1 / 0 ? (((n = q(o)).length + u) % 2 == 0 && (n += "0"), l = Math.sqrt(n), u = w((u + 1) / 2) - (u < 0 || u % 2), i = new c(n = l == 1 / 0 ? "5e" + u : (n = l.toExponential()).slice(0, n.indexOf("e") + 1) + u)) : i = new c(l.toString()), r = (u = c.precision) + 3;;)
            if (i = (s = i).plus(k(this, s, r + 2, 1)).times(.5), q(s.d).slice(0, r) === (n = q(i.d)).slice(0, r)) {
                if ("9999" != (n = n.slice(r - 3, r + 1)) && (a || "4999" != n)) {
                    +n && (+n.slice(1) || "5" != n.charAt(0)) || (I(i, u + 1, 1), t = !i.times(i).eq(this));
                    break
                }
                if (!a && (I(s, u + 1, 0), s.times(s).eq(this))) {
                    i = s;
                    break
                }
                r += 4, a = 1
            } return f = !0, I(i, u, c.rounding, t)
    }, E.tangent = E.tan = function() {
        var t, n, r = this,
            i = r.constructor;
        return r.isFinite() ? r.isZero() ? new i(r) : (t = i.precision, n = i.rounding, i.precision = t + 10, i.rounding = 1, (r = r.sin()).s = 1, r = k(r, new i(1).minus(r.times(r)).sqrt(), t + 10, 0), i.precision = t, i.rounding = n, I(2 == u || 4 == u ? r.neg() : r, t, n, !0)) : new i(NaN)
    }, E.times = E.mul = function(t) {
        var n, r, i, a, s, o, u, l, c, d = this.constructor,
            h = this.d,
            p = (t = new d(t)).d;
        if (t.s *= this.s, !h || !h[0] || !p || !p[0]) return new d(!t.s || h && !h[0] && !p || p && !p[0] && !h ? NaN : !h || !p ? t.s / 0 : 0 * t.s);
        for (r = w(this.e / 7) + w(t.e / 7), (l = h.length) < (c = p.length) && (s = h, h = p, p = s, o = l, l = c, c = o), s = [], i = o = l + c; i--;) s.push(0);
        for (i = c; --i >= 0;) {
            for (n = 0, a = l + i; a > i;) u = s[a] + p[i] * h[a - i - 1] + n, s[a--] = u % 1e7 | 0, n = u / 1e7 | 0;
            s[a] = (s[a] + n) % 1e7 | 0
        }
        for (; !s[--o];) s.pop();
        return n ? ++r : s.shift(), t.d = s, t.e = N(s, r), f ? I(t, d.precision, d.rounding) : t
    }, E.toBinary = function(t, n) {
        return Y(this, 2, t, n)
    }, E.toDecimalPlaces = E.toDP = function(t, n) {
        var r = this,
            i = r.constructor;
        return (r = new i(r), void 0 === t) ? r : (C(t, 0, 1e9), void 0 === n ? n = i.rounding : C(n, 0, 8), I(r, t + r.e + 1, n))
    }, E.toExponential = function(t, n) {
        var r, i = this,
            a = i.constructor;
        return void 0 === t ? r = L(i, !0) : (C(t, 0, 1e9), void 0 === n ? n = a.rounding : C(n, 0, 8), r = L(i = I(new a(i), t + 1, n), !0, t + 1)), i.isNeg() && !i.isZero() ? "-" + r : r
    }, E.toFixed = function(t, n) {
        var r, i, a = this.constructor;
        return void 0 === t ? r = L(this) : (C(t, 0, 1e9), void 0 === n ? n = a.rounding : C(n, 0, 8), r = L(i = I(new a(this), t + this.e + 1, n), !1, t + i.e + 1)), this.isNeg() && !this.isZero() ? "-" + r : r
    }, E.toFraction = function(t) {
        var n, r, i, a, s, o, u, l, c, d, h, p, m = this.d,
            y = this.constructor;
        if (!m) return new y(this);
        if (c = r = new y(1), i = l = new y(0), o = (s = (n = new y(i)).e = j(m) - this.e - 1) % 7, n.d[0] = b(10, o < 0 ? 7 + o : o), null == t) t = s > 0 ? n : c;
        else {
            if (!(u = new y(t)).isInt() || u.lt(c)) throw Error(v + u);
            t = u.gt(n) ? s > 0 ? n : c : u
        }
        for (f = !1, u = new y(q(m)), d = y.precision, y.precision = s = 7 * m.length * 2; h = k(u, n, 0, 1, 1), 1 != (a = r.plus(h.times(i))).cmp(t);) r = i, i = a, a = c, c = l.plus(h.times(a)), l = a, a = n, n = u.minus(h.times(a)), u = a;
        return a = k(t.minus(r), i, 0, 1, 1), l = l.plus(a.times(c)), r = r.plus(a.times(i)), l.s = c.s = this.s, p = 1 > k(c, i, s, 1).minus(this).abs().cmp(k(l, r, s, 1).minus(this).abs()) ? [c, i] : [l, r], y.precision = d, f = !0, p
    }, E.toHexadecimal = E.toHex = function(t, n) {
        return Y(this, 16, t, n)
    }, E.toNearest = function(t, n) {
        var r = this,
            i = r.constructor;
        if (r = new i(r), null == t) {
            if (!r.d) return r;
            t = new i(1), n = i.rounding
        } else {
            if (t = new i(t), void 0 === n ? n = i.rounding : C(n, 0, 8), !r.d) return t.s ? r : t;
            if (!t.d) return t.s && (t.s = r.s), t
        }
        return t.d[0] ? (f = !1, r = k(r, t, 0, n, 1).times(t), f = !0, I(r)) : (t.s = r.s, r = t), r
    }, E.toNumber = function() {
        return +this
    }, E.toOctal = function(t, n) {
        return Y(this, 8, t, n)
    }, E.toPower = E.pow = function(t) {
        var n, r, i, a, s, o, u = this,
            l = u.constructor,
            c = +(t = new l(t));
        if (!u.d || !t.d || !u.d[0] || !t.d[0]) return new l(b(+u, c));
        if ((u = new l(u)).eq(1)) return u;
        if (i = l.precision, s = l.rounding, t.eq(1)) return I(u, i, s);
        if ((n = w(t.e / 7)) >= t.d.length - 1 && (r = c < 0 ? -c : c) <= 0x1fffffffffffff) return a = B(l, u, r, i), t.s < 0 ? new l(1).div(a) : I(a, i, s);
        if ((o = u.s) < 0) {
            if (n < t.d.length - 1) return new l(NaN);
            if ((1 & t.d[n]) == 0 && (o = 1), 0 == u.e && 1 == u.d[0] && 1 == u.d.length) return u.s = o, u
        }
        return (n = 0 != (r = b(+u, c)) && isFinite(r) ? new l(r + "").e : w(c * (Math.log("0." + q(u.d)) / Math.LN10 + u.e + 1))) > l.maxE + 1 || n < l.minE - 1 ? new l(n > 0 ? o / 0 : 0) : (f = !1, l.rounding = u.s = 1, r = Math.min(12, (n + "").length), (a = V(t.times(H(u, i + r)), i)).d && A((a = I(a, i + 5, 1)).d, i, s) && (n = i + 10, +q((a = I(V(t.times(H(u, n + r)), n), n + 5, 1)).d).slice(i + 1, i + 15) + 1 == 1e14 && (a = I(a, i + 1, 0))), a.s = o, f = !0, l.rounding = s, I(a, i, s))
    }, E.toPrecision = function(t, n) {
        var r, i = this,
            a = i.constructor;
        return void 0 === t ? r = L(i, i.e <= a.toExpNeg || i.e >= a.toExpPos) : (C(t, 1, 1e9), void 0 === n ? n = a.rounding : C(n, 0, 8), r = L(i = I(new a(i), t, n), t <= i.e || i.e <= a.toExpNeg, t)), i.isNeg() && !i.isZero() ? "-" + r : r
    }, E.toSignificantDigits = E.toSD = function(t, n) {
        var r = this.constructor;
        return void 0 === t ? (t = r.precision, n = r.rounding) : (C(t, 1, 1e9), void 0 === n ? n = r.rounding : C(n, 0, 8)), I(new r(this), t, n)
    }, E.toString = function() {
        var t = this.constructor,
            n = L(this, this.e <= t.toExpNeg || this.e >= t.toExpPos);
        return this.isNeg() && !this.isZero() ? "-" + n : n
    }, E.truncated = E.trunc = function() {
        return I(new this.constructor(this), this.e + 1, 1)
    }, E.valueOf = E.toJSON = function() {
        var t = this.constructor,
            n = L(this, this.e <= t.toExpNeg || this.e >= t.toExpPos);
        return this.isNeg() ? "-" + n : n
    };
    var k = function() {
        function t(t, n, r) {
            var i, a = 0,
                s = t.length;
            for (t = t.slice(); s--;) i = t[s] * n + a, t[s] = i % r | 0, a = i / r | 0;
            return a && t.unshift(a), t
        }

        function n(t, n, r, i) {
            var a, s;
            if (r != i) s = r > i ? 1 : -1;
            else
                for (a = s = 0; a < r; a++)
                    if (t[a] != n[a]) {
                        s = t[a] > n[a] ? 1 : -1;
                        break
                    } return s
        }

        function r(t, n, r, i) {
            for (var a = 0; r--;) t[r] -= a, a = +(t[r] < n[r]), t[r] = a * i + t[r] - n[r];
            for (; !t[0] && t.length > 1;) t.shift()
        }
        return function(i, a, s, u, l, c) {
            var d, h, f, p, v, m, y, g, b, _, x, P, S, T, R, E, q, C, A, D, k = i.constructor,
                L = i.s == a.s ? 1 : -1,
                N = i.d,
                M = a.d;
            if (!N || !N[0] || !M || !M[0]) return new k(!i.s || !a.s || (N ? M && N[0] == M[0] : !M) ? NaN : N && 0 == N[0] || !M ? 0 * L : L / 0);
            for (c ? (v = 1, h = i.e - a.e) : (c = 1e7, v = 7, h = w(i.e / v) - w(a.e / v)), A = M.length, q = N.length, _ = (b = new k(L)).d = [], f = 0; M[f] == (N[f] || 0); f++);
            if (M[f] > (N[f] || 0) && h--, null == s ? (T = s = k.precision, u = k.rounding) : T = l ? s + (i.e - a.e) + 1 : s, T < 0) _.push(1), m = !0;
            else {
                if (T = T / v + 2 | 0, f = 0, 1 == A) {
                    for (p = 0, M = M[0], T++;
                        (f < q || p) && T--; f++) R = p * c + (N[f] || 0), _[f] = R / M | 0, p = R % M | 0;
                    m = p || f < q
                } else {
                    for ((p = c / (M[0] + 1) | 0) > 1 && (M = t(M, p, c), N = t(N, p, c), A = M.length, q = N.length), E = A, P = (x = N.slice(0, A)).length; P < A;) x[P++] = 0;
                    (D = M.slice()).unshift(0), C = M[0], M[1] >= c / 2 && ++C;
                    do p = 0, (d = n(M, x, A, P)) < 0 ? (S = x[0], A != P && (S = S * c + (x[1] || 0)), (p = S / C | 0) > 1 ? (p >= c && (p = c - 1), g = (y = t(M, p, c)).length, P = x.length, 1 == (d = n(y, x, g, P)) && (p--, r(y, A < g ? D : M, g, c))) : (0 == p && (d = p = 1), y = M.slice()), (g = y.length) < P && y.unshift(0), r(x, y, P, c), -1 == d && (P = x.length, (d = n(M, x, A, P)) < 1 && (p++, r(x, A < P ? D : M, P, c))), P = x.length) : 0 === d && (p++, x = [0]), _[f++] = p, d && x[0] ? x[P++] = N[E] || 0 : (x = [N[E]], P = 1); while ((E++ < q || void 0 !== x[0]) && T--) m = void 0 !== x[0]
                }
                _[0] || _.shift()
            }
            if (1 == v) b.e = h, o = m;
            else {
                for (f = 1, p = _[0]; p >= 10; p /= 10) f++;
                b.e = f + h * v - 1, I(b, l ? s + b.e + 1 : s, u, m)
            }
            return b
        }
    }();

    function I(t, n, r, i) {
        var a, s, o, u, l, c, d, h, p, v = t.constructor;
        e: if (null != n) {
            if (!(h = t.d)) return t;
            for (a = 1, u = h[0]; u >= 10; u /= 10) a++;
            if ((s = n - a) < 0) s += 7, o = n, l = (d = h[p = 0]) / b(10, a - o - 1) % 10 | 0;
            else if ((p = Math.ceil((s + 1) / 7)) >= (u = h.length))
                if (i) {
                    for (; u++ <= p;) h.push(0);
                    d = l = 0, a = 1, s %= 7, o = s - 7 + 1
                } else break e;
            else {
                for (d = u = h[p], a = 1; u >= 10; u /= 10) a++;
                s %= 7, l = (o = s - 7 + a) < 0 ? 0 : d / b(10, a - o - 1) % 10 | 0
            }
            if (i = i || n < 0 || void 0 !== h[p + 1] || (o < 0 ? d : d % b(10, a - o - 1)), c = r < 4 ? (l || i) && (0 == r || r == (t.s < 0 ? 3 : 2)) : l > 5 || 5 == l && (4 == r || i || 6 == r && (s > 0 ? o > 0 ? d / b(10, a - o) : 0 : h[p - 1]) % 10 & 1 || r == (t.s < 0 ? 8 : 7)), n < 1 || !h[0]) return h.length = 0, c ? (n -= t.e + 1, h[0] = b(10, (7 - n % 7) % 7), t.e = -n || 0) : h[0] = t.e = 0, t;
            if (0 == s ? (h.length = p, u = 1, p--) : (h.length = p + 1, u = b(10, 7 - s), h[p] = o > 0 ? (d / b(10, a - o) % b(10, o) | 0) * u : 0), c)
                for (;;)
                    if (0 == p) {
                        for (s = 1, o = h[0]; o >= 10; o /= 10) s++;
                        for (o = h[0] += u, u = 1; o >= 10; o /= 10) u++;
                        s != u && (t.e++, 1e7 == h[0] && (h[0] = 1));
                        break
                    } else {
                        if (h[p] += u, 1e7 != h[p]) break;
                        h[p--] = 0, u = 1
                    } for (s = h.length; 0 === h[--s];) h.pop()
        }
        return f && (t.e > v.maxE ? (t.d = null, t.e = NaN) : t.e < v.minE && (t.e = 0, t.d = [0])), t
    }

    function L(t, n, r) {
        if (!t.isFinite()) return K(t);
        var i, a = t.e,
            s = q(t.d),
            o = s.length;
        return n ? (r && (i = r - o) > 0 ? s = s.charAt(0) + "." + s.slice(1) + F(i) : o > 1 && (s = s.charAt(0) + "." + s.slice(1)), s = s + (t.e < 0 ? "e" : "e+") + t.e) : a < 0 ? (s = "0." + F(-a - 1) + s, r && (i = r - o) > 0 && (s += F(i))) : a >= o ? (s += F(a + 1 - o), r && (i = r - a - 1) > 0 && (s = s + "." + F(i))) : ((i = a + 1) < o && (s = s.slice(0, i) + "." + s.slice(i)), r && (i = r - o) > 0 && (a + 1 === o && (s += "."), s += F(i))), s
    }

    function N(t, n) {
        var r = t[0];
        for (n *= 7; r >= 10; r /= 10) n++;
        return n
    }

    function M(t, n, r) {
        if (n > T) throw f = !0, r && (t.precision = r), Error(m);
        return I(new t(c), n, 1, !0)
    }

    function O(t, n, r) {
        if (n > R) throw Error(m);
        return I(new t(d), n, r, !0)
    }

    function j(t) {
        var n = t.length - 1,
            r = 7 * n + 1;
        if (n = t[n]) {
            for (; n % 10 == 0; n /= 10) r--;
            for (n = t[0]; n >= 10; n /= 10) r++
        }
        return r
    }

    function F(t) {
        for (var n = ""; t--;) n += "0";
        return n
    }

    function B(t, n, r, i) {
        var a, s = new t(1),
            o = Math.ceil(i / 7 + 4);
        for (f = !1;;) {
            if (r % 2 && Q((s = s.times(n)).d, o) && (a = !0), 0 === (r = w(r / 2))) {
                r = s.d.length - 1, a && 0 === s.d[r] && ++s.d[r];
                break
            }
            Q((n = n.times(n)).d, o)
        }
        return f = !0, s
    }

    function U(t) {
        return 1 & t.d[t.d.length - 1]
    }

    function G(t, n, r) {
        for (var i, a, s = new t(n[0]), o = 0; ++o < n.length;) {
            if (!(a = new t(n[o])).s) {
                s = a;
                break
            }((i = s.cmp(a)) === r || 0 === i && s.s === r) && (s = a)
        }
        return s
    }

    function V(t, n) {
        var r, i, a, s, o, u, l, c = 0,
            d = 0,
            h = 0,
            p = t.constructor,
            v = p.rounding,
            m = p.precision;
        if (!t.d || !t.d[0] || t.e > 17) return new p(t.d ? !t.d[0] ? 1 : t.s < 0 ? 0 : 1 / 0 : t.s ? t.s < 0 ? 0 : t : 0 / 0);
        for (null == n ? (f = !1, l = m) : l = n, u = new p(.03125); t.e > -2;) t = t.times(u), h += 5;
        for (l += i = Math.log(b(2, h)) / Math.LN10 * 2 + 5 | 0, r = s = o = new p(1), p.precision = l;;) {
            if (s = I(s.times(t), l, 1), r = r.times(++d), q((u = o.plus(k(s, r, l, 1))).d).slice(0, l) === q(o.d).slice(0, l)) {
                for (a = h; a--;) o = I(o.times(o), l, 1);
                if (null != n) return p.precision = m, o;
                if (!(c < 3 && A(o.d, l - i, v, c))) return I(o, p.precision = m, v, f = !0);
                p.precision = l += 10, r = s = u = new p(1), d = 0, c++
            }
            o = u
        }
    }

    function H(t, n) {
        var r, i, a, s, o, u, l, c, d, h, p, v = 1,
            m = t,
            y = m.d,
            g = m.constructor,
            w = g.rounding,
            b = g.precision;
        if (m.s < 0 || !y || !y[0] || !m.e && 1 == y[0] && 1 == y.length) return new g(y && !y[0] ? -1 / 0 : 1 != m.s ? NaN : y ? 0 : m);
        if (null == n ? (f = !1, d = b) : d = n, g.precision = d += 10, i = (r = q(y)).charAt(0), !(15e14 > Math.abs(s = m.e))) return c = M(g, d + 2, b).times(s + ""), m = H(new g(i + "." + r.slice(1)), d - 10).plus(c), g.precision = b, null == n ? I(m, b, w, f = !0) : m;
        for (; i < 7 && 1 != i || 1 == i && r.charAt(1) > 3;) i = (r = q((m = m.times(t)).d)).charAt(0), v++;
        for (s = m.e, i > 1 ? (m = new g("0." + r), s++) : m = new g(i + "." + r.slice(1)), h = m, l = o = m = k(m.minus(1), m.plus(1), d, 1), p = I(m.times(m), d, 1), a = 3;;) {
            if (o = I(o.times(p), d, 1), q((c = l.plus(k(o, new g(a), d, 1))).d).slice(0, d) === q(l.d).slice(0, d)) {
                if (l = l.times(2), 0 !== s && (l = l.plus(M(g, d + 2, b).times(s + ""))), l = k(l, new g(v), d, 1), null != n) return g.precision = b, l;
                if (!A(l.d, d - 10, w, u)) return I(l, g.precision = b, w, f = !0);
                g.precision = d += 10, c = o = m = k(h.minus(1), h.plus(1), d, 1), p = I(m.times(m), d, 1), a = u = 1
            }
            l = c, a += 2
        }
    }

    function K(t) {
        return String(t.s * t.s / 0)
    }

    function z(t, n) {
        var r, i, a;
        for ((r = n.indexOf(".")) > -1 && (n = n.replace(".", "")), (i = n.search(/e/i)) > 0 ? (r < 0 && (r = i), r += +n.slice(i + 1), n = n.substring(0, i)) : r < 0 && (r = n.length), i = 0; 48 === n.charCodeAt(i); i++);
        for (a = n.length; 48 === n.charCodeAt(a - 1); --a);
        if (n = n.slice(i, a)) {
            if (a -= i, t.e = r = r - i - 1, t.d = [], i = (r + 1) % 7, r < 0 && (i += 7), i < a) {
                for (i && t.d.push(+n.slice(0, i)), a -= 7; i < a;) t.d.push(+n.slice(i, i += 7));
                i = 7 - (n = n.slice(i)).length
            } else i -= a;
            for (; i--;) n += "0";
            t.d.push(+n), f && (t.e > t.constructor.maxE ? (t.d = null, t.e = NaN) : t.e < t.constructor.minE && (t.e = 0, t.d = [0]))
        } else t.e = 0, t.d = [0];
        return t
    }

    function W(t, n, r, i, a) {
        var s, o, u, l, c = t.precision,
            d = Math.ceil(c / 7);
        for (f = !1, l = r.times(r), u = new t(i);;) {
            if (o = k(u.times(l), new t(n++ * n++), c, 1), u = a ? i.plus(o) : i.minus(o), i = k(o.times(l), new t(n++ * n++), c, 1), void 0 !== (o = u.plus(i)).d[d]) {
                for (s = d; o.d[s] === u.d[s] && s--;);
                if (-1 == s) break
            }
            s = u, u = i, i = o, o = s
        }
        return f = !0, o.d.length = d + 1, o
    }

    function J(t, n) {
        for (var r = t; --n;) r *= t;
        return r
    }

    function Z(t, n) {
        var r, i = n.s < 0,
            a = O(t, t.precision, 1),
            s = a.times(.5);
        if ((n = n.abs()).lte(s)) return u = i ? 4 : 1, n;
        if ((r = n.divToInt(a)).isZero()) u = i ? 3 : 2;
        else {
            if ((n = n.minus(r.times(a))).lte(s)) return u = U(r) ? i ? 2 : 3 : i ? 4 : 1, n;
            u = U(r) ? i ? 1 : 4 : i ? 3 : 2
        }
        return n.minus(a).abs()
    }

    function Y(t, n, r, i) {
        var a, s, u, c, d, h, f, p, v, m = t.constructor,
            y = void 0 !== r;
        if (y ? (C(r, 1, 1e9), void 0 === i ? i = m.rounding : C(i, 0, 8)) : (r = m.precision, i = m.rounding), t.isFinite()) {
            for (u = (f = L(t)).indexOf("."), y ? (a = 2, 16 == n ? r = 4 * r - 3 : 8 == n && (r = 3 * r - 2)) : a = n, u >= 0 && (f = f.replace(".", ""), (v = new m(1)).e = f.length - u, v.d = D(L(v), 10, a), v.e = v.d.length), s = d = (p = D(f, 10, a)).length; 0 == p[--d];) p.pop();
            if (p[0]) {
                if (u < 0 ? s-- : ((t = new m(t)).d = p, t.e = s, p = (t = k(t, v, r, i, 0, a)).d, s = t.e, h = o), u = p[r], c = a / 2, h = h || void 0 !== p[r + 1], h = i < 4 ? (void 0 !== u || h) && (0 === i || i === (t.s < 0 ? 3 : 2)) : u > c || u === c && (4 === i || h || 6 === i && 1 & p[r - 1] || i === (t.s < 0 ? 8 : 7)), p.length = r, h)
                    for (; ++p[--r] > a - 1;) p[r] = 0, r || (++s, p.unshift(1));
                for (d = p.length; !p[d - 1]; --d);
                for (u = 0, f = ""; u < d; u++) f += l.charAt(p[u]);
                if (y) {
                    if (d > 1)
                        if (16 == n || 8 == n) {
                            for (u = 16 == n ? 4 : 3, --d; d % u; d++) f += "0";
                            for (d = (p = D(f, a, n)).length; !p[d - 1]; --d);
                            for (u = 1, f = "1."; u < d; u++) f += l.charAt(p[u])
                        } else f = f.charAt(0) + "." + f.slice(1);
                    f = f + (s < 0 ? "p" : "p+") + s
                } else if (s < 0) {
                    for (; ++s;) f = "0" + f;
                    f = "0." + f
                } else if (++s > d)
                    for (s -= d; s--;) f += "0";
                else s < d && (f = f.slice(0, s) + "." + f.slice(s))
            } else f = y ? "0p+0" : "0";
            f = (16 == n ? "0x" : 2 == n ? "0b" : 8 == n ? "0o" : "") + f
        } else f = K(t);
        return t.s < 0 ? "-" + f : f
    }

    function Q(t, n) {
        if (t.length > n) return t.length = n, !0
    }

    function X(t) {
        return new this(t).abs()
    }

    function $(t) {
        return new this(t).acos()
    }

    function ee(t) {
        return new this(t).acosh()
    }

    function et(t, n) {
        return new this(t).plus(n)
    }

    function en(t) {
        return new this(t).asin()
    }

    function er(t) {
        return new this(t).asinh()
    }

    function ei(t) {
        return new this(t).atan()
    }

    function ea(t) {
        return new this(t).atanh()
    }

    function es(t, n) {
        t = new this(t), n = new this(n);
        var r, i = this.precision,
            a = this.rounding,
            s = i + 4;
        return t.s && n.s ? t.d || n.d ? !n.d || t.isZero() ? (r = n.s < 0 ? O(this, i, a) : new this(0)).s = t.s : !t.d || n.isZero() ? (r = O(this, s, 1).times(.5)).s = t.s : n.s < 0 ? (this.precision = s, this.rounding = 1, r = this.atan(k(t, n, s, 1)), n = O(this, s, 1), this.precision = i, this.rounding = a, r = t.s < 0 ? r.minus(n) : r.plus(n)) : r = this.atan(k(t, n, s, 1)) : (r = O(this, s, 1).times(n.s > 0 ? .25 : .75)).s = t.s : r = new this(NaN), r
    }

    function eo(t) {
        return new this(t).cbrt()
    }

    function eu(t) {
        return I(t = new this(t), t.e + 1, 2)
    }

    function el(t, n, r) {
        return new this(t).clamp(n, r)
    }

    function ec(t) {
        if (!t || "object" != typeof t) throw Error(p + "Object expected");
        var n, r, i, a = !0 === t.defaults,
            s = ["precision", 1, 1e9, "rounding", 0, 8, "toExpNeg", -9e15, 0, "toExpPos", 0, 9e15, "maxE", 0, 9e15, "minE", -9e15, 0, "modulo", 0, 9];
        for (n = 0; n < s.length; n += 3)
            if (r = s[n], a && (this[r] = h[r]), void 0 !== (i = t[r]))
                if (w(i) === i && i >= s[n + 1] && i <= s[n + 2]) this[r] = i;
                else throw Error(v + r + ": " + i);
        if (r = "crypto", a && (this[r] = h[r]), void 0 !== (i = t[r]))
            if (!0 === i || !1 === i || 0 === i || 1 === i)
                if (i)
                    if ("u" > typeof crypto && crypto && (crypto.getRandomValues || crypto.randomBytes)) this[r] = !0;
                    else throw Error(y);
        else this[r] = !1;
        else throw Error(v + r + ": " + i);
        return this
    }

    function ed(t) {
        return new this(t).cos()
    }

    function eh(t) {
        return new this(t).cosh()
    }

    function ef(t, n) {
        return new this(t).div(n)
    }

    function ep(t) {
        return new this(t).exp()
    }

    function ev(t) {
        return I(t = new this(t), t.e + 1, 3)
    }

    function em() {
        var t, n, r = new this(0);
        for (t = 0, f = !1; t < arguments.length;)
            if (n = new this(arguments[t++]), n.d) r.d && (r = r.plus(n.times(n)));
            else {
                if (n.s) return f = !0, new this(1 / 0);
                r = n
            } return f = !0, r.sqrt()
    }

    function ey(t) {
        return t instanceof ej || t && t.toStringTag === g || !1
    }

    function eg(t) {
        return new this(t).ln()
    }

    function ew(t, n) {
        return new this(t).log(n)
    }

    function eb(t) {
        return new this(t).log(2)
    }

    function e_(t) {
        return new this(t).log(10)
    }

    function ex() {
        return G(this, arguments, -1)
    }

    function eP() {
        return G(this, arguments, 1)
    }

    function eS(t, n) {
        return new this(t).mod(n)
    }

    function eT(t, n) {
        return new this(t).mul(n)
    }

    function eR(t, n) {
        return new this(t).pow(n)
    }

    function eE(t) {
        var n, r, i, a, s = 0,
            o = new this(1),
            u = [];
        if (void 0 === t ? t = this.precision : C(t, 1, 1e9), i = Math.ceil(t / 7), this.crypto)
            if (crypto.getRandomValues)
                for (n = crypto.getRandomValues(new Uint32Array(i)); s < i;)(a = n[s]) >= 429e7 ? n[s] = crypto.getRandomValues(new Uint32Array(1))[0] : u[s++] = a % 1e7;
            else if (crypto.randomBytes) {
            for (n = crypto.randomBytes(i *= 4); s < i;)(a = n[s] + (n[s + 1] << 8) + (n[s + 2] << 16) + ((127 & n[s + 3]) << 24)) >= 214e7 ? crypto.randomBytes(4).copy(n, s) : (u.push(a % 1e7), s += 4);
            s = i / 4
        } else throw Error(y);
        else
            for (; s < i;) u[s++] = 1e7 * Math.random() | 0;
        for (i = u[--s], t %= 7, i && t && (a = b(10, 7 - t), u[s] = (i / a | 0) * a); 0 === u[s]; s--) u.pop();
        if (s < 0) r = 0, u = [0];
        else {
            for (r = -1; 0 === u[0]; r -= 7) u.shift();
            for (i = 1, a = u[0]; a >= 10; a /= 10) i++;
            i < 7 && (r -= 7 - i)
        }
        return o.e = r, o.d = u, o
    }

    function eq(t) {
        return I(t = new this(t), t.e + 1, this.rounding)
    }

    function eC(t) {
        return (t = new this(t)).d ? t.d[0] ? t.s : 0 * t.s : t.s || NaN
    }

    function eA(t) {
        return new this(t).sin()
    }

    function eD(t) {
        return new this(t).sinh()
    }

    function ek(t) {
        return new this(t).sqrt()
    }

    function eI(t, n) {
        return new this(t).sub(n)
    }

    function eL() {
        var t = 0,
            n = arguments,
            r = new this(n[0]);
        for (f = !1; r.s && ++t < n.length;) r = r.plus(n[t]);
        return f = !0, I(r, this.precision, this.rounding)
    }

    function eN(t) {
        return new this(t).tan()
    }

    function eM(t) {
        return new this(t).tanh()
    }

    function eO(t) {
        return I(t = new this(t), t.e + 1, 1)
    }
    E[Symbol.for("nodejs.util.inspect.custom")] = E.toString, E[Symbol.toStringTag] = "Decimal";
    var ej = E.constructor = function t(n) {
        var r, i, a;

        function s(t) {
            var n, r, i;
            if (!(this instanceof s)) return new s(t);
            if (this.constructor = s, ey(t)) {
                this.s = t.s, f ? !t.d || t.e > s.maxE ? (this.e = NaN, this.d = null) : t.e < s.minE ? (this.e = 0, this.d = [0]) : (this.e = t.e, this.d = t.d.slice()) : (this.e = t.e, this.d = t.d ? t.d.slice() : t.d);
                return
            }
            if ("number" == (i = typeof t)) {
                if (0 === t) {
                    this.s = 1 / t < 0 ? -1 : 1, this.e = 0, this.d = [0];
                    return
                }
                if (t < 0 ? (t = -t, this.s = -1) : this.s = 1, t === ~~t && t < 1e7) {
                    for (n = 0, r = t; r >= 10; r /= 10) n++;
                    f ? n > s.maxE ? (this.e = NaN, this.d = null) : n < s.minE ? (this.e = 0, this.d = [0]) : (this.e = n, this.d = [t]) : (this.e = n, this.d = [t]);
                    return
                }
                if (0 * t != 0) {
                    t || (this.s = NaN), this.e = NaN, this.d = null;
                    return
                }
                return z(this, t.toString())
            }
            if ("string" === i) return 45 === (r = t.charCodeAt(0)) ? (t = t.slice(1), this.s = -1) : (43 === r && (t = t.slice(1)), this.s = 1), S.test(t) ? z(this, t) : function(t, n) {
                var r, i, a, s, o, u, l, c, d;
                if (n.indexOf("_") > -1) {
                    if (n = n.replace(/(\d)_(?=\d)/g, "$1"), S.test(n)) return z(t, n)
                } else if ("Infinity" === n || "NaN" === n) return +n || (t.s = NaN), t.e = NaN, t.d = null, t;
                if (x.test(n)) r = 16, n = n.toLowerCase();
                else if (_.test(n)) r = 2;
                else if (P.test(n)) r = 8;
                else throw Error(v + n);
                for ((s = n.search(/p/i)) > 0 ? (l = +n.slice(s + 1), n = n.substring(2, s)) : n = n.slice(2), o = (s = n.indexOf(".")) >= 0, i = t.constructor, o && (s = (u = (n = n.replace(".", "")).length) - s, a = B(i, new i(r), s, 2 * s)), s = d = (c = D(n, r, 1e7)).length - 1; 0 === c[s]; --s) c.pop();
                return s < 0 ? new i(0 * t.s) : (t.e = N(c, d), t.d = c, f = !1, o && (t = k(t, a, 4 * u)), l && (t = t.times(54 > Math.abs(l) ? b(2, l) : ej.pow(2, l))), f = !0, t)
            }(this, t);
            if ("bigint" === i) return t < 0 ? (t = -t, this.s = -1) : this.s = 1, z(this, t.toString());
            throw Error(v + t)
        }
        if (s.prototype = E, s.ROUND_UP = 0, s.ROUND_DOWN = 1, s.ROUND_CEIL = 2, s.ROUND_FLOOR = 3, s.ROUND_HALF_UP = 4, s.ROUND_HALF_DOWN = 5, s.ROUND_HALF_EVEN = 6, s.ROUND_HALF_CEIL = 7, s.ROUND_HALF_FLOOR = 8, s.EUCLID = 9, s.config = s.set = ec, s.clone = t, s.isDecimal = ey, s.abs = X, s.acos = $, s.acosh = ee, s.add = et, s.asin = en, s.asinh = er, s.atan = ei, s.atanh = ea, s.atan2 = es, s.cbrt = eo, s.ceil = eu, s.clamp = el, s.cos = ed, s.cosh = eh, s.div = ef, s.exp = ep, s.floor = ev, s.hypot = em, s.ln = eg, s.log = ew, s.log10 = e_, s.log2 = eb, s.max = ex, s.min = eP, s.mod = eS, s.mul = eT, s.pow = eR, s.random = eE, s.round = eq, s.sign = eC, s.sin = eA, s.sinh = eD, s.sqrt = ek, s.sub = eI, s.sum = eL, s.tan = eN, s.tanh = eM, s.trunc = eO, void 0 === n && (n = {}), n && !0 !== n.defaults)
            for (r = 0, a = ["precision", "rounding", "toExpNeg", "toExpPos", "maxE", "minE", "modulo", "crypto"]; r < a.length;) n.hasOwnProperty(i = a[r++]) || (n[i] = this[i]);
        return s.config(n), s
    }(h);
    c = new ej(c), d = new ej(d), new ej(10);
    var eF = new ej(0),
        eB = new ej(-0),
        eU = t.i(274466);

    function eG(t, n) {
        var r = n && n.cache ? n.cache : eW,
            i = n && n.serializer ? n.serializer : eK;
        return (n && n.strategy ? n.strategy : function(t, n) {
            var r, i, a = 1 === t.length ? eV : eH;
            return r = n.cache.create(), i = n.serializer, a.bind(this, t, r, i)
        })(t, {
            cache: r,
            serializer: i
        })
    }

    function eV(t, n, r, i) {
        var a = null == i || "number" == typeof i || "boolean" == typeof i ? i : r(i),
            s = n.get(a);
        return void 0 === s && (s = t.call(this, i), n.set(a, s)), s
    }

    function eH(t, n, r) {
        var i = Array.prototype.slice.call(arguments, 3),
            a = r(i),
            s = n.get(a);
        return void 0 === s && (s = t.apply(this, i), n.set(a, s)), s
    }
    var eK = function() {
            return JSON.stringify(arguments)
        },
        ez = function() {
            function t() {
                this.cache = Object.create(null)
            }
            return t.prototype.get = function(t) {
                return this.cache[t]
            }, t.prototype.set = function(t, n) {
                this.cache[t] = n
            }, t
        }(),
        eW = {
            create: function() {
                return new ez
            }
        },
        eJ = {
            variadic: function(t, n) {
                var r, i;
                return r = n.cache.create(), i = n.serializer, eH.bind(this, t, r, i)
            },
            monadic: function(t, n) {
                var r, i;
                return r = n.cache.create(), i = n.serializer, eV.bind(this, t, r, i)
            }
        };

    function eZ(t, n) {
        if ("function" == typeof t.repeat) return t.repeat(n);
        for (var r = Array(n), i = 0; i < r.length; i++) r[i] = t;
        return r.join("")
    }

    function eY(t, n, r, i) {
        t.get(n) || t.set(n, Object.create(null)), t.get(n)[r] = i
    }

    function eQ(t, n) {
        for (var r = [], i = 2; i < arguments.length; i++) r[i - 2] = arguments[i];
        var a = t.get(n);
        if (!a) throw TypeError("".concat(n, " InternalSlot has not been initialized"));
        return r.reduce(function(t, n) {
            return t[n] = a[n], t
        }, Object.create(null))
    }

    function eX(t, n, r) {
        if (void 0 === r && (r = Error), !t) throw new r(n)
    }
    var e$ = eG(function() {
            for (var t, n = [], r = 0; r < arguments.length; r++) n[r] = arguments[r];
            return new((t = Intl.NumberFormat).bind.apply(t, (0, eU.__spreadArray)([void 0], n, !1)))
        }, {
            strategy: eJ.variadic
        }),
        e0 = eG(function() {
            for (var t, n = [], r = 0; r < arguments.length; r++) n[r] = arguments[r];
            return new((t = Intl.DateTimeFormat).bind.apply(t, (0, eU.__spreadArray)([void 0], n, !1)))
        }, {
            strategy: eJ.variadic
        }),
        e1 = eG(function() {
            for (var t, n = [], r = 0; r < arguments.length; r++) n[r] = arguments[r];
            return new((t = Intl.PluralRules).bind.apply(t, (0, eU.__spreadArray)([void 0], n, !1)))
        }, {
            strategy: eJ.variadic
        }),
        e2 = eG(function() {
            for (var t, n = [], r = 0; r < arguments.length; r++) n[r] = arguments[r];
            return new((t = Intl.Locale).bind.apply(t, (0, eU.__spreadArray)([void 0], n, !1)))
        }, {
            strategy: eJ.variadic
        }),
        e4 = eG(function() {
            for (var t, n = [], r = 0; r < arguments.length; r++) n[r] = arguments[r];
            return new((t = Intl.ListFormat).bind.apply(t, (0, eU.__spreadArray)([void 0], n, !1)))
        }, {
            strategy: eJ.variadic
        });

    function e3(t) {
        if ("symbol" == typeof t) throw TypeError("Cannot convert a Symbol value to a string");
        return String(t)
    }

    function e5(t) {
        if ("number" == typeof t) return new ej(t);
        if (eX("bigint" != typeof t && "symbol" != typeof t, "BigInt and Symbol are not supported", TypeError), void 0 === t) return new ej(NaN);
        if (null === t || 0 === t) return eF;
        if (!0 === t) return new ej(1);
        if ("string" == typeof t) try {
            return new ej(t)
        } catch (t) {
            return new ej(NaN)
        }
        eX("object" == typeof t, "object expected", TypeError);
        var n = tw(t, "number");
        return eX("object" != typeof n, "object expected", TypeError), e5(n)
    }

    function e7(t) {
        if (!t.isFinite() || t.abs().greaterThan(8.64 * 1e15)) return new ej(NaN);
        var n = e5(t);
        if (n.isNaN() || n.isZero()) return eF;
        if (n.isFinite()) return n;
        var r = n.abs().floor();
        return n.isNegative() && (r = r.negated()), r
    }

    function e8(t) {
        if (null == t) throw TypeError("undefined/null cannot be converted to object");
        return Object(t)
    }

    function e6(t, n) {
        return Object.is ? Object.is(t, n) : t === n ? 0 !== t || 1 / t == 1 / n : t != t && n != n
    }

    function e9(t) {
        return Array(t)
    }

    function te(t, n) {
        return Object.prototype.hasOwnProperty.call(t, n)
    }

    function tt(t) {
        return null === t ? "Null" : void 0 === t ? "Undefined" : "function" == typeof t || "object" == typeof t ? "Object" : "number" == typeof t ? "Number" : "boolean" == typeof t ? "Boolean" : "string" == typeof t ? "String" : "symbol" == typeof t ? "Symbol" : "bigint" == typeof t ? "BigInt" : void 0
    }

    function tn(t, n) {
        return t - Math.floor(t / n) * n
    }

    function tr(t) {
        return Math.floor(t / 864e5)
    }

    function ti(t) {
        return tn(tr(t) + 4, 7)
    }

    function ta(t) {
        if (t < 100) {
            var n = new Date(0);
            return n.setUTCFullYear(t, 0, 1), n.setUTCHours(0, 0, 0, 0), n.getTime() / 864e5
        }
        return Date.UTC(t, 0) / 864e5
    }

    function ts(t) {
        return Date.UTC(t, 0)
    }

    function to(t) {
        return new Date(t).getUTCFullYear()
    }

    function tu(t) {
        return t % 4 != 0 ? 365 : t % 100 != 0 ? 366 : t % 400 != 0 ? 365 : 366
    }

    function tl(t) {
        return tr(t) - ta(to(t))
    }

    function tc(t) {
        return +(365 !== tu(to(t)))
    }

    function td(t) {
        var n = tl(t),
            r = tc(t);
        if (n >= 0 && n < 31) return 0;
        if (n < 59 + r) return 1;
        if (n < 90 + r) return 2;
        if (n < 120 + r) return 3;
        if (n < 151 + r) return 4;
        if (n < 181 + r) return 5;
        if (n < 212 + r) return 6;
        if (n < 243 + r) return 7;
        if (n < 273 + r) return 8;
        if (n < 304 + r) return 9;
        if (n < 334 + r) return 10;
        if (n < 365 + r) return 11;
        throw Error("Invalid time")
    }

    function th(t) {
        var n = tl(t),
            r = td(t),
            i = tc(t);
        if (0 === r) return n + 1;
        if (1 === r) return n - 30;
        if (2 === r) return n - 58 - i;
        if (3 === r) return n - 89 - i;
        if (4 === r) return n - 119 - i;
        if (5 === r) return n - 150 - i;
        if (6 === r) return n - 180 - i;
        if (7 === r) return n - 211 - i;
        if (8 === r) return n - 242 - i;
        if (9 === r) return n - 272 - i;
        if (10 === r) return n - 303 - i;
        if (11 === r) return n - 333 - i;
        throw Error("Invalid time")
    }

    function tf(t) {
        return tn(Math.floor(t / 36e5), 24)
    }

    function tp(t) {
        return tn(Math.floor(t / 6e4), 60)
    }

    function tv(t) {
        return tn(Math.floor(t / 1e3), 60)
    }

    function tm(t) {
        return "function" == typeof t
    }

    function ty(t, n, r) {
        if (!tm(t)) return !1;
        if (null == r ? void 0 : r.boundTargetFunction) return n instanceof(null == r ? void 0 : r.boundTargetFunction);
        if ("object" != typeof n) return !1;
        var i = t.prototype;
        if ("object" != typeof i) throw TypeError("OrdinaryHasInstance called on an object with an invalid prototype property.");
        return Object.prototype.isPrototypeOf.call(i, n)
    }

    function tg(t) {
        return tn(t, 1e3)
    }

    function tw(t, n) {
        if ("object" == typeof t && null != t) {
            var r = Symbol.toPrimitive in t ? t[Symbol.toPrimitive] : void 0,
                i = void 0;
            if (void 0 !== r) {
                void 0 === n ? i = "default" : "string" === n ? i = "string" : (eX("number" === n, 'preferredType must be "string" or "number"'), i = "number");
                var a = r.call(t, i);
                if ("object" != typeof a) return a;
                throw TypeError("Cannot convert exotic object to primitive.")
            }
            return void 0 === n && (n = "number"),
                function(t, n) {
                    for (var r = 0, i = "string" === n ? ["toString", "valueOf"] : ["valueOf", "toString"]; r < i.length; r++) {
                        var a = t[i[r]];
                        if (tm(a)) {
                            var s = a.call(t);
                            if ("object" != typeof s) return s
                        }
                    }
                    throw TypeError("Cannot convert object to primitive value")
                }(t, n)
        }
        return t
    }

    function tb(t) {
        return void 0 === t ? Object.create(null) : e8(t)
    }

    function t_(t, n, r, i) {
        if (void 0 === t) return i;
        var a = Number(t);
        if (isNaN(a) || a < n || a > r) throw RangeError("".concat(a, " is outside of range [").concat(n, ", ").concat(r, "]"));
        return Math.floor(a)
    }

    function tx(t, n, r, i, a) {
        return t_(t[n], r, i, a)
    }

    function tP(t, n, r, i, a) {
        if ("object" != typeof t) throw TypeError("Options must be an object");
        var s = t[n];
        if (void 0 !== s) {
            if ("boolean" !== r && "string" !== r) throw TypeError("invalid type");
            if ("boolean" === r && (s = !!s), "string" === r && (s = e3(s)), void 0 !== i && !i.filter(function(t) {
                    return t == s
                }).length) throw RangeError("".concat(s, " is not within ").concat(i.join(", ")));
            return s
        }
        return a
    }

    function tS(t) {
        if (void 0 === t) return Object.create(null);
        if ("object" == typeof t) return t;
        throw TypeError("Options must be an object")
    }

    function tT(t, n, r, i, a, s) {
        var o = t[n];
        if (void 0 === o) return s;
        if (!0 === o) return i;
        if (!1 == !!o) return a;
        if ("true" === (o = e3(o)) || "false" === o) return s;
        if (-1 === (r || []).indexOf(o)) throw RangeError("Invalid value ".concat(o));
        return o
    }
    t.s(["ArrayCreate", 0, e9, "DateFromTime", 0, th, "Day", 0, tr, "DayFromYear", 0, ta, "DayWithinYear", 0, tl, "DaysInYear", 0, tu, "HasOwnProperty", 0, te, "HourFromTime", 0, tf, "InLeapYear", 0, tc, "MinFromTime", 0, tp, "MonthFromTime", 0, td, "OrdinaryHasInstance", 0, ty, "SameValue", 0, e6, "SecFromTime", 0, tv, "TimeClip", 0, e7, "TimeFromYear", 0, ts, "ToNumber", 0, e5, "ToObject", 0, e8, "ToPrimitive", 0, tw, "ToString", 0, e3, "Type", 0, tt, "WeekDay", 0, ti, "YearFromTime", 0, to, "msFromTime", 0, tg], 350755), t.s(["CoerceOptionsToObject", 0, tb], 597124), t.i(597124), t.s(["GetNumberOption", 0, tx], 698880), t.i(698880), t.s(["GetOption", 0, tP], 845146), t.i(845146), t.s(["GetOptionsObject", 0, tS], 197799), t.i(197799), t.s(["GetStringOrBooleanOption", 0, tT], 193671), t.i(193671);
    var tR = ["angle-degree", "area-acre", "area-hectare", "concentr-percent", "digital-bit", "digital-byte", "digital-gigabit", "digital-gigabyte", "digital-kilobit", "digital-kilobyte", "digital-megabit", "digital-megabyte", "digital-petabyte", "digital-terabit", "digital-terabyte", "duration-day", "duration-hour", "duration-millisecond", "duration-minute", "duration-month", "duration-second", "duration-week", "duration-year", "length-centimeter", "length-foot", "length-inch", "length-kilometer", "length-meter", "length-mile-scandinavian", "length-mile", "length-millimeter", "length-yard", "mass-gram", "mass-kilogram", "mass-ounce", "mass-pound", "mass-stone", "temperature-celsius", "temperature-fahrenheit", "volume-fluid-ounce", "volume-gallon", "volume-liter", "volume-milliliter"];

    function tE(t) {
        return t.slice(t.indexOf("-") + 1)
    }
    var tq = tR.map(tE);

    function tC(t) {
        return tq.indexOf(t) > -1
    }

    function tA(t, n) {
        var r = n.zoneNamesFromData,
            i = n.uppercaseLinks,
            a = t.toUpperCase(),
            s = new Set,
            o = new Set;
        return r.map(function(t) {
            return t.toUpperCase()
        }).forEach(function(t) {
            return s.add(t)
        }), Object.keys(i).forEach(function(t) {
            o.add(t.toUpperCase()), s.add(i[t].toUpperCase())
        }), s.has(a) || o.has(a)
    }
    t.s(["IsSanctionedSimpleUnitIdentifier", 0, tC, "SANCTIONED_UNITS", 0, tR, "SIMPLE_UNITS", 0, tq, "removeUnitNamespace", 0, tE], 232548), t.i(232548), t.s(["IsValidTimeZoneName", 0, tA], 897193), t.i(897193);
    var tD = /[^A-Z]/;

    function tk(t) {
        return !(3 !== (t = t.replace(/([a-z])/g, function(t, n) {
            return n.toUpperCase()
        })).length || tD.test(t))
    }

    function tI(t) {
        if (tC(t = t.replace(/([A-Z])/g, function(t, n) {
                return n.toLowerCase()
            }))) return !0;
        var n = t.split("-per-");
        if (2 !== n.length) return !1;
        var r = n[0],
            i = n[1];
        return !!tC(r) && !!tC(i)
    }

    function tL(t, n, r, i) {
        if (t.eq(n) || (eX(n.lessThan(t) && t.lessThan(r), "x should be between r1 and r2 but x=".concat(t, ", r1=").concat(n, ", r2=").concat(r)), "zero" === i)) return n;
        if ("infinity" === i) return r;
        var a = t.minus(n),
            s = r.minus(t);
        return a.lessThan(s) ? n : s.lessThan(a) ? r : (eX(a.eq(s), "d1 should be equal to d2"), "half-zero" === i) ? n : "half-infinity" === i ? r : (eX("half-even" === i, "unsignedRoundingMode should be half-even"), n.div(r.minus(n)).mod(2).isZero()) ? n : r
    }
    t.s(["IsWellFormedCurrencyCode", 0, tk], 584142), t.i(584142), t.s(["IsWellFormedUnitIdentifier", 0, tI], 361685), t.i(361685), t.s(["ApplyUnsignedRoundingMode", 0, tL], 689691), t.i(689691);
    var tN = new Set(["unit", "exponentMinusSign", "minusSign", "plusSign", "percentSign", "exponentSeparator", "percent", "percentSign", "currency", "literal"]);

    function tM(t, n, r) {
        for (var i = (0, r.getInternalSlots)(t), a = i.dataLocaleData.numbers.symbols[i.numberingSystem], s = new RegExp("s?[".concat(a.rangeSign, "]s?")), o = n.findIndex(function(t) {
                return "literal" === t.type && s.test(t.value)
            }), u = [], l = o - 1; l >= 0 && tN.has(n[l].type); l--) u.unshift(n[l]);
        if (Array.from(u.map(function(t) {
                return t.value
            }).join("")).length > 1) {
            var c = Array.from(n);
            return c.splice(o - u.length, u.length), c
        }
        for (var d = [], l = o + 1; l < n.length && tN.has(n[l].type); l++) d.push(n[l]);
        if (Array.from(d.map(function(t) {
                return t.value
            }).join("")).length > 1) {
            var c = Array.from(n);
            return c.splice(o + 1, d.length), c
        }
        return n
    }

    function tO(t, n) {
        var r = t.notation,
            i = t.dataLocaleData,
            a = t.numberingSystem;
        switch (r) {
            case "standard":
                return 0;
            case "scientific":
                return n.toNumber();
            case "engineering":
                return n.div(3).floor().times(3).toNumber();
            default:
                eX("compact" === r, "Invalid notation");
                var s = t.compactDisplay,
                    o = t.style,
                    u = t.currencyDisplay,
                    l = void 0;
                if ("currency" === o && "name" !== u) l = (i.numbers.currency[a] || i.numbers.currency[i.numbers.nu[0]]).short;
                else {
                    var c = i.numbers.decimal[a] || i.numbers.decimal[i.numbers.nu[0]];
                    l = "long" === s ? c.long : c.short
                }
                if (!l) return 0;
                var d = ej.pow(10, n).toString(),
                    h = Object.keys(l);
                if (d < h[0]) return 0;
                if (d > h[h.length - 1]) return h[h.length - 1].length - 1;
                var f = h.indexOf(d);
                if (-1 === f) return 0;
                var p = h[f];
                if ("0" === l[p].other) return 0;
                return p.length - l[p].other.match(/0+/)[0].length
        }
    }
    t.s(["CollapseNumberRange", 0, tM], 901358), t.i(901358), ej.set({
        toExpPos: 100
    }), t.s(["ComputeExponentForMagnitude", 0, tO], 294442);
    var tj = {
            ceil: "zero",
            floor: "infinity",
            expand: "infinity",
            trunc: "zero",
            halfCeil: "half-zero",
            halfFloor: "half-infinity",
            halfExpand: "half-infinity",
            halfTrunc: "half-zero",
            halfEven: "half-even"
        },
        tF = {
            ceil: "infinity",
            floor: "zero",
            expand: "infinity",
            trunc: "zero",
            halfCeil: "half-infinity",
            halfFloor: "half-zero",
            halfExpand: "half-infinity",
            halfTrunc: "half-zero",
            halfEven: "half-even"
        };

    function tB(t, n) {
        return n ? tj[t] : tF[t]
    }

    function tU(t, n) {
        return t.times(ej.pow(10, -n))
    }

    function tG(t, n, r, i, a) {
        var s, o, u, l, c, d, h, f, p = (d = tU(c = t.times(ej.pow(10, r)).floor().div(i).floor().times(i), r), {
                n1: c,
                r1: d
            }),
            v = p.n1,
            m = p.r1,
            y = (f = tU(h = t.times(ej.pow(10, r)).ceil().div(i).ceil().times(i), r), {
                n2: h,
                r2: f
            }),
            g = y.n2,
            w = y.r2;
        if (tL(t, m, w, a).eq(m) ? (s = v, o = m) : (s = g, o = w), u = s.isZero() ? "0" : s.toString(), 0 !== r) {
            var b = u.length;
            b <= r && (u = eZ("0", r - b + 1) + u, b = r + 1);
            var _ = u.slice(0, b - r);
            u = _ + "." + u.slice(u.length - r), l = _.length
        } else l = u.length;
        for (var x = r - n; x > 0 && "0" === u[u.length - 1];) u = u.slice(0, u.length - 1), x--;
        return "." === u[u.length - 1] && (u = u.slice(0, u.length - 1)), {
            formattedString: u,
            roundedNumber: o,
            integerDigitsCount: l,
            roundingMagnitude: -r
        }
    }

    function tV(t, n, r, i) {
        var a, s, o, u;
        if (t.isZero()) a = eZ("0", r), s = 0, o = eF;
        else {
            var l = function(t, n) {
                    for (var r = ej.pow(10, n), i = ej.pow(10, n - 1), a = t.div(i).log(10).plus(n).minus(1).ceil();;) {
                        var s = t.div(ej.pow(10, a.minus(n).plus(1))).floor();
                        if (s.lessThan(r) && s.greaterThanOrEqualTo(i)) {
                            var o = s.times(ej.pow(10, a.minus(n).plus(1)));
                            if (o.lessThanOrEqualTo(t)) return {
                                n1: s,
                                e1: a,
                                r1: o
                            }
                        }
                        a = a.minus(1)
                    }
                }(t, r),
                c = l.n1,
                d = l.e1,
                h = l.r1,
                f = function(t, n) {
                    for (var r = ej.pow(10, n), i = ej.pow(10, n - 1), a = t.div(r).log(10).plus(n).minus(1).floor();;) {
                        var s = t.div(ej.pow(10, a.minus(n).plus(1))).ceil();
                        if (s.lessThan(r) && s.greaterThanOrEqualTo(i)) {
                            var o = s.times(ej.pow(10, a.minus(n).plus(1)));
                            if (o.greaterThanOrEqualTo(t)) return {
                                n2: s,
                                e2: a,
                                r2: o
                            }
                        }
                        a = a.plus(1)
                    }
                }(t, r),
                p = f.n2,
                v = f.e2,
                m = f.r2,
                y = tL(t, h, m, i),
                g = void 0;
            y.eq(h) ? (g = c, s = d.toNumber(), o = h) : (g = p, s = v.toNumber(), o = m), a = g.toString()
        }
        if (s >= r - 1 ? (a += eZ("0", s - r + 1), u = s + 1) : s >= 0 ? (a = a.slice(0, s + 1) + "." + a.slice(a.length - (r - (s + 1))), u = s + 1) : (eX(s < 0, "e should be less than 0"), a = "0." + eZ("0", -s - 1) + a, u = 1), a.includes(".") && r > n) {
            for (var w = r - n; w > 0 && "0" === a[a.length - 1];) a = a.slice(0, a.length - 1), w--;
            "." === a[a.length - 1] && (a = a.slice(0, a.length - 1))
        }
        return {
            formattedString: a,
            roundedNumber: o,
            integerDigitsCount: u,
            roundingMagnitude: s
        }
    }

    function tH(t, n) {
        var r, i, a = n;
        a.isZero() && a.isNegative() ? (r = "negative", a = eF) : (eX(a.isFinite(), "NumberFormatDigitInternalSlots value is not finite"), "negative" == (r = a.lessThan(0) ? "negative" : "positive") && (a = a.negated()));
        var s = t.roundingType,
            o = tB(t.roundingMode, "negative" === r);
        switch (s) {
            case "significantDigits":
                i = tV(a, t.minimumSignificantDigits, t.maximumSignificantDigits, o);
                break;
            case "fractionDigits":
                i = tG(a, t.minimumFractionDigits, t.maximumFractionDigits, t.roundingIncrement, o);
                break;
            default:
                var u = tV(a, t.minimumSignificantDigits, t.maximumSignificantDigits, o),
                    l = tG(a, t.minimumFractionDigits, t.maximumFractionDigits, t.roundingIncrement, o);
                "morePrecision" === t.roundingType ? i = u.roundingMagnitude <= l.roundingMagnitude ? u : l : (eX("lessPrecision" === t.roundingType, "Invalid roundingType"), i = u.roundingMagnitude <= l.roundingMagnitude ? l : u)
        }
        a = i.roundedNumber;
        var c = i.formattedString;
        if ("stripIfInteger" === t.trailingZeroDisplay && a.isInteger()) {
            var d = c.indexOf(".");
            d > -1 && (c = c.slice(0, d))
        }
        var h = i.integerDigitsCount,
            f = t.minimumIntegerDigits;
        return h < f && (c = eZ("0", f - h) + c), "negative" === r && (a = a.isZero() ? eB : a.negated()), {
            roundedNumber: a,
            formattedString: c
        }
    }

    function tK(t, n) {
        if (n.isZero()) return [0, 0];
        n.isNegative() && (n = n.negated());
        var r = n.log(10).floor(),
            i = tO(t, r),
            a = tH(t, n = n.times(ej.pow(10, -i)));
        return a.roundedNumber.isZero() || a.roundedNumber.log(10).floor().eq(r.minus(i)) ? [i, r.toNumber()] : [tO(t, r.plus(1)), r.plus(1).toNumber()]
    }

    function tz(t, n) {
        var r = n.currencyDigitsData;
        return te(r, t) ? r[t] : 2
    }
    t.s(["GetUnsignedRoundingMode", 0, tB], 332258), ej.set({
        toExpPos: 100
    }), t.s(["ToRawFixed", 0, tG], 267008), t.s(["ToRawPrecision", 0, tV], 745835), t.s(["FormatNumericToString", 0, tH], 774007), t.s(["ComputeExponent", 0, tK], 544050), t.i(544050), t.i(294442), t.s(["CurrencyDigits", 0, tz], 986105), t.i(986105);
    var tW = /[\$\+<->\^`\|~\xA2-\xA6\xA8\xA9\xAC\xAE-\xB1\xB4\xB8\xD7\xF7\u02C2-\u02C5\u02D2-\u02DF\u02E5-\u02EB\u02ED\u02EF-\u02FF\u0375\u0384\u0385\u03F6\u0482\u058D-\u058F\u0606-\u0608\u060B\u060E\u060F\u06DE\u06E9\u06FD\u06FE\u07F6\u07FE\u07FF\u09F2\u09F3\u09FA\u09FB\u0AF1\u0B70\u0BF3-\u0BFA\u0C7F\u0D4F\u0D79\u0E3F\u0F01-\u0F03\u0F13\u0F15-\u0F17\u0F1A-\u0F1F\u0F34\u0F36\u0F38\u0FBE-\u0FC5\u0FC7-\u0FCC\u0FCE\u0FCF\u0FD5-\u0FD8\u109E\u109F\u1390-\u1399\u166D\u17DB\u1940\u19DE-\u19FF\u1B61-\u1B6A\u1B74-\u1B7C\u1FBD\u1FBF-\u1FC1\u1FCD-\u1FCF\u1FDD-\u1FDF\u1FED-\u1FEF\u1FFD\u1FFE\u2044\u2052\u207A-\u207C\u208A-\u208C\u20A0-\u20BF\u2100\u2101\u2103-\u2106\u2108\u2109\u2114\u2116-\u2118\u211E-\u2123\u2125\u2127\u2129\u212E\u213A\u213B\u2140-\u2144\u214A-\u214D\u214F\u218A\u218B\u2190-\u2307\u230C-\u2328\u232B-\u2426\u2440-\u244A\u249C-\u24E9\u2500-\u2767\u2794-\u27C4\u27C7-\u27E5\u27F0-\u2982\u2999-\u29D7\u29DC-\u29FB\u29FE-\u2B73\u2B76-\u2B95\u2B97-\u2BFF\u2CE5-\u2CEA\u2E50\u2E51\u2E80-\u2E99\u2E9B-\u2EF3\u2F00-\u2FD5\u2FF0-\u2FFB\u3004\u3012\u3013\u3020\u3036\u3037\u303E\u303F\u309B\u309C\u3190\u3191\u3196-\u319F\u31C0-\u31E3\u3200-\u321E\u322A-\u3247\u3250\u3260-\u327F\u328A-\u32B0\u32C0-\u33FF\u4DC0-\u4DFF\uA490-\uA4C6\uA700-\uA716\uA720\uA721\uA789\uA78A\uA828-\uA82B\uA836-\uA839\uAA77-\uAA79\uAB5B\uAB6A\uAB6B\uFB29\uFBB2-\uFBC1\uFDFC\uFDFD\uFE62\uFE64-\uFE66\uFE69\uFF04\uFF0B\uFF1C-\uFF1E\uFF3E\uFF40\uFF5C\uFF5E\uFFE0-\uFFE6\uFFE8-\uFFEE\uFFFC\uFFFD]|\uD800[\uDD37-\uDD3F\uDD79-\uDD89\uDD8C-\uDD8E\uDD90-\uDD9C\uDDA0\uDDD0-\uDDFC]|\uD802[\uDC77\uDC78\uDEC8]|\uD805\uDF3F|\uD807[\uDFD5-\uDFF1]|\uD81A[\uDF3C-\uDF3F\uDF45]|\uD82F\uDC9C|\uD834[\uDC00-\uDCF5\uDD00-\uDD26\uDD29-\uDD64\uDD6A-\uDD6C\uDD83\uDD84\uDD8C-\uDDA9\uDDAE-\uDDE8\uDE00-\uDE41\uDE45\uDF00-\uDF56]|\uD835[\uDEC1\uDEDB\uDEFB\uDF15\uDF35\uDF4F\uDF6F\uDF89\uDFA9\uDFC3]|\uD836[\uDC00-\uDDFF\uDE37-\uDE3A\uDE6D-\uDE74\uDE76-\uDE83\uDE85\uDE86]|\uD838[\uDD4F\uDEFF]|\uD83B[\uDCAC\uDCB0\uDD2E\uDEF0\uDEF1]|\uD83C[\uDC00-\uDC2B\uDC30-\uDC93\uDCA0-\uDCAE\uDCB1-\uDCBF\uDCC1-\uDCCF\uDCD1-\uDCF5\uDD0D-\uDDAD\uDDE6-\uDE02\uDE10-\uDE3B\uDE40-\uDE48\uDE50\uDE51\uDE60-\uDE65\uDF00-\uDFFF]|\uD83D[\uDC00-\uDED7\uDEE0-\uDEEC\uDEF0-\uDEFC\uDF00-\uDF73\uDF80-\uDFD8\uDFE0-\uDFEB]|\uD83E[\uDC00-\uDC0B\uDC10-\uDC47\uDC50-\uDC59\uDC60-\uDC87\uDC90-\uDCAD\uDCB0\uDCB1\uDD00-\uDD78\uDD7A-\uDDCB\uDDCD-\uDE53\uDE60-\uDE6D\uDE70-\uDE74\uDE78-\uDE7A\uDE80-\uDE86\uDE90-\uDEA8\uDEB0-\uDEB6\uDEC0-\uDEC2\uDED0-\uDED6\uDF00-\uDF92\uDF94-\uDFCA]/,
        tJ = {
            adlm: ["𞥐", "𞥑", "𞥒", "𞥓", "𞥔", "𞥕", "𞥖", "𞥗", "𞥘", "𞥙"],
            ahom: ["𑜰", "𑜱", "𑜲", "𑜳", "𑜴", "𑜵", "𑜶", "𑜷", "𑜸", "𑜹"],
            arab: ["٠", "١", "٢", "٣", "٤", "٥", "٦", "٧", "٨", "٩"],
            arabext: ["۰", "۱", "۲", "۳", "۴", "۵", "۶", "۷", "۸", "۹"],
            bali: ["᭐", "᭑", "᭒", "᭓", "᭔", "᭕", "᭖", "᭗", "᭘", "᭙"],
            beng: ["০", "১", "২", "৩", "৪", "৫", "৬", "৭", "৮", "৯"],
            bhks: ["𑱐", "𑱑", "𑱒", "𑱓", "𑱔", "𑱕", "𑱖", "𑱗", "𑱘", "𑱙"],
            brah: ["𑁦", "𑁧", "𑁨", "𑁩", "𑁪", "𑁫", "𑁬", "𑁭", "𑁮", "𑁯"],
            cakm: ["𑄶", "𑄷", "𑄸", "𑄹", "𑄺", "𑄻", "𑄼", "𑄽", "𑄾", "𑄿"],
            cham: ["꩐", "꩑", "꩒", "꩓", "꩔", "꩕", "꩖", "꩗", "꩘", "꩙"],
            deva: ["०", "१", "२", "३", "४", "५", "६", "७", "८", "९"],
            diak: ["𑥐", "𑥑", "𑥒", "𑥓", "𑥔", "𑥕", "𑥖", "𑥗", "𑥘", "𑥙"],
            fullwide: ["０", "１", "２", "３", "４", "５", "６", "７", "８", "９"],
            gong: ["𑶠", "𑶡", "𑶢", "𑶣", "𑶤", "𑶥", "𑶦", "𑶧", "𑶨", "𑶩"],
            gonm: ["𑵐", "𑵑", "𑵒", "𑵓", "𑵔", "𑵕", "𑵖", "𑵗", "𑵘", "𑵙"],
            gujr: ["૦", "૧", "૨", "૩", "૪", "૫", "૬", "૭", "૮", "૯"],
            guru: ["੦", "੧", "੨", "੩", "੪", "੫", "੬", "੭", "੮", "੯"],
            hanidec: ["〇", "一", "二", "三", "四", "五", "六", "七", "八", "九"],
            hmng: ["𖭐", "𖭑", "𖭒", "𖭓", "𖭔", "𖭕", "𖭖", "𖭗", "𖭘", "𖭙"],
            hmnp: ["𞅀", "𞅁", "𞅂", "𞅃", "𞅄", "𞅅", "𞅆", "𞅇", "𞅈", "𞅉"],
            java: ["꧐", "꧑", "꧒", "꧓", "꧔", "꧕", "꧖", "꧗", "꧘", "꧙"],
            kali: ["꤀", "꤁", "꤂", "꤃", "꤄", "꤅", "꤆", "꤇", "꤈", "꤉"],
            khmr: ["០", "១", "២", "៣", "៤", "៥", "៦", "៧", "៨", "៩"],
            knda: ["೦", "೧", "೨", "೩", "೪", "೫", "೬", "೭", "೮", "೯"],
            lana: ["᪀", "᪁", "᪂", "᪃", "᪄", "᪅", "᪆", "᪇", "᪈", "᪉"],
            lanatham: ["᪐", "᪑", "᪒", "᪓", "᪔", "᪕", "᪖", "᪗", "᪘", "᪙"],
            laoo: ["໐", "໑", "໒", "໓", "໔", "໕", "໖", "໗", "໘", "໙"],
            lepc: ["᪐", "᪑", "᪒", "᪓", "᪔", "᪕", "᪖", "᪗", "᪘", "᪙"],
            limb: ["᥆", "᥇", "᥈", "᥉", "᥊", "᥋", "᥌", "᥍", "᥎", "᥏"],
            mathbold: ["𝟎", "𝟏", "𝟐", "𝟑", "𝟒", "𝟓", "𝟔", "𝟕", "𝟖", "𝟗"],
            mathdbl: ["𝟘", "𝟙", "𝟚", "𝟛", "𝟜", "𝟝", "𝟞", "𝟟", "𝟠", "𝟡"],
            mathmono: ["𝟶", "𝟷", "𝟸", "𝟹", "𝟺", "𝟻", "𝟼", "𝟽", "𝟾", "𝟿"],
            mathsanb: ["𝟬", "𝟭", "𝟮", "𝟯", "𝟰", "𝟱", "𝟲", "𝟳", "𝟴", "𝟵"],
            mathsans: ["𝟢", "𝟣", "𝟤", "𝟥", "𝟦", "𝟧", "𝟨", "𝟩", "𝟪", "𝟫"],
            mlym: ["൦", "൧", "൨", "൩", "൪", "൫", "൬", "൭", "൮", "൯"],
            modi: ["𑙐", "𑙑", "𑙒", "𑙓", "𑙔", "𑙕", "𑙖", "𑙗", "𑙘", "𑙙"],
            mong: ["᠐", "᠑", "᠒", "᠓", "᠔", "᠕", "᠖", "᠗", "᠘", "᠙"],
            mroo: ["𖩠", "𖩡", "𖩢", "𖩣", "𖩤", "𖩥", "𖩦", "𖩧", "𖩨", "𖩩"],
            mtei: ["꯰", "꯱", "꯲", "꯳", "꯴", "꯵", "꯶", "꯷", "꯸", "꯹"],
            mymr: ["၀", "၁", "၂", "၃", "၄", "၅", "၆", "၇", "၈", "၉"],
            mymrshan: ["႐", "႑", "႒", "႓", "႔", "႕", "႖", "႗", "႘", "႙"],
            mymrtlng: ["꧰", "꧱", "꧲", "꧳", "꧴", "꧵", "꧶", "꧷", "꧸", "꧹"],
            newa: ["𑑐", "𑑑", "𑑒", "𑑓", "𑑔", "𑑕", "𑑖", "𑑗", "𑑘", "𑑙"],
            nkoo: ["߀", "߁", "߂", "߃", "߄", "߅", "߆", "߇", "߈", "߉"],
            olck: ["᱐", "᱑", "᱒", "᱓", "᱔", "᱕", "᱖", "᱗", "᱘", "᱙"],
            orya: ["୦", "୧", "୨", "୩", "୪", "୫", "୬", "୭", "୮", "୯"],
            osma: ["𐒠", "𐒡", "𐒢", "𐒣", "𐒤", "𐒥", "𐒦", "𐒧", "𐒨", "𐒩"],
            rohg: ["𐴰", "𐴱", "𐴲", "𐴳", "𐴴", "𐴵", "𐴶", "𐴷", "𐴸", "𐴹"],
            saur: ["꣐", "꣑", "꣒", "꣓", "꣔", "꣕", "꣖", "꣗", "꣘", "꣙"],
            segment: ["🯰", "🯱", "🯲", "🯳", "🯴", "🯵", "🯶", "🯷", "🯸", "🯹"],
            shrd: ["𑇐", "𑇑", "𑇒", "𑇓", "𑇔", "𑇕", "𑇖", "𑇗", "𑇘", "𑇙"],
            sind: ["𑋰", "𑋱", "𑋲", "𑋳", "𑋴", "𑋵", "𑋶", "𑋷", "𑋸", "𑋹"],
            sinh: ["෦", "෧", "෨", "෩", "෪", "෫", "෬", "෭", "෮", "෯"],
            sora: ["𑃰", "𑃱", "𑃲", "𑃳", "𑃴", "𑃵", "𑃶", "𑃷", "𑃸", "𑃹"],
            sund: ["᮰", "᮱", "᮲", "᮳", "᮴", "᮵", "᮶", "᮷", "᮸", "᮹"],
            takr: ["𑛀", "𑛁", "𑛂", "𑛃", "𑛄", "𑛅", "𑛆", "𑛇", "𑛈", "𑛉"],
            talu: ["᧐", "᧑", "᧒", "᧓", "᧔", "᧕", "᧖", "᧗", "᧘", "᧙"],
            tamldec: ["௦", "௧", "௨", "௩", "௪", "௫", "௬", "௭", "௮", "௯"],
            telu: ["౦", "౧", "౨", "౩", "౪", "౫", "౬", "౭", "౮", "౯"],
            thai: ["๐", "๑", "๒", "๓", "๔", "๕", "๖", "๗", "๘", "๙"],
            tibt: ["༠", "༡", "༢", "༣", "༤", "༥", "༦", "༧", "༨", "༩"],
            tirh: ["𑓐", "𑓑", "𑓒", "𑓓", "𑓔", "𑓕", "𑓖", "𑓗", "𑓘", "𑓙"],
            vaii: ["ᘠ", "ᘡ", "ᘢ", "ᘣ", "ᘤ", "ᘥ", "ᘦ", "ᘧ", "ᘨ", "ᘩ"],
            wara: ["𑣠", "𑣡", "𑣢", "𑣣", "𑣤", "𑣥", "𑣦", "𑣧", "𑣨", "𑣩"],
            wcho: ["𞋰", "𞋱", "𞋲", "𞋳", "𞋴", "𞋵", "𞋶", "𞋷", "𞋸", "𞋹"]
        },
        tZ = new RegExp("^".concat(tW.source)),
        tY = new RegExp("".concat(tW.source, "$")),
        tQ = /[#0](?:[\.,][#0]+)*/g;

    function tX(t, n, r, i) {
        var a, s, o, u = t.sign,
            l = t.exponent,
            c = t.magnitude,
            d = i.notation,
            h = i.style,
            f = i.numberingSystem,
            p = n.numbers.nu[0],
            v = null;
        if ("compact" === d && c && (v = function(t, n, r, i, a, s, o) {
                var u, l, c = t.roundedNumber,
                    d = t.sign,
                    h = String(Math.pow(10, t.magnitude)),
                    f = r.numbers.nu[0];
                if ("currency" === i && "name" !== s) {
                    var p = r.numbers.currency,
                        v = null == (u = (p[o] || p[f]).short) ? void 0 : u[h];
                    if (!v) return null;
                    l = t0(n, c.toNumber(), v)
                } else {
                    var p = r.numbers.decimal,
                        m = (p[o] || p[f])[a][h];
                    if (!m) return null;
                    l = t0(n, c.toNumber(), m)
                }
                return "0" === l ? null : l = t$(l, d).replace(/([^\s;\-\+\d¤]+)/g, "{c:$1}").replace(/0+/, "0")
            }(t, r, n, h, i.compactDisplay, i.currencyDisplay, f)), "currency" === h && "name" !== i.currencyDisplay) {
            var m = n.currencies[i.currency];
            if (m) switch (i.currencyDisplay) {
                case "code":
                    s = i.currency;
                    break;
                case "symbol":
                    s = m.symbol;
                    break;
                default:
                    s = m.narrow
            } else s = i.currency
        }
        if (v) o = v;
        else if ("decimal" === h || "unit" === h || "currency" === h && "name" === i.currencyDisplay) o = t$((n.numbers.decimal[f] || n.numbers.decimal[p]).standard, u);
        else if ("currency" === h) {
            var y = n.numbers.currency[f] || n.numbers.currency[p];
            o = t$(y[i.currencySign], u)
        } else o = t$(n.numbers.percent[f] || n.numbers.percent[p], u);
        var g = tQ.exec(o)[0];
        if (o = o.replace(tQ, "{0}").replace(/'(.)'/g, "$1"), "currency" === h && "name" !== i.currencyDisplay) {
            var y = n.numbers.currency[f] || n.numbers.currency[p],
                w = y.currencySpacing.afterInsertBetween;
            w && !tY.test(s) && (o = o.replace("¤{0}", "¤".concat(w, "{0}")));
            var b = y.currencySpacing.beforeInsertBetween;
            b && !tZ.test(s) && (o = o.replace("{0}¤", "{0}".concat(b, "¤")))
        }
        for (var _ = o.split(/({c:[^}]+}|\{0\}|[¤%\-\+])/g), x = [], P = n.numbers.symbols[f] || n.numbers.symbols[p], S = 0; S < _.length; S++) {
            var T = _[S];
            if (T) switch (T) {
                case "{0}":
                    x.push.apply(x, function(t, n, r, i, a, s, o, u, l, c) {
                        var d, h, f = [],
                            p = n.formattedString,
                            v = n.roundedNumber;
                        if (v.isNaN()) return [{
                            type: "nan",
                            value: p
                        }];
                        if (!v.isFinite()) return [{
                            type: "infinity",
                            value: p
                        }];
                        var m = tJ[a];
                        m && (p = p.replace(/\d/g, function(t) {
                            return m[+t] || t
                        }));
                        var y = p.indexOf(".");
                        y > 0 ? (d = p.slice(0, y), h = p.slice(y + 1)) : d = p;
                        var g = !1;
                        if ("always" === s ? g = !0 : "min2" === s ? g = v.greaterThanOrEqualTo(1e4) : ("auto" === s || s) && (g = "compact" !== r || v.greaterThanOrEqualTo(1e4)), g) {
                            var w = "currency" === u && null != t.currencyGroup ? t.currencyGroup : t.group,
                                b = [],
                                _ = o.split(".")[0].split(","),
                                x = 3,
                                P = 3;
                            _.length > 1 && (x = _[_.length - 1].length), _.length > 2 && (P = _[_.length - 2].length);
                            var S = d.length - x;
                            if (S > 0) {
                                for (b.push(d.slice(S, S + x)), S -= P; S > 0; S -= P) b.push(d.slice(S, S + P));
                                b.push(d.slice(0, S + P))
                            } else b.push(d);
                            for (; b.length > 0;) {
                                var T = b.pop();
                                f.push({
                                    type: "integer",
                                    value: T
                                }), b.length > 0 && f.push({
                                    type: "group",
                                    value: w
                                })
                            }
                        } else f.push({
                            type: "integer",
                            value: d
                        });
                        if (void 0 !== h) {
                            var R = "currency" === u && null != t.currencyDecimal ? t.currencyDecimal : t.decimal;
                            f.push({
                                type: "decimal",
                                value: R
                            }, {
                                type: "fraction",
                                value: h
                            })
                        }
                        if (("scientific" === r || "engineering" === r) && v.isFinite()) {
                            f.push({
                                type: "exponentSeparator",
                                value: t.exponential
                            }), i < 0 && (f.push({
                                type: "exponentMinusSign",
                                value: t.minusSign
                            }), i = -i);
                            var E = tG(new ej(i), 0, 0, l, c);
                            f.push({
                                type: "exponentInteger",
                                value: E.formattedString
                            })
                        }
                        return f
                    }(P, t, d, l, f, !v && (null == (a = i.useGrouping) || a), g, h, i.roundingIncrement, tB(i.roundingMode, -1 === u)));
                    break;
                case "-":
                    x.push({
                        type: "minusSign",
                        value: P.minusSign
                    });
                    break;
                case "+":
                    x.push({
                        type: "plusSign",
                        value: P.plusSign
                    });
                    break;
                case "%":
                    x.push({
                        type: "percentSign",
                        value: P.percentSign
                    });
                    break;
                case "¤":
                    x.push({
                        type: "currency",
                        value: s
                    });
                    break;
                default:
                    /^\{c:/.test(T) ? x.push({
                        type: "compact",
                        value: T.substring(3, T.length - 1)
                    }) : x.push({
                        type: "literal",
                        value: T
                    })
            }
        }
        switch (h) {
            case "currency":
                if ("name" !== i.currencyDisplay) return x;
                var R = (n.numbers.currency[f] || n.numbers.currency[p]).unitPattern,
                    E = void 0,
                    q = n.currencies[i.currency];
                E = q ? t0(r, t.roundedNumber.times(ej.pow(10, l)).toNumber(), q.displayName) : i.currency;
                for (var C = R.split(/(\{[01]\})/g), A = [], D = 0; D < C.length; D++) {
                    var T = C[D];
                    switch (T) {
                        case "{0}":
                            A.push.apply(A, x);
                            break;
                        case "{1}":
                            A.push({
                                type: "currency",
                                value: E
                            });
                            break;
                        default:
                            T && A.push({
                                type: "literal",
                                value: T
                            })
                    }
                }
                return A;
            case "unit":
                var k = i.unit,
                    I = i.unitDisplay,
                    L = n.units.simple[k],
                    R = void 0;
                if (L) R = t0(r, t.roundedNumber.times(ej.pow(10, l)).toNumber(), n.units.simple[k][I]);
                else {
                    var N = k.split("-per-"),
                        M = N[0],
                        O = N[1];
                    L = n.units.simple[M];
                    var j = t0(r, t.roundedNumber.times(ej.pow(10, l)).toNumber(), n.units.simple[M][I]),
                        F = n.units.simple[O].perUnit[I];
                    if (F) R = F.replace("{0}", j);
                    else {
                        var B = n.units.compound.per[I],
                            U = t0(r, 1, n.units.simple[O][I]);
                        R = R = B.replace("{0}", j).replace("{1}", U.replace("{0}", ""))
                    }
                }
                for (var A = [], G = 0, V = R.split(/(\s*\{0\}\s*)/); G < V.length; G++) {
                    var T = V[G],
                        H = /^(\s*)\{0\}(\s*)$/.exec(T);
                    H ? (H[1] && A.push({
                        type: "literal",
                        value: H[1]
                    }), A.push.apply(A, x), H[2] && A.push({
                        type: "literal",
                        value: H[2]
                    })) : T && A.push({
                        type: "unit",
                        value: T
                    })
                }
                return A;
            default:
                return x
        }
    }

    function t$(t, n) {
        0 > t.indexOf(";") && (t = "".concat(t, ";-").concat(t));
        var r = t.split(";"),
            i = r[0],
            a = r[1];
        switch (n) {
            case 0:
                return i;
            case -1:
                return a;
            default:
                return a.indexOf("-") >= 0 ? a.replace(/-/g, "+") : "+".concat(i)
        }
    }

    function t0(t, n, r) {
        return r[t.select(n)] || r.other
    }

    function t1(t, n) {
        var r = t.dataLocaleData.numbers.symbols[t.numberingSystem].approximatelySign;
        return n.push({
            type: "approximatelySign",
            value: r
        }), n
    }

    function t2(t, n) {
        var r, i, a, s = n,
            o = 0,
            u = t.pl,
            l = t.dataLocaleData,
            c = t.numberingSystem,
            d = l.numbers.symbols[c] || l.numbers.symbols[l.numbers.nu[0]],
            h = 0;
        if (s.isNaN()) i = d.nan;
        else if (s.isFinite()) {
            s.isZero() || (eX(s.isFinite(), "Input must be a mathematical value"), "percent" == t.style && (s = s.times(100)), h = (r = tK(t, s))[0], o = r[1], s = s.times(ej.pow(10, -h)));
            var f = tH(t, s);
            i = f.formattedString, s = f.roundedNumber
        } else i = d.infinity;
        var p = t.signDisplay;
        switch (p) {
            case "never":
                a = 0;
                break;
            case "auto":
                a = s.isPositive() || s.isNaN() ? 0 : -1;
                break;
            case "always":
                a = s.isPositive() || s.isNaN() ? 1 : -1;
                break;
            case "exceptZero":
                a = s.isZero() ? 0 : s.isNegative() ? -1 : 1;
                break;
            default:
                eX("negative" === p, 'signDisplay must be "negative"'), a = s.isNegative() && !s.isZero() ? -1 : 0
        }
        return tX({
            roundedNumber: s,
            formattedString: i,
            exponent: h,
            magnitude: o,
            sign: a
        }, t.dataLocaleData, u, t)
    }

    function t4(t, n) {
        return t2(t, n).map(function(t) {
            return t.value
        }).join("")
    }

    function t3(t, n, r, i) {
        var a = i.getInternalSlots;
        eX(!n.isNaN() && !r.isNaN(), "Input must be a number", RangeError);
        var s = a(t),
            o = t2(s, n),
            u = t2(s, r);
        if (t4(s, n) === t4(s, r)) {
            var l = t1(s, o);
            return l.forEach(function(t) {
                t.source = "shared"
            }), l
        }
        var c = [];
        o.forEach(function(t) {
            t.source = "startRange", c.push(t)
        });
        var d = s.dataLocaleData.numbers.symbols[s.numberingSystem].rangeSign;
        return c.push({
            type: "literal",
            value: d,
            source: "shared"
        }), u.forEach(function(t) {
            t.source = "endRange", c.push(t)
        }), tM(t, c, {
            getInternalSlots: a
        })
    }

    function t5(t, n, r, i) {
        return t3(t, n, r, {
            getInternalSlots: i.getInternalSlots
        }).map(function(t) {
            return t.value
        }).join("")
    }

    function t7(t, n, r, i) {
        return t3(t, n, r, {
            getInternalSlots: i.getInternalSlots
        }).map(function(t, n) {
            return {
                type: t.type,
                value: t.value,
                source: t.source,
                result: n.toString()
            }
        })
    }

    function t8(t, n, r) {
        for (var i = t2(r.getInternalSlots(t), n), a = e9(0), s = 0; s < i.length; s++) {
            var o = i[s];
            a.push({
                type: o.type,
                value: o.value
            })
        }
        return a
    }
    t.s(["FormatApproximately", 0, t1], 785062), t.i(785062), t.s(["PartitionNumberPattern", 0, t2], 977264), t.s(["FormatNumeric", 0, t4], 552873), t.i(552873), t.s(["PartitionNumberRangePattern", 0, t3], 725291), t.s(["FormatNumericRange", 0, t5], 385494), t.i(385494), t.s(["FormatNumericRangeToParts", 0, t7], 650416), t.i(650416), t.s(["FormatNumericToParts", 0, t8], 660806), t.i(660806), t.i(774007), t.i(332258);
    var t6 = t.i(107473),
        t9 = new Set([1, 2, 5, 10, 20, 25, 50, 100, 200, 250, 500, 1e3, 2e3, 2500, 5e3]);

    function ne(t, n, r, i, a) {
        var s = tx(n, "minimumIntegerDigits", 1, 21, 1),
            o = n.minimumFractionDigits,
            u = n.maximumFractionDigits,
            l = n.minimumSignificantDigits,
            c = n.maximumSignificantDigits;
        t.minimumIntegerDigits = s;
        var d = tx(n, "roundingIncrement", 1, 5e3, 1);
        eX(t9.has(d), "Invalid rounding increment value: ".concat(d, ".\nValid values are ").concat(Array.from(t9).join(", "), "."));
        var h = tP(n, "roundingMode", "string", ["ceil", "floor", "expand", "trunc", "halfCeil", "halfFloor", "halfExpand", "halfTrunc", "halfEven"], "halfExpand"),
            f = tP(n, "roundingPriority", "string", ["auto", "morePrecision", "lessPrecision"], "auto"),
            p = tP(n, "trailingZeroDisplay", "string", ["auto", "stripIfInteger"], "auto");
        1 !== d && (i = r), t.roundingIncrement = d, t.roundingMode = h, t.trailingZeroDisplay = p;
        var v = void 0 !== l || void 0 !== c,
            m = void 0 !== o || void 0 !== u,
            y = !0,
            g = !0;
        if ("auto" === f && (y = v, (v || !m && "compact" === a) && (g = !1)), y && (v ? (t.minimumSignificantDigits = t_(l, 1, 21, 1), t.maximumSignificantDigits = t_(c, t.minimumSignificantDigits, 21, 21)) : (t.minimumSignificantDigits = 1, t.maximumSignificantDigits = 21)), g)
            if (m) {
                if (o = t_(o, 0, 100, void 0), u = t_(u, 0, 100, void 0), void 0 === o) eX(void 0 !== u, "maximumFractionDigits must be defined"), o = Math.min(r, u);
                else if (void 0 === u) u = Math.max(i, o);
                else if (o > u) throw RangeError("Invalid range, ".concat(o, " > ").concat(u));
                t.minimumFractionDigits = o, t.maximumFractionDigits = u
            } else t.minimumFractionDigits = r, t.maximumFractionDigits = i;
        y || g ? "morePrecision" === f ? (t.roundingType = "morePrecision", t.roundingPriority = "morePrecision") : "lessPrecision" === f ? (t.roundingType = "lessPrecision", t.roundingPriority = "lessPrecision") : (v ? t.roundingType = "significantDigits" : t.roundingType = "fractionDigits", t.roundingPriority = "auto") : (t.minimumFractionDigits = 0, t.maximumFractionDigits = 0, t.minimumSignificantDigits = 1, t.maximumSignificantDigits = 2, t.roundingType = "morePrecision", t.roundingPriority = "morePrecision"), 1 !== d && (eX("fractionDigits" === t.roundingType, "Invalid roundingType", TypeError), eX(t.maximumFractionDigits === t.minimumFractionDigits, "With roundingIncrement > 1, maximumFractionDigits and minimumFractionDigits must be equal.", RangeError))
    }

    function nt(t, n) {
        void 0 === n && (n = Object.create(null));
        var r = tP(n, "style", "string", ["decimal", "percent", "currency", "unit"], "decimal");
        t.style = r;
        var i = tP(n, "currency", "string", void 0, void 0);
        eX(void 0 === i || tk(i), "Malformed currency code", RangeError), eX("currency" !== r || void 0 !== i, "currency cannot be undefined", TypeError);
        var a = tP(n, "currencyDisplay", "string", ["code", "symbol", "narrowSymbol", "name"], "symbol"),
            s = tP(n, "currencySign", "string", ["standard", "accounting"], "standard"),
            o = tP(n, "unit", "string", void 0, void 0);
        eX(void 0 === o || tI(o), "Invalid unit argument for Intl.NumberFormat()", RangeError), eX("unit" !== r || void 0 !== o, "unit cannot be undefined", TypeError);
        var u = tP(n, "unitDisplay", "string", ["short", "narrow", "long"], "short");
        "currency" === r && (t.currency = i.toUpperCase(), t.currencyDisplay = a, t.currencySign = s), "unit" === r && (t.unit = o, t.unitDisplay = u)
    }

    function nn(t, r, i, a) {
        var s, o, u = a.getInternalSlots,
            l = a.localeData,
            c = a.availableLocales,
            d = a.numberingSystemNames,
            h = a.getDefaultLocale,
            f = a.currencyDigitsData,
            p = n(r),
            v = tb(i),
            m = Object.create(null);
        m.localeMatcher = tP(v, "localeMatcher", "string", ["lookup", "best fit"], "best fit");
        var y = tP(v, "numberingSystem", "string", void 0, void 0);
        if (void 0 !== y && 0 > d.indexOf(y)) throw RangeError("Invalid numberingSystems: ".concat(y));
        m.nu = y;
        var g = (0, t6.ResolveLocale)(Array.from(c), p, m, ["nu"], l, h),
            w = l[g.dataLocale];
        eX(!!w, "Missing locale data for ".concat(g.dataLocale));
        var b = u(t);
        b.locale = g.locale, b.dataLocale = g.dataLocale, b.numberingSystem = g.nu, b.dataLocaleData = w, nt(b, v);
        var _ = b.style,
            x = tP(v, "notation", "string", ["standard", "scientific", "engineering", "compact"], "standard");
        if (b.notation = x, "currency" === _ && "standard" === x) {
            var P = tz(b.currency, {
                currencyDigitsData: f
            });
            s = P, o = P
        } else s = 0, o = 3 * ("percent" !== _);
        ne(b, v, s, o, x);
        var S = tP(v, "compactDisplay", "string", ["short", "long"], "short"),
            T = "auto";
        return "compact" === x && (b.compactDisplay = S, T = "min2"), b.useGrouping = tT(v, "useGrouping", ["min2", "auto", "always"], "always", !1, T), b.signDisplay = tP(v, "signDisplay", "string", ["auto", "never", "always", "exceptZero", "negative"], "auto"), t
    }

    function nr(t) {
        for (var n = [], r = t.indexOf("{"), i = 0, a = 0, s = t.length; r < t.length && r > -1;) eX((i = t.indexOf("}", r)) > r, "Invalid pattern ".concat(t)), r > a && n.push({
            type: "literal",
            value: t.substring(a, r)
        }), n.push({
            type: t.substring(r + 1, i),
            value: void 0
        }), a = i + 1, r = t.indexOf("{", a);
        return a < s && n.push({
            type: "literal",
            value: t.substring(a, s)
        }), n
    }
    t.s(["SetNumberFormatDigitOptions", 0, ne], 674832), t.s(["SetNumberFormatUnitOptions", 0, nt], 885900), t.s(["InitializeNumberFormat", 0, nn], 115336), t.i(115336), t.i(977264), t.i(725291), t.i(674832), t.i(885900), t.i(267008), t.i(745835), t.s(["PartitionPattern", 0, nr], 784719), t.i(784719);
    var ni = t.i(53688);

    function na(t, n, r) {
        return void 0 !== r && tP(r = e8(r), "localeMatcher", "string", ["lookup", "best fit"], "best fit"), (0, ni.LookupSupportedLocales)(Array.from(t), n)
    }
    t.s(["SupportedLocales", 0, na], 158237), t.i(158237), t.i(350755), i = Error, (0, eU.__extends)(function() {
        var t = null !== i && i.apply(this, arguments) || this;
        return t.type = "MISSING_LOCALE_DATA", t
    }, i), (a = s || (s = {})).startRange = "startRange", a.shared = "shared", a.endRange = "endRange", t.s(["RangePatternType", 0, s], 937046), t.i(937046), t.s([], 699346), t.i(699346), t.s([], 80820), t.i(80820), t.s([], 470700), t.i(470700), t.s([], 735712), t.i(735712), t.s([], 885660), t.i(885660), t.s(["ApplyUnsignedRoundingMode", 0, tL, "ArrayCreate", 0, e9, "CanonicalizeLocaleList", 0, n, "CanonicalizeTimeZoneName", 0, r, "CoerceOptionsToObject", 0, tb, "CollapseNumberRange", 0, tM, "ComputeExponent", 0, tK, "ComputeExponentForMagnitude", 0, tO, "CurrencyDigits", 0, tz, "DateFromTime", 0, th, "Day", 0, tr, "DayFromYear", 0, ta, "DayWithinYear", 0, tl, "DaysInYear", 0, tu, "FormatApproximately", 0, t1, "FormatNumeric", 0, t4, "FormatNumericRange", 0, t5, "FormatNumericRangeToParts", 0, t7, "FormatNumericToParts", 0, t8, "FormatNumericToString", 0, tH, "GetNumberOption", 0, tx, "GetOption", 0, tP, "GetOptionsObject", 0, tS, "GetStringOrBooleanOption", 0, tT, "GetUnsignedRoundingMode", 0, tB, "HasOwnProperty", 0, te, "HourFromTime", 0, tf, "InLeapYear", 0, tc, "InitializeNumberFormat", 0, nn, "IsSanctionedSimpleUnitIdentifier", 0, tC, "IsValidTimeZoneName", 0, tA, "IsWellFormedCurrencyCode", 0, tk, "IsWellFormedUnitIdentifier", 0, tI, "MinFromTime", 0, tp, "MonthFromTime", 0, td, "OrdinaryHasInstance", 0, ty, "PartitionNumberPattern", 0, t2, "PartitionNumberRangePattern", 0, t3, "PartitionPattern", 0, nr, "RangePatternType", 0, s, "SANCTIONED_UNITS", 0, tR, "SIMPLE_UNITS", 0, tq, "SameValue", 0, e6, "SecFromTime", 0, tv, "SetNumberFormatDigitOptions", 0, ne, "SetNumberFormatUnitOptions", 0, nt, "SupportedLocales", 0, na, "TimeClip", 0, e7, "TimeFromYear", 0, ts, "ToIntlMathematicalValue", 0, function(t) {
        var n = tw(t, "number");
        if ("bigint" == typeof n) return new ej(n);
        if (void 0 === n) return new ej(NaN);
        if (!0 === n) return new ej(1);
        if (!1 === n || null === n) return new ej(0);
        try {
            return new ej(n)
        } catch (t) {
            return new ej(NaN)
        }
    }, "ToNumber", 0, e5, "ToObject", 0, e8, "ToPrimitive", 0, tw, "ToRawFixed", 0, tG, "ToRawPrecision", 0, tV, "ToString", 0, e3, "Type", 0, tt, "WeekDay", 0, ti, "YearFromTime", 0, to, "ZERO", 0, eF, "_formatToParts", 0, tX, "createDataProperty", 0, function(t, n, r) {
        Object.defineProperty(t, n, {
            configurable: !0,
            enumerable: !0,
            writable: !0,
            value: r
        })
    }, "createMemoizedDateTimeFormat", 0, e0, "createMemoizedListFormat", 0, e4, "createMemoizedLocale", 0, e2, "createMemoizedNumberFormat", 0, e$, "createMemoizedPluralRules", 0, e1, "defineProperty", 0, function(t, n, r) {
        Object.defineProperty(t, n, {
            configurable: !0,
            enumerable: !1,
            writable: !0,
            value: r.value
        })
    }, "getInternalSlot", 0, function(t, n, r) {
        return eQ(t, n, r)[r]
    }, "getMultiInternalSlots", 0, eQ, "invariant", 0, eX, "isLiteralPart", 0, function(t) {
        return "literal" === t.type
    }, "isMissingLocaleDataError", 0, function(t) {
        return "MISSING_LOCALE_DATA" === t.type
    }, "msFromTime", 0, tg, "removeUnitNamespace", 0, tE, "setInternalSlot", 0, eY, "setMultiInternalSlots", 0, function(t, n, r) {
        for (var i = 0, a = Object.keys(r); i < a.length; i++) {
            var s = a[i];
            eY(t, n, s, r[s])
        }
    }], 14910)
}, 554458, t => {
    "use strict";
    var n = t.i(107473);

    function r(t, r, i, a) {
        return (0, n.ResolveLocale)(r, Intl.getCanonicalLocales(t), {
            localeMatcher: (null == a ? void 0 : a.algorithm) || "best fit"
        }, [], {}, function() {
            return i
        }).locale
    }
    t.s(["match", 0, r], 41093), t.i(41093);
    var i = t.i(53688);
    t.s(["LookupSupportedLocales", () => i.LookupSupportedLocales, "ResolveLocale", () => n.ResolveLocale, "match", 0, r], 554458)
}, 607504, (t, n, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), r.InitializeRelativeTimeFormat = function(t, n, r, o) {
        var u = o.getInternalSlots,
            l = o.availableLocales,
            c = o.relevantExtensionKeys,
            d = o.localeData,
            h = o.getDefaultLocale,
            f = u(t);
        f.initializedRelativeTimeFormat = !0;
        var p = (0, i.CanonicalizeLocaleList)(n),
            v = Object.create(null),
            m = (0, i.CoerceOptionsToObject)(r);
        v.localeMatcher = (0, i.GetOption)(m, "localeMatcher", "string", ["best fit", "lookup"], "best fit");
        var y = (0, i.GetOption)(m, "numberingSystem", "string", void 0, void 0);
        if (void 0 !== y && !s.test(y)) throw RangeError("Invalid numbering system ".concat(y));
        v.nu = y;
        var g = (0, a.ResolveLocale)(l, p, v, c, d, h),
            w = g.locale,
            b = g.nu;
        f.locale = w, f.style = (0, i.GetOption)(m, "style", "string", ["long", "narrow", "short"], "long"), f.numeric = (0, i.GetOption)(m, "numeric", "string", ["always", "auto"], "always");
        var _ = d[g.dataLocale];
        return (0, i.invariant)(!!_, "Missing locale data for ".concat(g.dataLocale)), f.fields = _, f.numberFormat = (0, i.createMemoizedNumberFormat)(n), f.pluralRules = (0, i.createMemoizedPluralRules)(n), f.numberingSystem = b, t
    };
    var i = t.r(14910),
        a = t.r(554458),
        s = /^[a-z0-9]{3,8}(-[a-z0-9]{3,8})*$/i
}, 263234, (t, n, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), r.SingularRelativeTimeUnit = function(t) {
        if ((0, i.invariant)("String" === (0, i.Type)(t), "unit must be a string"), "seconds" === t) return "second";
        if ("minutes" === t) return "minute";
        if ("hours" === t) return "hour";
        if ("days" === t) return "day";
        if ("weeks" === t) return "week";
        if ("months" === t) return "month";
        if ("quarters" === t) return "quarter";
        if ("years" === t) return "year";
        if ("second" !== t && "minute" !== t && "hour" !== t && "day" !== t && "week" !== t && "month" !== t && "quarter" !== t && "year" !== t) throw RangeError("invalid unit");
        return t
    };
    var i = t.r(14910)
}, 909527, (t, n, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), r.MakePartsList = function(t, n, r) {
        for (var a = (0, i.PartitionPattern)(t), s = [], o = 0; o < a.length; o++) {
            var u = a[o];
            if ("literal" === u.type) s.push({
                type: "literal",
                value: u.value
            });
            else {
                (0, i.invariant)("0" === u.type, "Malformed pattern ".concat(t));
                for (var l = 0; l < r.length; l++) {
                    var c = r[l];
                    s.push({
                        type: c.type,
                        value: c.value,
                        unit: n
                    })
                }
            }
        }
        return s
    };
    var i = t.r(14910)
}, 526647, (t, n, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), r.PartitionRelativeTimePattern = function(t, n, r, o) {
        var u = o.getInternalSlots;
        if ((0, i.invariant)("Number" === (0, i.Type)(n), "value must be number, instead got ".concat(typeof n), TypeError), (0, i.invariant)("String" === (0, i.Type)(r), "unit must be number, instead got ".concat(typeof n), TypeError), isNaN(n) || !isFinite(n)) throw RangeError("Invalid value ".concat(n));
        var l = (0, a.SingularRelativeTimeUnit)(r),
            c = u(t),
            d = c.fields,
            h = c.style,
            f = c.numeric,
            p = c.pluralRules,
            v = c.numberFormat,
            m = l;
        "short" === h ? m = "".concat(l, "-short") : "narrow" === h && (m = "".concat(l, "-narrow")), m in d || (m = l);
        var y = d[m];
        if ("auto" === f && (0, i.ToString)(n) in y) return [{
            type: "literal",
            value: y[(0, i.ToString)(n)]
        }];
        var g = "future";
        ((0, i.SameValue)(n, -0) || n < 0) && (g = "past");
        var w = y[g],
            b = "function" == typeof v.formatToParts ? v.formatToParts(Math.abs(n)) : [{
                type: "literal",
                value: v.format(Math.abs(n)),
                unit: r
            }],
            _ = w[p.select(n)];
        return (0, s.MakePartsList)(_, l, b)
    };
    var i = t.r(14910),
        a = t.r(263234),
        s = t.r(909527)
}, 179800, (t, n, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), r.default = function(t) {
        var n = i.get(t);
        return n || (n = Object.create(null), i.set(t, n)), n
    };
    var i = new WeakMap
}, 558117, (t, n, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var i = t.r(274466),
        a = t.r(14910),
        s = t.r(607504),
        o = t.r(526647),
        u = i.__importDefault(t.r(179800)),
        l = function() {
            function t(n, r) {
                if (!(this && this instanceof t ? this.constructor : void 0)) throw TypeError("Intl.RelativeTimeFormat must be called with 'new'");
                return (0, s.InitializeRelativeTimeFormat)(this, n, r, {
                    getInternalSlots: u.default,
                    availableLocales: t.availableLocales,
                    relevantExtensionKeys: t.relevantExtensionKeys,
                    localeData: t.localeData,
                    getDefaultLocale: t.getDefaultLocale
                })
            }
            return t.prototype.format = function(t, n) {
                if ("object" != typeof this) throw TypeError("format was called on a non-object");
                if (!(0, u.default)(this).initializedRelativeTimeFormat) throw TypeError("format was called on a invalid context");
                return (0, o.PartitionRelativeTimePattern)(this, Number(t), (0, a.ToString)(n), {
                    getInternalSlots: u.default
                }).map(function(t) {
                    return t.value
                }).join("")
            }, t.prototype.formatToParts = function(t, n) {
                if ("object" != typeof this) throw TypeError("formatToParts was called on a non-object");
                if (!(0, u.default)(this).initializedRelativeTimeFormat) throw TypeError("formatToParts was called on a invalid context");
                return (0, o.PartitionRelativeTimePattern)(this, Number(t), (0, a.ToString)(n), {
                    getInternalSlots: u.default
                })
            }, t.prototype.resolvedOptions = function() {
                if ("object" != typeof this) throw TypeError("resolvedOptions was called on a non-object");
                var t = (0, u.default)(this);
                if (!t.initializedRelativeTimeFormat) throw TypeError("resolvedOptions was called on a invalid context");
                return {
                    locale: t.locale,
                    style: t.style,
                    numeric: t.numeric,
                    numberingSystem: t.numberingSystem
                }
            }, t.supportedLocalesOf = function(n, r) {
                return (0, a.SupportedLocales)(t.availableLocales, (0, a.CanonicalizeLocaleList)(n), r)
            }, t.__addLocaleData = function() {
                for (var n = [], r = 0; r < arguments.length; r++) n[r] = arguments[r];
                for (var i = 0; i < n.length; i++) {
                    var a = n[i],
                        s = a.data,
                        o = a.locale,
                        u = new Intl.Locale(o).minimize().toString();
                    t.localeData[o] = t.localeData[u] = s, t.availableLocales.add(u), t.availableLocales.add(o), t.__defaultLocale || (t.__defaultLocale = u)
                }
            }, t.getDefaultLocale = function() {
                return t.__defaultLocale
            }, t.localeData = {}, t.availableLocales = new Set, t.__defaultLocale = "", t.relevantExtensionKeys = ["nu"], t.polyfilled = !0, t
        }();
    r.default = l;
    try {
        "u" > typeof Symbol && Object.defineProperty(l.prototype, Symbol.toStringTag, {
            value: "Intl.RelativeTimeFormat",
            writable: !1,
            enumerable: !1,
            configurable: !0
        }), Object.defineProperty(l.prototype.constructor, "length", {
            value: 0,
            writable: !1,
            enumerable: !1,
            configurable: !0
        }), Object.defineProperty(l.supportedLocalesOf, "length", {
            value: 1,
            writable: !1,
            enumerable: !1,
            configurable: !0
        })
    } catch (t) {}
}, 444513, (t, n, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), r.supportedLocales = void 0, r.supportedLocales = ["af", "af-NA", "agq", "ak", "am", "ar", "ar-AE", "ar-BH", "ar-DJ", "ar-DZ", "ar-EG", "ar-EH", "ar-ER", "ar-IL", "ar-IQ", "ar-JO", "ar-KM", "ar-KW", "ar-LB", "ar-LY", "ar-MA", "ar-MR", "ar-OM", "ar-PS", "ar-QA", "ar-SA", "ar-SD", "ar-SO", "ar-SS", "ar-SY", "ar-TD", "ar-TN", "ar-YE", "as", "asa", "ast", "az", "az-Cyrl", "az-Latn", "bas", "be", "be-tarask", "bem", "bez", "bg", "bm", "bn", "bn-IN", "bo", "bo-IN", "br", "brx", "bs", "bs-Cyrl", "bs-Latn", "ca", "ca-AD", "ca-ES-valencia", "ca-FR", "ca-IT", "ccp", "ccp-IN", "ce", "ceb", "cgg", "chr", "ckb", "ckb-IR", "cs", "cy", "da", "da-GL", "dav", "de", "de-AT", "de-BE", "de-CH", "de-IT", "de-LI", "de-LU", "dje", "doi", "dsb", "dua", "dyo", "dz", "ebu", "ee", "ee-TG", "el", "el-CY", "en", "en-001", "en-150", "en-AE", "en-AG", "en-AI", "en-AS", "en-AT", "en-AU", "en-BB", "en-BE", "en-BI", "en-BM", "en-BS", "en-BW", "en-BZ", "en-CA", "en-CC", "en-CH", "en-CK", "en-CM", "en-CX", "en-CY", "en-DE", "en-DG", "en-DK", "en-DM", "en-ER", "en-FI", "en-FJ", "en-FK", "en-FM", "en-GB", "en-GD", "en-GG", "en-GH", "en-GI", "en-GM", "en-GU", "en-GY", "en-HK", "en-IE", "en-IL", "en-IM", "en-IN", "en-IO", "en-JE", "en-JM", "en-KE", "en-KI", "en-KN", "en-KY", "en-LC", "en-LR", "en-LS", "en-MG", "en-MH", "en-MO", "en-MP", "en-MS", "en-MT", "en-MU", "en-MW", "en-MY", "en-NA", "en-NF", "en-NG", "en-NL", "en-NR", "en-NU", "en-NZ", "en-PG", "en-PH", "en-PK", "en-PN", "en-PR", "en-PW", "en-RW", "en-SB", "en-SC", "en-SD", "en-SE", "en-SG", "en-SH", "en-SI", "en-SL", "en-SS", "en-SX", "en-SZ", "en-TC", "en-TK", "en-TO", "en-TT", "en-TV", "en-TZ", "en-UG", "en-UM", "en-VC", "en-VG", "en-VI", "en-VU", "en-WS", "en-ZA", "en-ZM", "en-ZW", "eo", "es", "es-419", "es-AR", "es-BO", "es-BR", "es-BZ", "es-CL", "es-CO", "es-CR", "es-CU", "es-DO", "es-EA", "es-EC", "es-GQ", "es-GT", "es-HN", "es-IC", "es-MX", "es-NI", "es-PA", "es-PE", "es-PH", "es-PR", "es-PY", "es-SV", "es-US", "es-UY", "es-VE", "et", "eu", "ewo", "fa", "fa-AF", "ff", "ff-Adlm", "ff-Adlm-BF", "ff-Adlm-CM", "ff-Adlm-GH", "ff-Adlm-GM", "ff-Adlm-GW", "ff-Adlm-LR", "ff-Adlm-MR", "ff-Adlm-NE", "ff-Adlm-NG", "ff-Adlm-SL", "ff-Adlm-SN", "ff-Latn", "ff-Latn-BF", "ff-Latn-CM", "ff-Latn-GH", "ff-Latn-GM", "ff-Latn-GN", "ff-Latn-GW", "ff-Latn-LR", "ff-Latn-MR", "ff-Latn-NE", "ff-Latn-NG", "ff-Latn-SL", "fi", "fil", "fo", "fo-DK", "fr", "fr-BE", "fr-BF", "fr-BI", "fr-BJ", "fr-BL", "fr-CA", "fr-CD", "fr-CF", "fr-CG", "fr-CH", "fr-CI", "fr-CM", "fr-DJ", "fr-DZ", "fr-GA", "fr-GF", "fr-GN", "fr-GP", "fr-GQ", "fr-HT", "fr-KM", "fr-LU", "fr-MA", "fr-MC", "fr-MF", "fr-MG", "fr-ML", "fr-MQ", "fr-MR", "fr-MU", "fr-NC", "fr-NE", "fr-PF", "fr-PM", "fr-RE", "fr-RW", "fr-SC", "fr-SN", "fr-SY", "fr-TD", "fr-TG", "fr-TN", "fr-VU", "fr-WF", "fr-YT", "fur", "fy", "ga", "ga-GB", "gd", "gl", "gsw", "gsw-FR", "gsw-LI", "gu", "guz", "gv", "ha", "ha-GH", "ha-NE", "haw", "he", "hi", "hr", "hr-BA", "hsb", "hu", "hy", "ia", "id", "ig", "ii", "is", "it", "it-CH", "it-SM", "it-VA", "ja", "jgo", "jmc", "jv", "ka", "kab", "kam", "kde", "kea", "kgp", "khq", "ki", "kk", "kkj", "kl", "kln", "km", "kn", "ko", "ko-KP", "kok", "ks", "ks-Arab", "ksb", "ksf", "ksh", "ku", "kw", "ky", "lag", "lb", "lg", "lkt", "ln", "ln-AO", "ln-CF", "ln-CG", "lo", "lrc", "lrc-IQ", "lt", "lu", "luo", "luy", "lv", "mai", "mas", "mas-TZ", "mer", "mfe", "mg", "mgh", "mgo", "mi", "mk", "ml", "mn", "mni", "mni-Beng", "mr", "ms", "ms-BN", "ms-ID", "ms-SG", "mt", "mua", "my", "mzn", "naq", "nb", "nb-SJ", "nd", "nds", "nds-NL", "ne", "ne-IN", "nl", "nl-AW", "nl-BE", "nl-BQ", "nl-CW", "nl-SR", "nl-SX", "nmg", "nn", "nnh", "no", "nus", "nyn", "om", "om-KE", "or", "os", "os-RU", "pa", "pa-Arab", "pa-Guru", "pcm", "pl", "ps", "ps-PK", "pt", "pt-AO", "pt-CH", "pt-CV", "pt-GQ", "pt-GW", "pt-LU", "pt-MO", "pt-MZ", "pt-PT", "pt-ST", "pt-TL", "qu", "qu-BO", "qu-EC", "rm", "rn", "ro", "ro-MD", "rof", "ru", "ru-BY", "ru-KG", "ru-KZ", "ru-MD", "ru-UA", "rw", "rwk", "sa", "sah", "saq", "sat", "sat-Olck", "sbp", "sc", "sd", "sd-Arab", "sd-Deva", "se", "se-FI", "se-SE", "seh", "ses", "sg", "shi", "shi-Latn", "shi-Tfng", "si", "sk", "sl", "smn", "sn", "so", "so-DJ", "so-ET", "so-KE", "sq", "sq-MK", "sq-XK", "sr", "sr-Cyrl", "sr-Cyrl-BA", "sr-Cyrl-ME", "sr-Cyrl-XK", "sr-Latn", "sr-Latn-BA", "sr-Latn-ME", "sr-Latn-XK", "su", "su-Latn", "sv", "sv-AX", "sv-FI", "sw", "sw-CD", "sw-KE", "sw-UG", "ta", "ta-LK", "ta-MY", "ta-SG", "te", "teo", "teo-KE", "tg", "th", "ti", "ti-ER", "tk", "to", "tr", "tr-CY", "tt", "twq", "tzm", "ug", "uk", "und", "ur", "ur-IN", "uz", "uz-Arab", "uz-Cyrl", "uz-Latn", "vai", "vai-Latn", "vai-Vaii", "vi", "vun", "wae", "wo", "xh", "xog", "yav", "yi", "yo", "yo-BJ", "yrl", "yrl-CO", "yrl-VE", "yue", "yue-Hans", "yue-Hant", "zgh", "zh", "zh-Hans", "zh-Hans-HK", "zh-Hans-MO", "zh-Hans-SG", "zh-Hant", "zh-Hant-HK", "zh-Hant-MO", "zu"]
}, 394189, (t, n, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    }), r.shouldPolyfill = function(t) {
        if (void 0 === t && (t = "en"), !("RelativeTimeFormat" in Intl) || ! function(t) {
                if (!t) return !0;
                var n = Array.isArray(t) ? t : [t];
                return Intl.RelativeTimeFormat.supportedLocalesOf(n).length === n.length
            }(t) || ! function(t) {
                try {
                    return "numberingSystem" in new Intl.RelativeTimeFormat(t || "en", {
                        numeric: "auto"
                    }).resolvedOptions()
                } catch (t) {
                    return !1
                }
            }(t)) return (0, i.match)([t], a.supportedLocales, "en")
    };
    var i = t.r(554458),
        a = t.r(444513)
}, 248486, (t, n, r) => {
    "use strict";
    Object.defineProperty(r, "__esModule", {
        value: !0
    });
    var i = t.r(274466).__importDefault(t.r(558117));
    (0, t.r(394189).shouldPolyfill)() && Object.defineProperty(Intl, "RelativeTimeFormat", {
        value: i.default,
        writable: !0,
        enumerable: !1,
        configurable: !0
    })
}]);

//# debugId=89ff7ad5-6618-4910-ae3a-edf5eaecf50e
//# sourceMappingURL=0udndv_7gyo0_.js.map