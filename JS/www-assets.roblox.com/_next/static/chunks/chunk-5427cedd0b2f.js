;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "fd643bf4-0432-d282-61fe-0098cf66fafb")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 530689, (t, e, r) => {
    e.exports = function() {
        return "function" == typeof Promise && Promise.prototype && Promise.prototype.then
    }
}, 628151, (t, e, r) => {
    let n, o = [0, 26, 44, 70, 100, 134, 172, 196, 242, 292, 346, 404, 466, 532, 581, 655, 733, 815, 901, 991, 1085, 1156, 1258, 1364, 1474, 1588, 1706, 1828, 1921, 2051, 2185, 2323, 2465, 2611, 2761, 2876, 3034, 3196, 3362, 3532, 3706];
    r.getSymbolSize = function(t) {
        if (!t) throw Error('"version" cannot be null or undefined');
        if (t < 1 || t > 40) throw Error('"version" should be in range from 1 to 40');
        return 4 * t + 17
    }, r.getSymbolTotalCodewords = function(t) {
        return o[t]
    }, r.getBCHDigit = function(t) {
        let e = 0;
        for (; 0 !== t;) e++, t >>>= 1;
        return e
    }, r.setToSJISFunction = function(t) {
        if ("function" != typeof t) throw Error('"toSJISFunc" is not a valid function.');
        n = t
    }, r.isKanjiModeEnabled = function() {
        return void 0 !== n
    }, r.toSJIS = function(t) {
        return n(t)
    }
}, 731351, (t, e, r) => {
    r.L = {
        bit: 1
    }, r.M = {
        bit: 0
    }, r.Q = {
        bit: 3
    }, r.H = {
        bit: 2
    }, r.isValid = function(t) {
        return t && void 0 !== t.bit && t.bit >= 0 && t.bit < 4
    }, r.from = function(t, e) {
        if (r.isValid(t)) return t;
        try {
            if ("string" != typeof t) throw Error("Param is not a string");
            switch (t.toLowerCase()) {
                case "l":
                case "low":
                    return r.L;
                case "m":
                case "medium":
                    return r.M;
                case "q":
                case "quartile":
                    return r.Q;
                case "h":
                case "high":
                    return r.H;
                default:
                    throw Error("Unknown EC Level: " + t)
            }
        } catch (t) {
            return e
        }
    }
}, 299931, (t, e, r) => {
    function n() {
        this.buffer = [], this.length = 0
    }
    n.prototype = {
        get: function(t) {
            let e = Math.floor(t / 8);
            return (this.buffer[e] >>> 7 - t % 8 & 1) == 1
        },
        put: function(t, e) {
            for (let r = 0; r < e; r++) this.putBit((t >>> e - r - 1 & 1) == 1)
        },
        getLengthInBits: function() {
            return this.length
        },
        putBit: function(t) {
            let e = Math.floor(this.length / 8);
            this.buffer.length <= e && this.buffer.push(0), t && (this.buffer[e] |= 128 >>> this.length % 8), this.length++
        }
    }, e.exports = n
}, 762091, (t, e, r) => {
    function n(t) {
        if (!t || t < 1) throw Error("BitMatrix size must be defined and greater than 0");
        this.size = t, this.data = new Uint8Array(t * t), this.reservedBit = new Uint8Array(t * t)
    }
    n.prototype.set = function(t, e, r, n) {
        let o = t * this.size + e;
        this.data[o] = r, n && (this.reservedBit[o] = !0)
    }, n.prototype.get = function(t, e) {
        return this.data[t * this.size + e]
    }, n.prototype.xor = function(t, e, r) {
        this.data[t * this.size + e] ^= r
    }, n.prototype.isReserved = function(t, e) {
        return this.reservedBit[t * this.size + e]
    }, e.exports = n
}, 271112, (t, e, r) => {
    let n = t.r(628151).getSymbolSize;
    r.getRowColCoords = function(t) {
        if (1 === t) return [];
        let e = Math.floor(t / 7) + 2,
            r = n(t),
            o = 145 === r ? 26 : 2 * Math.ceil((r - 13) / (2 * e - 2)),
            i = [r - 7];
        for (let t = 1; t < e - 1; t++) i[t] = i[t - 1] - o;
        return i.push(6), i.reverse()
    }, r.getPositions = function(t) {
        let e = [],
            n = r.getRowColCoords(t),
            o = n.length;
        for (let t = 0; t < o; t++)
            for (let r = 0; r < o; r++)(0 !== t || 0 !== r) && (0 !== t || r !== o - 1) && (t !== o - 1 || 0 !== r) && e.push([n[t], n[r]]);
        return e
    }
}, 853658, (t, e, r) => {
    let n = t.r(628151).getSymbolSize;
    r.getPositions = function(t) {
        let e = n(t);
        return [
            [0, 0],
            [e - 7, 0],
            [0, e - 7]
        ]
    }
}, 546711, (t, e, r) => {
    r.Patterns = {
        PATTERN000: 0,
        PATTERN001: 1,
        PATTERN010: 2,
        PATTERN011: 3,
        PATTERN100: 4,
        PATTERN101: 5,
        PATTERN110: 6,
        PATTERN111: 7
    };
    r.isValid = function(t) {
        return null != t && "" !== t && !isNaN(t) && t >= 0 && t <= 7
    }, r.from = function(t) {
        return r.isValid(t) ? parseInt(t, 10) : void 0
    }, r.getPenaltyN1 = function(t) {
        let e = t.size,
            r = 0,
            n = 0,
            o = 0,
            i = null,
            a = null;
        for (let s = 0; s < e; s++) {
            n = o = 0, i = a = null;
            for (let u = 0; u < e; u++) {
                let e = t.get(s, u);
                e === i ? n++ : (n >= 5 && (r += 3 + (n - 5)), i = e, n = 1), (e = t.get(u, s)) === a ? o++ : (o >= 5 && (r += 3 + (o - 5)), a = e, o = 1)
            }
            n >= 5 && (r += 3 + (n - 5)), o >= 5 && (r += 3 + (o - 5))
        }
        return r
    }, r.getPenaltyN2 = function(t) {
        let e = t.size,
            r = 0;
        for (let n = 0; n < e - 1; n++)
            for (let o = 0; o < e - 1; o++) {
                let e = t.get(n, o) + t.get(n, o + 1) + t.get(n + 1, o) + t.get(n + 1, o + 1);
                (4 === e || 0 === e) && r++
            }
        return 3 * r
    }, r.getPenaltyN3 = function(t) {
        let e = t.size,
            r = 0,
            n = 0,
            o = 0;
        for (let i = 0; i < e; i++) {
            n = o = 0;
            for (let a = 0; a < e; a++) n = n << 1 & 2047 | t.get(i, a), a >= 10 && (1488 === n || 93 === n) && r++, o = o << 1 & 2047 | t.get(a, i), a >= 10 && (1488 === o || 93 === o) && r++
        }
        return 40 * r
    }, r.getPenaltyN4 = function(t) {
        let e = 0,
            r = t.data.length;
        for (let n = 0; n < r; n++) e += t.data[n];
        return 10 * Math.abs(Math.ceil(100 * e / r / 5) - 10)
    }, r.applyMask = function(t, e) {
        let n = e.size;
        for (let o = 0; o < n; o++)
            for (let i = 0; i < n; i++) e.isReserved(i, o) || e.xor(i, o, function(t, e, n) {
                switch (t) {
                    case r.Patterns.PATTERN000:
                        return (e + n) % 2 == 0;
                    case r.Patterns.PATTERN001:
                        return e % 2 == 0;
                    case r.Patterns.PATTERN010:
                        return n % 3 == 0;
                    case r.Patterns.PATTERN011:
                        return (e + n) % 3 == 0;
                    case r.Patterns.PATTERN100:
                        return (Math.floor(e / 2) + Math.floor(n / 3)) % 2 == 0;
                    case r.Patterns.PATTERN101:
                        return e * n % 2 + e * n % 3 == 0;
                    case r.Patterns.PATTERN110:
                        return (e * n % 2 + e * n % 3) % 2 == 0;
                    case r.Patterns.PATTERN111:
                        return (e * n % 3 + (e + n) % 2) % 2 == 0;
                    default:
                        throw Error("bad maskPattern:" + t)
                }
            }(t, i, o))
    }, r.getBestMask = function(t, e) {
        let n = Object.keys(r.Patterns).length,
            o = 0,
            i = 1 / 0;
        for (let a = 0; a < n; a++) {
            e(a), r.applyMask(a, t);
            let n = r.getPenaltyN1(t) + r.getPenaltyN2(t) + r.getPenaltyN3(t) + r.getPenaltyN4(t);
            r.applyMask(a, t), n < i && (i = n, o = a)
        }
        return o
    }
}, 105693, (t, e, r) => {
    let n = t.r(731351),
        o = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 1, 2, 2, 4, 1, 2, 4, 4, 2, 4, 4, 4, 2, 4, 6, 5, 2, 4, 6, 6, 2, 5, 8, 8, 4, 5, 8, 8, 4, 5, 8, 11, 4, 8, 10, 11, 4, 9, 12, 16, 4, 9, 16, 16, 6, 10, 12, 18, 6, 10, 17, 16, 6, 11, 16, 19, 6, 13, 18, 21, 7, 14, 21, 25, 8, 16, 20, 25, 8, 17, 23, 25, 9, 17, 23, 34, 9, 18, 25, 30, 10, 20, 27, 32, 12, 21, 29, 35, 12, 23, 34, 37, 12, 25, 34, 40, 13, 26, 35, 42, 14, 28, 38, 45, 15, 29, 40, 48, 16, 31, 43, 51, 17, 33, 45, 54, 18, 35, 48, 57, 19, 37, 51, 60, 19, 38, 53, 63, 20, 40, 56, 66, 21, 43, 59, 70, 22, 45, 62, 74, 24, 47, 65, 77, 25, 49, 68, 81],
        i = [7, 10, 13, 17, 10, 16, 22, 28, 15, 26, 36, 44, 20, 36, 52, 64, 26, 48, 72, 88, 36, 64, 96, 112, 40, 72, 108, 130, 48, 88, 132, 156, 60, 110, 160, 192, 72, 130, 192, 224, 80, 150, 224, 264, 96, 176, 260, 308, 104, 198, 288, 352, 120, 216, 320, 384, 132, 240, 360, 432, 144, 280, 408, 480, 168, 308, 448, 532, 180, 338, 504, 588, 196, 364, 546, 650, 224, 416, 600, 700, 224, 442, 644, 750, 252, 476, 690, 816, 270, 504, 750, 900, 300, 560, 810, 960, 312, 588, 870, 1050, 336, 644, 952, 1110, 360, 700, 1020, 1200, 390, 728, 1050, 1260, 420, 784, 1140, 1350, 450, 812, 1200, 1440, 480, 868, 1290, 1530, 510, 924, 1350, 1620, 540, 980, 1440, 1710, 570, 1036, 1530, 1800, 570, 1064, 1590, 1890, 600, 1120, 1680, 1980, 630, 1204, 1770, 2100, 660, 1260, 1860, 2220, 720, 1316, 1950, 2310, 750, 1372, 2040, 2430];
    r.getBlocksCount = function(t, e) {
        switch (e) {
            case n.L:
                return o[(t - 1) * 4 + 0];
            case n.M:
                return o[(t - 1) * 4 + 1];
            case n.Q:
                return o[(t - 1) * 4 + 2];
            case n.H:
                return o[(t - 1) * 4 + 3];
            default:
                return
        }
    }, r.getTotalCodewordsCount = function(t, e) {
        switch (e) {
            case n.L:
                return i[(t - 1) * 4 + 0];
            case n.M:
                return i[(t - 1) * 4 + 1];
            case n.Q:
                return i[(t - 1) * 4 + 2];
            case n.H:
                return i[(t - 1) * 4 + 3];
            default:
                return
        }
    }
}, 473398, (t, e, r) => {
    let n = new Uint8Array(512),
        o = new Uint8Array(256),
        i = 1;
    for (let t = 0; t < 255; t++) n[t] = i, o[i] = t, 256 & (i <<= 1) && (i ^= 285);
    for (let t = 255; t < 512; t++) n[t] = n[t - 255];
    r.log = function(t) {
        if (t < 1) throw Error("log(" + t + ")");
        return o[t]
    }, r.exp = function(t) {
        return n[t]
    }, r.mul = function(t, e) {
        return 0 === t || 0 === e ? 0 : n[o[t] + o[e]]
    }
}, 476093, (t, e, r) => {
    let n = t.r(473398);
    r.mul = function(t, e) {
        let r = new Uint8Array(t.length + e.length - 1);
        for (let o = 0; o < t.length; o++)
            for (let i = 0; i < e.length; i++) r[o + i] ^= n.mul(t[o], e[i]);
        return r
    }, r.mod = function(t, e) {
        let r = new Uint8Array(t);
        for (; r.length - e.length >= 0;) {
            let t = r[0];
            for (let o = 0; o < e.length; o++) r[o] ^= n.mul(e[o], t);
            let o = 0;
            for (; o < r.length && 0 === r[o];) o++;
            r = r.slice(o)
        }
        return r
    }, r.generateECPolynomial = function(t) {
        let e = new Uint8Array([1]);
        for (let o = 0; o < t; o++) e = r.mul(e, new Uint8Array([1, n.exp(o)]));
        return e
    }
}, 701763, (t, e, r) => {
    let n = t.r(476093);

    function o(t) {
        this.genPoly = void 0, this.degree = t, this.degree && this.initialize(this.degree)
    }
    o.prototype.initialize = function(t) {
        this.degree = t, this.genPoly = n.generateECPolynomial(this.degree)
    }, o.prototype.encode = function(t) {
        if (!this.genPoly) throw Error("Encoder not initialized");
        let e = new Uint8Array(t.length + this.degree);
        e.set(t);
        let r = n.mod(e, this.genPoly),
            o = this.degree - r.length;
        if (o > 0) {
            let t = new Uint8Array(this.degree);
            return t.set(r, o), t
        }
        return r
    }, e.exports = o
}, 111735, (t, e, r) => {
    r.isValid = function(t) {
        return !isNaN(t) && t >= 1 && t <= 40
    }
}, 214477, (t, e, r) => {
    let n = "[0-9]+",
        o = "(?:[u3000-u303F]|[u3040-u309F]|[u30A0-u30FF]|[uFF00-uFFEF]|[u4E00-u9FAF]|[u2605-u2606]|[u2190-u2195]|u203B|[u2010u2015u2018u2019u2025u2026u201Cu201Du2225u2260]|[u0391-u0451]|[u00A7u00A8u00B1u00B4u00D7u00F7])+",
        i = "(?:(?![A-Z0-9 $%*+\\-./:]|" + (o = o.replace(/u/g, "\\u")) + ")(?:.|[\r\n]))+";
    r.KANJI = RegExp(o, "g"), r.BYTE_KANJI = RegExp("[^A-Z0-9 $%*+\\-./:]+", "g"), r.BYTE = RegExp(i, "g"), r.NUMERIC = RegExp(n, "g"), r.ALPHANUMERIC = RegExp("[A-Z $%*+\\-./:]+", "g");
    let a = RegExp("^" + o + "$"),
        s = RegExp("^" + n + "$"),
        u = RegExp("^[A-Z0-9 $%*+\\-./:]+$");
    r.testKanji = function(t) {
        return a.test(t)
    }, r.testNumeric = function(t) {
        return s.test(t)
    }, r.testAlphanumeric = function(t) {
        return u.test(t)
    }
}, 310413, (t, e, r) => {
    let n = t.r(111735),
        o = t.r(214477);
    r.NUMERIC = {
        id: "Numeric",
        bit: 1,
        ccBits: [10, 12, 14]
    }, r.ALPHANUMERIC = {
        id: "Alphanumeric",
        bit: 2,
        ccBits: [9, 11, 13]
    }, r.BYTE = {
        id: "Byte",
        bit: 4,
        ccBits: [8, 16, 16]
    }, r.KANJI = {
        id: "Kanji",
        bit: 8,
        ccBits: [8, 10, 12]
    }, r.MIXED = {
        bit: -1
    }, r.getCharCountIndicator = function(t, e) {
        if (!t.ccBits) throw Error("Invalid mode: " + t);
        if (!n.isValid(e)) throw Error("Invalid version: " + e);
        return e >= 1 && e < 10 ? t.ccBits[0] : e < 27 ? t.ccBits[1] : t.ccBits[2]
    }, r.getBestModeForData = function(t) {
        return o.testNumeric(t) ? r.NUMERIC : o.testAlphanumeric(t) ? r.ALPHANUMERIC : o.testKanji(t) ? r.KANJI : r.BYTE
    }, r.toString = function(t) {
        if (t && t.id) return t.id;
        throw Error("Invalid mode")
    }, r.isValid = function(t) {
        return t && t.bit && t.ccBits
    }, r.from = function(t, e) {
        if (r.isValid(t)) return t;
        try {
            if ("string" != typeof t) throw Error("Param is not a string");
            switch (t.toLowerCase()) {
                case "numeric":
                    return r.NUMERIC;
                case "alphanumeric":
                    return r.ALPHANUMERIC;
                case "kanji":
                    return r.KANJI;
                case "byte":
                    return r.BYTE;
                default:
                    throw Error("Unknown mode: " + t)
            }
        } catch (t) {
            return e
        }
    }
}, 725510, (t, e, r) => {
    let n = t.r(628151),
        o = t.r(105693),
        i = t.r(731351),
        a = t.r(310413),
        s = t.r(111735),
        u = n.getBCHDigit(7973);

    function l(t, e) {
        return a.getCharCountIndicator(t, e) + 4
    }
    r.from = function(t, e) {
        return s.isValid(t) ? parseInt(t, 10) : e
    }, r.getCapacity = function(t, e, r) {
        if (!s.isValid(t)) throw Error("Invalid QR Code version");
        void 0 === r && (r = a.BYTE);
        let i = (n.getSymbolTotalCodewords(t) - o.getTotalCodewordsCount(t, e)) * 8;
        if (r === a.MIXED) return i;
        let u = i - l(r, t);
        switch (r) {
            case a.NUMERIC:
                return Math.floor(u / 10 * 3);
            case a.ALPHANUMERIC:
                return Math.floor(u / 11 * 2);
            case a.KANJI:
                return Math.floor(u / 13);
            case a.BYTE:
            default:
                return Math.floor(u / 8)
        }
    }, r.getBestVersionForData = function(t, e) {
        let n, o = i.from(e, i.M);
        if (Array.isArray(t)) {
            if (t.length > 1) {
                for (let e = 1; e <= 40; e++)
                    if (function(t, e) {
                            let r = 0;
                            return t.forEach(function(t) {
                                let n = l(t.mode, e);
                                r += n + t.getBitsLength()
                            }), r
                        }(t, e) <= r.getCapacity(e, o, a.MIXED)) return e;
                return
            }
            if (0 === t.length) return 1;
            n = t[0]
        } else n = t;
        return function(t, e, n) {
            for (let o = 1; o <= 40; o++)
                if (e <= r.getCapacity(o, n, t)) return o
        }(n.mode, n.getLength(), o)
    }, r.getEncodedBits = function(t) {
        if (!s.isValid(t) || t < 7) throw Error("Invalid QR Code version");
        let e = t << 12;
        for (; n.getBCHDigit(e) - u >= 0;) e ^= 7973 << n.getBCHDigit(e) - u;
        return t << 12 | e
    }
}, 546103, (t, e, r) => {
    let n = t.r(628151),
        o = n.getBCHDigit(1335);
    r.getEncodedBits = function(t, e) {
        let r = t.bit << 3 | e,
            i = r << 10;
        for (; n.getBCHDigit(i) - o >= 0;) i ^= 1335 << n.getBCHDigit(i) - o;
        return (r << 10 | i) ^ 21522
    }
}, 938983, (t, e, r) => {
    let n = t.r(310413);

    function o(t) {
        this.mode = n.NUMERIC, this.data = t.toString()
    }
    o.getBitsLength = function(t) {
        return 10 * Math.floor(t / 3) + (t % 3 ? t % 3 * 3 + 1 : 0)
    }, o.prototype.getLength = function() {
        return this.data.length
    }, o.prototype.getBitsLength = function() {
        return o.getBitsLength(this.data.length)
    }, o.prototype.write = function(t) {
        let e, r;
        for (e = 0; e + 3 <= this.data.length; e += 3) r = parseInt(this.data.substr(e, 3), 10), t.put(r, 10);
        let n = this.data.length - e;
        n > 0 && (r = parseInt(this.data.substr(e), 10), t.put(r, 3 * n + 1))
    }, e.exports = o
}, 488440, (t, e, r) => {
    let n = t.r(310413),
        o = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", " ", "$", "%", "*", "+", "-", ".", "/", ":"];

    function i(t) {
        this.mode = n.ALPHANUMERIC, this.data = t
    }
    i.getBitsLength = function(t) {
        return 11 * Math.floor(t / 2) + t % 2 * 6
    }, i.prototype.getLength = function() {
        return this.data.length
    }, i.prototype.getBitsLength = function() {
        return i.getBitsLength(this.data.length)
    }, i.prototype.write = function(t) {
        let e;
        for (e = 0; e + 2 <= this.data.length; e += 2) {
            let r = 45 * o.indexOf(this.data[e]);
            r += o.indexOf(this.data[e + 1]), t.put(r, 11)
        }
        this.data.length % 2 && t.put(o.indexOf(this.data[e]), 6)
    }, e.exports = i
}, 120648, (t, e, r) => {
    let n = t.r(310413);

    function o(t) {
        this.mode = n.BYTE, "string" == typeof t ? this.data = new TextEncoder().encode(t) : this.data = new Uint8Array(t)
    }
    o.getBitsLength = function(t) {
        return 8 * t
    }, o.prototype.getLength = function() {
        return this.data.length
    }, o.prototype.getBitsLength = function() {
        return o.getBitsLength(this.data.length)
    }, o.prototype.write = function(t) {
        for (let e = 0, r = this.data.length; e < r; e++) t.put(this.data[e], 8)
    }, e.exports = o
}, 416133, (t, e, r) => {
    let n = t.r(310413),
        o = t.r(628151);

    function i(t) {
        this.mode = n.KANJI, this.data = t
    }
    i.getBitsLength = function(t) {
        return 13 * t
    }, i.prototype.getLength = function() {
        return this.data.length
    }, i.prototype.getBitsLength = function() {
        return i.getBitsLength(this.data.length)
    }, i.prototype.write = function(t) {
        let e;
        for (e = 0; e < this.data.length; e++) {
            let r = o.toSJIS(this.data[e]);
            if (r >= 33088 && r <= 40956) r -= 33088;
            else if (r >= 57408 && r <= 60351) r -= 49472;
            else throw Error("Invalid SJIS character: " + this.data[e] + "\nMake sure your charset is UTF-8");
            r = (r >>> 8 & 255) * 192 + (255 & r), t.put(r, 13)
        }
    }, e.exports = i
}, 745759, (t, e, r) => {
    "use strict";
    var n = {
        single_source_shortest_paths: function(t, e, r) {
            var o, i, a, s, u, l, h, f = {},
                c = {};
            c[e] = 0;
            var g = n.PriorityQueue.make();
            for (g.push(e, 0); !g.empty();)
                for (a in i = (o = g.pop()).value, s = o.cost, u = t[i] || {}) u.hasOwnProperty(a) && (l = s + u[a], h = c[a], (void 0 === c[a] || h > l) && (c[a] = l, g.push(a, l), f[a] = i));
            if (void 0 !== r && void 0 === c[r]) throw Error("Could not find a path from " + e + " to " + r + ".");
            return f
        },
        extract_shortest_path_from_predecessor_list: function(t, e) {
            for (var r = [], n = e; n;) r.push(n), t[n], n = t[n];
            return r.reverse(), r
        },
        find_path: function(t, e, r) {
            var o = n.single_source_shortest_paths(t, e, r);
            return n.extract_shortest_path_from_predecessor_list(o, r)
        },
        PriorityQueue: {
            make: function(t) {
                var e, r = n.PriorityQueue,
                    o = {};
                for (e in t = t || {}, r) r.hasOwnProperty(e) && (o[e] = r[e]);
                return o.queue = [], o.sorter = t.sorter || r.default_sorter, o
            },
            default_sorter: function(t, e) {
                return t.cost - e.cost
            },
            push: function(t, e) {
                this.queue.push({
                    value: t,
                    cost: e
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
    e.exports = n
}, 658931, (t, e, r) => {
    let n = t.r(310413),
        o = t.r(938983),
        i = t.r(488440),
        a = t.r(120648),
        s = t.r(416133),
        u = t.r(214477),
        l = t.r(628151),
        h = t.r(745759);

    function f(t) {
        return unescape(encodeURIComponent(t)).length
    }

    function c(t, e, r) {
        let n, o = [];
        for (; null !== (n = t.exec(r));) o.push({
            data: n[0],
            index: n.index,
            mode: e,
            length: n[0].length
        });
        return o
    }

    function g(t) {
        let e, r, o = c(u.NUMERIC, n.NUMERIC, t),
            i = c(u.ALPHANUMERIC, n.ALPHANUMERIC, t);
        return l.isKanjiModeEnabled() ? (e = c(u.BYTE, n.BYTE, t), r = c(u.KANJI, n.KANJI, t)) : (e = c(u.BYTE_KANJI, n.BYTE, t), r = []), o.concat(i, e, r).sort(function(t, e) {
            return t.index - e.index
        }).map(function(t) {
            return {
                data: t.data,
                mode: t.mode,
                length: t.length
            }
        })
    }

    function d(t, e) {
        switch (e) {
            case n.NUMERIC:
                return o.getBitsLength(t);
            case n.ALPHANUMERIC:
                return i.getBitsLength(t);
            case n.KANJI:
                return s.getBitsLength(t);
            case n.BYTE:
                return a.getBitsLength(t)
        }
    }

    function p(t, e) {
        let r, u = n.getBestModeForData(t);
        if ((r = n.from(e, u)) !== n.BYTE && r.bit < u.bit) throw Error('"' + t + '" cannot be encoded with mode ' + n.toString(r) + ".\n Suggested mode is: " + n.toString(u));
        switch (r === n.KANJI && !l.isKanjiModeEnabled() && (r = n.BYTE), r) {
            case n.NUMERIC:
                return new o(t);
            case n.ALPHANUMERIC:
                return new i(t);
            case n.KANJI:
                return new s(t);
            case n.BYTE:
                return new a(t)
        }
    }
    r.fromArray = function(t) {
        return t.reduce(function(t, e) {
            return "string" == typeof e ? t.push(p(e, null)) : e.data && t.push(p(e.data, e.mode)), t
        }, [])
    }, r.fromString = function(t, e) {
        let o = function(t, e) {
                let r = {},
                    o = {
                        start: {}
                    },
                    i = ["start"];
                for (let a = 0; a < t.length; a++) {
                    let s = t[a],
                        u = [];
                    for (let t = 0; t < s.length; t++) {
                        let l = s[t],
                            h = "" + a + t;
                        u.push(h), r[h] = {
                            node: l,
                            lastCount: 0
                        }, o[h] = {};
                        for (let t = 0; t < i.length; t++) {
                            let a = i[t];
                            r[a] && r[a].node.mode === l.mode ? (o[a][h] = d(r[a].lastCount + l.length, l.mode) - d(r[a].lastCount, l.mode), r[a].lastCount += l.length) : (r[a] && (r[a].lastCount = l.length), o[a][h] = d(l.length, l.mode) + 4 + n.getCharCountIndicator(l.mode, e))
                        }
                    }
                    i = u
                }
                for (let t = 0; t < i.length; t++) o[i[t]].end = 0;
                return {
                    map: o,
                    table: r
                }
            }(function(t) {
                let e = [];
                for (let r = 0; r < t.length; r++) {
                    let o = t[r];
                    switch (o.mode) {
                        case n.NUMERIC:
                            e.push([o, {
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
                            e.push([o, {
                                data: o.data,
                                mode: n.BYTE,
                                length: o.length
                            }]);
                            break;
                        case n.KANJI:
                            e.push([o, {
                                data: o.data,
                                mode: n.BYTE,
                                length: f(o.data)
                            }]);
                            break;
                        case n.BYTE:
                            e.push([{
                                data: o.data,
                                mode: n.BYTE,
                                length: f(o.data)
                            }])
                    }
                }
                return e
            }(g(t, l.isKanjiModeEnabled())), e),
            i = h.find_path(o.map, "start", "end"),
            a = [];
        for (let t = 1; t < i.length - 1; t++) a.push(o.table[i[t]].node);
        return r.fromArray(a.reduce(function(t, e) {
            let r = t.length - 1 >= 0 ? t[t.length - 1] : null;
            return r && r.mode === e.mode ? t[t.length - 1].data += e.data : t.push(e), t
        }, []))
    }, r.rawSplit = function(t) {
        return r.fromArray(g(t, l.isKanjiModeEnabled()))
    }
}, 364367, (t, e, r) => {
    let n = t.r(628151),
        o = t.r(731351),
        i = t.r(299931),
        a = t.r(762091),
        s = t.r(271112),
        u = t.r(853658),
        l = t.r(546711),
        h = t.r(105693),
        f = t.r(701763),
        c = t.r(725510),
        g = t.r(546103),
        d = t.r(310413),
        p = t.r(658931);

    function m(t, e, r) {
        let n, o, i = t.size,
            a = g.getEncodedBits(e, r);
        for (n = 0; n < 15; n++) o = (a >> n & 1) == 1, n < 6 ? t.set(n, 8, o, !0) : n < 8 ? t.set(n + 1, 8, o, !0) : t.set(i - 15 + n, 8, o, !0), n < 8 ? t.set(8, i - n - 1, o, !0) : n < 9 ? t.set(8, 15 - n - 1 + 1, o, !0) : t.set(8, 15 - n - 1, o, !0);
        t.set(i - 8, 8, 1, !0)
    }
    r.create = function(t, e) {
        let r, g;
        if (void 0 === t || "" === t) throw Error("No input text");
        let E = o.M;
        return void 0 !== e && (E = o.from(e.errorCorrectionLevel, o.M), r = c.from(e.version), g = l.from(e.maskPattern), e.toSJISFunc && n.setToSJISFunction(e.toSJISFunc)),
            function(t, e, r, o) {
                let g;
                if (Array.isArray(t)) g = p.fromArray(t);
                else if ("string" == typeof t) {
                    let n = e;
                    if (!n) {
                        let e = p.rawSplit(t);
                        n = c.getBestVersionForData(e, r)
                    }
                    g = p.fromString(t, n || 40)
                } else throw Error("Invalid data");
                let E = c.getBestVersionForData(g, r);
                if (!E) throw Error("The amount of data is too big to be stored in a QR Code");
                if (e) {
                    if (e < E) throw Error("\nThe chosen QR Code version cannot contain this amount of data.\nMinimum version required to store current data is: " + E + ".\n")
                } else e = E;
                let y = function(t, e, r) {
                        let o = new i;
                        r.forEach(function(e) {
                            o.put(e.mode.bit, 4), o.put(e.getLength(), d.getCharCountIndicator(e.mode, t)), e.write(o)
                        });
                        let a = (n.getSymbolTotalCodewords(t) - h.getTotalCodewordsCount(t, e)) * 8;
                        for (o.getLengthInBits() + 4 <= a && o.put(0, 4); o.getLengthInBits() % 8 != 0;) o.putBit(0);
                        let s = (a - o.getLengthInBits()) / 8;
                        for (let t = 0; t < s; t++) o.put(t % 2 ? 17 : 236, 8);
                        return function(t, e, r) {
                            let o, i, a = n.getSymbolTotalCodewords(e),
                                s = a - h.getTotalCodewordsCount(e, r),
                                u = h.getBlocksCount(e, r),
                                l = a % u,
                                c = u - l,
                                g = Math.floor(a / u),
                                d = Math.floor(s / u),
                                p = d + 1,
                                m = g - d,
                                E = new f(m),
                                y = 0,
                                w = Array(u),
                                A = Array(u),
                                C = 0,
                                B = new Uint8Array(t.buffer);
                            for (let t = 0; t < u; t++) {
                                let e = t < c ? d : p;
                                w[t] = B.slice(y, y + e), A[t] = E.encode(w[t]), y += e, C = Math.max(C, e)
                            }
                            let T = new Uint8Array(a),
                                I = 0;
                            for (o = 0; o < C; o++)
                                for (i = 0; i < u; i++) o < w[i].length && (T[I++] = w[i][o]);
                            for (o = 0; o < m; o++)
                                for (i = 0; i < u; i++) T[I++] = A[i][o];
                            return T
                        }(o, t, e)
                    }(e, r, g),
                    w = new a(n.getSymbolSize(e));
                ! function(t, e) {
                    let r = t.size,
                        n = u.getPositions(e);
                    for (let e = 0; e < n.length; e++) {
                        let o = n[e][0],
                            i = n[e][1];
                        for (let e = -1; e <= 7; e++)
                            if (!(o + e <= -1) && !(r <= o + e))
                                for (let n = -1; n <= 7; n++) i + n <= -1 || r <= i + n || (e >= 0 && e <= 6 && (0 === n || 6 === n) || n >= 0 && n <= 6 && (0 === e || 6 === e) || e >= 2 && e <= 4 && n >= 2 && n <= 4 ? t.set(o + e, i + n, !0, !0) : t.set(o + e, i + n, !1, !0))
                    }
                }(w, e);
                let A = w.size;
                for (let t = 8; t < A - 8; t++) {
                    let e = t % 2 == 0;
                    w.set(t, 6, e, !0), w.set(6, t, e, !0)
                }
                return ! function(t, e) {
                    let r = s.getPositions(e);
                    for (let e = 0; e < r.length; e++) {
                        let n = r[e][0],
                            o = r[e][1];
                        for (let e = -2; e <= 2; e++)
                            for (let r = -2; r <= 2; r++) - 2 === e || 2 === e || -2 === r || 2 === r || 0 === e && 0 === r ? t.set(n + e, o + r, !0, !0) : t.set(n + e, o + r, !1, !0)
                    }
                }(w, e), m(w, r, 0), e >= 7 && function(t, e) {
                    let r, n, o, i = t.size,
                        a = c.getEncodedBits(e);
                    for (let e = 0; e < 18; e++) r = Math.floor(e / 3), n = e % 3 + i - 8 - 3, o = (a >> e & 1) == 1, t.set(r, n, o, !0), t.set(n, r, o, !0)
                }(w, e), ! function(t, e) {
                    let r = t.size,
                        n = -1,
                        o = r - 1,
                        i = 7,
                        a = 0;
                    for (let s = r - 1; s > 0; s -= 2)
                        for (6 === s && s--;;) {
                            for (let r = 0; r < 2; r++)
                                if (!t.isReserved(o, s - r)) {
                                    let n = !1;
                                    a < e.length && (n = (e[a] >>> i & 1) == 1), t.set(o, s - r, n), -1 == --i && (a++, i = 7)
                                } if ((o += n) < 0 || r <= o) {
                                o -= n, n = -n;
                                break
                            }
                        }
                }(w, y), isNaN(o) && (o = l.getBestMask(w, m.bind(null, w, r))), l.applyMask(o, w), m(w, r, o), {
                    modules: w,
                    version: e,
                    errorCorrectionLevel: r,
                    maskPattern: o,
                    segments: g
                }
            }(t, r, E, g)
    }
}, 283195, (t, e, r) => {
    function n(t) {
        if ("number" == typeof t && (t = t.toString()), "string" != typeof t) throw Error("Color should be defined as hex string");
        let e = t.slice().replace("#", "").split("");
        if (e.length < 3 || 5 === e.length || e.length > 8) throw Error("Invalid hex color: " + t);
        (3 === e.length || 4 === e.length) && (e = Array.prototype.concat.apply([], e.map(function(t) {
            return [t, t]
        }))), 6 === e.length && e.push("F", "F");
        let r = parseInt(e.join(""), 16);
        return {
            r: r >> 24 & 255,
            g: r >> 16 & 255,
            b: r >> 8 & 255,
            a: 255 & r,
            hex: "#" + e.slice(0, 6).join("")
        }
    }
    r.getOptions = function(t) {
        t || (t = {}), t.color || (t.color = {});
        let e = void 0 === t.margin || null === t.margin || t.margin < 0 ? 4 : t.margin,
            r = t.width && t.width >= 21 ? t.width : void 0,
            o = t.scale || 4;
        return {
            width: r,
            scale: r ? 4 : o,
            margin: e,
            color: {
                dark: n(t.color.dark || "#000000ff"),
                light: n(t.color.light || "#ffffffff")
            },
            type: t.type,
            rendererOpts: t.rendererOpts || {}
        }
    }, r.getScale = function(t, e) {
        return e.width && e.width >= t + 2 * e.margin ? e.width / (t + 2 * e.margin) : e.scale
    }, r.getImageWidth = function(t, e) {
        let n = r.getScale(t, e);
        return Math.floor((t + 2 * e.margin) * n)
    }, r.qrToImageData = function(t, e, n) {
        let o = e.modules.size,
            i = e.modules.data,
            a = r.getScale(o, n),
            s = Math.floor((o + 2 * n.margin) * a),
            u = n.margin * a,
            l = [n.color.light, n.color.dark];
        for (let e = 0; e < s; e++)
            for (let r = 0; r < s; r++) {
                let h = (e * s + r) * 4,
                    f = n.color.light;
                e >= u && r >= u && e < s - u && r < s - u && (f = l[+!!i[Math.floor((e - u) / a) * o + Math.floor((r - u) / a)]]), t[h++] = f.r, t[h++] = f.g, t[h++] = f.b, t[h] = f.a
            }
    }
}, 61494, (t, e, r) => {
    let n = t.r(283195);
    r.render = function(t, e, r) {
        var o;
        let i = r,
            a = e;
        void 0 !== i || e && e.getContext || (i = e, e = void 0), e || (a = function() {
            try {
                return document.createElement("canvas")
            } catch (t) {
                throw Error("You need to specify a canvas element")
            }
        }()), i = n.getOptions(i);
        let s = n.getImageWidth(t.modules.size, i),
            u = a.getContext("2d"),
            l = u.createImageData(s, s);
        return n.qrToImageData(l.data, t, i), o = a, u.clearRect(0, 0, o.width, o.height), o.style || (o.style = {}), o.height = s, o.width = s, o.style.height = s + "px", o.style.width = s + "px", u.putImageData(l, 0, 0), a
    }, r.renderToDataURL = function(t, e, n) {
        let o = n;
        void 0 !== o || e && e.getContext || (o = e, e = void 0), o || (o = {});
        let i = r.render(t, e, o),
            a = o.type || "image/png",
            s = o.rendererOpts || {};
        return i.toDataURL(a, s.quality)
    }
}, 3442, (t, e, r) => {
    let n = t.r(283195);

    function o(t, e) {
        let r = t.a / 255,
            n = e + '="' + t.hex + '"';
        return r < 1 ? n + " " + e + '-opacity="' + r.toFixed(2).slice(1) + '"' : n
    }

    function i(t, e, r) {
        let n = t + e;
        return void 0 !== r && (n += " " + r), n
    }
    r.render = function(t, e, r) {
        let a = n.getOptions(e),
            s = t.modules.size,
            u = t.modules.data,
            l = s + 2 * a.margin,
            h = a.color.light.a ? "<path " + o(a.color.light, "fill") + ' d="M0 0h' + l + "v" + l + 'H0z"/>' : "",
            f = "<path " + o(a.color.dark, "stroke") + ' d="' + function(t, e, r) {
                let n = "",
                    o = 0,
                    a = !1,
                    s = 0;
                for (let u = 0; u < t.length; u++) {
                    let l = Math.floor(u % e),
                        h = Math.floor(u / e);
                    l || a || (a = !0), t[u] ? (s++, u > 0 && l > 0 && t[u - 1] || (n += a ? i("M", l + r, .5 + h + r) : i("m", o, 0), o = 0, a = !1), l + 1 < e && t[u + 1] || (n += i("h", s), s = 0)) : o++
                }
                return n
            }(u, s, a.margin) + '"/>',
            c = '<svg xmlns="http://www.w3.org/2000/svg" ' + (a.width ? 'width="' + a.width + '" height="' + a.width + '" ' : "") + ('viewBox="0 0 ' + l + " ") + l + '" shape-rendering="crispEdges">' + h + f + "</svg>\n";
        return "function" == typeof r && r(null, c), c
    }
}, 698870, (t, e, r) => {
    let n = t.r(530689),
        o = t.r(364367),
        i = t.r(61494),
        a = t.r(3442);

    function s(t, e, r, i, a) {
        let s = [].slice.call(arguments, 1),
            u = s.length,
            l = "function" == typeof s[u - 1];
        if (!l && !n()) throw Error("Callback required as last argument");
        if (l) {
            if (u < 2) throw Error("Too few arguments provided");
            2 === u ? (a = r, r = e, e = i = void 0) : 3 === u && (e.getContext && void 0 === a ? (a = i, i = void 0) : (a = i, i = r, r = e, e = void 0))
        } else {
            if (u < 1) throw Error("Too few arguments provided");
            return 1 === u ? (r = e, e = i = void 0) : 2 !== u || e.getContext || (i = r, r = e, e = void 0), new Promise(function(n, a) {
                try {
                    let a = o.create(r, i);
                    n(t(a, e, i))
                } catch (t) {
                    a(t)
                }
            })
        }
        try {
            let n = o.create(r, i);
            a(null, t(n, e, i))
        } catch (t) {
            a(t)
        }
    }
    r.create = o.create, r.toCanvas = s.bind(null, i.render), r.toDataURL = s.bind(null, i.renderToDataURL), r.toString = s.bind(null, function(t, e, r) {
        return a.render(t, r)
    })
}]);

//# debugId=fd643bf4-0432-d282-61fe-0098cf66fafb
//# sourceMappingURL=https://internal-assets.rbxcdn.com/_next/static/chunks/0k-jngt4t67i2.js.map