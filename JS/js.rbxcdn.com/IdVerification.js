! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "9f804d5fcff822db0bc4525f5f343ddfd1a6f8d3"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "27a7046b-e764-421d-b3d9-c77b399d5e8f", e._sentryDebugIdIdentifier = "sentry-dbid-27a7046b-e764-421d-b3d9-c77b399d5e8f")
    } catch (e) {}
}(),
function() {
    var e = {
            611: function(e) {
                function t(e) {
                    return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
                }!
                /*!
                	Copyright (c) 2018 Jed Watson.
                	Licensed under the MIT License (MIT), see
                	http://jedwatson.github.io/classnames
                */
                function() {
                    "use strict";
                    var r = {}.hasOwnProperty;

                    function n() {
                        for (var e = "", i = 0; i < arguments.length; i++) {
                            var a = arguments[i];
                            a && (e = o(e, function(e) {
                                if ("string" == typeof e || "number" == typeof e) return e;
                                if ((void 0 === e ? "undefined" : t(e)) !== "object") return "";
                                if (Array.isArray(e)) return n.apply(null, e);
                                if (e.toString !== Object.prototype.toString && !e.toString.toString().includes("[native code]")) return e.toString();
                                var i = "";
                                for (var a in e) r.call(e, a) && e[a] && (i = o(i, a));
                                return i
                            }(a)))
                        }
                        return e
                    }

                    function o(e, t) {
                        return t ? e ? e + " " + t : e + t : e
                    }
                    e.exports ? (n.default = n, e.exports = n) : "function" == typeof define && "object" === t(define.amd) && define.amd ? define("classnames", [], function() {
                        return n
                    }) : window.classNames = n
                }()
            },
            685: function(e) {
                "use strict";
                var t = {
                    single_source_shortest_paths: function(e, r, n) {
                        var o, i, a, l, c, u, s, f = {},
                            p = {};
                        p[r] = 0;
                        var h = t.PriorityQueue.make();
                        for (h.push(r, 0); !h.empty();)
                            for (a in i = (o = h.pop()).value, l = o.cost, c = e[i] || {}) c.hasOwnProperty(a) && (u = l + c[a], s = p[a], (void 0 === p[a] || s > u) && (p[a] = u, h.push(a, u), f[a] = i));
                        if (void 0 !== n && void 0 === p[n]) throw Error(["Could not find a path from ", r, " to ", n, "."].join(""));
                        return f
                    },
                    extract_shortest_path_from_predecessor_list: function(e, t) {
                        for (var r = [], n = t; n;) r.push(n), e[n], n = e[n];
                        return r.reverse(), r
                    },
                    find_path: function(e, r, n) {
                        var o = t.single_source_shortest_paths(e, r, n);
                        return t.extract_shortest_path_from_predecessor_list(o, n)
                    },
                    PriorityQueue: {
                        make: function(e) {
                            var r, n = t.PriorityQueue,
                                o = {};
                            for (r in e = e || {}, n) n.hasOwnProperty(r) && (o[r] = n[r]);
                            return o.queue = [], o.sorter = e.sorter || n.default_sorter, o
                        },
                        default_sorter: function(e, t) {
                            return e.cost - t.cost
                        },
                        push: function(e, t) {
                            this.queue.push({
                                value: e,
                                cost: t
                            }), this.queue.sort(this.sorter)
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
            773: function(e, t) {
                "use strict";
                Object.defineProperty(t, "__esModule", {
                    value: !0
                });
                var r, n, o, i = {
                        exports: {}
                    },
                    a = i.exports = {};

                function l() {
                    throw Error("setTimeout has not been defined")
                }

                function c() {
                    throw Error("clearTimeout has not been defined")
                }
                try {
                    r = "function" == typeof setTimeout ? setTimeout : l
                } catch (e) {
                    r = l
                }
                try {
                    n = "function" == typeof clearTimeout ? clearTimeout : c
                } catch (e) {
                    n = c
                }

                function u(e) {
                    if (r === setTimeout) return setTimeout(e, 0);
                    if ((r === l || !r) && setTimeout) return r = setTimeout, setTimeout(e, 0);
                    try {
                        return r(e, 0)
                    } catch (t) {
                        try {
                            return r.call(null, e, 0)
                        } catch (t) {
                            return r.call(this, e, 0)
                        }
                    }
                }
                var s = [],
                    f = !1,
                    p = -1;

                function h() {
                    f && o && (f = !1, o.length ? s = o.concat(s) : p = -1, s.length && d())
                }

                function d() {
                    if (!f) {
                        var e = u(h);
                        f = !0;
                        for (var t = s.length; t;) {
                            for (o = s, s = []; ++p < t;) o && o[p].run();
                            p = -1, t = s.length
                        }
                        o = null, f = !1,
                            function(e) {
                                if (n === clearTimeout) return clearTimeout(e);
                                if ((n === c || !n) && clearTimeout) return n = clearTimeout, clearTimeout(e);
                                try {
                                    n(e)
                                } catch (t) {
                                    try {
                                        return n.call(null, e)
                                    } catch (t) {
                                        return n.call(this, e)
                                    }
                                }
                            }(e)
                    }
                }

                function y(e, t) {
                    this.fun = e, this.array = t
                }

                function m() {}

                function b() {}
                a.nextTick = function(e) {
                    var t = Array(arguments.length - 1);
                    if (arguments.length > 1)
                        for (var r = 1; r < arguments.length; r++) t[r - 1] = arguments[r];
                    s.push(new y(e, t)), 1 !== s.length || f || u(d)
                }, y.prototype.run = function() {
                    this.fun.apply(null, this.array)
                }, a.title = "browser", a.browser = !0, a.env = {}, a.argv = [], a.version = "", a.versions = {}, a.on = m, a.addListener = m, a.once = m, a.off = m, a.removeListener = m, a.removeAllListeners = m, a.emit = m, a.prependListener = m, a.prependOnceListener = m, a.listeners = function(e) {
                    return []
                }, a.binding = function(e) {
                    throw Error("process.binding is not supported")
                }, a.cwd = function() {
                    return "/"
                }, a.chdir = function(e) {
                    throw Error("process.chdir is not supported")
                }, a.umask = function() {
                    return 0
                };
                var g = i.exports.browser,
                    v = i.exports.binding,
                    O = {},
                    w = "browser",
                    E = "browser",
                    A = "browser",
                    S = [],
                    j = {
                        nextTick: i.exports.nextTick,
                        title: i.exports.title,
                        browser: g,
                        env: i.exports.env,
                        argv: i.exports.argv,
                        version: i.exports.version,
                        versions: i.exports.versions,
                        on: i.exports.on,
                        addListener: i.exports.addListener,
                        once: i.exports.once,
                        off: i.exports.off,
                        removeListener: i.exports.removeListener,
                        removeAllListeners: i.exports.removeAllListeners,
                        emit: i.exports.emit,
                        emitWarning: b,
                        prependListener: i.exports.prependListener,
                        prependOnceListener: i.exports.prependOnceListener,
                        listeners: i.exports.listeners,
                        binding: v,
                        cwd: i.exports.cwd,
                        chdir: i.exports.chdir,
                        umask: i.exports.umask,
                        exit: b,
                        pid: 1,
                        features: O,
                        kill: b,
                        dlopen: b,
                        uptime: b,
                        memoryUsage: b,
                        uvCounters: b,
                        platform: w,
                        arch: E,
                        execPath: A,
                        execArgv: S
                    };
                t.addListener = i.exports.addListener, t.arch = E, t.argv = i.exports.argv, t.binding = v, t.browser = g, t.chdir = i.exports.chdir, t.cwd = i.exports.cwd, t.default = j, t.dlopen = b, t.emit = i.exports.emit, t.emitWarning = b, t.env = i.exports.env, t.execArgv = S, t.execPath = A, t.exit = b, t.features = O, t.kill = b, t.listeners = i.exports.listeners, t.memoryUsage = b, t.nextTick = i.exports.nextTick, t.off = i.exports.off, t.on = i.exports.on, t.once = i.exports.once, t.pid = 1, t.platform = w, t.prependListener = i.exports.prependListener, t.prependOnceListener = i.exports.prependOnceListener, t.removeAllListeners = i.exports.removeAllListeners, t.removeListener = i.exports.removeListener, t.title = i.exports.title, t.umask = i.exports.umask, t.uptime = b, t.uvCounters = b, t.version = i.exports.version, t.versions = i.exports.versions, e.exports = j
            },
            741: function(e, t, r) {
                var n = r(711),
                    o = r(7),
                    i = r(709),
                    a = r(386);

                function l(e, t, r, i, a) {
                    var l = [].slice.call(arguments, 1),
                        c = l.length,
                        u = "function" == typeof l[c - 1];
                    if (!u && !n()) throw Error("Callback required as last argument");
                    if (u) {
                        if (c < 2) throw Error("Too few arguments provided");
                        2 === c ? (a = r, r = t, t = i = void 0) : 3 === c && (t.getContext && void 0 === a ? (a = i, i = void 0) : (a = i, i = r, r = t, t = void 0))
                    } else {
                        if (c < 1) throw Error("Too few arguments provided");
                        return 1 === c ? (r = t, t = i = void 0) : 2 !== c || t.getContext || (i = r, r = t, t = void 0), new Promise(function(n, a) {
                            try {
                                var l = o.create(r, i);
                                n(e(l, t, i))
                            } catch (e) {
                                a(e)
                            }
                        })
                    }
                    try {
                        var s = o.create(r, i);
                        a(null, e(s, t, i))
                    } catch (e) {
                        a(e)
                    }
                }
                t.create = o.create, t.toCanvas = l.bind(null, i.render), t.toDataURL = l.bind(null, i.renderToDataURL), t.toString = l.bind(null, function(e, t, r) {
                    return a.render(e, r)
                })
            },
            711: function(e) {
                e.exports = function() {
                    return "function" == typeof Promise && Promise.prototype && Promise.prototype.then
                }
            },
            667: function(e, t, r) {
                var n = r(756).getSymbolSize;
                t.getRowColCoords = function(e) {
                    if (1 === e) return [];
                    for (var t = Math.floor(e / 7) + 2, r = n(e), o = 145 === r ? 26 : 2 * Math.ceil((r - 13) / (2 * t - 2)), i = [r - 7], a = 1; a < t - 1; a++) i[a] = i[a - 1] - o;
                    return i.push(6), i.reverse()
                }, t.getPositions = function(e) {
                    for (var r = [], n = t.getRowColCoords(e), o = n.length, i = 0; i < o; i++)
                        for (var a = 0; a < o; a++)(0 !== i || 0 !== a) && (0 !== i || a !== o - 1) && (i !== o - 1 || 0 !== a) && r.push([n[i], n[a]]);
                    return r
                }
            },
            92: function(e, t, r) {
                var n = r(594),
                    o = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", " ", "$", "%", "*", "+", "-", ".", "/", ":"];

                function i(e) {
                    this.mode = n.ALPHANUMERIC, this.data = e
                }
                i.getBitsLength = function(e) {
                    return 11 * Math.floor(e / 2) + e % 2 * 6
                }, i.prototype.getLength = function() {
                    return this.data.length
                }, i.prototype.getBitsLength = function() {
                    return i.getBitsLength(this.data.length)
                }, i.prototype.write = function(e) {
                    var t;
                    for (t = 0; t + 2 <= this.data.length; t += 2) {
                        var r = 45 * o.indexOf(this.data[t]);
                        r += o.indexOf(this.data[t + 1]), e.put(r, 11)
                    }
                    this.data.length % 2 && e.put(o.indexOf(this.data[t]), 6)
                }, e.exports = i
            },
            477: function(e) {
                function t() {
                    this.buffer = [], this.length = 0
                }
                t.prototype = {
                    get: function(e) {
                        var t = Math.floor(e / 8);
                        return (this.buffer[t] >>> 7 - e % 8 & 1) == 1
                    },
                    put: function(e, t) {
                        for (var r = 0; r < t; r++) this.putBit((e >>> t - r - 1 & 1) == 1)
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
            898: function(e) {
                function t(e) {
                    if (!e || e < 1) throw Error("BitMatrix size must be defined and greater than 0");
                    this.size = e, this.data = new Uint8Array(e * e), this.reservedBit = new Uint8Array(e * e)
                }
                t.prototype.set = function(e, t, r, n) {
                    var o = e * this.size + t;
                    this.data[o] = r, n && (this.reservedBit[o] = !0)
                }, t.prototype.get = function(e, t) {
                    return this.data[e * this.size + t]
                }, t.prototype.xor = function(e, t, r) {
                    this.data[e * this.size + t] ^= r
                }, t.prototype.isReserved = function(e, t) {
                    return this.reservedBit[e * this.size + t]
                }, e.exports = t
            },
            124: function(e, t, r) {
                var n = r(594);

                function o(e) {
                    this.mode = n.BYTE, "string" == typeof e ? this.data = new TextEncoder().encode(e) : this.data = new Uint8Array(e)
                }
                o.getBitsLength = function(e) {
                    return 8 * e
                }, o.prototype.getLength = function() {
                    return this.data.length
                }, o.prototype.getBitsLength = function() {
                    return o.getBitsLength(this.data.length)
                }, o.prototype.write = function(e) {
                    for (var t = 0, r = this.data.length; t < r; t++) e.put(this.data[t], 8)
                }, e.exports = o
            },
            908: function(e, t, r) {
                var n = r(847),
                    o = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 1, 2, 2, 4, 1, 2, 4, 4, 2, 4, 4, 4, 2, 4, 6, 5, 2, 4, 6, 6, 2, 5, 8, 8, 4, 5, 8, 8, 4, 5, 8, 11, 4, 8, 10, 11, 4, 9, 12, 16, 4, 9, 16, 16, 6, 10, 12, 18, 6, 10, 17, 16, 6, 11, 16, 19, 6, 13, 18, 21, 7, 14, 21, 25, 8, 16, 20, 25, 8, 17, 23, 25, 9, 17, 23, 34, 9, 18, 25, 30, 10, 20, 27, 32, 12, 21, 29, 35, 12, 23, 34, 37, 12, 25, 34, 40, 13, 26, 35, 42, 14, 28, 38, 45, 15, 29, 40, 48, 16, 31, 43, 51, 17, 33, 45, 54, 18, 35, 48, 57, 19, 37, 51, 60, 19, 38, 53, 63, 20, 40, 56, 66, 21, 43, 59, 70, 22, 45, 62, 74, 24, 47, 65, 77, 25, 49, 68, 81],
                    i = [7, 10, 13, 17, 10, 16, 22, 28, 15, 26, 36, 44, 20, 36, 52, 64, 26, 48, 72, 88, 36, 64, 96, 112, 40, 72, 108, 130, 48, 88, 132, 156, 60, 110, 160, 192, 72, 130, 192, 224, 80, 150, 224, 264, 96, 176, 260, 308, 104, 198, 288, 352, 120, 216, 320, 384, 132, 240, 360, 432, 144, 280, 408, 480, 168, 308, 448, 532, 180, 338, 504, 588, 196, 364, 546, 650, 224, 416, 600, 700, 224, 442, 644, 750, 252, 476, 690, 816, 270, 504, 750, 900, 300, 560, 810, 960, 312, 588, 870, 1050, 336, 644, 952, 1110, 360, 700, 1020, 1200, 390, 728, 1050, 1260, 420, 784, 1140, 1350, 450, 812, 1200, 1440, 480, 868, 1290, 1530, 510, 924, 1350, 1620, 540, 980, 1440, 1710, 570, 1036, 1530, 1800, 570, 1064, 1590, 1890, 600, 1120, 1680, 1980, 630, 1204, 1770, 2100, 660, 1260, 1860, 2220, 720, 1316, 1950, 2310, 750, 1372, 2040, 2430];
                t.getBlocksCount = function(e, t) {
                    switch (t) {
                        case n.L:
                            return o[(e - 1) * 4 + 0];
                        case n.M:
                            return o[(e - 1) * 4 + 1];
                        case n.Q:
                            return o[(e - 1) * 4 + 2];
                        case n.H:
                            return o[(e - 1) * 4 + 3];
                        default:
                            return
                    }
                }, t.getTotalCodewordsCount = function(e, t) {
                    switch (t) {
                        case n.L:
                            return i[(e - 1) * 4 + 0];
                        case n.M:
                            return i[(e - 1) * 4 + 1];
                        case n.Q:
                            return i[(e - 1) * 4 + 2];
                        case n.H:
                            return i[(e - 1) * 4 + 3];
                        default:
                            return
                    }
                }
            },
            847: function(e, t) {
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
                }, t.from = function(e, r) {
                    if (t.isValid(e)) return e;
                    try {
                        if ("string" != typeof e) throw Error("Param is not a string");
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
                                throw Error("Unknown EC Level: " + e)
                        }
                    } catch (e) {
                        return r
                    }
                }
            },
            286: function(e, t, r) {
                var n = r(756).getSymbolSize;
                t.getPositions = function(e) {
                    var t = n(e);
                    return [
                        [0, 0],
                        [t - 7, 0],
                        [0, t - 7]
                    ]
                }
            },
            471: function(e, t, r) {
                var n = r(756),
                    o = n.getBCHDigit(1335);
                t.getEncodedBits = function(e, t) {
                    for (var r = e.bit << 3 | t, i = r << 10; n.getBCHDigit(i) - o >= 0;) i ^= 1335 << n.getBCHDigit(i) - o;
                    return (r << 10 | i) ^ 21522
                }
            },
            601: function(e, t) {
                for (var r = new Uint8Array(512), n = new Uint8Array(256), o = 1, i = 0; i < 255; i++) r[i] = o, n[o] = i, 256 & (o <<= 1) && (o ^= 285);
                for (var a = 255; a < 512; a++) r[a] = r[a - 255];
                t.log = function(e) {
                    if (e < 1) throw Error("log(" + e + ")");
                    return n[e]
                }, t.exp = function(e) {
                    return r[e]
                }, t.mul = function(e, t) {
                    return 0 === e || 0 === t ? 0 : r[n[e] + n[t]]
                }
            },
            791: function(e, t, r) {
                var n = r(594),
                    o = r(756);

                function i(e) {
                    this.mode = n.KANJI, this.data = e
                }
                i.getBitsLength = function(e) {
                    return 13 * e
                }, i.prototype.getLength = function() {
                    return this.data.length
                }, i.prototype.getBitsLength = function() {
                    return i.getBitsLength(this.data.length)
                }, i.prototype.write = function(e) {
                    var t;
                    for (t = 0; t < this.data.length; t++) {
                        var r = o.toSJIS(this.data[t]);
                        if (r >= 33088 && r <= 40956) r -= 33088;
                        else if (r >= 57408 && r <= 60351) r -= 49472;
                        else throw Error("Invalid SJIS character: " + this.data[t] + "\nMake sure your charset is UTF-8");
                        r = (r >>> 8 & 255) * 192 + (255 & r), e.put(r, 13)
                    }
                }, e.exports = i
            },
            682: function(e, t) {
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
                t.isValid = function(e) {
                    return null != e && "" !== e && !isNaN(e) && e >= 0 && e <= 7
                }, t.from = function(e) {
                    return t.isValid(e) ? parseInt(e, 10) : void 0
                }, t.getPenaltyN1 = function(e) {
                    for (var t = e.size, r = 0, n = 0, o = 0, i = null, a = null, l = 0; l < t; l++) {
                        n = o = 0, i = a = null;
                        for (var c = 0; c < t; c++) {
                            var u = e.get(l, c);
                            u === i ? n++ : (n >= 5 && (r += 3 + (n - 5)), i = u, n = 1), (u = e.get(c, l)) === a ? o++ : (o >= 5 && (r += 3 + (o - 5)), a = u, o = 1)
                        }
                        n >= 5 && (r += 3 + (n - 5)), o >= 5 && (r += 3 + (o - 5))
                    }
                    return r
                }, t.getPenaltyN2 = function(e) {
                    for (var t = e.size, r = 0, n = 0; n < t - 1; n++)
                        for (var o = 0; o < t - 1; o++) {
                            var i = e.get(n, o) + e.get(n, o + 1) + e.get(n + 1, o) + e.get(n + 1, o + 1);
                            (4 === i || 0 === i) && r++
                        }
                    return 3 * r
                }, t.getPenaltyN3 = function(e) {
                    for (var t = e.size, r = 0, n = 0, o = 0, i = 0; i < t; i++) {
                        n = o = 0;
                        for (var a = 0; a < t; a++) n = n << 1 & 2047 | e.get(i, a), a >= 10 && (1488 === n || 93 === n) && r++, o = o << 1 & 2047 | e.get(a, i), a >= 10 && (1488 === o || 93 === o) && r++
                    }
                    return 40 * r
                }, t.getPenaltyN4 = function(e) {
                    for (var t = 0, r = e.data.length, n = 0; n < r; n++) t += e.data[n];
                    return 10 * Math.abs(Math.ceil(100 * t / r / 5) - 10)
                }, t.applyMask = function(e, r) {
                    for (var n = r.size, o = 0; o < n; o++)
                        for (var i = 0; i < n; i++) r.isReserved(i, o) || r.xor(i, o, function(e, r, n) {
                            switch (e) {
                                case t.Patterns.PATTERN000:
                                    return (r + n) % 2 == 0;
                                case t.Patterns.PATTERN001:
                                    return r % 2 == 0;
                                case t.Patterns.PATTERN010:
                                    return n % 3 == 0;
                                case t.Patterns.PATTERN011:
                                    return (r + n) % 3 == 0;
                                case t.Patterns.PATTERN100:
                                    return (Math.floor(r / 2) + Math.floor(n / 3)) % 2 == 0;
                                case t.Patterns.PATTERN101:
                                    return r * n % 2 + r * n % 3 == 0;
                                case t.Patterns.PATTERN110:
                                    return (r * n % 2 + r * n % 3) % 2 == 0;
                                case t.Patterns.PATTERN111:
                                    return (r * n % 3 + (r + n) % 2) % 2 == 0;
                                default:
                                    throw Error("bad maskPattern:" + e)
                            }
                        }(e, i, o))
                }, t.getBestMask = function(e, r) {
                    for (var n = Object.keys(t.Patterns).length, o = 0, i = 1 / 0, a = 0; a < n; a++) {
                        r(a), t.applyMask(a, e);
                        var l = t.getPenaltyN1(e) + t.getPenaltyN2(e) + t.getPenaltyN3(e) + t.getPenaltyN4(e);
                        t.applyMask(a, e), l < i && (i = l, o = a)
                    }
                    return o
                }
            },
            594: function(e, t, r) {
                var n = r(352),
                    o = r(318);
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
                    if (!e.ccBits) throw Error("Invalid mode: " + e);
                    if (!n.isValid(t)) throw Error("Invalid version: " + t);
                    return t >= 1 && t < 10 ? e.ccBits[0] : t < 27 ? e.ccBits[1] : e.ccBits[2]
                }, t.getBestModeForData = function(e) {
                    return o.testNumeric(e) ? t.NUMERIC : o.testAlphanumeric(e) ? t.ALPHANUMERIC : o.testKanji(e) ? t.KANJI : t.BYTE
                }, t.toString = function(e) {
                    if (e && e.id) return e.id;
                    throw Error("Invalid mode")
                }, t.isValid = function(e) {
                    return e && e.bit && e.ccBits
                }, t.from = function(e, r) {
                    if (t.isValid(e)) return e;
                    try {
                        if ("string" != typeof e) throw Error("Param is not a string");
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
                                throw Error("Unknown mode: " + e)
                        }
                    } catch (e) {
                        return r
                    }
                }
            },
            215: function(e, t, r) {
                var n = r(594);

                function o(e) {
                    this.mode = n.NUMERIC, this.data = e.toString()
                }
                o.getBitsLength = function(e) {
                    return 10 * Math.floor(e / 3) + (e % 3 ? e % 3 * 3 + 1 : 0)
                }, o.prototype.getLength = function() {
                    return this.data.length
                }, o.prototype.getBitsLength = function() {
                    return o.getBitsLength(this.data.length)
                }, o.prototype.write = function(e) {
                    for (t = 0; t + 3 <= this.data.length; t += 3) r = parseInt(this.data.substr(t, 3), 10), e.put(r, 10);
                    var t, r, n = this.data.length - t;
                    n > 0 && (r = parseInt(this.data.substr(t), 10), e.put(r, 3 * n + 1))
                }, e.exports = o
            },
            827: function(e, t, r) {
                var n = r(601);
                t.mul = function(e, t) {
                    for (var r = new Uint8Array(e.length + t.length - 1), o = 0; o < e.length; o++)
                        for (var i = 0; i < t.length; i++) r[o + i] ^= n.mul(e[o], t[i]);
                    return r
                }, t.mod = function(e, t) {
                    for (var r = new Uint8Array(e); r.length - t.length >= 0;) {
                        for (var o = r[0], i = 0; i < t.length; i++) r[i] ^= n.mul(t[i], o);
                        for (var a = 0; a < r.length && 0 === r[a];) a++;
                        r = r.slice(a)
                    }
                    return r
                }, t.generateECPolynomial = function(e) {
                    for (var r = new Uint8Array([1]), o = 0; o < e; o++) r = t.mul(r, new Uint8Array([1, n.exp(o)]));
                    return r
                }
            },
            7: function(e, t, r) {
                var n = r(756),
                    o = r(847),
                    i = r(477),
                    a = r(898),
                    l = r(667),
                    c = r(286),
                    u = r(682),
                    s = r(908),
                    f = r(418),
                    p = r(537),
                    h = r(471),
                    d = r(594),
                    y = r(743);

                function m(e, t, r) {
                    var n, o, i = e.size,
                        a = h.getEncodedBits(t, r);
                    for (n = 0; n < 15; n++) o = (a >> n & 1) == 1, n < 6 ? e.set(n, 8, o, !0) : n < 8 ? e.set(n + 1, 8, o, !0) : e.set(i - 15 + n, 8, o, !0), n < 8 ? e.set(8, i - n - 1, o, !0) : n < 9 ? e.set(8, 15 - n - 1 + 1, o, !0) : e.set(8, 15 - n - 1, o, !0);
                    e.set(i - 8, 8, 1, !0)
                }
                t.create = function(e, t) {
                    if (void 0 === e || "" === e) throw Error("No input text");
                    var r, h, b = o.M;
                    return void 0 !== t && (b = o.from(t.errorCorrectionLevel, o.M), r = p.from(t.version), h = u.from(t.maskPattern), t.toSJISFunc && n.setToSJISFunction(t.toSJISFunc)),
                        function(e, t, r, o) {
                            if (Array.isArray(e)) h = y.fromArray(e);
                            else if ("string" == typeof e) {
                                var h, b = t;
                                if (!b) {
                                    var g = y.rawSplit(e);
                                    b = p.getBestVersionForData(g, r)
                                }
                                h = y.fromString(e, b || 40)
                            } else throw Error("Invalid data");
                            var v = p.getBestVersionForData(h, r);
                            if (!v) throw Error("The amount of data is too big to be stored in a QR Code");
                            if (t) {
                                if (t < v) throw Error("\nThe chosen QR Code version cannot contain this amount of data.\nMinimum version required to store current data is: " + v + ".\n")
                            } else t = v;
                            var O = function(e, t, r) {
                                    var o = new i;
                                    r.forEach(function(t) {
                                        o.put(t.mode.bit, 4), o.put(t.getLength(), d.getCharCountIndicator(t.mode, e)), t.write(o)
                                    });
                                    var a = (n.getSymbolTotalCodewords(e) - s.getTotalCodewordsCount(e, t)) * 8;
                                    for (o.getLengthInBits() + 4 <= a && o.put(0, 4); o.getLengthInBits() % 8 != 0;) o.putBit(0);
                                    for (var l = (a - o.getLengthInBits()) / 8, c = 0; c < l; c++) o.put(c % 2 ? 17 : 236, 8);
                                    return function(e, t, r) {
                                        for (var o, i, a = n.getSymbolTotalCodewords(t), l = a - s.getTotalCodewordsCount(t, r), c = s.getBlocksCount(t, r), u = a % c, p = c - u, h = Math.floor(a / c), d = Math.floor(l / c), y = d + 1, m = h - d, b = new f(m), g = 0, v = Array(c), O = Array(c), w = 0, E = new Uint8Array(e.buffer), A = 0; A < c; A++) {
                                            var S = A < p ? d : y;
                                            v[A] = E.slice(g, g + S), O[A] = b.encode(v[A]), g += S, w = Math.max(w, S)
                                        }
                                        var j = new Uint8Array(a),
                                            x = 0;
                                        for (o = 0; o < w; o++)
                                            for (i = 0; i < c; i++) o < v[i].length && (j[x++] = v[i][o]);
                                        for (o = 0; o < m; o++)
                                            for (i = 0; i < c; i++) j[x++] = O[i][o];
                                        return j
                                    }(o, e, t)
                                }(t, r, h),
                                w = new a(n.getSymbolSize(t));
                            ! function(e, t) {
                                for (var r = e.size, n = c.getPositions(t), o = 0; o < n.length; o++)
                                    for (var i = n[o][0], a = n[o][1], l = -1; l <= 7; l++)
                                        if (!(i + l <= -1) && !(r <= i + l))
                                            for (var u = -1; u <= 7; u++) a + u <= -1 || r <= a + u || (l >= 0 && l <= 6 && (0 === u || 6 === u) || u >= 0 && u <= 6 && (0 === l || 6 === l) || l >= 2 && l <= 4 && u >= 2 && u <= 4 ? e.set(i + l, a + u, !0, !0) : e.set(i + l, a + u, !1, !0))
                            }(w, t);
                            for (var E = w.size, A = 8; A < E - 8; A++) {
                                var S = A % 2 == 0;
                                w.set(A, 6, S, !0), w.set(6, A, S, !0)
                            }
                            return ! function(e, t) {
                                for (var r = l.getPositions(t), n = 0; n < r.length; n++)
                                    for (var o = r[n][0], i = r[n][1], a = -2; a <= 2; a++)
                                        for (var c = -2; c <= 2; c++) - 2 === a || 2 === a || -2 === c || 2 === c || 0 === a && 0 === c ? e.set(o + a, i + c, !0, !0) : e.set(o + a, i + c, !1, !0)
                            }(w, t), m(w, r, 0), t >= 7 && function(e, t) {
                                for (var r, n, o, i = e.size, a = p.getEncodedBits(t), l = 0; l < 18; l++) r = Math.floor(l / 3), n = l % 3 + i - 8 - 3, o = (a >> l & 1) == 1, e.set(r, n, o, !0), e.set(n, r, o, !0)
                            }(w, t), ! function(e, t) {
                                for (var r = e.size, n = -1, o = r - 1, i = 7, a = 0, l = r - 1; l > 0; l -= 2)
                                    for (6 === l && l--;;) {
                                        for (var c = 0; c < 2; c++)
                                            if (!e.isReserved(o, l - c)) {
                                                var u = !1;
                                                a < t.length && (u = (t[a] >>> i & 1) == 1), e.set(o, l - c, u), -1 == --i && (a++, i = 7)
                                            } if ((o += n) < 0 || r <= o) {
                                            o -= n, n = -n;
                                            break
                                        }
                                    }
                            }(w, O), isNaN(o) && (o = u.getBestMask(w, m.bind(null, w, r))), u.applyMask(o, w), m(w, r, o), {
                                modules: w,
                                version: t,
                                errorCorrectionLevel: r,
                                maskPattern: o,
                                segments: h
                            }
                        }(e, r, b, h)
                }
            },
            418: function(e, t, r) {
                var n = r(827);

                function o(e) {
                    this.genPoly = void 0, this.degree = e, this.degree && this.initialize(this.degree)
                }
                o.prototype.initialize = function(e) {
                    this.degree = e, this.genPoly = n.generateECPolynomial(this.degree)
                }, o.prototype.encode = function(e) {
                    if (!this.genPoly) throw Error("Encoder not initialized");
                    var t = new Uint8Array(e.length + this.degree);
                    t.set(e);
                    var r = n.mod(t, this.genPoly),
                        o = this.degree - r.length;
                    if (o > 0) {
                        var i = new Uint8Array(this.degree);
                        return i.set(r, o), i
                    }
                    return r
                }, e.exports = o
            },
            318: function(e, t) {
                var r = "[0-9]+",
                    n = "(?:[u3000-u303F]|[u3040-u309F]|[u30A0-u30FF]|[uFF00-uFFEF]|[u4E00-u9FAF]|[u2605-u2606]|[u2190-u2195]|u203B|[u2010u2015u2018u2019u2025u2026u201Cu201Du2225u2260]|[u0391-u0451]|[u00A7u00A8u00B1u00B4u00D7u00F7])+",
                    o = "(?:(?![A-Z0-9 $%*+\\-./:]|" + (n = n.replace(/u/g, "\\u")) + ")(?:.|[\r\n]))+";
                t.KANJI = RegExp(n, "g"), t.BYTE_KANJI = RegExp("[^A-Z0-9 $%*+\\-./:]+", "g"), t.BYTE = RegExp(o, "g"), t.NUMERIC = RegExp(r, "g"), t.ALPHANUMERIC = RegExp("[A-Z $%*+\\-./:]+", "g");
                var i = RegExp("^" + n + "$"),
                    a = RegExp("^" + r + "$"),
                    l = RegExp("^[A-Z0-9 $%*+\\-./:]+$");
                t.testKanji = function(e) {
                    return i.test(e)
                }, t.testNumeric = function(e) {
                    return a.test(e)
                }, t.testAlphanumeric = function(e) {
                    return l.test(e)
                }
            },
            743: function(e, t, r) {
                var n = r(594),
                    o = r(215),
                    i = r(92),
                    a = r(124),
                    l = r(791),
                    c = r(318),
                    u = r(756),
                    s = r(685);

                function f(e) {
                    return unescape(encodeURIComponent(e)).length
                }

                function p(e, t, r) {
                    for (var n, o = []; null !== (n = e.exec(r));) o.push({
                        data: n[0],
                        index: n.index,
                        mode: t,
                        length: n[0].length
                    });
                    return o
                }

                function h(e) {
                    var t, r, o = p(c.NUMERIC, n.NUMERIC, e),
                        i = p(c.ALPHANUMERIC, n.ALPHANUMERIC, e);
                    return u.isKanjiModeEnabled() ? (t = p(c.BYTE, n.BYTE, e), r = p(c.KANJI, n.KANJI, e)) : (t = p(c.BYTE_KANJI, n.BYTE, e), r = []), o.concat(i, t, r).sort(function(e, t) {
                        return e.index - t.index
                    }).map(function(e) {
                        return {
                            data: e.data,
                            mode: e.mode,
                            length: e.length
                        }
                    })
                }

                function d(e, t) {
                    switch (t) {
                        case n.NUMERIC:
                            return o.getBitsLength(e);
                        case n.ALPHANUMERIC:
                            return i.getBitsLength(e);
                        case n.KANJI:
                            return l.getBitsLength(e);
                        case n.BYTE:
                            return a.getBitsLength(e)
                    }
                }

                function y(e, t) {
                    var r, c = n.getBestModeForData(e);
                    if ((r = n.from(t, c)) !== n.BYTE && r.bit < c.bit) throw Error('"' + e + '" cannot be encoded with mode ' + n.toString(r) + ".\n Suggested mode is: " + n.toString(c));
                    switch (r === n.KANJI && !u.isKanjiModeEnabled() && (r = n.BYTE), r) {
                        case n.NUMERIC:
                            return new o(e);
                        case n.ALPHANUMERIC:
                            return new i(e);
                        case n.KANJI:
                            return new l(e);
                        case n.BYTE:
                            return new a(e)
                    }
                }
                t.fromArray = function(e) {
                    return e.reduce(function(e, t) {
                        return "string" == typeof t ? e.push(y(t, null)) : t.data && e.push(y(t.data, t.mode)), e
                    }, [])
                }, t.fromString = function(e, r) {
                    for (var o = function(e, t) {
                            for (var r = {}, o = {
                                    start: {}
                                }, i = ["start"], a = 0; a < e.length; a++) {
                                for (var l = e[a], c = [], u = 0; u < l.length; u++) {
                                    var s = l[u],
                                        f = "" + a + u;
                                    c.push(f), r[f] = {
                                        node: s,
                                        lastCount: 0
                                    }, o[f] = {};
                                    for (var p = 0; p < i.length; p++) {
                                        var h = i[p];
                                        r[h] && r[h].node.mode === s.mode ? (o[h][f] = d(r[h].lastCount + s.length, s.mode) - d(r[h].lastCount, s.mode), r[h].lastCount += s.length) : (r[h] && (r[h].lastCount = s.length), o[h][f] = d(s.length, s.mode) + 4 + n.getCharCountIndicator(s.mode, t))
                                    }
                                }
                                i = c
                            }
                            for (var y = 0; y < i.length; y++) o[i[y]].end = 0;
                            return {
                                map: o,
                                table: r
                            }
                        }(function(e) {
                            for (var t = [], r = 0; r < e.length; r++) {
                                var o = e[r];
                                switch (o.mode) {
                                    case n.NUMERIC:
                                        t.push([o, {
                                            data: o.data,
                                            mode: n.ALPHANUMERIC,
                                            length: o.length
                                        }, {
                                            data: o.data,
                                            mode: n.BYTE,
                                            length: o.length
                                        }]);
                                        break;
                                    case n.ALPHANUMERIC:
                                        t.push([o, {
                                            data: o.data,
                                            mode: n.BYTE,
                                            length: o.length
                                        }]);
                                        break;
                                    case n.KANJI:
                                        t.push([o, {
                                            data: o.data,
                                            mode: n.BYTE,
                                            length: f(o.data)
                                        }]);
                                        break;
                                    case n.BYTE:
                                        t.push([{
                                            data: o.data,
                                            mode: n.BYTE,
                                            length: f(o.data)
                                        }])
                                }
                            }
                            return t
                        }(h(e, u.isKanjiModeEnabled())), r), i = s.find_path(o.map, "start", "end"), a = [], l = 1; l < i.length - 1; l++) a.push(o.table[i[l]].node);
                    return t.fromArray(a.reduce(function(e, t) {
                        var r = e.length - 1 >= 0 ? e[e.length - 1] : null;
                        return r && r.mode === t.mode ? e[e.length - 1].data += t.data : e.push(t), e
                    }, []))
                }, t.rawSplit = function(e) {
                    return t.fromArray(h(e, u.isKanjiModeEnabled()))
                }
            },
            756: function(e, t) {
                var r, n = [0, 26, 44, 70, 100, 134, 172, 196, 242, 292, 346, 404, 466, 532, 581, 655, 733, 815, 901, 991, 1085, 1156, 1258, 1364, 1474, 1588, 1706, 1828, 1921, 2051, 2185, 2323, 2465, 2611, 2761, 2876, 3034, 3196, 3362, 3532, 3706];
                t.getSymbolSize = function(e) {
                    if (!e) throw Error('"version" cannot be null or undefined');
                    if (e < 1 || e > 40) throw Error('"version" should be in range from 1 to 40');
                    return 4 * e + 17
                }, t.getSymbolTotalCodewords = function(e) {
                    return n[e]
                }, t.getBCHDigit = function(e) {
                    for (var t = 0; 0 !== e;) t++, e >>>= 1;
                    return t
                }, t.setToSJISFunction = function(e) {
                    if ("function" != typeof e) throw Error('"toSJISFunc" is not a valid function.');
                    r = e
                }, t.isKanjiModeEnabled = function() {
                    return void 0 !== r
                }, t.toSJIS = function(e) {
                    return r(e)
                }
            },
            352: function(e, t) {
                t.isValid = function(e) {
                    return !isNaN(e) && e >= 1 && e <= 40
                }
            },
            537: function(e, t, r) {
                var n = r(756),
                    o = r(908),
                    i = r(847),
                    a = r(594),
                    l = r(352),
                    c = n.getBCHDigit(7973);

                function u(e, t) {
                    return a.getCharCountIndicator(e, t) + 4
                }
                t.from = function(e, t) {
                    return l.isValid(e) ? parseInt(e, 10) : t
                }, t.getCapacity = function(e, t, r) {
                    if (!l.isValid(e)) throw Error("Invalid QR Code version");
                    void 0 === r && (r = a.BYTE);
                    var i = (n.getSymbolTotalCodewords(e) - o.getTotalCodewordsCount(e, t)) * 8;
                    if (r === a.MIXED) return i;
                    var c = i - u(r, e);
                    switch (r) {
                        case a.NUMERIC:
                            return Math.floor(c / 10 * 3);
                        case a.ALPHANUMERIC:
                            return Math.floor(c / 11 * 2);
                        case a.KANJI:
                            return Math.floor(c / 13);
                        case a.BYTE:
                        default:
                            return Math.floor(c / 8)
                    }
                }, t.getBestVersionForData = function(e, r) {
                    var n, o = i.from(r, i.M);
                    if (Array.isArray(e)) {
                        if (e.length > 1) {
                            for (var l = 1; l <= 40; l++)
                                if (function(e, t) {
                                        var r = 0;
                                        return e.forEach(function(e) {
                                            var n = u(e.mode, t);
                                            r += n + e.getBitsLength()
                                        }), r
                                    }(e, l) <= t.getCapacity(l, o, a.MIXED)) return l;
                            return
                        }
                        if (0 === e.length) return 1;
                        n = e[0]
                    } else n = e;
                    return function(e, r, n) {
                        for (var o = 1; o <= 40; o++)
                            if (r <= t.getCapacity(o, n, e)) return o
                    }(n.mode, n.getLength(), o)
                }, t.getEncodedBits = function(e) {
                    if (!l.isValid(e) || e < 7) throw Error("Invalid QR Code version");
                    for (var t = e << 12; n.getBCHDigit(t) - c >= 0;) t ^= 7973 << n.getBCHDigit(t) - c;
                    return e << 12 | t
                }
            },
            709: function(e, t, r) {
                var n = r(888);
                t.render = function(e, t, r) {
                    var o, i = r,
                        a = t;
                    void 0 !== i || t && t.getContext || (i = t, t = void 0), t || (a = function() {
                        try {
                            return document.createElement("canvas")
                        } catch (e) {
                            throw Error("You need to specify a canvas element")
                        }
                    }()), i = n.getOptions(i);
                    var l = n.getImageWidth(e.modules.size, i),
                        c = a.getContext("2d"),
                        u = c.createImageData(l, l);
                    return n.qrToImageData(u.data, e, i), o = a, c.clearRect(0, 0, o.width, o.height), o.style || (o.style = {}), o.height = l, o.width = l, o.style.height = l + "px", o.style.width = l + "px", c.putImageData(u, 0, 0), a
                }, t.renderToDataURL = function(e, r, n) {
                    var o = n;
                    void 0 !== o || r && r.getContext || (o = r, r = void 0), o || (o = {});
                    var i = t.render(e, r, o),
                        a = o.type || "image/png",
                        l = o.rendererOpts || {};
                    return i.toDataURL(a, l.quality)
                }
            },
            386: function(e, t, r) {
                var n = r(888);

                function o(e, t) {
                    var r = e.a / 255,
                        n = t + '="' + e.hex + '"';
                    return r < 1 ? n + " " + t + '-opacity="' + r.toFixed(2).slice(1) + '"' : n
                }

                function i(e, t, r) {
                    var n = e + t;
                    return void 0 !== r && (n += " " + r), n
                }
                t.render = function(e, t, r) {
                    var a = n.getOptions(t),
                        l = e.modules.size,
                        c = e.modules.data,
                        u = l + 2 * a.margin,
                        s = a.color.light.a ? "<path " + o(a.color.light, "fill") + ' d="M0 0h' + u + "v" + u + 'H0z"/>' : "",
                        f = "<path " + o(a.color.dark, "stroke") + ' d="' + function(e, t, r) {
                            for (var n = "", o = 0, a = !1, l = 0, c = 0; c < e.length; c++) {
                                var u = Math.floor(c % t),
                                    s = Math.floor(c / t);
                                u || a || (a = !0), e[c] ? (l++, c > 0 && u > 0 && e[c - 1] || (n += a ? i("M", u + r, .5 + s + r) : i("m", o, 0), o = 0, a = !1), u + 1 < t && e[c + 1] || (n += i("h", l), l = 0)) : o++
                            }
                            return n
                        }(c, l, a.margin) + '"/>',
                        p = '<svg xmlns="http://www.w3.org/2000/svg" ' + (a.width ? 'width="' + a.width + '" height="' + a.width + '" ' : "") + ('viewBox="0 0 ' + u + " ") + u + '" shape-rendering="crispEdges">' + s + f + "</svg>\n";
                    return "function" == typeof r && r(null, p), p
                }
            },
            888: function(e, t) {
                function r(e) {
                    if ("number" == typeof e && (e = e.toString()), "string" != typeof e) throw Error("Color should be defined as hex string");
                    var t = e.slice().replace("#", "").split("");
                    if (t.length < 3 || 5 === t.length || t.length > 8) throw Error("Invalid hex color: " + e);
                    (3 === t.length || 4 === t.length) && (t = Array.prototype.concat.apply([], t.map(function(e) {
                        return [e, e]
                    }))), 6 === t.length && t.push("F", "F");
                    var r = parseInt(t.join(""), 16);
                    return {
                        r: r >> 24 & 255,
                        g: r >> 16 & 255,
                        b: r >> 8 & 255,
                        a: 255 & r,
                        hex: "#" + t.slice(0, 6).join("")
                    }
                }
                t.getOptions = function(e) {
                    e || (e = {}), e.color || (e.color = {});
                    var t = void 0 === e.margin || null === e.margin || e.margin < 0 ? 4 : e.margin,
                        n = e.width && e.width >= 21 ? e.width : void 0,
                        o = e.scale || 4;
                    return {
                        width: n,
                        scale: n ? 4 : o,
                        margin: t,
                        color: {
                            dark: r(e.color.dark || "#000000ff"),
                            light: r(e.color.light || "#ffffffff")
                        },
                        type: e.type,
                        rendererOpts: e.rendererOpts || {}
                    }
                }, t.getScale = function(e, t) {
                    return t.width && t.width >= e + 2 * t.margin ? t.width / (e + 2 * t.margin) : t.scale
                }, t.getImageWidth = function(e, r) {
                    var n = t.getScale(e, r);
                    return Math.floor((e + 2 * r.margin) * n)
                }, t.qrToImageData = function(e, r, n) {
                    for (var o = r.modules.size, i = r.modules.data, a = t.getScale(o, n), l = Math.floor((o + 2 * n.margin) * a), c = n.margin * a, u = [n.color.light, n.color.dark], s = 0; s < l; s++)
                        for (var f = 0; f < l; f++) {
                            var p = (s * l + f) * 4,
                                h = n.color.light;
                            s >= c && f >= c && s < l - c && f < l - c && (h = u[+!!i[Math.floor((s - c) / a) * o + Math.floor((f - c) / a)]]), e[p++] = h.r, e[p++] = h.g, e[p++] = h.b, e[p] = h.a
                        }
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
    r.m = e, r.n = function(e) {
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
        }, r.o = function(e, t) {
            return Object.prototype.hasOwnProperty.call(e, t)
        }, r.r = function(e) {
            "u" > typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {
                value: "Module"
            }), Object.defineProperty(e, "__esModule", {
                value: !0
            })
        }, r.nc = void 0, r.rv = function() {
            return "1.7.12"
        }, r.ruid = "bundler=rspack@1.7.12",
        function() {
            "use strict";
            var e, t, n, o, i, a, l, c, u, s, f, p, h, d, y, m, b, g, v, O = window.ReactJSX,
                w = window.Roblox["core-scripts"].util.ready,
                E = r.n(w),
                A = window.Roblox["core-scripts"].react,
                S = window.React,
                j = r.n(S);

            function x(e, t) {
                var r = t && t.cache ? t.cache : T,
                    n = t && t.serializer ? t.serializer : I;
                return (t && t.strategy ? t.strategy : function(e, t) {
                    var r, n, o = 1 === e.length ? P : C;
                    return r = t.cache.create(), n = t.serializer, o.bind(this, e, r, n)
                })(e, {
                    cache: r,
                    serializer: n
                })
            }

            function P(e, t, r, n) {
                var o = null == n || "number" == typeof n || "boolean" == typeof n ? n : r(n),
                    i = t.get(o);
                return void 0 === i && (i = e.call(this, n), t.set(o, i)), i
            }

            function C(e, t, r) {
                var n = Array.prototype.slice.call(arguments, 3),
                    o = r(n),
                    i = t.get(o);
                return void 0 === i && (i = e.apply(this, n), t.set(o, i)), i
            }
            var I = function() {
                    return JSON.stringify(arguments)
                },
                N = function() {
                    var e;

                    function t() {
                        if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                        this.cache = Object.create(null)
                    }
                    return e = [{
                            key: "get",
                            value: function(e) {
                                return this.cache[e]
                            }
                        }, {
                            key: "set",
                            value: function(e, t) {
                                this.cache[e] = t
                            }
                        }],
                        function(e, t) {
                            for (var r = 0; r < t.length; r++) {
                                var n = t[r];
                                n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                            }
                        }(t.prototype, e), t
                }(),
                T = {
                    create: function() {
                        return new N
                    }
                },
                k = {
                    variadic: function(e, t) {
                        var r, n;
                        return r = t.cache.create(), n = t.serializer, C.bind(this, e, r, n)
                    },
                    monadic: function(e, t) {
                        var r, n;
                        return r = t.cache.create(), n = t.serializer, P.bind(this, e, r, n)
                    }
                };

            function B(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function L(e, t, r) {
                return (L = H() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && M(o, r.prototype), o
                }).apply(null, arguments)
            }

            function R(e) {
                return (R = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function M(e, t) {
                return (M = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function D(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (D = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return L(e, arguments, R(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), M(r, e)
                })(e)
            }

            function H() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (H = function() {
                    return !!e
                })()
            }
            var U = function(e) {
                    if ("function" != typeof e && null !== e) throw TypeError("Super expression must either be null or a function");

                    function t(e, r) {
                        if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                        var n, o, i, a = e;
                        return r && (a += ": " + r), n = t, o = [a], n = R(n), (i = function(e, t) {
                            var r;
                            if (t && ("object" == ((r = t) && "u" > typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r) || "function" == typeof t)) return t;
                            if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                            return e
                        }(this, H() ? Reflect.construct(n, o || [], R(this).constructor) : n.apply(this, o))).code = e, r && (i.originalMessage = r), i
                    }
                    return t.prototype = Object.create(e && e.prototype, {
                        constructor: {
                            value: t,
                            writable: !0,
                            configurable: !0
                        }
                    }), e && M(t, e), t
                }(D(Error)),
                V = ((t = V || {}).MISSING_MESSAGE = "MISSING_MESSAGE", t.MISSING_FORMAT = "MISSING_FORMAT", t.ENVIRONMENT_FALLBACK = "ENVIRONMENT_FALLBACK", t.INSUFFICIENT_PATH = "INSUFFICIENT_PATH", t.INVALID_MESSAGE = "INVALID_MESSAGE", t.INVALID_KEY = "INVALID_KEY", t.FORMATTING_ERROR = "FORMATTING_ERROR", t);

            function F(e, t) {
                return x(e, {
                    cache: {
                        create: function() {
                            return {
                                get: function(e) {
                                    return t[e]
                                },
                                set: function(e, r) {
                                    t[e] = r
                                }
                            }
                        }
                    },
                    strategy: k.variadic
                })
            }

            function _(e, t) {
                return F(function() {
                    for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
                    return L(e, function(e) {
                        if (Array.isArray(e)) return B(e)
                    }(r) || function(e) {
                        if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                    }(r) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return B(e, void 0);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return B(e, void 0)
                        }
                    }(r) || function() {
                        throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }())
                }, t)
            }

            function G(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function K(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }

            function z(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }
            var Q = /(?:[Eec]{1,6}|G{1,5}|[Qq]{1,5}|(?:[yYur]+|U{1,5})|[ML]{1,5}|d{1,2}|D{1,3}|F{1}|[abB]{1,5}|[hkHK]{1,2}|w{1,2}|W{1}|m{1,2}|s{1,2}|[zZOvVxX]{1,4})(?=([^']*'[^']*')*[^']*$)/g,
                Y = /[\t-\r \x85\u200E\u200F\u2028\u2029]/i,
                Z = /^\.(?:(0+)(\*)?|(#+)|(0+)(#+))$/g,
                X = /^(@+)?(\+|#+)?[rs]?$/g,
                W = /(\*)(0+)|(#+)(0+)|(0+)/g,
                q = /^(0+)$/;

            function J(e) {
                var t = {};
                return "r" === e[e.length - 1] ? t.roundingPriority = "morePrecision" : "s" === e[e.length - 1] && (t.roundingPriority = "lessPrecision"), e.replace(X, function(e, r, n) {
                    return "string" != typeof n ? (t.minimumSignificantDigits = r.length, t.maximumSignificantDigits = r.length) : "+" === n ? t.minimumSignificantDigits = r.length : "#" === r[0] ? t.maximumSignificantDigits = r.length : (t.minimumSignificantDigits = r.length, t.maximumSignificantDigits = r.length + ("string" == typeof n ? n.length : 0)), ""
                }), t
            }

            function $(e) {
                switch (e) {
                    case "sign-auto":
                        return {
                            signDisplay: "auto"
                        };
                    case "sign-accounting":
                    case "()":
                        return {
                            currencySign: "accounting"
                        };
                    case "sign-always":
                    case "+!":
                        return {
                            signDisplay: "always"
                        };
                    case "sign-accounting-always":
                    case "()!":
                        return {
                            signDisplay: "always", currencySign: "accounting"
                        };
                    case "sign-except-zero":
                    case "+?":
                        return {
                            signDisplay: "exceptZero"
                        };
                    case "sign-accounting-except-zero":
                    case "()?":
                        return {
                            signDisplay: "exceptZero", currencySign: "accounting"
                        };
                    case "sign-never":
                    case "+_":
                        return {
                            signDisplay: "never"
                        }
                }
            }

            function ee(e) {
                var t = $(e);
                return t || {}
            }

            function et(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function er(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }

            function en(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function eo(e, t) {
                if (e) {
                    if ("string" == typeof e) return et(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return et(e, t)
                }
            }
            var ei = ((n = {})[n.EXPECT_ARGUMENT_CLOSING_BRACE = 1] = "EXPECT_ARGUMENT_CLOSING_BRACE", n[n.EMPTY_ARGUMENT = 2] = "EMPTY_ARGUMENT", n[n.MALFORMED_ARGUMENT = 3] = "MALFORMED_ARGUMENT", n[n.EXPECT_ARGUMENT_TYPE = 4] = "EXPECT_ARGUMENT_TYPE", n[n.INVALID_ARGUMENT_TYPE = 5] = "INVALID_ARGUMENT_TYPE", n[n.EXPECT_ARGUMENT_STYLE = 6] = "EXPECT_ARGUMENT_STYLE", n[n.INVALID_NUMBER_SKELETON = 7] = "INVALID_NUMBER_SKELETON", n[n.INVALID_DATE_TIME_SKELETON = 8] = "INVALID_DATE_TIME_SKELETON", n[n.EXPECT_NUMBER_SKELETON = 9] = "EXPECT_NUMBER_SKELETON", n[n.EXPECT_DATE_TIME_SKELETON = 10] = "EXPECT_DATE_TIME_SKELETON", n[n.UNCLOSED_QUOTE_IN_ARGUMENT_STYLE = 11] = "UNCLOSED_QUOTE_IN_ARGUMENT_STYLE", n[n.EXPECT_SELECT_ARGUMENT_OPTIONS = 12] = "EXPECT_SELECT_ARGUMENT_OPTIONS", n[n.EXPECT_PLURAL_ARGUMENT_OFFSET_VALUE = 13] = "EXPECT_PLURAL_ARGUMENT_OFFSET_VALUE", n[n.INVALID_PLURAL_ARGUMENT_OFFSET_VALUE = 14] = "INVALID_PLURAL_ARGUMENT_OFFSET_VALUE", n[n.EXPECT_SELECT_ARGUMENT_SELECTOR = 15] = "EXPECT_SELECT_ARGUMENT_SELECTOR", n[n.EXPECT_PLURAL_ARGUMENT_SELECTOR = 16] = "EXPECT_PLURAL_ARGUMENT_SELECTOR", n[n.EXPECT_SELECT_ARGUMENT_SELECTOR_FRAGMENT = 17] = "EXPECT_SELECT_ARGUMENT_SELECTOR_FRAGMENT", n[n.EXPECT_PLURAL_ARGUMENT_SELECTOR_FRAGMENT = 18] = "EXPECT_PLURAL_ARGUMENT_SELECTOR_FRAGMENT", n[n.INVALID_PLURAL_ARGUMENT_SELECTOR = 19] = "INVALID_PLURAL_ARGUMENT_SELECTOR", n[n.DUPLICATE_PLURAL_ARGUMENT_SELECTOR = 20] = "DUPLICATE_PLURAL_ARGUMENT_SELECTOR", n[n.DUPLICATE_SELECT_ARGUMENT_SELECTOR = 21] = "DUPLICATE_SELECT_ARGUMENT_SELECTOR", n[n.MISSING_OTHER_CLAUSE = 22] = "MISSING_OTHER_CLAUSE", n[n.INVALID_TAG = 23] = "INVALID_TAG", n[n.INVALID_TAG_NAME = 25] = "INVALID_TAG_NAME", n[n.UNMATCHED_CLOSING_TAG = 26] = "UNMATCHED_CLOSING_TAG", n[n.UNCLOSED_TAG = 27] = "UNCLOSED_TAG", n);

            function ea(e) {
                return !!(e && (void 0 === e ? "undefined" : en(e)) === "object" && 0 === e.type)
            }

            function el(e) {
                return !!(e && (void 0 === e ? "undefined" : en(e)) === "object" && 1 === e.type)
            }
            var ec = /[ \xA0\u1680\u2000-\u200A\u202F\u205F\u3000]/,
                eu = {
                    "001": ["H", "h"],
                    419: ["h", "H", "hB", "hb"],
                    AC: ["H", "h", "hb", "hB"],
                    AD: ["H", "hB"],
                    AE: ["h", "hB", "hb", "H"],
                    AF: ["H", "hb", "hB", "h"],
                    AG: ["h", "hb", "H", "hB"],
                    AI: ["H", "h", "hb", "hB"],
                    AL: ["h", "H", "hB"],
                    AM: ["H", "hB"],
                    AO: ["H", "hB"],
                    AR: ["h", "H", "hB", "hb"],
                    AS: ["h", "H"],
                    AT: ["H", "hB"],
                    AU: ["h", "hb", "H", "hB"],
                    AW: ["H", "hB"],
                    AX: ["H"],
                    AZ: ["H", "hB", "h"],
                    BA: ["H", "hB", "h"],
                    BB: ["h", "hb", "H", "hB"],
                    BD: ["h", "hB", "H"],
                    BE: ["H", "hB"],
                    BF: ["H", "hB"],
                    BG: ["H", "hB", "h"],
                    BH: ["h", "hB", "hb", "H"],
                    BI: ["H", "h"],
                    BJ: ["H", "hB"],
                    BL: ["H", "hB"],
                    BM: ["h", "hb", "H", "hB"],
                    BN: ["hb", "hB", "h", "H"],
                    BO: ["h", "H", "hB", "hb"],
                    BQ: ["H"],
                    BR: ["H", "hB"],
                    BS: ["h", "hb", "H", "hB"],
                    BT: ["h", "H"],
                    BW: ["H", "h", "hb", "hB"],
                    BY: ["H", "h"],
                    BZ: ["H", "h", "hb", "hB"],
                    CA: ["h", "hb", "H", "hB"],
                    CC: ["H", "h", "hb", "hB"],
                    CD: ["hB", "H"],
                    CF: ["H", "h", "hB"],
                    CG: ["H", "hB"],
                    CH: ["H", "hB", "h"],
                    CI: ["H", "hB"],
                    CK: ["H", "h", "hb", "hB"],
                    CL: ["h", "H", "hB", "hb"],
                    CM: ["H", "h", "hB"],
                    CN: ["H", "hB", "hb", "h"],
                    CO: ["h", "H", "hB", "hb"],
                    CP: ["H"],
                    CR: ["h", "H", "hB", "hb"],
                    CU: ["h", "H", "hB", "hb"],
                    CV: ["H", "hB"],
                    CW: ["H", "hB"],
                    CX: ["H", "h", "hb", "hB"],
                    CY: ["h", "H", "hb", "hB"],
                    CZ: ["H"],
                    DE: ["H", "hB"],
                    DG: ["H", "h", "hb", "hB"],
                    DJ: ["h", "H"],
                    DK: ["H"],
                    DM: ["h", "hb", "H", "hB"],
                    DO: ["h", "H", "hB", "hb"],
                    DZ: ["h", "hB", "hb", "H"],
                    EA: ["H", "h", "hB", "hb"],
                    EC: ["h", "H", "hB", "hb"],
                    EE: ["H", "hB"],
                    EG: ["h", "hB", "hb", "H"],
                    EH: ["h", "hB", "hb", "H"],
                    ER: ["h", "H"],
                    ES: ["H", "hB", "h", "hb"],
                    ET: ["hB", "hb", "h", "H"],
                    FI: ["H"],
                    FJ: ["h", "hb", "H", "hB"],
                    FK: ["H", "h", "hb", "hB"],
                    FM: ["h", "hb", "H", "hB"],
                    FO: ["H", "h"],
                    FR: ["H", "hB"],
                    GA: ["H", "hB"],
                    GB: ["H", "h", "hb", "hB"],
                    GD: ["h", "hb", "H", "hB"],
                    GE: ["H", "hB", "h"],
                    GF: ["H", "hB"],
                    GG: ["H", "h", "hb", "hB"],
                    GH: ["h", "H"],
                    GI: ["H", "h", "hb", "hB"],
                    GL: ["H", "h"],
                    GM: ["h", "hb", "H", "hB"],
                    GN: ["H", "hB"],
                    GP: ["H", "hB"],
                    GQ: ["H", "hB", "h", "hb"],
                    GR: ["h", "H", "hb", "hB"],
                    GS: ["H", "h", "hb", "hB"],
                    GT: ["h", "H", "hB", "hb"],
                    GU: ["h", "hb", "H", "hB"],
                    GW: ["H", "hB"],
                    GY: ["h", "hb", "H", "hB"],
                    HK: ["h", "hB", "hb", "H"],
                    HN: ["h", "H", "hB", "hb"],
                    HR: ["H", "hB"],
                    HU: ["H", "h"],
                    IC: ["H", "h", "hB", "hb"],
                    ID: ["H"],
                    IE: ["H", "h", "hb", "hB"],
                    IL: ["H", "hB"],
                    IM: ["H", "h", "hb", "hB"],
                    IN: ["h", "H"],
                    IO: ["H", "h", "hb", "hB"],
                    IQ: ["h", "hB", "hb", "H"],
                    IR: ["hB", "H"],
                    IS: ["H"],
                    IT: ["H", "hB"],
                    JE: ["H", "h", "hb", "hB"],
                    JM: ["h", "hb", "H", "hB"],
                    JO: ["h", "hB", "hb", "H"],
                    JP: ["H", "K", "h"],
                    KE: ["hB", "hb", "H", "h"],
                    KG: ["H", "h", "hB", "hb"],
                    KH: ["hB", "h", "H", "hb"],
                    KI: ["h", "hb", "H", "hB"],
                    KM: ["H", "h", "hB", "hb"],
                    KN: ["h", "hb", "H", "hB"],
                    KP: ["h", "H", "hB", "hb"],
                    KR: ["h", "H", "hB", "hb"],
                    KW: ["h", "hB", "hb", "H"],
                    KY: ["h", "hb", "H", "hB"],
                    KZ: ["H", "hB"],
                    LA: ["H", "hb", "hB", "h"],
                    LB: ["h", "hB", "hb", "H"],
                    LC: ["h", "hb", "H", "hB"],
                    LI: ["H", "hB", "h"],
                    LK: ["H", "h", "hB", "hb"],
                    LR: ["h", "hb", "H", "hB"],
                    LS: ["h", "H"],
                    LT: ["H", "h", "hb", "hB"],
                    LU: ["H", "h", "hB"],
                    LV: ["H", "hB", "hb", "h"],
                    LY: ["h", "hB", "hb", "H"],
                    MA: ["H", "h", "hB", "hb"],
                    MC: ["H", "hB"],
                    MD: ["H", "hB"],
                    ME: ["H", "hB", "h"],
                    MF: ["H", "hB"],
                    MG: ["H", "h"],
                    MH: ["h", "hb", "H", "hB"],
                    MK: ["H", "h", "hb", "hB"],
                    ML: ["H"],
                    MM: ["hB", "hb", "H", "h"],
                    MN: ["H", "h", "hb", "hB"],
                    MO: ["h", "hB", "hb", "H"],
                    MP: ["h", "hb", "H", "hB"],
                    MQ: ["H", "hB"],
                    MR: ["h", "hB", "hb", "H"],
                    MS: ["H", "h", "hb", "hB"],
                    MT: ["H", "h"],
                    MU: ["H", "h"],
                    MV: ["H", "h"],
                    MW: ["h", "hb", "H", "hB"],
                    MX: ["h", "H", "hB", "hb"],
                    MY: ["hb", "hB", "h", "H"],
                    MZ: ["H", "hB"],
                    NA: ["h", "H", "hB", "hb"],
                    NC: ["H", "hB"],
                    NE: ["H"],
                    NF: ["H", "h", "hb", "hB"],
                    NG: ["H", "h", "hb", "hB"],
                    NI: ["h", "H", "hB", "hb"],
                    NL: ["H", "hB"],
                    NO: ["H", "h"],
                    NP: ["H", "h", "hB"],
                    NR: ["H", "h", "hb", "hB"],
                    NU: ["H", "h", "hb", "hB"],
                    NZ: ["h", "hb", "H", "hB"],
                    OM: ["h", "hB", "hb", "H"],
                    PA: ["h", "H", "hB", "hb"],
                    PE: ["h", "H", "hB", "hb"],
                    PF: ["H", "h", "hB"],
                    PG: ["h", "H"],
                    PH: ["h", "hB", "hb", "H"],
                    PK: ["h", "hB", "H"],
                    PL: ["H", "h"],
                    PM: ["H", "hB"],
                    PN: ["H", "h", "hb", "hB"],
                    PR: ["h", "H", "hB", "hb"],
                    PS: ["h", "hB", "hb", "H"],
                    PT: ["H", "hB"],
                    PW: ["h", "H"],
                    PY: ["h", "H", "hB", "hb"],
                    QA: ["h", "hB", "hb", "H"],
                    RE: ["H", "hB"],
                    RO: ["H", "hB"],
                    RS: ["H", "hB", "h"],
                    RU: ["H"],
                    RW: ["H", "h"],
                    SA: ["h", "hB", "hb", "H"],
                    SB: ["h", "hb", "H", "hB"],
                    SC: ["H", "h", "hB"],
                    SD: ["h", "hB", "hb", "H"],
                    SE: ["H"],
                    SG: ["h", "hb", "H", "hB"],
                    SH: ["H", "h", "hb", "hB"],
                    SI: ["H", "hB"],
                    SJ: ["H"],
                    SK: ["H"],
                    SL: ["h", "hb", "H", "hB"],
                    SM: ["H", "h", "hB"],
                    SN: ["H", "h", "hB"],
                    SO: ["h", "H"],
                    SR: ["H", "hB"],
                    SS: ["h", "hb", "H", "hB"],
                    ST: ["H", "hB"],
                    SV: ["h", "H", "hB", "hb"],
                    SX: ["H", "h", "hb", "hB"],
                    SY: ["h", "hB", "hb", "H"],
                    SZ: ["h", "hb", "H", "hB"],
                    TA: ["H", "h", "hb", "hB"],
                    TC: ["h", "hb", "H", "hB"],
                    TD: ["h", "H", "hB"],
                    TF: ["H", "h", "hB"],
                    TG: ["H", "hB"],
                    TH: ["H", "h"],
                    TJ: ["H", "h"],
                    TL: ["H", "hB", "hb", "h"],
                    TM: ["H", "h"],
                    TN: ["h", "hB", "hb", "H"],
                    TO: ["h", "H"],
                    TR: ["H", "hB"],
                    TT: ["h", "hb", "H", "hB"],
                    TW: ["hB", "hb", "h", "H"],
                    TZ: ["hB", "hb", "H", "h"],
                    UA: ["H", "hB", "h"],
                    UG: ["hB", "hb", "H", "h"],
                    UM: ["h", "hb", "H", "hB"],
                    US: ["h", "hb", "H", "hB"],
                    UY: ["h", "H", "hB", "hb"],
                    UZ: ["H", "hB", "h"],
                    VA: ["H", "h", "hB"],
                    VC: ["h", "hb", "H", "hB"],
                    VE: ["h", "H", "hB", "hb"],
                    VG: ["h", "hb", "H", "hB"],
                    VI: ["h", "hb", "H", "hB"],
                    VN: ["H", "h"],
                    VU: ["h", "H"],
                    WF: ["H", "hB"],
                    WS: ["h", "H"],
                    XK: ["H", "hB", "h"],
                    YE: ["h", "hB", "hb", "H"],
                    YT: ["H", "hB"],
                    ZA: ["H", "h", "hb", "hB"],
                    ZM: ["h", "hb", "H", "hB"],
                    ZW: ["H", "h"],
                    "af-ZA": ["H", "h", "hB", "hb"],
                    "ar-001": ["h", "hB", "hb", "H"],
                    "ca-ES": ["H", "h", "hB"],
                    "en-001": ["h", "hb", "H", "hB"],
                    "en-HK": ["h", "hb", "H", "hB"],
                    "en-IL": ["H", "h", "hb", "hB"],
                    "en-MY": ["h", "hb", "H", "hB"],
                    "es-BR": ["H", "h", "hB", "hb"],
                    "es-ES": ["H", "h", "hB", "hb"],
                    "es-GQ": ["H", "h", "hB", "hb"],
                    "fr-CA": ["H", "h", "hB"],
                    "gl-ES": ["H", "h", "hB"],
                    "gu-IN": ["hB", "hb", "h", "H"],
                    "hi-IN": ["hB", "h", "H"],
                    "it-CH": ["H", "h", "hB"],
                    "it-IT": ["H", "h", "hB"],
                    "kn-IN": ["hB", "h", "H"],
                    "ku-SY": ["H", "hB"],
                    "ml-IN": ["hB", "h", "H"],
                    "mr-IN": ["hB", "hb", "h", "H"],
                    "pa-IN": ["hB", "hb", "h", "H"],
                    "ta-IN": ["hB", "h", "hb", "H"],
                    "te-IN": ["hB", "h", "H"],
                    "zu-ZA": ["H", "hB", "hb", "h"]
                },
                es = new RegExp("^".concat(ec.source, "*")),
                ef = new RegExp("".concat(ec.source, "*$"));

            function ep(e, t) {
                return {
                    start: e,
                    end: t
                }
            }
            var eh = !!Object.fromEntries,
                ed = !!String.prototype.trimStart,
                ey = !!String.prototype.trimEnd,
                em = eh ? Object.fromEntries : function(e) {
                    var t = {},
                        r = !0,
                        n = !1,
                        o = void 0;
                    try {
                        for (var i, a = e[Symbol.iterator](); !(r = (i = a.next()).done); r = !0) {
                            var l, c = (l = i.value, function(e) {
                                    if (Array.isArray(e)) return e
                                }(l) || function(e) {
                                    var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                    if (null != n) {
                                        var o = [],
                                            i = !0,
                                            a = !1;
                                        try {
                                            for (n = n.call(e); !(i = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); i = !0);
                                        } catch (e) {
                                            a = !0, r = e
                                        } finally {
                                            try {
                                                i || null == n.return || n.return()
                                            } finally {
                                                if (a) throw r
                                            }
                                        }
                                        return o
                                    }
                                }(l) || eo(l, 2) || function() {
                                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }()),
                                u = c[0],
                                s = c[1];
                            t[u] = s
                        }
                    } catch (e) {
                        n = !0, o = e
                    } finally {
                        try {
                            r || null == a.return || a.return()
                        } finally {
                            if (n) throw o
                        }
                    }
                    return t
                },
                eb = ed ? function(e) {
                    return e.trimStart()
                } : function(e) {
                    return e.replace(es, "")
                },
                eg = ey ? function(e) {
                    return e.trimEnd()
                } : function(e) {
                    return e.replace(ef, "")
                },
                ev = RegExp("([^\\u0009-\\u000D\\u0020\\u0085\\u00A0\\u1680\\u2000-\\u200A\\u2028-\\u2029\\u202F\\u205F\\u3000\\u0021-\\u002F\\u003A-\\u0040\\u005B-\\u005E\\u0060\\u007B-\\u007E\\u00A1-\\u00A7\\u00A9\\u00AB-\\u00AC\\u00AE\\u00B0-\\u00B1\\u00B6\\u00BB\\u00BF\\u00D7\\u00F7\\u2010-\\u2027\\u2030-\\u203E\\u2041-\\u2053\\u2055-\\u205E\\u2190-\\u245F\\u2500-\\u2775\\u2794-\\u2BFF\\u2E00-\\u2E7F\\u3001-\\u3003\\u3008-\\u3020\\u3030\\uFD3E-\\uFD3F\\uFE45-\\uFE46]*)", "yu"),
                eO = function() {
                    var e;

                    function t(e) {
                        var r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                        if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                        this.message = e, this.position = {
                            offset: 0,
                            line: 1,
                            column: 1
                        }, this.ignoreTag = !!r.ignoreTag, this.locale = r.locale, this.requiresOtherClause = !!r.requiresOtherClause, this.shouldParseSkeletons = !!r.shouldParseSkeletons
                    }
                    return e = [{
                            key: "parse",
                            value: function() {
                                if (0 !== this.offset()) throw Error("parser can only be used once");
                                if (this.message.length > 0) {
                                    var e = this.message.charCodeAt(0);
                                    if (35 !== e && 39 !== e && 60 !== e && 123 !== e && 125 !== e) {
                                        var t = function(e) {
                                            if (0 === e.length) return null;
                                            for (var t = 1, r = 1, n = 0; n < e.length;) {
                                                var o = e.charCodeAt(n);
                                                switch (o) {
                                                    case 35:
                                                    case 39:
                                                    case 60:
                                                    case 123:
                                                    case 125:
                                                        return null
                                                }
                                                if (10 === o) t++, r = 1, n++;
                                                else if (r++, o >= 55296 && o <= 56319 && n + 1 < e.length) {
                                                    var i = e.charCodeAt(n + 1);
                                                    n += i >= 56320 && i <= 57343 ? 2 : 1
                                                } else n++
                                            }
                                            return {
                                                offset: e.length,
                                                line: t,
                                                column: r
                                            }
                                        }(this.message);
                                        if (t) {
                                            var r = this.clonePosition();
                                            return this.position = t, {
                                                val: [{
                                                    type: 0,
                                                    value: this.message,
                                                    location: ep(r, this.clonePosition())
                                                }],
                                                err: null
                                            }
                                        }
                                    }
                                }
                                return this.parseMessage(0, "", !1)
                            }
                        }, {
                            key: "parseMessage",
                            value: function(e, t, r) {
                                for (var n = []; !this.isEOF();) {
                                    var o = this.char();
                                    if (123 === o) {
                                        var i = this.parseArgument(e, r);
                                        if (i.err) return i;
                                        n.push(i.val)
                                    } else if (125 === o && e > 0) break;
                                    else if (35 === o && ("plural" === t || "selectordinal" === t)) {
                                        var a = this.clonePosition();
                                        this.bump(), n.push({
                                            type: 7,
                                            location: ep(a, this.clonePosition())
                                        })
                                    } else if (60 !== o || this.ignoreTag || 47 !== this.peek())
                                        if (60 === o && !this.ignoreTag && ew(this.peek() || 0)) {
                                            var l = this.parseTag(e, t);
                                            if (l.err) return l;
                                            n.push(l.val)
                                        } else {
                                            var c = this.parseLiteral(e, t);
                                            if (c.err) return c;
                                            n.push(c.val)
                                        }
                                    else if (!r) return this.error(26, ep(this.clonePosition(), this.clonePosition()));
                                    else break
                                }
                                return {
                                    val: n,
                                    err: null
                                }
                            }
                        }, {
                            key: "parseTag",
                            value: function(e, t) {
                                var r = this.clonePosition();
                                this.bump();
                                var n = this.parseTagName();
                                if (this.bumpSpace(), this.bumpIf("/>")) return {
                                    val: {
                                        type: 0,
                                        value: "<".concat(n, "/>"),
                                        location: ep(r, this.clonePosition())
                                    },
                                    err: null
                                };
                                if (!this.bumpIf(">")) return this.error(23, ep(r, this.clonePosition()));
                                var o = this.parseMessage(e + 1, t, !0);
                                if (o.err) return o;
                                var i = o.val,
                                    a = this.clonePosition();
                                if (!this.bumpIf("</")) return this.error(27, ep(r, this.clonePosition()));
                                if (this.isEOF() || !ew(this.char())) return this.error(23, ep(a, this.clonePosition()));
                                var l = this.clonePosition();
                                return n !== this.parseTagName() ? this.error(26, ep(l, this.clonePosition())) : (this.bumpSpace(), this.bumpIf(">")) ? {
                                    val: {
                                        type: 8,
                                        value: n,
                                        children: i,
                                        location: ep(r, this.clonePosition())
                                    },
                                    err: null
                                } : this.error(23, ep(a, this.clonePosition()))
                            }
                        }, {
                            key: "parseTagName",
                            value: function() {
                                var e, t = this.offset();
                                for (this.bump(); !this.isEOF() && (45 === (e = this.char()) || 46 === e || e >= 48 && e <= 57 || 95 === e || e >= 97 && e <= 122 || e >= 65 && e <= 90 || 183 == e || e >= 192 && e <= 214 || e >= 216 && e <= 246 || e >= 248 && e <= 893 || e >= 895 && e <= 8191 || e >= 8204 && e <= 8205 || e >= 8255 && e <= 8256 || e >= 8304 && e <= 8591 || e >= 11264 && e <= 12271 || e >= 12289 && e <= 55295 || e >= 63744 && e <= 64975 || e >= 65008 && e <= 65533 || e >= 65536 && e <= 983039);) this.bump();
                                return this.message.slice(t, this.offset())
                            }
                        }, {
                            key: "parseLiteral",
                            value: function(e, t) {
                                for (var r = this.clonePosition(), n = "";;) {
                                    var o = this.tryParseQuote(t);
                                    if (o) {
                                        n += o;
                                        continue
                                    }
                                    var i = this.tryParseUnquoted(e, t);
                                    if (i) {
                                        n += i;
                                        continue
                                    }
                                    var a = this.tryParseLeftAngleBracket();
                                    if (a) {
                                        n += a;
                                        continue
                                    }
                                    break
                                }
                                return {
                                    val: {
                                        type: 0,
                                        value: n,
                                        location: ep(r, this.clonePosition())
                                    },
                                    err: null
                                }
                            }
                        }, {
                            key: "tryParseLeftAngleBracket",
                            value: function() {
                                var e;
                                return this.isEOF() || 60 !== this.char() || !this.ignoreTag && (ew(e = this.peek() || 0) || 47 === e) ? null : (this.bump(), "<")
                            }
                        }, {
                            key: "tryParseQuote",
                            value: function(e) {
                                if (this.isEOF() || 39 !== this.char()) return null;
                                switch (this.peek()) {
                                    case 39:
                                        return this.bump(), this.bump(), "'";
                                    case 123:
                                    case 60:
                                    case 62:
                                    case 125:
                                        break;
                                    case 35:
                                        if ("plural" === e || "selectordinal" === e) break;
                                        return null;
                                    default:
                                        return null
                                }
                                this.bump();
                                var t, r = [this.char()];
                                for (this.bump(); !this.isEOF();) {
                                    var n = this.char();
                                    if (39 === n)
                                        if (39 === this.peek()) r.push(39), this.bump();
                                        else {
                                            this.bump();
                                            break
                                        }
                                    else r.push(n);
                                    this.bump()
                                }
                                return (t = String).fromCodePoint.apply(t, function(e) {
                                    if (Array.isArray(e)) return et(e)
                                }(r) || function(e) {
                                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(r) || eo(r) || function() {
                                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }())
                            }
                        }, {
                            key: "tryParseUnquoted",
                            value: function(e, t) {
                                if (this.isEOF()) return null;
                                var r = this.char();
                                return 60 === r || 123 === r || 35 === r && ("plural" === t || "selectordinal" === t) || 125 === r && e > 0 ? null : (this.bump(), String.fromCodePoint(r))
                            }
                        }, {
                            key: "parseArgument",
                            value: function(e, t) {
                                var r = this.clonePosition();
                                if (this.bump(), this.bumpSpace(), this.isEOF()) return this.error(1, ep(r, this.clonePosition()));
                                if (125 === this.char()) return this.bump(), this.error(2, ep(r, this.clonePosition()));
                                var n = this.parseIdentifierIfPossible().value;
                                if (!n) return this.error(3, ep(r, this.clonePosition()));
                                if (this.bumpSpace(), this.isEOF()) return this.error(1, ep(r, this.clonePosition()));
                                switch (this.char()) {
                                    case 125:
                                        return this.bump(), {
                                            val: {
                                                type: 1,
                                                value: n,
                                                location: ep(r, this.clonePosition())
                                            },
                                            err: null
                                        };
                                    case 44:
                                        if (this.bump(), this.bumpSpace(), this.isEOF()) return this.error(1, ep(r, this.clonePosition()));
                                        return this.parseArgumentOptions(e, t, n, r);
                                    default:
                                        return this.error(3, ep(r, this.clonePosition()))
                                }
                            }
                        }, {
                            key: "parseIdentifierIfPossible",
                            value: function() {
                                var e, t, r = this.clonePosition(),
                                    n = this.offset(),
                                    o = (e = this.message, ev.lastIndex = n, null != (t = ev.exec(e)[1]) ? t : ""),
                                    i = n + o.length;
                                return this.bumpTo(i), {
                                    value: o,
                                    location: ep(r, this.clonePosition())
                                }
                            }
                        }, {
                            key: "parseArgumentOptions",
                            value: function(e, t, r, n) {
                                var o = this.clonePosition(),
                                    i = this.parseIdentifierIfPossible().value,
                                    a = this.clonePosition();
                                switch (i) {
                                    case "":
                                        return this.error(4, ep(o, a));
                                    case "number":
                                    case "date":
                                    case "time":
                                        this.bumpSpace();
                                        var l, c = null;
                                        if (this.bumpIf(",")) {
                                            this.bumpSpace();
                                            var u = this.clonePosition(),
                                                s = this.parseSimpleArgStyleIfPossible();
                                            if (s.err) return s;
                                            var f = eg(s.val);
                                            if (0 === f.length) return this.error(6, ep(this.clonePosition(), this.clonePosition()));
                                            c = {
                                                style: f,
                                                styleLocation: ep(u, this.clonePosition())
                                            }
                                        }
                                        var p = this.tryParseArgumentClose(n);
                                        if (p.err) return p;
                                        var h = ep(n, this.clonePosition());
                                        if (c && c.style.startsWith("::")) {
                                            var d = eb(c.style.slice(2));
                                            if ("number" === i) {
                                                var y = this.parseNumberSkeletonFromString(d, c.styleLocation);
                                                if (y.err) return y;
                                                return {
                                                    val: {
                                                        type: 2,
                                                        value: r,
                                                        location: h,
                                                        style: y.val
                                                    },
                                                    err: null
                                                }
                                            }
                                            if (0 === d.length) return this.error(10, h);
                                            var m, b = d;
                                            return this.locale && (b = function(e, t) {
                                                for (var r = "", n = 0; n < e.length; n++) {
                                                    var o = e.charAt(n);
                                                    if ("j" === o) {
                                                        for (var i = 0; n + 1 < e.length && e.charAt(n + 1) === o;) i++, n++;
                                                        var a = 1 + (1 & i),
                                                            l = i < 2 ? 1 : 3 + (i >> 1),
                                                            c = function(e) {
                                                                var t, r = e.hourCycle;
                                                                if (void 0 === r && e.hourCycles && e.hourCycles.length && (r = e.hourCycles[0]), r) switch (r) {
                                                                    case "h24":
                                                                        return "k";
                                                                    case "h23":
                                                                        return "H";
                                                                    case "h12":
                                                                        return "h";
                                                                    case "h11":
                                                                        return "K";
                                                                    default:
                                                                        throw Error("Invalid hourCycle")
                                                                }
                                                                var n = e.language;
                                                                return "root" !== n && (t = e.maximize().region), (eu[t || ""] || eu[n || ""] || eu["".concat(n, "-001")] || eu["001"])[0]
                                                            }(t);
                                                        for (("H" == c || "k" == c) && (l = 0); l-- > 0;) r += "a";
                                                        for (; a-- > 0;) r = c + r
                                                    } else "J" === o ? r += "H" : r += o
                                                }
                                                return r
                                            }(d, this.locale)), {
                                                val: {
                                                    type: "date" === i ? 3 : 4,
                                                    value: r,
                                                    location: h,
                                                    style: {
                                                        type: 1,
                                                        pattern: b,
                                                        location: c.styleLocation,
                                                        parsedOptions: this.shouldParseSkeletons ? (m = {}, b.replace(Q, function(e) {
                                                            var t = e.length;
                                                            switch (e[0]) {
                                                                case "G":
                                                                    m.era = 4 === t ? "long" : 5 === t ? "narrow" : "short";
                                                                    break;
                                                                case "y":
                                                                    m.year = 2 === t ? "2-digit" : "numeric";
                                                                    break;
                                                                case "Y":
                                                                case "u":
                                                                case "U":
                                                                case "r":
                                                                    throw RangeError("`Y/u/U/r` (year) patterns are not supported, use `y` instead");
                                                                case "q":
                                                                case "Q":
                                                                    throw RangeError("`q/Q` (quarter) patterns are not supported");
                                                                case "M":
                                                                case "L":
                                                                    m.month = ["numeric", "2-digit", "short", "long", "narrow"][t - 1];
                                                                    break;
                                                                case "w":
                                                                case "W":
                                                                    throw RangeError("`w/W` (week) patterns are not supported");
                                                                case "d":
                                                                    m.day = ["numeric", "2-digit"][t - 1];
                                                                    break;
                                                                case "D":
                                                                case "F":
                                                                case "g":
                                                                    throw RangeError("`D/F/g` (day) patterns are not supported, use `d` instead");
                                                                case "E":
                                                                    m.weekday = 4 === t ? "long" : 5 === t ? "narrow" : "short";
                                                                    break;
                                                                case "e":
                                                                    if (t < 4) throw RangeError("`e..eee` (weekday) patterns are not supported");
                                                                    m.weekday = ["short", "long", "narrow", "short"][t - 4];
                                                                    break;
                                                                case "c":
                                                                    if (t < 4) throw RangeError("`c..ccc` (weekday) patterns are not supported");
                                                                    m.weekday = ["short", "long", "narrow", "short"][t - 4];
                                                                    break;
                                                                case "a":
                                                                    m.hour12 = !0;
                                                                    break;
                                                                case "b":
                                                                case "B":
                                                                    throw RangeError("`b/B` (period) patterns are not supported, use `a` instead");
                                                                case "h":
                                                                    m.hourCycle = "h12", m.hour = ["numeric", "2-digit"][t - 1];
                                                                    break;
                                                                case "H":
                                                                    m.hourCycle = "h23", m.hour = ["numeric", "2-digit"][t - 1];
                                                                    break;
                                                                case "K":
                                                                    m.hourCycle = "h11", m.hour = ["numeric", "2-digit"][t - 1];
                                                                    break;
                                                                case "k":
                                                                    m.hourCycle = "h24", m.hour = ["numeric", "2-digit"][t - 1];
                                                                    break;
                                                                case "j":
                                                                case "J":
                                                                case "C":
                                                                    throw RangeError("`j/J/C` (hour) patterns are not supported, use `h/H/K/k` instead");
                                                                case "m":
                                                                    m.minute = ["numeric", "2-digit"][t - 1];
                                                                    break;
                                                                case "s":
                                                                    m.second = ["numeric", "2-digit"][t - 1];
                                                                    break;
                                                                case "S":
                                                                case "A":
                                                                    throw RangeError("`S/A` (second) patterns are not supported, use `s` instead");
                                                                case "z":
                                                                    m.timeZoneName = t < 4 ? "short" : "long";
                                                                    break;
                                                                case "Z":
                                                                case "O":
                                                                case "v":
                                                                case "V":
                                                                case "X":
                                                                case "x":
                                                                    throw RangeError("`Z/O/v/V/X/x` (timeZone) patterns are not supported, use `z` instead")
                                                            }
                                                            return ""
                                                        }), m) : {}
                                                    }
                                                },
                                                err: null
                                            }
                                        }
                                        return {
                                            val: {
                                                type: "number" === i ? 2 : "date" === i ? 3 : 4,
                                                value: r,
                                                location: h,
                                                style: null != (l = null == c ? void 0 : c.style) ? l : null
                                            }, err: null
                                        };
                                    case "plural":
                                    case "selectordinal":
                                    case "select":
                                        var g = this.clonePosition();
                                        if (this.bumpSpace(), !this.bumpIf(",")) return this.error(12, ep(g, er({}, g)));
                                        this.bumpSpace();
                                        var v = this.parseIdentifierIfPossible(),
                                            O = 0;
                                        if ("select" !== i && "offset" === v.value) {
                                            if (!this.bumpIf(":")) return this.error(13, ep(this.clonePosition(), this.clonePosition()));
                                            this.bumpSpace();
                                            var w = this.tryParseDecimalInteger(13, 14);
                                            if (w.err) return w;
                                            this.bumpSpace(), v = this.parseIdentifierIfPossible(), O = w.val
                                        }
                                        var E = this.tryParsePluralOrSelectOptions(e, i, t, v);
                                        if (E.err) return E;
                                        var A = this.tryParseArgumentClose(n);
                                        if (A.err) return A;
                                        var S = ep(n, this.clonePosition());
                                        if ("select" === i) return {
                                            val: {
                                                type: 5,
                                                value: r,
                                                options: em(E.val),
                                                location: S
                                            },
                                            err: null
                                        };
                                        return {
                                            val: {
                                                type: 6,
                                                value: r,
                                                options: em(E.val),
                                                offset: O,
                                                pluralType: "plural" === i ? "cardinal" : "ordinal",
                                                location: S
                                            }, err: null
                                        };
                                    default:
                                        return this.error(5, ep(o, a))
                                }
                            }
                        }, {
                            key: "tryParseArgumentClose",
                            value: function(e) {
                                return this.isEOF() || 125 !== this.char() ? this.error(1, ep(e, this.clonePosition())) : (this.bump(), {
                                    val: !0,
                                    err: null
                                })
                            }
                        }, {
                            key: "parseSimpleArgStyleIfPossible",
                            value: function() {
                                for (var e = 0, t = this.clonePosition(); !this.isEOF();) switch (this.char()) {
                                    case 39:
                                        this.bump();
                                        var r = this.clonePosition();
                                        if (!this.bumpUntil("'")) return this.error(11, ep(r, this.clonePosition()));
                                        this.bump();
                                        break;
                                    case 123:
                                        e += 1, this.bump();
                                        break;
                                    case 125:
                                        if (!(e > 0)) return {
                                            val: this.message.slice(t.offset, this.offset()),
                                            err: null
                                        };
                                        e -= 1;
                                        break;
                                    default:
                                        this.bump()
                                }
                                return {
                                    val: this.message.slice(t.offset, this.offset()),
                                    err: null
                                }
                            }
                        }, {
                            key: "parseNumberSkeletonFromString",
                            value: function(e, t) {
                                var r = [];
                                try {
                                    r = function(e) {
                                        if (0 === e.length) throw Error("Number skeleton cannot be empty");
                                        var t = e.split(Y).filter(function(e) {
                                                return e.length > 0
                                            }),
                                            r = [],
                                            n = !0,
                                            o = !1,
                                            i = void 0;
                                        try {
                                            for (var a, l = t[Symbol.iterator](); !(n = (a = l.next()).done); n = !0) {
                                                var c = a.value.split("/");
                                                if (0 === c.length) throw Error("Invalid number skeleton");
                                                var u = function(e) {
                                                        if (Array.isArray(e)) return e
                                                    }(c) || function(e) {
                                                        if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                                    }(c) || function(e) {
                                                        if (e) {
                                                            if ("string" == typeof e) return G(e, void 0);
                                                            var t = Object.prototype.toString.call(e).slice(8, -1);
                                                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return G(e, void 0)
                                                        }
                                                    }(c) || function() {
                                                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                                    }(),
                                                    s = u[0],
                                                    f = u.slice(1),
                                                    p = !0,
                                                    h = !1,
                                                    d = void 0;
                                                try {
                                                    for (var y, m = f[Symbol.iterator](); !(p = (y = m.next()).done); p = !0) {
                                                        var b = y.value;
                                                        if (0 === b.length) throw Error("Invalid number skeleton")
                                                    }
                                                } catch (e) {
                                                    h = !0, d = e
                                                } finally {
                                                    try {
                                                        p || null == m.return || m.return()
                                                    } finally {
                                                        if (h) throw d
                                                    }
                                                }
                                                r.push({
                                                    stem: s,
                                                    options: f
                                                })
                                            }
                                        } catch (e) {
                                            o = !0, i = e
                                        } finally {
                                            try {
                                                n || null == l.return || l.return()
                                            } finally {
                                                if (o) throw i
                                            }
                                        }
                                        return r
                                    }(e)
                                } catch (e) {
                                    return this.error(7, t)
                                }
                                return {
                                    val: {
                                        type: 0,
                                        tokens: r,
                                        location: t,
                                        parsedOptions: this.shouldParseSkeletons ? function(e) {
                                            var t = {},
                                                r = !0,
                                                n = !1,
                                                o = void 0;
                                            try {
                                                for (var i, a = e[Symbol.iterator](); !(r = (i = a.next()).done); r = !0) {
                                                    var l = i.value;
                                                    switch (l.stem) {
                                                        case "percent":
                                                        case "%":
                                                            t.style = "percent";
                                                            continue;
                                                        case "%x100":
                                                            t.style = "percent", t.scale = 100;
                                                            continue;
                                                        case "currency":
                                                            t.style = "currency", t.currency = l.options[0];
                                                            continue;
                                                        case "group-off":
                                                        case ",_":
                                                            t.useGrouping = !1;
                                                            continue;
                                                        case "precision-integer":
                                                        case ".":
                                                            t.maximumFractionDigits = 0;
                                                            continue;
                                                        case "measure-unit":
                                                        case "unit":
                                                            t.style = "unit", t.unit = l.options[0].replace(/^(.*?)-/, "");
                                                            continue;
                                                        case "compact-short":
                                                        case "K":
                                                            t.notation = "compact", t.compactDisplay = "short";
                                                            continue;
                                                        case "compact-long":
                                                        case "KK":
                                                            t.notation = "compact", t.compactDisplay = "long";
                                                            continue;
                                                        case "scientific":
                                                            t = K(z(K({}, t), {
                                                                notation: "scientific"
                                                            }), l.options.reduce(function(e, t) {
                                                                return K({}, e, ee(t))
                                                            }, {}));
                                                            continue;
                                                        case "engineering":
                                                            t = K(z(K({}, t), {
                                                                notation: "engineering"
                                                            }), l.options.reduce(function(e, t) {
                                                                return K({}, e, ee(t))
                                                            }, {}));
                                                            continue;
                                                        case "notation-simple":
                                                            t.notation = "standard";
                                                            continue;
                                                        case "unit-width-narrow":
                                                            t.currencyDisplay = "narrowSymbol", t.unitDisplay = "narrow";
                                                            continue;
                                                        case "unit-width-short":
                                                            t.currencyDisplay = "code", t.unitDisplay = "short";
                                                            continue;
                                                        case "unit-width-full-name":
                                                            t.currencyDisplay = "name", t.unitDisplay = "long";
                                                            continue;
                                                        case "unit-width-iso-code":
                                                            t.currencyDisplay = "symbol";
                                                            continue;
                                                        case "scale":
                                                            t.scale = parseFloat(l.options[0]);
                                                            continue;
                                                        case "rounding-mode-floor":
                                                            t.roundingMode = "floor";
                                                            continue;
                                                        case "rounding-mode-ceiling":
                                                            t.roundingMode = "ceil";
                                                            continue;
                                                        case "rounding-mode-down":
                                                            t.roundingMode = "trunc";
                                                            continue;
                                                        case "rounding-mode-up":
                                                            t.roundingMode = "expand";
                                                            continue;
                                                        case "rounding-mode-half-even":
                                                            t.roundingMode = "halfEven";
                                                            continue;
                                                        case "rounding-mode-half-down":
                                                            t.roundingMode = "halfTrunc";
                                                            continue;
                                                        case "rounding-mode-half-up":
                                                            t.roundingMode = "halfExpand";
                                                            continue;
                                                        case "integer-width":
                                                            if (l.options.length > 1) throw RangeError("integer-width stems only accept a single optional option");
                                                            l.options[0].replace(W, function(e, r, n, o, i, a) {
                                                                if (r) t.minimumIntegerDigits = n.length;
                                                                else if (o && i) throw Error("We currently do not support maximum integer digits");
                                                                else if (a) throw Error("We currently do not support exact integer digits");
                                                                return ""
                                                            });
                                                            continue
                                                    }
                                                    if (q.test(l.stem)) {
                                                        t.minimumIntegerDigits = l.stem.length;
                                                        continue
                                                    }
                                                    if (Z.test(l.stem)) {
                                                        if (l.options.length > 1) throw RangeError("Fraction-precision stems only accept a single optional option");
                                                        l.stem.replace(Z, function(e, r, n, o, i, a) {
                                                            return "*" === n ? t.minimumFractionDigits = r.length : o && "#" === o[0] ? t.maximumFractionDigits = o.length : i && a ? (t.minimumFractionDigits = i.length, t.maximumFractionDigits = i.length + a.length) : (t.minimumFractionDigits = r.length, t.maximumFractionDigits = r.length), ""
                                                        });
                                                        var c = l.options[0];
                                                        "w" === c ? t = z(K({}, t), {
                                                            trailingZeroDisplay: "stripIfInteger"
                                                        }) : c && (t = K({}, t, J(c)));
                                                        continue
                                                    }
                                                    if (X.test(l.stem)) {
                                                        t = K({}, t, J(l.stem));
                                                        continue
                                                    }
                                                    var u = $(l.stem);
                                                    u && (t = K({}, t, u));
                                                    var s = function(e) {
                                                        var t;
                                                        if ("E" === e[0] && "E" === e[1] ? (t = {
                                                                notation: "engineering"
                                                            }, e = e.slice(2)) : "E" === e[0] && (t = {
                                                                notation: "scientific"
                                                            }, e = e.slice(1)), t) {
                                                            var r = e.slice(0, 2);
                                                            if ("+!" === r ? (t.signDisplay = "always", e = e.slice(2)) : "+?" === r && (t.signDisplay = "exceptZero", e = e.slice(2)), !q.test(e)) throw Error("Malformed concise eng/scientific notation");
                                                            t.minimumIntegerDigits = e.length
                                                        }
                                                        return t
                                                    }(l.stem);
                                                    s && (t = K({}, t, s))
                                                }
                                            } catch (e) {
                                                n = !0, o = e
                                            } finally {
                                                try {
                                                    r || null == a.return || a.return()
                                                } finally {
                                                    if (n) throw o
                                                }
                                            }
                                            return t
                                        }(r) : {}
                                    },
                                    err: null
                                }
                            }
                        }, {
                            key: "tryParsePluralOrSelectOptions",
                            value: function(e, t, r, n) {
                                for (var o = !1, i = [], a = new Set, l = n.value, c = n.location;;) {
                                    if (0 === l.length) {
                                        var u, s = this.clonePosition();
                                        if ("select" !== t && this.bumpIf("=")) {
                                            var f = this.tryParseDecimalInteger(16, 19);
                                            if (f.err) return f;
                                            c = ep(s, this.clonePosition()), l = this.message.slice(s.offset, this.offset())
                                        } else break
                                    }
                                    if (a.has(l)) return this.error("select" === t ? 21 : 20, c);
                                    "other" === l && (o = !0), this.bumpSpace();
                                    var p = this.clonePosition();
                                    if (!this.bumpIf("{")) return this.error("select" === t ? 17 : 18, ep(this.clonePosition(), this.clonePosition()));
                                    var h = this.parseMessage(e + 1, t, r);
                                    if (h.err) return h;
                                    var d = this.tryParseArgumentClose(p);
                                    if (d.err) return d;
                                    i.push([l, {
                                        value: h.val,
                                        location: ep(p, this.clonePosition())
                                    }]), a.add(l), this.bumpSpace(), l = (u = this.parseIdentifierIfPossible()).value, c = u.location
                                }
                                return 0 === i.length ? this.error("select" === t ? 15 : 16, ep(this.clonePosition(), this.clonePosition())) : this.requiresOtherClause && !o ? this.error(22, ep(this.clonePosition(), this.clonePosition())) : {
                                    val: i,
                                    err: null
                                }
                            }
                        }, {
                            key: "tryParseDecimalInteger",
                            value: function(e, t) {
                                var r = 1,
                                    n = this.clonePosition();
                                this.bumpIf("+") || this.bumpIf("-") && (r = -1);
                                for (var o = !1, i = 0; !this.isEOF();) {
                                    var a = this.char();
                                    if (a >= 48 && a <= 57) o = !0, i = 10 * i + (a - 48), this.bump();
                                    else break
                                }
                                var l = ep(n, this.clonePosition());
                                return o ? Number.isSafeInteger(i *= r) ? {
                                    val: i,
                                    err: null
                                } : this.error(t, l) : this.error(e, l)
                            }
                        }, {
                            key: "offset",
                            value: function() {
                                return this.position.offset
                            }
                        }, {
                            key: "isEOF",
                            value: function() {
                                return this.offset() === this.message.length
                            }
                        }, {
                            key: "clonePosition",
                            value: function() {
                                return {
                                    offset: this.position.offset,
                                    line: this.position.line,
                                    column: this.position.column
                                }
                            }
                        }, {
                            key: "char",
                            value: function() {
                                var e = this.position.offset;
                                if (e >= this.message.length) throw Error("out of bound");
                                var t = this.message.codePointAt(e);
                                if (void 0 === t) throw Error("Offset ".concat(e, " is at invalid UTF-16 code unit boundary"));
                                return t
                            }
                        }, {
                            key: "error",
                            value: function(e, t) {
                                return {
                                    val: null,
                                    err: {
                                        kind: e,
                                        message: this.message,
                                        location: t
                                    }
                                }
                            }
                        }, {
                            key: "bump",
                            value: function() {
                                if (!this.isEOF()) {
                                    var e = this.char();
                                    10 === e ? (this.position.line += 1, this.position.column = 1, this.position.offset += 1) : (this.position.column += 1, this.position.offset += e < 65536 ? 1 : 2)
                                }
                            }
                        }, {
                            key: "bumpIf",
                            value: function(e) {
                                if (this.message.startsWith(e, this.offset())) {
                                    for (var t = 0; t < e.length; t++) this.bump();
                                    return !0
                                }
                                return !1
                            }
                        }, {
                            key: "bumpUntil",
                            value: function(e) {
                                var t = this.offset(),
                                    r = this.message.indexOf(e, t);
                                return r >= 0 ? (this.bumpTo(r), !0) : (this.bumpTo(this.message.length), !1)
                            }
                        }, {
                            key: "bumpTo",
                            value: function(e) {
                                if (this.offset() > e) throw Error("targetOffset ".concat(e, " must be greater than or equal to the current offset ").concat(this.offset()));
                                for (e = Math.min(e, this.message.length);;) {
                                    var t = this.offset();
                                    if (t === e) break;
                                    if (t > e) throw Error("targetOffset ".concat(e, " is at invalid UTF-16 code unit boundary"));
                                    if (this.bump(), this.isEOF()) break
                                }
                            }
                        }, {
                            key: "bumpSpace",
                            value: function() {
                                for (var e; !this.isEOF() && ((e = this.char()) >= 9 && e <= 13 || 32 === e || 133 === e || e >= 8206 && e <= 8207 || 8232 === e || 8233 === e);) this.bump()
                            }
                        }, {
                            key: "peek",
                            value: function() {
                                if (this.isEOF()) return null;
                                var e, t = this.char(),
                                    r = this.offset();
                                return null != (e = this.message.charCodeAt(r + (t >= 65536 ? 2 : 1))) ? e : null
                            }
                        }],
                        function(e, t) {
                            for (var r = 0; r < t.length; r++) {
                                var n = t[r];
                                n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                            }
                        }(t.prototype, e), t
                }();

            function ew(e) {
                return e >= 97 && e <= 122 || e >= 65 && e <= 90
            }

            function eE(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function eA(e, t, r) {
                return t = eI(t),
                    function(e, t) {
                        if (t && ("object" === eL(t) || "function" == typeof t)) return t;
                        if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                        return e
                    }(e, eM() ? Reflect.construct(t, r || [], eI(e).constructor) : t.apply(e, r))
            }

            function eS(e, t) {
                if (!(e instanceof t)) throw TypeError("Cannot call a class as a function")
            }

            function ej(e, t, r) {
                return (ej = eM() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && ek(o, r.prototype), o
                }).apply(null, arguments)
            }

            function ex(e, t) {
                for (var r = 0; r < t.length; r++) {
                    var n = t[r];
                    n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                }
            }

            function eP(e, t, r) {
                return t && ex(e.prototype, t), r && ex(e, r), e
            }

            function eC() {
                return (eC = Object.assign || function(e) {
                    for (var t = 1; t < arguments.length; t++) {
                        var r = arguments[t];
                        for (var n in r) Object.prototype.hasOwnProperty.call(r, n) && (e[n] = r[n])
                    }
                    return e
                }).apply(this, arguments)
            }

            function eI(e) {
                return (eI = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function eN(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Super expression must either be null or a function");
                e.prototype = Object.create(t && t.prototype, {
                    constructor: {
                        value: e,
                        writable: !0,
                        configurable: !0
                    }
                }), t && ek(e, t)
            }

            function eT(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }

            function ek(e, t) {
                return (ek = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function eB(e) {
                return function(e) {
                    if (Array.isArray(e)) return eE(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return eE(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return eE(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function eL(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function eR(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (eR = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return ej(e, arguments, eI(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), ek(r, e)
                })(e)
            }

            function eM() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (eM = function() {
                    return !!e
                })()
            }
            var eD = function(e) {
                    function t(e, r, n) {
                        var o;
                        return eS(this, t), (o = eA(this, t, [e])).code = r, o.originalMessage = n, o
                    }
                    return eN(t, e), eP(t, [{
                        key: "toString",
                        value: function() {
                            return "[formatjs Error: ".concat(this.code, "] ").concat(this.message)
                        }
                    }]), t
                }(eR(Error)),
                eH = function(e) {
                    function t(e, r, n, o) {
                        return eS(this, t), eA(this, t, ['Invalid values for "'.concat(e, '": "').concat(r, '". Options are "').concat(Object.keys(n).join('", "'), '"'), "INVALID_VALUE", o])
                    }
                    return eN(t, e), t
                }(eD),
                eU = function(e) {
                    function t(e, r, n) {
                        return eS(this, t), eA(this, t, ['Value for "'.concat(e, '" must be of type ').concat(r), "INVALID_VALUE", n])
                    }
                    return eN(t, e), t
                }(eD),
                eV = function(e) {
                    function t(e, r) {
                        return eS(this, t), eA(this, t, ['The intl string context variable "'.concat(e, '" was not provided to the string "').concat(r, '"'), "MISSING_VALUE", r])
                    }
                    return eN(t, e), t
                }(eD);

            function eF(e) {
                return {
                    create: function() {
                        return {
                            get: function(t) {
                                return e[t]
                            },
                            set: function(t, r) {
                                e[t] = r
                            }
                        }
                    }
                }
            }
            var e_ = ((y = function() {
                function e(t) {
                    var r, n = this,
                        o = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : e.defaultLocale,
                        i = arguments.length > 2 ? arguments[2] : void 0,
                        a = arguments.length > 3 ? arguments[3] : void 0;
                    if (eS(this, e), this.formatterCache = {
                            number: {},
                            dateTime: {},
                            pluralRules: {}
                        }, this.format = function(e) {
                            var t = n.formatToParts(e);
                            if (1 === t.length) return t[0].value;
                            var r = t.reduce(function(e, t) {
                                return e.length && 0 === t.type && "string" == typeof e[e.length - 1] ? e[e.length - 1] += t.value : e.push(t.value), e
                            }, []);
                            return r.length <= 1 ? r[0] || "" : r
                        }, this.formatToParts = function(e) {
                            return function e(t, r, n, o, i, a, l) {
                                if (1 === t.length && 0 === t[0].type) return [{
                                    type: 0,
                                    value: t[0].value
                                }];
                                var c = [],
                                    u = !0,
                                    s = !1,
                                    f = void 0;
                                try {
                                    for (var p, h = t[Symbol.iterator](); !(u = (p = h.next()).done); u = !0) {
                                        var d = p.value;
                                        if (0 === d.type) {
                                            c.push({
                                                type: 0,
                                                value: d.value
                                            });
                                            continue
                                        }
                                        if (7 === d.type) {
                                            "number" == typeof a && c.push({
                                                type: 0,
                                                value: n.getNumberFormat(r).format(a)
                                            });
                                            continue
                                        }
                                        var y = d.value;
                                        if (!(i && y in i)) throw new eV(y, l);
                                        var m = i[y];
                                        if (1 === d.type) {
                                            m && "string" != typeof m && "number" != typeof m && (void 0 === m ? "undefined" : eL(m)) !== "bigint" || (m = "string" == typeof m || "number" == typeof m || (void 0 === m ? "undefined" : eL(m)) === "bigint" ? String(m) : ""), c.push({
                                                type: +("string" != typeof m),
                                                value: m
                                            });
                                            continue
                                        }
                                        if (3 === d.type) {
                                            var b = "string" == typeof d.style ? o.date[d.style] : el(d.style) ? d.style.parsedOptions : void 0;
                                            c.push({
                                                type: 0,
                                                value: n.getDateTimeFormat(r, b).format(m)
                                            });
                                            continue
                                        }
                                        if (4 === d.type) {
                                            var g = "string" == typeof d.style ? o.time[d.style] : el(d.style) ? d.style.parsedOptions : o.time.medium;
                                            c.push({
                                                type: 0,
                                                value: n.getDateTimeFormat(r, g).format(m)
                                            });
                                            continue
                                        }
                                        if (2 === d.type) {
                                            var v = "string" == typeof d.style ? o.number[d.style] : ea(d.style) ? d.style.parsedOptions : void 0;
                                            if (v && v.scale) {
                                                var O = v.scale || 1;
                                                if ((void 0 === m ? "undefined" : eL(m)) === "bigint") {
                                                    if (!Number.isInteger(O)) throw TypeError("Cannot apply fractional scale ".concat(O, " to bigint value. Scale must be an integer when formatting bigint."));
                                                    m *= BigInt(O)
                                                } else m *= O
                                            }
                                            c.push({
                                                type: 0,
                                                value: n.getNumberFormat(r, v).format(m)
                                            });
                                            continue
                                        }
                                        if (8 === d.type) {
                                            var w = d.children,
                                                E = d.value,
                                                A = i[E];
                                            if ("function" != typeof A) throw new eU(E, "function", l);
                                            var S = A(e(w, r, n, o, i, a).map(function(e) {
                                                return e.value
                                            }));
                                            Array.isArray(S) || (S = [S]), c.push.apply(c, eB(S.map(function(e) {
                                                return {
                                                    type: +("string" != typeof e),
                                                    value: e
                                                }
                                            })))
                                        }
                                        if (5 === d.type) {
                                            var j = m,
                                                x = (Object.prototype.hasOwnProperty.call(d.options, j) ? d.options[j] : void 0) || d.options.other;
                                            if (!x) throw new eH(d.value, m, Object.keys(d.options), l);
                                            c.push.apply(c, eB(e(x.value, r, n, o, i)));
                                            continue
                                        }
                                        if (6 === d.type) {
                                            var P = "=".concat(m),
                                                C = Object.prototype.hasOwnProperty.call(d.options, P) ? d.options[P] : void 0;
                                            if (!C) {
                                                if (!Intl.PluralRules) throw new eD('Intl.PluralRules is not available in this environment.\nTry polyfilling it using "@formatjs/intl-pluralrules"\n', "MISSING_INTL_API", l);
                                                var I = (void 0 === m ? "undefined" : eL(m)) === "bigint" ? Number(m) : m,
                                                    N = n.getPluralRules(r, {
                                                        type: d.pluralType
                                                    }).select(I - (d.offset || 0));
                                                C = (Object.prototype.hasOwnProperty.call(d.options, N) ? d.options[N] : void 0) || d.options.other
                                            }
                                            if (!C) throw new eH(d.value, m, Object.keys(d.options), l);
                                            var T = (void 0 === m ? "undefined" : eL(m)) === "bigint" ? Number(m) : m;
                                            c.push.apply(c, eB(e(C.value, r, n, o, i, T - (d.offset || 0))));
                                            continue
                                        }
                                    }
                                } catch (e) {
                                    s = !0, f = e
                                } finally {
                                    try {
                                        u || null == h.return || h.return()
                                    } finally {
                                        if (s) throw f
                                    }
                                }
                                return c.length < 2 ? c : c.reduce(function(e, t) {
                                    var r = e[e.length - 1];
                                    return r && 0 === r.type && 0 === t.type ? r.value += t.value : e.push(t), e
                                }, [])
                            }(n.ast, n.locales, n.formatters, n.formats, e, void 0, n.message)
                        }, this.resolvedOptions = function() {
                            var e;
                            return {
                                locale: (null == (e = n.resolvedLocale) ? void 0 : e.toString()) || Intl.NumberFormat.supportedLocalesOf(n.locales)[0]
                            }
                        }, this.getAst = function() {
                            return n.ast
                        }, this.locales = o, this.resolvedLocale = e.resolveLocale(o), "string" == typeof t) {
                        if (this.message = t, !e.__parse) throw TypeError("IntlMessageFormat.__parse must be set to process `message` of type `string`");
                        var l, c, u = a || {},
                            s = (function(e) {
                                if (null == e) throw TypeError("Cannot destructure " + e)
                            }(u), eC({}, u));
                        this.ast = e.__parse(t, (l = eT({}, s), c = c = {
                            locale: this.resolvedLocale
                        }, Object.getOwnPropertyDescriptors ? Object.defineProperties(l, Object.getOwnPropertyDescriptors(c)) : (function(e) {
                            var t = Object.keys(e);
                            if (Object.getOwnPropertySymbols) {
                                var r = Object.getOwnPropertySymbols(e);
                                t.push.apply(t, r)
                            }
                            return t
                        })(Object(c)).forEach(function(e) {
                            Object.defineProperty(l, e, Object.getOwnPropertyDescriptor(c, e))
                        }), l))
                    } else this.ast = t;
                    if (!Array.isArray(this.ast)) throw TypeError("A message must be provided as a String or AST.");
                    this.formats = (r = e.formats, i ? Object.keys(r).reduce(function(e, t) {
                        var n, o;
                        return e[t] = (n = r[t], (o = i[t]) ? eT({}, n, o, Object.keys(n).reduce(function(e, t) {
                            return e[t] = eT({}, n[t], o[t]), e
                        }, {})) : n), e
                    }, eT({}, r)) : r), this.formatters = a && a.formatters || function() {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {
                            number: {},
                            dateTime: {},
                            pluralRules: {}
                        };
                        return {
                            getNumberFormat: x(function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                return ej(Intl.NumberFormat, eB(t))
                            }, {
                                cache: eF(e.number),
                                strategy: k.variadic
                            }),
                            getDateTimeFormat: x(function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                return ej(Intl.DateTimeFormat, eB(t))
                            }, {
                                cache: eF(e.dateTime),
                                strategy: k.variadic
                            }),
                            getPluralRules: x(function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                return ej(Intl.PluralRules, eB(t))
                            }, {
                                cache: eF(e.pluralRules),
                                strategy: k.variadic
                            })
                        }
                    }(this.formatterCache)
                }
                return eP(e, null, [{
                    key: "defaultLocale",
                    get: function() {
                        return e.memoizedDefaultLocale || (e.memoizedDefaultLocale = new Intl.NumberFormat().resolvedOptions().locale), e.memoizedDefaultLocale
                    }
                }]), e
            }()).memoizedDefaultLocale = null, y.resolveLocale = function(e) {
                if (void 0 !== Intl.Locale) {
                    var t = Intl.NumberFormat.supportedLocalesOf(e);
                    return new Intl.Locale(t.length > 0 ? t[0] : "string" == typeof e ? e : e[0])
                }
            }, y.__parse = function(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    r = new eO(e, t = er({
                        shouldParseSkeletons: !0,
                        requiresOtherClause: !0
                    }, t)).parse();
                if (r.err) {
                    var n = SyntaxError(ei[r.err.kind]);
                    throw n.location = r.err.location, n.originalMessage = r.err.message, n
                }
                return (null == t ? void 0 : t.captureLocation) || function e(t) {
                    t.forEach(function(t) {
                        if (delete t.location, 5 === t.type || 6 === t.type)
                            for (var r in t.options) delete t.options[r].location, e(t.options[r].value);
                        else 2 === t.type && ea(t.style) || (3 === t.type || 4 === t.type) && el(t.style) ? delete t.style.location : 8 === t.type && e(t.children)
                    })
                }(r.val), r.val
            }, y.formats = {
                number: {
                    integer: {
                        maximumFractionDigits: 0
                    },
                    currency: {
                        style: "currency"
                    },
                    percent: {
                        style: "percent"
                    }
                },
                date: {
                    short: {
                        month: "numeric",
                        day: "numeric",
                        year: "2-digit"
                    },
                    medium: {
                        month: "short",
                        day: "numeric",
                        year: "numeric"
                    },
                    long: {
                        month: "long",
                        day: "numeric",
                        year: "numeric"
                    },
                    full: {
                        weekday: "long",
                        month: "long",
                        day: "numeric",
                        year: "numeric"
                    }
                },
                time: {
                    short: {
                        hour: "numeric",
                        minute: "numeric"
                    },
                    medium: {
                        hour: "numeric",
                        minute: "numeric",
                        second: "numeric"
                    },
                    long: {
                        hour: "numeric",
                        minute: "numeric",
                        second: "numeric",
                        timeZoneName: "short"
                    },
                    full: {
                        hour: "numeric",
                        minute: "numeric",
                        second: "numeric",
                        timeZoneName: "short"
                    }
                }
            }, y);

            function eG(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function eK(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }

            function ez(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function eQ(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return eG(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return eG(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function eY() {
                for (var e, t, r, n, o, i = arguments.length, a = Array(i), l = 0; l < i; l++) a[l] = arguments[l];
                var c = eQ(a, 4),
                    u = (c[0], c[1]),
                    s = c[2],
                    f = c[3];
                if (Array.isArray(u)) throw new U(V.INVALID_MESSAGE, void 0);
                if ("object" == (void 0 === u ? "undefined" : u && "u" > typeof Symbol && u.constructor === Symbol ? "symbol" : typeof u)) throw new U(V.INSUFFICIENT_PATH, void 0);
                if ("string" == typeof u) {
                    var p = s || /'[{}<#|']/.test(u) ? void 0 : u;
                    if (p) return p
                }
                var h = f.cache,
                    d = f.formats,
                    y = f.formatters,
                    m = f.globalFormats,
                    b = f.locale,
                    g = f.timeZone;
                y.getMessageFormat || (y.getMessageFormat = F(function() {
                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    return new e_(t[0], t[1], t[2], eK({
                        formatters: y
                    }, t[3]))
                }, h.message));
                try {
                    o = y.getMessageFormat(u, b, (e = e_.formats.date, t = e_.formats.time, r = eK({}, null == m ? void 0 : m.dateTime, null == d ? void 0 : d.dateTime), n = {
                        date: eK({}, e, r),
                        time: eK({}, t, r),
                        number: eK({}, null == m ? void 0 : m.number, null == d ? void 0 : d.number)
                    }, g && ["date", "time"].forEach(function(e) {
                        var t = n[e],
                            r = !0,
                            o = !1,
                            i = void 0;
                        try {
                            for (var a, l = Object.entries(t)[Symbol.iterator](); !(r = (a = l.next()).done); r = !0) {
                                var c = eQ(a.value, 2),
                                    u = c[0],
                                    s = c[1];
                                t[u] = eK({
                                    timeZone: g
                                }, s)
                            }
                        } catch (e) {
                            o = !0, i = e
                        } finally {
                            try {
                                r || null == l.return || l.return()
                            } finally {
                                if (o) throw i
                            }
                        }
                    }), n), {
                        formatters: ez(eK({}, y), {
                            getDateTimeFormat: function(e, t) {
                                var r;
                                return y.getDateTimeFormat(e, ez(eK({}, t), {
                                    timeZone: null != (r = null == t ? void 0 : t.timeZone) ? r : g
                                }))
                            }
                        })
                    })
                } catch (e) {
                    throw new U(V.INVALID_MESSAGE, void 0)
                }
                var v = o.format(s);
                return (0, S.isValidElement)(v) || Array.isArray(v) || "string" == typeof v ? v : String(v)
            }

            function eZ(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function eX(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }

            function eW(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function eq() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return t.filter(Boolean).join(".")
            }

            function eJ(e) {
                return eq(e.namespace, e.key)
            }

            function e$(e) {
                console.error(e)
            }

            function e0(e, t, r, n) {
                var o = eq(n, r);
                if (!t) throw Error(o);
                var i = t;
                return r.split(".").forEach(function(t) {
                    var r = i[t];
                    if (null == t || null == r) throw Error(o + " (".concat(e, ")"));
                    i = r
                }), i
            }
            eY.raw = !0;
            var e1 = (0, S.createContext)(void 0);

            function e2(e) {
                var t = e.children,
                    r = e.formats,
                    n = e.getMessageFallback,
                    o = e.locale,
                    i = e.messages,
                    a = e.now,
                    l = e.onError,
                    c = e.timeZone,
                    u = (0, S.useContext)(e1),
                    s = (0, S.useMemo)(function() {
                        return (null == u ? void 0 : u.cache) || {
                            dateTime: {},
                            number: {},
                            message: {},
                            relativeTime: {},
                            pluralRules: {},
                            list: {},
                            displayNames: {}
                        }
                    }, [o, null == u ? void 0 : u.cache]),
                    f = (0, S.useMemo)(function() {
                        return (null == u ? void 0 : u.formatters) || {
                            getDateTimeFormat: _(Intl.DateTimeFormat, s.dateTime),
                            getNumberFormat: _(Intl.NumberFormat, s.number),
                            getPluralRules: _(Intl.PluralRules, s.pluralRules),
                            getRelativeTimeFormat: _(Intl.RelativeTimeFormat, s.relativeTime),
                            getListFormat: _(Intl.ListFormat, s.list),
                            getDisplayNames: _(Intl.DisplayNames, s.displayNames)
                        }
                    }, [s, null == u ? void 0 : u.formatters]),
                    p = (0, S.useMemo)(function() {
                        var e, t, p, h, d, y, m;
                        return y = function(e) {
                            for (var t = 1; t < arguments.length; t++) {
                                var r = null != arguments[t] ? arguments[t] : {},
                                    n = Object.keys(r);
                                "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                    return Object.getOwnPropertyDescriptor(r, e).enumerable
                                }))), n.forEach(function(t) {
                                    var n;
                                    n = r[t], t in e ? Object.defineProperty(e, t, {
                                        value: n,
                                        enumerable: !0,
                                        configurable: !0,
                                        writable: !0
                                    }) : e[t] = n
                                })
                            }
                            return e
                        }({}, (t = (e = {
                            locale: o,
                            formats: void 0 === r ? null == u ? void 0 : u.formats : r,
                            getMessageFallback: n || (null == u ? void 0 : u.getMessageFallback),
                            messages: void 0 === i ? null == u ? void 0 : u.messages : i,
                            now: a || (null == u ? void 0 : u.now),
                            onError: l || (null == u ? void 0 : u.onError),
                            timeZone: c || (null == u ? void 0 : u.timeZone)
                        }).formats, p = e.getMessageFallback, h = e.messages, d = e.onError, eW(eX({}, function(e, t) {
                            if (null == e) return {};
                            var r, n, o, i = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                                return i
                            }
                            if (i = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        i = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                            return i
                        }(e, ["formats", "getMessageFallback", "messages", "onError"])), {
                            formats: t || void 0,
                            messages: h || void 0,
                            onError: d || e$,
                            getMessageFallback: p || eJ
                        }))), m = m = {
                            formatters: f,
                            cache: s
                        }, Object.getOwnPropertyDescriptors ? Object.defineProperties(y, Object.getOwnPropertyDescriptors(m)) : (function(e) {
                            var t = Object.keys(e);
                            if (Object.getOwnPropertySymbols) {
                                var r = Object.getOwnPropertySymbols(e);
                                t.push.apply(t, r)
                            }
                            return t
                        })(Object(m)).forEach(function(e) {
                            Object.defineProperty(y, e, Object.getOwnPropertyDescriptor(m, e))
                        }), y
                    }, [s, r, f, n, o, i, a, l, u, c]);
                return (0, O.jsx)(e1.Provider, {
                    value: p,
                    children: t
                })
            }

            function e3() {
                var e = (0, S.useContext)(e1);
                if (!e) throw Error(void 0);
                return e
            }
            var e8 = !1,
                e5 = "u" < typeof window,
                e6 = window.Roblox["core-lib"].index;

            function e4(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function e7(e) {
                return function(e) {
                    if (Array.isArray(e)) return e4(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return e4(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return e4(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            e7(["ar-001", "de-de", "en-us", "es-es", "fr-fr", "hi-in", "id-id", "it-it", "ja-jp", "ko-kr", "pl-pl", "pt-br", "th-th", "tr-tr", "vi-vn", "zh-cn", "zh-tw"]).concat(e7(["bg-bg", "bn-bd", "bs-ba", "cs-cz", "da-dk", "el-gr", "en-gb", "es-mx", "et-ee", "fi-fi", "fil-ph", "fr-ca", "hr-hr", "hu-hu", "ka-ge", "kk-kz", "km-kh", "lt-lt", "lv-lv", "ms-my", "my-mm", "nb-no", "nl-nl", "pt-pt", "ro-ro", "ru-ru", "si-lk", "sk-sk", "sl-sl", "sq-al", "sr-rs", "sv-se", "uk-ua"]));
            var e9 = e7(["ar_001", "de_de", "en_us", "es_es", "fr_fr", "hi_in", "id_id", "it_it", "ja_jp", "ko_kr", "pl_pl", "pt_br", "th_th", "tr_tr", "vi_vn", "zh_cn", "zh_tw"]).concat(e7(["bg_bg", "bn_bd", "bs_ba", "cs_cz", "da_dk", "el_gr", "en_gb", "es_mx", "et_ee", "fi_fi", "fil_ph", "fr_ca", "hr_hr", "hu_hu", "ka_ge", "kk_kz", "km_kh", "lt_lt", "lv_lv", "ms_my", "my_mm", "nb_no", "nl_nl", "pt_pt", "ro_ro", "ru_ru", "si_lk", "sk_sk", "sl_sl", "sq_al", "sr_rs", "sv_se", "uk_ua"])),
                te = e7(["ar-001", "de-DE", "en-US", "es-ES", "fr-FR", "hi-IN", "id-ID", "it-IT", "ja-JP", "ko-KR", "pl-PL", "pt-BR", "th-TH", "tr-TR", "vi-VN", "zh-CN", "zh-TW"]).concat(e7(["bg-BG", "bn-BD", "bs-BA", "cs-CZ", "da-DK", "el-GR", "en-GB", "es-MX", "et-EE", "fi-FI", "fil-PH", "fr-CA", "hr-HR", "hu-HU", "ka-GE", "kk-KZ", "km-KH", "lt-LT", "lv-LV", "ms-MY", "my-MM", "nb-NO", "nl-NL", "pt-PT", "ro-RO", "ru-RU", "si-LK", "sk-SK", "sl-SL", "sq-AL", "sr-RS", "sv-SE", "uk-UA"]));
            e7(["ar", "de", "es", "fr", "hi", "id", "it", "ja", "ko", "pl", "pt", "th", "tr", "vi"]).concat(e7(["ar-001", "de-de", "es-es", "fr-fr", "hi-in", "id-id", "it-it", "ja-jp", "ko-kr", "pl-pl", "pt-br", "th-th", "tr-tr", "vi-vn"]));
            var tt = function(e) {
                return e.replaceAll(".", ":")
            };

            function tr(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var tn = function() {
                    if ("u" < typeof window) return {};
                    var e = window.Roblox;
                    return null != e ? e : {}
                },
                to = function(e) {
                    return Object.fromEntries(Object.entries(null != e ? e : {}).flatMap(function(e) {
                        var t = function(e) {
                                if (Array.isArray(e)) return e
                            }(e) || function(e) {
                                var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                if (null != n) {
                                    var o = [],
                                        i = !0,
                                        a = !1;
                                    try {
                                        for (n = n.call(e); !(i = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); i = !0);
                                    } catch (e) {
                                        a = !0, r = e
                                    } finally {
                                        try {
                                            i || null == n.return || n.return()
                                        } finally {
                                            if (a) throw r
                                        }
                                    }
                                    return o
                                }
                            }(e) || function(e) {
                                if (e) {
                                    if ("string" == typeof e) return tr(e, 2);
                                    var t = Object.prototype.toString.call(e).slice(8, -1);
                                    if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                    if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tr(e, 2)
                                }
                            }(e) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }(),
                            r = t[0],
                            n = t[1];
                        return null == n ? [] : [
                            [tt(r), n]
                        ]
                    }))
                },
                ti = function(e) {
                    var t = tn(),
                        r = t.Lang,
                        n = t.LangDynamic,
                        o = t.LangDynamicDefault;
                    return Object.fromEntries(e.map(function(e) {
                        return [tt(e), function(e) {
                            for (var t = 1; t < arguments.length; t++) {
                                var r = null != arguments[t] ? arguments[t] : {},
                                    n = Object.keys(r);
                                "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                    return Object.getOwnPropertyDescriptor(r, e).enumerable
                                }))), n.forEach(function(t) {
                                    var n;
                                    n = r[t], t in e ? Object.defineProperty(e, t, {
                                        value: n,
                                        enumerable: !0,
                                        configurable: !0,
                                        writable: !0
                                    }) : e[t] = n
                                })
                            }
                            return e
                        }({}, to(null == o ? void 0 : o[e]), to(null == r ? void 0 : r[e]), to(null == n ? void 0 : n[e]))]
                    }))
                },
                ta = function(e) {
                    var t, r, n = e.namespaces,
                        o = e.locale,
                        i = e.children,
                        a = n.join(","),
                        l = (0, S.useMemo)(function() {
                            return ti(n)
                        }, [a]);
                    return (0, O.jsx)(e2, {
                        locale: null != o ? o : null != (t = null != (r = function() {
                            if (!("u" < typeof document)) {
                                var e = document.documentElement.lang;
                                if (e) return (0, e6.arrayIncludes)(te, e) ? e.toLowerCase() : void 0
                            }
                        }()) ? r : function() {
                            if ("u" < typeof document) return;
                            var e, t = document.querySelector('meta[name="locale-data"]');
                            if (null != (e = HTMLMetaElement) && "u" > typeof Symbol && e[Symbol.hasInstance] ? e[Symbol.hasInstance](t) : t instanceof e) {
                                var r = t.dataset.languageCode;
                                if (r && (0, e6.arrayIncludes)(e9, r)) return r.replace("_", "-")
                            }
                        }()) ? t : "en-us",
                        messages: l,
                        children: i
                    })
                },
                tl = window.Roblox,
                tc = r.n(tl),
                tu = function() {
                    for (var e, t, r = 0, n = "", o = arguments.length; r < o; r++)(e = arguments[r]) && (t = function e(t) {
                        var r, n, o = "";
                        if ("string" == typeof t || "number" == typeof t) o += t;
                        else if ("object" == (void 0 === t ? "undefined" : t && "u" > typeof Symbol && t.constructor === Symbol ? "symbol" : typeof t))
                            if (Array.isArray(t)) {
                                var i = t.length;
                                for (r = 0; r < i; r++) t[r] && (n = e(t[r])) && (o && (o += " "), o += n)
                            } else
                                for (n in t) t[n] && (o && (o += " "), o += n);
                        return o
                    }(e)) && (n && (n += " "), n += t);
                    return n
                },
                ts = "relative clip group/interactable focus-visible:outline-focus disabled:outline-none",
                tf = function(e) {
                    var t = e.className;
                    return j().createElement("div", {
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-state-layer",
                        className: tu("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", t)
                    })
                };

            function tp(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function th(e) {
                if (Array.isArray(e)) return e
            }

            function td() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function ty(e, t) {
                if (e) {
                    if ("string" == typeof e) return tp(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tp(e, t)
                }
            }
            var tm = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                tb = j().forwardRef(function(e, t) {
                    var r, n = th(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || ty(r) || td(),
                        o = n[0],
                        i = n.slice(1),
                        a = o.name,
                        l = o.size,
                        c = o.className,
                        u = (o.children, function(e, t) {
                            if (null == e) return {};
                            var r, n, o, i = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                                return i
                            }
                            if (i = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        i = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                            return i
                        }(o, ["name", "size", "className", "children"])),
                        s = (th(i) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    i = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(i = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); i = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        i || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return o
                            }
                        }(i) || ty(i, 1) || td())[0];
                    return j().createElement("span", function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var r = null != arguments[t] ? arguments[t] : {},
                                n = Object.keys(r);
                            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(r, e).enumerable
                            }))), n.forEach(function(t) {
                                var n;
                                n = r[t], t in e ? Object.defineProperty(e, t, {
                                    value: n,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : e[t] = n
                            })
                        }
                        return e
                    }({
                        ref: s,
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-icon",
                        className: tu("grow-0 shrink-0 basis-auto icon", a, tm[void 0 === l ? "Medium" : l], c)
                    }, u))
                });
            tb.displayName = "Icon";
            var tg = {
                    Small: "padding-xsmall",
                    Medium: "padding-small",
                    Large: "padding-small"
                },
                tv = {
                    Utility: "bg-action-link",
                    OverMedia: "bg-over-media-100"
                },
                tO = function(e) {
                    var t = e.variant,
                        r = e.size,
                        n = e.isCircular,
                        o = e.className,
                        i = function(e, t) {
                            if (null == e) return {};
                            var r, n, o, i = {};
                            if ("u" > typeof Reflect && Reflect.ownKeys) {
                                for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                                return i
                            }
                            if (i = function(e, t) {
                                    if (null == e) return {};
                                    var r, n, o = {},
                                        i = Object.getOwnPropertyNames(e);
                                    for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                    return o
                                }(e, t), Object.getOwnPropertySymbols)
                                for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                            return i
                        }(e, ["variant", "size", "isCircular", "className"]);
                    return j().createElement("button", function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var r = null != arguments[t] ? arguments[t] : {},
                                n = Object.keys(r);
                            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(r, e).enumerable
                            }))), n.forEach(function(t) {
                                var n;
                                n = r[t], t in e ? Object.defineProperty(e, t, {
                                    value: n,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : e[t] = n
                            })
                        }
                        return e
                    }({
                        type: "button",
                        className: tu("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", ts, tv[t], tg[r], n && "radius-circle", o)
                    }, i), j().createElement(tf, null), j().createElement(tb, {
                        name: "icon-regular-x",
                        size: r
                    }))
                };

            function tw(e, t) {
                var r = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {},
                    n = r.checkForDefaultPrevented,
                    o = void 0 === n || n;
                return function(r) {
                    if (null == e || e(r), !1 === o || !r.defaultPrevented) return null == t ? void 0 : t(r)
                }
            }

            function tE(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tA(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function tS() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return function(e) {
                    var r = !1,
                        n = t.map(function(t) {
                            var n = tA(t, e);
                            return r || "function" != typeof n || (r = !0), n
                        });
                    if (r) return function() {
                        for (var e = 0; e < n.length; e++) {
                            var r = n[e];
                            "function" == typeof r ? r() : tA(t[e], null)
                        }
                    }
                }
            }

            function tj() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return S.useCallback(tS.apply(void 0, function(e) {
                    if (Array.isArray(e)) return tE(e)
                }(t) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(t) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return tE(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tE(e, void 0)
                    }
                }(t) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()), t)
            }

            function tx(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tP(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function tC(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        tP(e, t, r[t])
                    })
                }
                return e
            }

            function tI(e, t) {
                if (null == e) return {};
                var r, n, o, i = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                    return i
                }
                if (i = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            i = Object.getOwnPropertyNames(e);
                        for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                return i
            }

            function tN(e) {
                return function(e) {
                    if (Array.isArray(e)) return tx(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return tx(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tx(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tT() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                var n = t[0];
                if (1 === t.length) return n;
                var o = function() {
                    var e = t.map(function(e) {
                        return {
                            useScope: e(),
                            scopeName: e.scopeName
                        }
                    });
                    return function(t) {
                        var r = e.reduce(function(e, r) {
                            var n = r.useScope,
                                o = r.scopeName;
                            return tC({}, e, n(t)["__scope".concat(o)])
                        }, {});
                        return S.useMemo(function() {
                            return tP({}, "__scope".concat(n.scopeName), r)
                        }, [r])
                    }
                };
                return o.scopeName = n.scopeName, o
            }
            var tk = (null == (m = globalThis) ? void 0 : m.document) ? S.useLayoutEffect : function() {};

            function tB(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var tL = S[" useId ".trim().toString()] || function() {},
                tR = 0;

            function tM(e) {
                var t, r = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = S.useState(tL())) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var o = [],
                                i = !0,
                                a = !1;
                            try {
                                for (n = n.call(e); !(i = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); i = !0);
                            } catch (e) {
                                a = !0, r = e
                            } finally {
                                try {
                                    i || null == n.return || n.return()
                                } finally {
                                    if (a) throw r
                                }
                            }
                            return o
                        }
                    }(t) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return tB(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tB(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    n = r[0],
                    o = r[1];
                return tk(function() {
                    e || o(function(e) {
                        return null != e ? e : String(tR++)
                    })
                }, [e]), e || (n ? "radix-".concat(n) : "")
            }

            function tD(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tH(e) {
                var t = S.useRef(e);
                return S.useEffect(function() {
                    t.current = e
                }), S.useMemo(function() {
                    return function() {
                        for (var e, r = arguments.length, n = Array(r), o = 0; o < r; o++) n[o] = arguments[o];
                        return null == (e = t.current) ? void 0 : e.call.apply(e, [t].concat(function(e) {
                            if (Array.isArray(e)) return tD(e)
                        }(n) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(n) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return tD(e, void 0);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tD(e, void 0)
                            }
                        }(n) || function() {
                            throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }()))
                    }
                }, [])
            }

            function tU(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tV(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return tU(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tU(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var tF = window.RadixUI["react-dismissable-layer"],
                t_ = window.RadixUI["react-focus-scope"],
                tG = window.ReactDOM,
                tK = r.n(tG);

            function tz(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tQ(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }

            function tY(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function tZ(e, t) {
                if (null == e) return {};
                var r, n, o, i = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                    return i
                }
                if (i = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            i = Object.getOwnPropertyNames(e);
                        for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                return i
            }

            function tX(e) {
                return function(e) {
                    if (Array.isArray(e)) return tz(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return tz(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tz(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function tW(e) {
                var t, r, n = (t = e, (r = S.forwardRef(function(e, t) {
                        var r = e.children,
                            n = tZ(e, ["children"]);
                        if (S.isValidElement(r)) {
                            var o, i, a, l, c, u = (c = (l = null == (i = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (c = (l = null == (a = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                                s = function(e, t) {
                                    var r = tQ({}, t);
                                    for (var n in t) ! function(n) {
                                        var o = e[n],
                                            i = t[n];
                                        /^on[A-Z]/.test(n) ? o && i ? r[n] = function() {
                                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                            i.apply(void 0, tX(t)), o.apply(void 0, tX(t))
                                        } : o && (r[n] = o) : "style" === n ? r[n] = tQ({}, o, i) : "className" === n && (r[n] = [o, i].filter(Boolean).join(" "))
                                    }(n);
                                    return tQ({}, e, r)
                                }(n, r.props);
                            return r.type !== S.Fragment && (s.ref = t ? tS(t, u) : u), S.cloneElement(r, s)
                        }
                        return S.Children.count(r) > 1 ? S.Children.only(null) : null
                    })).displayName = "".concat(t, ".SlotClone"), r),
                    o = S.forwardRef(function(e, t) {
                        var r = e.children,
                            o = tZ(e, ["children"]),
                            i = S.Children.toArray(r),
                            a = i.find(tJ);
                        if (a) {
                            var l = a.props.children,
                                c = i.map(function(e) {
                                    return e !== a ? e : S.Children.count(l) > 1 ? S.Children.only(null) : S.isValidElement(l) ? l.props.children : null
                                });
                            return (0, O.jsx)(n, tY(tQ({}, o), {
                                ref: t,
                                children: S.isValidElement(l) ? S.cloneElement(l, void 0, c) : null
                            }))
                        }
                        return (0, O.jsx)(n, tY(tQ({}, o), {
                            ref: t,
                            children: r
                        }))
                    });
                return o.displayName = "".concat(e, ".Slot"), o
            }
            var tq = Symbol("radix.slottable");

            function tJ(e) {
                return S.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === tq
            }

            function t$(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function t0(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        t$(e, t, r[t])
                    })
                }
                return e
            }

            function t1(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }
            var t2 = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce(function(e, t) {
                var r = tW("Primitive.".concat(t)),
                    n = S.forwardRef(function(e, n) {
                        var o = e.asChild,
                            i = function(e, t) {
                                if (null == e) return {};
                                var r, n, o, i = {};
                                if ("u" > typeof Reflect && Reflect.ownKeys) {
                                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                                    return i
                                }
                                if (i = function(e, t) {
                                        if (null == e) return {};
                                        var r, n, o = {},
                                            i = Object.getOwnPropertyNames(e);
                                        for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                        return o
                                    }(e, t), Object.getOwnPropertySymbols)
                                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                                return i
                            }(e, ["asChild"]),
                            a = o ? r : t;
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, O.jsx)(a, t1(t0({}, i), {
                            ref: n
                        }))
                    });
                return n.displayName = "Primitive.".concat(t), t1(t0({}, e), t$({}, t, n))
            }, {});

            function t3(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var t8 = S.forwardRef(function(e, t) {
                var r, n, o, i, a, l = e.container,
                    c = function(e, t) {
                        if (null == e) return {};
                        var r, n, o, i = {};
                        if ("u" > typeof Reflect && Reflect.ownKeys) {
                            for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                            return i
                        }
                        if (i = function(e, t) {
                                if (null == e) return {};
                                var r, n, o = {},
                                    i = Object.getOwnPropertyNames(e);
                                for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                return o
                            }(e, t), Object.getOwnPropertySymbols)
                            for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                        return i
                    }(e, ["container"]),
                    u = function(e) {
                        if (Array.isArray(e)) return e
                    }(r = S.useState(!1)) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var o = [],
                                i = !0,
                                a = !1;
                            try {
                                for (n = n.call(e); !(i = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); i = !0);
                            } catch (e) {
                                a = !0, r = e
                            } finally {
                                try {
                                    i || null == n.return || n.return()
                                } finally {
                                    if (a) throw r
                                }
                            }
                            return o
                        }
                    }(r) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return t3(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return t3(e, 2)
                        }
                    }(r) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    s = u[0],
                    f = u[1];
                tk(function() {
                    return f(!0)
                }, []);
                var p = l || s && (null == (a = globalThis) || null == (i = a.document) ? void 0 : i.body);
                return p ? tK().createPortal((0, O.jsx)(t2.div, (n = function(e) {
                    for (var t = 1; t < arguments.length; t++) {
                        var r = null != arguments[t] ? arguments[t] : {},
                            n = Object.keys(r);
                        "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                            return Object.getOwnPropertyDescriptor(r, e).enumerable
                        }))), n.forEach(function(t) {
                            var n;
                            n = r[t], t in e ? Object.defineProperty(e, t, {
                                value: n,
                                enumerable: !0,
                                configurable: !0,
                                writable: !0
                            }) : e[t] = n
                        })
                    }
                    return e
                }({}, c), o = o = {
                    ref: t
                }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(o)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(o)).forEach(function(e) {
                    Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(o, e))
                }), n)), p) : null
            });

            function t5(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function t6(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return t5(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return t5(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            t8.displayName = "Portal";
            var t4 = function(e) {
                var t, r, n, o, i, a, l, c, u, s, f, p, h, d, y, m, b, g = e.present,
                    v = e.children,
                    O = (t = g, i = (o = t6(S.useState(), 2))[0], a = o[1], l = S.useRef({}), c = S.useRef(t), u = S.useRef("none"), f = (s = t6((r = t ? "mounted" : "unmounted", n = {
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
                    }, S.useReducer(function(e, t) {
                        var r = n[e][t];
                        return null != r ? r : e
                    }, r)), 2))[0], p = s[1], S.useEffect(function() {
                        var e = t7(l.current);
                        u.current = "mounted" === f ? e : "none"
                    }, [f]), tk(function() {
                        var e = l.current,
                            r = c.current;
                        if (r !== t) {
                            var n = u.current,
                                o = t7(e);
                            t ? p("MOUNT") : "none" === o || (null == e ? void 0 : e.display) === "none" ? p("UNMOUNT") : r && n !== o ? p("ANIMATION_OUT") : p("UNMOUNT"), c.current = t
                        }
                    }, [t, p]), tk(function() {
                        if (i) {
                            var e, t, r = null != (e = i.ownerDocument.defaultView) ? e : window,
                                n = function(e) {
                                    var n = t7(l.current).includes(e.animationName);
                                    if (e.target === i && n && (p("ANIMATION_END"), !c.current)) {
                                        var o = i.style.animationFillMode;
                                        i.style.animationFillMode = "forwards", t = r.setTimeout(function() {
                                            "forwards" === i.style.animationFillMode && (i.style.animationFillMode = o)
                                        })
                                    }
                                },
                                o = function(e) {
                                    e.target === i && (u.current = t7(l.current))
                                };
                            return i.addEventListener("animationstart", o), i.addEventListener("animationcancel", n), i.addEventListener("animationend", n),
                                function() {
                                    r.clearTimeout(t), i.removeEventListener("animationstart", o), i.removeEventListener("animationcancel", n), i.removeEventListener("animationend", n)
                                }
                        }
                        p("ANIMATION_END")
                    }, [i, p]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(f),
                        ref: S.useCallback(function(e) {
                            e && (l.current = getComputedStyle(e)), a(e)
                        }, [])
                    }),
                    w = "function" == typeof v ? v({
                        present: O.isPresent
                    }) : S.Children.only(v),
                    E = tj(O.ref, (b = (m = null == (d = Object.getOwnPropertyDescriptor((h = w).props, "ref")) ? void 0 : d.get) && "isReactWarning" in m && m.isReactWarning) ? h.ref : (b = (m = null == (y = Object.getOwnPropertyDescriptor(h, "ref")) ? void 0 : y.get) && "isReactWarning" in m && m.isReactWarning) ? h.props.ref : h.props.ref || h.ref);
                return "function" == typeof v || O.isPresent ? S.cloneElement(w, {
                    ref: E
                }) : null
            };

            function t7(e) {
                return (null == e ? void 0 : e.animationName) || "none"
            }
            t4.displayName = "Presence";
            var t9 = window.RadixUI["react-focus-guards"],
                re = function() {
                    return (re = Object.assign || function(e) {
                        for (var t, r = 1, n = arguments.length; r < n; r++)
                            for (var o in t = arguments[r]) Object.prototype.hasOwnProperty.call(t, o) && (e[o] = t[o]);
                        return e
                    }).apply(this, arguments)
                };

            function rt(e, t) {
                var r = {};
                for (var n in e) Object.prototype.hasOwnProperty.call(e, n) && 0 > t.indexOf(n) && (r[n] = e[n]);
                if (null != e && "function" == typeof Object.getOwnPropertySymbols)
                    for (var o = 0, n = Object.getOwnPropertySymbols(e); o < n.length; o++) 0 > t.indexOf(n[o]) && Object.prototype.propertyIsEnumerable.call(e, n[o]) && (r[n[o]] = e[n[o]]);
                return r
            }
            var rr = "right-scroll-bar-position",
                rn = "width-before-scroll-bar";

            function ro(e, t) {
                return "function" == typeof e ? e(t) : e && (e.current = t), e
            }
            var ri = "u" > typeof window ? S.useLayoutEffect : S.useEffect,
                ra = new WeakMap,
                rl = (void 0 === o && (o = {}), (void 0 === i && (i = function(e) {
                    return e
                }), a = [], l = !1, c = {
                    read: function() {
                        if (l) throw Error("Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`.");
                        return a.length ? a[a.length - 1] : null
                    },
                    useMedium: function(e) {
                        var t = i(e, l);
                        return a.push(t),
                            function() {
                                a = a.filter(function(e) {
                                    return e !== t
                                })
                            }
                    },
                    assignSyncMedium: function(e) {
                        for (l = !0; a.length;) {
                            var t = a;
                            a = [], t.forEach(e)
                        }
                        a = {
                            push: function(t) {
                                return e(t)
                            },
                            filter: function() {
                                return a
                            }
                        }
                    },
                    assignMedium: function(e) {
                        l = !0;
                        var t = [];
                        if (a.length) {
                            var r = a;
                            a = [], r.forEach(e), t = a
                        }
                        var n = function() {
                                var r = t;
                                t = [], r.forEach(e)
                            },
                            o = function() {
                                return Promise.resolve().then(n)
                            };
                        o(), a = {
                            push: function(e) {
                                t.push(e), o()
                            },
                            filter: function(e) {
                                return t = t.filter(e), a
                            }
                        }
                    }
                }).options = re({
                    async: !0,
                    ssr: !1
                }, o), c),
                rc = function() {},
                ru = S.forwardRef(function(e, t) {
                    var r, n, o, i, a = S.useRef(null),
                        l = S.useState({
                            onScrollCapture: rc,
                            onWheelCapture: rc,
                            onTouchMoveCapture: rc
                        }),
                        c = l[0],
                        u = l[1],
                        s = e.forwardProps,
                        f = e.children,
                        p = e.className,
                        h = e.removeScrollBar,
                        d = e.enabled,
                        y = e.shards,
                        m = e.sideCar,
                        b = e.noRelative,
                        g = e.noIsolation,
                        v = e.inert,
                        O = e.allowPinchZoom,
                        w = e.as,
                        E = e.gapMode,
                        A = rt(e, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noRelative", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                        j = (r = [a, t], n = function(e) {
                            return r.forEach(function(t) {
                                return ro(t, e)
                            })
                        }, (o = (0, S.useState)(function() {
                            return {
                                value: null,
                                callback: n,
                                facade: {
                                    get current() {
                                        return o.value
                                    },
                                    set current(value) {
                                        var e = o.value;
                                        e !== value && (o.value = value, o.callback(value, e))
                                    }
                                }
                            }
                        })[0]).callback = n, i = o.facade, ri(function() {
                            var e = ra.get(i);
                            if (e) {
                                var t = new Set(e),
                                    n = new Set(r),
                                    o = i.current;
                                t.forEach(function(e) {
                                    n.has(e) || ro(e, null)
                                }), n.forEach(function(e) {
                                    t.has(e) || ro(e, o)
                                })
                            }
                            ra.set(i, r)
                        }, [r]), i),
                        x = re(re({}, A), c);
                    return S.createElement(S.Fragment, null, d && S.createElement(m, {
                        sideCar: rl,
                        removeScrollBar: h,
                        shards: y,
                        noRelative: b,
                        noIsolation: g,
                        inert: v,
                        setCallbacks: u,
                        allowPinchZoom: !!O,
                        lockRef: a,
                        gapMode: E
                    }), s ? S.cloneElement(S.Children.only(f), re(re({}, x), {
                        ref: j
                    })) : S.createElement(void 0 === w ? "div" : w, re({}, x, {
                        className: p,
                        ref: j
                    }), f))
                });
            ru.defaultProps = {
                enabled: !0,
                removeScrollBar: !0,
                inert: !1
            }, ru.classNames = {
                fullWidth: rn,
                zeroRight: rr
            };
            var rs = function(e) {
                var t = e.sideCar,
                    r = rt(e, ["sideCar"]);
                if (!t) throw Error("Sidecar: please provide `sideCar` property to import the right car");
                var n = t.read();
                if (!n) throw Error("Sidecar medium not found");
                return S.createElement(n, re({}, r))
            };
            rs.isSideCarExport = !0;
            var rf = function() {
                    var e = 0,
                        t = null;
                    return {
                        add: function(n) {
                            if (0 == e && (t = function() {
                                    if (!document) return null;
                                    var e = document.createElement("style");
                                    e.type = "text/css";
                                    var t = b || r.nc;
                                    return t && e.setAttribute("nonce", t), e
                                }())) {
                                var o, i;
                                (o = t).styleSheet ? o.styleSheet.cssText = n : o.appendChild(document.createTextNode(n)), i = t, (document.head || document.getElementsByTagName("head")[0]).appendChild(i)
                            }
                            e++
                        },
                        remove: function() {
                            --e || !t || (t.parentNode && t.parentNode.removeChild(t), t = null)
                        }
                    }
                },
                rp = function() {
                    var e = rf();
                    return function(t, r) {
                        S.useEffect(function() {
                            return e.add(t),
                                function() {
                                    e.remove()
                                }
                        }, [t && r])
                    }
                },
                rh = function() {
                    var e = rp();
                    return function(t) {
                        return e(t.styles, t.dynamic), null
                    }
                },
                rd = {
                    left: 0,
                    top: 0,
                    right: 0,
                    gap: 0
                },
                ry = function(e) {
                    return parseInt(e || "", 10) || 0
                },
                rm = function(e) {
                    var t = window.getComputedStyle(document.body),
                        r = t["padding" === e ? "paddingLeft" : "marginLeft"],
                        n = t["padding" === e ? "paddingTop" : "marginTop"],
                        o = t["padding" === e ? "paddingRight" : "marginRight"];
                    return [ry(r), ry(n), ry(o)]
                },
                rb = function(e) {
                    if (void 0 === e && (e = "margin"), "u" < typeof window) return rd;
                    var t = rm(e),
                        r = document.documentElement.clientWidth,
                        n = window.innerWidth;
                    return {
                        left: t[0],
                        top: t[1],
                        right: t[2],
                        gap: Math.max(0, n - r + t[2] - t[0])
                    }
                },
                rg = rh(),
                rv = "data-scroll-locked",
                rO = function(e, t, r, n) {
                    var o = e.left,
                        i = e.top,
                        a = e.right,
                        l = e.gap;
                    return void 0 === r && (r = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(n, ";\n   padding-right: ").concat(l, "px ").concat(n, ";\n  }\n  body[").concat(rv, "] {\n    overflow: hidden ").concat(n, ";\n    overscroll-behavior: contain;\n    ").concat([t && "position: relative ".concat(n, ";"), "margin" === r && "\n    padding-left: ".concat(o, "px;\n    padding-top: ").concat(i, "px;\n    padding-right: ").concat(a, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(l, "px ").concat(n, ";\n    "), "padding" === r && "padding-right: ".concat(l, "px ").concat(n, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(rr, " {\n    right: ").concat(l, "px ").concat(n, ";\n  }\n  \n  .").concat(rn, " {\n    margin-right: ").concat(l, "px ").concat(n, ";\n  }\n  \n  .").concat(rr, " .").concat(rr, " {\n    right: 0 ").concat(n, ";\n  }\n  \n  .").concat(rn, " .").concat(rn, " {\n    margin-right: 0 ").concat(n, ";\n  }\n  \n  body[").concat(rv, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(l, "px;\n  }\n")
                },
                rw = function() {
                    var e = parseInt(document.body.getAttribute(rv) || "0", 10);
                    return isFinite(e) ? e : 0
                },
                rE = function() {
                    S.useEffect(function() {
                        return document.body.setAttribute(rv, (rw() + 1).toString()),
                            function() {
                                var e = rw() - 1;
                                e <= 0 ? document.body.removeAttribute(rv) : document.body.setAttribute(rv, e.toString())
                            }
                    }, [])
                },
                rA = function(e) {
                    var t = e.noRelative,
                        r = e.noImportant,
                        n = e.gapMode,
                        o = void 0 === n ? "margin" : n;
                    rE();
                    var i = S.useMemo(function() {
                        return rb(o)
                    }, [o]);
                    return S.createElement(rg, {
                        styles: rO(i, !t, o, r ? "" : "!important")
                    })
                },
                rS = !1;
            if ("u" > typeof window) try {
                var rj = Object.defineProperty({}, "passive", {
                    get: function() {
                        return rS = !0, !0
                    }
                });
                window.addEventListener("test", rj, rj), window.removeEventListener("test", rj, rj)
            } catch (e) {
                rS = !1
            }
            var rx = !!rS && {
                passive: !1
            };

            function rP(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }
            var rC = function(e, t) {
                    if (!rP(e, Element)) return !1;
                    var r = window.getComputedStyle(e);
                    return "hidden" !== r[t] && (r.overflowY !== r.overflowX || "TEXTAREA" === e.tagName || "visible" !== r[t])
                },
                rI = function(e, t) {
                    var r = t.ownerDocument,
                        n = t;
                    do {
                        if ("u" > typeof ShadowRoot && rP(n, ShadowRoot) && (n = n.host), rN(e, n)) {
                            var o = rT(e, n);
                            if (o[1] > o[2]) return !0
                        }
                        n = n.parentNode
                    } while (n && n !== r.body);
                    return !1
                },
                rN = function(e, t) {
                    return "v" === e ? rC(t, "overflowY") : rC(t, "overflowX")
                },
                rT = function(e, t) {
                    return "v" === e ? [t.scrollTop, t.scrollHeight, t.clientHeight] : [t.scrollLeft, t.scrollWidth, t.clientWidth]
                },
                rk = function(e, t, r, n, o) {
                    var i, a = (i = window.getComputedStyle(t).direction, "h" === e && "rtl" === i ? -1 : 1),
                        l = a * n,
                        c = r.target,
                        u = t.contains(c),
                        s = !1,
                        f = l > 0,
                        p = 0,
                        h = 0;
                    do {
                        if (!c) break;
                        var d = rT(e, c),
                            y = d[0],
                            m = d[1] - d[2] - a * y;
                        (y || m) && rN(e, c) && (p += m, h += y);
                        var b = c.parentNode;
                        c = b && b.nodeType === Node.DOCUMENT_FRAGMENT_NODE ? b.host : b
                    } while (!u && c !== document.body || u && (t.contains(c) || t === c));
                    return f && (o && 1 > Math.abs(p) || !o && l > p) ? s = !0 : !f && (o && 1 > Math.abs(h) || !o && -l > h) && (s = !0), s
                },
                rB = function(e) {
                    return "changedTouches" in e ? [e.changedTouches[0].clientX, e.changedTouches[0].clientY] : [0, 0]
                },
                rL = function(e) {
                    return [e.deltaX, e.deltaY]
                },
                rR = function(e) {
                    return e && "current" in e ? e.current : e
                },
                rM = 0,
                rD = [],
                rH = (u = function(e) {
                    var t = S.useRef([]),
                        r = S.useRef([0, 0]),
                        n = S.useRef(),
                        o = S.useState(rM++)[0],
                        i = S.useState(rh)[0],
                        a = S.useRef(e);
                    S.useEffect(function() {
                        a.current = e
                    }, [e]), S.useEffect(function() {
                        if (e.inert) {
                            document.body.classList.add("block-interactivity-".concat(o));
                            var t = (function(e, t, r) {
                                if (r || 2 == arguments.length)
                                    for (var n, o = 0, i = t.length; o < i; o++) !n && o in t || (n || (n = Array.prototype.slice.call(t, 0, o)), n[o] = t[o]);
                                return e.concat(n || Array.prototype.slice.call(t))
                            })([e.lockRef.current], (e.shards || []).map(rR), !0).filter(Boolean);
                            return t.forEach(function(e) {
                                    return e.classList.add("allow-interactivity-".concat(o))
                                }),
                                function() {
                                    document.body.classList.remove("block-interactivity-".concat(o)), t.forEach(function(e) {
                                        return e.classList.remove("allow-interactivity-".concat(o))
                                    })
                                }
                        }
                    }, [e.inert, e.lockRef.current, e.shards]);
                    var l = S.useCallback(function(e, t) {
                            if ("touches" in e && 2 === e.touches.length || "wheel" === e.type && e.ctrlKey) return !a.current.allowPinchZoom;
                            var o, i = rB(e),
                                l = r.current,
                                c = "deltaX" in e ? e.deltaX : l[0] - i[0],
                                u = "deltaY" in e ? e.deltaY : l[1] - i[1],
                                s = e.target,
                                f = Math.abs(c) > Math.abs(u) ? "h" : "v";
                            if ("touches" in e && "h" === f && "range" === s.type) return !1;
                            var p = rI(f, s);
                            if (!p) return !0;
                            if (p ? o = f : (o = "v" === f ? "h" : "v", p = rI(f, s)), !p) return !1;
                            if (!n.current && "changedTouches" in e && (c || u) && (n.current = o), !o) return !0;
                            var h = n.current || o;
                            return rk(h, t, e, "h" === h ? c : u, !0)
                        }, []),
                        c = S.useCallback(function(e) {
                            if (rD.length && rD[rD.length - 1] === i) {
                                var r = "deltaY" in e ? rL(e) : rB(e),
                                    n = t.current.filter(function(t) {
                                        var n;
                                        return t.name === e.type && (t.target === e.target || e.target === t.shadowParent) && (n = t.delta, n[0] === r[0] && n[1] === r[1])
                                    })[0];
                                if (n && n.should) {
                                    e.cancelable && e.preventDefault();
                                    return
                                }
                                if (!n) {
                                    var o = (a.current.shards || []).map(rR).filter(Boolean).filter(function(t) {
                                        return t.contains(e.target)
                                    });
                                    (o.length > 0 ? l(e, o[0]) : !a.current.noIsolation) && e.cancelable && e.preventDefault()
                                }
                            }
                        }, []),
                        u = S.useCallback(function(e, r, n, o) {
                            var i = {
                                name: e,
                                delta: r,
                                target: n,
                                should: o,
                                shadowParent: function(e) {
                                    for (var t, r, n = null; null !== e;) t = e, (null != (r = ShadowRoot) && "u" > typeof Symbol && r[Symbol.hasInstance] ? !!r[Symbol.hasInstance](t) : t instanceof r) && (n = e.host, e = e.host), e = e.parentNode;
                                    return n
                                }(n)
                            };
                            t.current.push(i), setTimeout(function() {
                                t.current = t.current.filter(function(e) {
                                    return e !== i
                                })
                            }, 1)
                        }, []),
                        s = S.useCallback(function(e) {
                            r.current = rB(e), n.current = void 0
                        }, []),
                        f = S.useCallback(function(t) {
                            u(t.type, rL(t), t.target, l(t, e.lockRef.current))
                        }, []),
                        p = S.useCallback(function(t) {
                            u(t.type, rB(t), t.target, l(t, e.lockRef.current))
                        }, []);
                    S.useEffect(function() {
                        return rD.push(i), e.setCallbacks({
                                onScrollCapture: f,
                                onWheelCapture: f,
                                onTouchMoveCapture: p
                            }), document.addEventListener("wheel", c, rx), document.addEventListener("touchmove", c, rx), document.addEventListener("touchstart", s, rx),
                            function() {
                                rD = rD.filter(function(e) {
                                    return e !== i
                                }), document.removeEventListener("wheel", c, rx), document.removeEventListener("touchmove", c, rx), document.removeEventListener("touchstart", s, rx)
                            }
                    }, []);
                    var h = e.removeScrollBar,
                        d = e.inert;
                    return S.createElement(S.Fragment, null, d ? S.createElement(i, {
                        styles: "\n  .block-interactivity-".concat(o, " {pointer-events: none;}\n  .allow-interactivity-").concat(o, " {pointer-events: all;}\n")
                    }) : null, h ? S.createElement(rA, {
                        noRelative: e.noRelative,
                        gapMode: e.gapMode
                    }) : null)
                }, rl.useMedium(u), rs),
                rU = S.forwardRef(function(e, t) {
                    return S.createElement(ru, re({}, e, {
                        ref: t,
                        sideCar: rH
                    }))
                });
            rU.classNames = ru.classNames;
            var rV = new WeakMap,
                rF = new WeakMap,
                r_ = {},
                rG = 0,
                rK = function(e) {
                    return e && (e.host || rK(e.parentNode))
                },
                rz = function(e, t, r, n) {
                    var o = (Array.isArray(e) ? e : [e]).map(function(e) {
                        if (t.contains(e)) return e;
                        var r = rK(e);
                        return r && t.contains(r) ? r : (console.error("aria-hidden", e, "in not contained inside", t, ". Doing nothing"), null)
                    }).filter(function(e) {
                        return !!e
                    });
                    r_[r] || (r_[r] = new WeakMap);
                    var i = r_[r],
                        a = [],
                        l = new Set,
                        c = new Set(o),
                        u = function(e) {
                            !e || l.has(e) || (l.add(e), u(e.parentNode))
                        };
                    o.forEach(u);
                    var s = function(e) {
                        !e || c.has(e) || Array.prototype.forEach.call(e.children, function(e) {
                            if (l.has(e)) s(e);
                            else try {
                                var t = e.getAttribute(n),
                                    o = null !== t && "false" !== t,
                                    c = (rV.get(e) || 0) + 1,
                                    u = (i.get(e) || 0) + 1;
                                rV.set(e, c), i.set(e, u), a.push(e), 1 === c && o && rF.set(e, !0), 1 === u && e.setAttribute(r, "true"), o || e.setAttribute(n, "true")
                            } catch (t) {
                                console.error("aria-hidden: cannot operate on ", e, t)
                            }
                        })
                    };
                    return s(t), l.clear(), rG++,
                        function() {
                            a.forEach(function(e) {
                                var t = rV.get(e) - 1,
                                    o = i.get(e) - 1;
                                rV.set(e, t), i.set(e, o), t || (rF.has(e) || e.removeAttribute(n), rF.delete(e)), o || e.removeAttribute(r)
                            }), --rG || (rV = new WeakMap, rV = new WeakMap, rF = new WeakMap, r_ = {})
                        }
                },
                rQ = function(e, t, r) {
                    void 0 === r && (r = "data-aria-hidden");
                    var n = Array.from(Array.isArray(e) ? e : [e]),
                        o = t || ("u" < typeof document ? null : (Array.isArray(e) ? e[0] : e).ownerDocument.body);
                    return o ? (n.push.apply(n, Array.from(o.querySelectorAll("[aria-live], script"))), rz(n, o, r, "aria-hidden")) : function() {
                        return null
                    }
                };

            function rY(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rZ(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }

            function rX(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function rW(e, t) {
                if (null == e) return {};
                var r, n, o, i = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                    return i
                }
                if (i = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            i = Object.getOwnPropertyNames(e);
                        for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                return i
            }

            function rq(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return rY(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rY(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var rJ = "Dialog",
                r$ = rq(function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : [],
                        r = [],
                        n = function() {
                            var t = r.map(function(e) {
                                return S.createContext(e)
                            });
                            return function(r) {
                                var n = (null == r ? void 0 : r[e]) || t;
                                return S.useMemo(function() {
                                    var t, o;
                                    return tP({}, "__scope".concat(e), (t = tC({}, r), o = null != (o = tP({}, e, n)) ? o : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(t, Object.getOwnPropertyDescriptors(o)) : (function(e) {
                                        var t = Object.keys(e);
                                        if (Object.getOwnPropertySymbols) {
                                            var r = Object.getOwnPropertySymbols(e);
                                            t.push.apply(t, r)
                                        }
                                        return t
                                    })(Object(o)).forEach(function(e) {
                                        Object.defineProperty(t, e, Object.getOwnPropertyDescriptor(o, e))
                                    }), t))
                                }, [r, n])
                            }
                        };
                    return n.scopeName = e, [function(t, n) {
                        var o = S.createContext(n),
                            i = r.length;
                        r = tN(r).concat([n]);
                        var a = function(t) {
                            var r, n = t.scope,
                                a = t.children,
                                l = tI(t, ["scope", "children"]),
                                c = (null == n || null == (r = n[e]) ? void 0 : r[i]) || o,
                                u = S.useMemo(function() {
                                    return l
                                }, Object.values(l));
                            return (0, O.jsx)(c.Provider, {
                                value: u,
                                children: a
                            })
                        };
                        return a.displayName = t + "Provider", [a, function(r, a) {
                            var l, c = (null == a || null == (l = a[e]) ? void 0 : l[i]) || o,
                                u = S.useContext(c);
                            if (u) return u;
                            if (void 0 !== n) return n;
                            throw Error("`".concat(r, "` must be used within `").concat(t, "`"))
                        }]
                    }, tT.apply(void 0, [n].concat(tN(t)))]
                }(rJ), 2),
                r0 = r$[0];
            r$[1];
            var r1 = rq(r0(rJ), 2),
                r2 = r1[0],
                r3 = r1[1],
                r8 = function(e) {
                    var t, r, n, o, i, a, l, c, u, s, f, p, h, d, y, m, b, g = e.__scopeDialog,
                        v = e.children,
                        w = e.open,
                        E = e.defaultOpen,
                        A = e.onOpenChange,
                        j = e.modal,
                        x = S.useRef(null),
                        P = S.useRef(null),
                        C = rq((u = (c = {
                            prop: w,
                            defaultProp: E,
                            onChange: A
                        }).prop, h = (p = tV((r = (t = {
                            defaultProp: c.defaultProp,
                            onChange: f = void 0 === (s = c.onChange) ? function() {} : s
                        }).defaultProp, n = t.onChange, i = tV(o = S.useState(r), 1)[0], a = S.useRef(i), l = tH(n), S.useEffect(function() {
                            a.current !== i && (l(i), a.current = i)
                        }, [i, a, l]), o), 2))[0], d = p[1], m = (y = void 0 !== u) ? u : h, b = tH(f), [m, S.useCallback(function(e) {
                            if (y) {
                                var t = "function" == typeof e ? e(u) : e;
                                t !== u && b(t)
                            } else d(e)
                        }, [y, u, d, b])]), 2),
                        I = C[0],
                        N = C[1];
                    return (0, O.jsx)(r2, {
                        scope: g,
                        triggerRef: x,
                        contentRef: P,
                        contentId: tM(),
                        titleId: tM(),
                        descriptionId: tM(),
                        open: void 0 !== I && I,
                        onOpenChange: N,
                        onOpenToggle: S.useCallback(function() {
                            return N(function(e) {
                                return !e
                            })
                        }, [N]),
                        modal: void 0 === j || j,
                        children: v
                    })
                };
            r8.displayName = rJ;
            var r5 = "DialogTrigger";
            S.forwardRef(function(e, t) {
                var r = e.__scopeDialog,
                    n = rW(e, ["__scopeDialog"]),
                    o = r3(r5, r),
                    i = tj(t, o.triggerRef);
                return (0, O.jsx)(t2.button, rX(rZ({
                    type: "button",
                    "aria-haspopup": "dialog",
                    "aria-expanded": o.open,
                    "aria-controls": o.contentId,
                    "data-state": ny(o.open)
                }, n), {
                    ref: i,
                    onClick: tw(e.onClick, o.onOpenToggle)
                }))
            }).displayName = r5;
            var r6 = "DialogPortal",
                r4 = rq(r0(r6, {
                    forceMount: void 0
                }), 2),
                r7 = r4[0],
                r9 = r4[1],
                ne = function(e) {
                    var t = e.__scopeDialog,
                        r = e.forceMount,
                        n = e.children,
                        o = e.container,
                        i = r3(r6, t);
                    return (0, O.jsx)(r7, {
                        scope: t,
                        forceMount: r,
                        children: S.Children.map(n, function(e) {
                            return (0, O.jsx)(t4, {
                                present: r || i.open,
                                children: (0, O.jsx)(t8, {
                                    asChild: !0,
                                    container: o,
                                    children: e
                                })
                            })
                        })
                    })
                };
            ne.displayName = r6;
            var nt = "DialogOverlay",
                nr = S.forwardRef(function(e, t) {
                    var r = r9(nt, e.__scopeDialog),
                        n = e.forceMount,
                        o = void 0 === n ? r.forceMount : n,
                        i = rW(e, ["forceMount"]),
                        a = r3(nt, e.__scopeDialog);
                    return a.modal ? (0, O.jsx)(t4, {
                        present: o || a.open,
                        children: (0, O.jsx)(no, rX(rZ({}, i), {
                            ref: t
                        }))
                    }) : null
                });
            nr.displayName = nt;
            var nn = tW("DialogOverlay.RemoveScroll"),
                no = S.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = rW(e, ["__scopeDialog"]),
                        o = r3(nt, r);
                    return (0, O.jsx)(rU, {
                        as: nn,
                        allowPinchZoom: !0,
                        shards: [o.contentRef],
                        children: (0, O.jsx)(t2.div, rX(rZ({
                            "data-state": ny(o.open)
                        }, n), {
                            ref: t,
                            style: rZ({
                                pointerEvents: "auto"
                            }, n.style)
                        }))
                    })
                }),
                ni = "DialogContent",
                na = S.forwardRef(function(e, t) {
                    var r = r9(ni, e.__scopeDialog),
                        n = e.forceMount,
                        o = void 0 === n ? r.forceMount : n,
                        i = rW(e, ["forceMount"]),
                        a = r3(ni, e.__scopeDialog);
                    return (0, O.jsx)(t4, {
                        present: o || a.open,
                        children: a.modal ? (0, O.jsx)(nl, rX(rZ({}, i), {
                            ref: t
                        })) : (0, O.jsx)(nc, rX(rZ({}, i), {
                            ref: t
                        }))
                    })
                });
            na.displayName = ni;
            var nl = S.forwardRef(function(e, t) {
                    var r = r3(ni, e.__scopeDialog),
                        n = S.useRef(null),
                        o = tj(t, r.contentRef, n);
                    return S.useEffect(function() {
                        var e = n.current;
                        if (e) return rQ(e)
                    }, []), (0, O.jsx)(nu, rX(rZ({}, e), {
                        ref: o,
                        trapFocus: r.open,
                        disableOutsidePointerEvents: !0,
                        onCloseAutoFocus: tw(e.onCloseAutoFocus, function(e) {
                            var t;
                            e.preventDefault(), null == (t = r.triggerRef.current) || t.focus()
                        }),
                        onPointerDownOutside: tw(e.onPointerDownOutside, function(e) {
                            var t = e.detail.originalEvent,
                                r = 0 === t.button && !0 === t.ctrlKey;
                            (2 === t.button || r) && e.preventDefault()
                        }),
                        onFocusOutside: tw(e.onFocusOutside, function(e) {
                            return e.preventDefault()
                        })
                    }))
                }),
                nc = S.forwardRef(function(e, t) {
                    var r = r3(ni, e.__scopeDialog),
                        n = S.useRef(!1),
                        o = S.useRef(!1);
                    return (0, O.jsx)(nu, rX(rZ({}, e), {
                        ref: t,
                        trapFocus: !1,
                        disableOutsidePointerEvents: !1,
                        onCloseAutoFocus: function(t) {
                            var i, a;
                            null == (i = e.onCloseAutoFocus) || i.call(e, t), t.defaultPrevented || (n.current || null == (a = r.triggerRef.current) || a.focus(), t.preventDefault()), n.current = !1, o.current = !1
                        },
                        onInteractOutside: function(t) {
                            null == (i = e.onInteractOutside) || i.call(e, t), t.defaultPrevented || (n.current = !0, "pointerdown" === t.detail.originalEvent.type && (o.current = !0));
                            var i, a, l = t.target;
                            (null == (a = r.triggerRef.current) ? void 0 : a.contains(l)) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && o.current && t.preventDefault()
                        }
                    }))
                }),
                nu = S.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = e.trapFocus,
                        o = e.onOpenAutoFocus,
                        i = e.onCloseAutoFocus,
                        a = rW(e, ["__scopeDialog", "trapFocus", "onOpenAutoFocus", "onCloseAutoFocus"]),
                        l = r3(ni, r),
                        c = S.useRef(null),
                        u = tj(t, c);
                    return (0, t9.useFocusGuards)(), (0, O.jsxs)(O.Fragment, {
                        children: [(0, O.jsx)(t_.FocusScope, {
                            asChild: !0,
                            loop: !0,
                            trapped: n,
                            onMountAutoFocus: o,
                            onUnmountAutoFocus: i,
                            children: (0, O.jsx)(tF.DismissableLayer, rX(rZ({
                                role: "dialog",
                                id: l.contentId,
                                "aria-describedby": l.descriptionId,
                                "aria-labelledby": l.titleId,
                                "data-state": ny(l.open)
                            }, a), {
                                ref: u,
                                onDismiss: function() {
                                    return l.onOpenChange(!1)
                                }
                            }))
                        }), (0, O.jsxs)(O.Fragment, {
                            children: [(0, O.jsx)(nv, {
                                titleId: l.titleId
                            }), (0, O.jsx)(nO, {
                                contentRef: c,
                                descriptionId: l.descriptionId
                            })]
                        })]
                    })
                }),
                ns = "DialogTitle",
                nf = S.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = rW(e, ["__scopeDialog"]),
                        o = r3(ns, r);
                    return (0, O.jsx)(t2.h2, rX(rZ({
                        id: o.titleId
                    }, n), {
                        ref: t
                    }))
                });
            nf.displayName = ns;
            var np = "DialogDescription";
            S.forwardRef(function(e, t) {
                var r = e.__scopeDialog,
                    n = rW(e, ["__scopeDialog"]),
                    o = r3(np, r);
                return (0, O.jsx)(t2.p, rX(rZ({
                    id: o.descriptionId
                }, n), {
                    ref: t
                }))
            }).displayName = np;
            var nh = "DialogClose",
                nd = S.forwardRef(function(e, t) {
                    var r = e.__scopeDialog,
                        n = rW(e, ["__scopeDialog"]),
                        o = r3(nh, r);
                    return (0, O.jsx)(t2.button, rX(rZ({
                        type: "button"
                    }, n), {
                        ref: t,
                        onClick: tw(e.onClick, function() {
                            return o.onOpenChange(!1)
                        })
                    }))
                });

            function ny(e) {
                return e ? "open" : "closed"
            }
            nd.displayName = nh;
            var nm = "DialogTitleWarning",
                nb = rq((s = {
                    contentName: ni,
                    titleName: ns,
                    docsSlug: "dialog"
                }, f = S.createContext(s), (p = function(e) {
                    var t = e.children,
                        r = tI(e, ["children"]),
                        n = S.useMemo(function() {
                            return r
                        }, Object.values(r));
                    return (0, O.jsx)(f.Provider, {
                        value: n,
                        children: t
                    })
                }).displayName = nm + "Provider", [p, function(e) {
                    var t = S.useContext(f);
                    if (t) return t;
                    if (void 0 !== s) return s;
                    throw Error("`".concat(e, "` must be used within `").concat(nm, "`"))
                }]), 2),
                ng = (nb[0], nb[1]),
                nv = function(e) {
                    var t = e.titleId,
                        r = ng(nm),
                        n = "`".concat(r.contentName, "` requires a `").concat(r.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(r.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(r.docsSlug);
                    return S.useEffect(function() {
                        t && (document.getElementById(t) || console.error(n))
                    }, [n, t]), null
                },
                nO = function(e) {
                    var t = e.contentRef,
                        r = e.descriptionId,
                        n = ng("DialogDescriptionWarning"),
                        o = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(n.contentName, "}.");
                    return S.useEffect(function() {
                        var e, n = null == (e = t.current) ? void 0 : e.getAttribute("aria-describedby");
                        r && n && (document.getElementById(r) || console.warn(o))
                    }, [o, t, r]), null
                };

            function nw(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nE(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }

            function nA(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function nS(e, t) {
                if (null == e) return {};
                var r, n, o, i = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                    return i
                }
                if (i = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            i = Object.getOwnPropertyNames(e);
                        for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                return i
            }

            function nj(e) {
                return function(e) {
                    if (Array.isArray(e)) return nw(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return nw(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return nw(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var nx = Symbol("radix.slottable");

            function nP(e) {
                return S.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === nx
            }

            function nC(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function nI(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        nC(e, t, r[t])
                    })
                }
                return e
            }

            function nN(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }
            var nT = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce(function(e, t) {
                var r, n, o, i, a, l = (r = o = "Primitive.".concat(t), (n = S.forwardRef(function(e, t) {
                        var r = e.children,
                            n = nS(e, ["children"]);
                        if (S.isValidElement(r)) {
                            var o, i, a, l, c, u = (c = (l = null == (i = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (c = (l = null == (a = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                                s = function(e, t) {
                                    var r = nE({}, t);
                                    for (var n in t) ! function(n) {
                                        var o = e[n],
                                            i = t[n];
                                        /^on[A-Z]/.test(n) ? o && i ? r[n] = function() {
                                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                            var n = i.apply(void 0, nj(t));
                                            return o.apply(void 0, nj(t)), n
                                        } : o && (r[n] = o) : "style" === n ? r[n] = nE({}, o, i) : "className" === n && (r[n] = [o, i].filter(Boolean).join(" "))
                                    }(n);
                                    return nE({}, e, r)
                                }(n, r.props);
                            return r.type !== S.Fragment && (s.ref = t ? tS(t, u) : u), S.cloneElement(r, s)
                        }
                        return S.Children.count(r) > 1 ? S.Children.only(null) : null
                    })).displayName = "".concat(r, ".SlotClone"), i = n, (a = S.forwardRef(function(e, t) {
                        var r = e.children,
                            n = nS(e, ["children"]),
                            o = S.Children.toArray(r),
                            a = o.find(nP);
                        if (a) {
                            var l = a.props.children,
                                c = o.map(function(e) {
                                    return e !== a ? e : S.Children.count(l) > 1 ? S.Children.only(null) : S.isValidElement(l) ? l.props.children : null
                                });
                            return (0, O.jsx)(i, nA(nE({}, n), {
                                ref: t,
                                children: S.isValidElement(l) ? S.cloneElement(l, void 0, c) : null
                            }))
                        }
                        return (0, O.jsx)(i, nA(nE({}, n), {
                            ref: t,
                            children: r
                        }))
                    })).displayName = "".concat(o, ".Slot"), a),
                    c = S.forwardRef(function(e, r) {
                        var n = e.asChild,
                            o = function(e, t) {
                                if (null == e) return {};
                                var r, n, o, i = {};
                                if ("u" > typeof Reflect && Reflect.ownKeys) {
                                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                                    return i
                                }
                                if (i = function(e, t) {
                                        if (null == e) return {};
                                        var r, n, o = {},
                                            i = Object.getOwnPropertyNames(e);
                                        for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                                        return o
                                    }(e, t), Object.getOwnPropertySymbols)
                                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                                return i
                            }(e, ["asChild"]),
                            i = n ? l : t;
                        return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, O.jsx)(i, nN(nI({}, o), {
                            ref: r
                        }))
                    });
                return c.displayName = "Primitive.".concat(t), nN(nI({}, e), nC({}, t, c))
            }, {});

            function nk(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }
            var nB = Object.freeze({
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
                nL = S.forwardRef(function(e, t) {
                    var r, n;
                    return (0, O.jsx)(nT.span, (r = nk({}, e), n = n = {
                        ref: t,
                        style: nk({}, nB, e.style)
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(n)) : (function(e) {
                        var t = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            t.push.apply(t, r)
                        }
                        return t
                    })(Object(n)).forEach(function(e) {
                        Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(n, e))
                    }), r))
                });

            function nR(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }

            function nM(e, t) {
                if (null == e) return {};
                var r, n, o, i = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                    return i
                }
                if (i = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            i = Object.getOwnPropertyNames(e);
                        for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                return i
            }
            nL.displayName = "VisuallyHidden";
            var nD = (0, S.createContext)({
                    size: "Medium",
                    isModal: !0,
                    hasCloseAffordance: !1,
                    hasMarginTop: !0,
                    hasMarginBottom: !0,
                    hasDescription: !1,
                    type: "Default"
                }),
                nH = function() {
                    var e = (0, S.useContext)(nD);
                    if (!e) throw Error("Dialog components must be used within a Dialog");
                    return e
                },
                nU = {
                    Small: "padding-x-large",
                    Medium: "padding-x-xlarge",
                    Large: "padding-x-xlarge"
                },
                nV = {
                    Small: "padding-top-large",
                    Medium: "padding-top-xlarge",
                    Large: "padding-top-xlarge"
                },
                nF = {
                    Small: "padding-bottom-large",
                    Medium: "padding-bottom-xlarge",
                    Large: "padding-bottom-xlarge"
                },
                n_ = function(e) {
                    var t = e.open,
                        r = e.onOpenChange,
                        n = e.children,
                        o = e.size,
                        i = e.type,
                        a = void 0 === i ? "Default" : i,
                        l = e.isModal,
                        c = e.hasCloseAffordance,
                        u = e.closeLabel,
                        s = e.hasMarginTop,
                        f = void 0 === s || s,
                        p = e.hasMarginBottom,
                        h = void 0 === p || p,
                        d = e.hasDescription,
                        y = void 0 !== d && d,
                        m = e.experimentalDisablePointerEventsStylingOnBody,
                        b = void 0 !== m && m,
                        g = (0, S.useMemo)(function() {
                            return {
                                size: o,
                                isModal: l,
                                type: a,
                                hasCloseAffordance: c,
                                closeLabel: u,
                                hasMarginTop: f,
                                hasMarginBottom: h,
                                hasDescription: y
                            }
                        }, [o, l, a, c, u, f, h, y]);
                    return (0, S.useEffect)(function() {
                        b && setTimeout(function() {
                            Object.assign(document.body.style, {
                                pointerEvents: "unset"
                            })
                        }, 0)
                    }, [b, t]), j().createElement(nD.Provider, {
                        value: g
                    }, j().createElement(r8, {
                        open: t,
                        onOpenChange: r
                    }, n))
                };
            n_.displayName = "Dialog";
            var nG = function(e) {
                var t = e.children,
                    r = e.className,
                    n = e.style,
                    o = e.overlayClassName,
                    i = e.overlayStyle,
                    a = e.onOpenAutoFocus,
                    l = nM(e, ["children", "className", "style", "overlayClassName", "overlayStyle", "onOpenAutoFocus"]),
                    c = nH(),
                    u = c.size,
                    s = c.isModal,
                    f = c.hasCloseAffordance,
                    p = c.closeLabel,
                    h = c.hasDescription,
                    d = tu("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", s && "bg-common-backdrop", o),
                    y = tu("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", r);
                return j().createElement(ne, null, j().createElement(nr, {
                    className: d,
                    style: i
                }, j().createElement(na, nR({
                    className: y,
                    "data-size": u,
                    style: n,
                    onOpenAutoFocus: a
                }, !h && {
                    "aria-describedby": void 0
                }, l), f && j().createElement("div", {
                    className: "absolute foundation-web-dialog-close-container"
                }, j().createElement(nd, {
                    asChild: !0
                }, j().createElement(tO, {
                    variant: "OverMedia",
                    size: u,
                    isCircular: !0,
                    "aria-label": p
                }))), t)))
            };
            nG.displayName = "DialogContent";
            var nK = function(e) {
                var t = e.children,
                    r = e.className,
                    n = nM(e, ["children", "className"]),
                    o = nH(),
                    i = o.size,
                    a = o.hasMarginTop,
                    l = o.hasMarginBottom,
                    c = tu(nU[i], a && nV[i], l && nF[i], r);
                return j().createElement("div", nR({
                    className: c
                }, n), t)
            };
            nK.displayName = "DialogBody";
            var nz = function(e) {
                var t = e.children,
                    r = e.className,
                    n = e.hidden,
                    o = nM(e, ["children", "className", "hidden"]),
                    i = j().createElement(nf, nR({
                        className: r
                    }, o), t);
                return n ? j().createElement(nL, null, i) : i
            };
            nz.displayName = "DialogTitle";
            var nQ = function(e) {
                var t = e.children,
                    r = e.className,
                    n = nM(e, ["children", "className"]),
                    o = nH().size,
                    i = tu(nU[o], nF[o], r);
                return j().createElement("div", nR({
                    className: i
                }, n), t)
            };
            nQ.displayName = "DialogFooter";
            var nY = window.Roblox["core-scripts"].meta.device,
                nZ = "SET_USER_EMAIL_STATES",
                nX = "SET_MODAL_STATES",
                nW = "SET_PAGENAME_STATE",
                nq = "SET_INPUT_STATE",
                nJ = "SET_ERROR_STATE",
                n$ = "SET_EMAIL_UPDATING_STATE",
                n0 = "SET_TRIGGER_ORIGIN",
                n1 = "SET_INPUT_CLEAR",
                n2 = "SET_VERIFICATION_CALLBACK",
                n3 = "SET_CALLBACK_READY",
                n8 = "CLEANUP_MODAL",
                n5 = r(741),
                n6 = "primary",
                n4 = "secondary",
                n7 = r(611),
                n9 = r.n(n7),
                oe = function(e) {
                    var t = e.width,
                        r = e.height;
                    return j().createElement("svg", {
                        className: "foundation-web-loading-spinner",
                        width: t,
                        height: r,
                        viewBox: "0 0 20 20",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg"
                    }, j().createElement("path", {
                        fillRule: "evenodd",
                        clipRule: "evenodd",
                        fill: "currentColor",
                        d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                    }))
                };

            function ot(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function or(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }

            function on(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function oo(e, t) {
                if (null == e) return {};
                var r, n, o, i = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                    return i
                }
                if (i = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            i = Object.getOwnPropertyNames(e);
                        for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                return i
            }

            function oi(e) {
                return function(e) {
                    if (Array.isArray(e)) return ot(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return ot(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return ot(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function oa(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var ol = Symbol.for("react.lazy"),
                oc = S[" use ".trim().toString()];

            function ou(e) {
                var t;
                return null != e && (void 0 === e ? "undefined" : oa(e)) === "object" && "$$typeof" in e && e.$$typeof === ol && "_payload" in e && (void 0 === (t = e._payload) ? "undefined" : oa(t)) === "object" && null !== t && "then" in t
            }
            var os = ((e = S.forwardRef(function(e, t) {
                    var r = e.children,
                        n = oo(e, ["children"]);
                    if (ou(r) && "function" == typeof oc && (r = oc(r._payload)), S.isValidElement(r)) {
                        var o, i, a, l, c, u = (c = (l = null == (i = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : i.get) && "isReactWarning" in l && l.isReactWarning) ? o.ref : (c = (l = null == (a = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : a.get) && "isReactWarning" in l && l.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                            s = function(e, t) {
                                var r = or({}, t);
                                for (var n in t) ! function(n) {
                                    var o = e[n],
                                        i = t[n];
                                    /^on[A-Z]/.test(n) ? o && i ? r[n] = function() {
                                        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                        var n = i.apply(void 0, oi(t));
                                        return o.apply(void 0, oi(t)), n
                                    } : o && (r[n] = o) : "style" === n ? r[n] = or({}, o, i) : "className" === n && (r[n] = [o, i].filter(Boolean).join(" "))
                                }(n);
                                return or({}, e, r)
                            }(n, r.props);
                        return r.type !== S.Fragment && (s.ref = t ? tS(t, u) : u), S.cloneElement(r, s)
                    }
                    return S.Children.count(r) > 1 ? S.Children.only(null) : null
                })).displayName = "".concat("Slot", ".SlotClone"), h = e, (d = S.forwardRef(function(e, t) {
                    var r = e.children,
                        n = oo(e, ["children"]);
                    ou(r) && "function" == typeof oc && (r = oc(r._payload));
                    var o = S.Children.toArray(r),
                        i = o.find(op);
                    if (i) {
                        var a = i.props.children,
                            l = o.map(function(e) {
                                return e !== i ? e : S.Children.count(a) > 1 ? S.Children.only(null) : S.isValidElement(a) ? a.props.children : null
                            });
                        return (0, O.jsx)(h, on(or({}, n), {
                            ref: t,
                            children: S.isValidElement(a) ? S.cloneElement(a, void 0, l) : null
                        }))
                    }
                    return (0, O.jsx)(h, on(or({}, n), {
                        ref: t,
                        children: r
                    }))
                })).displayName = "".concat("Slot", ".Slot"), d),
                of = Symbol("radix.slottable");

            function op(e) {
                return S.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === of
            }

            function oh(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function od(e) {
                if (Array.isArray(e)) return e
            }

            function oy() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function om(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }

            function ob(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function og(e, t) {
                if (null == e) return {};
                var r, n, o, i = {};
                if ("u" > typeof Reflect && Reflect.ownKeys) {
                    for (o = 0, r = Reflect.ownKeys(Object(e)); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                    return i
                }
                if (i = function(e, t) {
                        if (null == e) return {};
                        var r, n, o = {},
                            i = Object.getOwnPropertyNames(e);
                        for (n = 0; n < i.length; n++) r = i[n], !(t.indexOf(r) >= 0) && Object.prototype.propertyIsEnumerable.call(e, r) && (o[r] = e[r]);
                        return o
                    }(e, t), Object.getOwnPropertySymbols)
                    for (o = 0, r = Object.getOwnPropertySymbols(e); o < r.length; o++) n = r[o], !(t.indexOf(n) >= 0) && Object.prototype.propertyIsEnumerable.call(e, n) && (i[n] = e[n]);
                return i
            }

            function ov(e, t) {
                if (e) {
                    if ("string" == typeof e) return oh(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return oh(e, t)
                }
            }
            var oO = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                ow = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                oE = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-alert", "content-action-alert"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                oA = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                oS = (0, S.forwardRef)(function(e, t) {
                    var r, n = od(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || ov(r) || oy(),
                        o = n[0],
                        i = n.slice(1),
                        a = o.children,
                        l = o.className,
                        c = o.style,
                        u = o.isDisabled,
                        s = void 0 !== u && u,
                        f = o.isLoading,
                        p = void 0 !== f && f,
                        h = o.icon,
                        d = o.size,
                        y = void 0 === d ? "Large" : d,
                        m = o.variant,
                        b = void 0 === m ? "Emphasis" : m,
                        g = o.asChild,
                        v = og(o, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        O = (od(i) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    i = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(i = (t = n.next()).done) && (o.push(t.value), 1 !== o.length); i = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        i || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return o
                            }
                        }(i) || ov(i, 1) || oy())[0],
                        w = tu("foundation-web-button", s ? "opacity-[0.5]" : [ts, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", ow[y], s ? oA[b] : oE[b], l),
                        E = om({
                            textDecoration: "none"
                        }, c),
                        A = function(e) {
                            return j().createElement(j().Fragment, null, j().createElement(tf, null), p && j().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, j().createElement(oe, {
                                width: oO[y],
                                height: oO[y]
                            })), j().createElement("span", {
                                className: tu("flex items-center min-width-0", "Large" === y || "Medium" === y ? "gap-small" : "gap-xsmall", p && "invisible")
                            }, h && j().createElement(tb, {
                                name: h,
                                size: y
                            }), j().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, e)))
                        };
                    if (g) {
                        v.as;
                        var S = og(v, ["as"]),
                            x = j().Children.only(a);
                        return j().createElement(os, ob(om({
                            ref: O
                        }, S), {
                            className: w,
                            style: E,
                            "aria-disabled": s || void 0
                        }), j().cloneElement(x, {}, A(x.props.children)))
                    }
                    if ("a" === v.as) {
                        v.as;
                        var P = v.href,
                            C = og(v, ["as", "href"]);
                        return j().createElement("a", ob(om({
                            ref: O
                        }, C), {
                            "aria-disabled": s,
                            href: s ? void 0 : P,
                            className: w,
                            style: E
                        }), A(a))
                    }
                    v.as;
                    var I = og(v, ["as"]);
                    return j().createElement("button", ob(om({
                        ref: O,
                        type: "button"
                    }, I), {
                        disabled: s,
                        className: w,
                        style: E
                    }), A(a))
                }),
                oj = function(e) {
                    var t = e.variant,
                        r = e.className,
                        n = e.isDisabled,
                        o = e.onClick,
                        i = e.children;
                    return (0, O.jsx)(oS, {
                        variant: "Standard",
                        size: "Medium",
                        className: n9()("idv-button", "idv-button-".concat(void 0 === t ? "primary" : t), r),
                        isDisabled: void 0 !== n && n,
                        onClick: o,
                        children: i
                    })
                },
                ox = window.Roblox["core-scripts"].eventStream,
                oP = "ageVerification",
                oC = "voiceChat",
                oI = "avatarVideo",
                oN = "buttonClick",
                oT = {
                    showQRCode: {
                        name: "showQRCode",
                        type: ox.eventTypes.modalAction,
                        context: oP,
                        params: {
                            aType: "shown",
                            field: "ageVerificationQRCode"
                        }
                    },
                    showAddEmailModal: {
                        name: "showAddEmailModal",
                        type: ox.eventTypes.modalAction,
                        context: oP,
                        params: {
                            aType: "shown",
                            field: "addEmail"
                        }
                    },
                    useAddEmailField: {
                        name: "useAddEmailField",
                        type: ox.eventTypes.formInteraction,
                        context: oP,
                        params: {
                            btn: "emailAddress",
                            field: "addEmail"
                        }
                    },
                    addEmailConfirm: {
                        name: "addEmailConfirm",
                        type: oN,
                        context: oP,
                        params: {
                            btn: "continue",
                            field: "addEmail"
                        }
                    },
                    showModal: {
                        name: "showModal",
                        type: ox.eventTypes.modalAction,
                        context: oP,
                        params: {
                            aType: "shown",
                            field: "startAgeVerification"
                        }
                    },
                    verificationLinkClicked: {
                        name: "verificationLinkClicked",
                        type: oN,
                        context: oP,
                        params: {
                            btn: "startSession",
                            field: "startAgeVerification"
                        }
                    },
                    exitIdentityVerification: {
                        name: "exitIdentityVerification",
                        type: ox.eventTypes.modalAction,
                        context: oP,
                        params: {
                            aType: "dismissed",
                            field: "startAgeVerification"
                        }
                    },
                    verificationInProgress: {
                        name: "verificationInProgress",
                        type: ox.eventTypes.modalAction,
                        context: oP,
                        params: {
                            aType: "shown",
                            field: "ageVerificationProgress"
                        }
                    },
                    verificationPending: {
                        name: "verificationPending",
                        type: ox.eventTypes.modalAction,
                        context: oP,
                        params: {
                            aType: "shown",
                            field: "ageVerificationPending"
                        }
                    },
                    successPage: {
                        name: "successPage",
                        type: ox.eventTypes.modalAction,
                        context: oP,
                        params: {
                            aType: "shown",
                            field: "ageVerificationSucceded"
                        }
                    },
                    successPageClose: {
                        name: "successPageClose",
                        type: oN,
                        context: oP,
                        params: {
                            btn: "Done",
                            field: "ageVerificationSucceded"
                        }
                    },
                    failurePage: {
                        name: "failurePage",
                        type: ox.eventTypes.modalAction,
                        context: oP,
                        params: {
                            aType: "shown",
                            field: "ageVerificationFailed"
                        }
                    },
                    failurePageClose: {
                        name: "failurePageClose",
                        type: oN,
                        context: oP,
                        params: {
                            btn: "Done",
                            field: "ageVerificationFailed"
                        }
                    },
                    tempBanPage: {
                        name: "tempBanPage",
                        type: ox.eventTypes.modalAction,
                        context: oP,
                        params: {
                            aType: "shown",
                            field: "ageVerificationTempBanned"
                        }
                    },
                    tempBanPageClose: {
                        name: "tempBanPageClose",
                        type: oN,
                        context: oP,
                        params: {
                            btn: "Done",
                            field: "ageVerificationTempBanned"
                        }
                    },
                    joinWithoutVoiceChat: {
                        name: "joinWithoutVoiceChat",
                        type: "joinWithoutVoiceChat",
                        context: oC,
                        params: {
                            dontShowAgain: !1
                        }
                    },
                    closeEnableVoiceChatModal: {
                        name: "closeEnableVoiceChatModal",
                        type: "closeEnableVoiceChatModal",
                        context: oC
                    },
                    showEnableVoiceChatModal: {
                        name: "showEnableVoiceChatModal",
                        type: "showEnableVoiceChatModal",
                        context: oC
                    },
                    enableVoiceChatUpsell: {
                        name: "enableVoiceChatUpsell",
                        type: "enableVoiceChatUpsell",
                        context: oC
                    },
                    learnMoreAboutVoiceRecordingUpsell: {
                        name: "learnMoreAboutVoiceRecordingUpsell",
                        type: "learnMoreAboutVoiceRecordingUpsell",
                        context: oC
                    },
                    joinWithoutAvatarVideo: {
                        name: "joinWithoutAvatarVideo",
                        type: "joinWithoutAvatarVideo",
                        context: oI
                    },
                    showUnifiedChatUpsellModal: {
                        name: "showUnifiedChatUpsellModal",
                        type: "showUnifiedChatUpsellModal",
                        context: oI
                    },
                    enableAvatarVideo: {
                        name: "enableAvatarVideo",
                        type: "enableAvatarVideo",
                        context: oI
                    },
                    learnMoreAvatarVideo: {
                        name: "learnMoreAvatarVideo",
                        type: "learnMoreAvatarVideo",
                        context: oI
                    }
                },
                ok = "LANDING",
                oB = "EMAIL",
                oL = "SUCCESS_OVERAGE",
                oR = "SUCCESS_UNDERAGE",
                oM = "SUCCESS",
                oD = "FAILURE",
                oH = "PENDING",
                oU = "POLLING",
                oV = "ERROR",
                oF = "TEMP_BAN",
                o_ = "VENDOR_LINK",
                oG = "ENABLE_VOICE_CHAT",
                oK = "ENABLE_AVATAR_CHAT",
                oz = "AccountSettings",
                oQ = "WebApp",
                oY = "parental-verification",
                oZ = "OpenVoiceOptInOverlay",
                oX = "OpenCameraOptInOverlay",
                oW = "OpenIdentityVerificationModal",
                oq = window.Roblox["core-scripts"].http.http,
                oJ = globalThis.window,
                o$ = void 0 === oJ ? void 0 : oJ,
                o0 = window.Roblox["core-lib"].http.index,
                o1 = window.Roblox["core-lib"].url.index;

            function o2(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function o3(e, t, r) {
                return (o3 = o9() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && o4(o, r.prototype), o
                }).apply(null, arguments)
            }

            function o8(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function o5(e) {
                return (o5 = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function o6(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function o4(e, t) {
                return (o4 = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function o7(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (o7 = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return o3(e, arguments, o5(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), o4(r, e)
                })(e)
            }

            function o9() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (o9 = function() {
                    return !!e
                })()
            }
            var ie = function(e, t) {
                    var r = o1.Url.parse(new URL(e.url, null == o$ ? void 0 : o$.location.origin).href).getOrThrow();
                    return t ? r.withSearchParams(Object.entries(t).flatMap(function(e) {
                        var t = function(e) {
                                if (Array.isArray(e)) return e
                            }(e) || function(e) {
                                var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                if (null != n) {
                                    var o = [],
                                        i = !0,
                                        a = !1;
                                    try {
                                        for (n = n.call(e); !(i = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); i = !0);
                                    } catch (e) {
                                        a = !0, r = e
                                    } finally {
                                        try {
                                            i || null == n.return || n.return()
                                        } finally {
                                            if (a) throw r
                                        }
                                    }
                                    return o
                                }
                            }(e) || function(e) {
                                if (e) {
                                    if ("string" == typeof e) return o2(e, 2);
                                    var t = Object.prototype.toString.call(e).slice(8, -1);
                                    if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                    if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return o2(e, 2)
                                }
                            }(e) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }(),
                            r = t[0],
                            n = t[1];
                        return null == n ? [] : [
                            [r, "string" == typeof n || "number" == typeof n || "boolean" == typeof n ? String(n) : JSON.stringify(n)]
                        ]
                    })) : r
                },
                it = function(e) {
                    return function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var r = null != arguments[t] ? arguments[t] : {},
                                n = Object.keys(r);
                            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(r, e).enumerable
                            }))), n.forEach(function(t) {
                                o8(e, t, r[t])
                            })
                        }
                        return e
                    }({
                        includeBodyOnError: !0
                    }, e.withCredentials ? {
                        credentials: "include"
                    } : {})
                },
                ir = function(e) {
                    if ("function" != typeof e && null !== e) throw TypeError("Super expression must either be null or a function");

                    function t(e, r, n) {
                        var o, i, a;
                        if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                        return i = t, a = ["Request failed with status ".concat(e), n], i = o5(i), o8(o = function(e, t) {
                            var r;
                            if (t && ("object" == ((r = t) && "u" > typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r) || "function" == typeof t)) return t;
                            if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                            return e
                        }(this, o9() ? Reflect.construct(i, a || [], o5(this).constructor) : i.apply(this, a)), "status", void 0), o8(o, "data", void 0), o.status = e, o.data = r, o
                    }
                    return t.prototype = Object.create(e && e.prototype, {
                        constructor: {
                            value: t,
                            writable: !0,
                            configurable: !0
                        }
                    }), e && o4(t, e), t
                }(o7(Error)),
                io = function(e) {
                    if (o6(e, o0.HttpError)) {
                        var t = e.response,
                            r = t.status,
                            n = t.body,
                            o = n;
                        if ("string" == typeof n) try {
                            o = JSON.parse(n)
                        } catch (e) {
                            o = n
                        }
                        return new ir(r, o, {
                            cause: e
                        })
                    }
                    return o6(e, Error) ? e : Error(String(e), {
                        cause: e
                    })
                },
                ii = function(e) {
                    return e.then(function(e) {
                        return {
                            data: e
                        }
                    }).catch(function(e) {
                        throw io(e)
                    })
                },
                ia = "true" === r(773).env.NEXT_PUBLIC_IS_NEXTJS ? {
                    get: function(e, t) {
                        return ii(Promise.resolve().then(function() {
                            return o0.getUntyped(ie(e, t), it(e)).getOrThrow()
                        }))
                    },
                    post: function(e, t) {
                        var r = null != t ? t : {};
                        return ii(Promise.resolve().then(function() {
                            return o0.postUntyped(ie(e), r, it(e)).getOrThrow()
                        }))
                    }
                } : {
                    get: function(e, t) {
                        return oq.get(e, t)
                    },
                    post: function(e, t) {
                        return oq.post(e, t)
                    }
                },
                il = window.Roblox["core-scripts"].environmentUrls,
                ic = r.n(il),
                iu = il.EnvironmentUrls.apiGatewayUrl,
                is = il.EnvironmentUrls.accountSettingsApi,
                ip = il.EnvironmentUrls.voiceApi,
                ih = function() {
                    return {
                        retryable: !0,
                        withCredentials: !0,
                        url: "".concat(is, "/v1/email")
                    }
                },
                id = function() {
                    return ia.get({
                        retryable: !0,
                        withCredentials: !0,
                        url: "".concat(iu, "/age-verification-service/v1/age-verification/verified-age")
                    }).then(function(e) {
                        return e.data
                    })
                },
                iy = function(e) {
                    return ia.get({
                        retryable: !0,
                        withCredentials: !0,
                        url: "".concat(iu, "/age-verification-service/v1/persona-id-verification/verified-status")
                    }, {
                        token: e
                    }).then(function(e) {
                        return e.data
                    })
                },
                im = function(e, t) {
                    var r, n;
                    ox.sendEventWithTarget(e.type, e.context, (r = function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var r = null != arguments[t] ? arguments[t] : {},
                                n = Object.keys(r);
                            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(r, e).enumerable
                            }))), n.forEach(function(t) {
                                var n;
                                n = r[t], t in e ? Object.defineProperty(e, t, {
                                    value: n,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : e[t] = n
                            })
                        }
                        return e
                    }({}, e.params), n = n = {
                        origin: t.origin
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(r, Object.getOwnPropertyDescriptors(n)) : (function(e) {
                        var t = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            t.push.apply(t, r)
                        }
                        return t
                    })(Object(n)).forEach(function(e) {
                        Object.defineProperty(r, e, Object.getOwnPropertyDescriptor(n, e))
                    }), r))
                };

            function ib(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ig(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function iv(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return ib(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ib(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var iO = function(e) {
                    var t = e.translate,
                        r = e.onHide,
                        n = e.verificationLink,
                        o = e.useQRCode,
                        i = e.checklistStep,
                        a = e.origin,
                        l = iv((0, S.useState)(), 2),
                        c = l[0],
                        u = l[1],
                        s = iv((0, S.useState)(!1), 2),
                        f = s[0],
                        p = s[1];
                    return (0, S.useEffect)(function() {
                        var e;
                        (e = function() {
                            var e;
                            return function(e, t) {
                                var r, n, o, i = {
                                        label: 0,
                                        sent: function() {
                                            if (1 & o[0]) throw o[1];
                                            return o[1]
                                        },
                                        trys: [],
                                        ops: []
                                    },
                                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                    l = Object.defineProperty;
                                return l(a, "next", {
                                    value: c(0)
                                }), l(a, "throw", {
                                    value: c(1)
                                }), l(a, "return", {
                                    value: c(2)
                                }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                                    value: function() {
                                        return this
                                    }
                                }), a;

                                function c(l) {
                                    return function(c) {
                                        var u = [l, c];
                                        if (r) throw TypeError("Generator is already executing.");
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
                                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
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
                                    }
                                }
                            }(this, function(t) {
                                switch (t.label) {
                                    case 0:
                                        return t.trys.push([0, 2, 3, 4]), [4, n5.toDataURL(n, {
                                            errorCorrectionLevel: "H"
                                        })];
                                    case 1:
                                        return u(e = t.sent()), [3, 4];
                                    case 2:
                                        throw Error(t.sent());
                                    case 3:
                                        return p(o && e), [7];
                                    case 4:
                                        return [2]
                                }
                            })
                        }, function() {
                            var t = this,
                                r = arguments;
                            return new Promise(function(n, o) {
                                var i = e.apply(t, r);

                                function a(e) {
                                    ig(i, n, o, a, l, "next", e)
                                }

                                function l(e) {
                                    ig(i, n, o, a, l, "throw", e)
                                }
                                a(void 0)
                            })
                        })()
                    }, [o, n]), (0, O.jsxs)(j().Fragment, {
                        children: [(0, O.jsx)("div", {
                            className: "modal-header",
                            children: (0, O.jsxs)("div", {
                                className: "email-upsell-title-container",
                                children: [(0, O.jsx)("button", {
                                    type: "button",
                                    className: "email-upsell-title-button",
                                    onClick: r,
                                    children: (0, O.jsx)(tb, {
                                        name: "icon-regular-x",
                                        size: "Large",
                                        className: "idv-close-icon"
                                    })
                                }), (0, O.jsx)(nz, {
                                    className: "modal-title",
                                    children: t("Heading.IdentityVerification")
                                })]
                            })
                        }), (0, O.jsxs)(nK, {
                            className: "modal-body verification-checklist-page-content",
                            children: [(0, O.jsx)("div", {
                                className: "cta",
                                children: t(0 === i || 1 === i ? "Label.VerifyInBrowser" : "Label.VerificationDataSubmitted")
                            }), (0, O.jsx)("ul", {
                                className: "checklist-wrapper",
                                children: ["Label.ConnectingToMobile", "Label.VerifyingYou", "Label.VerificationWaitingForResults", "Label.UpdatingRoblox"].map(function(e, r) {
                                    return r <= i ? (0, O.jsxs)("li", {
                                        className: "checklist-item",
                                        children: [(0, O.jsx)("span", {
                                            className: "check-wrapper",
                                            children: r === i ? (0, O.jsx)("span", {
                                                className: "spinner spinner-sm"
                                            }) : (0, O.jsx)(tb, {
                                                name: "icon-regular-check",
                                                size: "Large",
                                                className: "idv-check-icon"
                                            })
                                        }), (0, O.jsx)("span", {
                                            className: "checklist-text",
                                            children: t(e)
                                        })]
                                    }) : null
                                })
                            }), f && (0, O.jsxs)("div", {
                                className: "verification-link-page-content",
                                children: [(0, O.jsx)("div", {
                                    className: "qr-code-wrapper",
                                    children: (0, O.jsx)("img", {
                                        className: "qr-code-img",
                                        src: c,
                                        alt: "qr"
                                    })
                                }), (0, O.jsx)("div", {
                                    className: "footer-text",
                                    children: t("Label.HavingTroubleScanCode")
                                })]
                            }), !f && (0, O.jsx)("a", {
                                href: n,
                                onClick: function() {
                                    im(oT.verificationLinkClicked, {
                                        origin: a
                                    })
                                },
                                target: "_blank",
                                rel: "noreferrer",
                                children: (0, O.jsx)(oj, {
                                    className: "primary-link",
                                    variant: n6,
                                    children: t("Action.RestartSession")
                                })
                            }), (0, O.jsx)("div", {
                                className: "footer-text",
                                children: t("Label.PleaseDoNotClose")
                            })]
                        })]
                    })
                },
                iw = window.Roblox["core-scripts"].meta.user,
                iE = {
                    AgeVerification: "ageVerification",
                    Enter: "Enter",
                    InvalidEmailCode: 9,
                    InvalidPasswordCode: 8,
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
                },
                iA = function(e) {
                    return ia.post({
                        retryable: !0,
                        withCredentials: !0,
                        url: "".concat(ip, "/v1/settings/verify/show-overlay")
                    }, {
                        showOverlay: e
                    }).then(function(e) {
                        return e.data
                    })
                },
                iS = function(e, t) {
                    return ia.post({
                        withCredentials: !0,
                        url: "".concat(ip, "/v1/settings/user-opt-in")
                    }, {
                        isUserOptIn: e,
                        isOptedInThroughUpsell: t
                    }).then(function(e) {
                        return e.data
                    })
                },
                ij = function(e) {
                    ox.sendEventWithTarget(e.type, e.context, function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var r = null != arguments[t] ? arguments[t] : {},
                                n = Object.keys(r);
                            "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                return Object.getOwnPropertyDescriptor(r, e).enumerable
                            }))), n.forEach(function(t) {
                                var n;
                                n = r[t], t in e ? Object.defineProperty(e, t, {
                                    value: n,
                                    enumerable: !0,
                                    configurable: !0,
                                    writable: !0
                                }) : e[t] = n
                            })
                        }
                        return e
                    }({}, e.params))
                };

            function ix(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iP(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }

            function iC(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }
            var iI = il.EnvironmentUrls.websiteUrl,
                iN = iE.ActionGenericSkip,
                iT = iE.ActionChangeEmail,
                ik = iE.ActionContinue,
                iB = iE.DescriptionAddEmailTextOver13,
                iL = iE.DescriptionAddEmailTextUnder13,
                iR = iE.HeadingAddEmail,
                iM = iE.LabelEmailInputPlaceholderOver13,
                iD = iE.LabelEmailInputPlaceholderUnder13,
                iH = {
                    pageName: oH,
                    isEmailVerified: !1,
                    isEmailSent: !1,
                    isEmailUpdating: !1,
                    origin: "",
                    userEmail: "",
                    userEmailInput: "",
                    userEmailInputPlaceholder: iM,
                    errorMsg: "",
                    titleText: iR,
                    bodyText: iB,
                    primaryButtonText: ik,
                    secondaryButtonText: iT,
                    daysUntilNextVerification: 0,
                    skipCallback: null,
                    pageState: null,
                    closeCallback: null,
                    callbackReady: !1
                },
                iU = (0, S.createContext)(iH),
                iV = function(e, t) {
                    var r = null;
                    switch (t.type) {
                        case n1:
                            return iC(iP({}, e), {
                                userEmailInput: ""
                            });
                        case n0:
                            return iC(iP({}, e), {
                                origin: t.origin,
                                skipCallback: t.skipCallback
                            });
                        case nZ:
                            return iC(iP({}, e), {
                                isEmailVerified: t.isEmailVerified,
                                userEmail: t.userEmail
                            });
                        case nW:
                            if (t.pageName === oL) r = {
                                heading: "Heading.ThankYou",
                                icon: "success-icon",
                                bodyText: ["Label.OverageVerification", "Label.VoiceChat"],
                                buttonStack: [{
                                    variant: n6,
                                    text: "Action.OK",
                                    callback: function() {
                                        t.close()
                                    }
                                }],
                                canClose: !1
                            };
                            else if (t.pageName === oR) r = {
                                heading: "Heading.ThankYou",
                                icon: "success-icon",
                                bodyText: ["Label.UnderageVerification", "Label.VoiceChat"],
                                footerText: "Label.ToggleFeatures",
                                buttonStack: [{
                                    variant: n6,
                                    text: "Action.Close",
                                    callback: function() {
                                        t.close()
                                    }
                                }],
                                canClose: !1
                            };
                            else if (t.pageName === oM) {
                                im(oT.successPage, {
                                    origin: e.origin
                                });
                                var n = ["Label.DateOfBirthUpdated"];
                                t.isSeventeenPlus && n.push("Label.AccessWiderVariety"), r = {
                                    heading: "Heading.VerificationSuccessful",
                                    bodyText: n,
                                    buttonStack: [{
                                        variant: n6,
                                        text: "Action.Close",
                                        callback: function() {
                                            im(oT.successPageClose, {
                                                origin: e.origin
                                            }), t.close()
                                        }
                                    }],
                                    canClose: !1
                                }
                            } else "EXTERNAL_EMAIL" === t.pageName ? r = {
                                heading: "Heading.VerifyEmail",
                                icon: "shield-icon",
                                bodyText: ["Label.EmailSent"],
                                buttonStack: [{
                                    variant: n6,
                                    text: "Action.Continue",
                                    callback: function() {
                                        t.dispatch({
                                            type: nW,
                                            pageName: oU
                                        }), t.poll()
                                    }
                                }],
                                userEmail: e.userEmail
                            } : "EMAIL_CONTINUE" === t.pageName ? r = {
                                heading: "Heading.VerificationPending",
                                icon: "shield-icon",
                                bodyText: ["Label.EmailSent"],
                                buttonStack: [{
                                    variant: n6,
                                    text: "Action.Continue",
                                    callback: function() {
                                        t.dispatch({
                                            type: nW,
                                            pageName: oU
                                        }), t.poll()
                                    }
                                }],
                                userEmail: e.userEmail
                            } : t.pageName === oU ? r = iP({}, t) : t.pageName === oH ? r = {
                                heading: "Heading.VerificationPending",
                                icon: "failure-icon",
                                bodyText: ["Label.PendingVerification"],
                                buttonStack: [{
                                    variant: n6,
                                    text: "Action.Close",
                                    callback: function() {
                                        t.close()
                                    }
                                }],
                                canClose: !1
                            } : t.pageName === oD ? (im(oT.failurePage, {
                                origin: e.origin
                            }), r = {
                                heading: "Heading.VerificationFailed",
                                icon: "failure-icon",
                                bodyText: [t.textKey || "Label.FailedVerification"],
                                errorState: !0,
                                buttonStack: [{
                                    variant: n6,
                                    text: "Action.Close",
                                    callback: function() {
                                        im(oT.failurePageClose, {
                                            origin: e.origin
                                        }), t.close()
                                    }
                                }],
                                canClose: !1
                            }) : t.pageName === ok ? r = {
                                heading: "Heading.VerifyAge",
                                icon: "shield-icon",
                                bodyText: ["Label.VoiceChatUpsell"],
                                buttonStack: [{
                                    text: "Action.SkipVoiceChat",
                                    callback: function() {
                                        t.dispatch({
                                            type: n8
                                        })
                                    }
                                }, {
                                    variant: n6,
                                    text: "Action.Continue",
                                    callback: function() {
                                        t.continue()
                                    }
                                }],
                                userEmail: e.userEmail,
                                displayCheckbox: !0
                            } : t.pageName === oV ? r = {
                                heading: "Heading.Error",
                                icon: "failure-icon",
                                bodyText: ["Label.GenericError"],
                                buttonStack: [{
                                    variant: n6,
                                    text: "Action.OK",
                                    callback: function() {
                                        t.close()
                                    }
                                }],
                                canClose: !1
                            } : t.pageName === oF ? (im(oT.tempBanPage, {
                                origin: e.origin
                            }), r = {
                                heading: "Heading.Error",
                                icon: "failure-icon",
                                bodyText: ["Label.VerificationDeclined"],
                                buttonStack: [{
                                    variant: n6,
                                    text: "Action.OK",
                                    callback: function() {
                                        im(oT.tempBanPageClose, {
                                            origin: e.origin
                                        }), t.close()
                                    }
                                }],
                                daysUntilNextVerification: t.daysUntilNextVerification,
                                canClose: !1
                            }) : t.pageName === o_ ? (t.useQRCode && im(oT.showQRCode, {
                                origin: e.origin
                            }), r = {
                                verificationLink: t.verificationLink,
                                useQRCode: t.useQRCode,
                                origin: e.origin,
                                redirectUrl: t.redirectUrl
                            }) : t.pageName === oG ? r = {
                                communityStandardsUrl: new URL("/info/community-guidelines", iI).href,
                                voiceFAQUrl: new URL("/info/voice-faq", iI).href,
                                requireExplicitVoiceConsent: t.requireExplicitVoiceConsent,
                                useVoiceUpsellV2Design: t.useVoiceUpsellV2Design,
                                voiceUpsellV1Keys: {
                                    heading: "Heading.LetsChat",
                                    enableVoiceChat: "Label.EnableVoiceChat1",
                                    followCommunityStandards: "Label.FollowCommunityStandards",
                                    implicitConsent: "Label.ImplicitConsentVoiceCollectionWithML",
                                    explicitConsent: "Label.ExplicitConsentVoiceCollectionWithML",
                                    learnMoreAboutVoiceRecording: "Label.LearnMoreAboutVoiceRecording",
                                    buttonStack: [{
                                        explicitDisable: !1,
                                        variant: n4,
                                        text: "Action.SkipVoiceChat",
                                        callback: function() {
                                            ij(oT.joinWithoutVoiceChat), t.close()
                                        }
                                    }, {
                                        explicitDisable: !0,
                                        variant: n6,
                                        text: "Label.EnableVoiceChat",
                                        callback: function() {
                                            iS(!0, !0), t.close()
                                        }
                                    }]
                                },
                                voiceUpsellV2Keys: {
                                    heading: "Heading.V2LetsChat",
                                    enableVoiceChat: "Label.V2EnableVoiceChat1",
                                    followCommunityStandards: "Label.FollowCommunityStandards",
                                    implicitConsent: "Label.V2ClickToConsent",
                                    explicitConsent: "Label.V2ClickToConsent",
                                    learnMoreAboutVoiceRecording: "Label.LearnMoreAboutVoiceRecording",
                                    buttonStack: [{
                                        explicitDisable: !0,
                                        variant: n6,
                                        text: "Label.V2EnableVoiceChat",
                                        callback: function() {
                                            ij(oT.enableVoiceChatUpsell), iS(!0, !0), t.close()
                                        }
                                    }, {
                                        explicitDisable: !1,
                                        variant: n4,
                                        text: "Label.V2JoinWithout",
                                        callback: function() {
                                            ij(oT.joinWithoutVoiceChat), t.close()
                                        }
                                    }]
                                }
                            } : t.pageName === oK && (r = {
                                title: "Title.CameraUpsell",
                                animateYourAvatar: "Description.CameraUpsell",
                                communityStandards: "Description.CommunityStandardsUpsell",
                                cameraPrivacy: "Description.CameraPrivacy",
                                implicitConsent: "Description.DefaultConsentCameraUpsell",
                                explicitConsent: "Description.ExplicitConsentCameraUpsell",
                                learnMore: "Label.CameraLearnMoreUpsell",
                                facialPrivacyUrl: new URL("/info/facial-animation-privacy", iI).href,
                                requireExplicitCameraConsent: t.requireExplicitCameraConsent,
                                useCameraU13Design: t.useCameraU13Design,
                                buttons: [{
                                    text: "Label.EnableCameraUpsell",
                                    explicitDisable: !0,
                                    callback: function() {
                                        ia.post({
                                            withCredentials: !0,
                                            url: "".concat(ip, "/v1/settings/user-opt-in/avatarvideo")
                                        }, {
                                            isUserOptIn: !0,
                                            isOptedInThroughUpsell: !0
                                        }).then(function(e) {
                                            return e.data
                                        }), ij(oT.enableAvatarVideo), t.close()
                                    }
                                }, {
                                    text: "Label.JoinWithoutCameraUpsell",
                                    explicitDisable: !1,
                                    callback: function() {
                                        ij(oT.joinWithoutAvatarVideo), t.close()
                                    }
                                }]
                            });
                            return iC(iP({}, e), {
                                pageName: t.pageName,
                                pageState: r
                            });
                        case nJ:
                            return iC(iP({}, e), {
                                errorMsg: t.errorMsg
                            });
                        case n$:
                            return iC(iP({}, e), {
                                isEmailUpdating: t.isEmailUpdating
                            });
                        case nq:
                            if (e.pageName === oB) return iC(iP({}, e), {
                                userEmailInput: t.value,
                                errorMsg: ""
                            });
                            return e;
                        case nX:
                            if (e.pageName === oB) {
                                var o = (0, iw.isAuthenticated)() && !(0, iw.isUnder13)(),
                                    i = "";
                                return e.skipCallback && (i = iN), iC(iP({}, e), {
                                    titleText: iR,
                                    bodyText: o ? iB : iL,
                                    primaryButtonText: ik,
                                    secondaryButtonText: i,
                                    errorMsg: "",
                                    userEmailInputPlaceholder: o ? iM : iD
                                })
                            }
                            return e;
                        case n2:
                            return iC(iP({}, e), {
                                closeCallback: t.callback,
                                callbackReady: !0
                            });
                        case n3:
                            return iC(iP({}, e), {
                                callbackReady: !0
                            });
                        case n8:
                            if (e.callbackReady) {
                                var a, l, c = e.pageName === oM || e.pageName === oL,
                                    u = c || e.pageName === oR;
                                (l = null == o$ || null == (a = o$.Roblox) ? void 0 : a.Hybrid) && l.Navigation && l.Navigation.navigateToFeature({
                                    feature: "close-veratad-modal-event",
                                    overage: c,
                                    verified: u
                                }), e.closeCallback && e.closeCallback(c, u)
                            }
                            return iP({}, iH);
                        default:
                            return e
                    }
                },
                iF = function(e) {
                    var t, r = e.children,
                        n = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = (0, S.useReducer)(iV, iH)) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    i = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(i = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); i = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        i || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return o
                            }
                        }(t) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return ix(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return ix(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        o = n[0],
                        i = n[1];
                    return (0, O.jsx)(iU.Provider, {
                        value: {
                            idVerificationState: o,
                            dispatch: i
                        },
                        children: r
                    })
                };

            function i_() {
                return (0, S.useContext)(iU)
            }

            function iG(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var iK = "__FN_nvfToKPAOuiV__",
                iz = "__FN_END_nvfToKPAOuiV__",
                iQ = new RegExp("".concat(iK, "(\\d+)\\|")),
                iY = new RegExp("".concat(iz, "(\\d+)\\|")),
                iZ = function(e, t, r) {
                    var n = function(e) {
                            for (var t = 1; t < arguments.length; t++) {
                                var r = null != arguments[t] ? arguments[t] : {},
                                    n = Object.keys(r);
                                "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                                    return Object.getOwnPropertyDescriptor(r, e).enumerable
                                }))), n.forEach(function(t) {
                                    var n;
                                    n = r[t], t in e ? Object.defineProperty(e, t, {
                                        value: n,
                                        enumerable: !0,
                                        configurable: !0,
                                        writable: !0
                                    }) : e[t] = n
                                })
                            }
                            return e
                        }({}, r),
                        o = {};
                    t.forEach(function(e, t) {
                        var r = t.toString(),
                            i = "".concat(iK).concat(r, "|"),
                            a = "".concat(iz).concat(r, "|");
                        n[e.opening] = i, n[e.closing] = a, o[r] = {
                            start: i,
                            end: a,
                            render: e.render
                        }
                    });
                    var i = function(e) {
                            var t = [],
                                r = iQ.exec(e),
                                n = iY.exec(e);
                            if (n && (!r || n.index < r.index)) return null;
                            if (!r) return [e];
                            r.index > 0 && t.push(e.slice(0, r.index));
                            var a = null == r[1] ? void 0 : o[r[1]];
                            if (null == a) return null;
                            var l = e.indexOf(a.end);
                            if (l < r.index + r[0].length) return null;
                            var c = i(e.slice(r.index + r[0].length, l));
                            if (null == c) return null;
                            t.push(a.render(c));
                            var u = e.slice(l + a.end.length);
                            if (u.length > 0) {
                                var s = i(u);
                                if (null == s) return null;
                                t.push.apply(t, function(e) {
                                    if (Array.isArray(e)) return iG(e)
                                }(s) || function(e) {
                                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(s) || function(e) {
                                    if (e) {
                                        if ("string" == typeof e) return iG(e, void 0);
                                        var t = Object.prototype.toString.call(e).slice(8, -1);
                                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return iG(e, void 0)
                                    }
                                }(s) || function() {
                                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }())
                            }
                            return t
                        },
                        a = i(e(n));
                    return null == a ? null : a.filter(function(e) {
                        return "" !== e
                    }).map(function(e, t) {
                        return (0, O.jsx)(S.Fragment, {
                            children: e
                        }, t)
                    })
                };

            function iX(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function iW(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }

            function iq(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function iJ(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return iX(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return iX(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function i$(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function i0() {
                return null != g || (g = "".concat(ic().apiGatewayUrl.replace(/\/$/, ""), "/experience-signals-ingest/public")), g
            }
            var i1 = function() {};

            function i2(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function i3(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var i8 = function(e, t) {
                    return e << 3 | t
                },
                i5 = i8(1, 2),
                i6 = i8(2, 2),
                i4 = i8(5, 2),
                i7 = i8(6, 2),
                i9 = i8(8, 2),
                ae = i8(1, 2),
                at = i8(2, 1),
                ar = i8(3, 0),
                an = i8(5, 2);
            i8(1, 2), i8(2, 1), i8(3, 0), i8(4, 2), i8(5, 2), i8(6, 0), i8(8, 2);
            var ao = i8(4, 0),
                ai = i8(6, 2),
                aa = i8(7, 2);
            i8(1, 0), i8(2, 2);
            var al = i8(1, 2),
                ac = i8(2, 2),
                au = i8(1, 2);
            i8(1, 2), i8(2, 2), i8(1, 2);
            var as = new TextEncoder,
                af = function() {
                    var e;

                    function t() {
                        var e;
                        if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                        e = [], "buf" in this ? Object.defineProperty(this, "buf", {
                            value: e,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : this.buf = e
                    }
                    return e = [{
                            key: "writeVarint",
                            value: function(e) {
                                var t = (void 0 === e ? "undefined" : i3(e)) === "bigint" ? e : BigInt(Math.trunc(e));
                                for (t < BigInt(0) && (t += BigInt(1) << BigInt(64)); t > BigInt(127);) this.buf.push(128 | Number(t & BigInt(127))), t >>= BigInt(7);
                                this.buf.push(Number(t))
                            }
                        }, {
                            key: "writeString",
                            value: function(e) {
                                var t = as.encode(e);
                                this.writeVarint(t.length);
                                var r = !0,
                                    n = !1,
                                    o = void 0;
                                try {
                                    for (var i, a = t[Symbol.iterator](); !(r = (i = a.next()).done); r = !0) {
                                        var l = i.value;
                                        this.buf.push(l)
                                    }
                                } catch (e) {
                                    n = !0, o = e
                                } finally {
                                    try {
                                        r || null == a.return || a.return()
                                    } finally {
                                        if (n) throw o
                                    }
                                }
                            }
                        }, {
                            key: "writeBytes",
                            value: function(e) {
                                this.writeVarint(e.length);
                                var t = !0,
                                    r = !1,
                                    n = void 0;
                                try {
                                    for (var o, i = e[Symbol.iterator](); !(t = (o = i.next()).done); t = !0) {
                                        var a = o.value;
                                        this.buf.push(a)
                                    }
                                } catch (e) {
                                    r = !0, n = e
                                } finally {
                                    try {
                                        t || null == i.return || i.return()
                                    } finally {
                                        if (r) throw n
                                    }
                                }
                            }
                        }, {
                            key: "writeDouble",
                            value: function(e) {
                                var t = new DataView(new ArrayBuffer(8));
                                t.setFloat64(0, e, !0);
                                for (var r = 0; r < 8; r += 1) this.buf.push(t.getUint8(r))
                            }
                        }, {
                            key: "toBytes",
                            value: function() {
                                return new Uint8Array(this.buf)
                            }
                        }],
                        function(e, t) {
                            for (var r = 0; r < t.length; r++) {
                                var n = t[r];
                                n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                            }
                        }(t.prototype, e), t
                }();

            function ap(e, t, r) {
                var n = new af;
                return n.writeVarint(i8(1, 2)), n.writeString(e), n.writeVarint(t), r(n), n.toBytes()
            }

            function ah(e) {
                var t = new af;
                if (t.writeVarint(ae), t.writeString(e.name), t.writeVarint(at), t.writeDouble(e.value), t.writeVarint(ar), t.writeVarint(e.timestampMs), e.attributes && Object.keys(e.attributes).length > 0) {
                    var r = function(e) {
                        var t = new af,
                            r = !0,
                            n = !1,
                            o = void 0;
                        try {
                            for (var i, a = Object.entries(e)[Symbol.iterator](); !(r = (i = a.next()).done); r = !0) ! function() {
                                var e, r = (e = i.value, function(e) {
                                        if (Array.isArray(e)) return e
                                    }(e) || function(e) {
                                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                                        if (null != n) {
                                            var o = [],
                                                i = !0,
                                                a = !1;
                                            try {
                                                for (n = n.call(e); !(i = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); i = !0);
                                            } catch (e) {
                                                a = !0, r = e
                                            } finally {
                                                try {
                                                    i || null == n.return || n.return()
                                                } finally {
                                                    if (a) throw r
                                                }
                                            }
                                            return o
                                        }
                                    }(e) || function(e) {
                                        if (e) {
                                            if ("string" == typeof e) return i2(e, 2);
                                            var t = Object.prototype.toString.call(e).slice(8, -1);
                                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return i2(e, 2)
                                        }
                                    }(e) || function() {
                                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                    }()),
                                    n = r[0],
                                    o = r[1];
                                if ("string" == typeof o) {
                                    var a = ap(n, i8(2, 2), function(e) {
                                        e.writeString(o)
                                    });
                                    t.writeVarint(i4), t.writeBytes(a)
                                } else if ("boolean" == typeof o) {
                                    var l = ap(n, i8(2, 0), function(e) {
                                        e.writeVarint(+!!o)
                                    });
                                    t.writeVarint(i7), t.writeBytes(l)
                                } else if ((void 0 === o ? "undefined" : i3(o)) === "bigint") {
                                    var c = ap(n, i8(2, 0), function(e) {
                                        e.writeVarint(o)
                                    });
                                    t.writeVarint(i6), t.writeBytes(c)
                                } else if ("number" == typeof o)
                                    if (Number.isFinite(o))
                                        if (Number.isInteger(o) && o >= -0x80000000 && o <= 0x7fffffff) {
                                            var u = ap(n, i8(2, 0), function(e) {
                                                e.writeVarint(o)
                                            });
                                            t.writeVarint(i5), t.writeBytes(u)
                                        } else if (Number.isInteger(o)) {
                                    var s = ap(n, i8(2, 0), function(e) {
                                        e.writeVarint(BigInt(o))
                                    });
                                    t.writeVarint(i6), t.writeBytes(s)
                                } else {
                                    var f = ap(n, i8(2, 1), function(e) {
                                        e.writeDouble(o)
                                    });
                                    t.writeVarint(i9), t.writeBytes(f)
                                } else {
                                    var p = ap(n, i8(2, 2), function(e) {
                                        e.writeString(String(o))
                                    });
                                    t.writeVarint(i4), t.writeBytes(p)
                                }
                            }()
                        } catch (e) {
                            n = !0, o = e
                        } finally {
                            try {
                                r || null == a.return || a.return()
                            } finally {
                                if (n) throw o
                            }
                        }
                        return t.toBytes()
                    }(e.attributes);
                    t.writeVarint(an), t.writeBytes(r)
                }
                return t.toBytes()
            }

            function ad(e, t, r) {
                var n = new af;
                n.writeVarint(ao), n.writeVarint(r);
                var o = !0,
                    i = !1,
                    a = void 0;
                try {
                    for (var l, c = e[Symbol.iterator](); !(o = (l = c.next()).done); o = !0) {
                        var u = l.value;
                        n.writeVarint(ai), n.writeBytes(u)
                    }
                } catch (e) {
                    i = !0, a = e
                } finally {
                    try {
                        o || null == c.return || c.return()
                    } finally {
                        if (i) throw a
                    }
                }
                var s = !0,
                    f = !1,
                    p = void 0;
                try {
                    for (var h, d = t[Symbol.iterator](); !(s = (h = d.next()).done); s = !0) {
                        var y = h.value;
                        n.writeVarint(aa), n.writeBytes(y)
                    }
                } catch (e) {
                    f = !0, p = e
                } finally {
                    try {
                        s || null == d.return || d.return()
                    } finally {
                        if (f) throw p
                    }
                }
                return n.toBytes()
            }

            function ay(e) {
                var t = new af;
                t.writeVarint(al), t.writeString("eventstream.enginetelemetry.EngineTelemetryBatchEvent"), t.writeVarint(ac), t.writeBytes(e);
                var r = t.toBytes(),
                    n = new af;
                return n.writeVarint(au), n.writeBytes(r), n.toBytes()
            }
            var am = /^[a-zA-Z_][a-zA-Z0-9_]*$/;

            function ab(e) {
                return am.test(e)
            }
            var ag = [],
                av = !1,
                aO = !1;

            function aw(e, t) {
                var r, n, o, i = e.map(function(e) {
                        return {
                            name: e.name,
                            value: e.value,
                            timestampMs: e.timestampMs,
                            attributes: e.attributes
                        }
                    }),
                    a = BigInt(Date.now());
                !0 === t || aO || "u" > typeof document && "hidden" === document.visibilityState ? (r = ay(ad(i.map(ah), [], a)).buffer, fetch("".concat(i0()).concat("/v1/events/single"), {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/x-protobuf"
                    },
                    body: r,
                    credentials: "include",
                    keepalive: !0
                }).catch(i1)) : (n = ay(ad(i.map(ah), [], a)), (o = function() {
                    var e, t, r, o, i, a, l, c, u, s, f, p, h;
                    return function(e, t) {
                        var r, n, o, i = {
                                label: 0,
                                sent: function() {
                                    if (1 & o[0]) throw o[1];
                                    return o[1]
                                },
                                trys: [],
                                ops: []
                            },
                            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                            l = Object.defineProperty;
                        return l(a, "next", {
                            value: c(0)
                        }), l(a, "throw", {
                            value: c(1)
                        }), l(a, "return", {
                            value: c(2)
                        }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                            value: function() {
                                return this
                            }
                        }), a;

                        function c(l) {
                            return function(c) {
                                var u = [l, c];
                                if (r) throw TypeError("Generator is already executing.");
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
                                            if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
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
                            }
                        }
                    }(this, function(d) {
                        switch (d.label) {
                            case 0:
                                if ("u" < typeof CompressionStream) return [2, {
                                    body: n.buffer,
                                    compressed: !1
                                }];
                                return (t = (e = new CompressionStream("gzip")).writable.getWriter()).write(n).catch(i1), t.close().catch(i1), r = [], [4, (o = e.readable.getReader()).read()];
                            case 1:
                                i = d.sent(), d.label = 2;
                            case 2:
                                if (i.done) return [3, 4];
                                return r.push(i.value), [4, o.read()];
                            case 3:
                                return i = d.sent(), [3, 2];
                            case 4:
                                a = new Uint8Array(r.reduce(function(e, t) {
                                    return e + t.length
                                }, 0)), l = 0, c = !0, u = !1, s = void 0;
                                try {
                                    for (f = r[Symbol.iterator](); !(c = (p = f.next()).done); c = !0) h = p.value, a.set(h, l), l += h.length
                                } catch (e) {
                                    u = !0, s = e
                                } finally {
                                    try {
                                        c || null == f.return || f.return()
                                    } finally {
                                        if (u) throw s
                                    }
                                }
                                return [2, {
                                    body: a.buffer,
                                    compressed: !0
                                }]
                        }
                    })
                }, function() {
                    var e = this,
                        t = arguments;
                    return new Promise(function(r, n) {
                        var i = o.apply(e, t);

                        function a(e) {
                            i$(i, r, n, a, l, "next", e)
                        }

                        function l(e) {
                            i$(i, r, n, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                })()).then(function(e) {
                    var t = e.body,
                        r = e.compressed,
                        n = {
                            "Content-Type": "application/x-protobuf"
                        };
                    return r && (n["Content-Encoding"] = "gzip"), fetch("".concat(i0()).concat("/v1/events/single"), {
                        method: "POST",
                        headers: n,
                        body: t,
                        credentials: "include",
                        keepalive: !0
                    })
                }).catch(i1)
            }

            function aE() {
                var e = !0,
                    t = !1,
                    r = void 0;
                try {
                    for (var n, o = ag[Symbol.iterator](); !(e = (n = o.next()).done); e = !0) {
                        var i = n.value.splice(0);
                        0 !== i.length && aw(i, !0)
                    }
                } catch (e) {
                    t = !0, r = e
                } finally {
                    try {
                        e || null == o.return || o.return()
                    } finally {
                        if (t) throw r
                    }
                }
            }
            var aA = "WwwCommon",
                aS = function(e) {
                    var t = e.publish,
                        r = e.captureException,
                        n = e.featureName;

                    function o(e, t, o) {
                        if (null != o) {
                            var i, a = (null != (i = Error) && "u" > typeof Symbol && i[Symbol.hasInstance] ? !!i[Symbol.hasInstance](o) : o instanceof i) ? o.name || "Error" : "UnknownError",
                                l = n ? "".concat(n, "_").concat(e) : e;
                            return null == r || r(o, {
                                error_counter: l
                            }), iq(iW({}, t), {
                                errorType: a
                            })
                        }
                        return t
                    }
                    return {
                        trackCounter: function() {
                            for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                            var o = iJ(r, 2);
                            t(o[0], o[1])
                        },
                        trackError: function() {
                            for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                            var i = iJ(r, 3),
                                a = i[0],
                                l = i[1],
                                c = i[2],
                                u = o(a, iq(iW({}, null != l ? l : {}), {
                                    severity: "error"
                                }), c);
                            t(a, u)
                        },
                        trackCriticalError: function() {
                            for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                            var i = iJ(r, 3),
                                a = i[0],
                                l = i[1],
                                c = i[2],
                                u = o(a, iq(iW({}, null != l ? l : {}), {
                                    severity: "critical"
                                }), c);
                            t(a, u)
                        }
                    }
                }({
                    publish: function(e) {
                        var t, r = Math.max(1, 10),
                            n = 250;

                        function o(e, t) {
                            console.error(e, t)
                        }
                        if (!ab(e)) return o('@rbx/web-telemetry: invalid featureName "'.concat(e, '"'), {
                                name: e
                            }),
                            function() {};
                        var i = [];
                        return ag.push(i), av || ("u" > typeof document && document.addEventListener("visibilitychange", function() {
                                "hidden" === document.visibilityState && aE()
                            }), "u" > typeof window && window.addEventListener("beforeunload", function() {
                                aO = !0, aE()
                            }), av = !0),
                            function(a, l, c) {
                                var u = "".concat(e, "_").concat(a);
                                if (! function(e, t) {
                                        if (!ab(e)) return !1;
                                        if (t) {
                                            var r = !0,
                                                n = !1,
                                                o = void 0;
                                            try {
                                                for (var i, a = Object.keys(t)[Symbol.iterator](); !(r = (i = a.next()).done); r = !0) {
                                                    var l = i.value;
                                                    if (!ab(l)) return !1
                                                }
                                            } catch (e) {
                                                n = !0, o = e
                                            } finally {
                                                try {
                                                    r || null == a.return || a.return()
                                                } finally {
                                                    if (n) throw o
                                                }
                                            }
                                        }
                                        return !0
                                    }(u, l)) return void o("@rbx/web-telemetry: invalid event name or attribute key", {
                                    name: a,
                                    attributes: l
                                });
                                var s = null != c ? c : 1;
                                if (!Number.isFinite(s)) return void o("@rbx/web-telemetry: value must be a finite number", {
                                    name: a,
                                    attributes: l
                                });
                                var f = l && Object.keys(l).length > 0 ? l : void 0;
                                i.push({
                                    name: u,
                                    attributes: f,
                                    value: s,
                                    timestampMs: BigInt(Date.now())
                                }), i.length >= r ? (void 0 !== t && (clearTimeout(t), t = void 0), aw(i.splice(0, r))) : void 0 === t && (t = setTimeout(function() {
                                    for (t = void 0; i.length > 0;) aw(i.splice(0, r))
                                }, n))
                            }
                    }(aA)
                });
            aS.trackCounter;
            var aj = aS.trackError;
            aS.trackCriticalError;
            var ax = function() {
                    if ("u" > typeof document) {
                        var e = document.querySelector('meta[name="page-meta"]');
                        return null == e ? void 0 : e.dataset.internalPageName
                    }
                },
                aP = function(e) {
                    return "string" == typeof e && e.length > 0
                },
                aC = function(e, t, r) {
                    var n;
                    "u" > typeof window && aj(e, {
                        key: r,
                        namespace: t,
                        internalPageName: null != (n = ax()) ? n : "unknown"
                    })
                },
                aI = function(e) {
                    var t, r, n, o, i, a, l, c, u, s, f, p, h, d = (t = tt(e), r = {
                        "!": e3().messages
                    }, n = t ? "!.".concat(t) : "!", i = (o = e3()).cache, a = o.formats, l = o.formatters, c = o.getMessageFallback, u = o.locale, s = o.onError, f = o.timeZone, p = r["!"], h = "!" === n ? void 0 : n.slice(2), f || e8 || !e5 || (e8 = !0, s(new U(V.ENVIRONMENT_FALLBACK, void 0))), (0, S.useMemo)(function() {
                        var e, t;
                        return t = function(e, t, r) {
                                try {
                                    if (!t) throw Error(void 0);
                                    var n = r ? e0(e, t, r) : t;
                                    if (!n) throw Error(r);
                                    return n
                                } catch (e) {
                                    return new U(V.MISSING_MESSAGE, e.message)
                                }
                            }((e = {
                                cache: i,
                                formatters: l,
                                getMessageFallback: c,
                                messages: p,
                                namespace: h,
                                onError: s,
                                formats: a,
                                locale: u,
                                timeZone: f
                            }).locale, e.messages, e.namespace),
                            function(e) {
                                var t = e.cache,
                                    r = e.formats,
                                    n = e.formatters,
                                    o = e.getMessageFallback,
                                    i = void 0 === o ? eJ : o,
                                    a = e.locale,
                                    l = e.messagesOrError,
                                    c = e.namespace,
                                    u = e.onError,
                                    s = e.timeZone,
                                    f = eZ(l, U);

                                function p(e, t, r, n) {
                                    var o = new U(t, r);
                                    return u(o), null != n ? n : i({
                                        error: o,
                                        key: e,
                                        namespace: c
                                    })
                                }

                                function h(e, o, h, d) {
                                    var y, m, b;
                                    if (f) {
                                        if (!d) return u(l), i({
                                            error: l,
                                            key: e,
                                            namespace: c
                                        });
                                        y = d
                                    } else try {
                                        y = e0(a, l, e, c)
                                    } catch (t) {
                                        if (!d) return p(e, V.MISSING_MESSAGE, t.message, d);
                                        y = d
                                    }
                                    try {
                                        var g, v = eq(c, e);
                                        return eY(v, y, o ? (g = {}, Object.keys(o).forEach(function(e) {
                                            var t, r = 0,
                                                n = o[e];
                                            t = "function" == typeof n ? function(t) {
                                                var o = n(t);
                                                return (0, S.isValidElement)(o) ? (0, S.cloneElement)(o, {
                                                    key: e + r++
                                                }) : o
                                            } : n, g[e] = t
                                        }), g) : o, {
                                            cache: t,
                                            formatters: n,
                                            globalFormats: r,
                                            formats: h,
                                            locale: a,
                                            timeZone: s
                                        })
                                    } catch (t) {
                                        return eZ(t, U) ? (m = t.code, b = t.originalMessage) : (m = V.FORMATTING_ERROR, b = t.message), p(e, m, b, d)
                                    }
                                }

                                function d(e, t, r, n) {
                                    var o = h(e, t, r, n);
                                    return "string" != typeof o ? p(e, V.INVALID_MESSAGE, void 0) : o
                                }
                                return d.rich = h, d.markup = function(e, t, r, n) {
                                    return h(e, t, r, n)
                                }, d.raw = function(e) {
                                    if (f) return u(l), i({
                                        error: l,
                                        key: e,
                                        namespace: c
                                    });
                                    try {
                                        return e0(a, l, e, c)
                                    } catch (t) {
                                        return p(e, V.MISSING_MESSAGE, t.message)
                                    }
                                }, d.has = function(e) {
                                    if (f) return !1;
                                    try {
                                        return e0(a, l, e, c), !0
                                    } catch (e) {
                                        return !1
                                    }
                                }, d
                            }(eW(eX({}, e), {
                                messagesOrError: t
                            }))
                    }, [i, l, c, p, h, s, a, u, f]));
                    return (0, S.useMemo)(function() {
                        return Object.assign(function(t, r, n) {
                            var o = tt(t);
                            return void 0 === n || d.has(o) ? d(o, r) : (aC("TranslationKeyNotFound", e, o), n)
                        }, {
                            rich: function(e, t) {
                                return d.rich(tt(e), t)
                            },
                            has: function(e) {
                                return aP(e) && d.has(tt(e))
                            },
                            dynamic: function(t, r) {
                                var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "";
                                if (!aP(t)) return aC("TranslationKeyNotFound", e, String(t)), n;
                                var o = tt(t),
                                    i = d.has(o);
                                return i || aC("TranslationKeyNotFound", e, o), i ? d(o, r) : n
                            },
                            html: function(t, r, n) {
                                if (!aP(t)) return aC("TranslationKeyNotFound", e, String(t)), null;
                                var o = tt(t);
                                if (!d.has(o)) return aC("TranslationKeyNotFound", e, o), null;
                                var i = iZ(function(e) {
                                    return d(o, e)
                                }, r, n);
                                return null == i && aC("TranslationMalformed", e, o), i
                            }
                        })
                    }, [d, e])
                },
                aN = function(e) {
                    return function(t, r, n) {
                        var o = e.find(function(e) {
                            return e.has(t)
                        });
                        return o ? o.dynamic(t, r && Object.fromEntries(Object.entries(r).filter(function(e) {
                            var t, r;
                            return "string" == typeof e[1] || "number" == typeof e[1] || (t = e[1], null != (r = Date) && "u" > typeof Symbol && r[Symbol.hasInstance] ? !!r[Symbol.hasInstance](t) : t instanceof r)
                        }))) : null != n ? n : ""
                    }
                },
                aT = function() {
                    var e = aI("CommonUI.Controls"),
                        t = aI("Verification.Identity");
                    return (0, S.useMemo)(function() {
                        return aN([t, e])
                    }, [t, e])
                },
                ak = function() {
                    var e = aI("Feature.VerificationUpsell");
                    return (0, S.useMemo)(function() {
                        return aN([e])
                    }, [e])
                },
                aB = function(e) {
                    var t = e.onHide,
                        r = e.onPrimaryAction,
                        n = e.onSecondaryAction,
                        o = e.onInputChange,
                        i = e.onInputFocus,
                        a = e.onKeyDown,
                        l = ak(),
                        c = i_().idVerificationState,
                        u = c.pageName,
                        s = c.titleText,
                        f = c.bodyText,
                        p = c.primaryButtonText,
                        h = c.secondaryButtonText,
                        d = c.userEmailInput,
                        y = c.userEmailInputPlaceholder,
                        m = c.userEmail,
                        b = c.errorMsg,
                        g = c.isEmailUpdating;
                    return (0, O.jsxs)(j().Fragment, {
                        children: [(0, O.jsx)("div", {
                            className: "modal-header",
                            children: (0, O.jsxs)("div", {
                                className: "email-upsell-title-container",
                                children: [(0, O.jsx)("button", {
                                    type: "button",
                                    className: "email-upsell-title-button",
                                    onClick: t,
                                    children: (0, O.jsx)(tb, {
                                        name: "icon-regular-x",
                                        size: "Large",
                                        className: "idv-close-icon"
                                    })
                                }), (0, O.jsx)(nz, {
                                    className: "modal-title",
                                    children: l(s)
                                })]
                            })
                        }), (0, O.jsxs)(nK, {
                            className: "modal-body",
                            children: [(0, O.jsx)("div", {
                                className: "email-upsell-image"
                            }), (0, O.jsx)("p", {
                                className: "email-upsell-text-body",
                                children: l(f, {
                                    emailAddress: m
                                })
                            }), u === oB && (0, O.jsx)("input", {
                                type: "email",
                                autoFocus: !0,
                                className: "".concat(b ? "input-field-error" : "", " form-control input-field email-upsell-modal-input"),
                                placeholder: l(y),
                                value: d,
                                onFocus: function() {
                                    return i()
                                },
                                onChange: function(e) {
                                    return o(e.target.value)
                                },
                                onKeyDown: function(e) {
                                    return a(e.key)
                                }
                            }), b && (0, O.jsx)("p", {
                                className: "text-error modal-error-message",
                                children: l(b)
                            })]
                        }), (0, O.jsx)(nQ, {
                            className: "modal-footer",
                            children: (0, O.jsxs)("div", {
                                className: "email-upsell-footer-container",
                                children: [u === oB && (0, O.jsx)(oj, {
                                    className: "modal-button email-upsell-btn",
                                    variant: "cta",
                                    isDisabled: g,
                                    onClick: r,
                                    children: l(p)
                                }), h && (0, O.jsx)("button", {
                                    type: "button",
                                    className: "change-email-button",
                                    onClick: n,
                                    children: l(h)
                                })]
                            })
                        })]
                    })
                },
                aL = function(e) {
                    return "string" == typeof e ? e : e.src
                },
                aR = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJAAAACQCAYAAADnRuK4AAAACXBIWXMAACE4AAAhOAFFljFgAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAA86SURBVHgB7Z3dUhzHFcdPz8wS5A8JruLKTVZ+AbO+iI0s5MUSsl25CLgq1wJfpXID8gNEix/Awi9g4ScQvrMlJNZGkZRUEqGq3GtT5ZtUqgz6MoKd6c45s4DQemF6pntmetH5VUnLR8MsM/855/Q53WcAGIZhGIZhGIZhGIZhGIZhGIZhGIZhGIZhGIZhGIZhGIZhGIZhGIZhmH5CgCOs1+tDEIQjHkBdCPFbBWIEhBoSCqp7gxRsKCFaAtQGfv++FKoJXntt+Nu7LSiQ9fq7VahU6h6+RyEUvlcYERKG8GwO7b1VAS38bwO/31JS3ZcATQiDteFmcwOOEKUKiEQTVMILKIZJ/LQO2Wnh7/hG+tsLeYlp/dzpeuB570tQ0y+IOj1NT4jF9rb3zVEQUykCioUzIGfxzpzbf9daohkpNT+8fKsJFiDh+EJcAjOB/xK0pvi3L0V+e75oC2qTwgX0+PyZSzkJp5smXpyZrBcnN+H0ZrFfhVSYgNYnTo0EEFxRoEagSIRYiLa9eV13QdbRH5CXQKHIi6WFrq3x2rUfvoY+ohABPZ44M4vCWYDyaOEdPp50h69/VK/6UbSCH1ahLFDwx6/9cBH6hFwFFN/Nv4oug4RpKJ+NSMDM8LXVpV7ffHR+bBLf55UCXGsiOCFYwwnBVD+4tNwE1JlhyZXCXVYSQkwf73ITT86fuSCVWgS30LKaZZOLgJxwBYexT0SOimcX50VkXUDGlkepJibmvpdKrEGEScLm85MXJ/CCoOoJeAtzMXU09Zh0zOZyIohq9OqDfw8yoHAajsdewr9zTYL8Htpy44X3ipMGUN5QJzEK7+OprkMGYnfW9sZdzRlZF9Cj82cup53B0MXA/7+UYbCQ9kStT4xNe0rNYvY6rWBbO69VSAMKPAKYT5tVJqvsheE0Wr8LIr1lXjx+fXUGHMSqgDLOthajtn/R9A6LhQRwSeTkNtEqttDVzZgmKMlCe0E4Jzo5Jv3je3DxxHerZc5ke2JNQGnjHrI60jt4VpTpPdDF8cOG8MQsWESRdWwHDZtuJLZIeL5SCH4Db7STrrkyDyzhhVEDdMVDd3PQrtkUD0En98SNW3MKSxlgCfpdJ67fmrN94Ya/bbZk269RjKP5I0N+BVMijmHFAu1Ynwc6Y4sKCh+eO91I6ya6UUpePLH819zdxqOJMbLcdZ2xWOcbt1Xns4EVC7RjfRKJLU9BM4oTy7caJpYotjwFiIdA1zSlngf1h+Jbds+mGFsgXesTxzzktgrOaaS5u/dQsHR8eXUKCiQ+j2F0TycTjoIbdiUWMrZA8dRUC1lKtTnN3U3Q2ChoF16LopiIgnWdsTSLA0cwFxDAH5LG0EUpyh10Q3eqhEjbmtDYsjK/sdvVEDvGdu+DIxgJiMyu0kjg4R/cgBIZvn57LcKAOGkcxT00FspESR0rVI+XADuAkYAw9qlrDNs47sAal2G0gBiHHfY+FskCQMnIsLIYr1ZMwK9sT4IDGAlIyeR6lxTwPTiCDP25Xi5CdYqW1nJHJsTBsYBEK6jAc2KVg5GAMOP7VtIYD8RVcIS9eKjrDpeOVbwx//RN4hghquAAZgJSKnnKKeV/wCHieAhnhLufU7LQteUS8XalBDwFiTdvEQRgAGaVq4mDsGoNjkHx0MOzp6t0+5Q1OzwUf2ADoihpVP8H0TpJL1fXscgoaFCBFByEckIaw5wQkJEF6meO2g7RsrBWjWdeTkxdWCtpSLwMlUkFJWg1hh2NWlgiFc8JX91XhGE1aQhOYFrgAGYCkskJLx/ArW09fYCvROJNJ5TsfwuEGdyHyWPcyJj2E1iVryeOEXAfHMDQhclECyRAOJHw6id0MvyYAW2BAxgJSOqt53WmctwP7JyretI4qb+WOlfMLBBlmfuoctwP+L7WCgdwZV20kYB0K8d4Wi4AowXGNsk3m0qulRWF8TRep3KMjLAbS4byP0JA4s2GQbbOOS8EYwHJoLKkMWzIpXW8rqK5QE+rWl8UxgLaKfw1k8YJIdiNJZO4j40Wv5W+7HYfVjLRSimdVYdVaqUCTE8eTYxNg8bO3rLXl3djRUDUVUNnNiaVagBzEFq7aCNv25klwoQVAdFsDE2rTmBXffjhGMdCXehaH2TRtdWT9rpzdNrirmgMdbLLRBrUvfrQkyfBiO+rSXQpmDUWVfxq9fkIKnSqFrr2+wr85qunrh040Yj7SFYianJVPfCAg5jPfwOD7N9XlsSvqU528PGiSCy9PrbchIKw2h9Iextxn3Ui3WXzzkdVpdpoQcWFNJ3ROt3MFIqoMn9s9NvW/u/FfbMPcu1DAvxRH0TNAzGY5lKRoGSz1/FsY1VAKayQc10mDoMsztZWgBcaLLhf6sfYubAH9hVAsfjjPngoHpvHgxyw3+JOv5lBC11ZzXVX9nj1XD0IxJUXXYYpohWGakZ9voW/90XXJaoonqkKiGGbl6ZzvDxcm/UFZZHv6/byq8Yd4R3m2d2zs0EAK3bFQ6gq/V60MtX9XyWLE3w6YFk8z4+3eeec9fNtXUBxlwndvjxKzZHbAwfZ+ts5dFki1y0/3ngQu6q9jz/OfY9Dw7aI8ukTTb0KcWah2f9vI/KL7xt0GE9vn5/0hCxsR628F4FXsxHvaB5PeVOHzQzTkF+n+hQBtUu9kGmmhY44B7flDnjRMW8X1GwE1rktqqcZlpJ6DZMEqBFX4iGp2o2jLB5CxZsSwytggVx3ZdDuT+3uYBgPUU4ESuTJrYlpL0XRt9MgHSjeGx8cDIePjS4LeqXPMQ78kpJ7YBHLx6vTDBMMyc2F7ZLGlcX0eBhKUWCAqd1PkS7YsWNRQ9QOd7v4OxugWedKYB7FsmD5eE0U4TgYkLuAiPVz7835wtPucVxGkrET+4QP9EbLmWOjNxdBk807H0yjsTdwGfkdjyxYkigPo5CtzdQNgzqf6o5Hi3U1flhJgSilt25bSphPczEJGi+EzFS6yft4m5vBNBhQ2N74KPRnUnRLHfLBXylSRJ6n07hStV59b7kBGRh89+aCPLzF3i+Phm7S5HigtdBPGW27KkxAcXcw3x/XWTe0Q6EiklJUk8b4HjTAgO2tcA4DYc3VhKpFMRYYoLde3auDAYV256AsdQQqTQPvwkSE1fXEY1QGIqPF7MPjTazKh1Mq4SbqfD8aN4lNCHRjiWEDplCMNjsU3t6FguMIIM2zrzoicqDkYXpBiWOjcUPxQ//+wFdzNA4sHCtpjDJsVFVKf6Dh66uLKZ9jMUSpgEdHZE31q6dukGXo+fdT0Dzwzo3S2yLrUlqDqUwPQ1FqMa9ko9KIzTbvaPXt0QLzLw34ZZDbzBo090Ln/QrDPkOldijLIiJavZeHiIQQiSfSE4HVRhHPnoVTz7PH9Bqmce0aBCeTRuDMsAUGlN7iLquIHp0fu2pztysGnImzo0gqo6xtNxRUR1HnOR70aiPu2UXd/lDgeUp8jgli1IbZiR6J2dwZTNJi9PWP7LTQU0po9Nux/5CT104316IorNErWOTnQQk671c/rdAbZ5psZnxAXNWPKivr58dsdP9oJg2gqb6NAmQ3tsWj/v1HqIQwopOawKC9CQY41aU1s4gUXDWNizAeWdMJpCsVcOqJgT15tinaoUx8nxRAm66Tdq7NL4lI59FM3ezFRRldGsUjOpsjUWST23+fKLROlwbaIfSsHVZ1lqVgPsp4VaKTfaKp+BpJmEpR9uhAcRG5tIyZa0/Aos64KFLOPT15j3/+Q0jV1rHGCkVmLKBClnNkJcOz1fegJgSvX/shrTvE3MnZB52dn4djc12xLSj2efpwY8b31Fcaox8cG73xJhjidKf6+NnqWIBNUcXfI3ZpE2MP0rq0zsq+ZHwhr3TWELlB7LoePz6JBd+/6AzHcalvrl44/6iDWERtv6a7vroLmqXdS9PQIVoIT6h1lTjO5rpiK9y+jXmf9hd667lVy1a5xGkX1s3Dc6cb6JqyzrYW6amEB20f2tlmTIKoeyNYvv1Ee49WA8sSVu7mrKh7k7C9/aSBU3Kt2Add3MxLKSCCqvIY/F3JEhcBbWdB033iu9WF/V98PHFmNm5wsK9hgj9TAe+knoHGCzJdVgFU3f0YtmB7DhOhmoG9ndhnl74TENEJruVV2g4E2aBnpI5DGFT9jkWrdw8QbwgI/jwAuvi+qA387rrVhGASFDT//HCj5nnqX7o/gm73TZslk74U0C6GLi0Rb5S2G+vtGKWknOeL8aJEtDPjqnlC3dRtNUNLRWxW+4m+FhCxfnZs0vPgckaXlkgaV1aUiLKIB9/bvcHR5bfBMn3/wLnhG6tL8VQ/5YJ1XeTVEHRmZQTNzGSkVvLMVGcRD8U9CsJPIAf63gLtJ95/Bt4lEGbLNLsRvxEbwZ8GtH8nWaJIeTO2E40knvbTn6bDSFxO0SFNRTJ8+7X3mrlYxb63QPuJSyCBXwMwqzC/gFLN8L/btTT7usgSUXcPm61U4tnWk5/mIokz0BTiQcv8WV7iIY6UBdqPqTXqVObl/P7HgmfcpmycJ6LFYVte9EXaFnt5BM3dHFkBEfF0P4waOs+feAEFS1HQvtgr6ZhRRE2AYCZtO5W4PHH37kmcelNtq57mZ4sQD3GkBbTL+sTYNPrqS0kzNaq5SaVmkvblZxMRdU71x3VFpB5Mw5MffxwPAvEVpGw3U5R4iJdCQETcNS0I53rljTruSn1JHfd1m1wZdN1IdGnps8vPKVI8xEsjoF123Rp+GC84x2z2WhSEM1la7BmIqNnLpZm4LKJo8RAvnYBsk11E5NIEWqNrcf5qx+rMSikaIn3gH8+2Xjm1vAAFwwKywNPbZycFpJpe70MthqH4OgigZ00u8acVrPu++vRX79woZXEbC8gSnV2g/orOakZ7qAcA0Qc2i6NpOVKJxDLpXMRo3HSfVQpWBgejt8sUD8EWKAcs9kXsCQY8C6+cuuHEw2pYQDnR6VNIKQNRBUtQvINx1ieYBmiCI7CAcqQTFwXxMlkwB+Or8NOyXVY3LKACMHFpZHXw5fMypug6sIAKQKk6JggBE4T+zZQuzUmrsx8WUIF0koVbVKKYPUxIrlud/bCACmbHGlWl8hu996+rKzg9/8xGP8YiYAGVRLy68Of/1aIo+AI6QXYT/827NMNiGIZhGIZhGIZhGIZhGIZhGIZhGIZhGIZhGIZhGIZhGIZhGIZhGIZhjh7/Bz0AaFoqKxS1AAAAAElFTkSuQmCC";

            function aM(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var aD = function(e, t, r, n, o) {
                var i, a = function(e) {
                        if (Array.isArray(e)) return e
                    }(i = (0, S.useState)(!o)) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var o = [],
                                i = !0,
                                a = !1;
                            try {
                                for (n = n.call(e); !(i = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); i = !0);
                            } catch (e) {
                                a = !0, r = e
                            } finally {
                                try {
                                    i || null == n.return || n.return()
                                } finally {
                                    if (a) throw r
                                }
                            }
                            return o
                        }
                    }(i) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return aM(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return aM(e, 2)
                        }
                    }(i) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    l = a[0],
                    c = a[1];
                return [(0, O.jsx)("div", {
                    className: "checkbox checkbox-container",
                    children: o ? (0, O.jsxs)(j().Fragment, {
                        children: [(0, O.jsx)("input", {
                            type: "checkbox",
                            checked: l,
                            onClick: function() {
                                c(!l), iA(l)
                            },
                            id: "isShowOverlayChecked"
                        }), (0, O.jsx)("label", {
                            htmlFor: "isShowOverlayChecked",
                            className: "voice-modal-checkbox-label",
                            children: e(n, {
                                linkStart: "",
                                linkEnd: ""
                            })
                        })]
                    }) : (0, O.jsx)("span", {
                        children: e(r, {
                            linkStart: "",
                            linkEnd: ""
                        })
                    })
                }), t.map(function(t) {
                    var r = t.variant === n6;
                    return (0, O.jsx)("span", {
                        children: (0, O.jsx)(oj, {
                            className: n9()("button-stack-button", {
                                "primary-link": r,
                                "secondary-link": !r
                            }),
                            variant: t.variant,
                            isDisabled: o && t.explicitDisable && !l,
                            onClick: t.callback,
                            children: e(t.text)
                        })
                    }, t.text)
                })]
            };

            function aH(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var aU = function(e) {
                var t, r = e.translate,
                    n = e.communityStandardsUrl,
                    o = e.voiceFAQUrl,
                    i = e.requireExplicitVoiceConsent,
                    a = e.heading,
                    l = e.enableVoiceChat,
                    c = e.followCommunityStandards,
                    u = e.implicitConsent,
                    s = e.explicitConsent,
                    f = e.learnMoreAboutVoiceRecording,
                    p = e.buttonStack,
                    h = e.useVoiceUpsellV2Design,
                    d = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = aD(r, p, u, s, i)) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var o = [],
                                i = !0,
                                a = !1;
                            try {
                                for (n = n.call(e); !(i = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); i = !0);
                            } catch (e) {
                                a = !0, r = e
                            } finally {
                                try {
                                    i || null == n.return || n.return()
                                } finally {
                                    if (a) throw r
                                }
                            }
                            return o
                        }
                    }(t) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return aH(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return aH(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    y = d[0],
                    m = d[1];
                return (0, S.useEffect)(function() {
                    ij(oT.showEnableVoiceChatModal), ia.post({
                        withCredentials: !0,
                        url: "".concat(ip, "/v1/settings/record-user-seen-upsell-modal")
                    }, {}).then(function(e) {
                        return e.data
                    })
                }, []), (0, O.jsxs)(j().Fragment, {
                    children: [(0, O.jsx)("div", {
                        className: "modal-header",
                        children: (0, O.jsx)("div", {
                            className: "email-upsell-title-container",
                            children: (0, O.jsx)(nz, {
                                className: "modal-title",
                                children: r(a)
                            })
                        })
                    }), (0, O.jsxs)(nK, {
                        className: "modal-body",
                        children: [(0, O.jsxs)("div", {
                            children: [(0, O.jsxs)("div", {
                                className: "legal-enable-page-row",
                                children: [(0, O.jsx)("img", {
                                    width: 60,
                                    height: 60,
                                    src: aL("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAJAAAACQCAYAAADnRuK4AAAACXBIWXMAACE4AAAhOAFFljFgAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAfQSURBVHgB7d1NU1NXGAfw51xbQdtRP0LYuFW6bp0w06o4XdC9MyUVBcaF2C8A9AMUWahhBBJn3Oui4/sMsbqWfgPyERDQEiT39Dw32Fq4Se7lnPtyTv6/GcYxYEbNP+c57yECAAAAAAAAAAAAAAAAAAAAAMjAw6lT9GxsjsAoj3rB86tn6djmKkmaIjDK/QA9v3qDfLlKJAoExn1BruKSdWzroQpPkSAxbgboyViRxGYlN60Oh7l/Y0Q1+AXyvDXyvVc0XK6TA9wrYc/GpknQSm7C8+zaz3R8c42EV1F/r2mSfpXEx5XgcQcIcsWTiQKJXdXqULHjz11cTO/fzJ33oP/VhqQhGl6skcXcaIEeXxsh7yO/UEXKE192njbgFslydveBuG9xfIvLwhTJXDamxY7fFXSWLGdvgIKSpUZZ0uIXQdIpspydJYzndloly/p3sO3saoE+lSxfTrnU/7eZPQEKRjSbqmSJAkFu2FHCsByRW/lugbAckXvmAxQsIwg1y+oX9VuMLYJ8Mxeg/80ES3Kik+vwGpYpZvpA3MHNeiZYyHUyyfE1LFP0A8Qtj/RX1Ogow0kxWSe/OUim8BuCA3Pg3yQKweNcpiGgHyB+V2YZHl/O098qPMPVOpnSA2tYpuj1gR5fGclsaM0lq0klurT0iMwrdvyuA2tYpugFSNAIZaOmSpYKj8FWJw4H1rBM0QyQOENp45J1aQmb43NCdxifYlOuOspScMmqEeRG8jPRae4AhNT1xrkwSAwCBFoQINCCAIEWBAi0IECgBQECLQgQaEGAQAsCBFoQINCCAIEWBAi0IECgBQECLQgQaEGAQEvyOxKfjkkyYm9Lq+V3CrpGswVSL2pqRCG4fZVvYYXc0AuQFK8obZJm6OmVteBELGROtw9UpUyIQqLn1AWZPWfvML0AtfojNcqEaJ1TT+ITeCT91eUnagQB/VGY3C1l+o7lT+AxXdIkzXb8viduEgT0A8SXGggxlG2zLwrk7a6SKdyySr90YJDA5/F5JHj+XrcWqmeYmQfi/1B/dzDdUdk+ps+rDy9XSTaHgiBxi8S/fmgO0PC9KsG/zJ8a5Rs7+NKF1rn5/N1ikeZJ2ShzYJaf3DU/kdi6bsXMlStPRgtER2Zady5CHuV7KYP7V8NLo107tZAZO9bChhdn1GhvINM+FoSyZzGVWyO+yk7K+wS5Yddq/E/V9aCk+f5NzBbng53bOS4t38p82gAC9u4H4pJ2cWkg1x3sHmgl7d9QFnSwQ2aN86AH1tTc2JH4adaYKF9LDD2wpubOltagpC0O5qqk9cCampsXYAafGCQroZegZ7F0EMyoe8XgQ1vIr9O2/ygYUTrA3RtU2y2D4NZYo9w9lYFlkFS4f6wHyyCJ6o1zYVgGAQAAAAAAAAAzKpXKqYWFBfMnbFOA+4Eydvfu3UKj0ViVUlr5MZ4IUIbK5fIN9QufqC2QpZK/YAoO4JK1s7Mzza2OEHav7SJAKdsrWStkcavzOZSwFLlQsvZDC5QCl0rWfghQwlwrWfuhhCXIxZK1H1qgiFRLUhSt7bFFihEIUyVr8/y5aenvzRV5onLi+Z+/UkxypEhbH/zPn6eqnkfrZAj2B3fBJUiFoEKt4CRqYmIi9PXYOH9ujg5ONFZOvHj9C0W08WNR0MfmMvk0+vnjql82e/Llmxk6JJSwDm7fvs0XZHEJKlKWfDka8mhp44fvlimCduFh6s1xgzQgQG1wy+N53or6DzZ2dZ56t6+r5zN5mLBriDqFxwQEqA31QhsNj1JXX4Pj4+O34vwh7rdIkvMdfqRtiKKERz231j5xBCjEnTt3RsjsyGm+r69vcHJysk4xiUc1Ev1fzEqiTi/0gRBFCo+k+ydfvNFaxMUoLIRqeUbafY87nf39/bdKpVJqJ0tP/FGTKhAl2WjyqKfdfZEcIuKOdbSWh6onX74ukSYEKNyZsAe5/6JGSrFKkCkxQsThoa7heaEfHoYSFkIFJfR64qNHj1YpQxwi0Xek1KWcjaYVHoYAxZBm2WonYohCmQ4PQ4DyI/IH8x0mREmEhyFAlooToqTCwxAgywmve8slYrRucSFAloo5wxx52SMuBMhCh1yeSCRECJBlNNe2jIcIAUqZWqQ99BaaqMsTcZc9dCBAloixPDEaYXRmLEQIUAy8OZ4yEDk8e0P1iEN8DlGFNCFA4ephD25vb6d+/PjdhQtC7Pi/x12eiLrs8e77b2dIAwIUQq24vwp7XK2RTS8sLEyl2RJ92WySDN+RGOg0SRglRLo7ErEaH65KbVa8VbjmGo3GXLlcphjm+vr6fjO9lhZlhjniKv6hoQUKMTk5WSOzH4RyU4XuLW+TpZiOfb0rw3Ykxlme6NQSYUdiQlRLU+I9zGTOgOd5b9VXrH4U70ikI1/NqjI2r5K03vqSs3HXtjhE5B0vHXwevR2JONbTAZ/KML2xvgM5MTFh3RsaLVAH169f50/TGaQ2ozJACxQZb7Tf2yt9pt2ORU1WtkAIUEIePHhA79+/n1L9jGn12yglECUM/nP58mU6ffo0b8D/hhwugQhQgoaGhmh8fHxNzWBzP2qeHISJxITt3c6xrkralCpp9RglzQpogVLiaklDgFLkYklDCUuZayUNLVBGXClpCFCGemGUBgAAAAAAAAAAAAAAAGCrfwBoU3kSiC+JuAAAAABJRU5ErkJggg=="),
                                    alt: ""
                                }), (0, O.jsx)("p", {
                                    className: "legal-enable-page-row-label",
                                    children: r(l)
                                })]
                            }), (0, O.jsxs)("div", {
                                className: "legal-enable-page-row",
                                children: [(0, O.jsx)("img", {
                                    width: 60,
                                    height: 60,
                                    src: aL(aR),
                                    alt: ""
                                }), (0, O.jsx)("p", {
                                    className: "legal-enable-page-row-label",
                                    dangerouslySetInnerHTML: {
                                        __html: r(c, {
                                            linkStart: '<a class="text-name" target="_blank" rel="noreferrer" href='.concat(n, ">"),
                                            linkEnd: "</a>"
                                        })
                                    }
                                })]
                            })]
                        }), y]
                    }), (0, O.jsx)(nQ, {
                        className: "modal-footer",
                        children: m
                    }), (0, O.jsx)("div", {
                        className: "text-footer legal-enable-page-text-footer border-top",
                        children: (0, O.jsxs)("span", {
                            children: [(0, O.jsx)(tb, {
                                name: "icon-regular-circle-question",
                                size: "Large",
                                className: "idv-footer-icon"
                            }), (0, O.jsx)("a", {
                                className: "text-link legal-enable-page-text-footer-link",
                                target: "_blank",
                                rel: "noreferrer",
                                href: o,
                                onClick: function() {
                                    return h && ij(oT.learnMoreAboutVoiceRecordingUpsell)
                                },
                                children: r(f)
                            })]
                        })
                    })]
                })
            };

            function aV(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function aF(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function a_(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return aV(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return aV(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var aG = function(e) {
                var t = e.translate,
                    r = e.onHide,
                    n = e.verificationLink,
                    o = e.useQRCode,
                    i = e.origin,
                    a = e.entry,
                    l = e.redirectUrl,
                    c = a_((0, S.useState)(), 2),
                    u = c[0],
                    s = c[1],
                    f = a_((0, S.useState)(!1), 2),
                    p = f[0],
                    h = f[1];
                (0, S.useEffect)(function() {
                    var e;
                    (e = function() {
                        var e;
                        return function(e, t) {
                            var r, n, o, i = {
                                    label: 0,
                                    sent: function() {
                                        if (1 & o[0]) throw o[1];
                                        return o[1]
                                    },
                                    trys: [],
                                    ops: []
                                },
                                a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                                l = Object.defineProperty;
                            return l(a, "next", {
                                value: c(0)
                            }), l(a, "throw", {
                                value: c(1)
                            }), l(a, "return", {
                                value: c(2)
                            }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                                value: function() {
                                    return this
                                }
                            }), a;

                            function c(l) {
                                return function(c) {
                                    var u = [l, c];
                                    if (r) throw TypeError("Generator is already executing.");
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
                                                if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
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
                                }
                            }
                        }(this, function(t) {
                            switch (t.label) {
                                case 0:
                                    return t.trys.push([0, 2, 3, 4]), [4, n5.toDataURL(n, {
                                        errorCorrectionLevel: "H"
                                    })];
                                case 1:
                                    return s(e = t.sent()), [3, 4];
                                case 2:
                                    throw Error(t.sent());
                                case 3:
                                    return h(o && e), [7];
                                case 4:
                                    return [2]
                            }
                        })
                    }, function() {
                        var t = this,
                            r = arguments;
                        return new Promise(function(n, o) {
                            var i = e.apply(t, r);

                            function a(e) {
                                aF(i, n, o, a, l, "next", e)
                            }

                            function l(e) {
                                aF(i, n, o, a, l, "throw", e)
                            }
                            a(void 0)
                        })
                    })()
                }, [o, n]);
                var d = a === oY ? "".concat(n, "&redirect-uri=").concat(encodeURIComponent(void 0 === l ? "" : l)) : n;
                return (0, O.jsxs)(j().Fragment, {
                    children: [(0, O.jsx)("div", {
                        className: "modal-header",
                        children: (0, O.jsxs)("div", {
                            className: "email-upsell-title-container",
                            children: [(0, O.jsx)("button", {
                                type: "button",
                                className: "email-upsell-title-button",
                                onClick: r,
                                children: (0, O.jsx)(tb, {
                                    name: "icon-regular-x",
                                    size: "Large",
                                    className: "idv-close-icon"
                                })
                            }), (0, O.jsx)(nz, {
                                className: "modal-title",
                                children: t("Heading.IdentityVerification")
                            })]
                        })
                    }), (0, O.jsxs)(nK, {
                        className: "modal-body verification-link-page-content",
                        children: [(0, O.jsx)("div", {
                            className: "verification-link-upsell",
                            children: t("Label.AgeVerifyPrompt")
                        }), (0, O.jsxs)("div", {
                            className: "preparation-list-wrapper",
                            children: [(0, O.jsxs)("div", {
                                className: "preparation-list-item",
                                children: [(0, O.jsx)(tb, {
                                    name: "icon-regular-page",
                                    size: "Large",
                                    className: "idv-prep-icon"
                                }), (0, O.jsxs)("div", {
                                    className: "preparation-list-text",
                                    children: [(0, O.jsx)("div", {
                                        className: "preparation-title",
                                        children: t("Label.PrepareId")
                                    }), (0, O.jsx)("div", {
                                        className: "preparation-text",
                                        children: t("Label.ValidIdList")
                                    })]
                                })]
                            }), p && (0, O.jsxs)("div", {
                                className: "preparation-list-item",
                                children: [(0, O.jsx)(tb, {
                                    name: "icon-regular-smartphone-portrait",
                                    size: "Large",
                                    className: "idv-prep-icon"
                                }), (0, O.jsxs)("div", {
                                    className: "preparation-list-text",
                                    children: [(0, O.jsx)("div", {
                                        className: "preparation-title",
                                        children: t("Label.UseSmartphone")
                                    }), (0, O.jsx)("div", {
                                        className: "preparation-text",
                                        children: t("Label.SmartphoneRequired")
                                    })]
                                })]
                            })]
                        }), p && (0, O.jsxs)("div", {
                            children: [(0, O.jsx)("div", {
                                className: "verification-link-upsell",
                                children: t("Label.ScanQRCode")
                            }), (0, O.jsx)("div", {
                                className: "qr-code-wrapper",
                                children: (0, O.jsx)("img", {
                                    className: "qr-code-img",
                                    src: u,
                                    alt: "qr"
                                })
                            })]
                        }), (0, O.jsx)("p", {
                            className: "verification-link-legal",
                            dangerouslySetInnerHTML: {
                                __html: t("Label.PrivacyNoticeAndLink", {
                                    spanStart: "<a class='text-link' href='https://en.help.roblox.com/hc/en-us/articles/4412863575316'>",
                                    spanEnd: "</a>"
                                })
                            }
                        }), !p && (0, O.jsx)("a", {
                            href: d,
                            onClick: function() {
                                im(oT.verificationLinkClicked, {
                                    origin: i
                                })
                            },
                            target: a === oY ? "_self" : "_blank",
                            rel: "noreferrer",
                            children: (0, O.jsx)(oj, {
                                className: "primary-link",
                                variant: n6,
                                children: t("Action.StartSession")
                            })
                        })]
                    })]
                })
            };

            function aK(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var az = function(e) {
                    var t, r = e.translate,
                        n = e.onHide,
                        o = e.heading,
                        i = e.icon,
                        a = e.bodyText,
                        l = e.errorState,
                        c = e.footerText,
                        u = void 0 === c ? null : c,
                        s = e.userEmail,
                        f = void 0 === s ? null : s,
                        p = e.daysUntilNextVerification,
                        h = void 0 === p ? 0 : p,
                        d = e.canClose,
                        y = e.buttonStack,
                        m = e.includeLink,
                        b = e.displayCheckbox,
                        g = function(e) {
                            if (Array.isArray(e)) return e
                        }(t = (0, S.useState)(!1)) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    i = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(i = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); i = !0);
                                } catch (e) {
                                    a = !0, r = e
                                } finally {
                                    try {
                                        i || null == n.return || n.return()
                                    } finally {
                                        if (a) throw r
                                    }
                                }
                                return o
                            }
                        }(t) || function(e) {
                            if (e) {
                                if ("string" == typeof e) return aK(e, 2);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return aK(e, 2)
                            }
                        }(t) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        v = g[0],
                        w = g[1];
                    return (0, O.jsxs)(j().Fragment, {
                        children: [(0, O.jsx)("div", {
                            className: "modal-header",
                            children: (0, O.jsxs)("div", {
                                className: "email-upsell-title-container",
                                children: [(void 0 === d || d) && (0, O.jsx)("button", {
                                    type: "button",
                                    className: "email-upsell-title-button",
                                    onClick: n,
                                    children: (0, O.jsx)(tb, {
                                        name: "icon-regular-x",
                                        size: "Large",
                                        className: "idv-close-icon"
                                    })
                                }), (0, O.jsx)(nz, {
                                    className: "modal-title",
                                    children: r(o)
                                })]
                            })
                        }), (0, O.jsxs)(nK, {
                            className: "modal-body",
                            children: [i && (0, O.jsx)("div", {
                                className: i
                            }), (0, O.jsx)("ul", {
                                className: void 0 !== l && l ? "content-list error-text" : "content-list",
                                children: void 0 !== m && m ? a.map(function(e) {
                                    return (0, O.jsx)("li", {
                                        dangerouslySetInnerHTML: {
                                            __html: r(e, {
                                                spanStart: "<a class='text-link' href='/info/privacy'>",
                                                spanEnd: "</a>",
                                                boldStart: "<b>",
                                                boldEnd: "</b>"
                                            })
                                        }
                                    })
                                }) : a.map(function(e) {
                                    return (0, O.jsx)("li", {
                                        children: r(e, {
                                            age: 18,
                                            email: f,
                                            days: h
                                        })
                                    })
                                })
                            }), void 0 !== b && b && (0, O.jsxs)("div", {
                                className: "checkbox checkbox-container",
                                children: [(0, O.jsx)("input", {
                                    id: "isShowOverlayChecked",
                                    type: "checkbox",
                                    checked: v,
                                    onClick: function() {
                                        w(!v), iA(v)
                                    }
                                }), (0, O.jsx)("label", {
                                    htmlFor: "isShowOverlayChecked",
                                    children: r("Label.DontShowAgain")
                                })]
                            })]
                        }), (0, O.jsxs)(nQ, {
                            className: "modal-footer",
                            children: [u && (0, O.jsx)("p", {
                                className: "small",
                                children: (0, O.jsx)("b", {
                                    children: r(u)
                                })
                            }), y.map(function(e) {
                                var t = e.variant === n6;
                                return (0, O.jsx)("span", {
                                    children: (0, O.jsx)(oj, {
                                        className: n9()("button-stack-button", {
                                            "primary-link": t,
                                            "secondary-link": !t
                                        }),
                                        variant: e.variant,
                                        onClick: e.callback,
                                        children: r(e.text)
                                    })
                                }, e.text)
                            })]
                        })]
                    })
                },
                aQ = function(e) {
                    var t = ih();
                    return ia.post(t, e).then(function() {
                        return !0
                    }, function(e) {
                        return e.data.errors && e.data.errors[0].code
                    })
                },
                aY = function() {
                    var e = ih();
                    return ia.get(e).then(function(e) {
                        var t = e.data;
                        return null == t ? void 0 : t.emailAddress
                    }, function() {
                        return !1
                    })
                },
                aZ = function() {
                    var e = ih();
                    return ia.get(e).then(function(e) {
                        return e.data
                    }, function() {
                        return !1
                    })
                };

            function aX(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var aW = function(e, t, r, n, o) {
                var i, a = function(e) {
                        if (Array.isArray(e)) return e
                    }(i = (0, S.useState)(!n)) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var o = [],
                                i = !0,
                                a = !1;
                            try {
                                for (n = n.call(e); !(i = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); i = !0);
                            } catch (e) {
                                a = !0, r = e
                            } finally {
                                try {
                                    i || null == n.return || n.return()
                                } finally {
                                    if (a) throw r
                                }
                            }
                            return o
                        }
                    }(i) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return aX(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return aX(e, 2)
                        }
                    }(i) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    l = a[0],
                    c = a[1];
                return [(0, O.jsx)("div", {
                    className: "checkbox checkbox-container",
                    children: n ? (0, O.jsxs)(j().Fragment, {
                        children: [(0, O.jsx)("input", {
                            type: "checkbox",
                            checked: l,
                            onClick: function() {
                                c(!l)
                            },
                            id: "isShowOverlayChecked"
                        }), (0, O.jsx)("label", {
                            htmlFor: "isShowOverlayChecked",
                            className: "voice-modal-checkbox-label",
                            children: e(r)
                        })]
                    }) : (0, O.jsx)("span", {
                        children: e(t)
                    })
                }), o.map(function(t) {
                    return (0, O.jsx)("div", {
                        className: "half-flex",
                        children: (0, O.jsx)(oj, {
                            className: "button-stack-button secondary-link",
                            variant: n4,
                            isDisabled: n && t.explicitDisable && !l,
                            onClick: t.callback,
                            children: e(t.text)
                        })
                    }, t.text)
                })]
            };

            function aq(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var aJ = function(e) {
                var t, r = e.translate,
                    n = e.title,
                    o = e.animateYourAvatar,
                    i = e.communityStandards,
                    a = e.implicitConsent,
                    l = e.explicitConsent,
                    c = e.requireExplicitCameraConsent,
                    u = e.learnMore,
                    s = e.facialPrivacyUrl,
                    f = e.buttons,
                    p = e.cameraPrivacy,
                    h = e.useCameraU13Design,
                    d = function(e) {
                        if (Array.isArray(e)) return e
                    }(t = aW(r, a, l, c, f)) || function(e) {
                        var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                        if (null != n) {
                            var o = [],
                                i = !0,
                                a = !1;
                            try {
                                for (n = n.call(e); !(i = (t = n.next()).done) && (o.push(t.value), 2 !== o.length); i = !0);
                            } catch (e) {
                                a = !0, r = e
                            } finally {
                                try {
                                    i || null == n.return || n.return()
                                } finally {
                                    if (a) throw r
                                }
                            }
                            return o
                        }
                    }(t) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return aq(e, 2);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return aq(e, 2)
                        }
                    }(t) || function() {
                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }(),
                    y = d[0],
                    m = d[1];
                return (0, S.useEffect)(function() {
                    ij(oT.showUnifiedChatUpsellModal), ia.post({
                        withCredentials: !0,
                        url: "".concat(ip, "/v1/settings/record-user-seen-avatar-video-upsell-modal")
                    }, {}).then(function(e) {
                        return e.data
                    })
                }, []), (0, O.jsxs)(j().Fragment, {
                    children: [(0, O.jsx)("div", {
                        className: "modal-header",
                        children: (0, O.jsx)("div", {
                            className: "email-upsell-title-container",
                            children: (0, O.jsx)(nz, {
                                className: "modal-title",
                                children: r(n)
                            })
                        })
                    }), (0, O.jsxs)(nK, {
                        className: "modal-body",
                        children: [(0, O.jsxs)("div", {
                            children: [(0, O.jsxs)("div", {
                                className: "legal-enable-page-row",
                                children: [(0, O.jsx)("img", {
                                    width: 60,
                                    height: 60,
                                    src: aL("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHUAAAB1CAMAAABH2l6OAAAAAXNSR0IB2cksfwAAAAlwSFlzAAAhOAAAITgBRZYxYAAAAO1QTFRFAAAAAK9gALplALpjALlkALhkALhnALhkALljALhkALhjALhjAL1jALljALhlALdgALlkALljALplALdkALljALhlALhlALdoALlkALhlALhkAL9gALlkAL1rALhkALllAK9wALhnALlmALhkALdiALpl9kxQ90pS9ktS9klQ70BQ90pQ90tS90pS90tR9kpTn5+fm5ubmZmZnJycmJiYl5eXmJiYmJiYmJiYym9xx3F1mZmZl5eXmJiYmZmZl5eXmZmZmpqa5FpfmJiYx3F0mJiY7VJZ3V9lmZmZl5eX90hT+EtR9kxS71BQ+EtSN94hsgAAAE90Uk5TABA/b39PL7/v/9+fH69vII9fb0BQn98gz6+PEO8f768QT1/PYDBv3++PEH//f99vEE9/H2/v/4+f7/+PIL9QQF8/n6//34+vz2Bfz+8Qj+KRS3EAAAMjSURBVHic7Zh9d9IwFMYDY+sK07oioKNuOF82lSkU0M6uDrbh6/T7fxybNmnTUmiCye05njz/bST55UlucnOLkJaWlpaWlpaWlhavavWdxmbt7slm1o19s1zN1oFEZu0BBzLmPpQGtZq80FCPqoCaZksOVQxqmrlFru3VtwizhiDUNNmQsqIwbB4KQi06lmG3N+pxp0tbpr1tGvpGTYh6SLo1ypv2npC2lGAZ6QI8FaKSjkc8bfvELVlPO3PG6yJUJ+7zjKuxzUyRNZpb9/LpC3Xpp6tp5y+zYwFqL+7S4WxO58gadcjRU05ljZ4MDBgqI+d5EpBw1JMBAqdio+DUyCgwlRiFpVKjkNTUKCCVMQpGzRgFo+ZzONQKZ1+oYNGUsQt4chi7kLdEahf2RqR2gW9/Yhc800V24bM6tgtENdh6oXUARUW9boptbv1a43yZWmnrlfJI5GVKXuHHfGUKKU+iVzhrF0uo5CCbwlUM00r3NP4za/dUhEqKCJ7qynpB2tLyhLXLGxmx+g4Nip36Ru0e7a8CErvGQIi6RdXMVmK9TjRj4Y8k/W4ZJafcXgza7Z4oE60GY4kkfQ0Rw8qC0s3hkSPvK1eoNhfXaQxkQhEOCrvk6+XLV9yDvT47f/NW8gRL9W4Y6qIK6PC8CujwfRXQ4YcqoKDbqhI6GrsrGk8UQ6ezj0X6pBTqFTJDXSqEuuugnxPo2HcncqFXGBB8uc7LS6BXAW7iSqXOwxG9gv8ne0p3fSGT6ocDXq+H3gR0wacyqTiWVjeNQi8jo7Nb2UtcSKXQu8hlMFlAUDPQWbi0ENQMNMA/AlBZ6CyOIfXU5MhQoxDU9O7FBxmIylz4eFeXcwgqm2Xiy8FTH02Z1EbuJGxXKTWbT5Pk4ym9JXJJHMdwnAaXvgrqogiKU2CArpbUsVTqNBzwtgAaZXsfpVlfal4f4azijRdfCfTbItLYS0ixXblZnXihL4c79g1Ds/3c9wtS8L/JWwf9PpKNYuUui6AzVykUIbqnN8wr/Idi5v9Xy6zVzyqg6FcVUHRfBRRdVAFFv//cn4GW/1paWlpK9BcRsutogYHJewAAAABJRU5ErkJggg=="),
                                    alt: ""
                                }), (0, O.jsx)("p", {
                                    className: "legal-enable-page-row-label",
                                    children: r(o)
                                })]
                            }), (0, O.jsxs)("div", {
                                className: "legal-enable-page-row",
                                children: [(0, O.jsx)("img", {
                                    width: 60,
                                    height: 60,
                                    src: aL(h ? "https://images.rbxcdn.com/427e9996acdd586c.png" : aR),
                                    alt: ""
                                }), (0, O.jsx)("p", {
                                    className: "legal-enable-page-row-label",
                                    children: r(h ? p : i)
                                })]
                            })]
                        }), y]
                    }), (0, O.jsx)(nQ, {
                        className: "modal-footer",
                        children: (0, O.jsx)("div", {
                            className: "half-flex-container",
                            children: m
                        })
                    }), (0, O.jsx)("div", {
                        className: "text-footer legal-enable-page-text-footer border-top",
                        children: (0, O.jsxs)("span", {
                            children: [(0, O.jsx)(tb, {
                                name: "icon-regular-circle-question",
                                size: "Large",
                                className: "idv-footer-icon"
                            }), (0, O.jsx)("a", {
                                className: "text-link legal-enable-page-text-footer-link",
                                target: "_blank",
                                rel: "noreferrer",
                                href: s,
                                onClick: function() {
                                    return ij(oT.learnMoreAvatarVideo)
                                },
                                children: r(u)
                            })]
                        })
                    })]
                })
            };

            function a$(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function a0(e, t, r, n, o, i, a) {
                try {
                    var l = e[i](a),
                        c = l.value
                } catch (e) {
                    r(e);
                    return
                }
                l.done ? t(c) : Promise.resolve(c).then(n, o)
            }

            function a1(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var i = e.apply(t, r);

                        function a(e) {
                            a0(i, n, o, a, l, "next", e)
                        }

                        function l(e) {
                            a0(i, n, o, a, l, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function a2(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var r = null != arguments[t] ? arguments[t] : {},
                        n = Object.keys(r);
                    "function" == typeof Object.getOwnPropertySymbols && (n = n.concat(Object.getOwnPropertySymbols(r).filter(function(e) {
                        return Object.getOwnPropertyDescriptor(r, e).enumerable
                    }))), n.forEach(function(t) {
                        var n;
                        n = r[t], t in e ? Object.defineProperty(e, t, {
                            value: n,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : e[t] = n
                    })
                }
                return e
            }

            function a3(e, t) {
                return t = null != t ? t : {}, Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : (function(e) {
                    var t = Object.keys(e);
                    if (Object.getOwnPropertySymbols) {
                        var r = Object.getOwnPropertySymbols(e);
                        t.push.apply(t, r)
                    }
                    return t
                })(Object(t)).forEach(function(r) {
                    Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r))
                }), e
            }

            function a8(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            l = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            l = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (l) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return a$(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return a$(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function a5(e, t) {
                var r, n, o, i = {
                        label: 0,
                        sent: function() {
                            if (1 & o[0]) throw o[1];
                            return o[1]
                        },
                        trys: [],
                        ops: []
                    },
                    a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype),
                    l = Object.defineProperty;
                return l(a, "next", {
                    value: c(0)
                }), l(a, "throw", {
                    value: c(1)
                }), l(a, "return", {
                    value: c(2)
                }), "function" == typeof Symbol && l(a, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), a;

                function c(l) {
                    return function(c) {
                        var u = [l, c];
                        if (r) throw TypeError("Generator is already executing.");
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
                                    if (!(o = (o = i.trys).length > 0 && o[o.length - 1]) && (6 === u[0] || 2 === u[0])) {
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
                    }
                }
            }
            var a6 = null != (v = (0, nY.getDeviceMeta)()) ? v : {},
                a4 = a6.isAndroidApp,
                a7 = a6.isDesktop,
                a9 = iE.MessageConfirmationEmailNotSent,
                le = iE.MessageInvalidEmailAddress,
                lt = function(e) {
                    var t = e.translate,
                        r = e.entry,
                        n = i_(),
                        o = n.idVerificationState,
                        i = n.dispatch,
                        a = o.pageName,
                        l = o.pageState,
                        c = a8((0, S.useState)(!1), 2),
                        u = c[0],
                        s = c[1],
                        f = a8((0, S.useState)(!1), 2),
                        p = f[0],
                        h = f[1],
                        d = (0, S.useRef)("");

                    function y() {
                        i({
                            type: n8
                        }), h(!1), d.current = "", r === oz && a === oM && document.location.reload()
                    }

                    function m() {
                        im(oT.exitIdentityVerification, {
                            origin: r
                        }), y()
                    }
                    var b = function(e) {
                            if ((null == e ? void 0 : e.isVerified) && (null == e ? void 0 : e.verifiedAge)) {
                                try {
                                    iA(!0)
                                } catch (e) {
                                    console.log(e)
                                }
                                r === oz ? i({
                                    type: nW,
                                    pageName: oM,
                                    dispatch: i,
                                    close: function() {
                                        y()
                                    }
                                }) : e.verifiedAge >= 18 ? i({
                                    type: nW,
                                    pageName: oL,
                                    dispatch: i,
                                    close: function() {
                                        i({
                                            type: nW,
                                            pageName: oG,
                                            dispatch: i,
                                            close: function() {
                                                y()
                                            }
                                        })
                                    }
                                }) : i({
                                    type: nW,
                                    pageName: oR,
                                    dispatch: i,
                                    close: function() {
                                        y()
                                    }
                                })
                            } else i({
                                type: nW,
                                pageName: oD,
                                dispatch: i,
                                close: function() {
                                    y()
                                }
                            })
                        },
                        g = function(e, t) {
                            var n = Number(new Date) + 18e5,
                                o = 0;
                            return d.current = e, new Promise(function a(l, c) {
                                return a1(function() {
                                    var u, s, f, p, h;
                                    return a5(this, function(m) {
                                        switch (m.label) {
                                            case 0:
                                                return [4, iy(e).catch(function() {
                                                    return {
                                                        sessionStatus: o
                                                    }
                                                })];
                                            case 1:
                                                if (s = (u = m.sent()).sessionStatus, f = null, p = null, s && s !== o) {
                                                    switch (o = s, h = 0, s) {
                                                        case 4:
                                                        case 2:
                                                            switch (f = oD, u.sessionErrorCode) {
                                                                case 2:
                                                                case 4:
                                                                    p = "Label.FailedVerificationInvalidDocument";
                                                                    break;
                                                                case 5:
                                                                case 3:
                                                                    p = "Label.FailedVerificationLowQuality";
                                                                    break;
                                                                case 6:
                                                                    p = "Label.FailedVerificationUnsupportedDocument";
                                                                    break;
                                                                case 7:
                                                                    p = "Label.FailedVerificationMaxAccountsLinked";
                                                                    break;
                                                                default:
                                                                    p = "Label.FailedVerification"
                                                            }
                                                            break;
                                                        case 3:
                                                            f = oH;
                                                            break;
                                                        case 7:
                                                            f = oM;
                                                            break;
                                                        case 5:
                                                            im(oT.verificationInProgress, {
                                                                origin: r
                                                            }), h = 1;
                                                            break;
                                                        case 6:
                                                            im(oT.verificationPending, {
                                                                origin: r
                                                            }), h = 2;
                                                            break;
                                                        case 1:
                                                            h = 3
                                                    }
                                                    0 !== o && i({
                                                        type: nW,
                                                        pageName: oU,
                                                        origin: r,
                                                        verificationLink: t,
                                                        useQRCode: a7,
                                                        checklistStep: h,
                                                        dispatch: i
                                                    })
                                                }
                                                return d.current !== e ? l(!1) : f ? (i({
                                                    type: nW,
                                                    pageName: f,
                                                    textKey: p,
                                                    isSeventeenPlus: u.isSeventeenPlus,
                                                    dispatch: i,
                                                    close: function() {
                                                        y()
                                                    }
                                                }), l(o)) : Number(new Date) < n ? setTimeout(a, 15e3, l, c) : (i({
                                                    type: nW,
                                                    pageName: oD,
                                                    textKey: "Label.SessionTimeout",
                                                    dispatch: i,
                                                    close: function() {
                                                        y()
                                                    }
                                                }), l(!1)), [2]
                                        }
                                    })
                                })()
                            })
                        };

                    function v() {
                        if (o.pageName === oB) {
                            var e;
                            (e = o.userEmailInput, /\S+@\S+\.\S+/.test(e)) ? (im(oT.addEmailConfirm, {
                                origin: r
                            }), i({
                                type: n$,
                                isEmailUpdating: !0
                            }), aQ({
                                emailAddress: o.userEmailInput
                            }).then(function(e) {
                                e === iE.InvalidEmailCode ? (i({
                                    type: nJ,
                                    errorMsg: le
                                }), i({
                                    type: n$,
                                    isEmailUpdating: !1
                                })) : aY().then(function(e) {
                                    e ? (i({
                                        type: nZ,
                                        isEmailVerified: !1,
                                        userEmail: e
                                    }), ia.post({
                                        retryable: !0,
                                        withCredentials: !0,
                                        url: "".concat(is, "/v1/email/verify")
                                    }).then(function() {
                                        return !0
                                    }, function() {
                                        return !1
                                    }), i({
                                        type: n1
                                    }), i({
                                        type: n$,
                                        isEmailUpdating: !1
                                    }), s(!0)) : i({
                                        type: nJ,
                                        errorMsg: a9
                                    })
                                })
                            }), i({
                                type: nX
                            })) : i({
                                type: nJ,
                                errorMsg: le
                            })
                        } else y()
                    }

                    function w() {
                        aZ().then(function(e) {
                            e && (i({
                                type: n0,
                                origin: r,
                                skipCallback: !1
                            }), i({
                                type: nZ,
                                isEmailVerified: e.isEmailVerified,
                                userEmail: e.emailAddress
                            }), e.emailAddress ? s(!0) : (im(oT.showAddEmailModal, {
                                origin: r
                            }), i({
                                type: nW,
                                pageName: oB,
                                dispatch: i
                            }), i({
                                type: nX
                            }), h(!0)))
                        }, function() {
                            i({
                                type: nW,
                                pageName: oV,
                                dispatch: i,
                                close: function() {
                                    y()
                                }
                            }), i({
                                type: nX
                            }), h(!0)
                        })
                    }(0, S.useEffect)(function() {
                        u && a1(function() {
                            var e, t, n, o;
                            return a5(this, function(a) {
                                switch (a.label) {
                                    case 0:
                                        return [4, ia.post({
                                            retryable: !0,
                                            withCredentials: !0,
                                            url: "".concat(iu, "/age-verification-service/v1/persona-id-verification/start-verification")
                                        }, {
                                            generateLink: !0
                                        }).then(function(e) {
                                            return e.data
                                        }, function() {
                                            return !1
                                        })];
                                    case 1:
                                        return e = a.sent(), t = "", s(!1), e && e.verificationLink && e.sessionIdentifier ? (im(oT.showModal, {
                                            origin: r
                                        }), n = e.verificationLink, r === oY && (o = window.location.href, t = "".concat(o, "&action=IdVerifyPending")), i({
                                            type: nW,
                                            pageName: o_,
                                            verificationLink: n,
                                            useQRCode: a7,
                                            redirectUrl: t,
                                            dispatch: i
                                        }), g(e.sessionIdentifier, e.verificationLink)) : e && e.daysUntilNextVerification > 0 ? i({
                                            type: nW,
                                            pageName: oF,
                                            daysUntilNextVerification: e.daysUntilNextVerification,
                                            dispatch: i,
                                            close: function() {
                                                y()
                                            }
                                        }) : i({
                                            type: nW,
                                            pageName: oV,
                                            dispatch: i,
                                            close: function() {
                                                y()
                                            }
                                        }), h(!0), [2]
                                }
                            })
                        })()
                    }, [u]), (0, S.useEffect)(function() {
                        i({
                            type: n0,
                            origin: r,
                            skipCallback: !1
                        }), window.addEventListener(oW, function(e) {
                            e.preventDefault(), i({
                                type: n2,
                                callback: e.detail.successCallback
                            }), id().then(function(e) {
                                (null == e ? void 0 : e.isVerified) ? (h(!0), b(e)) : r === oQ ? (h(!0), i({
                                    type: nW,
                                    pageName: ok,
                                    dispatch: i,
                                    continue: function() {
                                        w()
                                    }
                                })) : w()
                            })
                        }, !1), window.addEventListener(oZ, function(e) {
                            e.preventDefault();
                            var t = e.detail,
                                r = t.requireExplicitVoiceConsent,
                                n = t.useVoiceUpsellV2Design;
                            h(!0), i({
                                type: nW,
                                pageName: oG,
                                requireExplicitVoiceConsent: r,
                                useVoiceUpsellV2Design: n,
                                dispatch: i,
                                close: function() {
                                    e.detail.closeCallback(!0), y()
                                }
                            })
                        }), window.addEventListener(oX, function(e) {
                            e.preventDefault();
                            var t = e.detail,
                                r = t.requireExplicitCameraConsent,
                                n = t.useCameraU13Design;
                            h(!0), i({
                                type: nW,
                                pageName: oK,
                                requireExplicitCameraConsent: r,
                                useCameraU13Design: n,
                                dispatch: i,
                                close: function() {
                                    e.detail.closeCallback(!0), y()
                                }
                            })
                        }), "LuaApp" === r && (i({
                            type: n3
                        }), id().then(function(e) {
                            (null == e ? void 0 : e.isVerified) ? (h(!0), b(e)) : w()
                        }, function() {
                            i({
                                type: nW,
                                pageName: oV,
                                dispatch: i,
                                close: function() {
                                    y()
                                }
                            }), h(!0)
                        }))
                    }, []);
                    var E = null,
                        A = "lg",
                        j = "static",
                        x = function() {
                            return m()
                        };
                    if (l)
                        if (a === o_) E = (0, O.jsx)(aG, a3(a2({}, l), {
                            onHide: x,
                            translate: t,
                            entry: r
                        }));
                        else if (a === oU) E = (0, O.jsx)(iO, a3(a2({}, l), {
                        onHide: x,
                        translate: t
                    }));
                    else if (a === oG) {
                        var P = a2({
                            communityStandardsUrl: l.communityStandardsUrl,
                            voiceFAQUrl: l.voiceFAQUrl,
                            requireExplicitVoiceConsent: l.requireExplicitVoiceConsent,
                            useVoiceUpsellV2Design: l.useVoiceUpsellV2Design
                        }, l.useVoiceUpsellV2Design ? l.voiceUpsellV2Keys : l.voiceUpsellV1Keys);
                        x = function() {
                            ij(oT.closeEnableVoiceChatModal), m()
                        }, l.useVoiceUpsellV2Design && (A = "md", j = !0), E = (0, O.jsx)(aU, a3(a2({}, P), {
                            translate: t
                        }))
                    } else a === oK ? (A = "md", E = (0, O.jsx)(aJ, a3(a2({}, l), {
                        translate: t
                    }))) : E = (0, O.jsx)(az, a3(a2({}, l), {
                        onHide: x,
                        translate: t
                    }));
                    var C = {
                        onPointerDownOutside: "static" === j ? function(e) {
                            return e.preventDefault()
                        } : void 0,
                        onInteractOutside: "static" === j ? function(e) {
                            return e.preventDefault()
                        } : void 0
                    };
                    return (0, O.jsx)("div", {
                        children: (0, O.jsx)(n_, {
                            open: p,
                            onOpenChange: function(e) {
                                e || x()
                            },
                            size: "lg" === A && a !== oM ? "Large" : "Medium",
                            isModal: !0,
                            hasCloseAffordance: !1,
                            experimentalDisablePointerEventsStylingOnBody: !0,
                            children: (0, O.jsx)(nG, a3(a2({
                                overlayClassName: "".concat(a4 ? "email-upsell-android-modal" : "", " email-upsell-modal"),
                                style: {
                                    background: "none",
                                    border: "none"
                                },
                                className: "modal-dialog idv-modal"
                            }, C), {
                                children: (0, O.jsx)("div", {
                                    className: "modal-content",
                                    children: a === oB ? (0, O.jsx)(aB, {
                                        onHide: function() {
                                            m()
                                        },
                                        onPrimaryAction: function() {
                                            return v()
                                        },
                                        onSecondaryAction: function() {
                                            o.pageName === oB && (o.skipCallback && o.skipCallback(), i({
                                                type: n1
                                            }), h(!1))
                                        },
                                        onInputFocus: function() {
                                            im(oT.useAddEmailField, {
                                                origin: r
                                            })
                                        },
                                        onInputChange: function(e) {
                                            i({
                                                type: nq,
                                                pageName: oB,
                                                value: e
                                            })
                                        },
                                        onKeyDown: function(e) {
                                            return e === iE.Enter && v()
                                        }
                                    }) : E
                                })
                            }))
                        })
                    })
                },
                lr = function(e) {
                    var t = e.entry,
                        r = aT();
                    return (0, O.jsx)(iF, {
                        children: (0, O.jsx)(lt, {
                            translate: r,
                            entry: void 0 === t ? oQ : t
                        })
                    })
                },
                ln = "id-verification-container",
                lo = JSON.parse('{"P":["CommonUI.Controls","Feature.VerificationUpsell","Verification.Identity"]}');
            tc().IdentityVerificationService = {
                getPersonaVerificationStatus: iy,
                getVerifiedAge: id,
                startVerificationFlow: function() {
                    return new Promise(function(e) {
                        var t = new CustomEvent(oW, {
                            detail: {
                                successCallback: function(t, r) {
                                    e([t, r])
                                }
                            }
                        });
                        window.dispatchEvent(t)
                    })
                },
                sendIdVerificationEvent: im,
                showVoiceOptInOverlay: function(e, t) {
                    return new Promise(function(r) {
                        var n = new CustomEvent(oZ, {
                            detail: {
                                closeCallback: function(e) {
                                    r(e)
                                },
                                requireExplicitVoiceConsent: e,
                                useVoiceUpsellV2Design: t
                            }
                        });
                        window.dispatchEvent(n)
                    })
                },
                showAvatarVideoOptInOverlay: function(e, t) {
                    return new Promise(function(r) {
                        var n = new CustomEvent(oX, {
                            detail: {
                                closeCallback: function(e) {
                                    r(e)
                                },
                                requireExplicitCameraConsent: e,
                                useCameraU13Design: t
                            }
                        });
                        window.dispatchEvent(n)
                    })
                }
            }, E()(function() {
                ln && function e() {
                    var t = document.getElementById(ln);
                    if (t) {
                        var r = t.getAttribute("entry");
                        (0, A.renderWithErrorBoundary)((0, O.jsx)(ta, {
                            namespaces: lo.P,
                            children: (0, O.jsx)(lr, {
                                entry: r || void 0
                            })
                        }), t)
                    } else window.requestAnimationFrame(e)
                }()
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected(document.currentScript && document.currentScript.getAttribute("data-bundlename") || "IdVerification");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/idVerification-c4823c361aab7649.js.map