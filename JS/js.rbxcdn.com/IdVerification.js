/*! For license information please see idVerification.bundle.min.js.LICENSE.txt */ ! function() {
    var e = {
            84: function(e) {
                "use strict";
                var t = {
                    single_source_shortest_paths: function(e, n, r) {
                        var a = {},
                            i = {};
                        i[n] = 0;
                        var o, l, c, s, u, d, f, p = t.PriorityQueue.make();
                        for (p.push(n, 0); !p.empty();)
                            for (c in l = (o = p.pop()).value, s = o.cost, u = e[l] || {}) u.hasOwnProperty(c) && (d = s + u[c], f = i[c], (void 0 === i[c] || f > d) && (i[c] = d, p.push(c, d), a[c] = l));
                        if (void 0 !== r && void 0 === i[r]) {
                            var m = ["Could not find a path from ", n, " to ", r, "."].join("");
                            throw new Error(m)
                        }
                        return a
                    },
                    extract_shortest_path_from_predecessor_list: function(e, t) {
                        for (var n = [], r = t; r;) n.push(r), e[r], r = e[r];
                        return n.reverse(), n
                    },
                    find_path: function(e, n, r) {
                        var a = t.single_source_shortest_paths(e, n, r);
                        return t.extract_shortest_path_from_predecessor_list(a, r)
                    },
                    PriorityQueue: {
                        make: function(e) {
                            var n, r = t.PriorityQueue,
                                a = {};
                            for (n in e = e || {}, r) r.hasOwnProperty(n) && (a[n] = r[n]);
                            return a.queue = [], a.sorter = e.sorter || r.default_sorter, a
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
            717: function(e) {
                "use strict";
                e.exports = function(e) {
                    for (var t = [], n = e.length, r = 0; r < n; r++) {
                        var a = e.charCodeAt(r);
                        if (a >= 55296 && a <= 56319 && n > r + 1) {
                            var i = e.charCodeAt(r + 1);
                            i >= 56320 && i <= 57343 && (a = 1024 * (a - 55296) + i - 56320 + 65536, r += 1)
                        }
                        a < 128 ? t.push(a) : a < 2048 ? (t.push(a >> 6 | 192), t.push(63 & a | 128)) : a < 55296 || a >= 57344 && a < 65536 ? (t.push(a >> 12 | 224), t.push(a >> 6 & 63 | 128), t.push(63 & a | 128)) : a >= 65536 && a <= 1114111 ? (t.push(a >> 18 | 240), t.push(a >> 12 & 63 | 128), t.push(a >> 6 & 63 | 128), t.push(63 & a | 128)) : t.push(239, 191, 189)
                    }
                    return new Uint8Array(t).buffer
                }
            },
            574: function(e, t, n) {
                var r = n(24),
                    a = n(496),
                    i = n(154),
                    o = n(195);

                function l(e, t, n, i, o) {
                    var l = [].slice.call(arguments, 1),
                        c = l.length,
                        s = "function" == typeof l[c - 1];
                    if (!s && !r()) throw new Error("Callback required as last argument");
                    if (!s) {
                        if (c < 1) throw new Error("Too few arguments provided");
                        return 1 === c ? (n = t, t = i = void 0) : 2 !== c || t.getContext || (i = n, n = t, t = void 0), new Promise((function(r, o) {
                            try {
                                var l = a.create(n, i);
                                r(e(l, t, i))
                            } catch (e) {
                                o(e)
                            }
                        }))
                    }
                    if (c < 2) throw new Error("Too few arguments provided");
                    2 === c ? (o = n, n = t, t = i = void 0) : 3 === c && (t.getContext && void 0 === o ? (o = i, i = void 0) : (o = i, i = n, n = t, t = void 0));
                    try {
                        var u = a.create(n, i);
                        o(null, e(u, t, i))
                    } catch (e) {
                        o(e)
                    }
                }
                t.create = a.create, t.toCanvas = l.bind(null, i.render), t.toDataURL = l.bind(null, i.renderToDataURL), t.toString = l.bind(null, (function(e, t, n) {
                    return o.render(e, n)
                }))
            },
            24: function(e) {
                e.exports = function() {
                    return "function" == typeof Promise && Promise.prototype && Promise.prototype.then
                }
            },
            498: function(e, t, n) {
                var r = n(701).getSymbolSize;
                t.getRowColCoords = function(e) {
                    if (1 === e) return [];
                    for (var t = Math.floor(e / 7) + 2, n = r(e), a = 145 === n ? 26 : 2 * Math.ceil((n - 13) / (2 * t - 2)), i = [n - 7], o = 1; o < t - 1; o++) i[o] = i[o - 1] - a;
                    return i.push(6), i.reverse()
                }, t.getPositions = function(e) {
                    for (var n = [], r = t.getRowColCoords(e), a = r.length, i = 0; i < a; i++)
                        for (var o = 0; o < a; o++) 0 === i && 0 === o || 0 === i && o === a - 1 || i === a - 1 && 0 === o || n.push([r[i], r[o]]);
                    return n
                }
            },
            734: function(e, t, n) {
                var r = n(145),
                    a = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", " ", "$", "%", "*", "+", "-", ".", "/", ":"];

                function i(e) {
                    this.mode = r.ALPHANUMERIC, this.data = e
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
                        var n = 45 * a.indexOf(this.data[t]);
                        n += a.indexOf(this.data[t + 1]), e.put(n, 11)
                    }
                    this.data.length % 2 && e.put(a.indexOf(this.data[t]), 6)
                }, e.exports = i
            },
            330: function(e) {
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
            345: function(e) {
                function t(e) {
                    if (!e || e < 1) throw new Error("BitMatrix size must be defined and greater than 0");
                    this.size = e, this.data = new Uint8Array(e * e), this.reservedBit = new Uint8Array(e * e)
                }
                t.prototype.set = function(e, t, n, r) {
                    var a = e * this.size + t;
                    this.data[a] = n, r && (this.reservedBit[a] = !0)
                }, t.prototype.get = function(e, t) {
                    return this.data[e * this.size + t]
                }, t.prototype.xor = function(e, t, n) {
                    this.data[e * this.size + t] ^= n
                }, t.prototype.isReserved = function(e, t) {
                    return this.reservedBit[e * this.size + t]
                }, e.exports = t
            },
            557: function(e, t, n) {
                var r = n(717),
                    a = n(145);

                function i(e) {
                    this.mode = a.BYTE, "string" == typeof e && (e = r(e)), this.data = new Uint8Array(e)
                }
                i.getBitsLength = function(e) {
                    return 8 * e
                }, i.prototype.getLength = function() {
                    return this.data.length
                }, i.prototype.getBitsLength = function() {
                    return i.getBitsLength(this.data.length)
                }, i.prototype.write = function(e) {
                    for (var t = 0, n = this.data.length; t < n; t++) e.put(this.data[t], 8)
                }, e.exports = i
            },
            185: function(e, t, n) {
                var r = n(308),
                    a = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 1, 2, 2, 4, 1, 2, 4, 4, 2, 4, 4, 4, 2, 4, 6, 5, 2, 4, 6, 6, 2, 5, 8, 8, 4, 5, 8, 8, 4, 5, 8, 11, 4, 8, 10, 11, 4, 9, 12, 16, 4, 9, 16, 16, 6, 10, 12, 18, 6, 10, 17, 16, 6, 11, 16, 19, 6, 13, 18, 21, 7, 14, 21, 25, 8, 16, 20, 25, 8, 17, 23, 25, 9, 17, 23, 34, 9, 18, 25, 30, 10, 20, 27, 32, 12, 21, 29, 35, 12, 23, 34, 37, 12, 25, 34, 40, 13, 26, 35, 42, 14, 28, 38, 45, 15, 29, 40, 48, 16, 31, 43, 51, 17, 33, 45, 54, 18, 35, 48, 57, 19, 37, 51, 60, 19, 38, 53, 63, 20, 40, 56, 66, 21, 43, 59, 70, 22, 45, 62, 74, 24, 47, 65, 77, 25, 49, 68, 81],
                    i = [7, 10, 13, 17, 10, 16, 22, 28, 15, 26, 36, 44, 20, 36, 52, 64, 26, 48, 72, 88, 36, 64, 96, 112, 40, 72, 108, 130, 48, 88, 132, 156, 60, 110, 160, 192, 72, 130, 192, 224, 80, 150, 224, 264, 96, 176, 260, 308, 104, 198, 288, 352, 120, 216, 320, 384, 132, 240, 360, 432, 144, 280, 408, 480, 168, 308, 448, 532, 180, 338, 504, 588, 196, 364, 546, 650, 224, 416, 600, 700, 224, 442, 644, 750, 252, 476, 690, 816, 270, 504, 750, 900, 300, 560, 810, 960, 312, 588, 870, 1050, 336, 644, 952, 1110, 360, 700, 1020, 1200, 390, 728, 1050, 1260, 420, 784, 1140, 1350, 450, 812, 1200, 1440, 480, 868, 1290, 1530, 510, 924, 1350, 1620, 540, 980, 1440, 1710, 570, 1036, 1530, 1800, 570, 1064, 1590, 1890, 600, 1120, 1680, 1980, 630, 1204, 1770, 2100, 660, 1260, 1860, 2220, 720, 1316, 1950, 2310, 750, 1372, 2040, 2430];
                t.getBlocksCount = function(e, t) {
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
                }, t.getTotalCodewordsCount = function(e, t) {
                    switch (t) {
                        case r.L:
                            return i[4 * (e - 1) + 0];
                        case r.M:
                            return i[4 * (e - 1) + 1];
                        case r.Q:
                            return i[4 * (e - 1) + 2];
                        case r.H:
                            return i[4 * (e - 1) + 3];
                        default:
                            return
                    }
                }
            },
            308: function(e, t) {
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
            305: function(e, t, n) {
                var r = n(701).getSymbolSize;
                t.getPositions = function(e) {
                    var t = r(e);
                    return [
                        [0, 0],
                        [t - 7, 0],
                        [0, t - 7]
                    ]
                }
            },
            826: function(e, t, n) {
                var r = n(701),
                    a = r.getBCHDigit(1335);
                t.getEncodedBits = function(e, t) {
                    for (var n = e.bit << 3 | t, i = n << 10; r.getBCHDigit(i) - a >= 0;) i ^= 1335 << r.getBCHDigit(i) - a;
                    return 21522 ^ (n << 10 | i)
                }
            },
            666: function(e, t) {
                var n = new Uint8Array(512),
                    r = new Uint8Array(256);
                ! function() {
                    for (var e = 1, t = 0; t < 255; t++) n[t] = e, r[e] = t, 256 & (e <<= 1) && (e ^= 285);
                    for (var a = 255; a < 512; a++) n[a] = n[a - 255]
                }(), t.log = function(e) {
                    if (e < 1) throw new Error("log(" + e + ")");
                    return r[e]
                }, t.exp = function(e) {
                    return n[e]
                }, t.mul = function(e, t) {
                    return 0 === e || 0 === t ? 0 : n[r[e] + r[t]]
                }
            },
            927: function(e, t, n) {
                var r = n(145),
                    a = n(701);

                function i(e) {
                    this.mode = r.KANJI, this.data = e
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
                        var n = a.toSJIS(this.data[t]);
                        if (n >= 33088 && n <= 40956) n -= 33088;
                        else {
                            if (!(n >= 57408 && n <= 60351)) throw new Error("Invalid SJIS character: " + this.data[t] + "\nMake sure your charset is UTF-8");
                            n -= 49472
                        }
                        n = 192 * (n >>> 8 & 255) + (255 & n), e.put(n, 13)
                    }
                }, e.exports = i
            },
            29: function(e, t) {
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
                    a = 40,
                    i = 10;

                function o(e, n, r) {
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
                    for (var t = e.size, r = 0, a = 0, i = 0, o = null, l = null, c = 0; c < t; c++) {
                        a = i = 0, o = l = null;
                        for (var s = 0; s < t; s++) {
                            var u = e.get(c, s);
                            u === o ? a++ : (a >= 5 && (r += n + (a - 5)), o = u, a = 1), (u = e.get(s, c)) === l ? i++ : (i >= 5 && (r += n + (i - 5)), l = u, i = 1)
                        }
                        a >= 5 && (r += n + (a - 5)), i >= 5 && (r += n + (i - 5))
                    }
                    return r
                }, t.getPenaltyN2 = function(e) {
                    for (var t = e.size, n = 0, a = 0; a < t - 1; a++)
                        for (var i = 0; i < t - 1; i++) {
                            var o = e.get(a, i) + e.get(a, i + 1) + e.get(a + 1, i) + e.get(a + 1, i + 1);
                            4 !== o && 0 !== o || n++
                        }
                    return n * r
                }, t.getPenaltyN3 = function(e) {
                    for (var t = e.size, n = 0, r = 0, i = 0, o = 0; o < t; o++) {
                        r = i = 0;
                        for (var l = 0; l < t; l++) r = r << 1 & 2047 | e.get(o, l), l >= 10 && (1488 === r || 93 === r) && n++, i = i << 1 & 2047 | e.get(l, o), l >= 10 && (1488 === i || 93 === i) && n++
                    }
                    return n * a
                }, t.getPenaltyN4 = function(e) {
                    for (var t = 0, n = e.data.length, r = 0; r < n; r++) t += e.data[r];
                    return Math.abs(Math.ceil(100 * t / n / 5) - 10) * i
                }, t.applyMask = function(e, t) {
                    for (var n = t.size, r = 0; r < n; r++)
                        for (var a = 0; a < n; a++) t.isReserved(a, r) || t.xor(a, r, o(e, a, r))
                }, t.getBestMask = function(e, n) {
                    for (var r = Object.keys(t.Patterns).length, a = 0, i = 1 / 0, o = 0; o < r; o++) {
                        n(o), t.applyMask(o, e);
                        var l = t.getPenaltyN1(e) + t.getPenaltyN2(e) + t.getPenaltyN3(e) + t.getPenaltyN4(e);
                        t.applyMask(o, e), l < i && (i = l, a = o)
                    }
                    return a
                }
            },
            145: function(e, t, n) {
                var r = n(893),
                    a = n(795);
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
                    return a.testNumeric(e) ? t.NUMERIC : a.testAlphanumeric(e) ? t.ALPHANUMERIC : a.testKanji(e) ? t.KANJI : t.BYTE
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
            808: function(e, t, n) {
                var r = n(145);

                function a(e) {
                    this.mode = r.NUMERIC, this.data = e.toString()
                }
                a.getBitsLength = function(e) {
                    return 10 * Math.floor(e / 3) + (e % 3 ? e % 3 * 3 + 1 : 0)
                }, a.prototype.getLength = function() {
                    return this.data.length
                }, a.prototype.getBitsLength = function() {
                    return a.getBitsLength(this.data.length)
                }, a.prototype.write = function(e) {
                    var t, n, r;
                    for (t = 0; t + 3 <= this.data.length; t += 3) n = this.data.substr(t, 3), r = parseInt(n, 10), e.put(r, 10);
                    var a = this.data.length - t;
                    a > 0 && (n = this.data.substr(t), r = parseInt(n, 10), e.put(r, 3 * a + 1))
                }, e.exports = a
            },
            4: function(e, t, n) {
                var r = n(666);
                t.mul = function(e, t) {
                    for (var n = new Uint8Array(e.length + t.length - 1), a = 0; a < e.length; a++)
                        for (var i = 0; i < t.length; i++) n[a + i] ^= r.mul(e[a], t[i]);
                    return n
                }, t.mod = function(e, t) {
                    for (var n = new Uint8Array(e); n.length - t.length >= 0;) {
                        for (var a = n[0], i = 0; i < t.length; i++) n[i] ^= r.mul(t[i], a);
                        for (var o = 0; o < n.length && 0 === n[o];) o++;
                        n = n.slice(o)
                    }
                    return n
                }, t.generateECPolynomial = function(e) {
                    for (var n = new Uint8Array([1]), a = 0; a < e; a++) n = t.mul(n, new Uint8Array([1, r.exp(a)]));
                    return n
                }
            },
            496: function(e, t, n) {
                var r = n(701),
                    a = n(308),
                    i = n(330),
                    o = n(345),
                    l = n(498),
                    c = n(305),
                    s = n(29),
                    u = n(185),
                    d = n(181),
                    f = n(184),
                    p = n(826),
                    m = n(145),
                    g = n(144);

                function h(e, t, n) {
                    var r, a, i = e.size,
                        o = p.getEncodedBits(t, n);
                    for (r = 0; r < 15; r++) a = 1 == (o >> r & 1), r < 6 ? e.set(r, 8, a, !0) : r < 8 ? e.set(r + 1, 8, a, !0) : e.set(i - 15 + r, 8, a, !0), r < 8 ? e.set(8, i - r - 1, a, !0) : r < 9 ? e.set(8, 15 - r - 1 + 1, a, !0) : e.set(8, 15 - r - 1, a, !0);
                    e.set(i - 8, 8, 1, !0)
                }

                function v(e, t, n) {
                    var a = new i;
                    n.forEach((function(t) {
                        a.put(t.mode.bit, 4), a.put(t.getLength(), m.getCharCountIndicator(t.mode, e)), t.write(a)
                    }));
                    var o = 8 * (r.getSymbolTotalCodewords(e) - u.getTotalCodewordsCount(e, t));
                    for (a.getLengthInBits() + 4 <= o && a.put(0, 4); a.getLengthInBits() % 8 != 0;) a.putBit(0);
                    for (var l = (o - a.getLengthInBits()) / 8, c = 0; c < l; c++) a.put(c % 2 ? 17 : 236, 8);
                    return function(e, t, n) {
                        for (var a = r.getSymbolTotalCodewords(t), i = u.getTotalCodewordsCount(t, n), o = a - i, l = u.getBlocksCount(t, n), c = l - a % l, s = Math.floor(a / l), f = Math.floor(o / l), p = f + 1, m = s - f, g = new d(m), h = 0, v = new Array(l), y = new Array(l), b = 0, E = new Uint8Array(e.buffer), A = 0; A < l; A++) {
                            var C = A < c ? f : p;
                            v[A] = E.slice(h, h + C), y[A] = g.encode(v[A]), h += C, b = Math.max(b, C)
                        }
                        var w, x, S = new Uint8Array(a),
                            k = 0;
                        for (w = 0; w < b; w++)
                            for (x = 0; x < l; x++) w < v[x].length && (S[k++] = v[x][w]);
                        for (w = 0; w < m; w++)
                            for (x = 0; x < l; x++) S[k++] = y[x][w];
                        return S
                    }(a, e, t)
                }

                function y(e, t, n, a) {
                    var i;
                    if (Array.isArray(e)) i = g.fromArray(e);
                    else {
                        if ("string" != typeof e) throw new Error("Invalid data");
                        var u = t;
                        if (!u) {
                            var d = g.rawSplit(e);
                            u = f.getBestVersionForData(d, n)
                        }
                        i = g.fromString(e, u || 40)
                    }
                    var p = f.getBestVersionForData(i, n);
                    if (!p) throw new Error("The amount of data is too big to be stored in a QR Code");
                    if (t) {
                        if (t < p) throw new Error("\nThe chosen QR Code version cannot contain this amount of data.\nMinimum version required to store current data is: " + p + ".\n")
                    } else t = p;
                    var m = v(t, n, i),
                        y = r.getSymbolSize(t),
                        b = new o(y);
                    return function(e, t) {
                            for (var n = e.size, r = c.getPositions(t), a = 0; a < r.length; a++)
                                for (var i = r[a][0], o = r[a][1], l = -1; l <= 7; l++)
                                    if (!(i + l <= -1 || n <= i + l))
                                        for (var s = -1; s <= 7; s++) o + s <= -1 || n <= o + s || (l >= 0 && l <= 6 && (0 === s || 6 === s) || s >= 0 && s <= 6 && (0 === l || 6 === l) || l >= 2 && l <= 4 && s >= 2 && s <= 4 ? e.set(i + l, o + s, !0, !0) : e.set(i + l, o + s, !1, !0))
                        }(b, t),
                        function(e) {
                            for (var t = e.size, n = 8; n < t - 8; n++) {
                                var r = n % 2 == 0;
                                e.set(n, 6, r, !0), e.set(6, n, r, !0)
                            }
                        }(b),
                        function(e, t) {
                            for (var n = l.getPositions(t), r = 0; r < n.length; r++)
                                for (var a = n[r][0], i = n[r][1], o = -2; o <= 2; o++)
                                    for (var c = -2; c <= 2; c++) - 2 === o || 2 === o || -2 === c || 2 === c || 0 === o && 0 === c ? e.set(a + o, i + c, !0, !0) : e.set(a + o, i + c, !1, !0)
                        }(b, t), h(b, n, 0), t >= 7 && function(e, t) {
                            for (var n, r, a, i = e.size, o = f.getEncodedBits(t), l = 0; l < 18; l++) n = Math.floor(l / 3), r = l % 3 + i - 8 - 3, a = 1 == (o >> l & 1), e.set(n, r, a, !0), e.set(r, n, a, !0)
                        }(b, t),
                        function(e, t) {
                            for (var n = e.size, r = -1, a = n - 1, i = 7, o = 0, l = n - 1; l > 0; l -= 2)
                                for (6 === l && l--;;) {
                                    for (var c = 0; c < 2; c++)
                                        if (!e.isReserved(a, l - c)) {
                                            var s = !1;
                                            o < t.length && (s = 1 == (t[o] >>> i & 1)), e.set(a, l - c, s), -1 == --i && (o++, i = 7)
                                        } if ((a += r) < 0 || n <= a) {
                                        a -= r, r = -r;
                                        break
                                    }
                                }
                        }(b, m), isNaN(a) && (a = s.getBestMask(b, h.bind(null, b, n))), s.applyMask(a, b), h(b, n, a), {
                            modules: b,
                            version: t,
                            errorCorrectionLevel: n,
                            maskPattern: a,
                            segments: i
                        }
                }
                t.create = function(e, t) {
                    if (void 0 === e || "" === e) throw new Error("No input text");
                    var n, i, o = a.M;
                    return void 0 !== t && (o = a.from(t.errorCorrectionLevel, a.M), n = f.from(t.version), i = s.from(t.maskPattern), t.toSJISFunc && r.setToSJISFunction(t.toSJISFunc)), y(e, n, o, i)
                }
            },
            181: function(e, t, n) {
                var r = n(4);

                function a(e) {
                    this.genPoly = void 0, this.degree = e, this.degree && this.initialize(this.degree)
                }
                a.prototype.initialize = function(e) {
                    this.degree = e, this.genPoly = r.generateECPolynomial(this.degree)
                }, a.prototype.encode = function(e) {
                    if (!this.genPoly) throw new Error("Encoder not initialized");
                    var t = new Uint8Array(e.length + this.degree);
                    t.set(e);
                    var n = r.mod(t, this.genPoly),
                        a = this.degree - n.length;
                    if (a > 0) {
                        var i = new Uint8Array(this.degree);
                        return i.set(n, a), i
                    }
                    return n
                }, e.exports = a
            },
            795: function(e, t) {
                var n = "[0-9]+",
                    r = "(?:[u3000-u303F]|[u3040-u309F]|[u30A0-u30FF]|[uFF00-uFFEF]|[u4E00-u9FAF]|[u2605-u2606]|[u2190-u2195]|u203B|[u2010u2015u2018u2019u2025u2026u201Cu201Du2225u2260]|[u0391-u0451]|[u00A7u00A8u00B1u00B4u00D7u00F7])+",
                    a = "(?:(?![A-Z0-9 $%*+\\-./:]|" + (r = r.replace(/u/g, "\\u")) + ")(?:.|[\r\n]))+";
                t.KANJI = new RegExp(r, "g"), t.BYTE_KANJI = new RegExp("[^A-Z0-9 $%*+\\-./:]+", "g"), t.BYTE = new RegExp(a, "g"), t.NUMERIC = new RegExp(n, "g"), t.ALPHANUMERIC = new RegExp("[A-Z $%*+\\-./:]+", "g");
                var i = new RegExp("^" + r + "$"),
                    o = new RegExp("^" + n + "$"),
                    l = new RegExp("^[A-Z0-9 $%*+\\-./:]+$");
                t.testKanji = function(e) {
                    return i.test(e)
                }, t.testNumeric = function(e) {
                    return o.test(e)
                }, t.testAlphanumeric = function(e) {
                    return l.test(e)
                }
            },
            144: function(e, t, n) {
                var r = n(145),
                    a = n(808),
                    i = n(734),
                    o = n(557),
                    l = n(927),
                    c = n(795),
                    s = n(701),
                    u = n(84);

                function d(e) {
                    return unescape(encodeURIComponent(e)).length
                }

                function f(e, t, n) {
                    for (var r, a = []; null !== (r = e.exec(n));) a.push({
                        data: r[0],
                        index: r.index,
                        mode: t,
                        length: r[0].length
                    });
                    return a
                }

                function p(e) {
                    var t, n, a = f(c.NUMERIC, r.NUMERIC, e),
                        i = f(c.ALPHANUMERIC, r.ALPHANUMERIC, e);
                    return s.isKanjiModeEnabled() ? (t = f(c.BYTE, r.BYTE, e), n = f(c.KANJI, r.KANJI, e)) : (t = f(c.BYTE_KANJI, r.BYTE, e), n = []), a.concat(i, t, n).sort((function(e, t) {
                        return e.index - t.index
                    })).map((function(e) {
                        return {
                            data: e.data,
                            mode: e.mode,
                            length: e.length
                        }
                    }))
                }

                function m(e, t) {
                    switch (t) {
                        case r.NUMERIC:
                            return a.getBitsLength(e);
                        case r.ALPHANUMERIC:
                            return i.getBitsLength(e);
                        case r.KANJI:
                            return l.getBitsLength(e);
                        case r.BYTE:
                            return o.getBitsLength(e)
                    }
                }

                function g(e, t) {
                    var n, c = r.getBestModeForData(e);
                    if ((n = r.from(t, c)) !== r.BYTE && n.bit < c.bit) throw new Error('"' + e + '" cannot be encoded with mode ' + r.toString(n) + ".\n Suggested mode is: " + r.toString(c));
                    switch (n !== r.KANJI || s.isKanjiModeEnabled() || (n = r.BYTE), n) {
                        case r.NUMERIC:
                            return new a(e);
                        case r.ALPHANUMERIC:
                            return new i(e);
                        case r.KANJI:
                            return new l(e);
                        case r.BYTE:
                            return new o(e)
                    }
                }
                t.fromArray = function(e) {
                    return e.reduce((function(e, t) {
                        return "string" == typeof t ? e.push(g(t, null)) : t.data && e.push(g(t.data, t.mode)), e
                    }), [])
                }, t.fromString = function(e, n) {
                    for (var a = function(e) {
                            for (var t = [], n = 0; n < e.length; n++) {
                                var a = e[n];
                                switch (a.mode) {
                                    case r.NUMERIC:
                                        t.push([a, {
                                            data: a.data,
                                            mode: r.ALPHANUMERIC,
                                            length: a.length
                                        }, {
                                            data: a.data,
                                            mode: r.BYTE,
                                            length: a.length
                                        }]);
                                        break;
                                    case r.ALPHANUMERIC:
                                        t.push([a, {
                                            data: a.data,
                                            mode: r.BYTE,
                                            length: a.length
                                        }]);
                                        break;
                                    case r.KANJI:
                                        t.push([a, {
                                            data: a.data,
                                            mode: r.BYTE,
                                            length: d(a.data)
                                        }]);
                                        break;
                                    case r.BYTE:
                                        t.push([{
                                            data: a.data,
                                            mode: r.BYTE,
                                            length: d(a.data)
                                        }])
                                }
                            }
                            return t
                        }(p(e, s.isKanjiModeEnabled())), i = function(e, t) {
                            for (var n = {}, a = {
                                    start: {}
                                }, i = ["start"], o = 0; o < e.length; o++) {
                                for (var l = e[o], c = [], s = 0; s < l.length; s++) {
                                    var u = l[s],
                                        d = "" + o + s;
                                    c.push(d), n[d] = {
                                        node: u,
                                        lastCount: 0
                                    }, a[d] = {};
                                    for (var f = 0; f < i.length; f++) {
                                        var p = i[f];
                                        n[p] && n[p].node.mode === u.mode ? (a[p][d] = m(n[p].lastCount + u.length, u.mode) - m(n[p].lastCount, u.mode), n[p].lastCount += u.length) : (n[p] && (n[p].lastCount = u.length), a[p][d] = m(u.length, u.mode) + 4 + r.getCharCountIndicator(u.mode, t))
                                    }
                                }
                                i = c
                            }
                            for (var g = 0; g < i.length; g++) a[i[g]].end = 0;
                            return {
                                map: a,
                                table: n
                            }
                        }(a, n), o = u.find_path(i.map, "start", "end"), l = [], c = 1; c < o.length - 1; c++) l.push(i.table[o[c]].node);
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
            701: function(e, t) {
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
            893: function(e, t) {
                t.isValid = function(e) {
                    return !isNaN(e) && e >= 1 && e <= 40
                }
            },
            184: function(e, t, n) {
                var r = n(701),
                    a = n(185),
                    i = n(308),
                    o = n(145),
                    l = n(893),
                    c = r.getBCHDigit(7973);

                function s(e, t) {
                    return o.getCharCountIndicator(e, t) + 4
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
                    void 0 === n && (n = o.BYTE);
                    var i = 8 * (r.getSymbolTotalCodewords(e) - a.getTotalCodewordsCount(e, t));
                    if (n === o.MIXED) return i;
                    var c = i - s(n, e);
                    switch (n) {
                        case o.NUMERIC:
                            return Math.floor(c / 10 * 3);
                        case o.ALPHANUMERIC:
                            return Math.floor(c / 11 * 2);
                        case o.KANJI:
                            return Math.floor(c / 13);
                        case o.BYTE:
                        default:
                            return Math.floor(c / 8)
                    }
                }, t.getBestVersionForData = function(e, n) {
                    var r, a = i.from(n, i.M);
                    if (Array.isArray(e)) {
                        if (e.length > 1) return function(e, n) {
                            for (var r = 1; r <= 40; r++)
                                if (u(e, r) <= t.getCapacity(r, n, o.MIXED)) return r
                        }(e, a);
                        if (0 === e.length) return 1;
                        r = e[0]
                    } else r = e;
                    return function(e, n, r) {
                        for (var a = 1; a <= 40; a++)
                            if (n <= t.getCapacity(a, r, e)) return a
                    }(r.mode, r.getLength(), a)
                }, t.getEncodedBits = function(e) {
                    if (!l.isValid(e) || e < 7) throw new Error("Invalid QR Code version");
                    for (var t = e << 12; r.getBCHDigit(t) - c >= 0;) t ^= 7973 << r.getBCHDigit(t) - c;
                    return e << 12 | t
                }
            },
            154: function(e, t, n) {
                var r = n(793);
                t.render = function(e, t, n) {
                    var a = n,
                        i = t;
                    void 0 !== a || t && t.getContext || (a = t, t = void 0), t || (i = function() {
                        try {
                            return document.createElement("canvas")
                        } catch (e) {
                            throw new Error("You need to specify a canvas element")
                        }
                    }()), a = r.getOptions(a);
                    var o = r.getImageWidth(e.modules.size, a),
                        l = i.getContext("2d"),
                        c = l.createImageData(o, o);
                    return r.qrToImageData(c.data, e, a),
                        function(e, t, n) {
                            e.clearRect(0, 0, t.width, t.height), t.style || (t.style = {}), t.height = n, t.width = n, t.style.height = n + "px", t.style.width = n + "px"
                        }(l, i, o), l.putImageData(c, 0, 0), i
                }, t.renderToDataURL = function(e, n, r) {
                    var a = r;
                    void 0 !== a || n && n.getContext || (a = n, n = void 0), a || (a = {});
                    var i = t.render(e, n, a),
                        o = a.type || "image/png",
                        l = a.rendererOpts || {};
                    return i.toDataURL(o, l.quality)
                }
            },
            195: function(e, t, n) {
                var r = n(793);

                function a(e, t) {
                    var n = e.a / 255,
                        r = t + '="' + e.hex + '"';
                    return n < 1 ? r + " " + t + '-opacity="' + n.toFixed(2).slice(1) + '"' : r
                }

                function i(e, t, n) {
                    var r = e + t;
                    return void 0 !== n && (r += " " + n), r
                }
                t.render = function(e, t, n) {
                    var o = r.getOptions(t),
                        l = e.modules.size,
                        c = e.modules.data,
                        s = l + 2 * o.margin,
                        u = o.color.light.a ? "<path " + a(o.color.light, "fill") + ' d="M0 0h' + s + "v" + s + 'H0z"/>' : "",
                        d = "<path " + a(o.color.dark, "stroke") + ' d="' + function(e, t, n) {
                            for (var r = "", a = 0, o = !1, l = 0, c = 0; c < e.length; c++) {
                                var s = Math.floor(c % t),
                                    u = Math.floor(c / t);
                                s || o || (o = !0), e[c] ? (l++, c > 0 && s > 0 && e[c - 1] || (r += o ? i("M", s + n, .5 + u + n) : i("m", a, 0), a = 0, o = !1), s + 1 < t && e[c + 1] || (r += i("h", l), l = 0)) : a++
                            }
                            return r
                        }(c, l, o.margin) + '"/>',
                        f = 'viewBox="0 0 ' + s + " " + s + '"',
                        p = '<svg xmlns="http://www.w3.org/2000/svg" ' + (o.width ? 'width="' + o.width + '" height="' + o.width + '" ' : "") + f + ' shape-rendering="crispEdges">' + u + d + "</svg>\n";
                    return "function" == typeof n && n(null, p), p
                }
            },
            793: function(e, t) {
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
                        a = e.scale || 4;
                    return {
                        width: r,
                        scale: r ? 4 : a,
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
                    for (var a = n.modules.size, i = n.modules.data, o = t.getScale(a, r), l = Math.floor((a + 2 * r.margin) * o), c = r.margin * o, s = [r.color.light, r.color.dark], u = 0; u < l; u++)
                        for (var d = 0; d < l; d++) {
                            var f = 4 * (u * l + d),
                                p = r.color.light;
                            if (u >= c && d >= c && u < l - c && d < l - c) p = s[i[Math.floor((u - c) / o) * a + Math.floor((d - c) / o)] ? 1 : 0];
                            e[f++] = p.r, e[f++] = p.g, e[f++] = p.b, e[f] = p.a
                        }
                }
            },
            870: function(e, t) {
                var n;
                ! function() {
                    "use strict";
                    var r = {}.hasOwnProperty;

                    function a() {
                        for (var e = [], t = 0; t < arguments.length; t++) {
                            var n = arguments[t];
                            if (n) {
                                var i = typeof n;
                                if ("string" === i || "number" === i) e.push(n);
                                else if (Array.isArray(n)) {
                                    if (n.length) {
                                        var o = a.apply(null, n);
                                        o && e.push(o)
                                    }
                                } else if ("object" === i) {
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
                    e.exports ? (a.default = a, e.exports = a) : void 0 === (n = function() {
                        return a
                    }.apply(t, [])) || (e.exports = n)
                }()
            },
            20: function(e) {
                e.exports = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHUAAAB1CAMAAABH2l6OAAAAAXNSR0IB2cksfwAAAAlwSFlzAAAhOAAAITgBRZYxYAAAAO1QTFRFAAAAAK9gALplALpjALlkALhkALhnALhkALljALhkALhjALhjAL1jALljALhlALdgALlkALljALplALdkALljALhlALhlALdoALlkALhlALhkAL9gALlkAL1rALhkALllAK9wALhnALlmALhkALdiALpl9kxQ90pS9ktS9klQ70BQ90pQ90tS90pS90tR9kpTn5+fm5ubmZmZnJycmJiYl5eXmJiYmJiYmJiYym9xx3F1mZmZl5eXmJiYmZmZl5eXmZmZmpqa5FpfmJiYx3F0mJiY7VJZ3V9lmZmZl5eX90hT+EtR9kxS71BQ+EtSN94hsgAAAE90Uk5TABA/b39PL7/v/9+fH69vII9fb0BQn98gz6+PEO8f768QT1/PYDBv3++PEH//f99vEE9/H2/v/4+f7/+PIL9QQF8/n6//34+vz2Bfz+8Qj+KRS3EAAAMjSURBVHic7Zh9d9IwFMYDY+sK07oioKNuOF82lSkU0M6uDrbh6/T7fxybNmnTUmiCye05njz/bST55UlucnOLkJaWlpaWlpaWlhavavWdxmbt7slm1o19s1zN1oFEZu0BBzLmPpQGtZq80FCPqoCaZksOVQxqmrlFru3VtwizhiDUNNmQsqIwbB4KQi06lmG3N+pxp0tbpr1tGvpGTYh6SLo1ypv2npC2lGAZ6QI8FaKSjkc8bfvELVlPO3PG6yJUJ+7zjKuxzUyRNZpb9/LpC3Xpp6tp5y+zYwFqL+7S4WxO58gadcjRU05ljZ4MDBgqI+d5EpBw1JMBAqdio+DUyCgwlRiFpVKjkNTUKCCVMQpGzRgFo+ZzONQKZ1+oYNGUsQt4chi7kLdEahf2RqR2gW9/Yhc800V24bM6tgtENdh6oXUARUW9boptbv1a43yZWmnrlfJI5GVKXuHHfGUKKU+iVzhrF0uo5CCbwlUM00r3NP4za/dUhEqKCJ7qynpB2tLyhLXLGxmx+g4Nip36Ru0e7a8CErvGQIi6RdXMVmK9TjRj4Y8k/W4ZJafcXgza7Z4oE60GY4kkfQ0Rw8qC0s3hkSPvK1eoNhfXaQxkQhEOCrvk6+XLV9yDvT47f/NW8gRL9W4Y6qIK6PC8CujwfRXQ4YcqoKDbqhI6GrsrGk8UQ6ezj0X6pBTqFTJDXSqEuuugnxPo2HcncqFXGBB8uc7LS6BXAW7iSqXOwxG9gv8ne0p3fSGT6ocDXq+H3gR0wacyqTiWVjeNQi8jo7Nb2UtcSKXQu8hlMFlAUDPQWbi0ENQMNMA/AlBZ6CyOIfXU5MhQoxDU9O7FBxmIylz4eFeXcwgqm2Xiy8FTH02Z1EbuJGxXKTWbT5Pk4ym9JXJJHMdwnAaXvgrqogiKU2CArpbUsVTqNBzwtgAaZXsfpVlfal4f4azijRdfCfTbItLYS0ixXblZnXihL4c79g1Ds/3c9wtS8L/JWwf9PpKNYuUui6AzVykUIbqnN8wr/Idi5v9Xy6zVzyqg6FcVUHRfBRRdVAFFv//cn4GW/1paWlpK9BcRsutogYHJewAAAABJRU5ErkJggg=="
            },
            982: function(e) {
                e.exports = "https://images.rbxcdn.com/d061775f2c5685fdb5f332aaefc8fc7b-hearts_large@3x.png"
            },
            844: function(e) {
                e.exports = "https://images.rbxcdn.com/d7918c88e1d1f803332755fd8a3b6536-lock_xxlarge@3x.png"
            },
            937: function(e) {
                e.exports = "https://images.rbxcdn.com/51becc9e20f99dc4be7106264a364d58-voicechat_large@3x.png"
            }
        },
        t = {};

    function n(r) {
        var a = t[r];
        if (void 0 !== a) return a.exports;
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
        }, n.o = function(e, t) {
            return Object.prototype.hasOwnProperty.call(e, t)
        },
        function() {
            "use strict";
            var e = React,
                t = n.n(e),
                r = Roblox,
                a = n.n(r),
                i = ReactDOM,
                o = CoreUtilities,
                l = "id-verification-container",
                c = PropTypes,
                s = n.n(c),
                u = ReactUtilities,
                d = ReactStyleGuide,
                f = "SET_USER_EMAIL_STATES",
                p = "SET_MODAL_STATES",
                m = "SET_PAGENAME_STATE",
                g = "SET_INPUT_STATE",
                h = "SET_ERROR_STATE",
                v = "SET_EMAIL_UPDATING_STATE",
                y = "SET_TRIGGER_ORIGIN",
                b = "SET_INPUT_CLEAR",
                E = "SET_VERIFICATION_CALLBACK",
                A = "SET_CALLBACK_READY",
                C = "CLEANUP_MODAL",
                w = n(574),
                x = CoreRobloxUtilities,
                S = x.eventStreamService.eventTypes,
                k = "ageVerification",
                N = "voiceChat",
                L = "avatarVideo",
                R = "buttonClick",
                T = {
                    showQRCode: {
                        name: "showQRCode",
                        type: S.modalAction,
                        context: k,
                        params: {
                            aType: "shown",
                            field: "ageVerificationQRCode"
                        }
                    },
                    showAddEmailModal: {
                        name: "showAddEmailModal",
                        type: S.modalAction,
                        context: k,
                        params: {
                            aType: "shown",
                            field: "addEmail"
                        }
                    },
                    useAddEmailField: {
                        name: "useAddEmailField",
                        type: S.formInteraction,
                        context: k,
                        params: {
                            btn: "emailAddress",
                            field: "addEmail"
                        }
                    },
                    addEmailConfirm: {
                        name: "addEmailConfirm",
                        type: R,
                        context: k,
                        params: {
                            btn: "continue",
                            field: "addEmail"
                        }
                    },
                    showModal: {
                        name: "showModal",
                        type: S.modalAction,
                        context: k,
                        params: {
                            aType: "shown",
                            field: "startAgeVerification"
                        }
                    },
                    verificationLinkClicked: {
                        name: "verificationLinkClicked",
                        type: R,
                        context: k,
                        params: {
                            btn: "startSession",
                            field: "startAgeVerification"
                        }
                    },
                    exitIdentityVerification: {
                        name: "exitIdentityVerification",
                        type: S.modalAction,
                        context: k,
                        params: {
                            aType: "dismissed",
                            field: "startAgeVerification"
                        }
                    },
                    verificationInProgress: {
                        name: "verificationInProgress",
                        type: S.modalAction,
                        context: k,
                        params: {
                            aType: "shown",
                            field: "ageVerificationProgress"
                        }
                    },
                    verificationPending: {
                        name: "verificationPending",
                        type: S.modalAction,
                        context: k,
                        params: {
                            aType: "shown",
                            field: "ageVerificationPending"
                        }
                    },
                    successPage: {
                        name: "successPage",
                        type: S.modalAction,
                        context: k,
                        params: {
                            aType: "shown",
                            field: "ageVerificationSucceded"
                        }
                    },
                    successPageClose: {
                        name: "successPageClose",
                        type: R,
                        context: k,
                        params: {
                            btn: "Done",
                            field: "ageVerificationSucceded"
                        }
                    },
                    failurePage: {
                        name: "failurePage",
                        type: S.modalAction,
                        context: k,
                        params: {
                            aType: "shown",
                            field: "ageVerificationFailed"
                        }
                    },
                    failurePageClose: {
                        name: "failurePageClose",
                        type: R,
                        context: k,
                        params: {
                            btn: "Done",
                            field: "ageVerificationFailed"
                        }
                    },
                    tempBanPage: {
                        name: "tempBanPage",
                        type: S.modalAction,
                        context: k,
                        params: {
                            aType: "shown",
                            field: "ageVerificationTempBanned"
                        }
                    },
                    tempBanPageClose: {
                        name: "tempBanPageClose",
                        type: R,
                        context: k,
                        params: {
                            btn: "Done",
                            field: "ageVerificationTempBanned"
                        }
                    },
                    joinWithoutVoiceChat: {
                        name: "joinWithoutVoiceChat",
                        type: "joinWithoutVoiceChat",
                        context: N,
                        params: {
                            dontShowAgain: !1
                        }
                    },
                    closeEnableVoiceChatModal: {
                        name: "closeEnableVoiceChatModal",
                        type: "closeEnableVoiceChatModal",
                        context: N
                    },
                    showEnableVoiceChatModal: {
                        name: "showEnableVoiceChatModal",
                        type: "showEnableVoiceChatModal",
                        context: N
                    },
                    enableVoiceChatUpsell: {
                        name: "enableVoiceChatUpsell",
                        type: "enableVoiceChatUpsell",
                        context: N
                    },
                    learnMoreAboutVoiceRecordingUpsell: {
                        name: "learnMoreAboutVoiceRecordingUpsell",
                        type: "learnMoreAboutVoiceRecordingUpsell",
                        context: N
                    },
                    joinWithoutAvatarVideo: {
                        name: "joinWithoutAvatarVideo",
                        type: "joinWithoutAvatarVideo",
                        context: L
                    },
                    showUnifiedChatUpsellModal: {
                        name: "showUnifiedChatUpsellModal",
                        type: "showUnifiedChatUpsellModal",
                        context: L
                    },
                    enableAvatarVideo: {
                        name: "enableAvatarVideo",
                        type: "enableAvatarVideo",
                        context: L
                    },
                    learnMoreAvatarVideo: {
                        name: "learnMoreAvatarVideo",
                        type: "learnMoreAvatarVideo",
                        context: L
                    }
                },
                U = "LANDING",
                V = "EMAIL",
                P = "SUCCESS_OVERAGE",
                I = "SUCCESS_UNDERAGE",
                M = "SUCCESS",
                B = "FAILURE",
                O = "PENDING",
                j = "POLLING",
                D = "EMAIL_CONTINUE",
                q = "EXTERNAL_EMAIL",
                F = "ERROR",
                H = "TEMP_BAN",
                _ = "VENDOR_LINK",
                K = "ENABLE_VOICE_CHAT",
                Q = "ENABLE_AVATAR_CHAT",
                z = "AccountSettings",
                Y = "LuaApp",
                J = "WebApp",
                W = "parent-account-setup",
                G = "parental-verification",
                X = 0,
                Z = 1,
                $ = 2,
                ee = 3,
                te = 4,
                ne = 5,
                re = 6,
                ae = 7,
                ie = 2,
                oe = 3,
                le = 4,
                ce = 5,
                se = 6,
                ue = 7,
                de = 0,
                fe = 1,
                pe = 2,
                me = 3,
                ge = "OpenVoiceOptInOverlay",
                he = "OpenCameraOptInOverlay",
                ve = "OpenIdentityVerificationModal",
                ye = r.EnvironmentUrls.apiGatewayUrl,
                be = r.EnvironmentUrls.accountSettingsApi,
                Ee = r.EnvironmentUrls.voiceApi,
                Ae = function() {
                    return {
                        retryable: !0,
                        withCredentials: !0,
                        url: "".concat(be, "/v1/email")
                    }
                },
                Ce = "".concat(r.EnvironmentUrls.websiteUrl, "/parents/account-setup");

            function we(e, t) {
                var n = Object.keys(e);
                if (Object.getOwnPropertySymbols) {
                    var r = Object.getOwnPropertySymbols(e);
                    t && (r = r.filter((function(t) {
                        return Object.getOwnPropertyDescriptor(e, t).enumerable
                    }))), n.push.apply(n, r)
                }
                return n
            }

            function xe(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {};
                    t % 2 ? we(Object(n), !0).forEach((function(t) {
                        Se(e, t, n[t])
                    })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(n)) : we(Object(n)).forEach((function(t) {
                        Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(n, t))
                    }))
                }
                return e
            }

            function Se(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }
            var ke = function() {
                    var e = {
                        retryable: !0,
                        withCredentials: !0,
                        url: "".concat(ye, "/age-verification-service/v1/persona-id-verification/start-verification")
                    };
                    return o.httpService.post(e, {
                        generateLink: !0
                    }).then((function(e) {
                        return e.data
                    }), (function() {
                        return !1
                    }))
                },
                Ne = function() {
                    var e = {
                        retryable: !0,
                        withCredentials: !0,
                        url: "".concat(ye, "/age-verification-service/v1/age-verification/verified-age")
                    };
                    return o.httpService.get(e).then((function(e) {
                        return e.data
                    }))
                },
                Le = function(e) {
                    var t = {
                            retryable: !0,
                            withCredentials: !0,
                            url: "".concat(ye, "/age-verification-service/v1/persona-id-verification/verified-status")
                        },
                        n = {
                            token: e
                        };
                    return o.httpService.get(t, n).then((function(e) {
                        return e.data
                    }))
                },
                Re = function(e, t) {
                    x.eventStreamService.sendEventWithTarget(e.type, e.context, xe(xe({}, e.params), {}, {
                        origin: t.origin
                    }))
                };

            function Te(e, t, n, r, a, i, o) {
                try {
                    var l = e[i](o),
                        c = l.value
                } catch (e) {
                    return void n(e)
                }
                l.done ? t(c) : Promise.resolve(c).then(r, a)
            }

            function Ue(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var n = [],
                        r = !0,
                        a = !1,
                        i = void 0;
                    try {
                        for (var o, l = e[Symbol.iterator](); !(r = (o = l.next()).done) && (n.push(o.value), !t || n.length !== t); r = !0);
                    } catch (e) {
                        a = !0, i = e
                    } finally {
                        try {
                            r || null == l.return || l.return()
                        } finally {
                            if (a) throw i
                        }
                    }
                    return n
                }(e, t) || function(e, t) {
                    if (!e) return;
                    if ("string" == typeof e) return Ve(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    "Object" === n && e.constructor && (n = e.constructor.name);
                    if ("Map" === n || "Set" === n) return Array.from(e);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return Ve(e, t)
                }(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function Ve(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = new Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function Pe(n) {
                var r = n.translate,
                    a = n.onHide,
                    i = n.verificationLink,
                    o = n.useQRCode,
                    l = n.checklistStep,
                    c = n.origin,
                    s = Ue((0, e.useState)(), 2),
                    u = s[0],
                    f = s[1],
                    p = Ue((0, e.useState)(!1), 2),
                    m = p[0],
                    g = p[1];
                (0, e.useEffect)((function() {
                    function e() {
                        var t;
                        return t = regeneratorRuntime.mark((function e() {
                            var t;
                            return regeneratorRuntime.wrap((function(e) {
                                for (;;) switch (e.prev = e.next) {
                                    case 0:
                                        return e.prev = 0, e.next = 3, w.toDataURL(i, {
                                            errorCorrectionLevel: "H"
                                        });
                                    case 3:
                                        t = e.sent, f(t), e.next = 10;
                                        break;
                                    case 7:
                                        throw e.prev = 7, e.t0 = e.catch(0), new Error(e.t0);
                                    case 10:
                                        return e.prev = 10, g(o && t), e.finish(10);
                                    case 13:
                                    case "end":
                                        return e.stop()
                                }
                            }), e, null, [
                                [0, 7, 10, 13]
                            ])
                        })), e = function() {
                            var e = this,
                                n = arguments;
                            return new Promise((function(r, a) {
                                var i = t.apply(e, n);

                                function o(e) {
                                    Te(i, r, a, o, l, "next", e)
                                }

                                function l(e) {
                                    Te(i, r, a, o, l, "throw", e)
                                }
                                o(void 0)
                            }))
                        }, e.apply(this, arguments)
                    }! function() {
                        e.apply(this, arguments)
                    }()
                }), [o, i]);
                return t().createElement(t().Fragment, null, t().createElement(d.Modal.Header, {
                    useBaseBootstrapComponent: !0
                }, t().createElement("div", {
                    className: "email-upsell-title-container"
                }, t().createElement("button", {
                    type: "button",
                    className: "email-upsell-title-button",
                    onClick: a
                }, t().createElement("span", {
                    className: "close icon-close"
                })), t().createElement(d.Modal.Title, {
                    id: "contained-modal-title-vcenter"
                }, r("Heading.IdentityVerification")))), t().createElement(d.Modal.Body, {
                    className: "verification-checklist-page-content"
                }, t().createElement("div", {
                    className: "cta"
                }, r(l === de || l === fe ? "Label.VerifyInBrowser" : "Label.VerificationDataSubmitted")), t().createElement("ul", {
                    className: "checklist-wrapper"
                }, ["Label.ConnectingToMobile", "Label.VerifyingYou", "Label.VerificationWaitingForResults", "Label.UpdatingRoblox"].map((function(e, n) {
                    return n <= l ? t().createElement("li", {
                        className: "checklist-item"
                    }, t().createElement("span", {
                        className: "check-wrapper"
                    }, t().createElement("span", {
                        className: n === l ? "spinner spinner-sm" : "icon-checkmark"
                    })), t().createElement("span", {
                        className: "checklist-text"
                    }, r(e))) : null
                }))), m && t().createElement("div", {
                    className: "verification-link-page-content"
                }, t().createElement("div", {
                    className: "qr-code-wrapper"
                }, t().createElement("img", {
                    className: "qr-code-img",
                    src: u,
                    alt: "qr"
                })), t().createElement("div", {
                    className: "footer-text"
                }, r("Label.HavingTroubleScanCode"))), !m && t().createElement("a", {
                    href: i,
                    onClick: function() {
                        Re(T.verificationLinkClicked, {
                            origin: c
                        })
                    },
                    target: "_blank",
                    rel: "noreferrer"
                }, t().createElement(d.Button, {
                    className: "primary-link",
                    variant: d.Button.variants.primary,
                    size: d.Button.sizes.medium,
                    width: d.Button.widths.full
                }, r("Action.RestartSession"))), t().createElement("div", {
                    className: "footer-text"
                }, r("Label.PleaseDoNotClose"))))
            }
            Pe.propTypes = {
                translate: s().func.isRequired,
                onHide: s().func.isRequired,
                verificationLink: s().string.isRequired,
                useQRCode: s().bool.isRequired,
                checklistStep: s().number.isRequired,
                origin: s().string.isRequired
            };
            var Ie = Pe,
                Me = {
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
                };

            function Be(e, t) {
                var n = Object.keys(e);
                if (Object.getOwnPropertySymbols) {
                    var r = Object.getOwnPropertySymbols(e);
                    t && (r = r.filter((function(t) {
                        return Object.getOwnPropertyDescriptor(e, t).enumerable
                    }))), n.push.apply(n, r)
                }
                return n
            }

            function Oe(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }
            var je = function(e) {
                    var t = {
                            retryable: !0,
                            withCredentials: !0,
                            url: "".concat(Ee, "/v1/settings/verify/show-overlay")
                        },
                        n = {
                            showOverlay: e
                        };
                    return o.httpService.post(t, n).then((function(e) {
                        return e.data
                    }))
                },
                De = function(e, t) {
                    var n = {
                            withCredentials: !0,
                            url: "".concat(Ee, "/v1/settings/user-opt-in")
                        },
                        r = {
                            isUserOptIn: e,
                            isOptedInThroughUpsell: t
                        };
                    return o.httpService.post(n, r).then((function(e) {
                        return e.data
                    }))
                },
                qe = function(e, t) {
                    var n = {
                            withCredentials: !0,
                            url: "".concat(Ee, "/v1/settings/user-opt-in/avatarvideo")
                        },
                        r = {
                            isUserOptIn: e,
                            isOptedInThroughUpsell: t
                        };
                    return o.httpService.post(n, r).then((function(e) {
                        return e.data
                    }))
                },
                Fe = function() {
                    var e = {
                        withCredentials: !0,
                        url: "".concat(Ee, "/v1/settings/record-user-seen-upsell-modal")
                    };
                    return o.httpService.post(e, {}).then((function(e) {
                        return e.data
                    }))
                },
                He = function() {
                    var e = {
                        withCredentials: !0,
                        url: "".concat(Ee, "/v1/settings/record-user-seen-avatar-video-upsell-modal")
                    };
                    return o.httpService.post(e, {}).then((function(e) {
                        return e.data
                    }))
                },
                _e = function(e) {
                    x.eventStreamService.sendEventWithTarget(e.type, e.context, function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var n = null != arguments[t] ? arguments[t] : {};
                            t % 2 ? Be(Object(n), !0).forEach((function(t) {
                                Oe(e, t, n[t])
                            })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(n)) : Be(Object(n)).forEach((function(t) {
                                Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(n, t))
                            }))
                        }
                        return e
                    }({}, e.params))
                };

            function Ke(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var n = [],
                        r = !0,
                        a = !1,
                        i = void 0;
                    try {
                        for (var o, l = e[Symbol.iterator](); !(r = (o = l.next()).done) && (n.push(o.value), !t || n.length !== t); r = !0);
                    } catch (e) {
                        a = !0, i = e
                    } finally {
                        try {
                            r || null == l.return || l.return()
                        } finally {
                            if (a) throw i
                        }
                    }
                    return n
                }(e, t) || function(e, t) {
                    if (!e) return;
                    if ("string" == typeof e) return Qe(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    "Object" === n && e.constructor && (n = e.constructor.name);
                    if ("Map" === n || "Set" === n) return Array.from(e);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return Qe(e, t)
                }(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function Qe(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = new Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function ze(e, t) {
                var n = Object.keys(e);
                if (Object.getOwnPropertySymbols) {
                    var r = Object.getOwnPropertySymbols(e);
                    t && (r = r.filter((function(t) {
                        return Object.getOwnPropertyDescriptor(e, t).enumerable
                    }))), n.push.apply(n, r)
                }
                return n
            }

            function Ye(e) {
                for (var t = 1; t < arguments.length; t++) {
                    var n = null != arguments[t] ? arguments[t] : {};
                    t % 2 ? ze(Object(n), !0).forEach((function(t) {
                        Je(e, t, n[t])
                    })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(n)) : ze(Object(n)).forEach((function(t) {
                        Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(n, t))
                    }))
                }
                return e
            }

            function Je(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }
            var We = r.EnvironmentUrls.websiteUrl,
                Ge = Me.ActionGenericSkip,
                Xe = Me.ActionContinue,
                Ze = Me.DescriptionAddEmailTextOver13,
                $e = Me.DescriptionAddEmailTextUnder13,
                et = Me.HeadingAddEmail,
                tt = Me.LabelEmailInputPlaceholderOver13,
                nt = Me.LabelEmailInputPlaceholderUnder13,
                rt = {
                    pageName: O,
                    isEmailVerified: !1,
                    isEmailSent: !1,
                    isEmailUpdating: !1,
                    origin: "",
                    userEmail: "",
                    userEmailInput: "",
                    userEmailInputPlaceholder: tt,
                    errorMsg: "",
                    titleText: et,
                    bodyText: Ze,
                    primaryButtonText: Xe,
                    secondaryButtonText: Me.ActionChangeEmail,
                    daysUntilNextVerification: 0,
                    skipCallback: null,
                    pageState: null,
                    closeCallback: null,
                    callbackReady: !1
                },
                at = (0, e.createContext)(rt);
            var it = function(e, t) {
                    var n, a, i = null;
                    switch (t.type) {
                        case b:
                            return Ye(Ye({}, e), {}, {
                                userEmailInput: ""
                            });
                        case y:
                            return Ye(Ye({}, e), {}, {
                                origin: t.origin,
                                skipCallback: t.skipCallback
                            });
                        case f:
                            return Ye(Ye({}, e), {}, {
                                isEmailVerified: t.isEmailVerified,
                                userEmail: t.userEmail
                            });
                        case m:
                            if (t.pageName === P) i = {
                                heading: "Heading.ThankYou",
                                icon: "success-icon",
                                bodyText: ["Label.OverageVerification", "Label.VoiceChat"],
                                buttonStack: [{
                                    variant: d.Button.variants.primary,
                                    text: "Action.OK",
                                    callback: function() {
                                        t.close()
                                    }
                                }],
                                canClose: !1
                            };
                            else if (t.pageName === I) i = {
                                heading: "Heading.ThankYou",
                                icon: "success-icon",
                                bodyText: ["Label.UnderageVerification", "Label.VoiceChat"],
                                footerText: "Label.ToggleFeatures",
                                buttonStack: [{
                                    variant: d.Button.variants.primary,
                                    text: "Action.Close",
                                    callback: function() {
                                        t.close()
                                    }
                                }],
                                canClose: !1
                            };
                            else if (t.pageName === M) {
                                Re(T.successPage, {
                                    origin: e.origin
                                });
                                var l = ["Label.DateOfBirthUpdated"];
                                t.isSeventeenPlus && l.push("Label.AccessWiderVariety"), i = {
                                    heading: "Heading.VerificationSuccessful",
                                    bodyText: l,
                                    buttonStack: [{
                                        variant: d.Button.variants.primary,
                                        text: "Action.Close",
                                        callback: function() {
                                            Re(T.successPageClose, {
                                                origin: e.origin
                                            }), t.close()
                                        }
                                    }],
                                    canClose: !1
                                }
                            } else t.pageName === q ? i = {
                                heading: "Heading.VerifyEmail",
                                icon: "shield-icon",
                                bodyText: ["Label.EmailSent"],
                                buttonStack: [{
                                    variant: d.Button.variants.primary,
                                    text: "Action.Continue",
                                    callback: function() {
                                        t.dispatch({
                                            type: m,
                                            pageName: j
                                        }), t.poll()
                                    }
                                }],
                                userEmail: e.userEmail
                            } : t.pageName === D ? i = {
                                heading: "Heading.VerificationPending",
                                icon: "shield-icon",
                                bodyText: ["Label.EmailSent"],
                                buttonStack: [{
                                    variant: d.Button.variants.primary,
                                    text: "Action.Continue",
                                    callback: function() {
                                        t.dispatch({
                                            type: m,
                                            pageName: j
                                        }), t.poll()
                                    }
                                }],
                                userEmail: e.userEmail
                            } : t.pageName === j ? i = Ye({}, t) : t.pageName === O ? i = {
                                heading: "Heading.VerificationPending",
                                icon: "failure-icon",
                                bodyText: ["Label.PendingVerification"],
                                buttonStack: [{
                                    variant: d.Button.variants.primary,
                                    text: "Action.Close",
                                    callback: function() {
                                        t.close()
                                    }
                                }],
                                canClose: !1
                            } : t.pageName === B ? (Re(T.failurePage, {
                                origin: e.origin
                            }), i = {
                                heading: "Heading.VerificationFailed",
                                icon: "failure-icon",
                                bodyText: [t.textKey || "Label.FailedVerification"],
                                errorState: !0,
                                buttonStack: [{
                                    variant: d.Button.variants.primary,
                                    text: "Action.Close",
                                    callback: function() {
                                        Re(T.failurePageClose, {
                                            origin: e.origin
                                        }), t.close()
                                    }
                                }],
                                canClose: !1
                            }) : t.pageName === U ? i = {
                                heading: "Heading.VerifyAge",
                                icon: "shield-icon",
                                bodyText: ["Label.VoiceChatUpsell"],
                                buttonStack: [{
                                    text: "Action.SkipVoiceChat",
                                    callback: function() {
                                        t.dispatch({
                                            type: C
                                        })
                                    }
                                }, {
                                    variant: d.Button.variants.primary,
                                    text: "Action.Continue",
                                    callback: function() {
                                        t.continue()
                                    }
                                }],
                                userEmail: e.userEmail,
                                displayCheckbox: !0
                            } : t.pageName === F ? i = {
                                heading: "Heading.Error",
                                icon: "failure-icon",
                                bodyText: ["Label.GenericError"],
                                buttonStack: [{
                                    variant: d.Button.variants.primary,
                                    text: "Action.OK",
                                    callback: function() {
                                        t.close()
                                    }
                                }],
                                canClose: !1
                            } : t.pageName === H ? (Re(T.tempBanPage, {
                                origin: e.origin
                            }), i = {
                                heading: "Heading.Error",
                                icon: "failure-icon",
                                bodyText: ["Label.VerificationDeclined"],
                                buttonStack: [{
                                    variant: d.Button.variants.primary,
                                    text: "Action.OK",
                                    callback: function() {
                                        Re(T.tempBanPageClose, {
                                            origin: e.origin
                                        }), t.close()
                                    }
                                }],
                                daysUntilNextVerification: t.daysUntilNextVerification,
                                canClose: !1
                            }) : t.pageName === _ ? (t.useQRCode && Re(T.showQRCode, {
                                origin: e.origin
                            }), i = {
                                verificationLink: t.verificationLink,
                                useQRCode: t.useQRCode,
                                origin: e.origin,
                                redirectUrl: t.redirectUrl
                            }) : t.pageName === K ? i = {
                                communityStandardsUrl: o.urlService.resolveUrl(We, "/info/community-guidelines"),
                                voiceFAQUrl: o.urlService.resolveUrl(We, "/info/voice-faq"),
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
                                        variant: d.Button.variants.secondary,
                                        text: "Action.SkipVoiceChat",
                                        callback: function() {
                                            _e(T.joinWithoutVoiceChat), t.close()
                                        }
                                    }, {
                                        explicitDisable: !0,
                                        variant: d.Button.variants.primary,
                                        text: "Label.EnableVoiceChat",
                                        callback: function() {
                                            De(!0, !0), t.close()
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
                                        variant: d.Button.variants.primary,
                                        text: "Label.V2EnableVoiceChat",
                                        callback: function() {
                                            _e(T.enableVoiceChatUpsell), De(!0, !0), t.close()
                                        }
                                    }, {
                                        explicitDisable: !1,
                                        variant: d.Button.variants.secondary,
                                        text: "Label.V2JoinWithout",
                                        callback: function() {
                                            _e(T.joinWithoutVoiceChat), t.close()
                                        }
                                    }]
                                }
                            } : t.pageName === Q && (i = {
                                title: "Title.CameraUpsell",
                                animateYourAvatar: "Description.CameraUpsell",
                                communityStandards: "Description.CommunityStandardsUpsell",
                                cameraPrivacy: "Description.CameraPrivacy",
                                implicitConsent: "Description.DefaultConsentCameraUpsell",
                                explicitConsent: "Description.ExplicitConsentCameraUpsell",
                                learnMore: "Label.CameraLearnMoreUpsell",
                                facialPrivacyUrl: o.urlService.resolveUrl(We, "/info/facial-animation-privacy"),
                                requireExplicitCameraConsent: t.requireExplicitCameraConsent,
                                useCameraU13Design: t.useCameraU13Design,
                                buttons: [{
                                    text: "Label.EnableCameraUpsell",
                                    explicitDisable: !0,
                                    callback: function() {
                                        qe(!0, !0), _e(T.enableAvatarVideo), t.close()
                                    }
                                }, {
                                    text: "Label.JoinWithoutCameraUpsell",
                                    explicitDisable: !1,
                                    callback: function() {
                                        _e(T.joinWithoutAvatarVideo), t.close()
                                    }
                                }]
                            });
                            return Ye(Ye({}, e), {}, {
                                pageName: t.pageName,
                                pageState: i
                            });
                        case h:
                            return Ye(Ye({}, e), {}, {
                                errorMsg: t.errorMsg
                            });
                        case v:
                            return Ye(Ye({}, e), {}, {
                                isEmailUpdating: t.isEmailUpdating
                            });
                        case g:
                            return e.pageName === V ? Ye(Ye({}, e), {}, {
                                userEmailInput: t.value,
                                errorMsg: ""
                            }) : e;
                        case p:
                            if (e.pageName === V) {
                                var c = r.CurrentUser && !r.CurrentUser.isUnder13,
                                    s = Ze,
                                    u = $e,
                                    w = et,
                                    x = "";
                                return e.skipCallback && (x = Ge), Ye(Ye({}, e), {}, {
                                    titleText: w,
                                    bodyText: c ? s : u,
                                    primaryButtonText: Xe,
                                    secondaryButtonText: x,
                                    errorMsg: "",
                                    userEmailInputPlaceholder: c ? tt : nt
                                })
                            }
                            return e;
                        case E:
                            return Ye(Ye({}, e), {}, {
                                closeCallback: t.callback,
                                callbackReady: !0
                            });
                        case A:
                            return Ye(Ye({}, e), {}, {
                                callbackReady: !0
                            });
                        case C:
                            if (e.callbackReady) {
                                var S = e.pageName === M || e.pageName === P,
                                    k = S || e.pageName === I;
                                n = S, a = k, r.Hybrid && r.Hybrid.Navigation && r.Hybrid.Navigation.navigateToFeature({
                                    feature: "close-veratad-modal-event",
                                    overage: n,
                                    verified: a
                                }), e.closeCallback && e.closeCallback(S, k)
                            }
                            return Ye({}, rt);
                        default:
                            return e
                    }
                },
                ot = function(n) {
                    var r = n.children,
                        a = Ke((0, e.useReducer)(it, rt), 2),
                        i = a[0],
                        o = a[1];
                    return t().createElement(at.Provider, {
                        value: {
                            idVerificationState: i,
                            dispatch: o
                        }
                    }, r)
                };

            function lt() {
                return (0, e.useContext)(at)
            }

            function ct(e) {
                var n = e.onHide,
                    r = e.onPrimaryAction,
                    a = e.onSecondaryAction,
                    i = e.onInputChange,
                    o = e.onInputFocus,
                    l = e.onKeyDown,
                    c = e.translate,
                    s = lt().idVerificationState,
                    u = s.pageName,
                    f = s.titleText,
                    p = s.bodyText,
                    m = s.primaryButtonText,
                    g = s.secondaryButtonText,
                    h = s.userEmailInput,
                    v = s.userEmailInputPlaceholder,
                    y = s.userEmail,
                    b = s.errorMsg,
                    E = s.isEmailUpdating;
                return t().createElement(t().Fragment, null, t().createElement(d.Modal.Header, {
                    useBaseBootstrapComponent: !0
                }, t().createElement("div", {
                    className: "email-upsell-title-container"
                }, t().createElement("button", {
                    type: "button",
                    className: "email-upsell-title-button",
                    onClick: n
                }, t().createElement("span", {
                    className: "close icon-close"
                })), t().createElement(d.Modal.Title, {
                    id: "contained-modal-title-vcenter"
                }, c(f)))), t().createElement(d.Modal.Body, null, t().createElement("div", {
                    className: "email-upsell-image"
                }), t().createElement("p", {
                    className: "email-upsell-text-body"
                }, c(p, {
                    emailAddress: y
                })), u === V && t().createElement("input", {
                    type: "email",
                    autoFocus: !0,
                    className: "".concat(b ? "input-field-error" : "", " form-control input-field email-upsell-modal-input"),
                    placeholder: c(v),
                    value: h,
                    onFocus: function() {
                        return o()
                    },
                    onChange: function(e) {
                        return i(e.target.value)
                    },
                    onKeyDown: function(e) {
                        return l(e.key)
                    }
                }), b && t().createElement("p", {
                    className: "text-error modal-error-message"
                }, c(b))), t().createElement(d.Modal.Footer, null, t().createElement("div", {
                    className: "email-upsell-footer-container"
                }, u === V && t().createElement(d.Button, {
                    className: "modal-button email-upsell-btn",
                    variant: d.Button.variants.cta,
                    size: d.Button.sizes.medium,
                    isDisabled: E,
                    onClick: r
                }, c(m)), g && t().createElement("button", {
                    type: "button",
                    className: "change-email-button",
                    onClick: a
                }, c(g)))))
            }
            ot.propTypes = {
                children: s().node.isRequired
            }, ct.propTypes = {
                translate: s().func.isRequired,
                onHide: s().func.isRequired,
                onPrimaryAction: s().func.isRequired,
                onSecondaryAction: s().func.isRequired,
                onInputChange: s().func.isRequired,
                onKeyDown: s().func.isRequired,
                onInputFocus: s().func.isRequired
            };
            var st = (0, u.withTranslations)(ct, {
                    common: [],
                    feature: "Feature.VerificationUpsell"
                }),
                ut = n(982),
                dt = n.n(ut),
                ft = n(937),
                pt = n.n(ft),
                mt = n(870),
                gt = n.n(mt);

            function ht(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var n = [],
                        r = !0,
                        a = !1,
                        i = void 0;
                    try {
                        for (var o, l = e[Symbol.iterator](); !(r = (o = l.next()).done) && (n.push(o.value), !t || n.length !== t); r = !0);
                    } catch (e) {
                        a = !0, i = e
                    } finally {
                        try {
                            r || null == l.return || l.return()
                        } finally {
                            if (a) throw i
                        }
                    }
                    return n
                }(e, t) || function(e, t) {
                    if (!e) return;
                    if ("string" == typeof e) return vt(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    "Object" === n && e.constructor && (n = e.constructor.name);
                    if ("Map" === n || "Set" === n) return Array.from(e);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return vt(e, t)
                }(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function vt(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = new Array(t); n < t; n++) r[n] = e[n];
                return r
            }
            var yt = function(n, r, a, i, o) {
                var l = ht((0, e.useState)(!o), 2),
                    c = l[0],
                    s = l[1];
                return [t().createElement("div", {
                    className: "checkbox checkbox-container"
                }, o ? t().createElement(t().Fragment, null, t().createElement("input", {
                    type: "checkbox",
                    checked: c,
                    onClick: function() {
                        s(!c), je(c)
                    },
                    id: "isShowOverlayChecked"
                }), t().createElement("label", {
                    htmlFor: "isShowOverlayChecked",
                    className: "voice-modal-checkbox-label"
                }, n(i, {
                    linkStart: "",
                    linkEnd: ""
                }))) : t().createElement("span", null, n(a, {
                    linkStart: "",
                    linkEnd: ""
                }))), r.map((function(e) {
                    var r = e.variant === d.Button.variants.primary;
                    return t().createElement("span", {
                        key: e.text
                    }, t().createElement(d.Button, {
                        className: gt()("button-stack-button", {
                            "primary-link": r,
                            "secondary-link": !r
                        }),
                        variant: e.variant,
                        size: d.Button.sizes.medium,
                        isDisabled: o && e.explicitDisable && !c,
                        onClick: e.callback
                    }, n(e.text)))
                }))]
            };

            function bt(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var n = [],
                        r = !0,
                        a = !1,
                        i = void 0;
                    try {
                        for (var o, l = e[Symbol.iterator](); !(r = (o = l.next()).done) && (n.push(o.value), !t || n.length !== t); r = !0);
                    } catch (e) {
                        a = !0, i = e
                    } finally {
                        try {
                            r || null == l.return || l.return()
                        } finally {
                            if (a) throw i
                        }
                    }
                    return n
                }(e, t) || function(e, t) {
                    if (!e) return;
                    if ("string" == typeof e) return Et(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    "Object" === n && e.constructor && (n = e.constructor.name);
                    if ("Map" === n || "Set" === n) return Array.from(e);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return Et(e, t)
                }(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function Et(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = new Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function At(n) {
                var r = n.translate,
                    a = n.communityStandardsUrl,
                    i = n.voiceFAQUrl,
                    o = n.requireExplicitVoiceConsent,
                    l = n.heading,
                    c = n.enableVoiceChat,
                    s = n.followCommunityStandards,
                    u = n.implicitConsent,
                    f = n.explicitConsent,
                    p = n.learnMoreAboutVoiceRecording,
                    m = n.buttonStack,
                    g = n.useVoiceUpsellV2Design,
                    h = bt(yt(r, m, u, f, o), 2),
                    v = h[0],
                    y = h[1];
                return (0, e.useEffect)((function() {
                    _e(T.showEnableVoiceChatModal), Fe()
                }), []), t().createElement(t().Fragment, null, t().createElement(d.Modal.Header, {
                    useBaseBootstrapComponent: !0
                }, t().createElement("div", {
                    className: "email-upsell-title-container"
                }, t().createElement(d.Modal.Title, {
                    id: "contained-modal-title-vcenter"
                }, r(l)))), t().createElement(d.Modal.Body, null, t().createElement("div", null, t().createElement("div", {
                    className: "legal-enable-page-row"
                }, t().createElement("img", {
                    width: 60,
                    height: 60,
                    src: pt(),
                    alt: ""
                }), t().createElement("p", {
                    className: "legal-enable-page-row-label"
                }, r(c))), t().createElement("div", {
                    className: "legal-enable-page-row"
                }, t().createElement("img", {
                    width: 60,
                    height: 60,
                    src: dt(),
                    alt: ""
                }), t().createElement("p", {
                    className: "legal-enable-page-row-label",
                    dangerouslySetInnerHTML: {
                        __html: r(s, {
                            linkStart: '<a class="text-name" target="_blank" rel="noreferrer" href='.concat(a, ">"),
                            linkEnd: "</a>"
                        })
                    }
                }))), v), t().createElement(d.Modal.Footer, null, y), t().createElement("div", {
                    className: "text-footer legal-enable-page-text-footer border-top"
                }, t().createElement("span", null, t().createElement("div", {
                    className: "icon-moreinfo"
                }), t().createElement("a", {
                    className: "text-link legal-enable-page-text-footer-link",
                    target: "_blank",
                    rel: "noreferrer",
                    href: i,
                    onClick: function() {
                        return g && _e(T.learnMoreAboutVoiceRecordingUpsell)
                    }
                }, r(p)))))
            }
            At.propTypes = {
                translate: s().func.isRequired,
                heading: s().string.isRequired,
                enableVoiceChat: s().string.isRequired,
                followCommunityStandards: s().string.isRequired,
                buttonStack: s().arrayOf(s().shape({
                    variant: s().oneOf(d.Button.variants),
                    text: s().string,
                    callback: s().func,
                    explicitDisable: s().bool
                })).isRequired,
                implicitConsent: s().string.isRequired,
                explicitConsent: s().string.isRequired,
                requireExplicitVoiceConsent: s().bool.isRequired,
                learnMoreAboutVoiceRecording: s().string.isRequired,
                communityStandardsUrl: s().string.isRequired,
                voiceFAQUrl: s().string.isRequired,
                useVoiceUpsellV2Design: s().bool.isRequired
            };
            var Ct = At;

            function wt(e, t, n, r, a, i, o) {
                try {
                    var l = e[i](o),
                        c = l.value
                } catch (e) {
                    return void n(e)
                }
                l.done ? t(c) : Promise.resolve(c).then(r, a)
            }

            function xt(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var n = [],
                        r = !0,
                        a = !1,
                        i = void 0;
                    try {
                        for (var o, l = e[Symbol.iterator](); !(r = (o = l.next()).done) && (n.push(o.value), !t || n.length !== t); r = !0);
                    } catch (e) {
                        a = !0, i = e
                    } finally {
                        try {
                            r || null == l.return || l.return()
                        } finally {
                            if (a) throw i
                        }
                    }
                    return n
                }(e, t) || function(e, t) {
                    if (!e) return;
                    if ("string" == typeof e) return St(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    "Object" === n && e.constructor && (n = e.constructor.name);
                    if ("Map" === n || "Set" === n) return Array.from(e);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return St(e, t)
                }(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function St(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = new Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function kt(n) {
                var r = n.translate,
                    a = n.onHide,
                    i = n.verificationLink,
                    o = n.useQRCode,
                    l = n.origin,
                    c = n.entry,
                    s = n.redirectUrl,
                    u = xt((0, e.useState)(), 2),
                    f = u[0],
                    p = u[1],
                    m = xt((0, e.useState)(!1), 2),
                    g = m[0],
                    h = m[1];
                (0, e.useEffect)((function() {
                    function e() {
                        var t;
                        return t = regeneratorRuntime.mark((function e() {
                            var t;
                            return regeneratorRuntime.wrap((function(e) {
                                for (;;) switch (e.prev = e.next) {
                                    case 0:
                                        return e.prev = 0, e.next = 3, w.toDataURL(i, {
                                            errorCorrectionLevel: "H"
                                        });
                                    case 3:
                                        t = e.sent, p(t), e.next = 10;
                                        break;
                                    case 7:
                                        throw e.prev = 7, e.t0 = e.catch(0), new Error(e.t0);
                                    case 10:
                                        return e.prev = 10, h(o && t), e.finish(10);
                                    case 13:
                                    case "end":
                                        return e.stop()
                                }
                            }), e, null, [
                                [0, 7, 10, 13]
                            ])
                        })), e = function() {
                            var e = this,
                                n = arguments;
                            return new Promise((function(r, a) {
                                var i = t.apply(e, n);

                                function o(e) {
                                    wt(i, r, a, o, l, "next", e)
                                }

                                function l(e) {
                                    wt(i, r, a, o, l, "throw", e)
                                }
                                o(void 0)
                            }))
                        }, e.apply(this, arguments)
                    }! function() {
                        e.apply(this, arguments)
                    }()
                }), [o, i]);
                var v = c === W || c === G ? "_self" : "_blank",
                    y = c === W || G ? "".concat(i, "&redirect-uri=").concat(encodeURIComponent(s)) : i;
                return t().createElement(t().Fragment, null, t().createElement(d.Modal.Header, {
                    useBaseBootstrapComponent: !0
                }, t().createElement("div", {
                    className: "email-upsell-title-container"
                }, t().createElement("button", {
                    type: "button",
                    className: "email-upsell-title-button",
                    onClick: a
                }, t().createElement("span", {
                    className: "close icon-close"
                })), t().createElement(d.Modal.Title, {
                    id: "contained-modal-title-vcenter"
                }, r("Heading.IdentityVerification")))), t().createElement(d.Modal.Body, {
                    className: "verification-link-page-content"
                }, t().createElement("div", {
                    className: "verification-link-upsell"
                }, r("Label.AgeVerifyPrompt")), t().createElement("div", {
                    className: "preparation-list-wrapper"
                }, t().createElement("div", {
                    className: "preparation-list-item"
                }, t().createElement("span", {
                    className: "icon-menu-document"
                }), t().createElement("div", {
                    className: "preparation-list-text"
                }, t().createElement("div", {
                    className: "preparation-title"
                }, r("Label.PrepareId")), t().createElement("div", {
                    className: "preparation-text"
                }, r("Label.ValidIdList")))), g && t().createElement("div", {
                    className: "preparation-list-item"
                }, t().createElement("span", {
                    className: "icon-menu-mobile"
                }), t().createElement("div", {
                    className: "preparation-list-text"
                }, t().createElement("div", {
                    className: "preparation-title"
                }, r("Label.UseSmartphone")), t().createElement("div", {
                    className: "preparation-text"
                }, r("Label.SmartphoneRequired"))))), g && t().createElement("div", null, t().createElement("div", {
                    className: "verification-link-upsell"
                }, r("Label.ScanQRCode")), t().createElement("div", {
                    className: "qr-code-wrapper"
                }, t().createElement("img", {
                    className: "qr-code-img",
                    src: f,
                    alt: "qr"
                }))), t().createElement("p", {
                    className: "verification-link-legal",
                    dangerouslySetInnerHTML: {
                        __html: r("Label.PrivacyNoticeAndLink", {
                            spanStart: "<a class='text-link' href='https://en.help.roblox.com/hc/en-us/articles/4412863575316'>",
                            spanEnd: "</a>"
                        })
                    }
                }), !g && t().createElement("a", {
                    href: y,
                    onClick: function() {
                        Re(T.verificationLinkClicked, {
                            origin: l
                        })
                    },
                    target: v,
                    rel: "noreferrer"
                }, t().createElement(d.Button, {
                    className: "primary-link",
                    variant: d.Button.variants.primary,
                    size: d.Button.sizes.medium,
                    width: d.Button.widths.full
                }, r("Action.StartSession")))))
            }
            kt.propTypes = {
                translate: s().func.isRequired,
                onHide: s().func.isRequired,
                verificationLink: s().string.isRequired,
                useQRCode: s().bool.isRequired,
                origin: s().string.isRequired,
                entry: s().string.isRequired,
                redirectUrl: s().string
            }, kt.defaultProps = {
                redirectUrl: ""
            };
            var Nt = kt;

            function Lt(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var n = [],
                        r = !0,
                        a = !1,
                        i = void 0;
                    try {
                        for (var o, l = e[Symbol.iterator](); !(r = (o = l.next()).done) && (n.push(o.value), !t || n.length !== t); r = !0);
                    } catch (e) {
                        a = !0, i = e
                    } finally {
                        try {
                            r || null == l.return || l.return()
                        } finally {
                            if (a) throw i
                        }
                    }
                    return n
                }(e, t) || function(e, t) {
                    if (!e) return;
                    if ("string" == typeof e) return Rt(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    "Object" === n && e.constructor && (n = e.constructor.name);
                    if ("Map" === n || "Set" === n) return Array.from(e);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return Rt(e, t)
                }(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function Rt(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = new Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function Tt(n) {
                var r = n.translate,
                    a = n.onHide,
                    i = n.heading,
                    o = n.icon,
                    l = n.bodyText,
                    c = n.errorState,
                    s = n.footerText,
                    u = n.userEmail,
                    f = n.daysUntilNextVerification,
                    p = n.canClose,
                    m = n.buttonStack,
                    g = n.includeLink,
                    h = n.displayCheckbox,
                    v = Lt((0, e.useState)(!1), 2),
                    y = v[0],
                    b = v[1];
                return t().createElement(t().Fragment, null, t().createElement(d.Modal.Header, {
                    useBaseBootstrapComponent: !0
                }, t().createElement("div", {
                    className: "email-upsell-title-container"
                }, p && t().createElement("button", {
                    type: "button",
                    className: "email-upsell-title-button",
                    onClick: a
                }, t().createElement("span", {
                    className: "close icon-close"
                })), t().createElement(d.Modal.Title, {
                    id: "contained-modal-title-vcenter"
                }, r(i)))), t().createElement(d.Modal.Body, null, o && t().createElement("div", {
                    className: o
                }), t().createElement("ul", {
                    className: c ? "content-list error-text" : "content-list"
                }, g ? l.map((function(e) {
                    return t().createElement("li", {
                        dangerouslySetInnerHTML: {
                            __html: r(e, {
                                spanStart: "<a class='text-link' href='/info/privacy'>",
                                spanEnd: "</a>",
                                boldStart: "<b>",
                                boldEnd: "</b>"
                            })
                        }
                    })
                })) : l.map((function(e) {
                    return t().createElement("li", null, r(e, {
                        age: 18,
                        email: u,
                        days: f
                    }))
                }))), h && t().createElement("div", {
                    className: "checkbox checkbox-container"
                }, t().createElement("input", {
                    id: "isShowOverlayChecked",
                    type: "checkbox",
                    checked: y,
                    onClick: function() {
                        b(!y), je(y)
                    }
                }), t().createElement("label", {
                    htmlFor: "isShowOverlayChecked"
                }, r("Label.DontShowAgain")))), t().createElement(d.Modal.Footer, null, s && t().createElement("p", {
                    className: "small"
                }, t().createElement("b", null, r(s))), m.map((function(e) {
                    var n = e.variant === d.Button.variants.primary;
                    return t().createElement("span", {
                        key: e.text
                    }, t().createElement(d.Button, {
                        className: gt()("button-stack-button", {
                            "primary-link": n,
                            "secondary-link": !n
                        }),
                        variant: e.variant,
                        size: d.Button.sizes.medium,
                        onClick: e.callback
                    }, r(e.text)))
                }))))
            }
            Tt.defaultProps = {
                errorState: !1,
                footerText: null,
                userEmail: null,
                daysUntilNextVerification: 0,
                canClose: !0,
                includeLink: !1,
                displayCheckbox: !1
            }, Tt.propTypes = {
                translate: s().func.isRequired,
                onHide: s().func.isRequired,
                heading: s().string.isRequired,
                icon: s().string.isRequired,
                bodyText: s().arrayOf(s().string).isRequired,
                errorState: s().bool,
                footerText: s().string,
                userEmail: s().string,
                daysUntilNextVerification: s().number,
                canClose: s().bool,
                includeLink: s().bool,
                buttonStack: s().arrayOf(s().shape({
                    variant: s().oneOf(d.Button.variants),
                    text: s().string,
                    callback: s().func
                })).isRequired,
                displayCheckbox: s().bool
            };
            var Ut = Tt,
                Vt = function() {
                    var e = {
                        retryable: !0,
                        withCredentials: !0,
                        url: "".concat(be, "/v1/email/verify")
                    };
                    return o.httpService.post(e).then((function() {
                        return !0
                    }), (function() {
                        return !1
                    }))
                },
                Pt = n(844),
                It = n.n(Pt),
                Mt = n(20),
                Bt = n.n(Mt);

            function Ot(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var n = [],
                        r = !0,
                        a = !1,
                        i = void 0;
                    try {
                        for (var o, l = e[Symbol.iterator](); !(r = (o = l.next()).done) && (n.push(o.value), !t || n.length !== t); r = !0);
                    } catch (e) {
                        a = !0, i = e
                    } finally {
                        try {
                            r || null == l.return || l.return()
                        } finally {
                            if (a) throw i
                        }
                    }
                    return n
                }(e, t) || function(e, t) {
                    if (!e) return;
                    if ("string" == typeof e) return jt(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    "Object" === n && e.constructor && (n = e.constructor.name);
                    if ("Map" === n || "Set" === n) return Array.from(e);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return jt(e, t)
                }(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function jt(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = new Array(t); n < t; n++) r[n] = e[n];
                return r
            }
            var Dt = function(n, r, a, i, o) {
                var l = Ot((0, e.useState)(!i), 2),
                    c = l[0],
                    s = l[1];
                return [t().createElement("div", {
                    className: "checkbox checkbox-container"
                }, i ? t().createElement(t().Fragment, null, t().createElement("input", {
                    type: "checkbox",
                    checked: c,
                    onClick: function() {
                        s(!c)
                    },
                    id: "isShowOverlayChecked"
                }), t().createElement("label", {
                    htmlFor: "isShowOverlayChecked",
                    className: "voice-modal-checkbox-label"
                }, n(a))) : t().createElement("span", null, n(r))), o.map((function(e) {
                    return t().createElement("div", {
                        className: "half-flex",
                        key: e.text
                    }, t().createElement(d.Button, {
                        className: "button-stack-button secondary-link",
                        variant: "secondary",
                        size: d.Button.sizes.medium,
                        isDisabled: i && e.explicitDisable && !c,
                        onClick: e.callback
                    }, n(e.text)))
                }))]
            };

            function qt(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var n = [],
                        r = !0,
                        a = !1,
                        i = void 0;
                    try {
                        for (var o, l = e[Symbol.iterator](); !(r = (o = l.next()).done) && (n.push(o.value), !t || n.length !== t); r = !0);
                    } catch (e) {
                        a = !0, i = e
                    } finally {
                        try {
                            r || null == l.return || l.return()
                        } finally {
                            if (a) throw i
                        }
                    }
                    return n
                }(e, t) || function(e, t) {
                    if (!e) return;
                    if ("string" == typeof e) return Ft(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    "Object" === n && e.constructor && (n = e.constructor.name);
                    if ("Map" === n || "Set" === n) return Array.from(e);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return Ft(e, t)
                }(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function Ft(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = new Array(t); n < t; n++) r[n] = e[n];
                return r
            }

            function Ht(n) {
                var r = n.translate,
                    a = n.title,
                    i = n.animateYourAvatar,
                    o = n.communityStandards,
                    l = n.implicitConsent,
                    c = n.explicitConsent,
                    s = n.requireExplicitCameraConsent,
                    u = n.learnMore,
                    f = n.facialPrivacyUrl,
                    p = n.buttons,
                    m = n.cameraPrivacy,
                    g = n.useCameraU13Design,
                    h = qt(Dt(r, l, c, s, p), 2),
                    v = h[0],
                    y = h[1];
                return (0, e.useEffect)((function() {
                    _e(T.showUnifiedChatUpsellModal), He()
                }), []), t().createElement(t().Fragment, null, t().createElement(d.Modal.Header, {
                    useBaseBootstrapComponent: !0
                }, t().createElement("div", {
                    className: "email-upsell-title-container"
                }, t().createElement(d.Modal.Title, {
                    id: "contained-modal-title-vcenter"
                }, r(a)))), t().createElement(d.Modal.Body, null, t().createElement("div", null, t().createElement("div", {
                    className: "legal-enable-page-row"
                }, t().createElement("img", {
                    width: 60,
                    height: 60,
                    src: Bt(),
                    alt: ""
                }), t().createElement("p", {
                    className: "legal-enable-page-row-label"
                }, r(i))), t().createElement("div", {
                    className: "legal-enable-page-row"
                }, t().createElement("img", {
                    width: 60,
                    height: 60,
                    src: g ? It() : dt(),
                    alt: ""
                }), t().createElement("p", {
                    className: "legal-enable-page-row-label"
                }, r(g ? m : o)))), v), t().createElement(d.Modal.Footer, null, t().createElement("div", {
                    className: "half-flex-container"
                }, y)), t().createElement("div", {
                    className: "text-footer legal-enable-page-text-footer border-top"
                }, t().createElement("span", null, t().createElement("div", {
                    className: "icon-moreinfo"
                }), t().createElement("a", {
                    className: "text-link legal-enable-page-text-footer-link",
                    target: "_blank",
                    rel: "noreferrer",
                    href: f,
                    onClick: function() {
                        return _e(T.learnMoreAvatarVideo)
                    }
                }, r(u)))))
            }
            Ht.propTypes = {
                translate: s().func.isRequired,
                title: s().string.isRequired,
                animateYourAvatar: s().string.isRequired,
                communityStandards: s().string.isRequired,
                implicitConsent: s().string.isRequired,
                explicitConsent: s().string.isRequired,
                learnMore: s().string.isRequired,
                facialPrivacyUrl: s().string.isRequired,
                buttons: s().arrayOf(s().object).isRequired,
                requireExplicitCameraConsent: s().bool.isRequired,
                cameraPrivacy: s().string.isRequired,
                useCameraU13Design: s().bool.isRequired
            };
            var _t = Ht;

            function Kt(e, t) {
                var n = Object.keys(e);
                if (Object.getOwnPropertySymbols) {
                    var r = Object.getOwnPropertySymbols(e);
                    t && (r = r.filter((function(t) {
                        return Object.getOwnPropertyDescriptor(e, t).enumerable
                    }))), n.push.apply(n, r)
                }
                return n
            }

            function Qt(e, t, n) {
                return t in e ? Object.defineProperty(e, t, {
                    value: n,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = n, e
            }

            function zt() {
                return zt = Object.assign || function(e) {
                    for (var t = 1; t < arguments.length; t++) {
                        var n = arguments[t];
                        for (var r in n) Object.prototype.hasOwnProperty.call(n, r) && (e[r] = n[r])
                    }
                    return e
                }, zt.apply(this, arguments)
            }

            function Yt(e, t, n, r, a, i, o) {
                try {
                    var l = e[i](o),
                        c = l.value
                } catch (e) {
                    return void n(e)
                }
                l.done ? t(c) : Promise.resolve(c).then(r, a)
            }

            function Jt(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise((function(r, a) {
                        var i = e.apply(t, n);

                        function o(e) {
                            Yt(i, r, a, o, l, "next", e)
                        }

                        function l(e) {
                            Yt(i, r, a, o, l, "throw", e)
                        }
                        o(void 0)
                    }))
                }
            }

            function Wt(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    if ("undefined" == typeof Symbol || !(Symbol.iterator in Object(e))) return;
                    var n = [],
                        r = !0,
                        a = !1,
                        i = void 0;
                    try {
                        for (var o, l = e[Symbol.iterator](); !(r = (o = l.next()).done) && (n.push(o.value), !t || n.length !== t); r = !0);
                    } catch (e) {
                        a = !0, i = e
                    } finally {
                        try {
                            r || null == l.return || l.return()
                        } finally {
                            if (a) throw i
                        }
                    }
                    return n
                }(e, t) || function(e, t) {
                    if (!e) return;
                    if ("string" == typeof e) return Gt(e, t);
                    var n = Object.prototype.toString.call(e).slice(8, -1);
                    "Object" === n && e.constructor && (n = e.constructor.name);
                    if ("Map" === n || "Set" === n) return Array.from(e);
                    if ("Arguments" === n || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return Gt(e, t)
                }(e, t) || function() {
                    throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function Gt(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var n = 0, r = new Array(t); n < t; n++) r[n] = e[n];
                return r
            }
            var Xt = !!r.DeviceMeta && (0, r.DeviceMeta)(),
                Zt = Xt.isAndroidApp,
                $t = Xt.isDesktop,
                en = Me.MessageConfirmationEmailNotSent,
                tn = Me.MessageInvalidEmailAddress;

            function nn(n) {
                var r = n.translate,
                    a = n.entry,
                    i = lt(),
                    l = i.idVerificationState,
                    c = i.dispatch,
                    s = l.pageName,
                    u = l.pageState,
                    w = Wt((0, e.useState)(!1), 2),
                    x = w[0],
                    S = w[1],
                    k = Wt((0, e.useState)(!1), 2),
                    N = k[0],
                    L = k[1],
                    R = (0, e.useRef)("");

                function D() {
                    c({
                        type: C
                    }), L(!1), R.current = "", a === z && s === M && document.location.reload()
                }

                function q() {
                    Re(T.exitIdentityVerification, {
                        origin: a
                    }), D()
                }
                var ye = function(e) {
                        if (null != e && e.isVerified && null != e && e.verifiedAge) {
                            try {
                                je(!0)
                            } catch (e) {
                                console.log(e)
                            }
                            a === z ? c({
                                type: m,
                                pageName: M,
                                dispatch: c,
                                close: function() {
                                    D()
                                }
                            }) : e.verifiedAge >= 18 ? c({
                                type: m,
                                pageName: P,
                                dispatch: c,
                                close: function() {
                                    c({
                                        type: m,
                                        pageName: K,
                                        dispatch: c,
                                        close: function() {
                                            D()
                                        }
                                    })
                                }
                            }) : c({
                                type: m,
                                pageName: I,
                                dispatch: c,
                                close: function() {
                                    D()
                                }
                            })
                        } else c({
                            type: m,
                            pageName: B,
                            dispatch: c,
                            close: function() {
                                D()
                            }
                        })
                    },
                    be = function(e, t) {
                        var n = Number(new Date) + 18e5,
                            r = X;

                        function i(e, t) {
                            return o.apply(this, arguments)
                        }

                        function o() {
                            return (o = Jt(regeneratorRuntime.mark((function o(l, s) {
                                var u, d, f, p, g;
                                return regeneratorRuntime.wrap((function(o) {
                                    for (;;) switch (o.prev = o.next) {
                                        case 0:
                                            return o.next = 2, Le(e).catch((function() {
                                                return {
                                                    sessionStatus: r
                                                }
                                            }));
                                        case 2:
                                            if (u = o.sent, d = u.sessionStatus, f = null, p = null, !d || d === r) {
                                                o.next = 41;
                                                break
                                            }
                                            r = d, g = de, o.t0 = d, o.next = o.t0 === te || o.t0 === $ ? 12 : o.t0 === ee ? 27 : o.t0 === ae ? 29 : o.t0 === ne ? 31 : o.t0 === re ? 34 : o.t0 === Z ? 37 : (o.t0, 39);
                                            break;
                                        case 12:
                                            f = B, o.t1 = u.sessionErrorCode, o.next = o.t1 === ie || o.t1 === le ? 16 : o.t1 === ce || o.t1 === oe ? 18 : o.t1 === se ? 20 : o.t1 === ue ? 22 : 24;
                                            break;
                                        case 16:
                                            return p = "Label.FailedVerificationInvalidDocument", o.abrupt("break", 26);
                                        case 18:
                                            return p = "Label.FailedVerificationLowQuality", o.abrupt("break", 26);
                                        case 20:
                                            return p = "Label.FailedVerificationUnsupportedDocument", o.abrupt("break", 26);
                                        case 22:
                                            return p = "Label.FailedVerificationMaxAccountsLinked", o.abrupt("break", 26);
                                        case 24:
                                            return p = "Label.FailedVerification", o.abrupt("break", 26);
                                        case 26:
                                            return o.abrupt("break", 40);
                                        case 27:
                                            return f = O, o.abrupt("break", 40);
                                        case 29:
                                            return f = M, o.abrupt("break", 40);
                                        case 31:
                                            return Re(T.verificationInProgress, {
                                                origin: a
                                            }), g = fe, o.abrupt("break", 40);
                                        case 34:
                                            return Re(T.verificationPending, {
                                                origin: a
                                            }), g = pe, o.abrupt("break", 40);
                                        case 37:
                                            return g = me, o.abrupt("break", 40);
                                        case 39:
                                            return o.abrupt("break", 40);
                                        case 40:
                                            r !== X && c({
                                                type: m,
                                                pageName: j,
                                                origin: a,
                                                verificationLink: t,
                                                useQRCode: $t,
                                                checklistStep: g,
                                                dispatch: c
                                            });
                                        case 41:
                                            R.current !== e ? l(!1) : f ? (c({
                                                type: m,
                                                pageName: f,
                                                textKey: p,
                                                isSeventeenPlus: u.isSeventeenPlus,
                                                dispatch: c,
                                                close: function() {
                                                    D()
                                                }
                                            }), l(r)) : Number(new Date) < n ? setTimeout(i, 15e3, l, s) : (c({
                                                type: m,
                                                pageName: B,
                                                textKey: "Label.SessionTimeout",
                                                dispatch: c,
                                                close: function() {
                                                    D()
                                                }
                                            }), l(!1));
                                        case 42:
                                        case "end":
                                            return o.stop()
                                    }
                                }), o)
                            })))).apply(this, arguments)
                        }
                        return R.current = e, new Promise(i)
                    },
                    Ee = function() {
                        var e = Jt(regeneratorRuntime.mark((function e() {
                            var t, n, r, i, l;
                            return regeneratorRuntime.wrap((function(e) {
                                for (;;) switch (e.prev = e.next) {
                                    case 0:
                                        return e.next = 2, ke();
                                    case 2:
                                        t = e.sent, n = "", S(!1), t && t.verificationLink && t.sessionIdentifier ? (Re(T.showModal, {
                                            origin: a
                                        }), r = t.verificationLink, a === W ? (i = o.urlService.getQueryParam("wid"), n = o.urlService.getUrlWithQueries(Ce, {
                                            wid: i,
                                            action: "IdVerifyPending"
                                        })) : a === G && (l = window.location.href, n = "".concat(l, "&action=IdVerifyPending")), c({
                                            type: m,
                                            pageName: _,
                                            verificationLink: r,
                                            useQRCode: $t,
                                            redirectUrl: n,
                                            dispatch: c
                                        }), be(t.sessionIdentifier, t.verificationLink)) : (null == t ? void 0 : t.daysUntilNextVerification) > 0 ? c({
                                            type: m,
                                            pageName: H,
                                            daysUntilNextVerification: t.daysUntilNextVerification,
                                            dispatch: c,
                                            close: function() {
                                                D()
                                            }
                                        }) : c({
                                            type: m,
                                            pageName: F,
                                            dispatch: c,
                                            close: function() {
                                                D()
                                            }
                                        }), L(!0);
                                    case 7:
                                    case "end":
                                        return e.stop()
                                }
                            }), e)
                        })));
                        return function() {
                            return e.apply(this, arguments)
                        }
                    }();

                function we() {
                    if (l.pageName === V) n = l.userEmailInput, /\S+@\S+\.\S+/.test(n) ? (Re(T.addEmailConfirm, {
                        origin: a
                    }), c({
                        type: v,
                        isEmailUpdating: !0
                    }), (e = {
                        emailAddress: l.userEmailInput
                    }, t = Ae(), o.httpService.post(t, e).then((function() {
                        return !0
                    }), (function(e) {
                        return e.data.errors && e.data.errors[0].code
                    }))).then((function(e) {
                        e === Me.InvalidEmailCode ? (c({
                            type: h,
                            errorMsg: tn
                        }), c({
                            type: v,
                            isEmailUpdating: !1
                        })) : function() {
                            var e = Ae();
                            return o.httpService.get(e).then((function(e) {
                                var t = e.data;
                                return null == t ? void 0 : t.emailAddress
                            }), (function() {
                                return !1
                            }))
                        }().then((function(e) {
                            e ? (c({
                                type: f,
                                isEmailVerified: !1,
                                userEmail: e
                            }), Vt(), c({
                                type: b
                            }), c({
                                type: v,
                                isEmailUpdating: !1
                            }), S(!0)) : c({
                                type: h,
                                errorMsg: en
                            })
                        }))
                    })), c({
                        type: p
                    })) : c({
                        type: h,
                        errorMsg: tn
                    });
                    else D();
                    var e, t, n
                }

                function xe() {
                    var e;
                    (e = Ae(), o.httpService.get(e).then((function(e) {
                        return e.data
                    }), (function() {
                        return !1
                    }))).then((function(e) {
                        e && (c({
                            type: y,
                            origin: a,
                            skipCallback: !1
                        }), c({
                            type: f,
                            isEmailVerified: e.isEmailVerified,
                            userEmail: e.emailAddress
                        }), e.emailAddress ? S(!0) : (Re(T.showAddEmailModal, {
                            origin: a
                        }), c({
                            type: m,
                            pageName: V,
                            dispatch: c
                        }), c({
                            type: p
                        }), L(!0)))
                    }), (function() {
                        c({
                            type: m,
                            pageName: F,
                            dispatch: c,
                            close: function() {
                                D()
                            }
                        }), c({
                            type: p
                        }), L(!0)
                    }))
                }(0, e.useEffect)((function() {
                    x && Ee()
                }), [x]), (0, e.useEffect)((function() {
                    c({
                        type: y,
                        origin: a,
                        skipCallback: !1
                    }), window.addEventListener(ve, (function(e) {
                        c({
                            type: E,
                            callback: e.detail.successCallback
                        }), Ne().then((function(e) {
                            null != e && e.isVerified ? (L(!0), ye(e)) : a === J ? (L(!0), c({
                                type: m,
                                pageName: U,
                                dispatch: c,
                                continue: function() {
                                    xe()
                                }
                            })) : xe()
                        }))
                    }), !1), window.addEventListener(ge, (function(e) {
                        var t = e.detail,
                            n = t.requireExplicitVoiceConsent,
                            r = t.useVoiceUpsellV2Design;
                        L(!0), c({
                            type: m,
                            pageName: K,
                            requireExplicitVoiceConsent: n,
                            useVoiceUpsellV2Design: r,
                            dispatch: c,
                            close: function() {
                                e.detail.closeCallback(!0), D()
                            }
                        })
                    })), window.addEventListener(he, (function(e) {
                        var t = e.detail,
                            n = t.requireExplicitCameraConsent,
                            r = t.useCameraU13Design;
                        L(!0), c({
                            type: m,
                            pageName: Q,
                            requireExplicitCameraConsent: n,
                            useCameraU13Design: r,
                            dispatch: c,
                            close: function() {
                                e.detail.closeCallback(!0), D()
                            }
                        })
                    })), a === Y && (c({
                        type: A
                    }), Ne().then((function(e) {
                        null != e && e.isVerified ? (L(!0), ye(e)) : xe()
                    }), (function() {
                        c({
                            type: m,
                            pageName: F,
                            dispatch: c,
                            close: function() {
                                D()
                            }
                        }), L(!0)
                    })))
                }), []);
                var Se = null,
                    Te = "lg",
                    Ue = "static",
                    Ve = function() {
                        return q()
                    };
                if (u)
                    if (s === _) Se = t().createElement(Nt, zt({}, u, {
                        onHide: Ve,
                        translate: r,
                        entry: a
                    }));
                    else if (s === j) Se = t().createElement(Ie, zt({}, u, {
                    onHide: Ve,
                    translate: r
                }));
                else if (s === K) {
                    var Pe = function(e) {
                        for (var t = 1; t < arguments.length; t++) {
                            var n = null != arguments[t] ? arguments[t] : {};
                            t % 2 ? Kt(Object(n), !0).forEach((function(t) {
                                Qt(e, t, n[t])
                            })) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(n)) : Kt(Object(n)).forEach((function(t) {
                                Object.defineProperty(e, t, Object.getOwnPropertyDescriptor(n, t))
                            }))
                        }
                        return e
                    }({
                        communityStandardsUrl: u.communityStandardsUrl,
                        voiceFAQUrl: u.voiceFAQUrl,
                        requireExplicitVoiceConsent: u.requireExplicitVoiceConsent,
                        useVoiceUpsellV2Design: u.useVoiceUpsellV2Design
                    }, u.useVoiceUpsellV2Design ? u.voiceUpsellV2Keys : u.voiceUpsellV1Keys);
                    Ve = function() {
                        _e(T.closeEnableVoiceChatModal), q()
                    }, u.useVoiceUpsellV2Design && (Te = "md", Ue = !0), Se = t().createElement(Ct, zt({}, Pe, {
                        translate: r
                    }))
                } else s === Q ? (Te = "md", Se = t().createElement(_t, zt({}, u, {
                    onHide: Ve,
                    translate: r
                }))) : Se = t().createElement(Ut, zt({}, u, {
                    onHide: Ve,
                    translate: r
                }));
                return t().createElement("div", null, t().createElement(d.Modal, {
                    show: N,
                    onHide: Ve,
                    backdrop: Ue,
                    className: "".concat(Zt ? "email-upsell-android-modal" : "", " email-upsell-modal"),
                    size: s === M ? "sm" : Te,
                    "aria-labelledby": "contained-modal-title-vcenter",
                    scrollable: "true",
                    centered: "true"
                }, s === V ? t().createElement(st, {
                    onHide: function() {
                        q()
                    },
                    onPrimaryAction: function() {
                        return we()
                    },
                    onSecondaryAction: function() {
                        l.pageName === V && (l.skipCallback && l.skipCallback(), c({
                            type: b
                        }), L(!1))
                    },
                    onInputFocus: function() {
                        Re(T.useAddEmailField, {
                            origin: a
                        })
                    },
                    onInputChange: function(e) {
                        return function(e) {
                            c({
                                type: g,
                                pageName: V,
                                value: e
                            })
                        }(e)
                    },
                    onKeyDown: function(e) {
                        return function(e) {
                            return e === Me.Enter && we()
                        }(e)
                    }
                }) : Se))
            }
            nn.propTypes = {
                translate: s().func.isRequired,
                entry: s().string.isRequired,
                vendor: s().string.isRequired
            };
            var rn = nn;

            function an(e) {
                var n = e.translate,
                    r = e.entry;
                return t().createElement(ot, null, t().createElement(rn, {
                    translate: n,
                    entry: r
                }))
            }
            an.defaultProps = {
                entry: J
            }, an.propTypes = {
                translate: s().func.isRequired,
                entry: s().string
            };
            var on = (0, u.withTranslations)(an, {
                common: ["CommonUI.Controls"],
                feature: "Verification.Identity"
            });

            function ln(e, t, n, r, a, i, o) {
                try {
                    var l = e[i](o),
                        c = l.value
                } catch (e) {
                    return void n(e)
                }
                l.done ? t(c) : Promise.resolve(c).then(r, a)
            }

            function cn(e) {
                return function() {
                    var t = this,
                        n = arguments;
                    return new Promise((function(r, a) {
                        var i = e.apply(t, n);

                        function o(e) {
                            ln(i, r, a, o, l, "next", e)
                        }

                        function l(e) {
                            ln(i, r, a, o, l, "throw", e)
                        }
                        o(void 0)
                    }))
                }
            }

            function sn() {
                return un.apply(this, arguments)
            }

            function un() {
                return (un = cn(regeneratorRuntime.mark((function e() {
                    var n, r;
                    return regeneratorRuntime.wrap((function(e) {
                        for (;;) switch (e.prev = e.next) {
                            case 0:
                                (n = document.getElementById(l)) ? (r = n.getAttribute("entry"), (0, i.render)(t().createElement(on, {
                                    entry: r || void 0
                                }), n)) : window.requestAnimationFrame(sn);
                            case 2:
                            case "end":
                                return e.stop()
                        }
                    }), e)
                })))).apply(this, arguments)
            }
            a().IdentityVerificationService = {
                getPersonaVerificationStatus: Le,
                getVerifiedAge: Ne,
                startVerificationFlow: function() {
                    return new Promise((function(e) {
                        var t = new CustomEvent(ve, {
                            detail: {
                                successCallback: function(t, n) {
                                    e([t, n])
                                }
                            }
                        });
                        window.dispatchEvent(t)
                    }))
                },
                sendIdVerificationEvent: Re,
                showVoiceOptInOverlay: function(e, t) {
                    return new Promise((function(n) {
                        var r = new CustomEvent(ge, {
                            detail: {
                                closeCallback: function(e) {
                                    n(e)
                                },
                                requireExplicitVoiceConsent: e,
                                useVoiceUpsellV2Design: t
                            }
                        });
                        window.dispatchEvent(r)
                    }))
                },
                showAvatarVideoOptInOverlay: function(e, t) {
                    return new Promise((function(n) {
                        var r = new CustomEvent(he, {
                            detail: {
                                closeCallback: function(e) {
                                    n(e)
                                },
                                requireExplicitCameraConsent: e,
                                useCameraU13Design: t
                            }
                        });
                        window.dispatchEvent(r)
                    }))
                }
            }, (0, o.ready)(cn(regeneratorRuntime.mark((function e() {
                return regeneratorRuntime.wrap((function(e) {
                    for (;;) switch (e.prev = e.next) {
                        case 0:
                            return e.next = 3, sn();
                        case 3:
                        case "end":
                            return e.stop()
                    }
                }), e)
            }))))
        }()
}();
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/089da4da9f29197349c4715ac22a4c32-idVerification.bundle.min.js.map

/* Bundle detector */
window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("IdVerification");