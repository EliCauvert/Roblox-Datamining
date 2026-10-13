! function() {
    try {
        var e = "u" > typeof window ? window : "u" > typeof global ? global : "u" > typeof globalThis ? globalThis : "u" > typeof self ? self : {};
        e.SENTRY_RELEASE = {
            id: "dabf94c779d23bd01548062772a4e02b66872921"
        };
        var t = (new e.Error).stack;
        t && (e._sentryDebugIds = e._sentryDebugIds || {}, e._sentryDebugIds[t] = "6f920ad3-dcdf-483c-82ad-e6ac5dd26ec9", e._sentryDebugIdIdentifier = "sentry-dbid-6f920ad3-dcdf-483c-82ad-e6ac5dd26ec9")
    } catch (e) {}
}(),
function() {
    var e = {
            742: function(e, t) {
                "use strict";
                t.byteLength = function(e) {
                    var t = l(e),
                        r = t[0],
                        n = t[1];
                    return (r + n) * 3 / 4 - n
                }, t.toByteArray = function(e) {
                    var t, r, i = l(e),
                        a = i[0],
                        u = i[1],
                        s = new o((a + u) * 3 / 4 - u),
                        c = 0,
                        f = u > 0 ? a - 4 : a;
                    for (r = 0; r < f; r += 4) t = n[e.charCodeAt(r)] << 18 | n[e.charCodeAt(r + 1)] << 12 | n[e.charCodeAt(r + 2)] << 6 | n[e.charCodeAt(r + 3)], s[c++] = t >> 16 & 255, s[c++] = t >> 8 & 255, s[c++] = 255 & t;
                    return 2 === u && (t = n[e.charCodeAt(r)] << 2 | n[e.charCodeAt(r + 1)] >> 4, s[c++] = 255 & t), 1 === u && (t = n[e.charCodeAt(r)] << 10 | n[e.charCodeAt(r + 1)] << 4 | n[e.charCodeAt(r + 2)] >> 2, s[c++] = t >> 8 & 255, s[c++] = 255 & t), s
                }, t.fromByteArray = function(e) {
                    for (var t, n = e.length, o = n % 3, i = [], a = 0, u = n - o; a < u; a += 16383) i.push(function(e, t, n) {
                        for (var o, i = [], a = t; a < n; a += 3) o = (e[a] << 16 & 0xff0000) + (e[a + 1] << 8 & 65280) + (255 & e[a + 2]), i.push(r[o >> 18 & 63] + r[o >> 12 & 63] + r[o >> 6 & 63] + r[63 & o]);
                        return i.join("")
                    }(e, a, a + 16383 > u ? u : a + 16383));
                    return 1 === o ? i.push(r[(t = e[n - 1]) >> 2] + r[t << 4 & 63] + "==") : 2 === o && i.push(r[(t = (e[n - 2] << 8) + e[n - 1]) >> 10] + r[t >> 4 & 63] + r[t << 2 & 63] + "="), i.join("")
                };
                for (var r = [], n = [], o = "u" > typeof Uint8Array ? Uint8Array : Array, i = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", a = 0, u = i.length; a < u; ++a) r[a] = i[a], n[i.charCodeAt(a)] = a;

                function l(e) {
                    var t = e.length;
                    if (t % 4 > 0) throw Error("Invalid string. Length must be a multiple of 4");
                    var r = e.indexOf("="); - 1 === r && (r = t);
                    var n = r === t ? 0 : 4 - r % 4;
                    return [r, n]
                }
                n[45] = 62, n[95] = 63
            },
            564: function(e, t, r) {
                "use strict";

                function n(e) {
                    return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
                }
                var o = r(742),
                    i = r(619),
                    a = "function" == typeof Symbol && "function" == typeof Symbol.for ? Symbol.for("nodejs.util.inspect.custom") : null;

                function u(e) {
                    if (e > 0x7fffffff) throw RangeError('The value "' + e + '" is invalid for option "size"');
                    var t = new Uint8Array(e);
                    return Object.setPrototypeOf(t, l.prototype), t
                }

                function l(e, t, r) {
                    if ("number" == typeof e) {
                        if ("string" == typeof t) throw TypeError('The "string" argument must be of type string. Received type number');
                        return f(e)
                    }
                    return s(e, t, r)
                }

                function s(e, t, r) {
                    if ("string" == typeof e) {
                        var o = e,
                            i = t;
                        if (("string" != typeof i || "" === i) && (i = "utf8"), !l.isEncoding(i)) throw TypeError("Unknown encoding: " + i);
                        var a = 0 | b(o, i),
                            s = u(a),
                            c = s.write(o, i);
                        return c !== a && (s = s.slice(0, c)), s
                    }
                    if (ArrayBuffer.isView(e)) {
                        var f = e;
                        if (I(f, Uint8Array)) {
                            var v = new Uint8Array(f);
                            return p(v.buffer, v.byteOffset, v.byteLength)
                        }
                        return h(f)
                    }
                    if (null == e) throw TypeError("The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type " + (void 0 === e ? "undefined" : n(e)));
                    if (I(e, ArrayBuffer) || e && I(e.buffer, ArrayBuffer) || "u" > typeof SharedArrayBuffer && (I(e, SharedArrayBuffer) || e && I(e.buffer, SharedArrayBuffer))) return p(e, t, r);
                    if ("number" == typeof e) throw TypeError('The "value" argument must not be of type number. Received type number');
                    var d = e.valueOf && e.valueOf();
                    if (null != d && d !== e) return l.from(d, t, r);
                    var m = function(e) {
                        if (l.isBuffer(e)) {
                            var t = 0 | y(e.length),
                                r = u(t);
                            return 0 === r.length || e.copy(r, 0, 0, t), r
                        }
                        return void 0 !== e.length ? "number" != typeof e.length || function(e) {
                            return e != e
                        }(e.length) ? u(0) : h(e) : "Buffer" === e.type && Array.isArray(e.data) ? h(e.data) : void 0
                    }(e);
                    if (m) return m;
                    if ("u" > typeof Symbol && null != Symbol.toPrimitive && "function" == typeof e[Symbol.toPrimitive]) return l.from(e[Symbol.toPrimitive]("string"), t, r);
                    throw TypeError("The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type " + (void 0 === e ? "undefined" : n(e)))
                }

                function c(e) {
                    if ("number" != typeof e) throw TypeError('"size" argument must be of type number');
                    if (e < 0) throw RangeError('The value "' + e + '" is invalid for option "size"')
                }

                function f(e) {
                    return c(e), u(e < 0 ? 0 : 0 | y(e))
                }

                function h(e) {
                    for (var t = e.length < 0 ? 0 : 0 | y(e.length), r = u(t), n = 0; n < t; n += 1) r[n] = 255 & e[n];
                    return r
                }

                function p(e, t, r) {
                    var n;
                    if (t < 0 || e.byteLength < t) throw RangeError('"offset" is outside of buffer bounds');
                    if (e.byteLength < t + (r || 0)) throw RangeError('"length" is outside of buffer bounds');
                    return Object.setPrototypeOf(n = void 0 === t && void 0 === r ? new Uint8Array(e) : void 0 === r ? new Uint8Array(e, t) : new Uint8Array(e, t, r), l.prototype), n
                }

                function y(e) {
                    if (e >= 0x7fffffff) throw RangeError("Attempt to allocate Buffer larger than maximum size: 0x7fffffff bytes");
                    return 0 | e
                }

                function b(e, t) {
                    if (l.isBuffer(e)) return e.length;
                    if (ArrayBuffer.isView(e) || I(e, ArrayBuffer)) return e.byteLength;
                    if ("string" != typeof e) throw TypeError('The "string" argument must be one of type string, Buffer, or ArrayBuffer. Received type ' + (void 0 === e ? "undefined" : n(e)));
                    var r = e.length,
                        o = arguments.length > 2 && !0 === arguments[2];
                    if (!o && 0 === r) return 0;
                    for (var i = !1;;) switch (t) {
                        case "ascii":
                        case "latin1":
                        case "binary":
                            return r;
                        case "utf8":
                        case "utf-8":
                            return B(e).length;
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return 2 * r;
                        case "hex":
                            return r >>> 1;
                        case "base64":
                            return _(e).length;
                        default:
                            if (i) return o ? -1 : B(e).length;
                            t = ("" + t).toLowerCase(), i = !0
                    }
                }

                function v(e, t, r) {
                    var n, i, a, u = !1;
                    if ((void 0 === t || t < 0) && (t = 0), t > this.length || ((void 0 === r || r > this.length) && (r = this.length), r <= 0 || (r >>>= 0) <= (t >>>= 0))) return "";
                    for (e || (e = "utf8");;) switch (e) {
                        case "hex":
                            return function(e, t, r) {
                                var n = e.length;
                                (!t || t < 0) && (t = 0), (!r || r < 0 || r > n) && (r = n);
                                for (var o = "", i = t; i < r; ++i) o += k[e[i]];
                                return o
                            }(this, t, r);
                        case "utf8":
                        case "utf-8":
                            return w(this, t, r);
                        case "ascii":
                            return function(e, t, r) {
                                var n = "";
                                r = Math.min(e.length, r);
                                for (var o = t; o < r; ++o) n += String.fromCharCode(127 & e[o]);
                                return n
                            }(this, t, r);
                        case "latin1":
                        case "binary":
                            return function(e, t, r) {
                                var n = "";
                                r = Math.min(e.length, r);
                                for (var o = t; o < r; ++o) n += String.fromCharCode(e[o]);
                                return n
                            }(this, t, r);
                        case "base64":
                            return n = this, i = t, a = r, 0 === i && a === n.length ? o.fromByteArray(n) : o.fromByteArray(n.slice(i, a));
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return function(e, t, r) {
                                for (var n = e.slice(t, r), o = "", i = 0; i < n.length - 1; i += 2) o += String.fromCharCode(n[i] + 256 * n[i + 1]);
                                return o
                            }(this, t, r);
                        default:
                            if (u) throw TypeError("Unknown encoding: " + e);
                            e = (e + "").toLowerCase(), u = !0
                    }
                }

                function d(e, t, r) {
                    var n = e[t];
                    e[t] = e[r], e[r] = n
                }

                function m(e, t, r, n, o) {
                    var i;
                    if (0 === e.length) return -1;
                    if ("string" == typeof r ? (n = r, r = 0) : r > 0x7fffffff ? r = 0x7fffffff : r < -0x80000000 && (r = -0x80000000), (i = r *= 1) != i && (r = o ? 0 : e.length - 1), r < 0 && (r = e.length + r), r >= e.length)
                        if (o) return -1;
                        else r = e.length - 1;
                    else if (r < 0)
                        if (!o) return -1;
                        else r = 0;
                    if ("string" == typeof t && (t = l.from(t, n)), l.isBuffer(t)) return 0 === t.length ? -1 : g(e, t, r, n, o);
                    if ("number" == typeof t) {
                        if (t &= 255, "function" == typeof Uint8Array.prototype.indexOf)
                            if (o) return Uint8Array.prototype.indexOf.call(e, t, r);
                            else return Uint8Array.prototype.lastIndexOf.call(e, t, r);
                        return g(e, [t], r, n, o)
                    }
                    throw TypeError("val must be string, number or Buffer")
                }

                function g(e, t, r, n, o) {
                    var i, a = 1,
                        u = e.length,
                        l = t.length;
                    if (void 0 !== n && ("ucs2" === (n = String(n).toLowerCase()) || "ucs-2" === n || "utf16le" === n || "utf-16le" === n)) {
                        if (e.length < 2 || t.length < 2) return -1;
                        a = 2, u /= 2, l /= 2, r /= 2
                    }

                    function s(e, t) {
                        return 1 === a ? e[t] : e.readUInt16BE(t * a)
                    }
                    if (o) {
                        var c = -1;
                        for (i = r; i < u; i++)
                            if (s(e, i) === s(t, -1 === c ? 0 : i - c)) {
                                if (-1 === c && (c = i), i - c + 1 === l) return c * a
                            } else - 1 !== c && (i -= i - c), c = -1
                    } else
                        for (r + l > u && (r = u - l), i = r; i >= 0; i--) {
                            for (var f = !0, h = 0; h < l; h++)
                                if (s(e, i + h) !== s(t, h)) {
                                    f = !1;
                                    break
                                } if (f) return i
                        }
                    return -1
                }

                function w(e, t, r) {
                    r = Math.min(e.length, r);
                    for (var n = [], o = t; o < r;) {
                        var i, a, u, l, s = e[o],
                            c = null,
                            f = s > 239 ? 4 : s > 223 ? 3 : s > 191 ? 2 : 1;
                        if (o + f <= r) switch (f) {
                            case 1:
                                s < 128 && (c = s);
                                break;
                            case 2:
                                (192 & (i = e[o + 1])) == 128 && (l = (31 & s) << 6 | 63 & i) > 127 && (c = l);
                                break;
                            case 3:
                                i = e[o + 1], a = e[o + 2], (192 & i) == 128 && (192 & a) == 128 && (l = (15 & s) << 12 | (63 & i) << 6 | 63 & a) > 2047 && (l < 55296 || l > 57343) && (c = l);
                                break;
                            case 4:
                                i = e[o + 1], a = e[o + 2], u = e[o + 3], (192 & i) == 128 && (192 & a) == 128 && (192 & u) == 128 && (l = (15 & s) << 18 | (63 & i) << 12 | (63 & a) << 6 | 63 & u) > 65535 && l < 1114112 && (c = l)
                        }
                        null === c ? (c = 65533, f = 1) : c > 65535 && (c -= 65536, n.push(c >>> 10 & 1023 | 55296), c = 56320 | 1023 & c), n.push(c), o += f
                    }
                    var h = n,
                        p = h.length;
                    if (p <= 4096) return String.fromCharCode.apply(String, h);
                    for (var y = "", b = 0; b < p;) y += String.fromCharCode.apply(String, h.slice(b, b += 4096));
                    return y
                }

                function O(e, t, r) {
                    if (e % 1 != 0 || e < 0) throw RangeError("offset is not uint");
                    if (e + t > r) throw RangeError("Trying to access beyond buffer length")
                }

                function E(e, t, r, n, o, i) {
                    if (!l.isBuffer(e)) throw TypeError('"buffer" argument must be a Buffer instance');
                    if (t > o || t < i) throw RangeError('"value" argument is out of bounds');
                    if (r + n > e.length) throw RangeError("Index out of range")
                }

                function S(e, t, r, n, o, i) {
                    if (r + n > e.length || r < 0) throw RangeError("Index out of range")
                }

                function P(e, t, r, n, o) {
                    return t *= 1, r >>>= 0, o || S(e, t, r, 4, 34028234663852886e22, -34028234663852886e22), i.write(e, t, r, n, 23, 4), r + 4
                }

                function A(e, t, r, n, o) {
                    return t *= 1, r >>>= 0, o || S(e, t, r, 8, 17976931348623157e292, -17976931348623157e292), i.write(e, t, r, n, 52, 8), r + 8
                }
                t.Buffer = l, t.SlowBuffer = function(e) {
                    return +e != e && (e = 0), l.alloc(+e)
                }, t.INSPECT_MAX_BYTES = 50, t.kMaxLength = 0x7fffffff, l.TYPED_ARRAY_SUPPORT = function() {
                    try {
                        var e = new Uint8Array(1),
                            t = {
                                foo: function() {
                                    return 42
                                }
                            };
                        return Object.setPrototypeOf(t, Uint8Array.prototype), Object.setPrototypeOf(e, t), 42 === e.foo()
                    } catch (e) {
                        return !1
                    }
                }(), !l.TYPED_ARRAY_SUPPORT && "u" > typeof console && "function" == typeof console.error && console.error("This browser lacks typed array (Uint8Array) support which is required by `buffer` v5.x. Use `buffer` v4.x if you require old browser support."), Object.defineProperty(l.prototype, "parent", {
                    enumerable: !0,
                    get: function() {
                        if (l.isBuffer(this)) return this.buffer
                    }
                }), Object.defineProperty(l.prototype, "offset", {
                    enumerable: !0,
                    get: function() {
                        if (l.isBuffer(this)) return this.byteOffset
                    }
                }), l.poolSize = 8192, l.from = function(e, t, r) {
                    return s(e, t, r)
                }, Object.setPrototypeOf(l.prototype, Uint8Array.prototype), Object.setPrototypeOf(l, Uint8Array), l.alloc = function(e, t, r) {
                    return (c(e), e <= 0) ? u(e) : void 0 !== t ? "string" == typeof r ? u(e).fill(t, r) : u(e).fill(t) : u(e)
                }, l.allocUnsafe = function(e) {
                    return f(e)
                }, l.allocUnsafeSlow = function(e) {
                    return f(e)
                }, l.isBuffer = function(e) {
                    return null != e && !0 === e._isBuffer && e !== l.prototype
                }, l.compare = function(e, t) {
                    if (I(e, Uint8Array) && (e = l.from(e, e.offset, e.byteLength)), I(t, Uint8Array) && (t = l.from(t, t.offset, t.byteLength)), !l.isBuffer(e) || !l.isBuffer(t)) throw TypeError('The "buf1", "buf2" arguments must be one of type Buffer or Uint8Array');
                    if (e === t) return 0;
                    for (var r = e.length, n = t.length, o = 0, i = Math.min(r, n); o < i; ++o)
                        if (e[o] !== t[o]) {
                            r = e[o], n = t[o];
                            break
                        } return r < n ? -1 : +(n < r)
                }, l.isEncoding = function(e) {
                    switch (String(e).toLowerCase()) {
                        case "hex":
                        case "utf8":
                        case "utf-8":
                        case "ascii":
                        case "latin1":
                        case "binary":
                        case "base64":
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return !0;
                        default:
                            return !1
                    }
                }, l.concat = function(e, t) {
                    if (!Array.isArray(e)) throw TypeError('"list" argument must be an Array of Buffers');
                    if (0 === e.length) return l.alloc(0);
                    if (void 0 === t)
                        for (r = 0, t = 0; r < e.length; ++r) t += e[r].length;
                    var r, n = l.allocUnsafe(t),
                        o = 0;
                    for (r = 0; r < e.length; ++r) {
                        var i = e[r];
                        if (I(i, Uint8Array)) o + i.length > n.length ? l.from(i).copy(n, o) : Uint8Array.prototype.set.call(n, i, o);
                        else if (l.isBuffer(i)) i.copy(n, o);
                        else throw TypeError('"list" argument must be an Array of Buffers');
                        o += i.length
                    }
                    return n
                }, l.byteLength = b, l.prototype._isBuffer = !0, l.prototype.swap16 = function() {
                    var e = this.length;
                    if (e % 2 != 0) throw RangeError("Buffer size must be a multiple of 16-bits");
                    for (var t = 0; t < e; t += 2) d(this, t, t + 1);
                    return this
                }, l.prototype.swap32 = function() {
                    var e = this.length;
                    if (e % 4 != 0) throw RangeError("Buffer size must be a multiple of 32-bits");
                    for (var t = 0; t < e; t += 4) d(this, t, t + 3), d(this, t + 1, t + 2);
                    return this
                }, l.prototype.swap64 = function() {
                    var e = this.length;
                    if (e % 8 != 0) throw RangeError("Buffer size must be a multiple of 64-bits");
                    for (var t = 0; t < e; t += 8) d(this, t, t + 7), d(this, t + 1, t + 6), d(this, t + 2, t + 5), d(this, t + 3, t + 4);
                    return this
                }, l.prototype.toString = function() {
                    var e = this.length;
                    return 0 === e ? "" : 0 == arguments.length ? w(this, 0, e) : v.apply(this, arguments)
                }, l.prototype.toLocaleString = l.prototype.toString, l.prototype.equals = function(e) {
                    if (!l.isBuffer(e)) throw TypeError("Argument must be a Buffer");
                    return this === e || 0 === l.compare(this, e)
                }, l.prototype.inspect = function() {
                    var e = "",
                        r = t.INSPECT_MAX_BYTES;
                    return e = this.toString("hex", 0, r).replace(/(.{2})/g, "$1 ").trim(), this.length > r && (e += " ... "), "<Buffer " + e + ">"
                }, a && (l.prototype[a] = l.prototype.inspect), l.prototype.compare = function(e, t, r, o, i) {
                    if (I(e, Uint8Array) && (e = l.from(e, e.offset, e.byteLength)), !l.isBuffer(e)) throw TypeError('The "target" argument must be one of type Buffer or Uint8Array. Received type ' + (void 0 === e ? "undefined" : n(e)));
                    if (void 0 === t && (t = 0), void 0 === r && (r = e ? e.length : 0), void 0 === o && (o = 0), void 0 === i && (i = this.length), t < 0 || r > e.length || o < 0 || i > this.length) throw RangeError("out of range index");
                    if (o >= i && t >= r) return 0;
                    if (o >= i) return -1;
                    if (t >= r) return 1;
                    if (t >>>= 0, r >>>= 0, o >>>= 0, i >>>= 0, this === e) return 0;
                    for (var a = i - o, u = r - t, s = Math.min(a, u), c = this.slice(o, i), f = e.slice(t, r), h = 0; h < s; ++h)
                        if (c[h] !== f[h]) {
                            a = c[h], u = f[h];
                            break
                        } return a < u ? -1 : +(u < a)
                }, l.prototype.includes = function(e, t, r) {
                    return -1 !== this.indexOf(e, t, r)
                }, l.prototype.indexOf = function(e, t, r) {
                    return m(this, e, t, r, !0)
                }, l.prototype.lastIndexOf = function(e, t, r) {
                    return m(this, e, t, r, !1)
                }, l.prototype.write = function(e, t, r, n) {
                    if (void 0 === t) n = "utf8", r = this.length, t = 0;
                    else if (void 0 === r && "string" == typeof t) n = t, r = this.length, t = 0;
                    else if (isFinite(t)) t >>>= 0, isFinite(r) ? (r >>>= 0, void 0 === n && (n = "utf8")) : (n = r, r = void 0);
                    else throw Error("Buffer.write(string, encoding, offset[, length]) is no longer supported");
                    var o, i, a, u, l, s, c, f, h = this.length - t;
                    if ((void 0 === r || r > h) && (r = h), e.length > 0 && (r < 0 || t < 0) || t > this.length) throw RangeError("Attempt to write outside buffer bounds");
                    n || (n = "utf8");
                    for (var p = !1;;) switch (n) {
                        case "hex":
                            return function(e, t, r, n) {
                                r = Number(r) || 0;
                                var o = e.length - r;
                                n ? (n = Number(n)) > o && (n = o) : n = o;
                                var i = t.length;
                                n > i / 2 && (n = i / 2);
                                for (var a = 0; a < n; ++a) {
                                    var u, l = parseInt(t.substr(2 * a, 2), 16);
                                    if ((u = l) != u) break;
                                    e[r + a] = l
                                }
                                return a
                            }(this, e, t, r);
                        case "utf8":
                        case "utf-8":
                            return o = t, i = r, T(B(e, this.length - o), this, o, i);
                        case "ascii":
                        case "latin1":
                        case "binary":
                            return a = t, u = r, T(function(e) {
                                for (var t = [], r = 0; r < e.length; ++r) t.push(255 & e.charCodeAt(r));
                                return t
                            }(e), this, a, u);
                        case "base64":
                            return l = t, s = r, T(_(e), this, l, s);
                        case "ucs2":
                        case "ucs-2":
                        case "utf16le":
                        case "utf-16le":
                            return c = t, f = r, T(function(e, t) {
                                for (var r, n, o = [], i = 0; i < e.length && !((t -= 2) < 0); ++i) n = (r = e.charCodeAt(i)) >> 8, o.push(r % 256), o.push(n);
                                return o
                            }(e, this.length - c), this, c, f);
                        default:
                            if (p) throw TypeError("Unknown encoding: " + n);
                            n = ("" + n).toLowerCase(), p = !0
                    }
                }, l.prototype.toJSON = function() {
                    return {
                        type: "Buffer",
                        data: Array.prototype.slice.call(this._arr || this, 0)
                    }
                }, l.prototype.slice = function(e, t) {
                    var r = this.length;
                    e = ~~e, t = void 0 === t ? r : ~~t, e < 0 ? (e += r) < 0 && (e = 0) : e > r && (e = r), t < 0 ? (t += r) < 0 && (t = 0) : t > r && (t = r), t < e && (t = e);
                    var n = this.subarray(e, t);
                    return Object.setPrototypeOf(n, l.prototype), n
                }, l.prototype.readUintLE = l.prototype.readUIntLE = function(e, t, r) {
                    e >>>= 0, t >>>= 0, r || O(e, t, this.length);
                    for (var n = this[e], o = 1, i = 0; ++i < t && (o *= 256);) n += this[e + i] * o;
                    return n
                }, l.prototype.readUintBE = l.prototype.readUIntBE = function(e, t, r) {
                    e >>>= 0, t >>>= 0, r || O(e, t, this.length);
                    for (var n = this[e + --t], o = 1; t > 0 && (o *= 256);) n += this[e + --t] * o;
                    return n
                }, l.prototype.readUint8 = l.prototype.readUInt8 = function(e, t) {
                    return e >>>= 0, t || O(e, 1, this.length), this[e]
                }, l.prototype.readUint16LE = l.prototype.readUInt16LE = function(e, t) {
                    return e >>>= 0, t || O(e, 2, this.length), this[e] | this[e + 1] << 8
                }, l.prototype.readUint16BE = l.prototype.readUInt16BE = function(e, t) {
                    return e >>>= 0, t || O(e, 2, this.length), this[e] << 8 | this[e + 1]
                }, l.prototype.readUint32LE = l.prototype.readUInt32LE = function(e, t) {
                    return e >>>= 0, t || O(e, 4, this.length), (this[e] | this[e + 1] << 8 | this[e + 2] << 16) + 0x1000000 * this[e + 3]
                }, l.prototype.readUint32BE = l.prototype.readUInt32BE = function(e, t) {
                    return e >>>= 0, t || O(e, 4, this.length), 0x1000000 * this[e] + (this[e + 1] << 16 | this[e + 2] << 8 | this[e + 3])
                }, l.prototype.readIntLE = function(e, t, r) {
                    e >>>= 0, t >>>= 0, r || O(e, t, this.length);
                    for (var n = this[e], o = 1, i = 0; ++i < t && (o *= 256);) n += this[e + i] * o;
                    return n >= (o *= 128) && (n -= Math.pow(2, 8 * t)), n
                }, l.prototype.readIntBE = function(e, t, r) {
                    e >>>= 0, t >>>= 0, r || O(e, t, this.length);
                    for (var n = t, o = 1, i = this[e + --n]; n > 0 && (o *= 256);) i += this[e + --n] * o;
                    return i >= (o *= 128) && (i -= Math.pow(2, 8 * t)), i
                }, l.prototype.readInt8 = function(e, t) {
                    return (e >>>= 0, t || O(e, 1, this.length), 128 & this[e]) ? -((255 - this[e] + 1) * 1) : this[e]
                }, l.prototype.readInt16LE = function(e, t) {
                    e >>>= 0, t || O(e, 2, this.length);
                    var r = this[e] | this[e + 1] << 8;
                    return 32768 & r ? 0xffff0000 | r : r
                }, l.prototype.readInt16BE = function(e, t) {
                    e >>>= 0, t || O(e, 2, this.length);
                    var r = this[e + 1] | this[e] << 8;
                    return 32768 & r ? 0xffff0000 | r : r
                }, l.prototype.readInt32LE = function(e, t) {
                    return e >>>= 0, t || O(e, 4, this.length), this[e] | this[e + 1] << 8 | this[e + 2] << 16 | this[e + 3] << 24
                }, l.prototype.readInt32BE = function(e, t) {
                    return e >>>= 0, t || O(e, 4, this.length), this[e] << 24 | this[e + 1] << 16 | this[e + 2] << 8 | this[e + 3]
                }, l.prototype.readFloatLE = function(e, t) {
                    return e >>>= 0, t || O(e, 4, this.length), i.read(this, e, !0, 23, 4)
                }, l.prototype.readFloatBE = function(e, t) {
                    return e >>>= 0, t || O(e, 4, this.length), i.read(this, e, !1, 23, 4)
                }, l.prototype.readDoubleLE = function(e, t) {
                    return e >>>= 0, t || O(e, 8, this.length), i.read(this, e, !0, 52, 8)
                }, l.prototype.readDoubleBE = function(e, t) {
                    return e >>>= 0, t || O(e, 8, this.length), i.read(this, e, !1, 52, 8)
                }, l.prototype.writeUintLE = l.prototype.writeUIntLE = function(e, t, r, n) {
                    if (e *= 1, t >>>= 0, r >>>= 0, !n) {
                        var o = Math.pow(2, 8 * r) - 1;
                        E(this, e, t, r, o, 0)
                    }
                    var i = 1,
                        a = 0;
                    for (this[t] = 255 & e; ++a < r && (i *= 256);) this[t + a] = e / i & 255;
                    return t + r
                }, l.prototype.writeUintBE = l.prototype.writeUIntBE = function(e, t, r, n) {
                    if (e *= 1, t >>>= 0, r >>>= 0, !n) {
                        var o = Math.pow(2, 8 * r) - 1;
                        E(this, e, t, r, o, 0)
                    }
                    var i = r - 1,
                        a = 1;
                    for (this[t + i] = 255 & e; --i >= 0 && (a *= 256);) this[t + i] = e / a & 255;
                    return t + r
                }, l.prototype.writeUint8 = l.prototype.writeUInt8 = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || E(this, e, t, 1, 255, 0), this[t] = 255 & e, t + 1
                }, l.prototype.writeUint16LE = l.prototype.writeUInt16LE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || E(this, e, t, 2, 65535, 0), this[t] = 255 & e, this[t + 1] = e >>> 8, t + 2
                }, l.prototype.writeUint16BE = l.prototype.writeUInt16BE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || E(this, e, t, 2, 65535, 0), this[t] = e >>> 8, this[t + 1] = 255 & e, t + 2
                }, l.prototype.writeUint32LE = l.prototype.writeUInt32LE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || E(this, e, t, 4, 0xffffffff, 0), this[t + 3] = e >>> 24, this[t + 2] = e >>> 16, this[t + 1] = e >>> 8, this[t] = 255 & e, t + 4
                }, l.prototype.writeUint32BE = l.prototype.writeUInt32BE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || E(this, e, t, 4, 0xffffffff, 0), this[t] = e >>> 24, this[t + 1] = e >>> 16, this[t + 2] = e >>> 8, this[t + 3] = 255 & e, t + 4
                }, l.prototype.writeIntLE = function(e, t, r, n) {
                    if (e *= 1, t >>>= 0, !n) {
                        var o = Math.pow(2, 8 * r - 1);
                        E(this, e, t, r, o - 1, -o)
                    }
                    var i = 0,
                        a = 1,
                        u = 0;
                    for (this[t] = 255 & e; ++i < r && (a *= 256);) e < 0 && 0 === u && 0 !== this[t + i - 1] && (u = 1), this[t + i] = (e / a | 0) - u & 255;
                    return t + r
                }, l.prototype.writeIntBE = function(e, t, r, n) {
                    if (e *= 1, t >>>= 0, !n) {
                        var o = Math.pow(2, 8 * r - 1);
                        E(this, e, t, r, o - 1, -o)
                    }
                    var i = r - 1,
                        a = 1,
                        u = 0;
                    for (this[t + i] = 255 & e; --i >= 0 && (a *= 256);) e < 0 && 0 === u && 0 !== this[t + i + 1] && (u = 1), this[t + i] = (e / a | 0) - u & 255;
                    return t + r
                }, l.prototype.writeInt8 = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || E(this, e, t, 1, 127, -128), e < 0 && (e = 255 + e + 1), this[t] = 255 & e, t + 1
                }, l.prototype.writeInt16LE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || E(this, e, t, 2, 32767, -32768), this[t] = 255 & e, this[t + 1] = e >>> 8, t + 2
                }, l.prototype.writeInt16BE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || E(this, e, t, 2, 32767, -32768), this[t] = e >>> 8, this[t + 1] = 255 & e, t + 2
                }, l.prototype.writeInt32LE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || E(this, e, t, 4, 0x7fffffff, -0x80000000), this[t] = 255 & e, this[t + 1] = e >>> 8, this[t + 2] = e >>> 16, this[t + 3] = e >>> 24, t + 4
                }, l.prototype.writeInt32BE = function(e, t, r) {
                    return e *= 1, t >>>= 0, r || E(this, e, t, 4, 0x7fffffff, -0x80000000), e < 0 && (e = 0xffffffff + e + 1), this[t] = e >>> 24, this[t + 1] = e >>> 16, this[t + 2] = e >>> 8, this[t + 3] = 255 & e, t + 4
                }, l.prototype.writeFloatLE = function(e, t, r) {
                    return P(this, e, t, !0, r)
                }, l.prototype.writeFloatBE = function(e, t, r) {
                    return P(this, e, t, !1, r)
                }, l.prototype.writeDoubleLE = function(e, t, r) {
                    return A(this, e, t, !0, r)
                }, l.prototype.writeDoubleBE = function(e, t, r) {
                    return A(this, e, t, !1, r)
                }, l.prototype.copy = function(e, t, r, n) {
                    if (!l.isBuffer(e)) throw TypeError("argument should be a Buffer");
                    if (r || (r = 0), n || 0 === n || (n = this.length), t >= e.length && (t = e.length), t || (t = 0), n > 0 && n < r && (n = r), n === r || 0 === e.length || 0 === this.length) return 0;
                    if (t < 0) throw RangeError("targetStart out of bounds");
                    if (r < 0 || r >= this.length) throw RangeError("Index out of range");
                    if (n < 0) throw RangeError("sourceEnd out of bounds");
                    n > this.length && (n = this.length), e.length - t < n - r && (n = e.length - t + r);
                    var o = n - r;
                    return this === e && "function" == typeof Uint8Array.prototype.copyWithin ? this.copyWithin(t, r, n) : Uint8Array.prototype.set.call(e, this.subarray(r, n), t), o
                }, l.prototype.fill = function(e, t, r, n) {
                    if ("string" == typeof e) {
                        if ("string" == typeof t ? (n = t, t = 0, r = this.length) : "string" == typeof r && (n = r, r = this.length), void 0 !== n && "string" != typeof n) throw TypeError("encoding must be a string");
                        if ("string" == typeof n && !l.isEncoding(n)) throw TypeError("Unknown encoding: " + n);
                        if (1 === e.length) {
                            var o, i = e.charCodeAt(0);
                            ("utf8" === n && i < 128 || "latin1" === n) && (e = i)
                        }
                    } else "number" == typeof e ? e &= 255 : "boolean" == typeof e && (e = Number(e));
                    if (t < 0 || this.length < t || this.length < r) throw RangeError("Out of range index");
                    if (r <= t) return this;
                    if (t >>>= 0, r = void 0 === r ? this.length : r >>> 0, e || (e = 0), "number" == typeof e)
                        for (o = t; o < r; ++o) this[o] = e;
                    else {
                        var a = l.isBuffer(e) ? e : l.from(e, n),
                            u = a.length;
                        if (0 === u) throw TypeError('The value "' + e + '" is invalid for argument "value"');
                        for (o = 0; o < r - t; ++o) this[o + t] = a[o % u]
                    }
                    return this
                };
                var j = /[^+/0-9A-Za-z-_]/g;

                function B(e, t) {
                    t = t || 1 / 0;
                    for (var r, n = e.length, o = null, i = [], a = 0; a < n; ++a) {
                        if ((r = e.charCodeAt(a)) > 55295 && r < 57344) {
                            if (!o) {
                                if (r > 56319 || a + 1 === n) {
                                    (t -= 3) > -1 && i.push(239, 191, 189);
                                    continue
                                }
                                o = r;
                                continue
                            }
                            if (r < 56320) {
                                (t -= 3) > -1 && i.push(239, 191, 189), o = r;
                                continue
                            }
                            r = (o - 55296 << 10 | r - 56320) + 65536
                        } else o && (t -= 3) > -1 && i.push(239, 191, 189);
                        if (o = null, r < 128) {
                            if ((t -= 1) < 0) break;
                            i.push(r)
                        } else if (r < 2048) {
                            if ((t -= 2) < 0) break;
                            i.push(r >> 6 | 192, 63 & r | 128)
                        } else if (r < 65536) {
                            if ((t -= 3) < 0) break;
                            i.push(r >> 12 | 224, r >> 6 & 63 | 128, 63 & r | 128)
                        } else if (r < 1114112) {
                            if ((t -= 4) < 0) break;
                            i.push(r >> 18 | 240, r >> 12 & 63 | 128, r >> 6 & 63 | 128, 63 & r | 128)
                        } else throw Error("Invalid code point")
                    }
                    return i
                }

                function _(e) {
                    return o.toByteArray(function(e) {
                        if ((e = (e = e.split("=")[0]).trim().replace(j, "")).length < 2) return "";
                        for (; e.length % 4 != 0;) e += "=";
                        return e
                    }(e))
                }

                function T(e, t, r, n) {
                    for (var o = 0; o < n && !(o + r >= t.length) && !(o >= e.length); ++o) t[o + r] = e[o];
                    return o
                }

                function I(e, t) {
                    return (null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t) || null != e && null != e.constructor && null != e.constructor.name && e.constructor.name === t.name
                }
                var k = function() {
                    for (var e = "0123456789abcdef", t = Array(256), r = 0; r < 16; ++r)
                        for (var n = 16 * r, o = 0; o < 16; ++o) t[n + o] = e[r] + e[o];
                    return t
                }()
            },
            619: function(e, t) {
                /*! ieee754. BSD-3-Clause License. Feross Aboukhadijeh <https://feross.org/opensource> */
                t.read = function(e, t, r, n, o) {
                    var i, a, u = 8 * o - n - 1,
                        l = (1 << u) - 1,
                        s = l >> 1,
                        c = -7,
                        f = r ? o - 1 : 0,
                        h = r ? -1 : 1,
                        p = e[t + f];
                    for (f += h, i = p & (1 << -c) - 1, p >>= -c, c += u; c > 0; i = 256 * i + e[t + f], f += h, c -= 8);
                    for (a = i & (1 << -c) - 1, i >>= -c, c += n; c > 0; a = 256 * a + e[t + f], f += h, c -= 8);
                    if (0 === i) i = 1 - s;
                    else {
                        if (i === l) return a ? NaN : 1 / 0 * (p ? -1 : 1);
                        a += Math.pow(2, n), i -= s
                    }
                    return (p ? -1 : 1) * a * Math.pow(2, i - n)
                }, t.write = function(e, t, r, n, o, i) {
                    var a, u, l, s = 8 * i - o - 1,
                        c = (1 << s) - 1,
                        f = c >> 1,
                        h = 5960464477539062e-23 * (23 === o),
                        p = n ? 0 : i - 1,
                        y = n ? 1 : -1,
                        b = +(t < 0 || 0 === t && 1 / t < 0);
                    for (isNaN(t = Math.abs(t)) || t === 1 / 0 ? (u = +!!isNaN(t), a = c) : (a = Math.floor(Math.log(t) / Math.LN2), t * (l = Math.pow(2, -a)) < 1 && (a--, l *= 2), a + f >= 1 ? t += h / l : t += h * Math.pow(2, 1 - f), t * l >= 2 && (a++, l /= 2), a + f >= c ? (u = 0, a = c) : a + f >= 1 ? (u = (t * l - 1) * Math.pow(2, o), a += f) : (u = t * Math.pow(2, f - 1) * Math.pow(2, o), a = 0)); o >= 8; e[r + p] = 255 & u, p += y, u /= 256, o -= 8);
                    for (a = a << o | u, s += o; s > 0; e[r + p] = 255 & a, p += y, a /= 256, s -= 8);
                    e[r + p - y] |= 128 * b
                }
            },
            848: function(e, t, r) {
                "use strict";
                var n = r(564).Buffer;

                function o(e) {
                    return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
                }
                var i = void 0 !== n,
                    a = /"(?:_|\\u005[Ff])(?:_|\\u005[Ff])(?:p|\\u0070)(?:r|\\u0072)(?:o|\\u006[Ff])(?:t|\\u0074)(?:o|\\u006[Ff])(?:_|\\u005[Ff])(?:_|\\u005[Ff])"\s*:/,
                    u = /"(?:c|\\u0063)(?:o|\\u006[Ff])(?:n|\\u006[Ee])(?:s|\\u0073)(?:t|\\u0074)(?:r|\\u0072)(?:u|\\u0075)(?:c|\\u0063)(?:t|\\u0074)(?:o|\\u006[Ff])(?:r|\\u0072)"\s*:/;

                function l(e, t, r) {
                    null == r && null !== t && (void 0 === t ? "undefined" : o(t)) === "object" && (r = t, t = void 0), i && n.isBuffer(e) && (e = e.toString()), e && 65279 === e.charCodeAt(0) && (e = e.slice(1));
                    var l = JSON.parse(e, t);
                    if (null === l || (void 0 === l ? "undefined" : o(l)) !== "object") return l;
                    var c = r && r.protoAction || "error",
                        f = r && r.constructorAction || "error";
                    if ("ignore" === c && "ignore" === f) return l;
                    if ("ignore" !== c && "ignore" !== f) {
                        if (!1 === a.test(e) && !1 === u.test(e)) return l
                    } else if ("ignore" !== c && "ignore" === f) {
                        if (!1 === a.test(e)) return l
                    } else if (!1 === u.test(e)) return l;
                    return s(l, {
                        protoAction: c,
                        constructorAction: f,
                        safe: r && r.safe
                    })
                }

                function s(e) {
                    for (var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}, r = t.protoAction, n = void 0 === r ? "error" : r, i = t.constructorAction, a = void 0 === i ? "error" : i, u = t.safe, l = [e]; l.length;) {
                        var s = l;
                        l = [];
                        var c = !0,
                            f = !1,
                            h = void 0;
                        try {
                            for (var p, y = s[Symbol.iterator](); !(c = (p = y.next()).done); c = !0) {
                                var b = p.value;
                                if ("ignore" !== n && Object.prototype.hasOwnProperty.call(b, "__proto__")) {
                                    if (!0 === u) return null;
                                    if ("error" === n) throw SyntaxError("Object contains forbidden prototype property");
                                    delete b.__proto__
                                }
                                if ("ignore" !== a && Object.prototype.hasOwnProperty.call(b, "constructor") && null !== b.constructor && "object" === o(b.constructor) && Object.prototype.hasOwnProperty.call(b.constructor, "prototype")) {
                                    if (!0 === u) return null;
                                    if ("error" === a) throw SyntaxError("Object contains forbidden prototype property");
                                    delete b.constructor
                                }
                                for (var v in b) {
                                    var d = b[v];
                                    d && (void 0 === d ? "undefined" : o(d)) === "object" && l.push(d)
                                }
                            }
                        } catch (e) {
                            f = !0, h = e
                        } finally {
                            try {
                                c || null == y.return || y.return()
                            } finally {
                                if (f) throw h
                            }
                        }
                    }
                    return e
                }

                function c(e, t, r) {
                    var n = Error.stackTraceLimit;
                    Error.stackTraceLimit = 0;
                    try {
                        return l(e, t, r)
                    } finally {
                        Error.stackTraceLimit = n
                    }
                }
                e.exports = c, e.exports.default = c, e.exports.parse = c, e.exports.safeParse = function(e, t) {
                    var r = Error.stackTraceLimit;
                    Error.stackTraceLimit = 0;
                    try {
                        return l(e, t, {
                            safe: !0
                        })
                    } catch (e) {
                        return
                    } finally {
                        Error.stackTraceLimit = r
                    }
                }, e.exports.scan = s
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
        }, r.rv = function() {
            return "1.7.12"
        }, r.ruid = "bundler=rspack@1.7.12",
        function() {
            "use strict";
            var e, t, n, o, i, a, u, l, s, c, f, h, p, y, b, v, d, m, g, w, O, E, S, P, A, j, B = window.ReactJSX,
                _ = window.TanstackQuery,
                T = window.Roblox["core-scripts"].util.ready,
                I = r.n(T),
                k = window.Roblox["core-scripts"].meta.device,
                H = window.Roblox["core-scripts"].react,
                x = window.React,
                N = r.n(x);

            function R(e, t) {
                var r = t && t.cache ? t.cache : U,
                    n = t && t.serializer ? t.serializer : L;
                return (t && t.strategy ? t.strategy : function(e, t) {
                    var r, n, o = 1 === e.length ? C : M;
                    return r = t.cache.create(), n = t.serializer, o.bind(this, e, r, n)
                })(e, {
                    cache: r,
                    serializer: n
                })
            }

            function C(e, t, r, n) {
                var o = null == n || "number" == typeof n || "boolean" == typeof n ? n : r(n),
                    i = t.get(o);
                return void 0 === i && (i = e.call(this, n), t.set(o, i)), i
            }

            function M(e, t, r) {
                var n = Array.prototype.slice.call(arguments, 3),
                    o = r(n),
                    i = t.get(o);
                return void 0 === i && (i = e.apply(this, n), t.set(o, i)), i
            }
            var L = function() {
                    return JSON.stringify(arguments)
                },
                D = function() {
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
                U = {
                    create: function() {
                        return new D
                    }
                },
                F = {
                    variadic: function(e, t) {
                        var r, n;
                        return r = t.cache.create(), n = t.serializer, M.bind(this, e, r, n)
                    },
                    monadic: function(e, t) {
                        var r, n;
                        return r = t.cache.create(), n = t.serializer, C.bind(this, e, r, n)
                    }
                };

            function z(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function G(e, t, r) {
                return (G = $() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && Z(o, r.prototype), o
                }).apply(null, arguments)
            }

            function V(e) {
                return (V = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function Z(e, t) {
                return (Z = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function K(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (K = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return G(e, arguments, V(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), Z(r, e)
                })(e)
            }

            function $() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return ($ = function() {
                    return !!e
                })()
            }
            var X = function(e) {
                    if ("function" != typeof e && null !== e) throw TypeError("Super expression must either be null or a function");

                    function t(e, r) {
                        if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                        var n, o, i, a = e;
                        return r && (a += ": " + r), n = t, o = [a], n = V(n), (i = function(e, t) {
                            var r;
                            if (t && ("object" == ((r = t) && "u" > typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r) || "function" == typeof t)) return t;
                            if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                            return e
                        }(this, $() ? Reflect.construct(n, o || [], V(this).constructor) : n.apply(this, o))).code = e, r && (i.originalMessage = r), i
                    }
                    return t.prototype = Object.create(e && e.prototype, {
                        constructor: {
                            value: t,
                            writable: !0,
                            configurable: !0
                        }
                    }), e && Z(t, e), t
                }(K(Error)),
                W = ((y = W || {}).MISSING_MESSAGE = "MISSING_MESSAGE", y.MISSING_FORMAT = "MISSING_FORMAT", y.ENVIRONMENT_FALLBACK = "ENVIRONMENT_FALLBACK", y.INSUFFICIENT_PATH = "INSUFFICIENT_PATH", y.INVALID_MESSAGE = "INVALID_MESSAGE", y.INVALID_KEY = "INVALID_KEY", y.FORMATTING_ERROR = "FORMATTING_ERROR", y);

            function Y(e, t) {
                return R(e, {
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
                    strategy: F.variadic
                })
            }

            function q(e, t) {
                return Y(function() {
                    for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
                    return G(e, function(e) {
                        if (Array.isArray(e)) return z(e)
                    }(r) || function(e) {
                        if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                    }(r) || function(e) {
                        if (e) {
                            if ("string" == typeof e) return z(e, void 0);
                            var t = Object.prototype.toString.call(e).slice(8, -1);
                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return z(e, void 0)
                        }
                    }(r) || function() {
                        throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                    }())
                }, t)
            }

            function J(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function Q(e) {
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

            function ee(e, t) {
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
            var et = /(?:[Eec]{1,6}|G{1,5}|[Qq]{1,5}|(?:[yYur]+|U{1,5})|[ML]{1,5}|d{1,2}|D{1,3}|F{1}|[abB]{1,5}|[hkHK]{1,2}|w{1,2}|W{1}|m{1,2}|s{1,2}|[zZOvVxX]{1,4})(?=([^']*'[^']*')*[^']*$)/g,
                er = /[\t-\r \x85\u200E\u200F\u2028\u2029]/i,
                en = /^\.(?:(0+)(\*)?|(#+)|(0+)(#+))$/g,
                eo = /^(@+)?(\+|#+)?[rs]?$/g,
                ei = /(\*)(0+)|(#+)(0+)|(0+)/g,
                ea = /^(0+)$/;

            function eu(e) {
                var t = {};
                return "r" === e[e.length - 1] ? t.roundingPriority = "morePrecision" : "s" === e[e.length - 1] && (t.roundingPriority = "lessPrecision"), e.replace(eo, function(e, r, n) {
                    return "string" != typeof n ? (t.minimumSignificantDigits = r.length, t.maximumSignificantDigits = r.length) : "+" === n ? t.minimumSignificantDigits = r.length : "#" === r[0] ? t.maximumSignificantDigits = r.length : (t.minimumSignificantDigits = r.length, t.maximumSignificantDigits = r.length + ("string" == typeof n ? n.length : 0)), ""
                }), t
            }

            function el(e) {
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

            function es(e) {
                var t = el(e);
                return t || {}
            }

            function ec(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ef(e) {
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

            function eh(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function ep(e, t) {
                if (e) {
                    if ("string" == typeof e) return ec(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ec(e, t)
                }
            }
            var ey = ((b = {})[b.EXPECT_ARGUMENT_CLOSING_BRACE = 1] = "EXPECT_ARGUMENT_CLOSING_BRACE", b[b.EMPTY_ARGUMENT = 2] = "EMPTY_ARGUMENT", b[b.MALFORMED_ARGUMENT = 3] = "MALFORMED_ARGUMENT", b[b.EXPECT_ARGUMENT_TYPE = 4] = "EXPECT_ARGUMENT_TYPE", b[b.INVALID_ARGUMENT_TYPE = 5] = "INVALID_ARGUMENT_TYPE", b[b.EXPECT_ARGUMENT_STYLE = 6] = "EXPECT_ARGUMENT_STYLE", b[b.INVALID_NUMBER_SKELETON = 7] = "INVALID_NUMBER_SKELETON", b[b.INVALID_DATE_TIME_SKELETON = 8] = "INVALID_DATE_TIME_SKELETON", b[b.EXPECT_NUMBER_SKELETON = 9] = "EXPECT_NUMBER_SKELETON", b[b.EXPECT_DATE_TIME_SKELETON = 10] = "EXPECT_DATE_TIME_SKELETON", b[b.UNCLOSED_QUOTE_IN_ARGUMENT_STYLE = 11] = "UNCLOSED_QUOTE_IN_ARGUMENT_STYLE", b[b.EXPECT_SELECT_ARGUMENT_OPTIONS = 12] = "EXPECT_SELECT_ARGUMENT_OPTIONS", b[b.EXPECT_PLURAL_ARGUMENT_OFFSET_VALUE = 13] = "EXPECT_PLURAL_ARGUMENT_OFFSET_VALUE", b[b.INVALID_PLURAL_ARGUMENT_OFFSET_VALUE = 14] = "INVALID_PLURAL_ARGUMENT_OFFSET_VALUE", b[b.EXPECT_SELECT_ARGUMENT_SELECTOR = 15] = "EXPECT_SELECT_ARGUMENT_SELECTOR", b[b.EXPECT_PLURAL_ARGUMENT_SELECTOR = 16] = "EXPECT_PLURAL_ARGUMENT_SELECTOR", b[b.EXPECT_SELECT_ARGUMENT_SELECTOR_FRAGMENT = 17] = "EXPECT_SELECT_ARGUMENT_SELECTOR_FRAGMENT", b[b.EXPECT_PLURAL_ARGUMENT_SELECTOR_FRAGMENT = 18] = "EXPECT_PLURAL_ARGUMENT_SELECTOR_FRAGMENT", b[b.INVALID_PLURAL_ARGUMENT_SELECTOR = 19] = "INVALID_PLURAL_ARGUMENT_SELECTOR", b[b.DUPLICATE_PLURAL_ARGUMENT_SELECTOR = 20] = "DUPLICATE_PLURAL_ARGUMENT_SELECTOR", b[b.DUPLICATE_SELECT_ARGUMENT_SELECTOR = 21] = "DUPLICATE_SELECT_ARGUMENT_SELECTOR", b[b.MISSING_OTHER_CLAUSE = 22] = "MISSING_OTHER_CLAUSE", b[b.INVALID_TAG = 23] = "INVALID_TAG", b[b.INVALID_TAG_NAME = 25] = "INVALID_TAG_NAME", b[b.UNMATCHED_CLOSING_TAG = 26] = "UNMATCHED_CLOSING_TAG", b[b.UNCLOSED_TAG = 27] = "UNCLOSED_TAG", b);

            function eb(e) {
                return !!(e && (void 0 === e ? "undefined" : eh(e)) === "object" && 0 === e.type)
            }

            function ev(e) {
                return !!(e && (void 0 === e ? "undefined" : eh(e)) === "object" && 1 === e.type)
            }
            var ed = /[ \xA0\u1680\u2000-\u200A\u202F\u205F\u3000]/,
                em = {
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
                eg = new RegExp("^".concat(ed.source, "*")),
                ew = new RegExp("".concat(ed.source, "*$"));

            function eO(e, t) {
                return {
                    start: e,
                    end: t
                }
            }
            var eE = !!Object.fromEntries,
                eS = !!String.prototype.trimStart,
                eP = !!String.prototype.trimEnd,
                eA = eE ? Object.fromEntries : function(e) {
                    var t = {},
                        r = !0,
                        n = !1,
                        o = void 0;
                    try {
                        for (var i, a = e[Symbol.iterator](); !(r = (i = a.next()).done); r = !0) {
                            var u, l = (u = i.value, function(e) {
                                    if (Array.isArray(e)) return e
                                }(u) || function(e) {
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
                                }(u) || ep(u, 2) || function() {
                                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }()),
                                s = l[0],
                                c = l[1];
                            t[s] = c
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
                ej = eS ? function(e) {
                    return e.trimStart()
                } : function(e) {
                    return e.replace(eg, "")
                },
                eB = eP ? function(e) {
                    return e.trimEnd()
                } : function(e) {
                    return e.replace(ew, "")
                },
                e_ = RegExp("([^\\u0009-\\u000D\\u0020\\u0085\\u00A0\\u1680\\u2000-\\u200A\\u2028-\\u2029\\u202F\\u205F\\u3000\\u0021-\\u002F\\u003A-\\u0040\\u005B-\\u005E\\u0060\\u007B-\\u007E\\u00A1-\\u00A7\\u00A9\\u00AB-\\u00AC\\u00AE\\u00B0-\\u00B1\\u00B6\\u00BB\\u00BF\\u00D7\\u00F7\\u2010-\\u2027\\u2030-\\u203E\\u2041-\\u2053\\u2055-\\u205E\\u2190-\\u245F\\u2500-\\u2775\\u2794-\\u2BFF\\u2E00-\\u2E7F\\u3001-\\u3003\\u3008-\\u3020\\u3030\\uFD3E-\\uFD3F\\uFE45-\\uFE46]*)", "yu"),
                eT = function() {
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
                                                    location: eO(r, this.clonePosition())
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
                                            location: eO(a, this.clonePosition())
                                        })
                                    } else if (60 !== o || this.ignoreTag || 47 !== this.peek())
                                        if (60 === o && !this.ignoreTag && eI(this.peek() || 0)) {
                                            var u = this.parseTag(e, t);
                                            if (u.err) return u;
                                            n.push(u.val)
                                        } else {
                                            var l = this.parseLiteral(e, t);
                                            if (l.err) return l;
                                            n.push(l.val)
                                        }
                                    else if (!r) return this.error(26, eO(this.clonePosition(), this.clonePosition()));
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
                                        location: eO(r, this.clonePosition())
                                    },
                                    err: null
                                };
                                if (!this.bumpIf(">")) return this.error(23, eO(r, this.clonePosition()));
                                var o = this.parseMessage(e + 1, t, !0);
                                if (o.err) return o;
                                var i = o.val,
                                    a = this.clonePosition();
                                if (!this.bumpIf("</")) return this.error(27, eO(r, this.clonePosition()));
                                if (this.isEOF() || !eI(this.char())) return this.error(23, eO(a, this.clonePosition()));
                                var u = this.clonePosition();
                                return n !== this.parseTagName() ? this.error(26, eO(u, this.clonePosition())) : (this.bumpSpace(), this.bumpIf(">")) ? {
                                    val: {
                                        type: 8,
                                        value: n,
                                        children: i,
                                        location: eO(r, this.clonePosition())
                                    },
                                    err: null
                                } : this.error(23, eO(a, this.clonePosition()))
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
                                        location: eO(r, this.clonePosition())
                                    },
                                    err: null
                                }
                            }
                        }, {
                            key: "tryParseLeftAngleBracket",
                            value: function() {
                                var e;
                                return this.isEOF() || 60 !== this.char() || !this.ignoreTag && (eI(e = this.peek() || 0) || 47 === e) ? null : (this.bump(), "<")
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
                                    if (Array.isArray(e)) return ec(e)
                                }(r) || function(e) {
                                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(r) || ep(r) || function() {
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
                                if (this.bump(), this.bumpSpace(), this.isEOF()) return this.error(1, eO(r, this.clonePosition()));
                                if (125 === this.char()) return this.bump(), this.error(2, eO(r, this.clonePosition()));
                                var n = this.parseIdentifierIfPossible().value;
                                if (!n) return this.error(3, eO(r, this.clonePosition()));
                                if (this.bumpSpace(), this.isEOF()) return this.error(1, eO(r, this.clonePosition()));
                                switch (this.char()) {
                                    case 125:
                                        return this.bump(), {
                                            val: {
                                                type: 1,
                                                value: n,
                                                location: eO(r, this.clonePosition())
                                            },
                                            err: null
                                        };
                                    case 44:
                                        if (this.bump(), this.bumpSpace(), this.isEOF()) return this.error(1, eO(r, this.clonePosition()));
                                        return this.parseArgumentOptions(e, t, n, r);
                                    default:
                                        return this.error(3, eO(r, this.clonePosition()))
                                }
                            }
                        }, {
                            key: "parseIdentifierIfPossible",
                            value: function() {
                                var e, t, r = this.clonePosition(),
                                    n = this.offset(),
                                    o = (e = this.message, e_.lastIndex = n, null != (t = e_.exec(e)[1]) ? t : ""),
                                    i = n + o.length;
                                return this.bumpTo(i), {
                                    value: o,
                                    location: eO(r, this.clonePosition())
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
                                        return this.error(4, eO(o, a));
                                    case "number":
                                    case "date":
                                    case "time":
                                        this.bumpSpace();
                                        var u, l = null;
                                        if (this.bumpIf(",")) {
                                            this.bumpSpace();
                                            var s = this.clonePosition(),
                                                c = this.parseSimpleArgStyleIfPossible();
                                            if (c.err) return c;
                                            var f = eB(c.val);
                                            if (0 === f.length) return this.error(6, eO(this.clonePosition(), this.clonePosition()));
                                            l = {
                                                style: f,
                                                styleLocation: eO(s, this.clonePosition())
                                            }
                                        }
                                        var h = this.tryParseArgumentClose(n);
                                        if (h.err) return h;
                                        var p = eO(n, this.clonePosition());
                                        if (l && l.style.startsWith("::")) {
                                            var y = ej(l.style.slice(2));
                                            if ("number" === i) {
                                                var b = this.parseNumberSkeletonFromString(y, l.styleLocation);
                                                if (b.err) return b;
                                                return {
                                                    val: {
                                                        type: 2,
                                                        value: r,
                                                        location: p,
                                                        style: b.val
                                                    },
                                                    err: null
                                                }
                                            }
                                            if (0 === y.length) return this.error(10, p);
                                            var v, d = y;
                                            return this.locale && (d = function(e, t) {
                                                for (var r = "", n = 0; n < e.length; n++) {
                                                    var o = e.charAt(n);
                                                    if ("j" === o) {
                                                        for (var i = 0; n + 1 < e.length && e.charAt(n + 1) === o;) i++, n++;
                                                        var a = 1 + (1 & i),
                                                            u = i < 2 ? 1 : 3 + (i >> 1),
                                                            l = function(e) {
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
                                                                return "root" !== n && (t = e.maximize().region), (em[t || ""] || em[n || ""] || em["".concat(n, "-001")] || em["001"])[0]
                                                            }(t);
                                                        for (("H" == l || "k" == l) && (u = 0); u-- > 0;) r += "a";
                                                        for (; a-- > 0;) r = l + r
                                                    } else "J" === o ? r += "H" : r += o
                                                }
                                                return r
                                            }(y, this.locale)), {
                                                val: {
                                                    type: "date" === i ? 3 : 4,
                                                    value: r,
                                                    location: p,
                                                    style: {
                                                        type: 1,
                                                        pattern: d,
                                                        location: l.styleLocation,
                                                        parsedOptions: this.shouldParseSkeletons ? (v = {}, d.replace(et, function(e) {
                                                            var t = e.length;
                                                            switch (e[0]) {
                                                                case "G":
                                                                    v.era = 4 === t ? "long" : 5 === t ? "narrow" : "short";
                                                                    break;
                                                                case "y":
                                                                    v.year = 2 === t ? "2-digit" : "numeric";
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
                                                                    v.month = ["numeric", "2-digit", "short", "long", "narrow"][t - 1];
                                                                    break;
                                                                case "w":
                                                                case "W":
                                                                    throw RangeError("`w/W` (week) patterns are not supported");
                                                                case "d":
                                                                    v.day = ["numeric", "2-digit"][t - 1];
                                                                    break;
                                                                case "D":
                                                                case "F":
                                                                case "g":
                                                                    throw RangeError("`D/F/g` (day) patterns are not supported, use `d` instead");
                                                                case "E":
                                                                    v.weekday = 4 === t ? "long" : 5 === t ? "narrow" : "short";
                                                                    break;
                                                                case "e":
                                                                    if (t < 4) throw RangeError("`e..eee` (weekday) patterns are not supported");
                                                                    v.weekday = ["short", "long", "narrow", "short"][t - 4];
                                                                    break;
                                                                case "c":
                                                                    if (t < 4) throw RangeError("`c..ccc` (weekday) patterns are not supported");
                                                                    v.weekday = ["short", "long", "narrow", "short"][t - 4];
                                                                    break;
                                                                case "a":
                                                                    v.hour12 = !0;
                                                                    break;
                                                                case "b":
                                                                case "B":
                                                                    throw RangeError("`b/B` (period) patterns are not supported, use `a` instead");
                                                                case "h":
                                                                    v.hourCycle = "h12", v.hour = ["numeric", "2-digit"][t - 1];
                                                                    break;
                                                                case "H":
                                                                    v.hourCycle = "h23", v.hour = ["numeric", "2-digit"][t - 1];
                                                                    break;
                                                                case "K":
                                                                    v.hourCycle = "h11", v.hour = ["numeric", "2-digit"][t - 1];
                                                                    break;
                                                                case "k":
                                                                    v.hourCycle = "h24", v.hour = ["numeric", "2-digit"][t - 1];
                                                                    break;
                                                                case "j":
                                                                case "J":
                                                                case "C":
                                                                    throw RangeError("`j/J/C` (hour) patterns are not supported, use `h/H/K/k` instead");
                                                                case "m":
                                                                    v.minute = ["numeric", "2-digit"][t - 1];
                                                                    break;
                                                                case "s":
                                                                    v.second = ["numeric", "2-digit"][t - 1];
                                                                    break;
                                                                case "S":
                                                                case "A":
                                                                    throw RangeError("`S/A` (second) patterns are not supported, use `s` instead");
                                                                case "z":
                                                                    v.timeZoneName = t < 4 ? "short" : "long";
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
                                                        }), v) : {}
                                                    }
                                                },
                                                err: null
                                            }
                                        }
                                        return {
                                            val: {
                                                type: "number" === i ? 2 : "date" === i ? 3 : 4,
                                                value: r,
                                                location: p,
                                                style: null != (u = null == l ? void 0 : l.style) ? u : null
                                            }, err: null
                                        };
                                    case "plural":
                                    case "selectordinal":
                                    case "select":
                                        var m = this.clonePosition();
                                        if (this.bumpSpace(), !this.bumpIf(",")) return this.error(12, eO(m, ef({}, m)));
                                        this.bumpSpace();
                                        var g = this.parseIdentifierIfPossible(),
                                            w = 0;
                                        if ("select" !== i && "offset" === g.value) {
                                            if (!this.bumpIf(":")) return this.error(13, eO(this.clonePosition(), this.clonePosition()));
                                            this.bumpSpace();
                                            var O = this.tryParseDecimalInteger(13, 14);
                                            if (O.err) return O;
                                            this.bumpSpace(), g = this.parseIdentifierIfPossible(), w = O.val
                                        }
                                        var E = this.tryParsePluralOrSelectOptions(e, i, t, g);
                                        if (E.err) return E;
                                        var S = this.tryParseArgumentClose(n);
                                        if (S.err) return S;
                                        var P = eO(n, this.clonePosition());
                                        if ("select" === i) return {
                                            val: {
                                                type: 5,
                                                value: r,
                                                options: eA(E.val),
                                                location: P
                                            },
                                            err: null
                                        };
                                        return {
                                            val: {
                                                type: 6,
                                                value: r,
                                                options: eA(E.val),
                                                offset: w,
                                                pluralType: "plural" === i ? "cardinal" : "ordinal",
                                                location: P
                                            }, err: null
                                        };
                                    default:
                                        return this.error(5, eO(o, a))
                                }
                            }
                        }, {
                            key: "tryParseArgumentClose",
                            value: function(e) {
                                return this.isEOF() || 125 !== this.char() ? this.error(1, eO(e, this.clonePosition())) : (this.bump(), {
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
                                        if (!this.bumpUntil("'")) return this.error(11, eO(r, this.clonePosition()));
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
                                        var t = e.split(er).filter(function(e) {
                                                return e.length > 0
                                            }),
                                            r = [],
                                            n = !0,
                                            o = !1,
                                            i = void 0;
                                        try {
                                            for (var a, u = t[Symbol.iterator](); !(n = (a = u.next()).done); n = !0) {
                                                var l = a.value.split("/");
                                                if (0 === l.length) throw Error("Invalid number skeleton");
                                                var s = function(e) {
                                                        if (Array.isArray(e)) return e
                                                    }(l) || function(e) {
                                                        if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                                    }(l) || function(e) {
                                                        if (e) {
                                                            if ("string" == typeof e) return J(e, void 0);
                                                            var t = Object.prototype.toString.call(e).slice(8, -1);
                                                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return J(e, void 0)
                                                        }
                                                    }(l) || function() {
                                                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                                    }(),
                                                    c = s[0],
                                                    f = s.slice(1),
                                                    h = !0,
                                                    p = !1,
                                                    y = void 0;
                                                try {
                                                    for (var b, v = f[Symbol.iterator](); !(h = (b = v.next()).done); h = !0) {
                                                        var d = b.value;
                                                        if (0 === d.length) throw Error("Invalid number skeleton")
                                                    }
                                                } catch (e) {
                                                    p = !0, y = e
                                                } finally {
                                                    try {
                                                        h || null == v.return || v.return()
                                                    } finally {
                                                        if (p) throw y
                                                    }
                                                }
                                                r.push({
                                                    stem: c,
                                                    options: f
                                                })
                                            }
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
                                                    var u = i.value;
                                                    switch (u.stem) {
                                                        case "percent":
                                                        case "%":
                                                            t.style = "percent";
                                                            continue;
                                                        case "%x100":
                                                            t.style = "percent", t.scale = 100;
                                                            continue;
                                                        case "currency":
                                                            t.style = "currency", t.currency = u.options[0];
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
                                                            t.style = "unit", t.unit = u.options[0].replace(/^(.*?)-/, "");
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
                                                            t = Q(ee(Q({}, t), {
                                                                notation: "scientific"
                                                            }), u.options.reduce(function(e, t) {
                                                                return Q({}, e, es(t))
                                                            }, {}));
                                                            continue;
                                                        case "engineering":
                                                            t = Q(ee(Q({}, t), {
                                                                notation: "engineering"
                                                            }), u.options.reduce(function(e, t) {
                                                                return Q({}, e, es(t))
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
                                                            t.scale = parseFloat(u.options[0]);
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
                                                            if (u.options.length > 1) throw RangeError("integer-width stems only accept a single optional option");
                                                            u.options[0].replace(ei, function(e, r, n, o, i, a) {
                                                                if (r) t.minimumIntegerDigits = n.length;
                                                                else if (o && i) throw Error("We currently do not support maximum integer digits");
                                                                else if (a) throw Error("We currently do not support exact integer digits");
                                                                return ""
                                                            });
                                                            continue
                                                    }
                                                    if (ea.test(u.stem)) {
                                                        t.minimumIntegerDigits = u.stem.length;
                                                        continue
                                                    }
                                                    if (en.test(u.stem)) {
                                                        if (u.options.length > 1) throw RangeError("Fraction-precision stems only accept a single optional option");
                                                        u.stem.replace(en, function(e, r, n, o, i, a) {
                                                            return "*" === n ? t.minimumFractionDigits = r.length : o && "#" === o[0] ? t.maximumFractionDigits = o.length : i && a ? (t.minimumFractionDigits = i.length, t.maximumFractionDigits = i.length + a.length) : (t.minimumFractionDigits = r.length, t.maximumFractionDigits = r.length), ""
                                                        });
                                                        var l = u.options[0];
                                                        "w" === l ? t = ee(Q({}, t), {
                                                            trailingZeroDisplay: "stripIfInteger"
                                                        }) : l && (t = Q({}, t, eu(l)));
                                                        continue
                                                    }
                                                    if (eo.test(u.stem)) {
                                                        t = Q({}, t, eu(u.stem));
                                                        continue
                                                    }
                                                    var s = el(u.stem);
                                                    s && (t = Q({}, t, s));
                                                    var c = function(e) {
                                                        var t;
                                                        if ("E" === e[0] && "E" === e[1] ? (t = {
                                                                notation: "engineering"
                                                            }, e = e.slice(2)) : "E" === e[0] && (t = {
                                                                notation: "scientific"
                                                            }, e = e.slice(1)), t) {
                                                            var r = e.slice(0, 2);
                                                            if ("+!" === r ? (t.signDisplay = "always", e = e.slice(2)) : "+?" === r && (t.signDisplay = "exceptZero", e = e.slice(2)), !ea.test(e)) throw Error("Malformed concise eng/scientific notation");
                                                            t.minimumIntegerDigits = e.length
                                                        }
                                                        return t
                                                    }(u.stem);
                                                    c && (t = Q({}, t, c))
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
                                for (var o = !1, i = [], a = new Set, u = n.value, l = n.location;;) {
                                    if (0 === u.length) {
                                        var s, c = this.clonePosition();
                                        if ("select" !== t && this.bumpIf("=")) {
                                            var f = this.tryParseDecimalInteger(16, 19);
                                            if (f.err) return f;
                                            l = eO(c, this.clonePosition()), u = this.message.slice(c.offset, this.offset())
                                        } else break
                                    }
                                    if (a.has(u)) return this.error("select" === t ? 21 : 20, l);
                                    "other" === u && (o = !0), this.bumpSpace();
                                    var h = this.clonePosition();
                                    if (!this.bumpIf("{")) return this.error("select" === t ? 17 : 18, eO(this.clonePosition(), this.clonePosition()));
                                    var p = this.parseMessage(e + 1, t, r);
                                    if (p.err) return p;
                                    var y = this.tryParseArgumentClose(h);
                                    if (y.err) return y;
                                    i.push([u, {
                                        value: p.val,
                                        location: eO(h, this.clonePosition())
                                    }]), a.add(u), this.bumpSpace(), u = (s = this.parseIdentifierIfPossible()).value, l = s.location
                                }
                                return 0 === i.length ? this.error("select" === t ? 15 : 16, eO(this.clonePosition(), this.clonePosition())) : this.requiresOtherClause && !o ? this.error(22, eO(this.clonePosition(), this.clonePosition())) : {
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
                                var u = eO(n, this.clonePosition());
                                return o ? Number.isSafeInteger(i *= r) ? {
                                    val: i,
                                    err: null
                                } : this.error(t, u) : this.error(e, u)
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

            function eI(e) {
                return e >= 97 && e <= 122 || e >= 65 && e <= 90
            }

            function ek(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function eH(e, t, r) {
                return t = eL(t),
                    function(e, t) {
                        if (t && ("object" === eG(t) || "function" == typeof t)) return t;
                        if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                        return e
                    }(e, eZ() ? Reflect.construct(t, r || [], eL(e).constructor) : t.apply(e, r))
            }

            function ex(e, t) {
                if (!(e instanceof t)) throw TypeError("Cannot call a class as a function")
            }

            function eN(e, t, r) {
                return (eN = eZ() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && eF(o, r.prototype), o
                }).apply(null, arguments)
            }

            function eR(e, t) {
                for (var r = 0; r < t.length; r++) {
                    var n = t[r];
                    n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                }
            }

            function eC(e, t, r) {
                return t && eR(e.prototype, t), r && eR(e, r), e
            }

            function eM() {
                return (eM = Object.assign || function(e) {
                    for (var t = 1; t < arguments.length; t++) {
                        var r = arguments[t];
                        for (var n in r) Object.prototype.hasOwnProperty.call(r, n) && (e[n] = r[n])
                    }
                    return e
                }).apply(this, arguments)
            }

            function eL(e) {
                return (eL = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function eD(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Super expression must either be null or a function");
                e.prototype = Object.create(t && t.prototype, {
                    constructor: {
                        value: e,
                        writable: !0,
                        configurable: !0
                    }
                }), t && eF(e, t)
            }

            function eU(e) {
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

            function eF(e, t) {
                return (eF = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function ez(e) {
                return function(e) {
                    if (Array.isArray(e)) return ek(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return ek(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return ek(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function eG(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function eV(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (eV = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return eN(e, arguments, eL(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), eF(r, e)
                })(e)
            }

            function eZ() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (eZ = function() {
                    return !!e
                })()
            }
            var eK = function(e) {
                    function t(e, r, n) {
                        var o;
                        return ex(this, t), (o = eH(this, t, [e])).code = r, o.originalMessage = n, o
                    }
                    return eD(t, e), eC(t, [{
                        key: "toString",
                        value: function() {
                            return "[formatjs Error: ".concat(this.code, "] ").concat(this.message)
                        }
                    }]), t
                }(eV(Error)),
                e$ = function(e) {
                    function t(e, r, n, o) {
                        return ex(this, t), eH(this, t, ['Invalid values for "'.concat(e, '": "').concat(r, '". Options are "').concat(Object.keys(n).join('", "'), '"'), "INVALID_VALUE", o])
                    }
                    return eD(t, e), t
                }(eK),
                eX = function(e) {
                    function t(e, r, n) {
                        return ex(this, t), eH(this, t, ['Value for "'.concat(e, '" must be of type ').concat(r), "INVALID_VALUE", n])
                    }
                    return eD(t, e), t
                }(eK),
                eW = function(e) {
                    function t(e, r) {
                        return ex(this, t), eH(this, t, ['The intl string context variable "'.concat(e, '" was not provided to the string "').concat(r, '"'), "MISSING_VALUE", r])
                    }
                    return eD(t, e), t
                }(eK);

            function eY(e) {
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
            var eq = ((P = function() {
                function e(t) {
                    var r, n = this,
                        o = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : e.defaultLocale,
                        i = arguments.length > 2 ? arguments[2] : void 0,
                        a = arguments.length > 3 ? arguments[3] : void 0;
                    if (ex(this, e), this.formatterCache = {
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
                            return function e(t, r, n, o, i, a, u) {
                                if (1 === t.length && 0 === t[0].type) return [{
                                    type: 0,
                                    value: t[0].value
                                }];
                                var l = [],
                                    s = !0,
                                    c = !1,
                                    f = void 0;
                                try {
                                    for (var h, p = t[Symbol.iterator](); !(s = (h = p.next()).done); s = !0) {
                                        var y = h.value;
                                        if (0 === y.type) {
                                            l.push({
                                                type: 0,
                                                value: y.value
                                            });
                                            continue
                                        }
                                        if (7 === y.type) {
                                            "number" == typeof a && l.push({
                                                type: 0,
                                                value: n.getNumberFormat(r).format(a)
                                            });
                                            continue
                                        }
                                        var b = y.value;
                                        if (!(i && b in i)) throw new eW(b, u);
                                        var v = i[b];
                                        if (1 === y.type) {
                                            v && "string" != typeof v && "number" != typeof v && (void 0 === v ? "undefined" : eG(v)) !== "bigint" || (v = "string" == typeof v || "number" == typeof v || (void 0 === v ? "undefined" : eG(v)) === "bigint" ? String(v) : ""), l.push({
                                                type: +("string" != typeof v),
                                                value: v
                                            });
                                            continue
                                        }
                                        if (3 === y.type) {
                                            var d = "string" == typeof y.style ? o.date[y.style] : ev(y.style) ? y.style.parsedOptions : void 0;
                                            l.push({
                                                type: 0,
                                                value: n.getDateTimeFormat(r, d).format(v)
                                            });
                                            continue
                                        }
                                        if (4 === y.type) {
                                            var m = "string" == typeof y.style ? o.time[y.style] : ev(y.style) ? y.style.parsedOptions : o.time.medium;
                                            l.push({
                                                type: 0,
                                                value: n.getDateTimeFormat(r, m).format(v)
                                            });
                                            continue
                                        }
                                        if (2 === y.type) {
                                            var g = "string" == typeof y.style ? o.number[y.style] : eb(y.style) ? y.style.parsedOptions : void 0;
                                            if (g && g.scale) {
                                                var w = g.scale || 1;
                                                if ((void 0 === v ? "undefined" : eG(v)) === "bigint") {
                                                    if (!Number.isInteger(w)) throw TypeError("Cannot apply fractional scale ".concat(w, " to bigint value. Scale must be an integer when formatting bigint."));
                                                    v *= BigInt(w)
                                                } else v *= w
                                            }
                                            l.push({
                                                type: 0,
                                                value: n.getNumberFormat(r, g).format(v)
                                            });
                                            continue
                                        }
                                        if (8 === y.type) {
                                            var O = y.children,
                                                E = y.value,
                                                S = i[E];
                                            if ("function" != typeof S) throw new eX(E, "function", u);
                                            var P = S(e(O, r, n, o, i, a).map(function(e) {
                                                return e.value
                                            }));
                                            Array.isArray(P) || (P = [P]), l.push.apply(l, ez(P.map(function(e) {
                                                return {
                                                    type: +("string" != typeof e),
                                                    value: e
                                                }
                                            })))
                                        }
                                        if (5 === y.type) {
                                            var A = v,
                                                j = (Object.prototype.hasOwnProperty.call(y.options, A) ? y.options[A] : void 0) || y.options.other;
                                            if (!j) throw new e$(y.value, v, Object.keys(y.options), u);
                                            l.push.apply(l, ez(e(j.value, r, n, o, i)));
                                            continue
                                        }
                                        if (6 === y.type) {
                                            var B = "=".concat(v),
                                                _ = Object.prototype.hasOwnProperty.call(y.options, B) ? y.options[B] : void 0;
                                            if (!_) {
                                                if (!Intl.PluralRules) throw new eK('Intl.PluralRules is not available in this environment.\nTry polyfilling it using "@formatjs/intl-pluralrules"\n', "MISSING_INTL_API", u);
                                                var T = (void 0 === v ? "undefined" : eG(v)) === "bigint" ? Number(v) : v,
                                                    I = n.getPluralRules(r, {
                                                        type: y.pluralType
                                                    }).select(T - (y.offset || 0));
                                                _ = (Object.prototype.hasOwnProperty.call(y.options, I) ? y.options[I] : void 0) || y.options.other
                                            }
                                            if (!_) throw new e$(y.value, v, Object.keys(y.options), u);
                                            var k = (void 0 === v ? "undefined" : eG(v)) === "bigint" ? Number(v) : v;
                                            l.push.apply(l, ez(e(_.value, r, n, o, i, k - (y.offset || 0))));
                                            continue
                                        }
                                    }
                                } catch (e) {
                                    c = !0, f = e
                                } finally {
                                    try {
                                        s || null == p.return || p.return()
                                    } finally {
                                        if (c) throw f
                                    }
                                }
                                return l.length < 2 ? l : l.reduce(function(e, t) {
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
                        var u, l, s = a || {},
                            c = (function(e) {
                                if (null == e) throw TypeError("Cannot destructure " + e)
                            }(s), eM({}, s));
                        this.ast = e.__parse(t, (u = eU({}, c), l = l = {
                            locale: this.resolvedLocale
                        }, Object.getOwnPropertyDescriptors ? Object.defineProperties(u, Object.getOwnPropertyDescriptors(l)) : (function(e) {
                            var t = Object.keys(e);
                            if (Object.getOwnPropertySymbols) {
                                var r = Object.getOwnPropertySymbols(e);
                                t.push.apply(t, r)
                            }
                            return t
                        })(Object(l)).forEach(function(e) {
                            Object.defineProperty(u, e, Object.getOwnPropertyDescriptor(l, e))
                        }), u))
                    } else this.ast = t;
                    if (!Array.isArray(this.ast)) throw TypeError("A message must be provided as a String or AST.");
                    this.formats = (r = e.formats, i ? Object.keys(r).reduce(function(e, t) {
                        var n, o;
                        return e[t] = (n = r[t], (o = i[t]) ? eU({}, n, o, Object.keys(n).reduce(function(e, t) {
                            return e[t] = eU({}, n[t], o[t]), e
                        }, {})) : n), e
                    }, eU({}, r)) : r), this.formatters = a && a.formatters || function() {
                        var e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {
                            number: {},
                            dateTime: {},
                            pluralRules: {}
                        };
                        return {
                            getNumberFormat: R(function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                return eN(Intl.NumberFormat, ez(t))
                            }, {
                                cache: eY(e.number),
                                strategy: F.variadic
                            }),
                            getDateTimeFormat: R(function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                return eN(Intl.DateTimeFormat, ez(t))
                            }, {
                                cache: eY(e.dateTime),
                                strategy: F.variadic
                            }),
                            getPluralRules: R(function() {
                                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                return eN(Intl.PluralRules, ez(t))
                            }, {
                                cache: eY(e.pluralRules),
                                strategy: F.variadic
                            })
                        }
                    }(this.formatterCache)
                }
                return eC(e, null, [{
                    key: "defaultLocale",
                    get: function() {
                        return e.memoizedDefaultLocale || (e.memoizedDefaultLocale = new Intl.NumberFormat().resolvedOptions().locale), e.memoizedDefaultLocale
                    }
                }]), e
            }()).memoizedDefaultLocale = null, P.resolveLocale = function(e) {
                if (void 0 !== Intl.Locale) {
                    var t = Intl.NumberFormat.supportedLocalesOf(e);
                    return new Intl.Locale(t.length > 0 ? t[0] : "string" == typeof e ? e : e[0])
                }
            }, P.__parse = function(e) {
                var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    r = new eT(e, t = ef({
                        shouldParseSkeletons: !0,
                        requiresOtherClause: !0
                    }, t)).parse();
                if (r.err) {
                    var n = SyntaxError(ey[r.err.kind]);
                    throw n.location = r.err.location, n.originalMessage = r.err.message, n
                }
                return (null == t ? void 0 : t.captureLocation) || function e(t) {
                    t.forEach(function(t) {
                        if (delete t.location, 5 === t.type || 6 === t.type)
                            for (var r in t.options) delete t.options[r].location, e(t.options[r].value);
                        else 2 === t.type && eb(t.style) || (3 === t.type || 4 === t.type) && ev(t.style) ? delete t.style.location : 8 === t.type && e(t.children)
                    })
                }(r.val), r.val
            }, P.formats = {
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
            }, P);

            function eJ(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function eQ(e) {
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

            function e0(e, t) {
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

            function e1(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            u = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            u = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (u) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return eJ(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return eJ(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function e2() {
                for (var e, t, r, n, o, i = arguments.length, a = Array(i), u = 0; u < i; u++) a[u] = arguments[u];
                var l = e1(a, 4),
                    s = (l[0], l[1]),
                    c = l[2],
                    f = l[3];
                if (Array.isArray(s)) throw new X(W.INVALID_MESSAGE, void 0);
                if ("object" == (void 0 === s ? "undefined" : s && "u" > typeof Symbol && s.constructor === Symbol ? "symbol" : typeof s)) throw new X(W.INSUFFICIENT_PATH, void 0);
                if ("string" == typeof s) {
                    var h = c || /'[{}<#|']/.test(s) ? void 0 : s;
                    if (h) return h
                }
                var p = f.cache,
                    y = f.formats,
                    b = f.formatters,
                    v = f.globalFormats,
                    d = f.locale,
                    m = f.timeZone;
                b.getMessageFormat || (b.getMessageFormat = Y(function() {
                    for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                    return new eq(t[0], t[1], t[2], eQ({
                        formatters: b
                    }, t[3]))
                }, p.message));
                try {
                    o = b.getMessageFormat(s, d, (e = eq.formats.date, t = eq.formats.time, r = eQ({}, null == v ? void 0 : v.dateTime, null == y ? void 0 : y.dateTime), n = {
                        date: eQ({}, e, r),
                        time: eQ({}, t, r),
                        number: eQ({}, null == v ? void 0 : v.number, null == y ? void 0 : y.number)
                    }, m && ["date", "time"].forEach(function(e) {
                        var t = n[e],
                            r = !0,
                            o = !1,
                            i = void 0;
                        try {
                            for (var a, u = Object.entries(t)[Symbol.iterator](); !(r = (a = u.next()).done); r = !0) {
                                var l = e1(a.value, 2),
                                    s = l[0],
                                    c = l[1];
                                t[s] = eQ({
                                    timeZone: m
                                }, c)
                            }
                        } catch (e) {
                            o = !0, i = e
                        } finally {
                            try {
                                r || null == u.return || u.return()
                            } finally {
                                if (o) throw i
                            }
                        }
                    }), n), {
                        formatters: e0(eQ({}, b), {
                            getDateTimeFormat: function(e, t) {
                                var r;
                                return b.getDateTimeFormat(e, e0(eQ({}, t), {
                                    timeZone: null != (r = null == t ? void 0 : t.timeZone) ? r : m
                                }))
                            }
                        })
                    })
                } catch (e) {
                    throw new X(W.INVALID_MESSAGE, void 0)
                }
                var g = o.format(c);
                return (0, x.isValidElement)(g) || Array.isArray(g) || "string" == typeof g ? g : String(g)
            }

            function e5(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function e3(e) {
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

            function e6(e, t) {
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

            function e8() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                return t.filter(Boolean).join(".")
            }

            function e4(e) {
                return e8(e.namespace, e.key)
            }

            function e7(e) {
                console.error(e)
            }

            function e9(e, t, r, n) {
                var o = e8(n, r);
                if (!t) throw Error(o);
                var i = t;
                return r.split(".").forEach(function(t) {
                    var r = i[t];
                    if (null == t || null == r) throw Error(o + " (".concat(e, ")"));
                    i = r
                }), i
            }
            e2.raw = !0;
            var te = (0, x.createContext)(void 0);

            function tt(e) {
                var t = e.children,
                    r = e.formats,
                    n = e.getMessageFallback,
                    o = e.locale,
                    i = e.messages,
                    a = e.now,
                    u = e.onError,
                    l = e.timeZone,
                    s = (0, x.useContext)(te),
                    c = (0, x.useMemo)(function() {
                        return (null == s ? void 0 : s.cache) || {
                            dateTime: {},
                            number: {},
                            message: {},
                            relativeTime: {},
                            pluralRules: {},
                            list: {},
                            displayNames: {}
                        }
                    }, [o, null == s ? void 0 : s.cache]),
                    f = (0, x.useMemo)(function() {
                        return (null == s ? void 0 : s.formatters) || {
                            getDateTimeFormat: q(Intl.DateTimeFormat, c.dateTime),
                            getNumberFormat: q(Intl.NumberFormat, c.number),
                            getPluralRules: q(Intl.PluralRules, c.pluralRules),
                            getRelativeTimeFormat: q(Intl.RelativeTimeFormat, c.relativeTime),
                            getListFormat: q(Intl.ListFormat, c.list),
                            getDisplayNames: q(Intl.DisplayNames, c.displayNames)
                        }
                    }, [c, null == s ? void 0 : s.formatters]),
                    h = (0, x.useMemo)(function() {
                        var e, t, h, p, y, b, v;
                        return b = function(e) {
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
                            formats: void 0 === r ? null == s ? void 0 : s.formats : r,
                            getMessageFallback: n || (null == s ? void 0 : s.getMessageFallback),
                            messages: void 0 === i ? null == s ? void 0 : s.messages : i,
                            now: a || (null == s ? void 0 : s.now),
                            onError: u || (null == s ? void 0 : s.onError),
                            timeZone: l || (null == s ? void 0 : s.timeZone)
                        }).formats, h = e.getMessageFallback, p = e.messages, y = e.onError, e6(e3({}, function(e, t) {
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
                            messages: p || void 0,
                            onError: y || e7,
                            getMessageFallback: h || e4
                        }))), v = v = {
                            formatters: f,
                            cache: c
                        }, Object.getOwnPropertyDescriptors ? Object.defineProperties(b, Object.getOwnPropertyDescriptors(v)) : (function(e) {
                            var t = Object.keys(e);
                            if (Object.getOwnPropertySymbols) {
                                var r = Object.getOwnPropertySymbols(e);
                                t.push.apply(t, r)
                            }
                            return t
                        })(Object(v)).forEach(function(e) {
                            Object.defineProperty(b, e, Object.getOwnPropertyDescriptor(v, e))
                        }), b
                    }, [c, r, f, n, o, i, a, u, s, l]);
                return (0, B.jsx)(te.Provider, {
                    value: h,
                    children: t
                })
            }

            function tr() {
                var e = (0, x.useContext)(te);
                if (!e) throw Error(void 0);
                return e
            }
            var tn = !1,
                to = "u" < typeof window,
                ti = window.Roblox["core-lib"].index;

            function ta(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tu(e) {
                return function(e) {
                    if (Array.isArray(e)) return ta(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return ta(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return ta(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            tu(["ar-001", "de-de", "en-us", "es-es", "fr-fr", "hi-in", "id-id", "it-it", "ja-jp", "ko-kr", "pl-pl", "pt-br", "th-th", "tr-tr", "vi-vn", "zh-cn", "zh-tw"]).concat(tu(["bg-bg", "bn-bd", "bs-ba", "cs-cz", "da-dk", "el-gr", "en-gb", "es-mx", "et-ee", "fi-fi", "fil-ph", "fr-ca", "hr-hr", "hu-hu", "ka-ge", "kk-kz", "km-kh", "lt-lt", "lv-lv", "ms-my", "my-mm", "nb-no", "nl-nl", "pt-pt", "ro-ro", "ru-ru", "si-lk", "sk-sk", "sl-sl", "sq-al", "sr-rs", "sv-se", "uk-ua"]));
            var tl = tu(["ar_001", "de_de", "en_us", "es_es", "fr_fr", "hi_in", "id_id", "it_it", "ja_jp", "ko_kr", "pl_pl", "pt_br", "th_th", "tr_tr", "vi_vn", "zh_cn", "zh_tw"]).concat(tu(["bg_bg", "bn_bd", "bs_ba", "cs_cz", "da_dk", "el_gr", "en_gb", "es_mx", "et_ee", "fi_fi", "fil_ph", "fr_ca", "hr_hr", "hu_hu", "ka_ge", "kk_kz", "km_kh", "lt_lt", "lv_lv", "ms_my", "my_mm", "nb_no", "nl_nl", "pt_pt", "ro_ro", "ru_ru", "si_lk", "sk_sk", "sl_sl", "sq_al", "sr_rs", "sv_se", "uk_ua"])),
                ts = tu(["ar-001", "de-DE", "en-US", "es-ES", "fr-FR", "hi-IN", "id-ID", "it-IT", "ja-JP", "ko-KR", "pl-PL", "pt-BR", "th-TH", "tr-TR", "vi-VN", "zh-CN", "zh-TW"]).concat(tu(["bg-BG", "bn-BD", "bs-BA", "cs-CZ", "da-DK", "el-GR", "en-GB", "es-MX", "et-EE", "fi-FI", "fil-PH", "fr-CA", "hr-HR", "hu-HU", "ka-GE", "kk-KZ", "km-KH", "lt-LT", "lv-LV", "ms-MY", "my-MM", "nb-NO", "nl-NL", "pt-PT", "ro-RO", "ru-RU", "si-LK", "sk-SK", "sl-SL", "sq-AL", "sr-RS", "sv-SE", "uk-UA"]));
            tu(["ar", "de", "es", "fr", "hi", "id", "it", "ja", "ko", "pl", "pt", "th", "tr", "vi"]).concat(tu(["ar-001", "de-de", "es-es", "fr-fr", "hi-in", "id-id", "it-it", "ja-jp", "ko-kr", "pl-pl", "pt-br", "th-th", "tr-tr", "vi-vn"]));
            var tc = function(e) {
                return e.replaceAll(".", ":")
            };

            function tf(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var th = function() {
                    if ("u" < typeof window) return {};
                    var e = window.Roblox;
                    return null != e ? e : {}
                },
                tp = function(e) {
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
                                    if ("string" == typeof e) return tf(e, 2);
                                    var t = Object.prototype.toString.call(e).slice(8, -1);
                                    if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                    if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tf(e, 2)
                                }
                            }(e) || function() {
                                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }(),
                            r = t[0],
                            n = t[1];
                        return null == n ? [] : [
                            [tc(r), n]
                        ]
                    }))
                },
                ty = function(e) {
                    var t = th(),
                        r = t.Lang,
                        n = t.LangDynamic,
                        o = t.LangDynamicDefault;
                    return Object.fromEntries(e.map(function(e) {
                        return [tc(e), function(e) {
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
                        }({}, tp(null == o ? void 0 : o[e]), tp(null == r ? void 0 : r[e]), tp(null == n ? void 0 : n[e]))]
                    }))
                },
                tb = function(e) {
                    var t, r, n = e.namespaces,
                        o = e.locale,
                        i = e.children,
                        a = n.join(","),
                        u = (0, x.useMemo)(function() {
                            return ty(n)
                        }, [a]);
                    return (0, B.jsx)(tt, {
                        locale: null != o ? o : null != (t = null != (r = function() {
                            if (!("u" < typeof document)) {
                                var e = document.documentElement.lang;
                                if (e) return (0, ti.arrayIncludes)(ts, e) ? e.toLowerCase() : void 0
                            }
                        }()) ? r : function() {
                            if ("u" < typeof document) return;
                            var e, t = document.querySelector('meta[name="locale-data"]');
                            if (null != (e = HTMLMetaElement) && "u" > typeof Symbol && e[Symbol.hasInstance] ? e[Symbol.hasInstance](t) : t instanceof e) {
                                var r = t.dataset.languageCode;
                                if (r && (0, ti.arrayIncludes)(tl, r)) return r.replace("_", "-")
                            }
                        }()) ? t : "en-us",
                        messages: u,
                        children: i
                    })
                },
                tv = window.Roblox["core-scripts"].meta.user;

            function td(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var tm = "__FN_nvfToKPAOuiV__",
                tg = new RegExp("".concat(tm, "(\\d+)\\|")),
                tw = function(e, t, r) {
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
                            i = "".concat(tm).concat(r, "|"),
                            a = "".concat("__FN_END_nvfToKPAOuiV__").concat(r, "|");
                        n[e.opening] = i, n[e.closing] = a, o[r] = {
                            start: i,
                            end: a,
                            render: e.render,
                            used: !1
                        }
                    });
                    var i = function(e) {
                            var t = [],
                                r = tg.exec(e);
                            if (!r) return [e];
                            r.index > 0 && t.push(e.slice(0, r.index));
                            var n = null == r[1] ? void 0 : o[r[1]];
                            if (null == n) return null;
                            n.used = !0;
                            var a = e.indexOf(n.end);
                            if (a < r.index + r[0].length) return null;
                            var u = i(e.slice(r.index + r[0].length, a));
                            if (null == u) return null;
                            t.push(n.render(u));
                            var l = e.slice(a + n.end.length);
                            if (l.length > 0) {
                                var s = i(l);
                                if (null == s) return null;
                                t.push.apply(t, function(e) {
                                    if (Array.isArray(e)) return td(e)
                                }(s) || function(e) {
                                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                                }(s) || function(e) {
                                    if (e) {
                                        if ("string" == typeof e) return td(e, void 0);
                                        var t = Object.prototype.toString.call(e).slice(8, -1);
                                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return td(e, void 0)
                                    }
                                }(s) || function() {
                                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                }())
                            }
                            return t
                        },
                        a = i(e(n));
                    return null == a || Object.values(o).some(function(e) {
                        return !e.used
                    }) ? null : a.filter(function(e) {
                        return "" !== e
                    }).map(function(e, t) {
                        return (0, B.jsx)(x.Fragment, {
                            children: e
                        }, t)
                    })
                };

            function tO(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tE(e) {
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

            function tS(e, t) {
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

            function tP(e, t) {
                return function(e) {
                    if (Array.isArray(e)) return e
                }(e) || function(e, t) {
                    var r, n, o = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                    if (null != o) {
                        var i = [],
                            a = !0,
                            u = !1;
                        try {
                            for (o = o.call(e); !(a = (r = o.next()).done) && (i.push(r.value), !t || i.length !== t); a = !0);
                        } catch (e) {
                            u = !0, n = e
                        } finally {
                            try {
                                a || null == o.return || o.return()
                            } finally {
                                if (u) throw n
                            }
                        }
                        return i
                    }
                }(e, t) || function(e, t) {
                    if (e) {
                        if ("string" == typeof e) return tO(e, t);
                        var r = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                        if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return tO(e, t)
                    }
                }(e, t) || function() {
                    throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }
            var tA = window.Roblox["core-scripts"].environmentUrls,
                tj = r.n(tA);

            function tB(e, t, r, n, o, i, a) {
                try {
                    var u = e[i](a),
                        l = u.value
                } catch (e) {
                    r(e);
                    return
                }
                u.done ? t(l) : Promise.resolve(l).then(n, o)
            }

            function t_() {
                return null != A || (A = "".concat(tj().apiGatewayUrl.replace(/\/$/, ""), "/experience-signals-ingest/public")), A
            }
            var tT = function() {};

            function tI(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function tk(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            var tH = function(e, t) {
                    return e << 3 | t
                },
                tx = tH(1, 2),
                tN = tH(2, 2),
                tR = tH(5, 2),
                tC = tH(6, 2),
                tM = tH(8, 2),
                tL = tH(1, 2),
                tD = tH(2, 1),
                tU = tH(3, 0),
                tF = tH(5, 2);
            tH(1, 2), tH(2, 1), tH(3, 0), tH(4, 2), tH(5, 2), tH(6, 0), tH(8, 2);
            var tz = tH(4, 0),
                tG = tH(6, 2),
                tV = tH(7, 2);
            tH(1, 0), tH(2, 2);
            var tZ = tH(1, 2),
                tK = tH(2, 2),
                t$ = tH(1, 2);
            tH(1, 2), tH(2, 2), tH(1, 2);
            var tX = new TextEncoder,
                tW = function() {
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
                                var t = (void 0 === e ? "undefined" : tk(e)) === "bigint" ? e : BigInt(Math.trunc(e));
                                for (t < BigInt(0) && (t += BigInt(1) << BigInt(64)); t > BigInt(127);) this.buf.push(128 | Number(t & BigInt(127))), t >>= BigInt(7);
                                this.buf.push(Number(t))
                            }
                        }, {
                            key: "writeString",
                            value: function(e) {
                                var t = tX.encode(e);
                                this.writeVarint(t.length);
                                var r = !0,
                                    n = !1,
                                    o = void 0;
                                try {
                                    for (var i, a = t[Symbol.iterator](); !(r = (i = a.next()).done); r = !0) {
                                        var u = i.value;
                                        this.buf.push(u)
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

            function tY(e, t, r) {
                var n = new tW;
                return n.writeVarint(tH(1, 2)), n.writeString(e), n.writeVarint(t), r(n), n.toBytes()
            }

            function tq(e) {
                var t = new tW;
                if (t.writeVarint(tL), t.writeString(e.name), t.writeVarint(tD), t.writeDouble(e.value), t.writeVarint(tU), t.writeVarint(e.timestampMs), e.attributes && Object.keys(e.attributes).length > 0) {
                    var r = function(e) {
                        var t = new tW,
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
                                            if ("string" == typeof e) return tI(e, 2);
                                            var t = Object.prototype.toString.call(e).slice(8, -1);
                                            if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                            if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return tI(e, 2)
                                        }
                                    }(e) || function() {
                                        throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                                    }()),
                                    n = r[0],
                                    o = r[1];
                                if ("string" == typeof o) {
                                    var a = tY(n, tH(2, 2), function(e) {
                                        e.writeString(o)
                                    });
                                    t.writeVarint(tR), t.writeBytes(a)
                                } else if ("boolean" == typeof o) {
                                    var u = tY(n, tH(2, 0), function(e) {
                                        e.writeVarint(+!!o)
                                    });
                                    t.writeVarint(tC), t.writeBytes(u)
                                } else if ((void 0 === o ? "undefined" : tk(o)) === "bigint") {
                                    var l = tY(n, tH(2, 0), function(e) {
                                        e.writeVarint(o)
                                    });
                                    t.writeVarint(tN), t.writeBytes(l)
                                } else if ("number" == typeof o)
                                    if (Number.isFinite(o))
                                        if (Number.isInteger(o) && o >= -0x80000000 && o <= 0x7fffffff) {
                                            var s = tY(n, tH(2, 0), function(e) {
                                                e.writeVarint(o)
                                            });
                                            t.writeVarint(tx), t.writeBytes(s)
                                        } else if (Number.isInteger(o)) {
                                    var c = tY(n, tH(2, 0), function(e) {
                                        e.writeVarint(BigInt(o))
                                    });
                                    t.writeVarint(tN), t.writeBytes(c)
                                } else {
                                    var f = tY(n, tH(2, 1), function(e) {
                                        e.writeDouble(o)
                                    });
                                    t.writeVarint(tM), t.writeBytes(f)
                                } else {
                                    var h = tY(n, tH(2, 2), function(e) {
                                        e.writeString(String(o))
                                    });
                                    t.writeVarint(tR), t.writeBytes(h)
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
                    t.writeVarint(tF), t.writeBytes(r)
                }
                return t.toBytes()
            }

            function tJ(e, t, r) {
                var n = new tW;
                n.writeVarint(tz), n.writeVarint(r);
                var o = !0,
                    i = !1,
                    a = void 0;
                try {
                    for (var u, l = e[Symbol.iterator](); !(o = (u = l.next()).done); o = !0) {
                        var s = u.value;
                        n.writeVarint(tG), n.writeBytes(s)
                    }
                } catch (e) {
                    i = !0, a = e
                } finally {
                    try {
                        o || null == l.return || l.return()
                    } finally {
                        if (i) throw a
                    }
                }
                var c = !0,
                    f = !1,
                    h = void 0;
                try {
                    for (var p, y = t[Symbol.iterator](); !(c = (p = y.next()).done); c = !0) {
                        var b = p.value;
                        n.writeVarint(tV), n.writeBytes(b)
                    }
                } catch (e) {
                    f = !0, h = e
                } finally {
                    try {
                        c || null == y.return || y.return()
                    } finally {
                        if (f) throw h
                    }
                }
                return n.toBytes()
            }

            function tQ(e) {
                var t = new tW;
                t.writeVarint(tZ), t.writeString("eventstream.enginetelemetry.EngineTelemetryBatchEvent"), t.writeVarint(tK), t.writeBytes(e);
                var r = t.toBytes(),
                    n = new tW;
                return n.writeVarint(t$), n.writeBytes(r), n.toBytes()
            }
            var t0 = /^[a-zA-Z_][a-zA-Z0-9_]*$/;

            function t1(e) {
                return t0.test(e)
            }
            var t2 = [],
                t5 = !1,
                t3 = !1;

            function t6(e, t) {
                var r, n, o, i = e.map(function(e) {
                        return {
                            name: e.name,
                            value: e.value,
                            timestampMs: e.timestampMs,
                            attributes: e.attributes
                        }
                    }),
                    a = BigInt(Date.now());
                !0 === t || t3 || "u" > typeof document && "hidden" === document.visibilityState ? (r = tQ(tJ(i.map(tq), [], a)).buffer, fetch("".concat(t_()).concat("/v1/events/single"), {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/x-protobuf"
                    },
                    body: r,
                    credentials: "include",
                    keepalive: !0
                }).catch(tT)) : (n = tQ(tJ(i.map(tq), [], a)), (o = function() {
                    var e, t, r, o, i, a, u, l, s, c, f, h, p;
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
                            u = Object.defineProperty;
                        return u(a, "next", {
                            value: l(0)
                        }), u(a, "throw", {
                            value: l(1)
                        }), u(a, "return", {
                            value: l(2)
                        }), "function" == typeof Symbol && u(a, Symbol.iterator, {
                            value: function() {
                                return this
                            }
                        }), a;

                        function l(u) {
                            return function(l) {
                                var s = [u, l];
                                if (r) throw TypeError("Generator is already executing.");
                                for (; a && (a = 0, s[0] && (i = 0)), i;) try {
                                    if (r = 1, n && (o = 2 & s[0] ? n.return : s[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, s[1])).done) return o;
                                    switch (n = 0, o && (s = [2 & s[0], o.value]), s[0]) {
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
                                            i.label++, n = s[1], s = [0];
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
                                    s = [6, e], n = 0
                                } finally {
                                    r = o = 0
                                }
                                if (5 & s[0]) throw s[1];
                                return {
                                    value: s[0] ? s[1] : void 0,
                                    done: !0
                                }
                            }
                        }
                    }(this, function(y) {
                        switch (y.label) {
                            case 0:
                                if ("u" < typeof CompressionStream) return [2, {
                                    body: n.buffer,
                                    compressed: !1
                                }];
                                return (t = (e = new CompressionStream("gzip")).writable.getWriter()).write(n).catch(tT), t.close().catch(tT), r = [], [4, (o = e.readable.getReader()).read()];
                            case 1:
                                i = y.sent(), y.label = 2;
                            case 2:
                                if (i.done) return [3, 4];
                                return r.push(i.value), [4, o.read()];
                            case 3:
                                return i = y.sent(), [3, 2];
                            case 4:
                                a = new Uint8Array(r.reduce(function(e, t) {
                                    return e + t.length
                                }, 0)), u = 0, l = !0, s = !1, c = void 0;
                                try {
                                    for (f = r[Symbol.iterator](); !(l = (h = f.next()).done); l = !0) p = h.value, a.set(p, u), u += p.length
                                } catch (e) {
                                    s = !0, c = e
                                } finally {
                                    try {
                                        l || null == f.return || f.return()
                                    } finally {
                                        if (s) throw c
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
                            tB(i, r, n, a, u, "next", e)
                        }

                        function u(e) {
                            tB(i, r, n, a, u, "throw", e)
                        }
                        a(void 0)
                    })
                })()).then(function(e) {
                    var t = e.body,
                        r = e.compressed,
                        n = {
                            "Content-Type": "application/x-protobuf"
                        };
                    return r && (n["Content-Encoding"] = "gzip"), fetch("".concat(t_()).concat("/v1/events/single"), {
                        method: "POST",
                        headers: n,
                        body: t,
                        credentials: "include",
                        keepalive: !0
                    })
                }).catch(tT)
            }

            function t8() {
                var e = !0,
                    t = !1,
                    r = void 0;
                try {
                    for (var n, o = t2[Symbol.iterator](); !(e = (n = o.next()).done); e = !0) {
                        var i = n.value.splice(0);
                        0 !== i.length && t6(i, !0)
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
            var t4 = "WwwCommon",
                t7 = function(e) {
                    var t = e.publish,
                        r = e.captureException,
                        n = e.featureName;

                    function o(e, t, o) {
                        if (null != o) {
                            var i, a = (null != (i = Error) && "u" > typeof Symbol && i[Symbol.hasInstance] ? !!i[Symbol.hasInstance](o) : o instanceof i) ? o.name || "Error" : "UnknownError",
                                u = n ? "".concat(n, "_").concat(e) : e;
                            return null == r || r(o, {
                                error_counter: u
                            }), tS(tE({}, t), {
                                errorType: a
                            })
                        }
                        return t
                    }
                    return {
                        trackCounter: function() {
                            for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                            var o = tP(r, 2);
                            t(o[0], o[1])
                        },
                        trackError: function() {
                            for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                            var i = tP(r, 3),
                                a = i[0],
                                u = i[1],
                                l = i[2],
                                s = o(a, tS(tE({}, null != u ? u : {}), {
                                    severity: "error"
                                }), l);
                            t(a, s)
                        },
                        trackCriticalError: function() {
                            for (var e = arguments.length, r = Array(e), n = 0; n < e; n++) r[n] = arguments[n];
                            var i = tP(r, 3),
                                a = i[0],
                                u = i[1],
                                l = i[2],
                                s = o(a, tS(tE({}, null != u ? u : {}), {
                                    severity: "critical"
                                }), l);
                            t(a, s)
                        }
                    }
                }({
                    publish: function(e) {
                        var t, r = Math.max(1, 10),
                            n = 250;

                        function o(e, t) {
                            console.error(e, t)
                        }
                        if (!t1(e)) return o('@rbx/web-telemetry: invalid featureName "'.concat(e, '"'), {
                                name: e
                            }),
                            function() {};
                        var i = [];
                        return t2.push(i), t5 || ("u" > typeof document && document.addEventListener("visibilitychange", function() {
                                "hidden" === document.visibilityState && t8()
                            }), "u" > typeof window && window.addEventListener("beforeunload", function() {
                                t3 = !0, t8()
                            }), t5 = !0),
                            function(a, u, l) {
                                var s = "".concat(e, "_").concat(a);
                                if (! function(e, t) {
                                        if (!t1(e)) return !1;
                                        if (t) {
                                            var r = !0,
                                                n = !1,
                                                o = void 0;
                                            try {
                                                for (var i, a = Object.keys(t)[Symbol.iterator](); !(r = (i = a.next()).done); r = !0) {
                                                    var u = i.value;
                                                    if (!t1(u)) return !1
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
                                    }(s, u)) return void o("@rbx/web-telemetry: invalid event name or attribute key", {
                                    name: a,
                                    attributes: u
                                });
                                var c = null != l ? l : 1;
                                if (!Number.isFinite(c)) return void o("@rbx/web-telemetry: value must be a finite number", {
                                    name: a,
                                    attributes: u
                                });
                                var f = u && Object.keys(u).length > 0 ? u : void 0;
                                i.push({
                                    name: s,
                                    attributes: f,
                                    value: c,
                                    timestampMs: BigInt(Date.now())
                                }), i.length >= r ? (void 0 !== t && (clearTimeout(t), t = void 0), t6(i.splice(0, r))) : void 0 === t && (t = setTimeout(function() {
                                    for (t = void 0; i.length > 0;) t6(i.splice(0, r))
                                }, n))
                            }
                    }(t4)
                });
            t7.trackCounter;
            var t9 = t7.trackError;
            t7.trackCriticalError;
            var re = function() {
                    if ("u" > typeof document) {
                        var e = document.querySelector('meta[name="page-meta"]');
                        return null == e ? void 0 : e.dataset.internalPageName
                    }
                },
                rt = function(e, t, r) {
                    var n;
                    "u" > typeof window && t9(e, {
                        key: r,
                        namespace: t,
                        internalPageName: null != (n = re()) ? n : "unknown"
                    })
                },
                rr = function(e) {
                    var t, r, n, o, i, a, u, l, s, c, f, h, p, y = (t = tc(e), r = {
                        "!": tr().messages
                    }, n = t ? "!.".concat(t) : "!", i = (o = tr()).cache, a = o.formats, u = o.formatters, l = o.getMessageFallback, s = o.locale, c = o.onError, f = o.timeZone, h = r["!"], p = "!" === n ? void 0 : n.slice(2), f || tn || !to || (tn = !0, c(new X(W.ENVIRONMENT_FALLBACK, void 0))), (0, x.useMemo)(function() {
                        var e, t;
                        return t = function(e, t, r) {
                                try {
                                    if (!t) throw Error(void 0);
                                    var n = r ? e9(e, t, r) : t;
                                    if (!n) throw Error(r);
                                    return n
                                } catch (e) {
                                    return new X(W.MISSING_MESSAGE, e.message)
                                }
                            }((e = {
                                cache: i,
                                formatters: u,
                                getMessageFallback: l,
                                messages: h,
                                namespace: p,
                                onError: c,
                                formats: a,
                                locale: s,
                                timeZone: f
                            }).locale, e.messages, e.namespace),
                            function(e) {
                                var t = e.cache,
                                    r = e.formats,
                                    n = e.formatters,
                                    o = e.getMessageFallback,
                                    i = void 0 === o ? e4 : o,
                                    a = e.locale,
                                    u = e.messagesOrError,
                                    l = e.namespace,
                                    s = e.onError,
                                    c = e.timeZone,
                                    f = e5(u, X);

                                function h(e, t, r, n) {
                                    var o = new X(t, r);
                                    return s(o), null != n ? n : i({
                                        error: o,
                                        key: e,
                                        namespace: l
                                    })
                                }

                                function p(e, o, p, y) {
                                    var b, v, d;
                                    if (f) {
                                        if (!y) return s(u), i({
                                            error: u,
                                            key: e,
                                            namespace: l
                                        });
                                        b = y
                                    } else try {
                                        b = e9(a, u, e, l)
                                    } catch (t) {
                                        if (!y) return h(e, W.MISSING_MESSAGE, t.message, y);
                                        b = y
                                    }
                                    try {
                                        var m, g = e8(l, e);
                                        return e2(g, b, o ? (m = {}, Object.keys(o).forEach(function(e) {
                                            var t, r = 0,
                                                n = o[e];
                                            t = "function" == typeof n ? function(t) {
                                                var o = n(t);
                                                return (0, x.isValidElement)(o) ? (0, x.cloneElement)(o, {
                                                    key: e + r++
                                                }) : o
                                            } : n, m[e] = t
                                        }), m) : o, {
                                            cache: t,
                                            formatters: n,
                                            globalFormats: r,
                                            formats: p,
                                            locale: a,
                                            timeZone: c
                                        })
                                    } catch (t) {
                                        return e5(t, X) ? (v = t.code, d = t.originalMessage) : (v = W.FORMATTING_ERROR, d = t.message), h(e, v, d, y)
                                    }
                                }

                                function y(e, t, r, n) {
                                    var o = p(e, t, r, n);
                                    return "string" != typeof o ? h(e, W.INVALID_MESSAGE, void 0) : o
                                }
                                return y.rich = p, y.markup = function(e, t, r, n) {
                                    return p(e, t, r, n)
                                }, y.raw = function(e) {
                                    if (f) return s(u), i({
                                        error: u,
                                        key: e,
                                        namespace: l
                                    });
                                    try {
                                        return e9(a, u, e, l)
                                    } catch (t) {
                                        return h(e, W.MISSING_MESSAGE, t.message)
                                    }
                                }, y.has = function(e) {
                                    if (f) return !1;
                                    try {
                                        return e9(a, u, e, l), !0
                                    } catch (e) {
                                        return !1
                                    }
                                }, y
                            }(e6(e3({}, e), {
                                messagesOrError: t
                            }))
                    }, [i, u, l, h, p, c, a, s, f]));
                    return (0, x.useMemo)(function() {
                        return Object.assign(function(e, t) {
                            return y(tc(e), t)
                        }, {
                            rich: function(e, t) {
                                return y.rich(tc(e), t)
                            },
                            has: function(e) {
                                return y.has(tc(e))
                            },
                            dynamic: function(t, r) {
                                var n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "",
                                    o = tc(t),
                                    i = y.has(o);
                                return i || rt("TranslationKeyNotFound", e, o), i ? y(o, r) : n
                            },
                            html: function(t, r, n) {
                                var o = tc(t);
                                if (!y.has(o)) return rt("TranslationKeyNotFound", e, o), null;
                                var i = tw(function(e) {
                                    return y(o, e)
                                }, r, n);
                                return null == i && rt("TranslationMalformed", e, o), i
                            }
                        })
                    }, [y, e])
                },
                rn = function() {
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
                ro = function(e) {
                    var t = e.className;
                    return N().createElement("div", {
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-state-layer",
                        className: rn("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", t)
                    })
                },
                ri = function(e) {
                    var t = e.width,
                        r = e.height;
                    return N().createElement("svg", {
                        className: "foundation-web-loading-spinner",
                        width: t,
                        height: r,
                        viewBox: "0 0 20 20",
                        fill: "none",
                        xmlns: "http://www.w3.org/2000/svg"
                    }, N().createElement("path", {
                        fillRule: "evenodd",
                        clipRule: "evenodd",
                        fill: "currentColor",
                        d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
                    }))
                };

            function ra(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ru(e) {
                if (Array.isArray(e)) return e
            }

            function rl() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function rs(e, t) {
                if (e) {
                    if ("string" == typeof e) return ra(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return ra(e, t)
                }
            }
            var rc = {
                    XSmall: "size-[var(--icon-size-xsmall)]",
                    Small: "size-[var(--icon-size-small)]",
                    Medium: "size-[var(--icon-size-medium)]",
                    Large: "size-[var(--icon-size-large)]",
                    XLarge: "size-[var(--icon-size-xlarge)]",
                    XXLarge: "size-[var(--icon-size-xxlarge)]"
                },
                rf = N().forwardRef(function(e, t) {
                    var r, n = ru(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || rs(r) || rl(),
                        o = n[0],
                        i = n.slice(1),
                        a = o.name,
                        u = o.size,
                        l = o.className,
                        s = (o.children, function(e, t) {
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
                        c = (ru(i) || function(e) {
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
                        }(i) || rs(i, 1) || rl())[0];
                    return N().createElement("span", function(e) {
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
                        ref: c,
                        "aria-hidden": !0,
                        "data-testid": "foundation-web-icon",
                        className: rn("grow-0 shrink-0 basis-auto icon", a, rc[void 0 === u ? "Medium" : u], l)
                    }, s))
                });

            function rh(e, t) {
                if ("function" == typeof e) return e(t);
                null != e && (e.current = t)
            }

            function rp(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function ry(e) {
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

            function rb(e, t) {
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

            function rv(e, t) {
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

            function rd(e) {
                return function(e) {
                    if (Array.isArray(e)) return rp(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return rp(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return rp(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function rm(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }
            rf.displayName = "Icon";
            var rg = Symbol.for("react.lazy"),
                rw = x[" use ".trim().toString()];

            function rO(e) {
                var t;
                return null != e && (void 0 === e ? "undefined" : rm(e)) === "object" && "$$typeof" in e && e.$$typeof === rg && "_payload" in e && (void 0 === (t = e._payload) ? "undefined" : rm(t)) === "object" && null !== t && "then" in t
            }
            var rE = ((e = x.forwardRef(function(e, t) {
                    var r = e.children,
                        n = rv(e, ["children"]);
                    if (rO(r) && "function" == typeof rw && (r = rw(r._payload)), x.isValidElement(r)) {
                        var o, i, a, u, l, s = (l = (u = null == (i = Object.getOwnPropertyDescriptor((o = r).props, "ref")) ? void 0 : i.get) && "isReactWarning" in u && u.isReactWarning) ? o.ref : (l = (u = null == (a = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : a.get) && "isReactWarning" in u && u.isReactWarning) ? o.props.ref : o.props.ref || o.ref,
                            c = function(e, t) {
                                var r = ry({}, t);
                                for (var n in t) ! function(n) {
                                    var o = e[n],
                                        i = t[n];
                                    /^on[A-Z]/.test(n) ? o && i ? r[n] = function() {
                                        for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                                        var n = i.apply(void 0, rd(t));
                                        return o.apply(void 0, rd(t)), n
                                    } : o && (r[n] = o) : "style" === n ? r[n] = ry({}, o, i) : "className" === n && (r[n] = [o, i].filter(Boolean).join(" "))
                                }(n);
                                return ry({}, e, r)
                            }(n, r.props);
                        return r.type !== x.Fragment && (c.ref = t ? function() {
                            for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r];
                            return function(e) {
                                var r = !1,
                                    n = t.map(function(t) {
                                        var n = rh(t, e);
                                        return r || "function" != typeof n || (r = !0), n
                                    });
                                if (r) return function() {
                                    for (var e = 0; e < n.length; e++) {
                                        var r = n[e];
                                        "function" == typeof r ? r() : rh(t[e], null)
                                    }
                                }
                            }
                        }(t, s) : s), x.cloneElement(r, c)
                    }
                    return x.Children.count(r) > 1 ? x.Children.only(null) : null
                })).displayName = "".concat("Slot", ".SlotClone"), v = e, (d = x.forwardRef(function(e, t) {
                    var r = e.children,
                        n = rv(e, ["children"]);
                    rO(r) && "function" == typeof rw && (r = rw(r._payload));
                    var o = x.Children.toArray(r),
                        i = o.find(rP);
                    if (i) {
                        var a = i.props.children,
                            u = o.map(function(e) {
                                return e !== i ? e : x.Children.count(a) > 1 ? x.Children.only(null) : x.isValidElement(a) ? a.props.children : null
                            });
                        return (0, B.jsx)(v, rb(ry({}, n), {
                            ref: t,
                            children: x.isValidElement(a) ? x.cloneElement(a, void 0, u) : null
                        }))
                    }
                    return (0, B.jsx)(v, rb(ry({}, n), {
                        ref: t,
                        children: r
                    }))
                })).displayName = "".concat("Slot", ".Slot"), d),
                rS = Symbol("radix.slottable");

            function rP(e) {
                return x.isValidElement(e) && "function" == typeof e.type && "__radixId" in e.type && e.type.__radixId === rS
            }

            function rA(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rj(e) {
                if (Array.isArray(e)) return e
            }

            function rB() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function r_(e) {
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

            function rT(e, t) {
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

            function rI(e, t) {
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

            function rk(e, t) {
                if (e) {
                    if ("string" == typeof e) return rA(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rA(e, t)
                }
            }
            var rH = {
                    Large: 24,
                    Medium: 20,
                    Small: 16,
                    XSmall: 12
                },
                rx = {
                    Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
                    Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
                    Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
                    XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
                },
                rN = {
                    Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-alert", "content-action-alert"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                rR = {
                    Emphasis: ["bg-action-standard", "content-action-standard"],
                    Standard: ["bg-action-standard", "content-action-standard"],
                    SoftEmphasis: ["bg-action-standard", "content-action-standard"],
                    Utility: ["bg-action-subtle", "content-action-standard"],
                    Link: ["bg-action-link", "content-system-emphasis"],
                    Alert: ["bg-action-standard", "content-action-standard"],
                    ActionUtility: ["bg-action-subtle", "content-action-standard"]
                },
                rC = (0, x.forwardRef)(function(e, t) {
                    var r, n = rj(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || rk(r) || rB(),
                        o = n[0],
                        i = n.slice(1),
                        a = o.children,
                        u = o.className,
                        l = o.style,
                        s = o.isDisabled,
                        c = void 0 !== s && s,
                        f = o.isLoading,
                        h = void 0 !== f && f,
                        p = o.icon,
                        y = o.size,
                        b = void 0 === y ? "Large" : y,
                        v = o.variant,
                        d = void 0 === v ? "Emphasis" : v,
                        m = o.asChild,
                        g = rI(o, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]),
                        w = (rj(i) || function(e) {
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
                        }(i) || rk(i, 1) || rB())[0],
                        O = rn("foundation-web-button", c ? "opacity-[0.5]" : ["relative clip group/interactable focus-visible:outline-focus disabled:outline-none", "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", rx[b], c ? rR[d] : rN[d], u),
                        E = r_({
                            textDecoration: "none"
                        }, l),
                        S = function(e) {
                            return N().createElement(N().Fragment, null, N().createElement(ro, null), h && N().createElement("div", {
                                "aria-hidden": "true",
                                className: "absolute flex"
                            }, N().createElement(ri, {
                                width: rH[b],
                                height: rH[b]
                            })), N().createElement("span", {
                                className: rn("flex items-center min-width-0", "Large" === b || "Medium" === b ? "gap-small" : "gap-xsmall", h && "invisible")
                            }, p && N().createElement(rf, {
                                name: p,
                                size: b
                            }), N().createElement("span", {
                                className: "padding-y-xsmall text-truncate-end text-no-wrap"
                            }, e)))
                        };
                    if (m) {
                        g.as;
                        var P = rI(g, ["as"]),
                            A = N().Children.only(a);
                        return N().createElement(rE, rT(r_({
                            ref: w
                        }, P), {
                            className: O,
                            style: E,
                            "aria-disabled": c || void 0
                        }), N().cloneElement(A, {}, S(A.props.children)))
                    }
                    if ("a" === g.as) {
                        g.as;
                        var j = g.href,
                            B = rI(g, ["as", "href"]);
                        return N().createElement("a", rT(r_({
                            ref: w
                        }, B), {
                            "aria-disabled": c,
                            href: c ? void 0 : j,
                            className: O,
                            style: E
                        }), S(a))
                    }
                    g.as;
                    var _ = rI(g, ["as"]);
                    return N().createElement("button", rT(r_({
                        ref: w,
                        type: "button"
                    }, _), {
                        disabled: c,
                        className: O,
                        style: E
                    }), S(a))
                });

            function rM(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function rL(e) {
                if (Array.isArray(e)) return e
            }

            function rD() {
                throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
            }

            function rU(e) {
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

            function rF(e, t) {
                if (e) {
                    if ("string" == typeof e) return rM(e, t);
                    var r = Object.prototype.toString.call(e).slice(8, -1);
                    if ("Object" === r && e.constructor && (r = e.constructor.name), "Map" === r || "Set" === r) return Array.from(r);
                    if ("Arguments" === r || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r)) return rM(e, t)
                }
            }
            var rz = ["[&::after]:[content:'']", "[&::after]:absolute", "[&::after]:inset-[0]", "[&::after]:[background:linear-gradient(90deg,var(--color-extended-white-0)_0%,var(--color-extended-white-20)_50%,var(--color-extended-white-0)_100%)]", "[&::after]:[animation:foundation-web-skeleton-shimmer_1.5s_linear_infinite]", "motion-reduce:[&::after]:[content:none]"],
                rG = (0, x.forwardRef)(function(e, t) {
                    var r, n, o, i = rL(r = [e, t]) || function(e) {
                            if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                        }(r) || rF(r) || rD(),
                        a = i[0],
                        u = i.slice(1),
                        l = a.className,
                        s = a.style,
                        c = a.variant,
                        f = void 0 === c ? "Rectangle" : c,
                        h = a.isAnimated,
                        p = a.width,
                        y = a.height,
                        b = function(e, t) {
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
                        }(a, ["className", "style", "variant", "isAnimated", "width", "height"]),
                        v = (rL(u) || function(e) {
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
                        }(u) || rF(u, 1) || rD())[0],
                        d = "Text" === f,
                        m = "Circle" === f,
                        g = {};
                    return d ? (g.height = null != y ? y : "1em", g.width = null != p ? p : "100%") : (void 0 !== p && (g.width = p), void 0 !== y && (g.height = y)), N().createElement("div", (n = rU({
                        ref: v,
                        "aria-hidden": "true",
                        "data-variant": f
                    }, b), o = o = {
                        className: rn("relative clip block bg-[var(--color-common-shimmer)]", d && "radius-xsmall", m && "radius-circle", !d && !m && "radius-small", (void 0 === h || h) && rz, l),
                        style: rU({}, g, s)
                    }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(o)) : (function(e) {
                        var t = Object.keys(e);
                        if (Object.getOwnPropertySymbols) {
                            var r = Object.getOwnPropertySymbols(e);
                            t.push.apply(t, r)
                        }
                        return t
                    })(Object(o)).forEach(function(e) {
                        Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(o, e))
                    }), n))
                });

            function rV(e, t, r) {
                return t = r$(t),
                    function(e, t) {
                        var r;
                        if (t && ("object" == ((r = t) && "u" > typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r) || "function" == typeof t)) return t;
                        if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                        return e
                    }(e, rq() ? Reflect.construct(t, r || [], r$(e).constructor) : t.apply(e, r))
            }

            function rZ(e, t) {
                if (!(e instanceof t)) throw TypeError("Cannot call a class as a function")
            }

            function rK(e, t, r) {
                return (rK = rq() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && rW(o, r.prototype), o
                }).apply(null, arguments)
            }

            function r$(e) {
                return (r$ = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function rX(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Super expression must either be null or a function");
                e.prototype = Object.create(t && t.prototype, {
                    constructor: {
                        value: e,
                        writable: !0,
                        configurable: !0
                    }
                }), t && rW(e, t)
            }

            function rW(e, t) {
                return (rW = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function rY(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (rY = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return rK(e, arguments, r$(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), rW(r, e)
                })(e)
            }

            function rq() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (rq = function() {
                    return !!e
                })()
            }

            function rJ(e, t, r) {
                function n(r, n) {
                    var o, i;
                    for (var u in Object.defineProperty(r, "_zod", {
                            value: null != (o = r._zod) ? o : {},
                            enumerable: !1
                        }), null != (i = r._zod).traits || (i.traits = new Set), r._zod.traits.add(e), t(r, n), a.prototype) u in r || Object.defineProperty(r, u, {
                        value: a.prototype[u].bind(r)
                    });
                    r._zod.constr = a, r._zod.def = n
                }
                var o, i = function(e) {
                    function t() {
                        return rZ(this, t), rV(this, t, arguments)
                    }
                    return rX(t, e), t
                }(null != (o = null == r ? void 0 : r.Parent) ? o : Object);

                function a(e) {
                    var t = (null == r ? void 0 : r.Parent) ? new i : this;
                    n(t, e), null != (s = t._zod).deferred || (s.deferred = []);
                    var o = !0,
                        a = !1,
                        u = void 0;
                    try {
                        for (var l, s, c, f = t._zod.deferred[Symbol.iterator](); !(o = (c = f.next()).done); o = !0)(0, c.value)()
                    } catch (e) {
                        a = !0, u = e
                    } finally {
                        try {
                            o || null == f.return || f.return()
                        } finally {
                            if (a) throw u
                        }
                    }
                    return t
                }
                return Object.defineProperty(i, "name", {
                    value: e
                }), Object.defineProperty(a, "init", {
                    value: n
                }), Object.defineProperty(a, Symbol.hasInstance, {
                    value: function(t) {
                        var n, o, i;
                        return null != r && !!r.Parent && (null != (i = r.Parent) && "u" > typeof Symbol && i[Symbol.hasInstance] ? !!i[Symbol.hasInstance](t) : t instanceof i) || (null == t || null == (o = t._zod) || null == (n = o.traits) ? void 0 : n.has(e))
                    }
                }), Object.defineProperty(a, "name", {
                    value: e
                }), a
            }
            rG.displayName = "Skeleton", Object.freeze({
                status: "aborted"
            }), Symbol("zod_brand");
            var rQ = function(e) {
                function t() {
                    return rZ(this, t), rV(this, t, ["Encountered Promise during synchronous parse. Use .parseAsync() instead."])
                }
                return rX(t, e), t
            }(rY(Error));
            rY(Error);
            var r0 = {};

            function r1(e) {
                return e && Object.assign(r0, e), r0
            }

            function r2(e) {
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

            function r5(e, t) {
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

            function r3(e) {
                return e && "u" > typeof Symbol && e.constructor === Symbol ? "symbol" : typeof e
            }

            function r6(e, t) {
                return (void 0 === t ? "undefined" : r3(t)) === "bigint" ? t.toString() : t
            }

            function r8(e) {
                return {
                    get value() {
                        var t = e();
                        return Object.defineProperty(this, "value", {
                            value: t
                        }), t
                    }
                }
            }

            function r4(e) {
                var t = +!!e.startsWith("^"),
                    r = e.endsWith("$") ? e.length - 1 : e.length;
                return e.slice(t, r)
            }
            var r7 = Symbol("evaluating");

            function r9(e, t, r) {
                var n = void 0;
                Object.defineProperty(e, t, {
                    get: function() {
                        if (n !== r7) return void 0 === n && (n = r7, n = r()), n
                    },
                    set: function(r) {
                        Object.defineProperty(e, t, {
                            value: r
                        })
                    },
                    configurable: !0
                })
            }
            var ne = "captureStackTrace" in Error ? Error.captureStackTrace : function() {
                for (var e = arguments.length, t = Array(e), r = 0; r < e; r++) t[r] = arguments[r]
            };

            function nt(e) {
                return e.replace(/[.*+?^${}()|[\]\\]/g, "\\$&")
            }

            function nr(e) {
                if (!e) return {};
                if ("string" == typeof e) return {
                    error: function() {
                        return e
                    }
                };
                if ((null == e ? void 0 : e.message) !== void 0) {
                    if ((null == e ? void 0 : e.error) !== void 0) throw Error("Cannot specify both `message` and `error` params");
                    e.error = e.message
                }
                return (delete e.message, "string" == typeof e.error) ? r5(r2({}, e), {
                    error: function() {
                        return e.error
                    }
                }) : e
            }

            function nn(e) {
                var t, r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0;
                if (!0 === e.aborted) return !0;
                for (var n = r; n < e.issues.length; n++)
                    if ((null == (t = e.issues[n]) ? void 0 : t.continue) !== !0) return !0;
                return !1
            }

            function no(e, t) {
                return t.map(function(t) {
                    return null != t.path || (t.path = []), t.path.unshift(e), t
                })
            }

            function ni(e) {
                return "string" == typeof e ? e : null == e ? void 0 : e.message
            }

            function na(e, t, r) {
                var n, o, i, a, u, l, s, c, f, h, p, y = r5(r2({}, e), {
                    path: null != (n = e.path) ? n : []
                });
                return e.message || (y.message = null != (o = null != (i = null != (a = null != (u = ni(null == (c = e.inst) || null == (s = c._zod.def) || null == (l = s.error) ? void 0 : l.call(s, e))) ? u : ni(null == t || null == (f = t.error) ? void 0 : f.call(t, e))) ? a : ni(null == (h = r.customError) ? void 0 : h.call(r, e))) ? i : ni(null == (p = r.localeError) ? void 0 : p.call(r, e))) ? o : "Invalid input"), delete y.inst, delete y.continue, (null == t ? void 0 : t.reportInput) || delete y.input, y
            }
            r8(function() {
                var e, t;
                if ("u" > typeof navigator && (null == (t = navigator) || null == (e = t.userAgent) ? void 0 : e.includes("Cloudflare"))) return !1;
                try {
                    return Function(""), !0
                } catch (e) {
                    return !1
                }
            });
            var nu = function(e, t) {
                    e.name = "$ZodError", Object.defineProperty(e, "_zod", {
                        value: e._zod,
                        enumerable: !1
                    }), Object.defineProperty(e, "issues", {
                        value: t,
                        enumerable: !1
                    }), e.message = JSON.stringify(t, r6, 2), Object.defineProperty(e, "toString", {
                        value: function() {
                            return e.message
                        },
                        enumerable: !1
                    })
                },
                nl = rJ("$ZodError", nu),
                ns = rJ("$ZodError", nu, {
                    Parent: Error
                });

            function nc(e, t, r, n, o, i, a) {
                try {
                    var u = e[i](a),
                        l = u.value
                } catch (e) {
                    r(e);
                    return
                }
                u.done ? t(l) : Promise.resolve(l).then(n, o)
            }

            function nf(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var i = e.apply(t, r);

                        function a(e) {
                            nc(i, n, o, a, u, "next", e)
                        }

                        function u(e) {
                            nc(i, n, o, a, u, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function nh(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function np(e, t) {
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
                    u = Object.defineProperty;
                return u(a, "next", {
                    value: l(0)
                }), u(a, "throw", {
                    value: l(1)
                }), u(a, "return", {
                    value: l(2)
                }), "function" == typeof Symbol && u(a, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), a;

                function l(u) {
                    return function(l) {
                        var s = [u, l];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, s[0] && (i = 0)), i;) try {
                            if (r = 1, n && (o = 2 & s[0] ? n.return : s[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, s[1])).done) return o;
                            switch (n = 0, o && (s = [2 & s[0], o.value]), s[0]) {
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
                                    i.label++, n = s[1], s = [0];
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
                            s = [6, e], n = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            var ny = (t = ns, function(e, r, n, o) {
                    var i = n ? Object.assign(n, {
                            async: !1
                        }) : {
                            async: !1
                        },
                        a = e._zod.run({
                            value: r,
                            issues: []
                        }, i);
                    if (nh(a, Promise)) throw new rQ;
                    if (a.issues.length) {
                        var u, l = new(null != (u = null == o ? void 0 : o.Err) ? u : t)(a.issues.map(function(e) {
                            return na(e, i, r1())
                        }));
                        throw ne(l, null == o ? void 0 : o.callee), l
                    }
                    return a.value
                }),
                nb = (n = ns, function(e, t, r, o) {
                    return nf(function() {
                        var i, a, u, l;
                        return np(this, function(s) {
                            switch (s.label) {
                                case 0:
                                    if (i = r ? Object.assign(r, {
                                            async: !0
                                        }) : {
                                            async: !0
                                        }, !nh(a = e._zod.run({
                                            value: t,
                                            issues: []
                                        }, i), Promise)) return [3, 2];
                                    return [4, a];
                                case 1:
                                    a = s.sent(), s.label = 2;
                                case 2:
                                    if (a.issues.length) throw ne(l = new(null != (u = null == o ? void 0 : o.Err) ? u : n)(a.issues.map(function(e) {
                                        return na(e, i, r1())
                                    })), null == o ? void 0 : o.callee), l;
                                    return [2, a.value]
                            }
                        })
                    })()
                }),
                nv = (o = ns, function(e, t, r) {
                    var n, i, a = r ? (n = function(e) {
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
                        }({}, r), i = i = {
                            async: !1
                        }, Object.getOwnPropertyDescriptors ? Object.defineProperties(n, Object.getOwnPropertyDescriptors(i)) : (function(e) {
                            var t = Object.keys(e);
                            if (Object.getOwnPropertySymbols) {
                                var r = Object.getOwnPropertySymbols(e);
                                t.push.apply(t, r)
                            }
                            return t
                        })(Object(i)).forEach(function(e) {
                            Object.defineProperty(n, e, Object.getOwnPropertyDescriptor(i, e))
                        }), n) : {
                            async: !1
                        },
                        u = e._zod.run({
                            value: t,
                            issues: []
                        }, a);
                    if (nh(u, Promise)) throw new rQ;
                    return u.issues.length ? {
                        success: !1,
                        error: new(null != o ? o : nl)(u.issues.map(function(e) {
                            return na(e, a, r1())
                        }))
                    } : {
                        success: !0,
                        data: u.value
                    }
                }),
                nd = (i = ns, function(e, t, r) {
                    return nf(function() {
                        var n, o;
                        return np(this, function(a) {
                            switch (a.label) {
                                case 0:
                                    if (n = r ? Object.assign(r, {
                                            async: !0
                                        }) : {
                                            async: !0
                                        }, !nh(o = e._zod.run({
                                            value: t,
                                            issues: []
                                        }, n), Promise)) return [3, 2];
                                    return [4, o];
                                case 1:
                                    o = a.sent(), a.label = 2;
                                case 2:
                                    return [2, o.issues.length ? {
                                        success: !1,
                                        error: new i(o.issues.map(function(e) {
                                            return na(e, n, r1())
                                        }))
                                    } : {
                                        success: !0,
                                        data: o.value
                                    }]
                            }
                        })
                    })()
                });
            RegExp('^[^\\s@"]{1,64}@[^\\s@]{1,255}$', "u");
            var nm = function(e) {
                    var t, r, n = e ? "[\\s\\S]{".concat(null != (t = null == e ? void 0 : e.minimum) ? t : 0, ",").concat(null != (r = null == e ? void 0 : e.maximum) ? r : "", "}") : "[\\s\\S]*";
                    return new RegExp("^".concat(n, "$"))
                },
                ng = {
                    major: 4,
                    minor: 1,
                    patch: 11
                };

            function nw(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nO(e, t, r, n, o, i, a) {
                try {
                    var u = e[i](a),
                        l = u.value
                } catch (e) {
                    r(e);
                    return
                }
                u.done ? t(l) : Promise.resolve(l).then(n, o)
            }

            function nE(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function nS(e) {
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

            function nP(e, t) {
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

            function nA(e) {
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
            var nj = rJ("$ZodType", function(e, t) {
                    null != e || (e = {}), e._zod.def = t, e._zod.bag = e._zod.bag || {}, e._zod.version = ng;
                    var r, n = nA(null != (u = e._zod.def.checks) ? u : []);
                    e._zod.traits.has("$ZodCheck") && n.unshift(e);
                    var o = !0,
                        i = !1,
                        a = void 0;
                    try {
                        for (var u, l, s, c = n[Symbol.iterator](); !(o = (s = c.next()).done); o = !0) {
                            var f = s.value,
                                h = !0,
                                p = !1,
                                y = void 0;
                            try {
                                for (var b, v = f._zod.onattach[Symbol.iterator](); !(h = (b = v.next()).done); h = !0)(0, b.value)(e)
                            } catch (e) {
                                p = !0, y = e
                            } finally {
                                try {
                                    h || null == v.return || v.return()
                                } finally {
                                    if (p) throw y
                                }
                            }
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
                    if (0 === n.length) null != (l = e._zod).deferred || (l.deferred = []), null == (r = e._zod.deferred) || r.push(function() {
                        e._zod.run = e._zod.parse
                    });
                    else {
                        var d = function(e, t, r) {
                                var n = nn(e),
                                    o = !0,
                                    i = !1,
                                    a = void 0;
                                try {
                                    for (var u, l, s = t[Symbol.iterator](); !(o = (l = s.next()).done); o = !0) ! function() {
                                        var t = l.value;
                                        if (t._zod.def.when) {
                                            if (!t._zod.def.when(e)) return
                                        } else if (n) return;
                                        var o = e.issues.length,
                                            i = t._zod.check(e);
                                        if (nE(i, Promise) && (null == r ? void 0 : r.async) === !1) throw new rQ;
                                        if (u || nE(i, Promise)) u = (null != u ? u : Promise.resolve()).then(function() {
                                            var t;
                                            return (t = function() {
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
                                                        u = Object.defineProperty;
                                                    return u(a, "next", {
                                                        value: l(0)
                                                    }), u(a, "throw", {
                                                        value: l(1)
                                                    }), u(a, "return", {
                                                        value: l(2)
                                                    }), "function" == typeof Symbol && u(a, Symbol.iterator, {
                                                        value: function() {
                                                            return this
                                                        }
                                                    }), a;

                                                    function l(u) {
                                                        return function(l) {
                                                            var s = [u, l];
                                                            if (r) throw TypeError("Generator is already executing.");
                                                            for (; a && (a = 0, s[0] && (i = 0)), i;) try {
                                                                if (r = 1, n && (o = 2 & s[0] ? n.return : s[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, s[1])).done) return o;
                                                                switch (n = 0, o && (s = [2 & s[0], o.value]), s[0]) {
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
                                                                        i.label++, n = s[1], s = [0];
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
                                                                s = [6, e], n = 0
                                                            } finally {
                                                                r = o = 0
                                                            }
                                                            if (5 & s[0]) throw s[1];
                                                            return {
                                                                value: s[0] ? s[1] : void 0,
                                                                done: !0
                                                            }
                                                        }
                                                    }
                                                }(this, function(t) {
                                                    switch (t.label) {
                                                        case 0:
                                                            return [4, i];
                                                        case 1:
                                                            if (t.sent(), e.issues.length === o) return [2];
                                                            return n || (n = nn(e, o)), [2]
                                                    }
                                                })
                                            }, function() {
                                                var e = this,
                                                    r = arguments;
                                                return new Promise(function(n, o) {
                                                    var i = t.apply(e, r);

                                                    function a(e) {
                                                        nO(i, n, o, a, u, "next", e)
                                                    }

                                                    function u(e) {
                                                        nO(i, n, o, a, u, "throw", e)
                                                    }
                                                    a(void 0)
                                                })
                                            })()
                                        });
                                        else {
                                            if (e.issues.length === o) return;
                                            n || (n = nn(e, o))
                                        }
                                    }()
                                } catch (e) {
                                    i = !0, a = e
                                } finally {
                                    try {
                                        o || null == s.return || s.return()
                                    } finally {
                                        if (i) throw a
                                    }
                                }
                                return u ? u.then(function() {
                                    return e
                                }) : e
                            },
                            m = function(t, r, o) {
                                if (nn(t)) return t.aborted = !0, t;
                                var i = d(r, n, o);
                                if (nE(i, Promise)) {
                                    if (!1 === o.async) throw new rQ;
                                    return i.then(function(t) {
                                        return e._zod.parse(t, o)
                                    })
                                }
                                return e._zod.parse(i, o)
                            };
                        e._zod.run = function(t, r) {
                            if (r.skipChecks) return e._zod.parse(t, r);
                            if ("backward" === r.direction) {
                                var o = e._zod.parse({
                                    value: t.value,
                                    issues: []
                                }, nP(nS({}, r), {
                                    skipChecks: !0
                                }));
                                return nE(o, Promise) ? o.then(function(e) {
                                    return m(e, t, r)
                                }) : m(o, t, r)
                            }
                            var i = e._zod.parse(t, r);
                            if (nE(i, Promise)) {
                                if (!1 === r.async) throw new rQ;
                                return i.then(function(e) {
                                    return d(e, n, r)
                                })
                            }
                            return d(i, n, r)
                        }
                    }
                    e["~standard"] = {
                        validate: function(t) {
                            try {
                                var r, n = nv(e, t);
                                return n.success ? {
                                    value: n.data
                                } : {
                                    issues: null == (r = n.error) ? void 0 : r.issues
                                }
                            } catch (r) {
                                return nd(e, t).then(function(e) {
                                    var t;
                                    return e.success ? {
                                        value: e.data
                                    } : {
                                        issues: null == (t = e.error) ? void 0 : t.issues
                                    }
                                })
                            }
                        },
                        vendor: "zod",
                        version: 1
                    }
                }),
                nB = rJ("$ZodString", function(e, t) {
                    var r, n, o;
                    nj.init(e, t), e._zod.pattern = null != (r = nA(null != (n = null == e || null == (o = e._zod.bag) ? void 0 : o.patterns) ? n : []).pop()) ? r : nm(e._zod.bag), e._zod.parse = function(r, n) {
                        if (t.coerce) try {
                            r.value = String(r.value)
                        } catch (e) {}
                        return "string" == typeof r.value || r.issues.push({
                            expected: "string",
                            code: "invalid_type",
                            input: r.value,
                            inst: e
                        }), r
                    }
                });

            function n_(e, t, r) {
                if (e.issues.length) {
                    var n;
                    (n = t.issues).push.apply(n, nA(no(r, e.issues)))
                }
                t.value[r] = e.value
            }
            var nT = rJ("$ZodArray", function(e, t) {
                nj.init(e, t), e._zod.parse = function(r, n) {
                    var o = function(e) {
                            var o = i[e],
                                u = t.element._zod.run({
                                    value: o,
                                    issues: []
                                }, n);
                            nE(u, Promise) ? a.push(u.then(function(t) {
                                return n_(t, r, e)
                            })) : n_(u, r, e)
                        },
                        i = r.value;
                    if (!Array.isArray(i)) return r.issues.push({
                        expected: "array",
                        code: "invalid_type",
                        input: i,
                        inst: e
                    }), r;
                    r.value = Array(i.length);
                    for (var a = [], u = 0; u < i.length; u++) o(u);
                    return a.length ? Promise.all(a).then(function() {
                        return r
                    }) : r
                }
            });

            function nI(e, t, r, n) {
                if (e.issues.length) {
                    var o;
                    (o = t.issues).push.apply(o, nA(no(r, e.issues)))
                }
                void 0 === e.value ? r in n && (t.value[r] = void 0) : t.value[r] = e.value
            }
            var nk = rJ("$ZodObject", function(e, t) {
                    nj.init(e, t);
                    var r, n = Object.getOwnPropertyDescriptor(t, "shape");
                    if (!(null == n ? void 0 : n.get)) {
                        var o = t.shape;
                        Object.defineProperty(t, "shape", {
                            get: function() {
                                var e = nS({}, o);
                                return Object.defineProperty(t, "shape", {
                                    value: e
                                }), e
                            }
                        })
                    }
                    var i = r8(function() {
                        return function(e) {
                            var t, r = Object.keys(e.shape),
                                n = !0,
                                o = !1,
                                i = void 0;
                            try {
                                for (var a, u = r[Symbol.iterator](); !(n = (a = u.next()).done); n = !0) {
                                    var l, s, c, f, h = a.value;
                                    if (!(null == (f = e.shape) || null == (c = f[h]) || null == (s = c._zod) || null == (l = s.traits) ? void 0 : l.has("$ZodType"))) throw Error('Invalid element at key "'.concat(h, '": expected a Zod schema'))
                                }
                            } catch (e) {
                                o = !0, i = e
                            } finally {
                                try {
                                    n || null == u.return || u.return()
                                } finally {
                                    if (o) throw i
                                }
                            }
                            var p = Object.keys(t = e.shape).filter(function(e) {
                                return "optional" === t[e]._zod.optin && "optional" === t[e]._zod.optout
                            });
                            return nP(nS({}, e), {
                                keys: r,
                                keySet: new Set(r),
                                numKeys: r.length,
                                optionalKeys: new Set(p)
                            })
                        }(t)
                    });
                    r9(e._zod, "propValues", function() {
                        var e = t.shape,
                            r = {};
                        for (var n in e) {
                            var o = e[n]._zod;
                            if (o.values) {
                                null != r[n] || (r[n] = new Set);
                                var i = !0,
                                    a = !1,
                                    u = void 0;
                                try {
                                    for (var l, s, c = o.values[Symbol.iterator](); !(i = (s = c.next()).done); i = !0) {
                                        var f = s.value;
                                        r[n].add(f)
                                    }
                                } catch (e) {
                                    a = !0, u = e
                                } finally {
                                    try {
                                        i || null == c.return || c.return()
                                    } finally {
                                        if (a) throw u
                                    }
                                }
                            }
                        }
                        return r
                    });
                    var a = t.catchall;
                    e._zod.parse = function(t, n) {
                        null != r || (r = i.value);
                        var o = t.value;
                        if (!((void 0 === (h = o) ? "undefined" : r3(h)) === "object" && null !== h && !Array.isArray(h))) return t.issues.push({
                            expected: "object",
                            code: "invalid_type",
                            input: o,
                            inst: e
                        }), t;
                        t.value = {};
                        var u = [],
                            l = r.shape,
                            s = !0,
                            c = !1,
                            f = void 0;
                        try {
                            for (var h, p, y = r.keys[Symbol.iterator](); !(s = (p = y.next()).done); s = !0) ! function() {
                                var e = p.value,
                                    r = l[e]._zod.run({
                                        value: o[e],
                                        issues: []
                                    }, n);
                                nE(r, Promise) ? u.push(r.then(function(r) {
                                    return nI(r, t, e, o)
                                })) : nI(r, t, e, o)
                            }()
                        } catch (e) {
                            c = !0, f = e
                        } finally {
                            try {
                                s || null == y.return || y.return()
                            } finally {
                                if (c) throw f
                            }
                        }
                        return a ? function(e, t, r, n, o, i) {
                            var a = [],
                                u = o.keySet,
                                l = o.catchall._zod,
                                s = l.def.type,
                                c = !0,
                                f = !1,
                                h = void 0;
                            try {
                                for (var p, y = Object.keys(t)[Symbol.iterator](); !(c = (p = y.next()).done); c = !0) ! function() {
                                    var o = p.value;
                                    if (!u.has(o)) {
                                        if ("never" === s) return a.push(o);
                                        var i = l.run({
                                            value: t[o],
                                            issues: []
                                        }, n);
                                        nE(i, Promise) ? e.push(i.then(function(e) {
                                            return nI(e, r, o, t)
                                        })) : nI(i, r, o, t)
                                    }
                                }()
                            } catch (e) {
                                f = !0, h = e
                            } finally {
                                try {
                                    c || null == y.return || y.return()
                                } finally {
                                    if (f) throw h
                                }
                            }
                            return (a.length && r.issues.push({
                                code: "unrecognized_keys",
                                keys: a,
                                input: t,
                                inst: i
                            }), e.length) ? Promise.all(e).then(function() {
                                return r
                            }) : r
                        }(u, o, t, n, i.value, e) : u.length ? Promise.all(u).then(function() {
                            return t
                        }) : t
                    }
                }),
                nH = rJ("$ZodLiteral", function(e, t) {
                    if (nj.init(e, t), 0 === t.values.length) throw Error("Cannot create literal schema with no valid values");
                    e._zod.values = new Set(t.values), e._zod.pattern = new RegExp("^(".concat(t.values.map(function(e) {
                        return "string" == typeof e ? nt(e) : e ? nt(e.toString()) : String(e)
                    }).join("|"), ")$")), e._zod.parse = function(r, n) {
                        var o = r.value;
                        return e._zod.values.has(o) || r.issues.push({
                            code: "invalid_value",
                            values: t.values,
                            input: o,
                            inst: e
                        }), r
                    }
                });

            function nx(e, t) {
                return e.issues.length && void 0 === t ? {
                    issues: [],
                    value: void 0
                } : e
            }
            var nN = rJ("$ZodOptional", function(e, t) {
                    nj.init(e, t), e._zod.optin = "optional", e._zod.optout = "optional", r9(e._zod, "values", function() {
                        return t.innerType._zod.values ? new Set(nA(t.innerType._zod.values).concat([void 0])) : void 0
                    }), r9(e._zod, "pattern", function() {
                        var e = t.innerType._zod.pattern;
                        return e ? new RegExp("^(".concat(r4(e.source), ")?$")) : void 0
                    }), e._zod.parse = function(e, r) {
                        if ("optional" === t.innerType._zod.optin) {
                            var n = t.innerType._zod.run(e, r);
                            return nE(n, Promise) ? n.then(function(t) {
                                return nx(t, e.value)
                            }) : nx(n, e.value)
                        }
                        return void 0 === e.value ? e : t.innerType._zod.run(e, r)
                    }
                }),
                nR = rJ("$ZodNullable", function(e, t) {
                    nj.init(e, t), r9(e._zod, "optin", function() {
                        return t.innerType._zod.optin
                    }), r9(e._zod, "optout", function() {
                        return t.innerType._zod.optout
                    }), r9(e._zod, "pattern", function() {
                        var e = t.innerType._zod.pattern;
                        return e ? new RegExp("^(".concat(r4(e.source), "|null)$")) : void 0
                    }), r9(e._zod, "values", function() {
                        return t.innerType._zod.values ? new Set(nA(t.innerType._zod.values).concat([null])) : void 0
                    }), e._zod.parse = function(e, r) {
                        return null === e.value ? e : t.innerType._zod.run(e, r)
                    }
                });

            function nC(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function nM(e, t, r, n, o, i, a) {
                try {
                    var u = e[i](a),
                        l = u.value
                } catch (e) {
                    r(e);
                    return
                }
                u.done ? t(l) : Promise.resolve(l).then(n, o)
            }

            function nL(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var i = e.apply(t, r);

                        function a(e) {
                            nM(i, n, o, a, u, "next", e)
                        }

                        function u(e) {
                            nM(i, n, o, a, u, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function nD(e) {
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

            function nU(e) {
                return function(e) {
                    if (Array.isArray(e)) return nC(e)
                }(e) || function(e) {
                    if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                }(e) || function(e) {
                    if (e) {
                        if ("string" == typeof e) return nC(e, void 0);
                        var t = Object.prototype.toString.call(e).slice(8, -1);
                        if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                        if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return nC(e, void 0)
                    }
                }(e) || function() {
                    throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                }()
            }

            function nF(e, t) {
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
                    u = Object.defineProperty;
                return u(a, "next", {
                    value: l(0)
                }), u(a, "throw", {
                    value: l(1)
                }), u(a, "return", {
                    value: l(2)
                }), "function" == typeof Symbol && u(a, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), a;

                function l(u) {
                    return function(l) {
                        var s = [u, l];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, s[0] && (i = 0)), i;) try {
                            if (r = 1, n && (o = 2 & s[0] ? n.return : s[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, s[1])).done) return o;
                            switch (n = 0, o && (s = [2 & s[0], o.value]), s[0]) {
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
                                    i.label++, n = s[1], s = [0];
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
                            s = [6, e], n = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            Symbol("ZodOutput"), Symbol("ZodInput");
            var nz = rJ("ZodMiniType", function(e, t) {
                    if (!e._zod) throw Error("Uninitialized schema in ZodMiniType.");
                    nj.init(e, t), e.def = t, e.type = t.type, e.parse = function(t, r) {
                        return ny(e, t, r, {
                            callee: e.parse
                        })
                    }, e.safeParse = function(t, r) {
                        return nv(e, t, r)
                    }, e.parseAsync = function(t, r) {
                        return nL(function() {
                            return nF(this, function(n) {
                                return [2, nb(e, t, r, {
                                    callee: e.parseAsync
                                })]
                            })
                        })()
                    }, e.safeParseAsync = function(t, r) {
                        return nL(function() {
                            return nF(this, function(n) {
                                return [2, nd(e, t, r)]
                            })
                        })()
                    }, e.check = function() {
                        for (var r, n, o, i = arguments.length, a = Array(i), u = 0; u < i; u++) a[u] = arguments[u];
                        return e.clone((r = nD({}, t), n = n = {
                            checks: nU(null != (o = t.checks) ? o : []).concat(nU(a.map(function(e) {
                                return "function" == typeof e ? {
                                    _zod: {
                                        check: e,
                                        def: {
                                            check: "custom"
                                        },
                                        onattach: []
                                    }
                                } : e
                            })))
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
                    }, e.clone = function(t, r) {
                        var n;
                        return n = new e._zod.constr(null != t ? t : e._zod.def), (!t || (null == r ? void 0 : r.parent)) && (n._zod.parent = e), n
                    }, e.brand = function() {
                        return e
                    }, e.register = function(t, r) {
                        return t.add(e, r), e
                    }
                }),
                nG = rJ("ZodMiniString", function(e, t) {
                    nB.init(e, t), nz.init(e, t)
                });

            function nV(e) {
                return new nG(function(e) {
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
                    type: "string"
                }, nr(e)))
            }
            var nZ = rJ("ZodMiniArray", function(e, t) {
                    nT.init(e, t), nz.init(e, t)
                }),
                nK = rJ("ZodMiniObject", function(e, t) {
                    nk.init(e, t), nz.init(e, t), r9(e, "shape", function() {
                        return t.shape
                    })
                });

            function n$(e, t) {
                return new nK(nD({
                    type: "object",
                    shape: null != e ? e : {}
                }, nr(t)))
            }
            var nX = rJ("ZodMiniLiteral", function(e, t) {
                    nH.init(e, t), nz.init(e, t)
                }),
                nW = rJ("ZodMiniOptional", function(e, t) {
                    nN.init(e, t), nz.init(e, t)
                }),
                nY = rJ("ZodMiniNullable", function(e, t) {
                    nR.init(e, t), nz.init(e, t)
                }),
                nq = window.Roblox["core-lib"].http.index,
                nJ = function() {
                    var e, t;
                    return {
                        promise: new Promise(function(r, n) {
                            e = r, t = n
                        }),
                        resolve: e,
                        reject: t
                    }
                },
                nQ = window.Roblox["core-lib"].url.index;

            function n0(e, t, r, n, o, i, a) {
                try {
                    var u = e[i](a),
                        l = u.value
                } catch (e) {
                    r(e);
                    return
                }
                u.done ? t(l) : Promise.resolve(l).then(n, o)
            }
            var n1 = "150x150",
                n2 = "webp",
                n5 = nQ.Url.parse(tj().thumbnailsApi).getOrThrow(),
                n3 = function(e) {
                    var t, r, n, o;
                    return "".concat(e.type, ":").concat(e.targetId, ":").concat(null != (t = e.size) ? t : n1, ":").concat(null != (r = e.format) ? r : n2, ":").concat(null != (n = e.version) ? n : "", ":").concat(null != (o = e.headShape) ? o : "", ":").concat(e.includeBackground ? "bg" : "", ":").concat(e.includeProfileFrame ? "frame" : "")
                },
                n6 = n$({
                    data: (g = n$({
                        requestId: nV(),
                        state: new nX(nD({
                            type: "literal",
                            values: Array.isArray(m = ["Completed", "Pending", "Blocked", "Error", "InReview"]) ? m : [m]
                        }, nr(void 0))),
                        imageUrl: new nW({
                            type: "optional",
                            innerType: new nY({
                                type: "nullable",
                                innerType: nV()
                            })
                        })
                    }), new nZ(nD({
                        type: "array",
                        element: g
                    }, nr(void 0))))
                }),
                n8 = function(e) {
                    var t = new Map;
                    return e.data.forEach(function(e) {
                        var r = e.requestId,
                            n = e.state,
                            o = e.imageUrl;
                        "Completed" === n ? t.set(r, null != o ? {
                            state: n,
                            imageUrl: o
                        } : {
                            state: "Error"
                        }) : t.set(r, {
                            state: n
                        })
                    }), t
                },
                n4 = (w = {
                    delay: 50,
                    maxSize: 100
                }, O = function(e) {
                    var t;
                    return (t = function() {
                        var t, r;
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
                                u = Object.defineProperty;
                            return u(a, "next", {
                                value: l(0)
                            }), u(a, "throw", {
                                value: l(1)
                            }), u(a, "return", {
                                value: l(2)
                            }), "function" == typeof Symbol && u(a, Symbol.iterator, {
                                value: function() {
                                    return this
                                }
                            }), a;

                            function l(u) {
                                return function(l) {
                                    var s = [u, l];
                                    if (r) throw TypeError("Generator is already executing.");
                                    for (; a && (a = 0, s[0] && (i = 0)), i;) try {
                                        if (r = 1, n && (o = 2 & s[0] ? n.return : s[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, s[1])).done) return o;
                                        switch (n = 0, o && (s = [2 & s[0], o.value]), s[0]) {
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
                                                i.label++, n = s[1], s = [0];
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
                                        s = [6, e], n = 0
                                    } finally {
                                        r = o = 0
                                    }
                                    if (5 & s[0]) throw s[1];
                                    return {
                                        value: s[0] ? s[1] : void 0,
                                        done: !0
                                    }
                                }
                            }
                        }(this, function(n) {
                            switch (n.label) {
                                case 0:
                                    return t = n5.withPath("/v1/batch"), r = e.map(function(e) {
                                        var t, r;
                                        return function(e) {
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
                                            requestId: n3(e),
                                            type: e.type,
                                            targetId: e.targetId,
                                            size: null != (t = e.size) ? t : n1,
                                            format: null != (r = e.format) ? r : n2
                                        }, null != e.version ? {
                                            version: e.version
                                        } : {}, e.headShape ? {
                                            headShape: e.headShape
                                        } : {}, e.includeBackground ? {
                                            includeBackground: !0
                                        } : {}, e.includeProfileFrame && "AvatarHeadShot" === e.type ? {
                                            includeProfileFrame: !0
                                        } : {})
                                    }), [4, nq.post(t, r, n6, {
                                        credentials: "include",
                                        headers: {
                                            Accept: "application/json"
                                        },
                                        retry: nq.defaultBrowserRetryDelay
                                    })];
                                case 1:
                                    return [2, n8(n.sent().getOrThrow())]
                            }
                        })
                    }, function() {
                        var e = this,
                            r = arguments;
                        return new Promise(function(n, o) {
                            var i = t.apply(e, r);

                            function a(e) {
                                n0(i, n, o, a, u, "next", e)
                            }

                            function u(e) {
                                n0(i, n, o, a, u, "throw", e)
                            }
                            a(void 0)
                        })
                    })()
                }, E = function(e, t) {
                    var r;
                    return null != (r = e.get(n3(t))) ? r : {
                        state: "Error"
                    }
                }, a = w, u = O, s = a.delay, c = a.maxSize, f = [], h = nJ(), p = function() {
                    var e = h.resolve,
                        t = h.reject,
                        r = f;
                    f = [], h = nJ(), u(r).then(e).catch(t)
                }, S = function(e) {
                    0 === f.length && (l = setTimeout(p, s)), f.push(e);
                    var t = h.promise;
                    return null != c && f.length >= c && (clearTimeout(l), p()), t
                }, function(e) {
                    return S(e).then(function(t) {
                        return E(t, e)
                    })
                }),
                n7 = function(e) {
                    var t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 10,
                        r = Number.parseInt(e, t);
                    return Number.isNaN(r) ? null : r
                };

            function n9(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }

            function oe(e, t, r, n, o, i, a) {
                try {
                    var u = e[i](a),
                        l = u.value
                } catch (e) {
                    r(e);
                    return
                }
                u.done ? t(l) : Promise.resolve(l).then(n, o)
            }

            function ot(e) {
                return function() {
                    var t = this,
                        r = arguments;
                    return new Promise(function(n, o) {
                        var i = e.apply(t, r);

                        function a(e) {
                            oe(i, n, o, a, u, "next", e)
                        }

                        function u(e) {
                            oe(i, n, o, a, u, "throw", e)
                        }
                        a(void 0)
                    })
                }
            }

            function or(e, t) {
                if (!(e instanceof t)) throw TypeError("Cannot call a class as a function")
            }

            function on(e, t) {
                for (var r = 0; r < t.length; r++) {
                    var n = t[r];
                    n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                }
            }

            function oo(e, t, r) {
                return t && on(e.prototype, t), r && on(e, r), e
            }

            function oi(e, t, r) {
                return t in e ? Object.defineProperty(e, t, {
                    value: r,
                    enumerable: !0,
                    configurable: !0,
                    writable: !0
                }) : e[t] = r, e
            }

            function oa(e, t) {
                return null != t && "u" > typeof Symbol && t[Symbol.hasInstance] ? !!t[Symbol.hasInstance](e) : e instanceof t
            }

            function ou(e, t) {
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
                    u = Object.defineProperty;
                return u(a, "next", {
                    value: l(0)
                }), u(a, "throw", {
                    value: l(1)
                }), u(a, "return", {
                    value: l(2)
                }), "function" == typeof Symbol && u(a, Symbol.iterator, {
                    value: function() {
                        return this
                    }
                }), a;

                function l(u) {
                    return function(l) {
                        var s = [u, l];
                        if (r) throw TypeError("Generator is already executing.");
                        for (; a && (a = 0, s[0] && (i = 0)), i;) try {
                            if (r = 1, n && (o = 2 & s[0] ? n.return : s[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, s[1])).done) return o;
                            switch (n = 0, o && (s = [2 & s[0], o.value]), s[0]) {
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
                                    i.label++, n = s[1], s = [0];
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
                            s = [6, e], n = 0
                        } finally {
                            r = o = 0
                        }
                        if (5 & s[0]) throw s[1];
                        return {
                            value: s[0] ? s[1] : void 0,
                            done: !0
                        }
                    }
                }
            }
            r(848);
            var ol = function() {
                    function e(t) {
                        or(this, e), oi(this, "value", void 0), this.value = t
                    }
                    return oo(e, [{
                        key: "cast",
                        value: function() {
                            return this
                        }
                    }, {
                        key: "isOk",
                        value: function() {
                            return !0
                        }
                    }, {
                        key: "isErr",
                        value: function() {
                            return !1
                        }
                    }, {
                        key: "map",
                        value: function(t) {
                            return new e(t(this.value))
                        }
                    }, {
                        key: "mapErr",
                        value: function(e) {
                            return this.cast()
                        }
                    }, {
                        key: "andThen",
                        value: function(e) {
                            return e(this.value)
                        }
                    }, {
                        key: "andThenAsync",
                        value: function(e) {
                            return e(this.value)
                        }
                    }, {
                        key: "orElse",
                        value: function(e) {
                            return this.cast()
                        }
                    }, {
                        key: "orElseAsync",
                        value: function(e) {
                            return oc.fromResult(this.cast())
                        }
                    }, {
                        key: "inspect",
                        value: function(e) {
                            return e(this.value), this
                        }
                    }, {
                        key: "inspectErr",
                        value: function(e) {
                            return this
                        }
                    }, {
                        key: "match",
                        value: function(e, t) {
                            return e(this.value)
                        }
                    }, {
                        key: "getOrDefault",
                        value: function(e) {
                            return this.value
                        }
                    }, {
                        key: "getOrNull",
                        value: function() {
                            return this.value
                        }
                    }, {
                        key: "getOrElse",
                        value: function(e) {
                            return this.value
                        }
                    }, {
                        key: "getOrThrow",
                        value: function() {
                            return this.value
                        }
                    }, {
                        key: "getErrOrNull",
                        value: function() {
                            return null
                        }
                    }]), e
                }(),
                os = function() {
                    function e(t) {
                        or(this, e), oi(this, "error", void 0), this.error = t
                    }
                    return oo(e, [{
                        key: "cast",
                        value: function() {
                            return this
                        }
                    }, {
                        key: "isOk",
                        value: function() {
                            return !1
                        }
                    }, {
                        key: "isErr",
                        value: function() {
                            return !0
                        }
                    }, {
                        key: "map",
                        value: function(e) {
                            return this.cast()
                        }
                    }, {
                        key: "mapErr",
                        value: function(t) {
                            return new e(t(this.error))
                        }
                    }, {
                        key: "andThen",
                        value: function(e) {
                            return this.cast()
                        }
                    }, {
                        key: "andThenAsync",
                        value: function(e) {
                            return oc.fromResult(this.cast())
                        }
                    }, {
                        key: "orElse",
                        value: function(e) {
                            return e(this.error)
                        }
                    }, {
                        key: "orElseAsync",
                        value: function(e) {
                            return e(this.error)
                        }
                    }, {
                        key: "inspect",
                        value: function(e) {
                            return this
                        }
                    }, {
                        key: "inspectErr",
                        value: function(e) {
                            return e(this.error), this
                        }
                    }, {
                        key: "match",
                        value: function(e, t) {
                            return t(this.error)
                        }
                    }, {
                        key: "getOrDefault",
                        value: function(e) {
                            return e
                        }
                    }, {
                        key: "getOrNull",
                        value: function() {
                            return null
                        }
                    }, {
                        key: "getOrElse",
                        value: function(e) {
                            return e()
                        }
                    }, {
                        key: "getOrThrow",
                        value: function() {
                            throw this.error
                        }
                    }, {
                        key: "getErrOrNull",
                        value: function() {
                            return this.error
                        }
                    }]), e
                }();
            (j || (j = {})).all = function(e) {
                var t = e.findIndex(function(e) {
                    return e.isErr()
                });
                return -1 === t ? new ol(e.map(function(e) {
                    return e.getOrNull()
                })) : e[t]
            };
            var oc = function() {
                function e(t) {
                    or(this, e), oi(this, "promise", void 0), this.promise = t
                }
                return oo(e, [{
                    key: "map",
                    value: function(t) {
                        return new e(this.promise.then(function(e) {
                            return ot(function() {
                                var r, n;
                                return ou(this, function(o) {
                                    switch (o.label) {
                                        case 0:
                                            if (!e.isOk()) return [3, 2];
                                            return n = ol.bind, [4, t(e.value)];
                                        case 1:
                                            return r = new(n.apply(ol, [void 0, o.sent()])), [3, 3];
                                        case 2:
                                            r = e.cast(), o.label = 3;
                                        case 3:
                                            return [2, r]
                                    }
                                })
                            })()
                        }))
                    }
                }, {
                    key: "mapErr",
                    value: function(t) {
                        return new e(this.promise.then(function(e) {
                            return ot(function() {
                                var r, n;
                                return ou(this, function(o) {
                                    switch (o.label) {
                                        case 0:
                                            if (!e.isErr()) return [3, 2];
                                            return n = os.bind, [4, t(e.error)];
                                        case 1:
                                            return r = new(n.apply(os, [void 0, o.sent()])), [3, 3];
                                        case 2:
                                            r = e.cast(), o.label = 3;
                                        case 3:
                                            return [2, r]
                                    }
                                })
                            })()
                        }))
                    }
                }, {
                    key: "andThen",
                    value: function(t) {
                        return new e(this.promise.then(function(r) {
                            if (r.isErr()) return r.cast();
                            var n = t(r.value);
                            return oa(n, e) ? n.promise : n
                        }))
                    }
                }, {
                    key: "orElse",
                    value: function(t) {
                        return new e(this.promise.then(function(r) {
                            if (r.isOk()) return r.cast();
                            var n = t(r.error);
                            return oa(n, e) ? n.promise : n
                        }))
                    }
                }, {
                    key: "then",
                    value: function(e, t) {
                        return this.promise.then(e, t)
                    }
                }, {
                    key: "inspect",
                    value: function(t) {
                        return new e(this.promise.then(function(e) {
                            return e.isOk() && t(e.value), e
                        }))
                    }
                }, {
                    key: "inspectErr",
                    value: function(t) {
                        return new e(this.promise.then(function(e) {
                            return e.isErr() && t(e.error), e
                        }))
                    }
                }, {
                    key: "match",
                    value: function(e, t) {
                        return this.promise.then(function(r) {
                            return r.match(e, t)
                        })
                    }
                }, {
                    key: "getOrDefault",
                    value: function(e) {
                        return this.promise.then(function(t) {
                            return t.getOrDefault(e)
                        })
                    }
                }, {
                    key: "getOrNull",
                    value: function() {
                        return this.promise.then(function(e) {
                            return e.getOrNull()
                        })
                    }
                }, {
                    key: "getOrElse",
                    value: function(e) {
                        return this.promise.then(function(t) {
                            return t.getOrElse(e)
                        })
                    }
                }, {
                    key: "getOrThrow",
                    value: function() {
                        return this.promise.then(function(e) {
                            return e.getOrThrow()
                        })
                    }
                }, {
                    key: "getErrOrNull",
                    value: function() {
                        return this.promise.then(function(e) {
                            return e.getErrOrNull()
                        })
                    }
                }], [{
                    key: "fromResult",
                    value: function(t) {
                        return new e(Promise.resolve(t))
                    }
                }, {
                    key: "fromPromise",
                    value: function(t, r) {
                        return new e(t.then(function(e) {
                            return new ol(e)
                        }).catch(function(e) {
                            return new os(r(e))
                        }))
                    }
                }, {
                    key: "fromPromiseResult",
                    value: function(t) {
                        return new e(t)
                    }
                }, {
                    key: "fromExecutor",
                    value: function(t) {
                        return new e(new Promise(function(e) {
                            t(e)
                        }))
                    }
                }, {
                    key: "from",
                    value: function(t) {
                        return oa(t, e) ? t : oa(t, Promise) ? e.fromPromiseResult(t) : e.fromResult(t)
                    }
                }, {
                    key: "fn",
                    value: function(t) {
                        return function() {
                            for (var r = arguments.length, n = Array(r), o = 0; o < r; o++) n[o] = arguments[o];
                            return e.fromPromiseResult(t.apply(void 0, function(e) {
                                if (Array.isArray(e)) return n9(e)
                            }(n) || function(e) {
                                if ("u" > typeof Symbol && null != e[Symbol.iterator] || null != e["@@iterator"]) return Array.from(e)
                            }(n) || function(e) {
                                if (e) {
                                    if ("string" == typeof e) return n9(e, void 0);
                                    var t = Object.prototype.toString.call(e).slice(8, -1);
                                    if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                    if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return n9(e, void 0)
                                }
                            }(n) || function() {
                                throw TypeError("Invalid attempt to spread non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                            }()))
                        }
                    }
                }, {
                    key: "all",
                    value: function(t) {
                        return new e(Promise.all(t).then(j.all))
                    }
                }]), e
            }();

            function of(e, t, r) {
                return (of = ob() ? Reflect.construct : function(e, t, r) {
                    var n = [null];
                    n.push.apply(n, t);
                    var o = new(Function.bind.apply(e, n));
                    return r && op(o, r.prototype), o
                }).apply(null, arguments)
            }

            function oh(e) {
                return (oh = Object.setPrototypeOf ? Object.getPrototypeOf : function(e) {
                    return e.__proto__ || Object.getPrototypeOf(e)
                })(e)
            }

            function op(e, t) {
                return (op = Object.setPrototypeOf || function(e, t) {
                    return e.__proto__ = t, e
                })(e, t)
            }

            function oy(e) {
                var t = "function" == typeof Map ? new Map : void 0;
                return (oy = function(e) {
                    if (null === e || -1 === Function.toString.call(e).indexOf("[native code]")) return e;
                    if ("function" != typeof e) throw TypeError("Super expression must either be null or a function");
                    if (void 0 !== t) {
                        if (t.has(e)) return t.get(e);
                        t.set(e, r)
                    }

                    function r() {
                        return of(e, arguments, oh(this).constructor)
                    }
                    return r.prototype = Object.create(e.prototype, {
                        constructor: {
                            value: r,
                            enumerable: !1,
                            writable: !0,
                            configurable: !0
                        }
                    }), op(r, e)
                })(e)
            }

            function ob() {
                try {
                    var e = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function() {}))
                } catch (e) {}
                return (ob = function() {
                    return !!e
                })()
            }
            oy(Error);
            var ov = function(e) {
                    if ("function" != typeof e && null !== e) throw TypeError("Super expression must either be null or a function");

                    function t(e) {
                        var r, n, o, i, a;
                        if (!(this instanceof t)) throw TypeError("Cannot call a class as a function");
                        return n = t, o = [e.message, {
                            cause: e
                        }], n = oh(n), r = function(e, t) {
                            var r;
                            if (t && ("object" == ((r = t) && "u" > typeof Symbol && r.constructor === Symbol ? "symbol" : typeof r) || "function" == typeof t)) return t;
                            if (void 0 === e) throw ReferenceError("this hasn't been initialised - super() hasn't been called");
                            return e
                        }(this, ob() ? Reflect.construct(n, o || [], oh(this).constructor) : n.apply(this, o)), a = void 0, (i = "cause") in r ? Object.defineProperty(r, i, {
                            value: a,
                            enumerable: !0,
                            configurable: !0,
                            writable: !0
                        }) : r[i] = a, r.cause = e, r
                    }
                    return t.prototype = Object.create(e && e.prototype, {
                        constructor: {
                            value: t,
                            writable: !0,
                            configurable: !0
                        }
                    }), e && op(t, e), t
                }(oy(Error)),
                od = function(e, t) {
                    try {
                        var r;
                        return r = JSON.stringify(e, void 0, t), new ol(r)
                    } catch (e) {
                        return new os(new ov(e))
                    }
                };

            function om(e, t) {
                (null == t || t > e.length) && (t = e.length);
                for (var r = 0, n = Array(t); r < t; r++) n[r] = e[r];
                return n
            }
            var og = nQ.Url.parse("".concat(tj().beaconApi, "/v1/measurements")).getOrThrow(),
                ow = function() {
                    if ("u" < typeof document) return {
                        batchSize: 100,
                        waitMs: 1e3
                    };
                    var e, t, r, n, o, i, a = document.getElementsByName("performance")[0],
                        u = n7(null != (t = null == a ? void 0 : a.getAttribute("data-ui-performance-metrics-batch-size")) ? t : ""),
                        l = function(e) {
                            if (Array.isArray(e)) return e
                        }(e = (null != (r = null == a ? void 0 : a.getAttribute("data-ui-performance-metrics-batch-wait-time")) ? r : "").split(":")) || function(e) {
                            var t, r, n = null == e ? null : "u" > typeof Symbol && e[Symbol.iterator] || e["@@iterator"];
                            if (null != n) {
                                var o = [],
                                    i = !0,
                                    a = !1;
                                try {
                                    for (n = n.call(e); !(i = (t = n.next()).done) && (o.push(t.value), 3 !== o.length); i = !0);
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
                                if ("string" == typeof e) return om(e, 3);
                                var t = Object.prototype.toString.call(e).slice(8, -1);
                                if ("Object" === t && e.constructor && (t = e.constructor.name), "Map" === t || "Set" === t) return Array.from(t);
                                if ("Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t)) return om(e, 3)
                            }
                        }(e) || function() {
                            throw TypeError("Invalid attempt to destructure non-iterable instance.\\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")
                        }(),
                        s = l[0],
                        c = l[1],
                        f = l[2],
                        h = ((null != (n = n7(null != s ? s : "")) ? n : 0) * 3600 + (null != (o = n7(null != c ? c : "")) ? o : 0) * 60 + (null != (i = n7(null != f ? f : "")) ? i : 0)) * 1e3;
                    return {
                        batchSize: null != u ? u : 100,
                        waitMs: 0 === h ? 1e3 : h
                    }
                },
                oO = [],
                oE = !1,
                oS = function() {
                    if (oE = !1, 0 !== oO.length) {
                        var e = oO;
                        oO = [], nq.postUntyped(og, e, {
                            credentials: "include",
                            keepalive: !0,
                            signal: AbortSignal.timeout(3e3)
                        })
                    }
                },
                oP = function(e, t) {
                    var r = od(t);
                    oO.push({
                        metricName: e,
                        jsonData: r.isOk() ? r.value : "{}"
                    });
                    var n = ow(),
                        o = n.batchSize,
                        i = n.waitMs;
                    oO.length >= o ? oS() : oE || (oE = !0, setTimeout(oS, i))
                };

            function oA(e, t, r, n, o, i, a) {
                try {
                    var u = e[i](a),
                        l = u.value
                } catch (e) {
                    r(e);
                    return
                }
                u.done ? t(l) : Promise.resolve(l).then(n, o)
            }
            var oj = Error("thumbnail pending"),
                oB = function(e) {
                    var t = e.targetId,
                        r = e.type,
                        n = e.size,
                        o = e.format,
                        i = e.version,
                        a = e.headShape,
                        u = e.includeBackground,
                        l = e.includeProfileFrame,
                        s = e.altName,
                        c = e.imgClassName,
                        f = e.containerClassName,
                        h = (0, x.useRef)(Date.now()),
                        p = (0, x.useRef)(0),
                        y = (0, x.useRef)(!1),
                        b = (0, _.useQuery)({
                            queryKey: ["thumbnail-2d", r, t, n, o, i, a, u, l],
                            staleTime: 1 / 0,
                            retry: function(e, t) {
                                return t === oj && e < 5
                            },
                            queryFn: function() {
                                var e;
                                return (e = function() {
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
                                            u = Object.defineProperty;
                                        return u(a, "next", {
                                            value: l(0)
                                        }), u(a, "throw", {
                                            value: l(1)
                                        }), u(a, "return", {
                                            value: l(2)
                                        }), "function" == typeof Symbol && u(a, Symbol.iterator, {
                                            value: function() {
                                                return this
                                            }
                                        }), a;

                                        function l(u) {
                                            return function(l) {
                                                var s = [u, l];
                                                if (r) throw TypeError("Generator is already executing.");
                                                for (; a && (a = 0, s[0] && (i = 0)), i;) try {
                                                    if (r = 1, n && (o = 2 & s[0] ? n.return : s[0] ? n.throw || ((o = n.return) && o.call(n), 0) : n.next) && !(o = o.call(n, s[1])).done) return o;
                                                    switch (n = 0, o && (s = [2 & s[0], o.value]), s[0]) {
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
                                                            i.label++, n = s[1], s = [0];
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
                                                    s = [6, e], n = 0
                                                } finally {
                                                    r = o = 0
                                                }
                                                if (5 & s[0]) throw s[1];
                                                return {
                                                    value: s[0] ? s[1] : void 0,
                                                    done: !0
                                                }
                                            }
                                        }
                                    }(this, function(s) {
                                        switch (s.label) {
                                            case 0:
                                                return [4, n4({
                                                    type: r,
                                                    targetId: t,
                                                    size: n,
                                                    format: o,
                                                    version: i,
                                                    headShape: a,
                                                    includeBackground: u,
                                                    includeProfileFrame: l
                                                })];
                                            case 1:
                                                if ("Pending" === (e = s.sent()).state) throw p.current += 1, oj;
                                                return [2, e]
                                        }
                                    })
                                }, function() {
                                    var t = this,
                                        r = arguments;
                                    return new Promise(function(n, o) {
                                        var i = e.apply(t, r);

                                        function a(e) {
                                            oA(i, n, o, a, u, "next", e)
                                        }

                                        function u(e) {
                                            oA(i, n, o, a, u, "throw", e)
                                        }
                                        a(void 0)
                                    })
                                })()
                            }
                        }),
                        v = b.data,
                        d = b.isError,
                        m = b.error,
                        g = b.isPending,
                        w = b.isLoading;
                    (0, x.useEffect)(function() {
                        h.current = Date.now(), p.current = 0, y.current = !1
                    }, [r, t, n, o, i, a, u, l]), (0, x.useEffect)(function() {
                        if (!y.current) {
                            var e = "".concat(r, "_2d");
                            if (v) {
                                if (y.current = !0, oP("ThumbnailStatusCountWebapp", {
                                        Status: v.state,
                                        ThumbnailType: e
                                    }), "Completed" === v.state) {
                                    var t = p.current;
                                    oP("ThumbnailLoadDurationWebapp", {
                                        Status: "Success",
                                        ThumbnailType: e,
                                        Value: String(Date.now() - h.current)
                                    }), oP(0 === t ? "ThumbnailNoRetrySuccessWebapp" : "ThumbnailRetryWebapp", 0 === t ? {
                                        ThumbnailType: e
                                    } : {
                                        ThumbnailType: e,
                                        Value: String(t)
                                    })
                                }
                            } else d && m === oj && (y.current = !0, oP("ThumbnailTimeoutWebapp", {
                                ThumbnailType: e
                            }))
                        }
                    }, [v, d, m, r]);
                    var O = (null == v ? void 0 : v.state) === "Completed" ? v.imageUrl : null,
                        E = ["thumbnail-2d-container float-left overflow-hidden", void 0 === f ? "" : f, (null == v ? void 0 : v.state) === "Blocked" ? "icon-blocked" : (null == v ? void 0 : v.state) === "InReview" ? "icon-in-review" : (null == v ? void 0 : v.state) === "Error" ? "icon-broken" : d ? m === oj ? "icon-pending" : "icon-broken" : ""].filter(Boolean).join(" ");
                    return (0, B.jsxs)("span", {
                        className: E,
                        children: [(null != g ? g : w) && (0, B.jsx)(rG, {
                            variant: "Rectangle",
                            width: "100%",
                            height: "100%"
                        }), null != O && (0, B.jsx)("img", {
                            className: ["size-full", void 0 === c ? "" : c].filter(Boolean).join(" "),
                            src: O,
                            alt: void 0 === s ? "" : s
                        })]
                    })
                },
                o_ = function() {
                    var e, t, r = (arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {}).operatingSystem,
                        n = (0, k.getDeviceMeta)(),
                        o = "u" < typeof navigator ? "" : navigator.userAgent,
                        i = null != r ? "iOS" === r : null != (e = null == n ? void 0 : n.isIosDevice) ? e : /iPad|iPhone|iPod/.test(o),
                        a = null != r ? "Android" === r : null != (t = null == n ? void 0 : n.isAndroidDevice) ? t : o.includes("Android"),
                        u = i ? tj().iosAppStoreLink : a ? tj().googlePlayStoreLink : tj().appProtocolUrl,
                        l = tj().appProtocolUrl,
                        s = (0, x.useCallback)(function() {
                            setTimeout(function() {
                                document.hasFocus() && (window.location.href = u)
                            }, 500)
                        }, [u]);
                    return (0, x.useMemo)(function() {
                        return {
                            protocolUrl: l,
                            storeFallbackUrl: u,
                            launchApp: s
                        }
                    }, [s, l, u])
                },
                oT = function() {
                    var e, t, r = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                        n = rr("Feature.Avatar"),
                        o = o_(r),
                        i = o.protocolUrl,
                        a = o.launchApp,
                        u = (0, tv.userId)(),
                        l = null != (t = (0, tv.name)()) ? t : "";
                    return (0, B.jsxs)("div", {
                        className: "height-[calc(100vh-40px)] width-full flex flex-col landscape:flex-row",
                        style: {
                            backgroundImage: "url(".concat("string" == typeof(e = "https://images.rbxcdn.com/6cf9b4254babdbf7.svg") ? e : e.src, ")"),
                            backgroundSize: "cover"
                        },
                        children: [(0, B.jsx)("div", {
                            className: "height-[50%] width-full min-height-0 flex items-center justify-center landscape:height-full landscape:width-[50%]",
                            children: null != u && (0, B.jsx)("div", {
                                id: "UserAvatar",
                                className: "height-[72%] max-height-[352px] flex items-center justify-center",
                                children: (0, B.jsx)(oB, {
                                    type: "Avatar",
                                    targetId: u,
                                    size: "352x352",
                                    format: "png",
                                    altName: l,
                                    containerClassName: "height-full bg-transparent",
                                    imgClassName: "height-full width-auto margin-x-auto"
                                })
                            })
                        }), (0, B.jsx)("div", {
                            className: "height-[50%] width-full min-height-0 flex items-stretch justify-center landscape:height-full landscape:width-[50%] landscape:padding-xxlarge",
                            children: (0, B.jsxs)("section", {
                                className: "height-full width-full bg-surface-200 flex flex-col items-center padding-top-[82px] text-align-x-center",
                                children: [(0, B.jsx)("h1", {
                                    className: "margin-none text-heading-large content-emphasis",
                                    children: n("Heading.AvatarPageTitle")
                                }), (0, B.jsx)("p", {
                                    className: "margin-none max-width-[300px] text-body-medium content-muted",
                                    children: n("Description.AvatarEditorUpsell")
                                }), (0, B.jsx)(rC, {
                                    as: "a",
                                    href: i,
                                    size: "Large",
                                    variant: "Standard",
                                    className: "margin-top-small min-width-[180px] stroke-standard stroke-emphasis bg-transparent",
                                    onClick: a,
                                    children: n("Action.OpenRobloxApp")
                                })]
                            })
                        })]
                    })
                },
                oI = JSON.parse('{"P":["Feature.Avatar"]}').P,
                ok = new _.QueryClient,
                oH = function() {
                    var e = (0, k.getDeviceMeta)();
                    return null != e && (e.isPhone || e.isTablet) && (e.isAndroidDevice || e.isIosDevice)
                };
            I()(function() {
                if (oH()) {
                    var e, t = null != (e = document.getElementById("upsell-container")) ? e : document.getElementById("avatar-web-app");
                    null != t && (t.classList.add("upsell-container", "rbx-is-upsell"), t.setAttribute("avatar-upsell-base", ""), document.body.classList.add("avatar-upsell"), (0, H.renderWithErrorBoundary)((0, B.jsx)(_.QueryClientProvider, {
                        client: ok,
                        children: (0, B.jsx)(tb, {
                            namespaces: oI,
                            children: (0, B.jsx)(oT, {})
                        })
                    }), t))
                }
            })
        }()
}(), window.Roblox && window.Roblox.BundleDetector && window.Roblox.BundleDetector.bundleDetected("AvatarUpsell");
//# sourceMappingURL=https://sourcemaps.rbxcdn.com/avatarUpsell-0056251bf14822b8.js.map